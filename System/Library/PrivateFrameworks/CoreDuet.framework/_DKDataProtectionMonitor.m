@interface _DKDataProtectionMonitor
+ (id)sharedInstance;
- (BOOL)deviceIsLocked;
- (BOOL)deviceIsPasswordConfigured;
- (BOOL)isDataAvailableForClassC;
- (_DKDataProtectionMonitor)init;
- (id)registerStateChangeHandler:(uint64_t)a1;
- (uint64_t)isDataAvailableFor:(uint64_t)a1;
- (uint64_t)isDataAvailableForClassA;
- (void)dealloc;
- (void)deregisterStateChangeHandler:(uint64_t)a1;
- (void)handleKeyBagLockNotification;
@end

@implementation _DKDataProtectionMonitor

- (id)registerStateChangeHandler:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___DKDataProtectionMonitor_registerStateChangeHandler___block_invoke;
    block[3] = &unk_1E560E4E0;
    block[4] = a1;
    id v8 = v6;
    id v12 = v8;
    id v13 = v4;
    dispatch_sync(v7, block);
    v9 = v13;
    id v5 = v8;
  }
  return v5;
}

- (void)deregisterStateChangeHandler:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57___DKDataProtectionMonitor_deregisterStateChangeHandler___block_invoke;
    v6[3] = &unk_1E560D848;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

+ (id)sharedInstance
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DKDataProtectionMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v1 = (void *)sharedInstance_instance_1;
  return v1;
}

- (uint64_t)isDataAvailableFor:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 0;
      id v5 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47___DKDataProtectionMonitor_isDataAvailableFor___block_invoke;
      block[3] = &unk_1E560E960;
      block[4] = a1;
      id v8 = v3;
      v9 = &v10;
      dispatch_sync(v5, block);
      a1 = *((unsigned char *)v11 + 24) != 0;

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (_DKDataProtectionMonitor)init
{
  v30.receiver = self;
  v30.super_class = (Class)_DKDataProtectionMonitor;
  v2 = [(_DKDataProtectionMonitor *)&v30 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreduet.dp.state", v7);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v8;

    v2->_deviceFormatedForContentProtection = 0;
    uint64_t v10 = *MEMORY[0x1E4F28340];
    uint64_t v11 = MEMORY[0x1E4F1CC38];
    [(NSMutableDictionary *)v2->_availableState setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F28340]];
    uint64_t v12 = *MEMORY[0x1E4F28358];
    [(NSMutableDictionary *)v2->_availableState setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28358]];
    uint64_t v13 = *MEMORY[0x1E4F28378];
    [(NSMutableDictionary *)v2->_availableState setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28378]];
    int v14 = slMKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v14 != 0;
    if (v14)
    {
      v15 = NSNumber;
      BOOL v16 = !-[_DKDataProtectionMonitor deviceIsLocked]((uint64_t)v2)
         || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured]((uint64_t)v2);
      v17 = [v15 numberWithBool:v16];
      [(NSMutableDictionary *)v2->_availableState setObject:v17 forKeyedSubscript:v10];

      v18 = NSNumber;
      int v19 = slMKBDeviceUnlockedSinceBoot();
      BOOL v20 = 1;
      if (!v19) {
        BOOL v20 = !-[_DKDataProtectionMonitor deviceIsPasswordConfigured]((uint64_t)v2);
      }
      v21 = [v18 numberWithBool:v20];
      [(NSMutableDictionary *)v2->_availableState setObject:v21 forKeyedSubscript:v12];

      [(NSMutableDictionary *)v2->_availableState setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
      v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v23 = dispatch_queue_create("com.apple.coreduet.dp.notify", v22);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v23;

      v2->_notifyToken = 0;
      v2->_notifyEnabled = 1;
      objc_initWeak(&location, v2);
      v25 = v2->_notifyQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __32___DKDataProtectionMonitor_init__block_invoke;
      v27[3] = &unk_1E560EEE8;
      objc_copyWeak(&v28, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v25, v27);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (uint64_t)isDataAvailableForClassA
{
  if (result)
  {
    uint64_t v1 = result;
    return !-[_DKDataProtectionMonitor deviceIsLocked](result)
        || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured](v1);
  }
  return result;
}

- (BOOL)isDataAvailableForClassC
{
  if (result)
  {
    uint64_t v1 = result;
    return slMKBDeviceUnlockedSinceBoot() || !-[_DKDataProtectionMonitor deviceIsPasswordConfigured](v1);
  }
  return result;
}

- (void)handleKeyBagLockNotification
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = _os_activity_create(&dword_18ECEB000, "Duet: _DKDataProtectionMonitor handleKeyBagLockNotification", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    os_activity_scope_leave(&state);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__27;
    v37 = __Block_byref_object_dispose__27;
    id v38 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__27;
    v32 = __Block_byref_object_dispose__27;
    id v33 = 0;
    uint64_t v22 = 0;
    dispatch_queue_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__27;
    v26 = __Block_byref_object_dispose__27;
    id v27 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56___DKDataProtectionMonitor_handleKeyBagLockNotification__block_invoke;
    block[3] = &unk_1E5610A98;
    block[4] = a1;
    void block[5] = &state;
    block[6] = &v28;
    block[7] = &v22;
    dispatch_sync(v3, block);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = (id)v23[5];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v4);
          }
          dispatch_queue_t v8 = [(id)v23[5] objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * v7)];
          [v8 BOOLValue];

          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          id v9 = (id)v29[5];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v39 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v14;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v14 != v11) {
                  objc_enumerationMutation(v9);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
              }
              while (v10 != v12);
              uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v39 count:16];
            }
            while (v10);
          }

          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v40 count:16];
      }
      while (v5);
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&state, 8);
  }
}

- (void)dealloc
{
  if (self->_notifyEnabled)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35___DKDataProtectionMonitor_dealloc__block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKDataProtectionMonitor;
  [(_DKDataProtectionMonitor *)&v4 dealloc];
}

- (BOOL)deviceIsPasswordConfigured
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (const void *)slMGCopyAnswer(@"PasswordConfigured", 0);
  BOOL v2 = v1 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

- (BOOL)deviceIsLocked
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (const void *)slMGCopyAnswer(@"PasswordProtected", 0);
  BOOL v2 = v1 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end