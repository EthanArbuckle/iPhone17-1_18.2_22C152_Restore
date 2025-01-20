@interface _DPDataProtectionMaster
+ (id)sharedInstance;
- (BOOL)deviceFormatedForContentProtection;
- (BOOL)deviceHasBeenUnlockedSinceBoot;
- (BOOL)deviceIsLocked;
- (BOOL)deviceIsPasswordConfigured;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)isDataAvailableForClassA;
- (BOOL)isDataAvailableForClassC;
- (BOOL)notifyEnabled;
- (NSMutableDictionary)availableState;
- (NSMutableDictionary)handlers;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)stateQueue;
- (_DPDataProtectionMaster)init;
- (id)registerStateChangeHandler:(id)a3;
- (int)notifyToken;
- (void)dealloc;
- (void)deregisterStateChangeHandler:(id)a3;
- (void)handleKeyBagLockNotification;
@end

@implementation _DPDataProtectionMaster

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___DPDataProtectionMaster_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

- (_DPDataProtectionMaster)init
{
  v34.receiver = self;
  v34.super_class = (Class)_DPDataProtectionMaster;
  v2 = [(_DPDataProtectionMaster *)&v34 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.DifferentialPrivacy.DataProtection.state", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v2->_deviceFormatedForContentProtection = 0;
    v6 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v7;

    uint64_t v9 = [v6 mutableCopy];
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v9;

    v11 = v2->_availableState;
    v12 = +[_DPDataProtectionStateMonitor dataProtectionClassA];
    [(NSMutableDictionary *)v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v12];

    v13 = v2->_availableState;
    v14 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    uint64_t v15 = MEMORY[0x1E4F1CC38];
    [(NSMutableDictionary *)v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v14];

    v16 = v2->_availableState;
    v17 = +[_DPDataProtectionStateMonitor dataProtectionClassD];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

    int v18 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v18 == 1;
    if (v18 == 1)
    {
      v19 = v2->_availableState;
      v20 = +[_DPDataProtectionStateMonitor dataProtectionClassA];
      [(NSMutableDictionary *)v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v20];

      v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_DPDataProtectionMaster isDataAvailableForClassC](v2, "isDataAvailableForClassC"));
      v22 = v2->_availableState;
      v23 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
      [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];

      v24 = v2->_availableState;
      v25 = +[_DPDataProtectionStateMonitor dataProtectionClassD];
      [(NSMutableDictionary *)v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v25];

      v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v27 = dispatch_queue_create("com.apple.DifferentialPrivacy.DataProtection.notify", v26);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v27;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v29 = v2->_notifyQueue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __31___DPDataProtectionMaster_init__block_invoke;
      v31[3] = &unk_1E6C44698;
      objc_copyWeak(&v32, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v29, v31);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)dealloc
{
  if (self->_notifyEnabled)
  {
    int notifyToken = self->_notifyToken;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34___DPDataProtectionMaster_dealloc__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    int v7 = notifyToken;
    dispatch_sync(stateQueue, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)_DPDataProtectionMaster;
  [(_DPDataProtectionMaster *)&v5 dealloc];
}

- (void)handleKeyBagLockNotification
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__7;
  v34[4] = __Block_byref_object_dispose__7;
  id v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__7;
  id v32 = __Block_byref_object_dispose__7;
  id v33 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke;
  block[3] = &unk_1E6C446E0;
  void block[4] = self;
  void block[5] = v34;
  block[6] = &v28;
  dispatch_sync(stateQueue, block);
  dispatch_queue_t v4 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  objc_super v5 = self->_stateQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55___DPDataProtectionMaster_handleKeyBagLockNotification__block_invoke_2;
  v24[3] = &unk_1E6C44708;
  v26 = v34;
  v24[4] = self;
  id v6 = v4;
  id v25 = v6;
  dispatch_sync(v5, v24);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v10)];
        [v11 BOOLValue];

        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v12 = (id)v29[5];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v17;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v12);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
            }
            while (v13 != v15);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
          }
          while (v13);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (BOOL)deviceIsPasswordConfigured
{
  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  dispatch_queue_t v4 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

- (BOOL)deviceIsLocked
{
  v2 = (const void *)MGCopyAnswer();
  v3 = v2;
  dispatch_queue_t v4 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

- (BOOL)isDataAvailableForClassC
{
  if ([(_DPDataProtectionMaster *)self deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_DPDataProtectionMaster *)self deviceIsPasswordConfigured];
  }
}

- (BOOL)isDataAvailableForClassA
{
  if ([(_DPDataProtectionMaster *)self deviceIsLocked]) {
    return ![(_DPDataProtectionMaster *)self deviceIsPasswordConfigured];
  }
  else {
    return 1;
  }
}

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46___DPDataProtectionMaster_isDataAvailableFor___block_invoke;
    block[3] = &unk_1E6C44730;
    void block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(stateQueue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)registerStateChangeHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F29128] UUID];
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54___DPDataProtectionMaster_registerStateChangeHandler___block_invoke;
    block[3] = &unk_1E6C44758;
    void block[4] = self;
    id v7 = v5;
    id v12 = v7;
    id v13 = v4;
    dispatch_sync(stateQueue, block);
    uint64_t v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)deregisterStateChangeHandler:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___DPDataProtectionMaster_deregisterStateChangeHandler___block_invoke;
  v7[3] = &unk_1E6C440C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)deviceFormatedForContentProtection
{
  return self->_deviceFormatedForContentProtection;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)availableState
{
  return self->_availableState;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end