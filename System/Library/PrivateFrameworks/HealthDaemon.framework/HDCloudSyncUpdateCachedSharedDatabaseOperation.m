@interface HDCloudSyncUpdateCachedSharedDatabaseOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)main;
@end

@implementation HDCloudSyncUpdateCachedSharedDatabaseOperation

- (void)main
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [(HDCloudSyncOperation *)self configuration];
  v3 = [v2 repository];
  v4 = [v3 syncAvailability];

  if (([v4 shouldSyncSummarySharingPull] & 1) != 0
    || ([v4 shouldSyncSummarySharingPush] & 1) != 0)
  {
    v24 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v5 = [(HDCloudSyncOperation *)self configuration];
    v6 = [v5 repository];
    v7 = [v6 allCKContainers];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v26 = *(void *)v30;
      do
      {
        uint64_t v11 = 0;
        v12 = v10;
        do
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
          v14 = [(HDCloudSyncOperation *)self configuration];
          v15 = [v14 cachedCloudState];
          v16 = [v13 containerIdentifier];
          v17 = [v13 sharedCloudDatabase];
          uint64_t v18 = [v17 databaseScope];
          id v28 = v12;
          char v19 = [v15 addDatabaseWithContainerIdentifier:v16 databaseScope:v18 error:&v28];
          id v10 = v28;

          if ((v19 & 1) == 0)
          {
            _HKInitializeLogging();
            v20 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v21 = v20;
              v22 = [v13 containerIdentifier];
              *(_DWORD *)buf = 138543874;
              v34 = self;
              __int16 v35 = 2114;
              v36 = v22;
              __int16 v37 = 2114;
              id v38 = v10;
              _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cache with shared database in container %{public}@, error: %{public}@", buf, 0x20u);
            }
            [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
          }
          ++v11;
          v12 = v10;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }

    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    v4 = v24;
  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end