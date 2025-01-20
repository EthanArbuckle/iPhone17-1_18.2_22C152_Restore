@interface _OSDataProtectionManager
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
- (_OSDataProtectionManager)init;
- (id)registerStateChangeHandler:(id)a3;
- (int)notifyToken;
- (void)deregisterStateChangeHandler:(id)a3;
- (void)handleKeyBagLockNotification;
@end

@implementation _OSDataProtectionManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42___OSDataProtectionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (_OSDataProtectionManager)init
{
  v32.receiver = self;
  v32.super_class = (Class)_OSDataProtectionManager;
  v2 = [(_OSDataProtectionManager *)&v32 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    v2->_deviceFormatedForContentProtection = 0;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v7;

    v9 = v2->_availableState;
    v10 = +[_OSDataProtectionStateMonitor dataProtectionClassA];
    uint64_t v11 = MEMORY[0x263EFFA88];
    [(NSMutableDictionary *)v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v10];

    v12 = v2->_availableState;
    v13 = +[_OSDataProtectionStateMonitor dataProtectionClassC];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    v14 = v2->_availableState;
    v15 = +[_OSDataProtectionStateMonitor dataProtectionClassD];
    [(NSMutableDictionary *)v14 setObject:v11 forKeyedSubscript:v15];

    int v16 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v16 != 0;
    if (v16)
    {
      v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_OSDataProtectionManager isDataAvailableForClassA](v2, "isDataAvailableForClassA"));
      v18 = v2->_availableState;
      v19 = +[_OSDataProtectionStateMonitor dataProtectionClassA];
      [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

      v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_OSDataProtectionManager isDataAvailableForClassC](v2, "isDataAvailableForClassC"));
      v21 = v2->_availableState;
      v22 = +[_OSDataProtectionStateMonitor dataProtectionClassC];
      [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

      v23 = v2->_availableState;
      v24 = +[_OSDataProtectionStateMonitor dataProtectionClassD];
      [(NSMutableDictionary *)v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v24];

      dispatch_queue_t v25 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.notify", 0);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v25;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v27 = v2->_notifyQueue;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __32___OSDataProtectionManager_init__block_invoke;
      v29[3] = &unk_264937490;
      objc_copyWeak(&v30, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v27, v29);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)handleKeyBagLockNotification
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  objc_super v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke;
  block[3] = &unk_2649374B8;
  block[4] = self;
  void block[5] = v34;
  block[6] = &v28;
  dispatch_sync(stateQueue, block);
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = self->_stateQueue;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke_2;
  v24[3] = &unk_2649374E0;
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
        uint64_t v11 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v10)];
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
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)deviceIsPasswordConfigured
{
  v2 = (const void *)MGCopyAnswer();
  dispatch_queue_t v3 = v2;
  v4 = (const void *)*MEMORY[0x263EFFB40];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

- (BOOL)deviceIsLocked
{
  v2 = (const void *)MGCopyAnswer();
  dispatch_queue_t v3 = v2;
  v4 = (const void *)*MEMORY[0x263EFFB40];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

- (BOOL)isDataAvailableForClassC
{
  if ([(_OSDataProtectionManager *)self deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_OSDataProtectionManager *)self deviceIsPasswordConfigured];
  }
}

- (BOOL)isDataAvailableForClassA
{
  if ([(_OSDataProtectionManager *)self deviceIsLocked]) {
    return ![(_OSDataProtectionManager *)self deviceIsPasswordConfigured];
  }
  else {
    return 1;
  }
}

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47___OSDataProtectionManager_isDataAvailableFor___block_invoke;
    block[3] = &unk_264937508;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
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
    uint64_t v5 = [MEMORY[0x263F08C38] UUID];
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55___OSDataProtectionManager_registerStateChangeHandler___block_invoke;
    block[3] = &unk_264937530;
    block[4] = self;
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57___OSDataProtectionManager_deregisterStateChangeHandler___block_invoke;
  v7[3] = &unk_264937558;
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