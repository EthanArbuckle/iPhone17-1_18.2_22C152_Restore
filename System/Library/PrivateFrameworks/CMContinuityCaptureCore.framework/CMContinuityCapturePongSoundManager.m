@interface CMContinuityCapturePongSoundManager
+ (id)sharedInstance;
- (BOOL)_shouldUseNearbyInteractionToDeterminePongSound;
- (CMContinuityCapturePongSoundManager)init;
- (void)_playPongSoundForIdentifier:(id)a3;
- (void)_pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4;
- (void)acquireSystemPongAssertion;
- (void)clearPongHistory;
- (void)device:(id)a3 isNearby:(BOOL)a4;
- (void)pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4;
- (void)releaseSystemPongAssertion;
- (void)waitForPongCompletion:(id)a3;
@end

@implementation CMContinuityCapturePongSoundManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_22);
  }
  v2 = (void *)_pongSoundManager;
  return v2;
}

uint64_t __53__CMContinuityCapturePongSoundManager_sharedInstance__block_invoke()
{
  _pongSoundManager = objc_alloc_init(CMContinuityCapturePongSoundManager);
  return MEMORY[0x270F9A758]();
}

- (CMContinuityCapturePongSoundManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCapturePongSoundManager;
  v2 = [(CMContinuityCapturePongSoundManager *)&v16 init];
  v3 = v2;
  if (v2)
  {
    if ([(CMContinuityCapturePongSoundManager *)v2 _shouldUseNearbyInteractionToDeterminePongSound])
    {
      v4 = [CMContinuityCaptureProximityMonitor alloc];
      uint64_t v5 = [(CMContinuityCaptureProximityMonitor *)v4 initWithQueue:MEMORY[0x263EF83A0] delegate:v3];
      proximityMonitor = v3->_proximityMonitor;
      v3->_proximityMonitor = (CMContinuityCaptureProximityMonitor *)v5;
    }
    uint64_t v7 = FigDispatchQueueCreateWithPriority();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v3->_internalQueue);
    pongHistoryTimer = v3->_pongHistoryTimer;
    v3->_pongHistoryTimer = (OS_dispatch_source *)v9;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v11 = v3->_pongHistoryTimer;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__CMContinuityCapturePongSoundManager_init__block_invoke;
    v13[3] = &unk_264C990F8;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_activate((dispatch_object_t)v3->_pongHistoryTimer);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__CMContinuityCapturePongSoundManager_init__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_loadWeakRetained(v1);
      uint64_t v5 = WeakRetained[1];
      int v6 = 134218242;
      id v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] reset pong history due to pongHistoryTimer %@", (uint8_t *)&v6, 0x16u);
    }
    [WeakRetained clearPongHistory];
  }
}

- (void)clearPongHistory
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CMContinuityCapturePongSoundManager_clearPongHistory__block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__CMContinuityCapturePongSoundManager_clearPongHistory__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 134218242;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[CMContinuityCapturePongSoundManager clearPongHistory]_block_invoke";
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s", (uint8_t *)&v6, 0x16u);
    }

    dispatch_source_set_timer(WeakRetained[2], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_t v5 = WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void)waitForPongCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_source_t v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v13 = self;
    __int16 v14 = 2080;
    v15 = "-[CMContinuityCapturePongSoundManager waitForPongCompletion:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s start", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CMContinuityCapturePongSoundManager_waitForPongCompletion___block_invoke;
  block[3] = &unk_264C99700;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async_and_wait(internalQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __61__CMContinuityCapturePongSoundManager_waitForPongCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 134218242;
    id v6 = WeakRetained;
    __int16 v7 = 2080;
    __int16 v8 = "-[CMContinuityCapturePongSoundManager waitForPongCompletion:]_block_invoke";
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s end", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acquireSystemPongAssertion
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v10 = self;
    __int16 v11 = 2080;
    v12 = "-[CMContinuityCapturePongSoundManager acquireSystemPongAssertion]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s", buf, 0x16u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  pongAssertSemaphore = v4->_pongAssertSemaphore;
  v4->_pongAssertSemaphore = (OS_dispatch_semaphore *)v5;

  objc_sync_exit(v4);
  internalQueue = v4->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCapturePongSoundManager_acquireSystemPongAssertion__block_invoke;
  block[3] = &unk_264C99148;
  void block[4] = v4;
  dispatch_async(internalQueue, block);
}

void __65__CMContinuityCapturePongSoundManager_acquireSystemPongAssertion__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  dsema = *(id *)(*(void *)(a1 + 32) + 40);
  objc_sync_exit(v2);

  if (dsema)
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(dsema, v3);
  }
}

- (void)releaseSystemPongAssertion
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    __int16 v8 = self;
    __int16 v9 = 2080;
    id v10 = "-[CMContinuityCapturePongSoundManager releaseSystemPongAssertion]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s", (uint8_t *)&v7, 0x16u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  pongAssertSemaphore = v4->_pongAssertSemaphore;
  if (pongAssertSemaphore)
  {
    dispatch_semaphore_signal(pongAssertSemaphore);
    id v6 = v4->_pongAssertSemaphore;
    v4->_pongAssertSemaphore = 0;
  }
  objc_sync_exit(v4);
}

- (void)pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__CMContinuityCapturePongSoundManager_pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke;
  block[3] = &unk_264C99210;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __95__CMContinuityCapturePongSoundManager_pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pongIfNeededWithShouldConsiderPongHistory:*(unsigned __int8 *)(a1 + 48) forIdentifier:*(void *)(a1 + 40)];
}

- (void)_pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (char *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  int v7 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    __int16 v23 = 2112;
    v24 = v6;
    __int16 v25 = 1024;
    LODWORD(v26) = v4;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] checking whether need to play pong for Identifier %@, should consider pong history: %d", buf, 0x1Cu);
  }

  if (v4 && [(NSString *)self->_playedPongForIdentifier isEqualToString:v6])
  {
    id v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      __int16 v23 = 2080;
      v24 = "-[CMContinuityCapturePongSoundManager _pongIfNeededWithShouldConsiderPongHistory:forIdentifier:]";
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s [pong-check] Already ponged for %@, do not pong again", buf, 0x20u);
    }
  }
  else if ([(CMContinuityCapturePongSoundManager *)self _shouldUseNearbyInteractionToDeterminePongSound])
  {
    if (!self->_proximityMonitor)
    {
      __int16 v9 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] restarting proximity monitor", buf, 0xCu);
      }

      id v10 = [CMContinuityCaptureProximityMonitor alloc];
      BOOL v11 = [(CMContinuityCaptureProximityMonitor *)v10 initWithQueue:MEMORY[0x263EF83A0] delegate:self];
      proximityMonitor = self->_proximityMonitor;
      self->_proximityMonitor = v11;
    }
    if (!self->_proximityTimer)
    {
      uint64_t v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      proximityTimer = self->_proximityTimer;
      self->_proximityTimer = v13;

      v15 = self->_proximityTimer;
      dispatch_time_t v16 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v17 = self->_proximityTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __96__CMContinuityCapturePongSoundManager__pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke;
      handler[3] = &unk_264C99AF0;
      handler[4] = self;
      v20 = v6;
      objc_copyWeak(&v21, (id *)buf);
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume((dispatch_object_t)self->_proximityTimer);
      objc_destroyWeak(&v21);

      objc_destroyWeak((id *)buf);
    }
    [(CMContinuityCaptureProximityMonitor *)self->_proximityMonitor beginTracking:v6];
  }
  else
  {
    v18 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] Not using NearbyInteraction to determine whether pong sound is played. Go ahead and play it.", buf, 0xCu);
    }

    [(CMContinuityCapturePongSoundManager *)self _playPongSoundForIdentifier:v6];
  }
}

void __96__CMContinuityCapturePongSoundManager__pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %@ did not get proximity update in time, assume the device is too far away", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained device:*(void *)(a1 + 40) isNearby:0];
}

- (BOOL)_shouldUseNearbyInteractionToDeterminePongSound
{
  return 0;
}

- (void)_playPongSoundForIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_semaphore_t v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] playing pong sound for %@", buf, 0x16u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CMContinuityCapturePongSoundManager__playPongSoundForIdentifier___block_invoke;
  v13[3] = &unk_264C99198;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v14 = v7;
  __int16 v8 = v6;
  v15 = v8;
  AudioServicesPlaySystemSoundWithCompletion(0x424u, v13);
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  playedPongForIdentifier = self->_playedPongForIdentifier;
  self->_playedPongForIdentifier = (NSString *)v7;
  id v11 = v7;

  dispatch_time_t v12 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_pongHistoryTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

intptr_t __67__CMContinuityCapturePongSoundManager__playPongSoundForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 134218242;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] pong sound is done being played for %@", (uint8_t *)&v6, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)device:(id)a3 isNearby:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = MEMORY[0x263EF83A0];
  id v8 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_V2(v7);

  uint64_t v9 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %@ got proximity update: nearby %d", buf, 0x1Cu);
  }

  proximityTimer = self->_proximityTimer;
  if (proximityTimer)
  {
    dispatch_source_cancel(proximityTimer);
    id v11 = self->_proximityTimer;
    self->_proximityTimer = 0;
  }
  [(CMContinuityCaptureProximityMonitor *)self->_proximityMonitor endTracking:v6];
  proximityMonitor = self->_proximityMonitor;
  self->_proximityMonitor = 0;

  if (!v4)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CMContinuityCapturePongSoundManager_device_isNearby___block_invoke;
    block[3] = &unk_264C99120;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    dispatch_async(internalQueue, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

void __55__CMContinuityCapturePongSoundManager_device_isNearby___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _playPongSoundForIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pongAssertSemaphore, 0);
  objc_storeStrong((id *)&self->_proximityTimer, 0);
  objc_storeStrong((id *)&self->_proximityMonitor, 0);
  objc_storeStrong((id *)&self->_pongHistoryTimer, 0);
  objc_storeStrong((id *)&self->_playedPongForIdentifier, 0);
}

@end