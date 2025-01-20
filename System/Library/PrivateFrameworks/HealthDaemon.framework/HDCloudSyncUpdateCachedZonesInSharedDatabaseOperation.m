@interface HDCloudSyncUpdateCachedZonesInSharedDatabaseOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)main;
@end

@implementation HDCloudSyncUpdateCachedZonesInSharedDatabaseOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 syncAvailability];

  if (([v5 shouldSyncSummarySharingPull] & 1) != 0
    || ([v5 shouldSyncSummarySharingPush] & 1) != 0)
  {
    v6 = [(HDCloudSyncUpdateCachedZonesOperation *)self taskGroup];
    [v6 beginTask];

    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [v7 repository];
    v9 = [v8 allCKContainers];
    v10 = [v9 allObjects];

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      uint64_t v13 = [v10 count];
      v14 = [v10 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v30 = self;
      __int16 v31 = 2048;
      uint64_t v32 = v13;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning zone fetches for shared databases in %ld containers: %{public}@", buf, 0x20u);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "sharedCloudDatabase", (void)v24);
          [(HDCloudSyncUpdateCachedZonesOperation *)self fetchChangesForContainer:v20 database:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    v22 = [(HDCloudSyncUpdateCachedZonesOperation *)self taskGroup];
    [v22 finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching records in shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

@end