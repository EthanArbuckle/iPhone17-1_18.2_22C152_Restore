@interface SyncManager
- (CHFeatureFlags)featureFlags;
- (CallHistoryDBClientHandleProtocol)dbHandle;
- (SyncManager)init;
- (SyncManager)initWithTransactionManager:(id)a3 dbHandle:(id)a4;
- (TransactionManagerProtocol)transactionManager;
- (double)timerIncoming;
- (double)timerLifetime;
- (double)timerOutgoing;
- (id)archiveCallObject:(id)a3;
- (id)bundleIDToServiceProvider:(id)a3;
- (id)fetchAllObjects;
- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8;
- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8;
- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8;
- (id)fetchObjectWithUniqueId:(id)a3;
- (id)fetchObjectsWithLimits:(id)a3;
- (id)predicateForCallKind:(id)a3;
- (id)predicateForCallKinds:(id)a3;
- (id)predicateForLimits:(id)a3;
- (id)updatedPredicate:(id)a3 withLimits:(id)a4;
- (int64_t)deleteCallsWithPredicate:(id)a3 error:(id *)a4;
- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 error:(id *)a5;
- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5;
- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5;
- (void)addUpdateTransactions:(id)a3;
- (void)deleteAllObjects;
- (void)deleteObjectsWithLimits:(id)a3;
- (void)deleteObjectsWithUniqueIds:(id)a3 withTransaction:(BOOL)a4;
- (void)initDBHandle;
- (void)insert:(id)a3 withTransaction:(BOOL)a4;
- (void)insertRecords:(id)a3;
- (void)insertRecordsWithoutTransactions:(id)a3;
- (void)resetTimers;
- (void)updateAllObjects:(id)a3;
- (void)updateObjects:(id)a3;
- (void)updateObjectsWithCalls:(id)a3 withTransactions:(BOOL)a4;
@end

@implementation SyncManager

- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5
{
  id v8 = a4;
  v9 = [(SyncManager *)self updatedPredicate:a3 withLimits:a5];
  v10 = [(SyncManager *)self dbHandle];
  unint64_t v11 = [v10 fetchCallCountWithPredicate:v9 sortDescriptors:v8];

  return v11;
}

- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14 = a4;
  v15 = [(SyncManager *)self updatedPredicate:a3 withLimits:a5];
  v16 = [(SyncManager *)self dbHandle];
  v17 = [v16 fetchCallsWithPredicate:v15 sortDescriptors:v14 limit:a6 offset:a7 batchSize:a8];

  return v17;
}

- (CallHistoryDBClientHandleProtocol)dbHandle
{
  return self->_dbHandle;
}

- (id)updatedPredicate:(id)a3 withLimits:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(SyncManager *)self predicateForLimits:a4];
  id v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E4F28BA0];
    v13[0] = v6;
    v13[1] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v11 = [v9 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (id)predicateForLimits:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"kCHLimitCallKindsKey"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(SyncManager *)self predicateForCallKinds:v5];
  if (v7) {
    [v6 addObject:v7];
  }
  v34 = (void *)v7;
  id v8 = [v4 objectForKeyedSubscript:@"kCHLimitStartDateKey"];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28F60];
    v10 = [v4 objectForKeyedSubscript:@"kCHLimitStartDateKey"];
    id v11 = [v9 predicateWithFormat:@"%K >= %@", @"date", v10];

    [v6 addObject:v11];
  }
  v12 = [v4 objectForKeyedSubscript:@"kCHLimitEndDateKey"];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28F60];
    id v14 = [v4 objectForKeyedSubscript:@"kCHLimitEndDateKey"];
    v15 = [v13 predicateWithFormat:@"%K <= %@", @"date", v14];

    [v6 addObject:v15];
  }
  uint64_t v16 = [v4 objectForKeyedSubscript:@"kCHLimitProtectedBundleIDsKey"];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(SyncManager *)self featureFlags];
    int v19 = [v18 protectedAppsEnabled];

    if (v19)
    {
      v20 = [v4 objectForKeyedSubscript:@"kCHLimitProtectedBundleIDsKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = v5;
        id v33 = v4;
        id v21 = v20;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v36;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [(SyncManager *)self bundleIDToServiceProvider:v26];
                if ([v27 length])
                {
                  v28 = +[CHRecentCall predicateForCallsContainingServiceProvider:v27];
                  v29 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v28];

                  [v6 addObject:v29];
                }
              }
              else
              {
                v27 = [(CHLogger *)self logHandle];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v40 = v26;
                  _os_log_error_impl(&dword_1B8E4A000, v27, OS_LOG_TYPE_ERROR, "Invalid bundleID %{public}@", buf, 0xCu);
                }
              }

              ++v25;
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
          }
          while (v23);
        }

        v5 = v32;
        id v4 = v33;
      }
    }
  }
  v30 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];

  return v30;
}

- (id)predicateForCallKinds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[SyncManager predicateForCallKind:](self, "predicateForCallKind:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v12 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)predicateForCallKind:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 objectForKeyedSubscript:@"kCHMediaTypeKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = +[CHRecentCall predicateForCallsWithMediaType:](CHRecentCall, "predicateForCallsWithMediaType:", [v5 integerValue]);
    [v4 addObject:v6];
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"kCHTTYTypeKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = +[CHRecentCall predicateForCallsWithTTYType:](CHRecentCall, "predicateForCallsWithTTYType:", [v7 integerValue]);
    [v4 addObject:v8];
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"kCHServiceProviderKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 length])
    {
      id v11 = +[CHRecentCall predicateForCallsWithServiceProvider:v10];
      [v4 addObject:v11];
    }
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
LABEL_13:
    v13 = (void *)v12;
    goto LABEL_15;
  }
  if ([v4 count] == 1)
  {
    uint64_t v12 = [v4 firstObject];
    goto LABEL_13;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (SyncManager)init
{
  id v3 = +[TransactionManager instance];
  id v4 = +[CHDatabaseClientHandleManager sharedInstance];
  id v5 = [v4 databaseClientHandle];
  id v6 = [(SyncManager *)self initWithTransactionManager:v3 dbHandle:v5];

  return v6;
}

- (SyncManager)initWithTransactionManager:(id)a3 dbHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SyncManager;
  uint64_t v9 = [(CHLogger *)&v14 initWithDomain:"SyncManager"];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionManager, a3);
    id v11 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    objc_storeStrong((id *)&v10->_dbHandle, a4);
  }

  return v10;
}

- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v20 = @"read";
  uint64_t v9 = [NSNumber numberWithBool:v6];
  v21[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  id v11 = [(SyncManager *)self dbHandle];
  uint64_t v12 = [v11 updateCallsWithPredicate:v8 propertiesToUpdate:v10 error:a5];

  int64_t v13 = [v12 count];
  objc_super v14 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    int64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "Updated read status for %lu calls matching predicate %@", (uint8_t *)&v16, 0x16u);
  }

  if (v13)
  {
    [(SyncManager *)self addUpdateTransactions:v12];
  }
  else if (a5)
  {
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (void)initDBHandle
{
  id v5 = +[CHDatabaseClientHandleManager sharedInstance];
  id v3 = [v5 databaseClientHandle];
  dbHandle = self->_dbHandle;
  self->_dbHandle = v3;
}

- (void)insert:(id)a3 withTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SyncManager *)self dbHandle];
  id v8 = +[CHCallFingerprint matchCallWithFingerprint:v6 usingDatabase:v7];

  if (v8)
  {
    if (+[CHCallFingerprint shouldCall:v6 updateMatchingCall:v8])
    {
      uint64_t v9 = +[CHCallFingerprint updateCall:v6 withFingerprintedCall:v8];

      id v10 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v8;
        __int16 v26 = 2114;
        uint64_t v27 = v9;
        _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Updating %{public}@ with %{public}@", buf, 0x16u);
      }

      id v11 = [v8 uniqueId];
      uint64_t v22 = v11;
      uint64_t v23 = v9;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [(SyncManager *)self updateObjectsWithCalls:v12 withTransactions:0];
      id v6 = (id)v9;
      goto LABEL_18;
    }
    int64_t v13 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v6;
      _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Not updating matching call %@ with new call %@", buf, 0x16u);
    }
  }
  objc_super v14 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v6 uniqueId];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "Inserting call with UUID %{public}@", buf, 0xCu);
  }
  int v16 = [(SyncManager *)self dbHandle];
  [v16 createCallRecord:v6];

  if (v4)
  {
    id v21 = 0;
    uint64_t v12 = [v6 archivedDataWithError:&v21];
    id v17 = v21;
    id v11 = v17;
    if (v12)
    {
      __int16 v18 = [[CHTransaction alloc] initWithType:0 andRecord:v12];
      transactionManager = self->_transactionManager;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
      [(TransactionManagerProtocol *)transactionManager appendTransactions:v20];
    }
    else
    {
      if (!v17)
      {
LABEL_18:

        goto LABEL_19;
      }
      __int16 v18 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
        -[SyncManager insert:withTransaction:]();
      }
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (void)insertRecords:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20 = self;
  [(SyncManager *)self insertRecordsWithoutTransactions:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138412546;
    long long v19 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        id v21 = 0;
        int64_t v13 = objc_msgSend(v12, "archivedDataWithError:", &v21, v19);
        id v14 = v21;
        long long v15 = v14;
        if (v13)
        {
          int v16 = [[CHTransaction alloc] initWithType:0 andRecord:v13];
          [v5 addObject:v16];
        }
        else
        {
          if (!v14) {
            goto LABEL_12;
          }
          int v16 = [(CHLogger *)v20 logHandle];
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v27 = v12;
            __int16 v28 = 2114;
            v29 = v15;
            _os_log_error_impl(&dword_1B8E4A000, &v16->super, OS_LOG_TYPE_ERROR, "Attempt to archive %@ failed with error %{public}@", buf, 0x16u);
          }
        }

LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    transactionManager = v20->_transactionManager;
    __int16 v18 = (void *)[v5 copy];
    [(TransactionManagerProtocol *)transactionManager appendTransactions:v18];
  }
}

- (void)insertRecordsWithoutTransactions:(id)a3
{
  id v4 = a3;
  id v5 = [(SyncManager *)self dbHandle];
  [v5 createCallRecords:v4];
}

- (int64_t)deleteCallsWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SyncManager *)self dbHandle];
  int64_t v8 = [v7 deleteCallsWithPredicate:v6];

  if (v8 >= 1)
  {
    uint64_t v9 = [(SyncManager *)self dbHandle];
    int v10 = [v9 saveDatabase:a4];

    if (!v10) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14 = a4;
  long long v15 = [(SyncManager *)self updatedPredicate:a3 withLimits:a5];
  int v16 = [(SyncManager *)self dbHandle];
  id v17 = [v16 fetchCallIdentifiersWithPredicate:v15 sortDescriptors:v14 limit:a6 offset:a7 batchSize:a8];

  return v17;
}

- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5
{
  id v8 = a4;
  uint64_t v9 = [(SyncManager *)self updatedPredicate:a3 withLimits:a5];
  int v10 = [(SyncManager *)self dbHandle];
  unint64_t v11 = [v10 fetchCoalescedCallCountWithPredicate:v9 sortDescriptors:v8];

  return v11;
}

- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14 = a4;
  long long v15 = [(SyncManager *)self updatedPredicate:a3 withLimits:a5];
  int v16 = [(SyncManager *)self dbHandle];
  id v17 = [v16 fetchCoalescedCallsWithPredicate:v15 sortDescriptors:v14 limit:a6 offset:a7 batchSize:a8];

  return v17;
}

- (id)fetchAllObjects
{
  v2 = [(SyncManager *)self dbHandle];
  id v3 = [v2 fetchAll];

  return v3;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  id v4 = a3;
  id v5 = [(SyncManager *)self dbHandle];
  id v6 = [v5 fetchObjectWithUniqueId:v4];

  return v6;
}

- (id)bundleIDToServiceProvider:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 caseInsensitiveCompare:@"com.apple.mobilephone"])
  {
    if ([(__CFString *)v3 caseInsensitiveCompare:@"com.apple.FaceTime"]) {
      id v4 = v3;
    }
    else {
      id v4 = @"com.apple.FaceTime";
    }
  }
  else
  {
    id v4 = @"com.apple.Telephony";
  }
  id v5 = v4;

  return v5;
}

- (id)fetchObjectsWithLimits:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [(SyncManager *)self predicateForLimits:a3];
  id v5 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 predicateFormat];
    int v10 = 138412290;
    unint64_t v11 = v6;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "fetching with predicate: %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(SyncManager *)self dbHandle];
  id v8 = [v7 fetchObjectsWithPredicate:v4];

  return v8;
}

- (void)deleteObjectsWithUniqueIds:(id)a3 withTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SyncManager *)self dbHandle];
  id v8 = [v7 fetchObjectsWithUniqueIds:v6];

  uint64_t v9 = [v8 count];
  int v10 = [(CHLogger *)self logHandle];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = [v8 count];
      _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Deleting all %lu objects", buf, 0xCu);
    }

    int v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v4)
    {
      id v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [(SyncManager *)self archiveCallObject:*(void *)(*((void *)&v22 + 1) + 8 * v16)];
            __int16 v18 = [[CHTransaction alloc] initWithType:2 andRecord:v17];
            [v10 addObject:v18];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }

      long long v19 = [(SyncManager *)self dbHandle];
      id v6 = v21;
      [v19 deleteObjectsWithUniqueIds:v21];

      [(TransactionManagerProtocol *)self->_transactionManager appendTransactions:v10];
    }
    else
    {
      v20 = [(SyncManager *)self dbHandle];
      [v20 deleteObjectsWithUniqueIds:v6];
    }
    notify_post("com.apple.callhistory.RecentDeletedNotification");
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "No Call Records found", buf, 2u);
  }
}

- (void)deleteAllObjects
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1BA9CD070](self, a2);
  BOOL v4 = [(SyncManager *)self dbHandle];
  id v5 = [v4 fetchAllNoLimit];

  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    v30 = v3;
    uint64_t v31 = self;
    id v8 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v7;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Deleting %lu calls", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v28 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
          id v33 = 0;
          uint64_t v16 = objc_msgSend(v15, "archivedDataWithError:", &v33, v28);
          id v17 = v33;
          __int16 v18 = v17;
          if (v16)
          {
            long long v19 = [[CHTransaction alloc] initWithType:2 andRecord:v16];
            [v9 addObject:v19];
          }
          else
          {
            if (!v17) {
              goto LABEL_15;
            }
            long long v19 = [(CHLogger *)v31 logHandle];
            if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = (uint64_t)v15;
              __int16 v40 = 2114;
              v41 = v18;
              _os_log_error_impl(&dword_1B8E4A000, &v19->super, OS_LOG_TYPE_ERROR, "Attempt to archive %@ failed with error %{public}@", buf, 0x16u);
            }
          }

LABEL_15:
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v12);
    }

    v20 = objc_alloc_init(CHRecentCall);
    id v21 = +[CHTransaction toString:3];
    [(CHRecentCall *)v20 setUniqueId:v21];

    id v32 = 0;
    long long v22 = [(CHRecentCall *)v20 archivedDataWithError:&v32];
    id v23 = v32;
    long long v24 = v23;
    if (v22)
    {
      long long v25 = [[CHTransaction alloc] initWithType:3 andRecord:v22];
      [v9 addObject:v25];
      id v3 = v30;
      p_isa = (id *)&v31->super.super.isa;
    }
    else
    {
      id v3 = v30;
      p_isa = (id *)&v31->super.super.isa;
      if (!v23)
      {
LABEL_23:
        uint64_t v27 = objc_msgSend(p_isa, "dbHandle", v28);
        [v27 deleteAll];

        [p_isa[4] appendTransactions:v9];
        notify_post("com.apple.callhistory.RecentsClearedNotification");

        id v5 = v29;
        goto LABEL_24;
      }
      long long v25 = [(CHLogger *)v31 logHandle];
      if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_ERROR)) {
        -[SyncManager insert:withTransaction:]();
      }
    }

    goto LABEL_23;
  }
LABEL_24:
}

- (void)deleteObjectsWithLimits:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1BA9CD070]();
  v20 = v4;
  id v5 = [(SyncManager *)self fetchObjectsWithLimits:v4];
  uint64_t v6 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = [v5 count];
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Deleting %d objects", buf, 8u);
  }

  id v23 = objc_opt_new();
  long long v22 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 uniqueId];

        if (v12)
        {
          uint64_t v13 = [(SyncManager *)self archiveCallObject:v11];
          uint64_t v14 = [[CHTransaction alloc] initWithType:2 andRecord:v13];
          [v23 addObject:v14];
          uint64_t v15 = [v11 uniqueId];
          [v22 addObject:v15];
        }
        else
        {
          uint64_t v13 = [(CHLogger *)self logHandle];
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", [v11 mediaType]);
          uint64_t v14 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", [v11 ttyType]);
          id v17 = [v11 date];
          *(_DWORD *)buf = 138543874;
          uint64_t v29 = v14;
          __int16 v30 = 2114;
          uint64_t v31 = v16;
          __int16 v32 = 2114;
          id v33 = v17;
          _os_log_impl(&dword_1B8E4A000, v13, OS_LOG_TYPE_DEFAULT, "Cannot delete call with mediaType %{public}@ and ttyType %{public}@ placed on %{public}@ with nil unique ID", buf, 0x20u);
        }
LABEL_13:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v8);
  }

  __int16 v18 = [(SyncManager *)self dbHandle];
  [v18 deleteObjectsWithUniqueIds:v22];

  [(TransactionManagerProtocol *)self->_transactionManager appendTransactions:v23];
}

- (void)updateObjectsWithCalls:(id)a3 withTransactions:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v7 = [(SyncManager *)self dbHandle];
  uint64_t v8 = [v7 updateCallRecordsWithCalls:v9 error:0 save:1];

  if (v4) {
    [(SyncManager *)self addUpdateTransactions:v8];
  }
}

- (void)updateObjects:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x1BA9CD070]();
  id v5 = [(SyncManager *)self dbHandle];
  uint64_t v6 = [v5 updateCallRecords:v7];
  [(SyncManager *)self addUpdateTransactions:v6];
}

- (void)updateAllObjects:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x1BA9CD070]();
  id v5 = [(SyncManager *)self dbHandle];
  uint64_t v6 = [v5 updateAllCallRecords:v7];
  [(SyncManager *)self addUpdateTransactions:v6];
}

- (void)addUpdateTransactions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[SyncManager archiveCallObject:](self, "archiveCallObject:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        if (v11)
        {
          uint64_t v12 = [[CHTransaction alloc] initWithType:1 andRecord:v11];
          [v5 addObject:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(TransactionManagerProtocol *)self->_transactionManager appendTransactions:v5];
}

- (double)timerLifetime
{
  v2 = [(SyncManager *)self dbHandle];
  id v3 = [v2 timerLifetime];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)timerIncoming
{
  v2 = [(SyncManager *)self dbHandle];
  id v3 = [v2 timerIncoming];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)timerOutgoing
{
  v2 = [(SyncManager *)self dbHandle];
  id v3 = [v2 timerOutgoing];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)resetTimers
{
  id v2 = [(SyncManager *)self dbHandle];
  [v2 resetTimers];
}

- (id)archiveCallObject:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 setOutputFormat:200];
  [v5 encodeObject:v4 forKey:*MEMORY[0x1E4F284E8]];

  id v6 = [v5 encodedData];

  return v6;
}

- (TransactionManagerProtocol)transactionManager
{
  return self->_transactionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_dbHandle, 0);
}

- (void)insert:withTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B8E4A000, v0, v1, "Attempt to archive %@ failed with error %{public}@");
}

@end