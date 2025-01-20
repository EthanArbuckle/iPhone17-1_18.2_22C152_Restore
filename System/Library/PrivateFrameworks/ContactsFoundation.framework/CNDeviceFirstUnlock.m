@interface CNDeviceFirstUnlock
+ (id)sharedInstance;
- (BOOL)isUnlockedSinceBoot;
- (CNDeviceFirstUnlock)init;
- (CNFuture)firstUnlockFuture;
- (CNUnfairLock)handlersLock;
- (NSMutableDictionary)unlockHandlers;
- (NSOperationQueue)workQueue;
- (int64_t)countOfUnlockHandlers;
- (void)addUnlockHandlerWithIdentifier:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)removeUnlockHandlerWithIdentifier:(id)a3;
- (void)setFirstUnlockFuture:(id)a3;
- (void)setHandlersLock:(id)a3;
- (void)setUnlockHandlers:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)waitForAllOperationsToFinish;
- (void)withHandlersLock_addHandlerWithIdentifier:(id)a3 block:(id)a4;
- (void)withHandlersLock_cancelExistingOperationWithIdentifier:(id)a3;
- (void)withHandlersLock_registerForDeviceFirstUnlock;
@end

@implementation CNDeviceFirstUnlock

uint64_t __57__CNDeviceFirstUnlock_removeUnlockHandlerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "withHandlersLock_cancelExistingOperationWithIdentifier:", *(void *)(a1 + 40));
}

- (void)withHandlersLock_cancelExistingOperationWithIdentifier:(id)a3
{
  id v7 = a3;
  if (off_1EE0254C0((uint64_t)&__block_literal_global_121_0, v7))
  {
    v4 = [(CNDeviceFirstUnlock *)self unlockHandlers];
    v5 = [v4 objectForKeyedSubscript:v7];

    [v5 cancel];
    v6 = [(CNDeviceFirstUnlock *)self unlockHandlers];
    [v6 setObject:0 forKeyedSubscript:v7];
  }
}

- (NSMutableDictionary)unlockHandlers
{
  return self->_unlockHandlers;
}

uint64_t __37__CNDeviceFirstUnlock_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_cn_once_object_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CNDeviceFirstUnlock)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNDeviceFirstUnlock;
  v2 = [(CNDeviceFirstUnlock *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNUnfairLock);
    handlersLock = v2->_handlersLock;
    v2->_handlersLock = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unlockHandlers = v2->_unlockHandlers;
    v2->_unlockHandlers = v5;

    id v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    workQueue = v2->_workQueue;
    v2->_workQueue = v7;

    [(NSOperationQueue *)v2->_workQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_workQueue setSuspended:1];
    v9 = v2;
  }

  return v2;
}

- (BOOL)isUnlockedSinceBoot
{
  return +[CNMobileKeyBag isDeviceUnlockedSinceBoot];
}

- (void)removeUnlockHandlerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CNDeviceFirstUnlock *)self handlersLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CNDeviceFirstUnlock_removeUnlockHandlerWithIdentifier___block_invoke;
  v7[3] = &unk_1E569F310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  CNRunWithLock(v5, v7);
}

- (CNUnfairLock)handlersLock
{
  return self->_handlersLock;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CNDeviceFirstUnlock_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_cn_once_token_1 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_1, block);
  }
  v2 = (void *)sharedInstance_cn_once_object_1;

  return v2;
}

- (void)dealloc
{
  [(CNFuture *)self->_firstUnlockFuture cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNDeviceFirstUnlock;
  [(CNDeviceFirstUnlock *)&v3 dealloc];
}

- (void)addUnlockHandlerWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNDeviceFirstUnlock *)self isUnlockedSinceBoot])
  {
    id v8 = [(CNDeviceFirstUnlock *)self workQueue];
    [v8 addOperationWithBlock:v7];

    v9 = [(CNDeviceFirstUnlock *)self workQueue];
    [v9 setSuspended:0];
  }
  else
  {
    v10 = [(CNDeviceFirstUnlock *)self handlersLock];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__CNDeviceFirstUnlock_addUnlockHandlerWithIdentifier_block___block_invoke;
    v11[3] = &unk_1E56A01F0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    CNRunWithLock(v10, v11);
  }
}

uint64_t __60__CNDeviceFirstUnlock_addUnlockHandlerWithIdentifier_block___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "withHandlersLock_addHandlerWithIdentifier:block:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "withHandlersLock_registerForDeviceFirstUnlock");
}

- (void)withHandlersLock_addHandlerWithIdentifier:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v6))
  {
    id v8 = [(CNDeviceFirstUnlock *)self workQueue];
    [v8 addOperationWithBlock:v7];
  }
  else
  {
    [(CNDeviceFirstUnlock *)self withHandlersLock_cancelExistingOperationWithIdentifier:v6];
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __71__CNDeviceFirstUnlock_withHandlersLock_addHandlerWithIdentifier_block___block_invoke;
    v17 = &unk_1E56A1578;
    id v19 = v7;
    objc_copyWeak(&v20, &location);
    id v10 = v6;
    id v18 = v10;
    objc_super v11 = [v9 blockOperationWithBlock:&v14];
    id v12 = [(CNDeviceFirstUnlock *)self unlockHandlers];
    [v12 setObject:v11 forKeyedSubscript:v10];

    id v13 = [(CNDeviceFirstUnlock *)self workQueue];
    [v13 addOperation:v11];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __71__CNDeviceFirstUnlock_withHandlersLock_addHandlerWithIdentifier_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeUnlockHandlerWithIdentifier:*(void *)(a1 + 32)];
}

- (void)withHandlersLock_registerForDeviceFirstUnlock
{
  objc_super v3 = [(CNDeviceFirstUnlock *)self firstUnlockFuture];

  if (!v3)
  {
    id v4 = +[CNDeviceFirstUnlockFuture deviceFirstUnlockFuture];
    [(CNDeviceFirstUnlock *)self setFirstUnlockFuture:v4];

    v5 = [(CNDeviceFirstUnlock *)self workQueue];
    id v6 = [(CNDeviceFirstUnlock *)self firstUnlockFuture];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__CNDeviceFirstUnlock_withHandlersLock_registerForDeviceFirstUnlock__block_invoke;
    v8[3] = &unk_1E56A0AD8;
    id v9 = v5;
    id v7 = v5;
    [v6 addSuccessBlock:v8];
  }
}

uint64_t __68__CNDeviceFirstUnlock_withHandlersLock_registerForDeviceFirstUnlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuspended:0];
}

- (void)waitForAllOperationsToFinish
{
  id v2 = [(CNDeviceFirstUnlock *)self workQueue];
  [v2 waitUntilAllOperationsAreFinished];
}

- (int64_t)countOfUnlockHandlers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  objc_super v3 = [(CNDeviceFirstUnlock *)self handlersLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CNDeviceFirstUnlock_countOfUnlockHandlers__block_invoke;
  v6[3] = &unk_1E569F9B0;
  v6[4] = self;
  v6[5] = &v7;
  CNRunWithLock(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__CNDeviceFirstUnlock_countOfUnlockHandlers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) unlockHandlers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)setHandlersLock:(id)a3
{
}

- (void)setUnlockHandlers:(id)a3
{
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (CNFuture)firstUnlockFuture
{
  return self->_firstUnlockFuture;
}

- (void)setFirstUnlockFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockFuture, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_unlockHandlers, 0);

  objc_storeStrong((id *)&self->_handlersLock, 0);
}

@end