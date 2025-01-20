@interface CMContinuityCaptureSessionStateManager
+ (id)sharedInstance;
- (BOOL)_isStreamingForDevice:(id)a3;
- (BOOL)_shouldResetConnectionForDevice:(id)a3;
- (BOOL)_startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7;
- (BOOL)shouldResetConnectionForDevice:(id)a3;
- (BOOL)startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7;
- (CMContinuityCaptureActiveSession)activeSession;
- (CMContinuityCaptureSessionStateManager)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_devicesWithPendingStopSession;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5;
- (void)_stopCurrentSession:(id)a3;
- (void)_stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5;
- (void)stopCurrentSession:(id)a3 syncOnOwnedQueue:(BOOL)a4;
- (void)stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5;
@end

@implementation CMContinuityCaptureSessionStateManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)_sessionStateManager;
  return v2;
}

void __56__CMContinuityCaptureSessionStateManager_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureSessionStateManager alloc];
  id v3 = (id)FigDispatchQueueCreateWithPriority();
  uint64_t v1 = [(CMContinuityCaptureSessionStateManager *)v0 initWithQueue:v3];
  v2 = (void *)_sessionStateManager;
  _sessionStateManager = v1;
}

- (CMContinuityCaptureSessionStateManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureSessionStateManager;
  v6 = [(CMContinuityCaptureSessionStateManager *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, v7, v7, 0);
    v7->_sessionTerminationGracePeriodInSec = FigGetCFPreferenceNumberWithDefault();
    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    pendingStopCompletionDevices = v7->_pendingStopCompletionDevices;
    v7->_pendingStopCompletionDevices = (NSMapTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeStreamDevicesByEntity = v7->_activeStreamDevicesByEntity;
    v7->_activeStreamDevicesByEntity = v10;

    uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:0];
    skippedStopStreamByDevices = v7->_skippedStopStreamByDevices;
    v7->_skippedStopStreamByDevices = (NSHashTable *)v12;

    v14 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    [v14 addObserver:v7 forKeyPath:@"availableClientDevices" options:3 context:0];

    v15 = v7;
  }

  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMContinuityCaptureActiveSession)activeSession
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activeSession;
  objc_sync_exit(v2);

  return v3;
}

- (void)stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CMContinuityCaptureSessionStateManager_stopStreamForDevice_option_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureSessionStateManager_stopStreamForDevice_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _stopStreamForDevice:*(void *)(a1 + 32) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_stopStreamForDevice:(id)a3 option:(int64_t)a4 completion:(id)a5
{
  char v6 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6) {
    int sessionTerminationGracePeriodInSec = 0;
  }
  else {
    int sessionTerminationGracePeriodInSec = self->_sessionTerminationGracePeriodInSec;
  }
  id v11 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v38 = self;
    __int16 v39 = 2080;
    v40 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]";
    __int16 v41 = 2114;
    id v42 = v8;
    __int16 v43 = 1024;
    int v44 = sessionTerminationGracePeriodInSec;
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ sessionTerminationGracePeriodInSec:%d", buf, 0x26u);
  }

  id v12 = [(NSMapTable *)self->_pendingStopCompletionDevices objectForKey:v8];
  v13 = v12;
  if (v12)
  {
    dispatch_block_cancel(v12);
    id v14 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v38 = self;
      __int16 v39 = 2080;
      v40 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]";
      __int16 v41 = 2114;
      id v42 = v8;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ pending completion", buf, 0x20u);
    }

    [(NSHashTable *)self->_skippedStopStreamByDevices removeObject:v8];
    v13[2](v13);
  }
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __81__CMContinuityCaptureSessionStateManager__stopStreamForDevice_option_completion___block_invoke;
  v32 = &unk_264C99508;
  objc_copyWeak(&v35, &location);
  id v15 = v8;
  id v33 = v15;
  id v16 = v9;
  id v34 = v16;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v29);
  pendingStopCompletionDevices = self->_pendingStopCompletionDevices;
  v22 = (void *)MEMORY[0x237DFB780](v17, v19, v20, v21);
  -[NSMapTable setObject:forKey:](pendingStopCompletionDevices, "setObject:forKey:", v22, v15, v29, v30, v31, v32);

  activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
  v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "entity"));
  [(NSMutableDictionary *)activeStreamDevicesByEntity removeObjectForKey:v24];

  v25 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [(NSMutableDictionary *)self->_activeStreamDevicesByEntity allKeys];
    *(_DWORD *)buf = 138412546;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v26;
    _os_log_impl(&dword_235FC2000, v25, OS_LOG_TYPE_DEFAULT, "%@ remaining active entities %{public}@", buf, 0x16u);
  }
  [v15 setStreamIntent:0];
  if (![(CMContinuityCaptureSessionStateManager *)self _isStreamingForDevice:v15])
  {
    v27 = [v15 transportDevice];
    [v27 setStreamIntent:0];
  }
  dispatch_time_t v28 = dispatch_time(0, 1000000000 * sessionTerminationGracePeriodInSec);
  dispatch_after(v28, (dispatch_queue_t)self->_queue, v17);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureSessionStateManager__stopStreamForDevice_option_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2080;
      v10 = "-[CMContinuityCaptureSessionStateManager _stopStreamForDevice:option:completion:]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ completion", (uint8_t *)&v7, 0x20u);
    }
    [WeakRetained[3] removeObjectForKey:*(void *)(a1 + 32)];
    [WeakRetained[5] removeObject:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_devicesWithPendingStopSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(NSMapTable *)self->_pendingStopCompletionDevices keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    do
    {
      [v3 addObject:v6];
      uint64_t v7 = [v4 nextObject];

      uint64_t v6 = (void *)v7;
    }
    while (v7);
  }

  return v3;
}

- (void)startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__CMContinuityCaptureSessionStateManager_startStreamForDevice_startCompletion_startSkippedCompletion___block_invoke;
  block[3] = &unk_264C99530;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __102__CMContinuityCaptureSessionStateManager_startStreamForDevice_startCompletion_startSkippedCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startStreamForDevice:*(void *)(a1 + 32) startCompletion:*(void *)(a1 + 40) startSkippedCompletion:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (void)_startStreamForDevice:(id)a3 startCompletion:(id)a4 startSkippedCompletion:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  id v10 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v11 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v45 = self;
    __int16 v46 = 2080;
    v47 = "-[CMContinuityCaptureSessionStateManager _startStreamForDevice:startCompletion:startSkippedCompletion:]";
    __int16 v48 = 2114;
    id v49 = v8;
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@", buf, 0x20u);
  }

  [v8 setStreamIntent:1];
  if (![(CMContinuityCaptureSessionStateManager *)self _isStreamingForDevice:v8])
  {
    id v12 = [v8 transportDevice];
    [v12 setStreamIntent:1];
  }
  activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "entity"));
  [(NSMutableDictionary *)activeStreamDevicesByEntity setObject:v8 forKeyedSubscript:v14];

  id v15 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(NSMutableDictionary *)self->_activeStreamDevicesByEntity allKeys];
    *(_DWORD *)buf = 138412546;
    uint64_t v45 = self;
    __int16 v46 = 2114;
    v47 = v16;
    _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ updated active entities %{public}@", buf, 0x16u);
  }
  id v17 = [(NSMapTable *)self->_pendingStopCompletionDevices objectForKey:v8];
  if (v17)
  {
    id v18 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = self;
      __int16 v46 = 2080;
      v47 = "-[CMContinuityCaptureSessionStateManager _startStreamForDevice:startCompletion:startSkippedCompletion:]";
      __int16 v48 = 2114;
      id v49 = v8;
      _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%@ %s device %{public}@ cancel pending completion", buf, 0x20u);
    }

    dispatch_block_cancel(v17);
    [(NSMapTable *)self->_pendingStopCompletionDevices removeObjectForKey:v8];
    [(NSHashTable *)self->_skippedStopStreamByDevices addObject:v8];
    id v19 = [v8 compositeDelegate];
    [v19 relayEvent:@"kCMContinuityCaptureEventUserResume"];

    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    uint64_t v20 = [v8 transportDevice];
    uint64_t v21 = [v20 deviceIdentifier];
    v22 = [v21 UUIDString];

    [(CMContinuityCaptureSessionStateManager *)self _devicesWithPendingStopSession];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v35 = v10;
      v36 = v9;
      id v37 = v8;
      id v25 = 0;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          dispatch_time_t v28 = v25;
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(id *)(*((void *)&v39 + 1) + 8 * i);

          uint64_t v29 = [(NSMapTable *)self->_pendingStopCompletionDevices objectForKey:v25];
          uint64_t v30 = [v25 transportDevice];
          v31 = [v30 deviceIdentifier];
          v32 = [v31 UUIDString];

          if (v29)
          {
            BOOL v33 = !v32 || v22 == 0;
            if (v33 || ([v32 isEqualToString:v22] & 1) == 0)
            {
              id v34 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v45 = self;
                __int16 v46 = 2114;
                v47 = (const char *)v25;
                _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_DEFAULT, "%@ complete pending stop for %{public}@", buf, 0x16u);
              }

              v29[2](v29);
              dispatch_block_cancel(v29);
              [(NSMapTable *)self->_pendingStopCompletionDevices removeObjectForKey:v25];
              [(NSHashTable *)self->_skippedStopStreamByDevices removeObject:v25];
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v24);

      id v9 = v36;
      id v8 = v37;
      id v17 = 0;
      id v10 = v35;
    }
    v9[2](v9);
  }
}

- (BOOL)_isStreamingForDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [v4 transportDevice];
  uint64_t v6 = [v5 deviceIdentifier];
  uint64_t v7 = [v6 UUIDString];

  id v8 = [(NSMutableDictionary *)self->_activeStreamDevicesByEntity allValues];
  if ([v8 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "transportDevice", (void)v17);
          id v14 = [v13 deviceIdentifier];
          id v15 = [v14 UUIDString];

          if (v7 && v15 && [v15 isEqualToString:v7])
          {

            LOBYTE(v10) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)shouldResetConnectionForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CMContinuityCaptureSessionStateManager_shouldResetConnectionForDevice___block_invoke;
  block[3] = &unk_264C99558;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __73__CMContinuityCaptureSessionStateManager_shouldResetConnectionForDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldResetConnectionForDevice:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_shouldResetConnectionForDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  id v6 = [v5 availableClientDevices];

  uint64_t v7 = [v4 transportDevice];
  id v8 = [v7 deviceIdentifier];
  id v9 = [v8 UUIDString];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        char v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v15 = [v14 deviceIdentifier];
        id v16 = [v15 UUIDString];

        if (v9
          && v16
          && [v9 isEqualToString:v16]
          && [v14 hasStreamIntent])
        {

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v17 = [(NSHashTable *)self->_skippedStopStreamByDevices allObjects];
          uint64_t v11 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v18 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v17);
                }
                long long v20 = [*(id *)(*((void *)&v24 + 1) + 8 * j) transportDevice];
                uint64_t v21 = [v20 deviceIdentifier];
                uint64_t v22 = [v21 UUIDString];

                if (v22 && ([v9 isEqualToString:v22] & 1) != 0)
                {

                  LOBYTE(v11) = 1;
                  goto LABEL_24;
                }
              }
              uint64_t v11 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
          goto LABEL_24;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  long long v17 = v10;
LABEL_24:

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__CMContinuityCaptureSessionStateManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __89__CMContinuityCaptureSessionStateManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v50 = a4;
  id v10 = a5;
  id v49 = v9;
  if ([v9 isEqualToString:@"availableClientDevices"])
  {
    id v47 = v10;
    id v11 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v12 = [v11 availableClientDevices];

    id v54 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v13 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v76 = self;
      __int16 v77 = 2114;
      v78 = v12;
      _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ updated device list %{public}@", buf, 0x16u);
    }

    id v14 = [(CMContinuityCaptureSessionStateManager *)self _devicesWithPendingStopSession];
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v68 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          id v20 = [v19 transportDevice];
          uint64_t v21 = [v20 deviceIdentifier];
          uint64_t v22 = [v21 UUIDString];

          if (v22) {
            [v15 setObject:v19 forKeyedSubscript:v22];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v16);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v52 = v12;
    uint64_t v23 = [v52 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v64 != v24) {
            objc_enumerationMutation(v52);
          }
          long long v26 = [*(id *)(*((void *)&v63 + 1) + 8 * j) deviceIdentifier];
          long long v27 = [v26 UUIDString];

          if (v27)
          {
            [v54 addObject:v27];
            [v15 removeObjectForKey:v27];
          }
        }
        uint64_t v23 = [v52 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v23);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v28 = [v15 allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v59 + 1) + 8 * k);
          BOOL v33 = [(NSMapTable *)self->_pendingStopCompletionDevices objectForKey:v32];
          uint64_t v34 = v33;
          if (v33)
          {
            dispatch_block_cancel(v33);
            id v35 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v76 = self;
              __int16 v77 = 2114;
              v78 = v32;
              _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%@ remove pending stop for %{public}@", buf, 0x16u);
            }

            [(NSMapTable *)self->_pendingStopCompletionDevices removeObjectForKey:v32];
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v29);
    }

    __int16 v48 = [(NSMutableDictionary *)self->_activeStreamDevicesByEntity allValues];
    if ([v48 count])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v51 = v48;
      uint64_t v36 = [v51 countByEnumeratingWithState:&v55 objects:v71 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v56;
        do
        {
          for (uint64_t m = 0; m != v36; ++m)
          {
            if (*(void *)v56 != v37) {
              objc_enumerationMutation(v51);
            }
            long long v39 = *(void **)(*((void *)&v55 + 1) + 8 * m);
            long long v40 = [v39 transportDevice];
            long long v41 = [v40 deviceIdentifier];
            long long v42 = [v41 UUIDString];

            if (v42 && ([v54 containsObject:v42] & 1) == 0)
            {
              [(NSHashTable *)self->_skippedStopStreamByDevices removeObject:v39];
              __int16 v43 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v76 = self;
                __int16 v77 = 2114;
                v78 = v39;
                _os_log_impl(&dword_235FC2000, v43, OS_LOG_TYPE_DEFAULT, "%@ remove stream intent for terminated device %{public}@", buf, 0x16u);
              }

              int v44 = self;
              objc_sync_enter(v44);
              activeStreamDevicesByEntity = self->_activeStreamDevicesByEntity;
              __int16 v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v39, "entity"));
              [(NSMutableDictionary *)activeStreamDevicesByEntity removeObjectForKey:v46];

              objc_sync_exit(v44);
            }
          }
          uint64_t v36 = [v51 countByEnumeratingWithState:&v55 objects:v71 count:16];
        }
        while (v36);
      }
    }
    id v10 = v47;
  }
}

- (BOOL)startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7
{
  id v12 = a3;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__1;
  long long v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __135__CMContinuityCaptureSessionStateManager_startSessionWithDevice_forTransportType_validateTransport_initiatedOnCommunalDevice_outError___block_invoke;
  v17[3] = &unk_264C99580;
  id v19 = &v30;
  void v17[4] = self;
  id v14 = v12;
  id v20 = &v24;
  int64_t v21 = a4;
  BOOL v22 = a5;
  BOOL v23 = a6;
  id v18 = v14;
  dispatch_async_and_wait(queue, v17);

  if (a7) {
    *a7 = (id) v25[5];
  }
  char v15 = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __135__CMContinuityCaptureSessionStateManager_startSessionWithDevice_forTransportType_validateTransport_initiatedOnCommunalDevice_outError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v2 _startSessionWithDevice:v3 forTransportType:v6 validateTransport:v4 initiatedOnCommunalDevice:v5 outError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
}

- (BOOL)_startSessionWithDevice:(id)a3 forTransportType:(int64_t)a4 validateTransport:(BOOL)a5 initiatedOnCommunalDevice:(BOOL)a6 outError:(id *)a7
{
  BOOL v72 = a6;
  BOOL v7 = a5;
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  uint64_t v11 = [v10 availableClientDevices];

  id v12 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
    *(_DWORD *)buf = 138413570;
    __int16 v77 = self;
    __int16 v78 = 2080;
    uint64_t v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initiatedO"
          "nCommunalDevice:outError:]";
    __int16 v80 = 2114;
    *(void *)v81 = v9;
    *(_WORD *)&v81[8] = 2114;
    v82 = v13;
    __int16 v83 = 1024;
    BOOL v84 = v7;
    __int16 v85 = 2114;
    uint64_t v86 = v11;
    _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ Active session %{public}@ validateTransport:%d availableDevices:%{public}@", buf, 0x3Au);
  }
  BOOL v74 = v7;
  v75 = (void *)v11;

  uint64_t v14 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
  if (v14)
  {
    char v15 = (void *)v14;
    uint64_t v16 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
    uint64_t v17 = [v16 device];
    id v18 = [v17 deviceIdentifier];
    id v19 = [v18 UUIDString];
    id v20 = [v9 deviceIdentifier];
    int64_t v21 = [v20 UUIDString];
    char v22 = [v19 isEqualToString:v21];

    if ((v22 & 1) == 0)
    {
      uint64_t v36 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
        *(_DWORD *)buf = 138412802;
        __int16 v77 = self;
        __int16 v78 = 2082;
        uint64_t v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initia"
              "tedOnCommunalDevice:outError:]";
        __int16 v80 = 2114;
        *(void *)v81 = v37;
        _os_log_impl(&dword_235FC2000, v36, OS_LOG_TYPE_DEFAULT, "%@ %{public}s already active session for %{public}@", buf, 0x20u);
      }
      char v33 = (char *)v9;
      v38 = v75;
      long long v39 = a7;
      if (!a7) {
        goto LABEL_55;
      }
      id v40 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v41 = -1005;
      goto LABEL_51;
    }
  }
  uint64_t v23 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
  if (!v23) {
    goto LABEL_9;
  }
  uint64_t v24 = (void *)v23;
  long long v25 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
  uint64_t v26 = [v25 device];
  long long v27 = [v26 deviceIdentifier];
  long long v28 = [v27 UUIDString];
  id v29 = [v9 deviceIdentifier];
  uint64_t v30 = [v29 UUIDString];
  int v31 = [v28 isEqualToString:v30];

  if (!v31 || v74)
  {
LABEL_9:
    uint64_t v34 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
    char v33 = (char *)v9;
    if (v34)
    {

      unint64_t v35 = 0x264C98000;
      goto LABEL_16;
    }
    unint64_t v35 = 0x264C98000uLL;
    long long v42 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    char v43 = [v42 isUserSelectedDeviceIfApplicable:v9];

    if (v43)
    {
LABEL_16:
      if (v74)
      {
        unint64_t v44 = [v9 deviceStatus] & 0x1000000;
        unint64_t v45 = [v9 deviceStatus] & 0x200;
        __int16 v46 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          id v47 = [*(id *)(v35 + 2944) sharedInstance];
          uint64_t v48 = [v47 transportErrorFlags];
          *(_DWORD *)buf = 138413058;
          __int16 v77 = self;
          __int16 v78 = 2048;
          uint64_t v79 = (const char *)v48;
          __int16 v80 = 1024;
          *(_DWORD *)v81 = v44 >> 24;
          *(_WORD *)&v81[4] = 1024;
          *(_DWORD *)&v81[6] = v45 >> 9;
          _os_log_impl(&dword_235FC2000, v46, OS_LOG_TYPE_DEFAULT, "%@ errorFlags : %llx wired:%d wireless:%d", buf, 0x22u);
        }
        id v49 = [*(id *)(v35 + 2944) sharedInstance];
        __int16 v50 = [v49 transportErrorFlags];

        if ((v50 & 0x100) != 0)
        {
          id v51 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v77 = self;
            _os_log_impl(&dword_235FC2000, v51, OS_LOG_TYPE_DEFAULT, "%@ RPError : RPErrorFlagsNoManatee", buf, 0xCu);
          }
        }
        if (!v44)
        {
          id v52 = [*(id *)(v35 + 2944) sharedInstance];
          char v53 = [v52 transportErrorFlags];

          if ((v53 & 4) != 0 || !v45)
          {
            id v54 = CMContinuityCaptureLog(0);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v77 = self;
              __int16 v78 = 2114;
              uint64_t v79 = v33;
              _os_log_impl(&dword_235FC2000, v54, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) RPError : USB inactive and WifiOff", buf, 0x16u);
            }

            if (!v45)
            {
              long long v55 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v77 = self;
                __int16 v78 = 2114;
                uint64_t v79 = v33;
                _os_log_impl(&dword_235FC2000, v55, OS_LOG_TYPE_DEFAULT, "%@ (%{public}@) non wired with wifip2p2 disabled", buf, 0x16u);
              }

              v38 = v75;
              if (a7) {
                *a7 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1011 userInfo:0];
              }
              long long v56 = self;
              objc_sync_enter(v56);
              activeSession = v56->_activeSession;
              v56->_activeSession = 0;

              objc_sync_exit(v56);
              long long v58 = CMContinuityCaptureLog(0);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                if (a7) {
                  id v59 = *a7;
                }
                else {
                  id v59 = 0;
                }
                *(_DWORD *)buf = 138412802;
                __int16 v77 = v56;
                __int16 v78 = 2080;
                uint64_t v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTranspor"
                      "t:initiatedOnCommunalDevice:outError:]";
                __int16 v80 = 2114;
                *(void *)v81 = v59;
                _os_log_impl(&dword_235FC2000, v58, OS_LOG_TYPE_DEFAULT, "%@ %s Failed to start session error %{public}@", buf, 0x20u);
              }

LABEL_55:
              BOOL v32 = 0;
              goto LABEL_56;
            }
          }
        }
        long long v60 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
        long long v61 = [v33 deviceIdentifier];
        long long v62 = [v61 UUIDString];
        [v60 unscheduleNotificationForDeviceIdentifier:v62 type:14 clearHistory:0];
      }
      long long v63 = [(CMContinuityCaptureSessionStateManager *)self activeSession];

      if (v63)
      {
        CMContinuityCaptureLog(0);
        long long v64 = (CMContinuityCaptureActiveSession *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v64->super, OS_LOG_TYPE_DEFAULT))
        {
          long long v65 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
          *(_DWORD *)buf = 138412546;
          __int16 v77 = self;
          __int16 v78 = 2114;
          uint64_t v79 = v65;
          _os_log_impl(&dword_235FC2000, &v64->super, OS_LOG_TYPE_DEFAULT, "%@ Connect to active session %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v64 = [[CMContinuityCaptureActiveSession alloc] initWithDevice:v33 transport:a4 initiatedOnCommunalDevice:v72];
        if (v64)
        {
          long long v66 = self;
          objc_sync_enter(v66);
          objc_storeStrong((id *)&v66->_activeSession, v64);
          objc_sync_exit(v66);
        }
        long long v67 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          long long v68 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
          *(_DWORD *)buf = 138412546;
          __int16 v77 = self;
          __int16 v78 = 2114;
          uint64_t v79 = v68;
          _os_log_impl(&dword_235FC2000, v67, OS_LOG_TYPE_DEFAULT, "%@ Activate session %{public}@", buf, 0x16u);
        }
      }

      BOOL v32 = 1;
      goto LABEL_46;
    }
    long long v69 = CMContinuityCaptureLog(0);
    v38 = v75;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v77 = self;
      __int16 v78 = 2082;
      uint64_t v79 = "-[CMContinuityCaptureSessionStateManager _startSessionWithDevice:forTransportType:validateTransport:initiate"
            "dOnCommunalDevice:outError:]";
      __int16 v80 = 2114;
      *(void *)v81 = v9;
      _os_log_impl(&dword_235FC2000, v69, OS_LOG_TYPE_DEFAULT, "%@ %{public}s device %{public}@ unavialble", buf, 0x20u);
    }

    long long v39 = a7;
    if (!a7) {
      goto LABEL_55;
    }
    id v40 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v41 = -1013;
LABEL_51:
    BOOL v32 = 0;
    *long long v39 = (id)[v40 initWithDomain:@"ContinuityCapture" code:v41 userInfo:0];
    goto LABEL_56;
  }
  BOOL v32 = 1;
  char v33 = (char *)v9;
LABEL_46:
  v38 = v75;
LABEL_56:

  return v32;
}

- (void)stopCurrentSession:(id)a3 syncOnOwnedQueue:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__CMContinuityCaptureSessionStateManager_stopCurrentSession_syncOnOwnedQueue___block_invoke;
    v8[3] = &unk_264C99080;
    v8[4] = self;
    id v9 = v6;
    dispatch_async_and_wait(queue, v8);
  }
  else
  {
    [(CMContinuityCaptureSessionStateManager *)self _stopCurrentSession:v6];
  }
}

uint64_t __78__CMContinuityCaptureSessionStateManager_stopCurrentSession_syncOnOwnedQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopCurrentSession:*(void *)(a1 + 40)];
}

- (void)_stopCurrentSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  [v5 discardUserSelectedDeviceIfApplicableWithReason:v4];

  id v6 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
    int v16 = 138413058;
    uint64_t v17 = self;
    __int16 v18 = 2080;
    id v19 = "-[CMContinuityCaptureSessionStateManager _stopCurrentSession:]";
    __int16 v20 = 2114;
    int64_t v21 = v7;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Active session %{public}@ reason %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  char v8 = [(CMContinuityCaptureSessionStateManager *)self activeSession];

  if (v8)
  {
    id v9 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
    id v10 = [v9 shieldSessionID];

    if (v10)
    {
      uint64_t v11 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
      id v12 = [v11 device];
      uint64_t v13 = [(CMContinuityCaptureSessionStateManager *)self activeSession];
      objc_msgSend(v12, "relayUserDisconnectForTransport:reason:shieldSessionID:", objc_msgSend(v13, "transport"), v4, v10);
    }
    uint64_t v14 = self;
    objc_sync_enter(v14);
    activeSession = v14->_activeSession;
    v14->_activeSession = 0;

    objc_sync_exit(v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_skippedStopStreamByDevices, 0);
  objc_storeStrong((id *)&self->_activeStreamDevicesByEntity, 0);
  objc_storeStrong((id *)&self->_pendingStopCompletionDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end