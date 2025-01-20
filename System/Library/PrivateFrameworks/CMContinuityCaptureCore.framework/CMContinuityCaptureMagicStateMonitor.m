@interface CMContinuityCaptureMagicStateMonitor
+ (BOOL)shouldForceMagicForAssertionType:(int64_t)a3;
+ (BOOL)shouldForceNonMagicForAssertionType:(int64_t)a3;
- (BOOL)magic;
- (CMContinuityCaptureMagicStateMonitor)initWithDevice:(id)a3;
- (OS_dispatch_queue)queue;
- (id)description;
- (void)holdMagicStateAssertion:(int64_t)a3;
- (void)holdNonMagicStateAssertion:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4;
- (void)releaseNonMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4;
- (void)updateState;
@end

@implementation CMContinuityCaptureMagicStateMonitor

- (CMContinuityCaptureMagicStateMonitor)initWithDevice:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureMagicStateMonitor;
  v5 = [(CMContinuityCaptureMagicStateMonitor *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.continuitycapture.magicstatemonitor", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_device, v4);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeMagicStateAssertions = v5->_activeMagicStateAssertions;
    v5->_activeMagicStateAssertions = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeNonMagicStateAssertions = v5->_activeNonMagicStateAssertions;
    v5->_activeNonMagicStateAssertions = v11;

    v5->_skipNearByCheck = 0;
    v13 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)updateState
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  if (WeakRetained)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if ([WeakRetained usable]
      && (([WeakRetained nearby] & 1) != 0
       || self->_skipNearByCheck
       || [WeakRetained wired]))
    {
      if ([WeakRetained wired]) {
        int v4 = 1;
      }
      else {
        int v4 = [WeakRetained wifiP2pActive];
      }
    }
    else
    {
      int v4 = 0;
    }
    v5 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [WeakRetained usable];
      int v7 = [WeakRetained nearby];
      int v8 = [WeakRetained wired];
      BOOL skipNearByCheck = self->_skipNearByCheck;
      BOOL magic = self->_magic;
      int v14 = 138544898;
      objc_super v15 = self;
      __int16 v16 = 1024;
      int v17 = v4;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 1024;
      int v21 = v7;
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      BOOL v25 = skipNearByCheck;
      __int16 v26 = 1024;
      BOOL v27 = magic;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ magic:%d (usable:%d nearby:%d wired:%d skipNearByCheck:%d) reported magic:%d", (uint8_t *)&v14, 0x30u);
    }

    if (v4)
    {
      if ([(NSMutableSet *)self->_activeNonMagicStateAssertions count] || self->_magicTransitionCoolDownBlock) {
        goto LABEL_20;
      }
    }
    else if ([(NSMutableSet *)self->_activeMagicStateAssertions count] {
           || self->_nonMagicTransitionCoolDownBlock)
    }
    {
      goto LABEL_20;
    }
    v11 = self;
    objc_sync_enter(v11);
    int v12 = v11->_magic;
    objc_sync_exit(v11);

    if (v12 != v4)
    {
      [(CMContinuityCaptureMagicStateMonitor *)v11 willChangeValueForKey:@"magic"];
      v13 = v11;
      objc_sync_enter(v13);
      v11->_BOOL magic = v4;
      objc_sync_exit(v13);

      [(CMContinuityCaptureMagicStateMonitor *)v13 didChangeValueForKey:@"magic"];
    }
  }
LABEL_20:
}

- (BOOL)magic
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL magic = v2->_magic;
  objc_sync_exit(v2);

  return magic;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (([v9 isEqualToString:@"wired"] & 1) != 0
    || ([v9 isEqualToString:@"nearby"] & 1) != 0
    || [v9 isEqualToString:@"usable"])
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87__CMContinuityCaptureMagicStateMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_264C990F8;
    objc_copyWeak(&v14, &location);
    dispatch_async(queue, v13);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __87__CMContinuityCaptureMagicStateMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateState];
    id WeakRetained = v2;
  }
}

+ (BOOL)shouldForceMagicForAssertionType:(int64_t)a3
{
  return a3 == 2;
}

+ (BOOL)shouldForceNonMagicForAssertionType:(int64_t)a3
{
  return a3 == 1;
}

- (void)holdMagicStateAssertion:(int64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CMContinuityCaptureMagicStateMonitor_holdMagicStateAssertion___block_invoke;
  v6[3] = &unk_264C99818;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(queue, v6);
}

uint64_t __64__CMContinuityCaptureMagicStateMonitor_holdMagicStateAssertion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Hold magic assertion of type:%d", (uint8_t *)&v12, 0x12u);
  }

  v5 = *(void **)(*(void *)(a1 + 32) + 16);
  int v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v5 addObject:v6];

  int v7 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v7)
  {
    dispatch_block_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  uint64_t result = +[CMContinuityCaptureMagicStateMonitor shouldForceMagicForAssertionType:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"magic"];
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    objc_sync_exit(v11);

    return [*(id *)(a1 + 32) didChangeValueForKey:@"magic"];
  }
  return result;
}

- (void)holdNonMagicStateAssertion:(int64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CMContinuityCaptureMagicStateMonitor_holdNonMagicStateAssertion___block_invoke;
  v6[3] = &unk_264C99818;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(queue, v6);
}

uint64_t __67__CMContinuityCaptureMagicStateMonitor_holdNonMagicStateAssertion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Hold non-magic assertion of type:%d", (uint8_t *)&v12, 0x12u);
  }

  v5 = *(void **)(*(void *)(a1 + 32) + 24);
  int v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v5 addObject:v6];

  int v7 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v7)
  {
    dispatch_block_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
  uint64_t result = +[CMContinuityCaptureMagicStateMonitor shouldForceNonMagicForAssertionType:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"magic"];
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    objc_sync_exit(v11);

    return [*(id *)(a1 + 32) didChangeValueForKey:@"magic"];
  }
  return result;
}

- (void)releaseMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke;
  block[3] = &unk_264C99840;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  block[4] = self;
  unsigned int v10 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[2];
    int v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      int v7 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Release magic assertion of type:%d", buf, 0x12u);
      }

      unsigned int v10 = (void *)*((void *)v4 + 2);
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v10 removeObject:v11];

      if (![*((id *)v4 + 2) count])
      {
        int v12 = (void *)*((void *)v4 + 5);
        if (v12) {
          dispatch_block_cancel(v12);
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_5;
        block[3] = &unk_264C990F8;
        objc_copyWeak(&v17, v2);
        dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
        __int16 v14 = (void *)*((void *)v4 + 5);
        *((void *)v4 + 5) = v13;

        dispatch_time_t v15 = dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 56));
        dispatch_after(v15, *((dispatch_queue_t *)v4 + 6), *((dispatch_block_t *)v4 + 5));
        objc_destroyWeak(&v17);
      }
    }
  }
}

void __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    id v3 = WeakRetained;

    [v3 updateState];
    id WeakRetained = v3;
  }
}

- (void)releaseNonMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke;
  block[3] = &unk_264C99840;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  void block[4] = self;
  unsigned int v10 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[3];
    int v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      int v7 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Release non-magic assertion of type:%d", buf, 0x12u);
      }

      unsigned int v10 = (void *)*((void *)v4 + 3);
      id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v10 removeObject:v11];

      if (![*((id *)v4 + 3) count])
      {
        int v12 = (void *)*((void *)v4 + 4);
        if (v12) {
          dispatch_block_cancel(v12);
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_6;
        block[3] = &unk_264C990F8;
        objc_copyWeak(&v17, v2);
        dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
        __int16 v14 = (void *)*((void *)v4 + 4);
        *((void *)v4 + 4) = v13;

        dispatch_time_t v15 = dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 56));
        dispatch_after(v15, *((dispatch_queue_t *)v4 + 6), *((dispatch_block_t *)v4 + 4));
        objc_destroyWeak(&v17);
      }
    }
  }
}

void __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    id v3 = WeakRetained;

    [v3 updateState];
    id WeakRetained = v3;
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  int v7 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, WeakRetained, self];

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_nonMagicTransitionCoolDownBlock, 0);
  objc_storeStrong(&self->_magicTransitionCoolDownBlock, 0);
  objc_storeStrong((id *)&self->_activeNonMagicStateAssertions, 0);
  objc_storeStrong((id *)&self->_activeMagicStateAssertions, 0);
}

@end