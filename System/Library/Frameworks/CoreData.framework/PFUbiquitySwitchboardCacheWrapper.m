@interface PFUbiquitySwitchboardCacheWrapper
- (PFUbiquitySwitchboardCacheWrapper)init;
- (PFUbiquitySwitchboardCacheWrapper)initWithStoreName:(id)a3 privateStore:(id)a4 forLocalPeerID:(id)a5 andUbiquityRootLocation:(id)a6;
- (uint64_t)writeReceiptFile:(void *)a3 error:;
- (void)_appWillResignActive:(id)a3;
- (void)cacheWrapperWillBeRemovedFromEntry;
- (void)dealloc;
- (void)scheduleReceiptFileWrite:(uint64_t)a1;
- (void)setUbiquityRootLocation:(uint64_t)a1;
@end

@implementation PFUbiquitySwitchboardCacheWrapper

- (PFUbiquitySwitchboardCacheWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySwitchboardCacheWrapper;
  v2 = [(PFUbiquitySwitchboardCacheWrapper *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_peerReceipt = 0;
    *(_OWORD *)&v2->_transactionLogCache = 0u;
    *(_OWORD *)&v2->_kv = 0u;
    *(_OWORD *)&v2->_globalIDCache = 0u;
    v2->_receiptFileLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v3->_allowSchedulingOfReceiptFileWrites = 0;
    v3->_localPeerID = 0;
    v3->_ubiquityRootLocation = 0;
  }
  return v3;
}

- (PFUbiquitySwitchboardCacheWrapper)initWithStoreName:(id)a3 privateStore:(id)a4 forLocalPeerID:(id)a5 andUbiquityRootLocation:(id)a6
{
  v10 = [(PFUbiquitySwitchboardCacheWrapper *)self init];
  if (v10)
  {
    v11 = (PFUbiquityLocation *)a6;
    v10->_ubiquityRootLocation = v11;
    if (v11) {
      v10->_allowSchedulingOfReceiptFileWrites = 1;
    }
    v10->_localPeerID = (NSString *)a5;
    v10->_storeName = (NSString *)a3;
    v10->_globalIDCache = [[PFUbiquityGlobalObjectIDCache alloc] initWithLocalPeerID:a5 forStoreName:v10->_storeName];
    v10->_peerRangeCache = [[PFUbiquityPeerRangeCache alloc] initWithPrivateStore:a4 storeName:v10->_storeName andLocalPeerID:a5];
    v10->_transactionLogCache = [[PFUbiquityTransactionLogCache alloc] initWithLocalPeerID:a5 andGlobalIDCache:v10->_globalIDCache];
    v12 = (PFUbiquityTransactionHistoryCache *)-[PFUbiquityTransactionHistoryCache initWithLocalPeerID:storeName:privateStore:andUbiquityRootLocation:]([PFUbiquityTransactionHistoryCache alloc], v10->_localPeerID, v10->_storeName, a4, v10->_ubiquityRootLocation);
    v10->_transactionHistoryCache = v12;
    if (v12) {
      objc_setProperty_nonatomic(v12, v13, v10->_globalIDCache, 96);
    }
    if (objc_getClass("UIApplication"))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRegistering for application will resign active.", "-[PFUbiquitySwitchboardCacheWrapper initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:]", 90, v10);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v10, sel__appWillResignActive_, @"UIApplicationWillResignActiveNotification", 0);
    }
  }
  return v10;
}

- (void)dealloc
{
  if (objc_getClass("UIApplication")) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"UIApplicationWillResignActiveNotification", 0);
  }

  self->_ubiquityRootLocation = 0;
  self->_localPeerID = 0;

  self->_storeName = 0;
  self->_globalIDCache = 0;

  self->_peerRangeCache = 0;
  self->_transactionLogCache = 0;

  self->_transactionHistoryCache = 0;
  self->_peerReceipt = 0;

  self->_kv = 0;
  self->_baselineKV = 0;

  self->_receiptFileLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySwitchboardCacheWrapper;
  [(PFUbiquitySwitchboardCacheWrapper *)&v3 dealloc];
}

- (void)setUbiquityRootLocation:(uint64_t)a1
{
  if (a1)
  {
    v2 = a2;
    v4 = *(void **)(a1 + 16);
    if (v4 != a2)
    {

      *(void *)(a1 + 16) = v2;
      objc_super v5 = [PFUbiquityTransactionHistoryCache alloc];
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        v7 = *(void **)(v6 + 48);
      }
      else {
        v7 = 0;
      }
      v8 = -[PFUbiquityTransactionHistoryCache initWithLocalPeerID:storeName:privateStore:andUbiquityRootLocation:](v5, *(void **)(a1 + 8), *(void **)(a1 + 24), v7, *(void **)(a1 + 16));
      *(void *)(a1 + 56) = v8;
      if (v8) {
        objc_setProperty_nonatomic(v8, v9, *(id *)(a1 + 32), 96);
      }
      v2 = *(void **)(a1 + 16);
    }
    if (v2) {
      *(unsigned char *)(a1 + 104) = 1;
    }
  }
}

- (void)cacheWrapperWillBeRemovedFromEntry
{
  if (a1)
  {
    *(unsigned char *)(a1 + 104) = 0;
    if (objc_getClass("UIApplication"))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnregistering for application will resign active.", "-[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry]", 137, a1);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", a1, @"UIApplicationWillResignActiveNotification", 0);
    }
    id v2 = 0;
    if (!-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](*(void *)(a1 + 56), 0)
      && +[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Error purging transaction history cache: %@\nuserInfo: %@", "-[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry]", 146, a1, v2, [v2 userInfo]);
    }
    if ((-[PFUbiquitySwitchboardCacheWrapper writeReceiptFile:error:](a1, 1, &v2) & 1) == 0)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nReceipt file write failed: %@", "-[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry]", 155, a1, v2);
      }
    }
  }
}

- (uint64_t)writeReceiptFile:(void *)a3 error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v19 = 0;
  objc_super v5 = *(void **)(a1 + 96);
  if (a2)
  {
    if (![v5 tryLock])
    {
      uint64_t v6 = 0;
LABEL_16:
      id v8 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    [v5 lock];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    v7 = *(id *)(a1 + 80);

    *(void *)(a1 + 80) = 0;
    *(unsigned char *)(a1 + 88) = 0;
    uint64_t v6 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 96) unlock];
  if (!v6) {
    goto LABEL_16;
  }
  self;
  id v8 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 8));
  if (v8)
  {
    self;
    if (-[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, *(void *)(a1 + 16), *(void *)(a1 + 8)))
    {
      if (([v6 writeFileToLocation:v6[3] error:&v19] & 1) == 0)
      {
        if (v19)
        {
          if (a3) {
            *a3 = v19;
          }
        }
        else
        {
          uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Switchboard/PFUbiquitySwitchboardCacheWrapper.m");
          v18 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Switchboard/PFUbiquityS"
                  "witchboardCacheWrapper.m";
            __int16 v22 = 1024;
            int v23 = 270;
            _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error writing receipt file before switchboard removal: %@\nuserInfo: %@", "-[PFUbiquitySwitchboardCacheWrapper writeReceiptFile:error:]", 271, v19, [v19 userInfo]);
        }
        uint64_t v9 = 0;
        goto LABEL_18;
      }
    }
  }
LABEL_17:
  uint64_t v9 = 1;
LABEL_18:

  return v9;
}

- (void)scheduleReceiptFileWrite:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 104))
    {
      [*(id *)(a1 + 96) lock];

      *(void *)(a1 + 80) = a2;
      int v4 = *(unsigned __int8 *)(a1 + 88);
      if (!*(unsigned char *)(a1 + 88)) {
        *(unsigned char *)(a1 + 88) = 1;
      }
      [*(id *)(a1 + 96) unlock];
      if (!v4)
      {
        self;
        id v5 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 24), *(void *)(a1 + 8));
        if (v5)
        {
          v6[0] = MEMORY[0x1E4F143A8];
          v6[1] = 3221225472;
          v6[2] = __62__PFUbiquitySwitchboardCacheWrapper_scheduleReceiptFileWrite___block_invoke;
          v6[3] = &unk_1E544B868;
          v6[4] = a1;
          +[_PFUbiquityRecordsImporter afterDelay:executeBlockOnRootQueue:](600.0, (uint64_t)_PFUbiquityRecordsImporter, (uint64_t)v6);
        }
        goto LABEL_12;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:2])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ ignoring schedule request because it is not allowed: %@", "-[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:]", 201, a1, a2);
    }
    id v5 = 0;
LABEL_12:
  }
}

void __62__PFUbiquitySwitchboardCacheWrapper_scheduleReceiptFileWrite___block_invoke(uint64_t a1)
{
  id v4 = 0;
  if ((-[PFUbiquitySwitchboardCacheWrapper writeReceiptFile:error:](*(void *)(a1 + 32), 0, &v4) & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 80);
    }
    else {
      uint64_t v3 = 0;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@ encountered an error while trying to write receipt: %@ to disk: %@\nuserInfo: %@", "-[PFUbiquitySwitchboardCacheWrapper scheduleReceiptFileWrite:]_block_invoke", 215, v2, v3, v4, [v4 userInfo]);
  }
}

- (void)_appWillResignActive:(id)a3
{
  uint64_t v5 = 0;
  id v4 = self;
  if ((-[PFUbiquitySwitchboardCacheWrapper writeReceiptFile:error:]((uint64_t)self, 1, &v5) & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nReceipt file write failed: %@", "-[PFUbiquitySwitchboardCacheWrapper _appWillResignActive:]", 291, self, v5);
  }
}

@end