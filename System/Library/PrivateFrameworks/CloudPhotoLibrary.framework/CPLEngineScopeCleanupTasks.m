@interface CPLEngineScopeCleanupTasks
+ (id)scopeTypeDescriptionForScopeType:(unint64_t)a3;
- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6;
- (BOOL)cleanupStepHasMore:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasCleanupTasks;
- (unint64_t)scopeType;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineScopeCleanupTasks

- (void).cxx_destruct
{
}

- (void)writeTransactionDidFail
{
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineScopeCleanupTasks;
  [(CPLEngineStorage *)&v4 writeTransactionDidFail];
  remainingStoragesToCleanup = self->_remainingStoragesToCleanup;
  self->_remainingStoragesToCleanup = 0;

  self->_currentCleanupScopeIndex = 0;
  self->_shouldRequestACleanupToScheduler = 0;
}

- (void)writeTransactionDidSucceed
{
  v6.receiver = self;
  v6.super_class = (Class)CPLEngineScopeCleanupTasks;
  [(CPLEngineStorage *)&v6 writeTransactionDidSucceed];
  if (self->_shouldRequestACleanupToScheduler)
  {
    v3 = [(CPLEngineStorage *)self engineStore];
    objc_super v4 = [v3 engineLibrary];
    v5 = [v4 scheduler];
    [v5 noteStoreNeedsCleanup];

    self->_shouldRequestACleanupToScheduler = 0;
  }
}

- (BOOL)hasCleanupTasks
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasCleanupTasks];

  return v3;
}

- (BOOL)cleanupStepHasMore:(BOOL *)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v7 = [(CPLEngineStorage *)self platformObject];
  int64_t v8 = [v7 nextCleanupTaskScopeIndexOfType:&v37];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a3 = 1;
    if (self->_currentCleanupScopeIndex != v8)
    {
      v11 = [(CPLEngineStorage *)self engineStore];
      v12 = [v11 storages];

      self->_int64_t currentCleanupScopeIndex = v8;
      v13 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      remainingStoragesToCleanup = self->_remainingStoragesToCleanup;
      self->_remainingStoragesToCleanup = v13;

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if ([v20 isAlive])
            {
              uint64_t v21 = [v20 scopeType];
              if (v21 == v37) {
                [(NSMutableArray *)self->_remainingStoragesToCleanup addObject:v20];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v17);
      }

      if (!_CPLSilentLogging)
      {
        v22 = __CPLStorageOSLogDomain_8438();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int64_t currentCleanupScopeIndex = self->_currentCleanupScopeIndex;
          v24 = [(NSMutableArray *)self->_remainingStoragesToCleanup valueForKey:@"name"];
          *(_DWORD *)buf = 134218242;
          int64_t v39 = currentCleanupScopeIndex;
          __int16 v40 = 2114;
          v41 = v24;
          _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "Will cleanup scope index %ld in %{public}@", buf, 0x16u);
        }
      }
    }
    v25 = [(NSMutableArray *)self->_remainingStoragesToCleanup firstObject];
    v26 = v25;
    if (v25)
    {
      int64_t v32 = 0;
      if (![v25 deleteRecordsForScopeIndex:self->_currentCleanupScopeIndex maxCount:1000 deletedCount:&v32 error:a4])
      {
        char v10 = 0;
LABEL_31:

        return v10;
      }
      if (v32)
      {
        if (!_CPLSilentLogging)
        {
          v27 = __CPLStorageOSLogDomain_8438();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v28 = v32;
            v29 = [v26 name];
            *(_DWORD *)buf = 134218242;
            int64_t v39 = v28;
            __int16 v40 = 2114;
            v41 = v29;
            _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEFAULT, "Deleted %ld records in %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        [(NSMutableArray *)self->_remainingStoragesToCleanup removeObjectAtIndex:0];
      }
    }
    if ([(NSMutableArray *)self->_remainingStoragesToCleanup count])
    {
      char v10 = 1;
    }
    else
    {
      v30 = [(CPLEngineStorage *)self platformObject];
      char v10 = [v30 deleteCleanupTaskForScopeWithIndex:self->_currentCleanupScopeIndex error:a4];
    }
    goto LABEL_31;
  }
  self->_int64_t currentCleanupScopeIndex = 0;
  v9 = self->_remainingStoragesToCleanup;
  self->_remainingStoragesToCleanup = 0;

  *a3 = 0;
  return 1;
}

- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 addCleanupTaskForScopeWithIndex:a3 scopeIdentifier:v10 scopeType:a5 error:a6];

  if (v12)
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLStorageOSLogDomain_8438();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(id)objc_opt_class() scopeTypeDescriptionForScopeType:a5];
        int v16 = 138412802;
        uint64_t v17 = v14;
        __int16 v18 = 2112;
        id v19 = v10;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup of %@ for %@ as index %ld", (uint8_t *)&v16, 0x20u);
      }
    }
    self->_shouldRequestACleanupToScheduler = 1;
  }

  return v12;
}

- (unint64_t)scopeType
{
  return 0;
}

+ (id)scopeTypeDescriptionForScopeType:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    char v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown %lu", a3);
  }
  else {
    char v3 = off_1E60A7DB8[a3 - 1];
  }
  return v3;
}

@end