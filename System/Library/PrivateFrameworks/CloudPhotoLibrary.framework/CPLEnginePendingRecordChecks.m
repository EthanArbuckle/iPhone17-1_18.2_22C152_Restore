@interface CPLEnginePendingRecordChecks
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3;
- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3;
- (unint64_t)scopeType;
@end

@implementation CPLEnginePendingRecordChecks

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasRecordsToCheckWithScopeIdentifier:v4];

  return v6;
}

- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 dequeueCloudScopedIdentifiersToCheck:v6 error:a4];

  return (char)a4;
}

- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 nextBatchOfRecordsToCheckWithScopeIdentifier:v4];

  return v6;
}

- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    if (__CPLStorageOSLogDomain_onceToken_13892 != -1) {
      dispatch_once(&__CPLStorageOSLogDomain_onceToken_13892, &__block_literal_global_13893);
    }
    v7 = __CPLStorageOSLogDomain_result_13894;
    if (os_log_type_enabled((os_log_t)__CPLStorageOSLogDomain_result_13894, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Will need to check these records in the cloud:\n%@", buf, 0xCu);
    }
  }
  v8 = [(CPLEngineStorage *)self platformObject];
  int v9 = [v8 enqueueCloudScopedIdentifiersToCheck:v6 error:a4];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v11 = [(CPLEngineStorage *)self engineStore];
    v12 = [v11 scopes];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "scopeIdentifier", (void)v22);
          if (([v10 containsObject:v18] & 1) == 0)
          {
            [v10 addObject:v18];
            v19 = [v12 scopeWithIdentifier:v18];
            if (v19 && ![v12 setScopeHasChangesToPullFromTransport:v19 error:a4])
            {

              BOOL v20 = 0;
              goto LABEL_21;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    BOOL v20 = 1;
LABEL_21:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)scopeType
{
  return 2;
}

@end