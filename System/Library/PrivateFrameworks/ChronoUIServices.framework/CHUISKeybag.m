@interface CHUISKeybag
+ (id)sharedInstance;
- (BOOL)isEffectivelyLocked:(int64_t)a3;
- (CHUISKeybag)init;
- (void)_queue_evaluateState;
- (void)_queue_handleKeybagStatusChanged;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CHUISKeybag

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global);
  }
  v2 = (void *)sharedInstance___keybag;

  return v2;
}

void __29__CHUISKeybag_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CHUISKeybag);
  v1 = (void *)sharedInstance___keybag;
  sharedInstance___keybag = (uint64_t)v0;
}

- (CHUISKeybag)init
{
  v17.receiver = self;
  v17.super_class = (Class)CHUISKeybag;
  v2 = [(CHUISKeybag *)&v17 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __19__CHUISKeybag_init__block_invoke;
    v14 = &unk_1E62AF4C0;
    objc_copyWeak(&v15, &location);
    v2->_mkbRegistrationToken = (_MKBEvent *)MKBEventsRegister();
    v7 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__CHUISKeybag_init__block_invoke_2;
    block[3] = &unk_1E62AF4E8;
    v10 = v2;
    dispatch_sync(v7, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__CHUISKeybag_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 1 && WeakRetained) {
    objc_msgSend(WeakRetained, "_queue_handleKeybagStatusChanged");
  }
}

uint64_t __19__CHUISKeybag_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleKeybagStatusChanged");
}

- (BOOL)isEffectivelyLocked:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CHUISKeybag_isEffectivelyLocked___block_invoke;
  block[3] = &unk_1E62AF510;
  block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__35__CHUISKeybag_isEffectivelyLocked___block_invoke(void *result)
{
  uint64_t v1 = 40;
  if (result[6]) {
    uint64_t v1 = 41;
  }
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + v1);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CHUISKeybag.m", 89, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CHUISKeybag_addObserver___block_invoke;
  block[3] = &unk_1E62AF538;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __27__CHUISKeybag_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CHUISKeybag.m", 101, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CHUISKeybag_removeObserver___block_invoke;
  block[3] = &unk_1E62AF538;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __30__CHUISKeybag_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_handleKeybagStatusChanged
{
  BSDispatchQueueAssert();
  [(CHUISKeybag *)self _queue_evaluateState];
  uint64_t v3 = (void *)[(NSHashTable *)self->_queue_observers copy];
  if ([v3 count])
  {
    calloutQueue = self->_calloutQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__CHUISKeybag__queue_handleKeybagStatusChanged__block_invoke;
    v5[3] = &unk_1E62AF538;
    id v6 = v3;
    id v7 = self;
    dispatch_async(calloutQueue, v5);
  }
}

void __47__CHUISKeybag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "keybagStateDidChange:", *(void *)(a1 + 40), (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_queue_evaluateState
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_super v17 = @"ExtendedDeviceLockState";
  v18[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v4 = (void *)MKBGetDeviceLockStateInfo();
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F78130]];
  unint64_t v6 = [v5 integerValue];

  BOOL v7 = v6 < 7;
  unsigned int v8 = v7 & (0x46u >> v6);
  BOOL v9 = v7 & (6u >> v6);
  if (!BSEqualBools() || (BSEqualBools() & 1) == 0)
  {
    self->_queue_isEffectivelyLocked = v8;
    self->_queue_isEffectivelyLockedAuthentic = v9;
    long long v10 = CHUISLogKeybag();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"YES";
      if (self->_queue_isEffectivelyLocked) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (!self->_queue_isEffectivelyLockedAuthentic) {
        uint64_t v11 = @"NO";
      }
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1BC3F1000, v10, OS_LOG_TYPE_DEFAULT, "Keybag state changed - locked default policy? %{public}@, locked authentic policy? %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end