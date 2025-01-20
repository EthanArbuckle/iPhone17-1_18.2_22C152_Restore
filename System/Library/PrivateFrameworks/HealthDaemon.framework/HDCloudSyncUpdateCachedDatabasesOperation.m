@interface HDCloudSyncUpdateCachedDatabasesOperation
+ (BOOL)shouldLogAtOperationStart;
- (void)main;
@end

@implementation HDCloudSyncUpdateCachedDatabasesOperation

- (void)main
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = [(HDCloudSyncOperation *)self configuration];
  v3 = [v2 repository];
  v4 = [v3 allCKContainers];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v21 = *(void *)v25;
    while (2)
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        v11 = [(HDCloudSyncOperation *)self configuration];
        v12 = [v11 cachedCloudState];
        v13 = [v10 containerIdentifier];
        v14 = [v10 privateCloudDatabase];
        uint64_t v15 = [v14 databaseScope];
        id v23 = v9;
        char v16 = [v12 addDatabaseWithContainerIdentifier:v13 databaseScope:v15 error:&v23];
        id v7 = v23;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            v19 = [v10 containerIdentifier];
            *(_DWORD *)buf = 138543874;
            v29 = self;
            __int16 v30 = 2114;
            v31 = v19;
            __int16 v32 = 2114;
            id v33 = v7;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cache with private database in container %{public}@, error: %{public}@", buf, 0x20u);
          }
          [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v7];

          goto LABEL_15;
        }
        ++v8;
        v9 = v7;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
LABEL_15:
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end