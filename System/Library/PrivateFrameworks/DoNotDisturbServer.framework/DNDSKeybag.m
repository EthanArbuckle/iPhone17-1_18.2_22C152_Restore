@interface DNDSKeybag
+ (id)sharedInstance;
- (BOOL)_hasUnlockedSinceBootForObserver:(id)a3;
- (BOOL)hasUnlockedSinceBoot;
- (BOOL)isLocked;
- (DNDSKeybag)init;
- (void)_beginObservingKeybag;
- (void)_queue_handleFirstUnlock;
- (void)_queue_handleKeybagStatusChanged;
- (void)addObserver:(id)a3;
- (void)addPriorityObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation DNDSKeybag

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_39);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __28__DNDSKeybag_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DNDSKeybag);
  uint64_t v1 = sharedInstance_shared_0;
  sharedInstance_shared_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (DNDSKeybag)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSKeybag;
  v2 = [(DNDSKeybag *)&v8 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_queue_hasUnlockedSinceBoot = MKBDeviceUnlockedSinceBoot() != 0;
    [(DNDSKeybag *)v2 _beginObservingKeybag];
  }
  return v2;
}

- (void)dealloc
{
  MKBEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)DNDSKeybag;
  [(DNDSKeybag *)&v3 dealloc];
}

- (BOOL)isLocked
{
  unsigned int v2 = MKBGetDeviceLockState();
  return (v2 < 5) & (0x16u >> v2);
}

- (BOOL)hasUnlockedSinceBoot
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__DNDSKeybag_hasUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DNDSKeybag_hasUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (BOOL)_hasUnlockedSinceBootForObserver:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke;
  block[3] = &unk_1E6974318;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke_2;
  v5[3] = &unk_1E6975608;
  id v6 = *(id *)(a1 + 40);
  int v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", v5);

  uint64_t v4 = 48;
  if (v3) {
    uint64_t v4 = 32;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + v4);
}

BOOL __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__DNDSKeybag_addObserver___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __26__DNDSKeybag_addObserver___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)addPriorityObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__DNDSKeybag_addPriorityObserver___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __34__DNDSKeybag_addPriorityObserver___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__DNDSKeybag_removeObserver___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __29__DNDSKeybag_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

- (void)_beginObservingKeybag
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  self->_mbkEvent = (_MKBEvent *)MKBEventsRegister();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __35__DNDSKeybag__beginObservingKeybag__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_6;
    }
    id v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_handleKeybagStatusChanged");
  }
  else
  {
    id v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_handleFirstUnlock");
  }
  id WeakRetained = v4;
LABEL_6:
}

- (void)_queue_handleKeybagStatusChanged
{
  uint64_t v3 = [(NSHashTable *)self->_queue_priorityObservers allObjects];
  id v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v6 = (void *)v3;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  uint64_t v8 = [(NSHashTable *)self->_queue_observers allObjects];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v5;
  }
  uint64_t v11 = [v7 arrayByAddingObjectsFromArray:v10];

  v12 = DNDSLogKeybag;
  if (os_log_type_enabled((os_log_t)DNDSLogKeybag, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "State changed", buf, 2u);
  }
  calloutQueue = self->_calloutQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__DNDSKeybag__queue_handleKeybagStatusChanged__block_invoke;
  v15[3] = &unk_1E69735B8;
  id v16 = v11;
  v17 = self;
  id v14 = v11;
  dispatch_async(calloutQueue, v15);
}

void __46__DNDSKeybag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "keybagDidChangeState:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_queue_handleFirstUnlock
{
  uint64_t v3 = DNDSLogKeybag;
  if (os_log_type_enabled((os_log_t)DNDSLogKeybag, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "First unlock occurred", (uint8_t *)buf, 2u);
  }
  uint64_t v4 = [(NSHashTable *)self->_queue_priorityObservers allObjects];
  uint64_t v5 = [(NSHashTable *)self->_queue_observers allObjects];
  objc_initWeak(buf, self);
  calloutQueue = self->_calloutQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke;
  v9[3] = &unk_1E6975658;
  objc_copyWeak(&v13, buf);
  id v10 = v4;
  long long v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(calloutQueue, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_2;
    block[3] = &unk_1E6973540;
    block[4] = v3;
    dispatch_sync(v4, block);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 keybagDidUnlockForTheFirstTime:*(void *)(a1 + 40)];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v7);
    }

    long long v11 = v3[2];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_3;
    v22[3] = &unk_1E6973540;
    v22[4] = v3;
    dispatch_sync(v11, v22);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v17, "keybagDidUnlockForTheFirstTime:", *(void *)(a1 + 40), (void)v18);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v14);
    }
  }
}

uint64_t __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

uint64_t __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_priorityObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end