@interface GEOKeyBagNotification
+ (BOOL)canAccessFilesWithProtection:(unint64_t)a3;
+ (GEOKeyBagNotification)sharedObject;
- (BOOL)addDataDidBecomeAvailableAfterFirstUnlockObserver:(id)a3;
- (BOOL)canAccessFilesWithProtection:(unint64_t)a3;
- (GEOKeyBagNotification)init;
- (int)state;
- (void)_statusChangedAfterFirstUnlock;
- (void)_statusChangedBeforeFirstUnlock;
- (void)dealloc;
- (void)runAfterFirstUnlock:(id)a3 block:(id)a4;
- (void)updateState;
@end

@implementation GEOKeyBagNotification

+ (BOOL)canAccessFilesWithProtection:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  unint64_t v3 = a3;
  v4 = [a1 sharedObject];
  LOBYTE(v3) = [v4 canAccessFilesWithProtection:v3];

  return v3;
}

- (BOOL)canAccessFilesWithProtection:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 3 || (int v4 = MKBDeviceUnlockedSinceBoot(), v4 != 1)) {
      LOBYTE(v4) = [(GEOKeyBagNotification *)self state] == 0;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (GEOKeyBagNotification)sharedObject
{
  if (qword_1EB29F8C8 != -1) {
    dispatch_once(&qword_1EB29F8C8, &__block_literal_global_60);
  }
  v2 = (void *)_MergedGlobals_219;

  return (GEOKeyBagNotification *)v2;
}

void __37__GEOKeyBagNotification_sharedObject__block_invoke()
{
  v0 = objc_alloc_init(GEOKeyBagNotification);
  v1 = (void *)_MergedGlobals_219;
  _MergedGlobals_219 = (uint64_t)v0;
}

- (GEOKeyBagNotification)init
{
  v14.receiver = self;
  v14.super_class = (Class)GEOKeyBagNotification;
  v2 = [(GEOKeyBagNotification *)&v14 init];
  unint64_t v3 = v2;
  if (v2)
  {
    [(GEOKeyBagNotification *)v2 updateState];
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__30;
    v12[4] = __Block_byref_object_dispose__30;
    int v4 = v3;
    v13 = v4;
    v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__GEOKeyBagNotification_init__block_invoke;
    handler[3] = &unk_1E53DFD08;
    handler[4] = v12;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", v4 + 3, v5, handler);
    v7 = MEMORY[0x1E4F14428];

    v8 = (const char *)*MEMORY[0x1E4F78160];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__GEOKeyBagNotification_init__block_invoke_13;
    v10[3] = &unk_1E53DFD08;
    v10[4] = v12;
    notify_register_dispatch(v8, v4 + 4, v7, v10);

    _Block_object_dispose(v12, 8);
  }
  return v3;
}

- (void)updateState
{
  int v3 = MKBGetDeviceLockState();
  unsigned int v4 = 2 * (v3 == 1);
  if (v3 == 2) {
    unsigned int v4 = 1;
  }
  int currentState = self->_currentState;
  atomic_compare_exchange_strong(&self->_currentState, (unsigned int *)&currentState, v4);
}

- (int)state
{
  return self->_currentState;
}

uint64_t __29__GEOKeyBagNotification_init__block_invoke(uint64_t a1)
{
  v2 = GEOGetKeyBagLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "kMobileKeyBagFirstUnlockNotificationID", v4, 2u);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _statusChangedBeforeFirstUnlock];
}

uint64_t __29__GEOKeyBagNotification_init__block_invoke_13(uint64_t a1)
{
  v2 = GEOGetKeyBagLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "kMobileKeyBagLockStatusNotifyToken", v4, 2u);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _statusChangedAfterFirstUnlock];
}

- (void)dealloc
{
  notify_cancel(self->_notifyTokenAfterFirstUnlock);
  notify_cancel(self->_notifyTokenBeforeFirstUnlock);
  v3.receiver = self;
  v3.super_class = (Class)GEOKeyBagNotification;
  [(GEOKeyBagNotification *)&v3 dealloc];
}

- (void)_statusChangedBeforeFirstUnlock
{
  [(GEOKeyBagNotification *)self updateState];
  objc_super v3 = GEOGetKeyBagLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "State changed, posting first-unlock notification", v5, 2u);
  }

  unsigned int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"GEODeviceFirstUnlockedNotification" object:self userInfo:0];
}

- (void)_statusChangedAfterFirstUnlock
{
  int v3 = [(GEOKeyBagNotification *)self state];
  [(GEOKeyBagNotification *)self updateState];
  int v4 = [(GEOKeyBagNotification *)self state];
  if (v3 != v4)
  {
    if (v4 == 2)
    {
      v9 = GEOGetKeyBagLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "State changed, posting locked notification", v12, 2u);
      }

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v7 = v6;
      v8 = @"GEODeviceLockedNotification";
    }
    else if (v4 == 1)
    {
      v5 = GEOGetKeyBagLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "State changed, posting locking notification", buf, 2u);
      }

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v7 = v6;
      v8 = @"GEODeviceLockingNotification";
    }
    else
    {
      v10 = GEOGetKeyBagLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "State changed, posting unlocked notification", v11, 2u);
      }

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v7 = v6;
      v8 = @"GEODeviceUnlockedNotification";
    }
    [v6 postNotificationName:v8 object:self userInfo:0];
  }
}

- (BOOL)addDataDidBecomeAvailableAfterFirstUnlockObserver:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(GEOKeyBagNotification *)self canAccessFilesWithProtection:3])
  {
    v5 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Already unlocked.", buf, 2u);
    }

    BOOL v6 = 0;
  }
  else
  {
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__30;
    v21 = __Block_byref_object_dispose__30;
    id v22 = 0;
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke;
    v14[3] = &unk_1E53DFD30;
    v16 = buf;
    id v8 = v4;
    id v15 = v8;
    uint64_t v9 = [v7 addObserverForName:@"GEODeviceFirstUnlockedNotification" object:self queue:0 usingBlock:v14];
    v10 = (void *)*((void *)v18 + 5);
    *((void *)v18 + 5) = v9;

    uint64_t v11 = *((void *)v18 + 5);
    BOOL v6 = v11 != 0;
    if (v11)
    {
      v12 = GEOGetKeyBagLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v23 = 134217984;
        id v24 = v8;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Added observer %p", v23, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  return v6;
}

void __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    v7 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Calling observer %p", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke_17;
    v11[3] = &unk_1E53D8998;
    v12 = *(id *)(a1 + 32);
    id v13 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v9 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v10;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "NOT calling observer %p. The token is nil?!", buf, 0xCu);
    }
  }
}

uint64_t __75__GEOKeyBagNotification_addDataDidBecomeAvailableAfterFirstUnlockObserver___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) protectedDataDidBecomeAvailable:*(void *)(a1 + 40)];
}

- (void)runAfterFirstUnlock:(id)a3 block:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  global_queue = a3;
  id v7 = a4;
  if (!global_queue) {
    global_queue = geo_get_global_queue();
  }
  if ([(GEOKeyBagNotification *)self canAccessFilesWithProtection:3])
  {
    uint64_t v8 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Already unlocked.", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke;
    block[3] = &unk_1E53DA028;
    id v9 = v7;
    id v27 = v9;
    dispatch_async(global_queue, block);
  }
  else
  {
    uint64_t v10 = (void *)[v7 copy];

    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__30;
    id v24 = __Block_byref_object_dispose__30;
    id v25 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_2;
    v16[3] = &unk_1E53DFD58;
    uint64_t v19 = buf;
    id v9 = v10;
    id v18 = v9;
    v17 = global_queue;
    uint64_t v12 = [v11 addObserverForName:@"GEODeviceFirstUnlockedNotification" object:self queue:0 usingBlock:v16];
    id v13 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v12;

    if (*((void *)v21 + 5))
    {
      objc_super v14 = GEOGetKeyBagLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = (void *)MEMORY[0x18C120660](v9);
        *(_DWORD *)v28 = 134217984;
        v29 = v15;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Added block observer: %p", v28, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

uint64_t __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  if (v3)
  {
    *(void *)(v2 + 40) = 0;

    id v4 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (void *)MEMORY[0x18C120660](*(void *)(a1 + 40));
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Calling block observer: %p", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_19;
    block[3] = &unk_1E53DA028;
    BOOL v6 = *(NSObject **)(a1 + 32);
    uint64_t v10 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    id v7 = v10;
  }
  else
  {
    id v7 = GEOGetKeyBagLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)MEMORY[0x18C120660](*(void *)(a1 + 40));
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "NOT calling block observer %p. The token is nil?!", buf, 0xCu);
    }
  }
}

uint64_t __51__GEOKeyBagNotification_runAfterFirstUnlock_block___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end