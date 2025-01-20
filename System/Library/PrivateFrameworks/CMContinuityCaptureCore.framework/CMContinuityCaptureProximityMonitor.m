@interface CMContinuityCaptureProximityMonitor
- (BOOL)isDeviceKnown:(id)a3;
- (BOOL)isDeviceNearby:(id)a3;
- (CMContinuityCaptureProximityMonitor)initWithQueue:(id)a3 delegate:(id)a4;
- (void)_invalidate;
- (void)_startNearbyInteractionSession;
- (void)beginTracking:(id)a3;
- (void)dealloc;
- (void)endTracking:(id)a3;
- (void)invalidate;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
@end

@implementation CMContinuityCaptureProximityMonitor

- (CMContinuityCaptureProximityMonitor)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CMContinuityCaptureProximityMonitor;
  v9 = [(CMContinuityCaptureProximityMonitor *)&v31 init];
  v10 = v9;
  if (v9)
  {
    v9->_havePendingUpdates = 0;
    objc_storeWeak((id *)&v9->_delegate, v8);
    dispatch_queue_t v11 = dispatch_queue_create("continuity-capture-proximity-monitor", 0);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    uint64_t v13 = objc_opt_new();
    niSession = v10->_niSession;
    v10->_niSession = (NISession *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F140B8]) initWithName:@"inner" devicePresencePreset:2];
    innerPredicate = v10->_innerPredicate;
    v10->_innerPredicate = (NIRegionPredicate *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F140B8]) initWithName:@"outer" devicePresencePreset:5];
    outerPredicate = v10->_outerPredicate;
    v10->_outerPredicate = (NIRegionPredicate *)v17;

    uint64_t v19 = objc_opt_new();
    tracking = v10->_tracking;
    v10->_tracking = (NSMutableSet *)v19;

    uint64_t v21 = objc_opt_new();
    nearby = v10->_nearby;
    v10->_nearby = (NSMutableSet *)v21;

    uint64_t v23 = objc_opt_new();
    knownDevices = v10->_knownDevices;
    v10->_knownDevices = (NSMutableSet *)v23;

    v25 = v10->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__CMContinuityCaptureProximityMonitor_initWithQueue_delegate___block_invoke;
    block[3] = &unk_264C99148;
    v26 = v10;
    v30 = v26;
    dispatch_sync(v25, block);
    v27 = v26;
  }
  return v10;
}

uint64_t __62__CMContinuityCaptureProximityMonitor_initWithQueue_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNearbyInteractionSession];
}

- (void)beginTracking:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    dispatch_queue_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ begin tracking %@", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke;
  v8[3] = &unk_264C99080;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(internalQueue, v8);
}

void __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)])
    {
      id to = (id)0xAAAAAAAAAAAAAAAALL;
      objc_copyWeak(&to, (id *)(*(void *)(a1 + 32) + 16));
      char v2 = [*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 40)];
      v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke_2;
      v4[3] = &unk_264C99728;
      objc_copyWeak(&v6, &to);
      id v5 = *(id *)(a1 + 40);
      char v7 = v2;
      dispatch_async(v3, v4);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&to);
    }
  }
}

void __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained device:*(void *)(a1 + 32) isNearby:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)endTracking:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    dispatch_queue_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ end tracking %@", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__CMContinuityCaptureProximityMonitor_endTracking___block_invoke;
  v8[3] = &unk_264C99080;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(internalQueue, v8);
}

uint64_t __51__CMContinuityCaptureProximityMonitor_endTracking___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)isDeviceNearby:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = -86;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureProximityMonitor_isDeviceNearby___block_invoke;
  block[3] = &unk_264C99558;
  id v9 = v4;
  v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __54__CMContinuityCaptureProximityMonitor_isDeviceNearby___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 72) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)isDeviceKnown:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = -86;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CMContinuityCaptureProximityMonitor_isDeviceKnown___block_invoke;
  block[3] = &unk_264C99558;
  id v9 = v4;
  v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __53__CMContinuityCaptureProximityMonitor_isDeviceKnown___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 80) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)invalidate
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CMContinuityCaptureProximityMonitor_invalidate__block_invoke;
  block[3] = &unk_264C99148;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__CMContinuityCaptureProximityMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)dealloc
{
  [(CMContinuityCaptureProximityMonitor *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureProximityMonitor;
  [(CMContinuityCaptureProximityMonitor *)&v3 dealloc];
}

- (void)_startNearbyInteractionSession
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_super v3 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v12 = self;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ : monitoring nearby interaction", buf, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x263F14080]);
  innerPredicate = self->_innerPredicate;
  outerPredicate = self->_outerPredicate;
  id v10 = 0;
  id v7 = (void *)[v4 initWithInnerBoundary:innerPredicate outerBoundary:outerPredicate error:&v10];
  id v8 = v10;
  [v7 setAllowedDevices:2];
  [v7 setMonitoringOption:1];
  if (v8)
  {
    id v9 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ ERROR in NIDevicePresenceConfiguration: %@", buf, 0x16u);
    }
  }
  else
  {
    [(NISession *)self->_niSession setDelegate:self];
    [(NISession *)self->_niSession setDelegateQueue:self->_callbackQueue];
    [(NISession *)self->_niSession runWithConfiguration:v7];
  }
}

- (void)_invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSMutableSet *)self->_tracking count];
    int v5 = [(NSMutableSet *)self->_nearby count];
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidate (%d tracked, %d nearby)", (uint8_t *)&v7, 0x18u);
  }

  [(NISession *)self->_niSession invalidate];
  niSession = self->_niSession;
  self->_niSession = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  [(NSMutableSet *)self->_tracking removeAllObjects];
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v14 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v11 deviceIdentifier];
    [v11 distance];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    double v30 = v16;
    *(_WORD *)objc_super v31 = 2112;
    *(void *)&v31[2] = v13;
    *(_WORD *)&v31[10] = 2112;
    *(void *)&v31[12] = v12;
    _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_INFO, "%@ : device %@ (%f) moved from %@ to %@", buf, 0x34u);
  }
  uint64_t v17 = [v11 deviceIdentifier];
  uint64_t v18 = [v12 isEqual:self->_innerPredicate];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = v18;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v30 = COERCE_DOUBLE(__Block_byref_object_copy__8);
  *(void *)objc_super v31 = __Block_byref_object_dispose__8;
  *(void *)&v31[8] = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CMContinuityCaptureProximityMonitor_session_object_didUpdateRegion_previousRegion___block_invoke;
  block[3] = &unk_264C9AB88;
  void block[4] = self;
  id v20 = v17;
  id v23 = v20;
  v24 = v27;
  char v26 = v18;
  v25 = buf;
  dispatch_sync(internalQueue, block);
  uint64_t v21 = *(void **)(*(void *)&buf[8] + 40);
  if (v21) {
    [v21 device:v20 isNearby:v18];
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v27, 8);
}

void __85__CMContinuityCaptureProximityMonitor_session_object_didUpdateRegion_previousRegion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 40)];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 != *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_super v3 = CMContinuityCaptureLog(1);
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v16 = 138412546;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_INFO, "%@ : device entered inner boundary: %@", (uint8_t *)&v16, 0x16u);
      }

      [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
    }
    else
    {
      if (v4)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        int v16 = 138412546;
        uint64_t v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_INFO, "%@ : device left inner boundary: %@", (uint8_t *)&v16, 0x16u);
      }

      [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = WeakRetained;
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(_DWORD *)(v12 + 88);
  BOOL v14 = __OFSUB__(v13, 1);
  int v15 = v13 - 1;
  if (v15 < 0 == v14) {
    *(_DWORD *)(v12 + 88) = v15;
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke;
  v8[3] = &unk_264C99AF0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_async(internalQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke(uint64_t a1)
{
  *(void *)&v19[13] = *MEMORY[0x263EF8340];
  int v2 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    *(void *)uint64_t v19 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%@ NISession error: %@", buf, 0x16u);
  }

  id v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7 && (unint64_t)([v7 code] + 5889) <= 1)
    {
      [WeakRetained _invalidate];
      goto LABEL_15;
    }
    int v8 = *((_DWORD *)WeakRetained + 22);
    if (v8 < 1)
    {
      dispatch_time_t v10 = 0;
    }
    else
    {
      int64_t v9 = 250000000 * (1 << (v8 - 1));
      dispatch_time_t v10 = dispatch_time(0, v9);
      id v11 = CMContinuityCaptureLog(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *((_DWORD *)WeakRetained + 22);
        *(_DWORD *)buf = 138412802;
        id v17 = WeakRetained;
        __int16 v18 = 1024;
        *(_DWORD *)uint64_t v19 = v12;
        v19[2] = 2048;
        *(void *)&v19[3] = v9;
        _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ Backing off NISession restart %d (%lld ns)", buf, 0x1Cu);
      }

      int v8 = *((_DWORD *)WeakRetained + 22);
      if (v8 > 6) {
        goto LABEL_14;
      }
    }
    *((_DWORD *)WeakRetained + 22) = v8 + 1;
LABEL_14:
    int v13 = *((void *)WeakRetained + 3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke_11;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v15, v5);
    dispatch_after(v10, v13, block);
    objc_destroyWeak(&v15);
  }
LABEL_15:
}

void __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = objc_opt_new();
    int v2 = (void *)WeakRetained[5];
    WeakRetained[5] = v1;

    [WeakRetained _startNearbyInteractionSession];
  }
}

- (void)sessionWasSuspended:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v4 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ NISession was suspended", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v4 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ NISession resuming", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureProximityMonitor_sessionSuspensionEnded___block_invoke;
  block[3] = &unk_264C990F8;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __62__CMContinuityCaptureProximityMonitor_sessionSuspensionEnded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _startNearbyInteractionSession];
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDevices, 0);
  objc_storeStrong((id *)&self->_nearby, 0);
  objc_storeStrong((id *)&self->_tracking, 0);
  objc_storeStrong((id *)&self->_outerPredicate, 0);
  objc_storeStrong((id *)&self->_innerPredicate, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end