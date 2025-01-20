@interface SGHistorySharedData
@end

@implementation SGHistorySharedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastMigrationAttempt, 0);
  objc_storeStrong((id *)&self->migrateFromStore, 0);
  objc_storeStrong((id *)&self->cachedSaltLegacyManatee, 0);
  objc_storeStrong((id *)&self->cachedSalt, 0);
  objc_storeStrong((id *)&self->observers, 0);
  objc_storeStrong((id *)&self->resetInfo, 0);
  objc_storeStrong((id *)&self->dontUpdate, 0);
  objc_storeStrong((id *)&self->storageDetailHashes, 0);
  objc_storeStrong((id *)&self->confirmedEventWithoutTimestampFieldHashes, 0);
  objc_storeStrong((id *)&self->confirmedEventFieldHashes, 0);
  objc_storeStrong((id *)&self->contactHashes, 0);
  objc_storeStrong((id *)&self->rejectedReminderHashes, 0);
  objc_storeStrong((id *)&self->confirmedReminderHashes, 0);
  objc_storeStrong((id *)&self->rejectedEventHashes, 0);
  objc_storeStrong((id *)&self->confirmedEventWithoutTimestampHashes, 0);
  objc_storeStrong((id *)&self->confirmedEventHashes, 0);
}

@end