@interface CLBMobileKeybagManager
+ (CLBMobileKeybagManager)sharedInstance;
- (BOOL)hasUnlockedSinceBoot;
- (BOOL)isLocked;
- (BOOL)unlockWithPasscode:(id)a3 error:(id *)a4;
- (CLBMobileKeybagManager)init;
- (double)backOffTime;
- (id)registerFirstUnlockBlock:(id)a3;
- (id)registerLockStateChangedBlock:(id)a3;
- (int64_t)_lockStateFromDictionary:(id)a3;
- (int64_t)currentState;
- (unint64_t)failedAttemptCount;
- (void)_handleFirstUnlock;
- (void)_handleKeybagStatusChanged;
- (void)_queue_updateLockedState;
- (void)dealloc;
- (void)lock;
- (void)unregisterFirstUnlockBlockWithIdentifier:(id)a3;
- (void)unregisterLockStateChangedBlockWithIdentifier:(id)a3;
@end

@implementation CLBMobileKeybagManager

+ (CLBMobileKeybagManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__keybagManager;

  return (CLBMobileKeybagManager *)v2;
}

uint64_t __40__CLBMobileKeybagManager_sharedInstance__block_invoke()
{
  sharedInstance__keybagManager = objc_alloc_init(CLBMobileKeybagManager);

  return MEMORY[0x270F9A758]();
}

- (CLBMobileKeybagManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)CLBMobileKeybagManager;
  v2 = [(CLBMobileKeybagManager *)&v21 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = BSDispatchQueueCreateSerial();
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    stateChangedCallbackBlocks = v2->_stateChangedCallbackBlocks;
    v2->_stateChangedCallbackBlocks = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    firstUnlockCallbackBlocks = v2->_firstUnlockCallbackBlocks;
    v2->_firstUnlockCallbackBlocks = (NSMutableDictionary *)v9;

    objc_initWeak(&location, v2);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __30__CLBMobileKeybagManager_init__block_invoke;
    v18 = &unk_265280240;
    objc_copyWeak(&v19, &location);
    v2->_mkbEvent = (_MKBEvent *)MKBEventsRegister();
    v11 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__CLBMobileKeybagManager_init__block_invoke_2;
    block[3] = &unk_265280268;
    v14 = v2;
    dispatch_sync(v11, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__CLBMobileKeybagManager_init__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 != 1) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleKeybagStatusChanged];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleFirstUnlock];
  }
}

uint64_t __30__CLBMobileKeybagManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockedState");
}

- (void)dealloc
{
  MKBEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)CLBMobileKeybagManager;
  [(CLBMobileKeybagManager *)&v3 dealloc];
}

- (BOOL)isLocked
{
  int64_t v2 = [(CLBMobileKeybagManager *)self currentState];
  return v2 != 3 && v2 != 0;
}

- (int64_t)currentState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__CLBMobileKeybagManager_currentState__block_invoke;
  v5[3] = &unk_265280290;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__CLBMobileKeybagManager_currentState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _lockStateFromDictionary:*(void *)(*(void *)(a1 + 32) + 8)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)lock
{
  if (![(CLBMobileKeybagManager *)self currentState])
  {
    MEMORY[0x270F4AEA8]();
  }
}

- (double)backOffTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__CLBMobileKeybagManager_backOffTime__block_invoke;
  v6[3] = &unk_265280290;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  [(id)v8[5] doubleValue];
  double v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __37__CLBMobileKeybagManager_backOffTime__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*MEMORY[0x263F55A40]];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)failedAttemptCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CLBMobileKeybagManager_failedAttemptCount__block_invoke;
  v5[3] = &unk_265280290;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = [(id)v7[5] unsignedIntegerValue];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__CLBMobileKeybagManager_failedAttemptCount__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*MEMORY[0x263F55A50]];

  return MEMORY[0x270F9A758]();
}

- (BOOL)hasUnlockedSinceBoot
{
  return (int)MKBDeviceUnlockedSinceBoot() > 0;
}

- (BOOL)unlockWithPasscode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__CLBMobileKeybagManager_unlockWithPasscode_error___block_invoke;
  v11[3] = &unk_2652802B8;
  id v8 = v6;
  v14 = &v16;
  uint64_t v15 = &v20;
  id v12 = v8;
  v13 = self;
  dispatch_sync(queue, v11);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

uint64_t __51__CLBMobileKeybagManager_unlockWithPasscode_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dataUsingEncoding:4];
  int v2 = MKBUnlockDevice();
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.clarityboard.mkb" code:v2 userInfo:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "_queue_updateLockedState");
}

- (id)registerLockStateChangedBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CLBMobileKeybagManager_registerLockStateChangedBlock___block_invoke;
  block[3] = &unk_2652802E0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_sync(queue, block);
  char v9 = v14;
  id v10 = v7;

  return v10;
}

void __56__CLBMobileKeybagManager_registerLockStateChangedBlock___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 48) copy];
  int v2 = _Block_copy(v3);
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)unregisterLockStateChangedBlockWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CLBMobileKeybagManager_unregisterLockStateChangedBlockWithIdentifier___block_invoke;
  v7[3] = &unk_265280308;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __72__CLBMobileKeybagManager_unregisterLockStateChangedBlockWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)registerFirstUnlockBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08C38] UUID];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CLBMobileKeybagManager_registerFirstUnlockBlock___block_invoke;
  block[3] = &unk_2652802E0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_sync(queue, block);
  char v9 = v14;
  id v10 = v7;

  return v10;
}

void __51__CLBMobileKeybagManager_registerFirstUnlockBlock___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 48) copy];
  int v2 = _Block_copy(v3);
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)unregisterFirstUnlockBlockWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__CLBMobileKeybagManager_unregisterFirstUnlockBlockWithIdentifier___block_invoke;
  v7[3] = &unk_265280308;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __67__CLBMobileKeybagManager_unregisterFirstUnlockBlockWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)_handleKeybagStatusChanged
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F32038] commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249EC5000, v3, OS_LOG_TYPE_DEFAULT, "Handle keybag status changed", buf, 2u);
  }

  BSDispatchQueueAssert();
  *(void *)buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CLBMobileKeybagManager__handleKeybagStatusChanged__block_invoke;
  block[3] = &unk_265280290;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(queue, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = *((id *)v15 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __52__CLBMobileKeybagManager__handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_queue_updateLockedState");
}

- (void)_handleFirstUnlock
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F32038] commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249EC5000, v3, OS_LOG_TYPE_DEFAULT, "Handle first unlock", buf, 2u);
  }

  BSDispatchQueueAssert();
  *(void *)buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CLBMobileKeybagManager__handleFirstUnlock__block_invoke;
  block[3] = &unk_265280290;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(queue, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = *((id *)v15 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __44__CLBMobileKeybagManager__handleFirstUnlock__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) allValues];

  return MEMORY[0x270F9A758]();
}

- (void)_queue_updateLockedState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  uint64_t v3 = (NSDictionary *)MKBGetDeviceLockStateInfo();
  lockedState = self->_lockedState;
  self->_lockedState = v3;

  id v5 = [MEMORY[0x263F32038] commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(CLBMobileKeybagManager *)self _lockStateFromDictionary:self->_lockedState];
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown: %ld", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_265280328[v6];
    }
    *(_DWORD *)buf = 138412290;
    long long v9 = v7;
    _os_log_impl(&dword_249EC5000, v5, OS_LOG_TYPE_DEFAULT, "Locked state: %@", buf, 0xCu);
  }
}

- (int64_t)_lockStateFromDictionary:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:*MEMORY[0x263F55A58]];
  unint64_t v4 = [v3 integerValue];
  int64_t v5 = v4;
  if (v4 <= 7) {
    int64_t v5 = qword_249ED3B58[v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_stateChangedCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_lockedState, 0);
}

@end