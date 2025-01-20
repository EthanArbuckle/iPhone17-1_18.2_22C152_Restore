@interface SleepAssertionManager
+ (id)sharedManager;
- (BOOL)applePencilSleepAssertionHeld;
- (BOOL)eaSleepAssertionHeld;
- (BOOL)mfi4SleepAssertionHeld;
- (BOOL)sleepAssertionHeld;
- (NSMutableDictionary)assertions;
- (OS_dispatch_queue)applePencilSleepAssertionTimerQueue;
- (OS_dispatch_queue)mfi4SleepAssertionTimerQueue;
- (OS_dispatch_queue)sleepAssertionsLock;
- (OS_dispatch_source)applePencilSleepAssertionTimer;
- (OS_dispatch_source)mfi4SleepAssertionTimer;
- (SleepAssertionManager)init;
- (unsigned)applePencilSleepAssertionID;
- (unsigned)eaSleepAssertionID;
- (unsigned)mfi4SleepAssertionID;
- (void)createApplePencilSleepAssertion;
- (void)createEASleepAssertion;
- (void)createMFi4SleepAssertion;
- (void)createSleepAssertionForUUID:(id)a3;
- (void)dealloc;
- (void)destroySleepAssertionForUUID:(id)a3;
- (void)removeApplePencilSleepAssertion;
- (void)removeEASleepAssertion;
- (void)removeMFi4SleepAssertion;
- (void)setApplePencilSleepAssertionHeld:(BOOL)a3;
- (void)setApplePencilSleepAssertionID:(unsigned int)a3;
- (void)setApplePencilSleepAssertionTimer:(id)a3;
- (void)setApplePencilSleepAssertionTimerQueue:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setEaSleepAssertionHeld:(BOOL)a3;
- (void)setEaSleepAssertionID:(unsigned int)a3;
- (void)setMfi4SleepAssertionHeld:(BOOL)a3;
- (void)setMfi4SleepAssertionID:(unsigned int)a3;
- (void)setMfi4SleepAssertionTimer:(id)a3;
- (void)setMfi4SleepAssertionTimerQueue:(id)a3;
- (void)setSleepAssertionHeld:(BOOL)a3;
- (void)setSleepAssertionsLock:(id)a3;
@end

@implementation SleepAssertionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SleepAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __38__SleepAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SleepAssertionManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)SleepAssertionManager;
  v2 = [(SleepAssertionManager *)&v24 init];
  v3 = v2;
  if (v2)
  {
    assertions = v2->_assertions;
    v2->_assertions = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.sleepAssertionQ", 0);
    sleepAssertionsLock = v3->_sleepAssertionsLock;
    v3->_sleepAssertionsLock = (OS_dispatch_queue *)v5;

    *(_WORD *)&v3->_eaSleepAssertionHeld = 0;
    v3->_mfi4SleepAssertionHeld = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.applePencilSleepAssertionTimerQ", 0);
    applePencilSleepAssertionTimerQueue = v3->_applePencilSleepAssertionTimerQueue;
    v3->_applePencilSleepAssertionTimerQueue = (OS_dispatch_queue *)v7;

    v9 = (const dispatch_source_type_s *)MEMORY[0x263EF8400];
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v3->_applePencilSleepAssertionTimerQueue);
    applePencilSleepAssertionTimer = v3->_applePencilSleepAssertionTimer;
    v3->_applePencilSleepAssertionTimer = (OS_dispatch_source *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.mfi4SleepAssertionTimerQ", 0);
    mfi4SleepAssertionTimerQueue = v3->_mfi4SleepAssertionTimerQueue;
    v3->_mfi4SleepAssertionTimerQueue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create(v9, 0, 0, (dispatch_queue_t)v3->_mfi4SleepAssertionTimerQueue);
    mfi4SleepAssertionTimer = v3->_mfi4SleepAssertionTimer;
    v3->_mfi4SleepAssertionTimer = (OS_dispatch_source *)v14;

    v16 = v3->_applePencilSleepAssertionTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __29__SleepAssertionManager_init__block_invoke;
    handler[3] = &unk_2646682E8;
    v17 = v3;
    v23 = v17;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_source_set_timer((dispatch_source_t)v3->_applePencilSleepAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_applePencilSleepAssertionTimer);
    v18 = v3->_mfi4SleepAssertionTimer;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __29__SleepAssertionManager_init__block_invoke_4;
    v20[3] = &unk_2646682E8;
    v21 = v17;
    dispatch_source_set_event_handler(v18, v20);
    dispatch_source_set_timer((dispatch_source_t)v3->_mfi4SleepAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_mfi4SleepAssertionTimer);
  }
  return v3;
}

void __29__SleepAssertionManager_init__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_222C9E000, v4, OS_LOG_TYPE_DEFAULT, "Apple Pencil assertion timer expired!!", v5, 2u);
  }

  [*(id *)(a1 + 32) removeApplePencilSleepAssertion];
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __29__SleepAssertionManager_init__block_invoke_4(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_222C9E000, v4, OS_LOG_TYPE_DEFAULT, "MFi4 assertion timer expired!!", v5, 2u);
  }

  [*(id *)(a1 + 32) removeMFi4SleepAssertion];
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)dealloc
{
  id v3 = [(SleepAssertionManager *)self applePencilSleepAssertionTimer];

  if (v3)
  {
    v4 = [(SleepAssertionManager *)self applePencilSleepAssertionTimer];
    dispatch_source_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)SleepAssertionManager;
  [(SleepAssertionManager *)&v5 dealloc];
}

- (void)createSleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  sleepAssertionsLock = self->_sleepAssertionsLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke;
  v7[3] = &unk_264668310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sleepAssertionsLock, v7);
}

void __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  v23[4] = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) assertions];

  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 32) setAssertions:v3];
  }
  id v4 = [*(id *)(a1 + 32) assertions];
  objc_super v5 = [v4 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v6 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_INFO, "UUID: %@ has already taken a sleep assertion!!", buf, 0xCu);
    }
  }
  else
  {
    IOPMAssertionID AssertionID = 0;
    id v6 = [MEMORY[0x263F089D8] stringWithString:@"com.apple.accessoryd.acc-connected."];
    [v6 appendString:*(void *)(a1 + 40)];
    v22[0] = @"AssertType";
    v22[1] = @"AssertLevel";
    v23[0] = @"NoIdleSleepAssertion";
    v23[1] = &unk_26D59E280;
    v22[2] = @"AssertName";
    v22[3] = @"AllowsDeviceRestart";
    uint64_t v7 = *MEMORY[0x263EFFB40];
    v23[2] = v6;
    v23[3] = v7;
    CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    IOReturn v9 = IOPMAssertionCreateWithProperties(v8, &AssertionID);
    if (v9)
    {
      int v10 = v9;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        v11 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke_cold_2(v10, v11);
      }
    }
    else
    {
      dispatch_source_t v14 = [*(id *)(a1 + 32) assertions];
      v15 = [NSNumber numberWithUnsignedInt:AssertionID];
      [v14 setObject:v15 forKey:*(void *)(a1 + 40)];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        v11 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v18;
        _os_log_impl(&dword_222C9E000, v11, OS_LOG_TYPE_DEFAULT, "UUID:%@ has taken a sleep assertion!!", buf, 0xCu);
      }
    }
  }
}

- (void)destroySleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  sleepAssertionsLock = self->_sleepAssertionsLock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SleepAssertionManager_destroySleepAssertionForUUID___block_invoke;
  v7[3] = &unk_264668310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sleepAssertionsLock, v7);
}

void __54__SleepAssertionManager_destroySleepAssertionForUUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) assertions];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    IOPMAssertionRelease([v3 unsignedIntValue]);
    id v4 = [*(id *)(a1 + 32) assertions];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      objc_super v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      objc_super v5 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_DEFAULT, "UUID: %@ released sleep assertion!!", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)createEASleepAssertion
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR - couldn't take ea sleep assertion", v2, v3, v4, v5, v6);
}

- (void)removeEASleepAssertion
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR -  couldn't release ea sleep assertion", v2, v3, v4, v5, v6);
}

- (void)createApplePencilSleepAssertion
{
  uint64_t v3 = [(SleepAssertionManager *)self applePencilSleepAssertionTimerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke;
  block[3] = &unk_2646682E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke(uint64_t a1)
{
  v17[4] = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) applePencilSleepAssertionHeld] & 1) == 0)
  {
    v16[0] = @"AssertType";
    v16[1] = @"AssertLevel";
    v17[0] = @"NoIdleSleepAssertion";
    v17[1] = &unk_26D59E280;
    v16[2] = @"AssertName";
    v16[3] = @"AllowsDeviceRestart";
    uint64_t v2 = *MEMORY[0x263EFFB40];
    v17[2] = @"com.apple.accessoryd.applePencilAssertion";
    v17[3] = v2;
    CFDictionaryRef v3 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    IOReturn v4 = IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)(*(void *)(a1 + 32) + 16));
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects <= 0;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v7 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke_cold_3();
      }
    }
    else
    {
      if (v6)
      {
        int v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        int v8 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_DEFAULT, "Apple Pencil sleep assertion taken", v15, 2u);
      }

      v11 = [*(id *)(a1 + 32) applePencilSleepAssertionTimer];
      dispatch_time_t v12 = dispatch_walltime(0, 3600000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v13 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_222C9E000, v13, OS_LOG_TYPE_DEFAULT, "createApplePencilSleepAssertion starting assertion timer", v15, 2u);
      }

      [*(id *)(a1 + 32) setApplePencilSleepAssertionHeld:1];
    }
  }
}

- (void)removeApplePencilSleepAssertion
{
  CFDictionaryRef v3 = [(SleepAssertionManager *)self applePencilSleepAssertionTimerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke;
  block[3] = &unk_2646682E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) applePencilSleepAssertionHeld])
  {
    IOReturn v2 = IOPMAssertionRelease(*(_DWORD *)(*(void *)(a1 + 32) + 16));
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects <= 0;
    }
    else {
      BOOL v3 = 1;
    }
    int v4 = !v3;
    if (v2)
    {
      if (v4)
      {
        BOOL v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        BOOL v5 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke_cold_3();
      }
    }
    else
    {
      if (v4)
      {
        int v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        int v6 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEFAULT, "Apple Pencil sleep assertion released", buf, 2u);
      }

      id v9 = [*(id *)(a1 + 32) applePencilSleepAssertionTimer];
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v12 = 0;
        _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_DEFAULT, "removeApplePencilSleepAssertion stopping assertion timer", v12, 2u);
      }

      [*(id *)(a1 + 32) setApplePencilSleepAssertionHeld:0];
    }
  }
}

- (void)createMFi4SleepAssertion
{
  BOOL v3 = [(SleepAssertionManager *)self mfi4SleepAssertionTimerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke;
  block[3] = &unk_2646682E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke(uint64_t a1)
{
  v18[4] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) mfi4SleepAssertionHeld])
  {
    [*(id *)(a1 + 32) removeMFi4SleepAssertion];
    IOReturn v2 = *(void **)(a1 + 32);
    [v2 createMFi4SleepAssertion];
  }
  else
  {
    v17[0] = @"AssertType";
    v17[1] = @"AssertLevel";
    v18[0] = @"NoIdleSleepAssertion";
    v18[1] = &unk_26D59E280;
    v17[2] = @"AssertName";
    v17[3] = @"AllowsDeviceRestart";
    uint64_t v3 = *MEMORY[0x263EFFB40];
    v18[2] = @"com.apple.accessoryd.mfi4Assertion";
    v18[3] = v3;
    CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    IOReturn v5 = IOPMAssertionCreateWithProperties(v4, (IOPMAssertionID *)(*(void *)(a1 + 32) + 20));
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects <= 0;
    }
    else {
      BOOL v6 = 1;
    }
    int v7 = !v6;
    if (v5)
    {
      if (v7)
      {
        id v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v8 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke_cold_3();
      }
    }
    else
    {
      if (v7)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v9 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_DEFAULT, "MFi4 sleep assertion taken", v16, 2u);
      }

      dispatch_time_t v12 = [*(id *)(a1 + 32) mfi4SleepAssertionTimer];
      dispatch_time_t v13 = dispatch_walltime(0, 10000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v14 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "createMFi4SleepAssertion starting assertion timer", v16, 2u);
      }

      [*(id *)(a1 + 32) setMfi4SleepAssertionHeld:1];
    }
  }
}

- (void)removeMFi4SleepAssertion
{
  uint64_t v3 = [(SleepAssertionManager *)self mfi4SleepAssertionTimerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke;
  block[3] = &unk_2646682E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mfi4SleepAssertionHeld])
  {
    IOReturn v2 = IOPMAssertionRelease(*(_DWORD *)(*(void *)(a1 + 32) + 20));
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects <= 0;
    }
    else {
      BOOL v3 = 1;
    }
    int v4 = !v3;
    if (v2)
    {
      if (v4)
      {
        IOReturn v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        IOReturn v5 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke_cold_3();
      }
    }
    else
    {
      if (v4)
      {
        BOOL v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        BOOL v6 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEFAULT, "MFi4 sleep assertion released", buf, 2u);
      }

      id v9 = [*(id *)(a1 + 32) mfi4SleepAssertionTimer];
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v10 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v12 = 0;
        _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_DEFAULT, "createMFi4SleepAssertion stopping assertion timer", v12, 2u);
      }

      [*(id *)(a1 + 32) setMfi4SleepAssertionHeld:0];
    }
  }
}

- (NSMutableDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (BOOL)sleepAssertionHeld
{
  return self->_sleepAssertionHeld;
}

- (void)setSleepAssertionHeld:(BOOL)a3
{
  self->_sleepAssertionHeld = a3;
}

- (OS_dispatch_queue)sleepAssertionsLock
{
  return self->_sleepAssertionsLock;
}

- (void)setSleepAssertionsLock:(id)a3
{
}

- (BOOL)eaSleepAssertionHeld
{
  return self->_eaSleepAssertionHeld;
}

- (void)setEaSleepAssertionHeld:(BOOL)a3
{
  self->_eaSleepAssertionHeld = a3;
}

- (unsigned)eaSleepAssertionID
{
  return self->_eaSleepAssertionID;
}

- (void)setEaSleepAssertionID:(unsigned int)a3
{
  self->_eaSleepIOPMAssertionID AssertionID = a3;
}

- (BOOL)applePencilSleepAssertionHeld
{
  return self->_applePencilSleepAssertionHeld;
}

- (void)setApplePencilSleepAssertionHeld:(BOOL)a3
{
  self->_applePencilSleepAssertionHeld = a3;
}

- (unsigned)applePencilSleepAssertionID
{
  return self->_applePencilSleepAssertionID;
}

- (void)setApplePencilSleepAssertionID:(unsigned int)a3
{
  self->_applePencilSleepIOPMAssertionID AssertionID = a3;
}

- (OS_dispatch_source)applePencilSleepAssertionTimer
{
  return self->_applePencilSleepAssertionTimer;
}

- (void)setApplePencilSleepAssertionTimer:(id)a3
{
}

- (OS_dispatch_queue)applePencilSleepAssertionTimerQueue
{
  return self->_applePencilSleepAssertionTimerQueue;
}

- (void)setApplePencilSleepAssertionTimerQueue:(id)a3
{
}

- (BOOL)mfi4SleepAssertionHeld
{
  return self->_mfi4SleepAssertionHeld;
}

- (void)setMfi4SleepAssertionHeld:(BOOL)a3
{
  self->_mfi4SleepAssertionHeld = a3;
}

- (unsigned)mfi4SleepAssertionID
{
  return self->_mfi4SleepAssertionID;
}

- (void)setMfi4SleepAssertionID:(unsigned int)a3
{
  self->_mfi4SleepIOPMAssertionID AssertionID = a3;
}

- (OS_dispatch_source)mfi4SleepAssertionTimer
{
  return self->_mfi4SleepAssertionTimer;
}

- (void)setMfi4SleepAssertionTimer:(id)a3
{
}

- (OS_dispatch_queue)mfi4SleepAssertionTimerQueue
{
  return self->_mfi4SleepAssertionTimerQueue;
}

- (void)setMfi4SleepAssertionTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimerQueue, 0);
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimer, 0);
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimerQueue, 0);
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimer, 0);
  objc_storeStrong((id *)&self->_sleepAssertionsLock, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

void __29__SleepAssertionManager_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_222C9E000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222C9E000, a2, OS_LOG_TYPE_ERROR, "ERROR - IOPMAssertionCreateWithProperties returned error: 0x%08x!!", (uint8_t *)v2, 8u);
}

void __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR - couldn't take Apple Pencil sleep assertion", v2, v3, v4, v5, v6);
}

void __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR -  couldn't release Apple Pencil sleep assertion", v2, v3, v4, v5, v6);
}

void __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR - couldn't take MFi4 sleep assertion", v2, v3, v4, v5, v6);
}

void __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C9E000, v0, v1, "ERROR -  couldn't release MFi4 sleep assertion", v2, v3, v4, v5, v6);
}

@end