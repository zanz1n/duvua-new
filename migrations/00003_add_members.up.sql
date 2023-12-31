CREATE TABLE "members" (
    "id" SERIAL PRIMARY KEY,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "coins" INTEGER NOT NULL DEFAULT 0,
    "dj" BOOLEAN NOT NULL DEFAULT FALSE,
    "playAllowed" BOOLEAN NOT NULL DEFAULT FALSE,
    "guildId" BIGINT NOT NULL,
    "userId" BIGINT NOT NULL
);

CREATE INDEX "member_guildId_idx" ON "members"("guildId");
CREATE INDEX "member_userId_idx" ON "members"("userId");

ALTER TABLE "members"
ADD CONSTRAINT "member_guildId_fkey" FOREIGN KEY ("guildId") REFERENCES "guilds"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "members"
ADD CONSTRAINT "member_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
