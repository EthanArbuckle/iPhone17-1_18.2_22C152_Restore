@interface HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation
- (void)main;
@end

@implementation HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation

- (void)main
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 syncAvailability];

  if (([v5 shouldSyncSummarySharingPull] & 1) != 0
    || ([v5 shouldSyncSummarySharingPush] & 1) != 0)
  {
    v6 = [(HDCloudSyncUpdateCachedRecordsOperation *)self taskGroup];
    [v6 beginTask];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [v7 repository];
    v9 = [v8 allCKContainers];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15 = [v14 sharedCloudDatabase];
          [(HDCloudSyncUpdateCachedRecordsOperation *)self fetchRecordZoneChangesForContainer:v14 database:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    v16 = [(HDCloudSyncUpdateCachedRecordsOperation *)self taskGroup];
    [v16 finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching records in shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

@end