@interface CHDatabaseClientHandleManager
+ (CHDatabaseClientHandleManager)sharedInstance;
- (CHDatabaseClientHandleManager)init;
- (CallHistoryDBClientHandle)databaseClientHandle;
@end

@implementation CHDatabaseClientHandleManager

+ (CHDatabaseClientHandleManager)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_databaseClientHandleManager;
  return (CHDatabaseClientHandleManager *)v2;
}

uint64_t __53__CHDatabaseClientHandleManager_databaseClientHandle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (!WeakRetained)
  {
    v3 = +[CallHistoryDBClientHandle createForClient];
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), v3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  return MEMORY[0x1F41817F8]();
}

- (CallHistoryDBClientHandle)databaseClientHandle
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CHDatabaseClientHandleManager_databaseClientHandle__block_invoke;
  v4[3] = &unk_1E61C73F0;
  v4[4] = self;
  v4[5] = &v5;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CallHistoryDBClientHandle *)v2;
}

uint64_t __47__CHDatabaseClientHandleManager_sharedInstance__block_invoke()
{
  sharedInstance_databaseClientHandleManager = objc_alloc_init(CHDatabaseClientHandleManager);
  return MEMORY[0x1F41817F8]();
}

- (CHDatabaseClientHandleManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CHDatabaseClientHandleManager;
  id v2 = [(CHSynchronizedLoggable *)&v5 initWithName:"CHDatabaseClientHandleManager"];
  v3 = v2;
  if (v2) {
    objc_storeWeak((id *)&v2->_databaseClientHandle, 0);
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end