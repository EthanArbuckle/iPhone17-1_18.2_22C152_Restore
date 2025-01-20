@interface PFUbiquityTransactionLogCache
- (PFUbiquityTransactionLog)retainedCachedLogForLocation:(BOOL)a3 loadWithRetry:(void *)a4 error:;
- (PFUbiquityTransactionLogCache)init;
- (PFUbiquityTransactionLogCache)initWithLocalPeerID:(id)a3 andGlobalIDCache:(id)a4;
- (uint64_t)cacheExportedLog:(uint64_t)result;
- (uint64_t)removeLogsCachedForStoreNamed:(uint64_t)a3 withUbiquityRootLocation:;
- (void)dealloc;
@end

@implementation PFUbiquityTransactionLogCache

- (PFUbiquityTransactionLogCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityTransactionLogCache;
  v2 = [(PFUbiquityTransactionLogCache *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_localPeerID = 0;
    v2->_transactionLogCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_transactionLogCacheLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v3->_gidCache = 0;
  }
  return v3;
}

- (PFUbiquityTransactionLogCache)initWithLocalPeerID:(id)a3 andGlobalIDCache:(id)a4
{
  v6 = [(PFUbiquityTransactionLogCache *)self init];
  if (v6)
  {
    v6->_localPeerID = (NSString *)a3;
    v6->_gidCache = (PFUbiquityGlobalObjectIDCache *)a4;
  }
  return v6;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_transactionLogCache = 0;

  self->_transactionLogCacheLock = 0;
  self->_gidCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLogCache;
  [(PFUbiquityTransactionLogCache *)&v3 dealloc];
}

- (PFUbiquityTransactionLog)retainedCachedLogForLocation:(BOOL)a3 loadWithRetry:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v29 = 0;
  [*(id *)(a1 + 24) lock];
  id v8 = (id)[*(id *)(a1 + 16) objectForKey:a2];
  [*(id *)(a1 + 24) unlock];
  if (!v8)
  {
    if (!-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](a2, *(void *)(a1 + 8), &v29))
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      if (!a2) {
        a2 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v18 = [v17 dictionaryWithObject:a2 forKey:@"logLocation"];
      id v19 = (id)[v16 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v18];
      id v29 = v19;
      if (!v19) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    v9 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:a2 andLocalPeerID:*(void *)(a1 + 8)];
    v10 = v9;
    if (!v9)
    {
LABEL_21:
      id v19 = v29;
      if (!v29)
      {
LABEL_22:
        uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLogCache.m");
        v27 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiqui"
                "tyTransactionLogCache.m";
          __int16 v32 = 1024;
          int v33 = 105;
          _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        return 0;
      }
LABEL_16:
      if (a4) {
        *a4 = v19;
      }
      return 0;
    }
    if (!v9->_transactionLogType) {
      return v10;
    }
    saveSnapshot = v9->_saveSnapshot;
    transactionLogLocation = v9->_transactionLogLocation;
    if (transactionLogLocation)
    {
      storeName = transactionLogLocation->_storeName;
      if (saveSnapshot) {
        goto LABEL_8;
      }
    }
    else
    {
      storeName = 0;
      if (saveSnapshot)
      {
LABEL_8:
        v14 = (void *)[(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:storeName];
        if (v14) {
          objc_setProperty_nonatomic(v14, v15, *(id *)(a1 + 32), 168);
        }
      }
    }
    v10->_loadUsingRetry = a3;
    if (-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v10, &v29))
    {
      -[PFUbiquityTransactionLog releaseContents:]((uint64_t)v10);
      [*(id *)(a1 + 24) lock];
      [*(id *)(a1 + 16) setObject:v10 forKey:a2];
      [*(id *)(a1 + 24) unlock];
      return v10;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Error loading transaction log: %@\nError: %@\nuserInfo: %@", "-[PFUbiquityTransactionLogCache retainedCachedLogForLocation:loadWithRetry:error:]", 90, a1, v10, v29, [v29 userInfo]);
    }

    goto LABEL_21;
  }
  return (PFUbiquityTransactionLog *)v8;
}

- (uint64_t)cacheExportedLog:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 24) lock];
    if (a2) {
      uint64_t v4 = *(void *)(a2 + 24);
    }
    else {
      uint64_t v4 = 0;
    }
    [*(id *)(v3 + 16) objectForKey:v4];
    if (a2) {
      uint64_t v5 = *(void *)(a2 + 32);
    }
    else {
      uint64_t v5 = 0;
    }
    [*(id *)(v3 + 16) objectForKey:v5];
    if (a2) {
      uint64_t v6 = *(void *)(a2 + 24);
    }
    else {
      uint64_t v6 = 0;
    }
    [*(id *)(v3 + 16) setObject:a2 forKey:v6];
    if (a2) {
      uint64_t v7 = *(void *)(a2 + 32);
    }
    else {
      uint64_t v7 = 0;
    }
    [*(id *)(v3 + 16) setObject:a2 forKey:v7];
    return [*(id *)(v3 + 24) unlock];
  }
  return result;
}

- (uint64_t)removeLogsCachedForStoreNamed:(uint64_t)a3 withUbiquityRootLocation:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    [*(id *)(result + 24) lock];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(*(id *)(v5 + 16), "allKeys", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
          if (v10)
          {
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
            if (*(_DWORD *)(v10 + 24) != 1) {
              v11 = *(void **)(v10 + 8);
            }
          }
          else
          {
            v11 = 0;
          }
          if ([v11 isEqual:a3])
          {
            if (v10) {
              v12 = *(void **)(v10 + 40);
            }
            else {
              v12 = 0;
            }
            if ([v12 isEqualToString:a2]) {
              [*(id *)(v5 + 16) removeObjectForKey:v10];
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v13 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v7 = v13;
      }
      while (v13);
    }
    return [*(id *)(v5 + 24) unlock];
  }
  return result;
}

@end