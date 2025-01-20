@interface DSListener
- (BOOL)isTestMode;
- (DSClientMotionDataOptions)motionDataOptions;
- (DSListener)initWithDispatchQueue:(id)a3;
- (NSArray)activeProviders;
- (double)avgListenerStartInterval;
- (id)_findProviderWithIdentifier:(id)a3;
- (unsigned)maxListenerClients;
- (void)_didFindDevice:(id)a3;
- (void)_didLoseDevice:(id)a3;
- (void)_rapportReceivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_rapportReceivedHeartbeatRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_receivedData:(id)a3 fromProvider:(id)a4;
- (void)_sendRequestID:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_startCASessionMetricCollection;
- (void)_stopCASessionMetricCollection;
- (void)_stopListener;
- (void)_subscribeToMotionData;
- (void)_unsubscribeToMotionData;
- (void)_updateCurrentProvider:(id)a3;
- (void)setAvgListenerStartInterval:(double)a3;
- (void)setIsTestMode:(BOOL)a3;
- (void)setMaxListenerClients:(unsigned int)a3;
- (void)setMotionDataOptions:(id)a3;
- (void)startMotionDataListenerWithOptions:(id)a3;
- (void)stopMotionDataListener;
@end

@implementation DSListener

- (DSListener)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DSListener;
  id v5 = [(DSListener *)&v22 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
      v7 = *((void *)v5 + 2);
      *((void *)v5 + 2) = v6;
    }
    else
    {
      v8 = (const char *)[@"com.apple.distributedsensing.clientQueue" UTF8String];
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
      v11 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v10;

      v12 = +[DSLogging sharedInstance];
      v7 = [v12 dsLogger];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] client queue created \n", v21, 2u);
      }
    }

    v13 = objc_alloc_init(DSClientMotionDataOptions);
    v14 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v13;

    v15 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = 0;

    v16 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = 0;

    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v17;

    *((_WORD *)v5 + 20) = 0;
    *((unsigned char *)v5 + 42) = 0;
    v19 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = 0;

    *((_DWORD *)v5 + 14) = 0;
    *((_DWORD *)v5 + 23) = 0;
    *((void *)v5 + 13) = 0;
    *((void *)v5 + 9) = 0;
    *((void *)v5 + 10) = 0;
    *((void *)v5 + 8) = 0;
    *((unsigned char *)v5 + 88) = 0;
  }

  return (DSListener *)v5;
}

- (NSArray)activeProviders
{
  v2 = self;
  objc_sync_enter(v2);
  providerDictionary = v2->_providerDictionary;
  if (providerDictionary)
  {
    id v4 = [(NSMutableDictionary *)providerDictionary allValues];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)startMotionDataListenerWithOptions:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[DSLogging sharedInstance];
  id v6 = [v5 dsLogger];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSListener] Starting Motion Data Listener\n", buf, 2u);
  }

  -[DSClientMotionDataOptions setDataSubType:](self->_motionDataOptions, "setDataSubType:", [v4 dataSubType]);
  -[DSClientMotionDataOptions setDeviceType:](self->_motionDataOptions, "setDeviceType:", [v4 deviceType]);
  if (self->_discoveryClient)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = @"Listener Discovery companion link already exists";
    v8 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v9 = [v7 errorWithDomain:@"DSErrorDomain" code:7 userInfo:v8];

    [(DSListener *)self failedToStartListenerWithError:v9];
  }
  else
  {
    dispatch_queue_t v10 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v10;

    [(RPCompanionLinkClient *)self->_discoveryClient setControlFlags:14];
    [(RPCompanionLinkClient *)self->_discoveryClient setDispatchQueue:self->_queue];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke;
    v25[3] = &unk_2646D4EE8;
    objc_copyWeak(&v26, (id *)buf);
    [(RPCompanionLinkClient *)self->_discoveryClient setInvalidationHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_61;
    v23[3] = &unk_2646D4F10;
    objc_copyWeak(&v24, (id *)buf);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceFoundHandler:v23];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_2;
    v21[3] = &unk_2646D4F10;
    objc_copyWeak(&v22, (id *)buf);
    [(RPCompanionLinkClient *)self->_discoveryClient setDeviceLostHandler:v21];
    v12 = self->_discoveryClient;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_3;
    v19[3] = &unk_2646D4F38;
    objc_copyWeak(&v20, (id *)buf);
    [(RPCompanionLinkClient *)v12 registerRequestID:@"com.apple.distributedsensing.heartbeatRequest" options:0 handler:v19];
    v13 = self->_discoveryClient;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_4;
    v17[3] = &unk_2646D4F38;
    objc_copyWeak(&v18, (id *)buf);
    [(RPCompanionLinkClient *)v13 registerRequestID:@"com.apple.distributedsensing.dataRequest" options:0 handler:v17];
    v14 = self->_discoveryClient;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__DSListener_startMotionDataListenerWithOptions___block_invoke_5;
    v15[3] = &unk_2646D51E8;
    objc_copyWeak(&v16, (id *)buf);
    [(RPCompanionLinkClient *)v14 activateWithCompletion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[DSLogging sharedInstance];
    v3 = [v2 dsLogger];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "[DSListener] discovery companion link invalidated\n", v4, 2u);
    }
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_61(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didFindDevice:v5];
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didLoseDevice:v5];
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _rapportReceivedHeartbeatRequest:v11 options:v7 responseHandler:v8];
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _rapportReceivedDataRequest:v11 options:v7 responseHandler:v8];
  }
}

void __49__DSListener_startMotionDataListenerWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = +[DSLogging sharedInstance];
      id v7 = [v6 dsLogger];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] discovery link activation error\n", buf, 2u);
      }

      [v5 failedToStartListenerWithError:v3];
    }
    else
    {
      [WeakRetained _startCASessionMetricCollection];
      id v8 = +[DSLogging sharedInstance];
      v9 = [v8 dsLogger];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_queue_t v10 = 0;
        _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "[DSListener] Activated discovery link for discovering providers.\n", v10, 2u);
      }

      [v5 startedListener];
    }
  }
}

- (void)stopMotionDataListener
{
  id v3 = +[DSLogging sharedInstance];
  id v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] Stopping Motion Data Listener\n", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DSListener_stopMotionDataListener__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  id v6 = self;
  dispatch_async(queue, block);
}

uint64_t __36__DSListener_stopMotionDataListener__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 41);
  id v3 = +[DSLogging sharedInstance];
  id v4 = [v3 dsLogger];

  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] Unsubscribing from Motion Data\n", v7, 2u);
    }

    return [*(id *)(a1 + 32) _unsubscribeToMotionData];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSListener] No active subscription during stop\n", buf, 2u);
    }

    return [*(id *)(a1 + 32) _stopListener];
  }
}

- (void)_rapportReceivedHeartbeatRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  v9 = +[DSLogging sharedInstance];
  dispatch_queue_t v10 = [v9 dsLogger];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] received heartbeat request\n", (uint8_t *)&v24, 2u);
  }

  CFStringGetTypeID();
  id v11 = CFDictionaryGetTypedValue();

  if (!v11)
  {
    v23 = +[DSLogging sharedInstance];
    id v22 = [v23 dsLogger];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_223BD6000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] No sender ID\n", (uint8_t *)&v24, 2u);
    }
    goto LABEL_18;
  }
  if (self->_isStopCalled)
  {
    v12 = +[DSLogging sharedInstance];
    v13 = [v12 dsLogger];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v11;
      _os_log_impl(&dword_223BD6000, v13, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting heartbeat request from sender %@ while stop was pending\n", (uint8_t *)&v24, 0xCu);
    }
  }
  currentProvider = self->_currentProvider;
  if (!currentProvider
    || ([(DSRapportDevice *)currentProvider rpDevice],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v15 identifier],
        id v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:v11],
        v16,
        v15,
        !v17))
  {
    id v20 = +[DSLogging sharedInstance];
    v21 = [v20 dsLogger];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v11;
      _os_log_impl(&dword_223BD6000, v21, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting heartbeat request from sender %@\n", (uint8_t *)&v24, 0xCu);
    }

    id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void, NSObject *))v7 + 2))(v7, 0, 0, v22);
LABEL_18:

    goto LABEL_19;
  }
  id v18 = +[DSLogging sharedInstance];
  v19 = [v18 dsLogger];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    v25 = v11;
    _os_log_impl(&dword_223BD6000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Heartbeat request received from provider %@\n", (uint8_t *)&v24, 0xCu);
  }

  ++self->_numHeartbeats;
  (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
LABEL_19:
}

- (void)_rapportReceivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[DSLogging sharedInstance];
  v12 = [v11 dsLogger];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSListener] received data request\n", (uint8_t *)&v25, 2u);
  }

  CFStringGetTypeID();
  v13 = CFDictionaryGetTypedValue();
  if ([v13 length])
  {
    if (!v8) {
      goto LABEL_12;
    }
  }
  else
  {
    CFStringGetTypeID();
    uint64_t v14 = CFDictionaryGetTypedValue();

    v13 = (void *)v14;
    if (!v8)
    {
LABEL_12:
      v23 = +[DSLogging sharedInstance];
      int v24 = [v23 dsLogger];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        uint64_t v26 = v13;
        _os_log_impl(&dword_223BD6000, v24, OS_LOG_TYPE_DEFAULT, "[DSListener] Rejecting data request from sender %@\n", (uint8_t *)&v25, 0xCu);
      }

      uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
      int v17 = (void *)v22;
      goto LABEL_15;
    }
  }
  v15 = [v8 objectForKeyedSubscript:@"payloadKey"];

  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v16 = [(DSListener *)self _findProviderWithIdentifier:v13];
  if (!v16) {
    goto LABEL_12;
  }
  int v17 = (void *)v16;
  id v18 = +[DSLogging sharedInstance];
  v19 = [v18 dsLogger];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v17 rpDevice];
    int v25 = 138412290;
    uint64_t v26 = v20;
    _os_log_impl(&dword_223BD6000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Received data from provider %@\n", (uint8_t *)&v25, 0xCu);
  }
  v21 = [v8 objectForKeyedSubscript:@"payloadKey"];
  [(DSListener *)self _receivedData:v21 fromProvider:v17];

  uint64_t v22 = 0;
LABEL_15:
  (*((void (**)(id, void, void, uint64_t))v10 + 2))(v10, 0, 0, v22);
}

- (void)_didFindDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isStopCalled)
  {
    id v10 = [v4 model];
    if (v10)
    {
      id v11 = [v4 identifier];
      if (v11)
      {
        v12 = [v4 idsDeviceIdentifier];

        if (v12)
        {
          v13 = [v4 model];
          if (!v13
            || ([v4 model],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = [v14 containsString:@"iPhone"],
                v14,
                v13,
                (v15 & 1) != 0))
          {
            uint64_t v16 = +[DSLogging sharedInstance];
            int v17 = [v16 dsLogger];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v31 = 138412290;
              id v32 = v4;
              _os_log_impl(&dword_223BD6000, v17, OS_LOG_TYPE_DEFAULT, "[DSListener] device %@ found\n", (uint8_t *)&v31, 0xCu);
            }

            id v6 = self;
            objc_sync_enter(v6);
            providerDictionary = v6->_providerDictionary;
            v19 = [v4 idsDeviceIdentifier];
            id v20 = [(NSMutableDictionary *)providerDictionary objectForKeyedSubscript:v19];

            if (v20)
            {
              v21 = +[DSLogging sharedInstance];
              uint64_t v22 = [v21 dsLogger];

              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                int v31 = 138412290;
                id v32 = v4;
                _os_log_impl(&dword_223BD6000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] Skipping provider %@, already being tracked\n", (uint8_t *)&v31, 0xCu);
              }

              objc_sync_exit(v6);
            }
            else
            {
              int v25 = (DSListener *)objc_alloc_init(MEMORY[0x263F62B80]);
              uint64_t v26 = [v4 idsDeviceIdentifier];
              [(DSListener *)v25 setIdentifier:v26];

              uint64_t v27 = [[DSProviderDevice alloc] initWithRapportDevice:v25 queue:self->_queue];
              uint64_t v28 = v6->_providerDictionary;
              v29 = [(DSListener *)v25 identifier];
              [(NSMutableDictionary *)v28 setValue:v27 forKey:v29];

              objc_sync_exit(v6);
              if (!v6->_currentProvider) {
                [(DSListener *)v6 _updateCurrentProvider:v27];
              }
              v30 = [(DSListener *)v6 activeProviders];
              [(DSListener *)v6 updateProviders:v30];

              id v6 = v25;
            }
            goto LABEL_20;
          }
          int v24 = +[DSLogging sharedInstance];
          id v6 = [v24 dsLogger];

          if (!os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          int v31 = 138412290;
          id v32 = v4;
          id v7 = "[DSListener] Skipping incompatible RPCompanionLinkDevice: %@\n";
LABEL_18:
          p_super = &v6->super;
          uint32_t v9 = 12;
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    v23 = +[DSLogging sharedInstance];
    id v6 = [v23 dsLogger];

    if (!os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    int v31 = 138412290;
    id v32 = v4;
    id v7 = "[DSListener] device %@ missing details, skipping\n";
    goto LABEL_18;
  }
  BOOL v5 = +[DSLogging sharedInstance];
  id v6 = [v5 dsLogger];

  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    id v7 = "[DSListener] Did find device, but stop was called, returning\n";
    p_super = &v6->super;
    uint32_t v9 = 2;
LABEL_19:
    _os_log_impl(&dword_223BD6000, p_super, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v31, v9);
  }
LABEL_20:
}

- (void)_didLoseDevice:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_isStopCalled)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    BOOL v5 = self;
    objc_sync_enter(v5);
    providerDictionary = v5->_providerDictionary;
    id v7 = [v4 identifier];
    id v8 = [(NSMutableDictionary *)providerDictionary objectForKeyedSubscript:v7];

    if (v8)
    {
      if (![v8 isResponsePending])
      {
        id v11 = v5->_providerDictionary;
        v12 = [v8 identifier];
        [(NSMutableDictionary *)v11 removeObjectForKey:v12];

        v13 = [(DSRapportDevice *)v5->_currentProvider rpDevice];
        uint64_t v14 = [v13 identifier];
        char v15 = [v8 rpDevice];
        uint64_t v16 = [v15 identifier];
        int v17 = [v14 isEqualToString:v16];

        if (v17)
        {
          id v18 = +[DSLogging sharedInstance];
          v19 = [v18 dsLogger];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [(DSRapportDevice *)v5->_currentProvider rpDevice];
            *(_DWORD *)buf = 138412290;
            id v32 = v20;
            _os_log_impl(&dword_223BD6000, v19, OS_LOG_TYPE_DEFAULT, "[DSListener] Current provider lost %@\n", buf, 0xCu);
          }
          currentProvider = v5->_currentProvider;
          v5->_currentProvider = 0;

          ++v5->_activeProviderLostCount;
          if (!v5->_isTestMode) {
            [(DSCoreAnalyticsEventHandler *)v5->_caEventHandler dsProviderUnavailable];
          }
          uint64_t v22 = v5->_providerDictionary;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __29__DSListener__didLoseDevice___block_invoke;
          v24[3] = &unk_2646D5288;
          v24[4] = &v25;
          [(NSMutableDictionary *)v22 enumerateKeysAndObjectsUsingBlock:v24];
        }
        objc_sync_exit(v5);

        if (v26[5]) {
          -[DSListener _updateCurrentProvider:](v5, "_updateCurrentProvider:");
        }
        uint64_t v23 = [(DSListener *)v5 activeProviders];
        [(DSListener *)v5 updateProviders:v23];
        BOOL v5 = (DSListener *)v23;
        goto LABEL_17;
      }
      uint32_t v9 = +[DSLogging sharedInstance];
      id v10 = [v9 dsLogger];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v4;
        _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] device %@ lost but response was pending\n", buf, 0xCu);
      }
    }
    objc_sync_exit(v5);
LABEL_17:

    _Block_object_dispose(&v25, 8);
  }
}

void __29__DSListener__didLoseDevice___block_invoke(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

- (id)_findProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  int v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  BOOL v5 = self;
  objc_sync_enter(v5);
  providerDictionary = v5->_providerDictionary;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__DSListener__findProviderWithIdentifier___block_invoke;
  v10[3] = &unk_2646D52B0;
  id v7 = v4;
  id v11 = v7;
  v12 = &v13;
  [(NSMutableDictionary *)providerDictionary enumerateKeysAndObjectsUsingBlock:v10];

  objc_sync_exit(v5);
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __42__DSListener__findProviderWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v7 = [v10 rpDevice];
  id v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)_updateCurrentProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[DSLogging sharedInstance];
  id v7 = [v6 dsLogger];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 rpDevice];
    int v15 = 138412290;
    uint64_t v16 = v8;
    _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] Updating new provider %@\n", (uint8_t *)&v15, 0xCu);
  }
  int v9 = +[DSLogging sharedInstance];
  id v10 = [v9 dsLogger];

  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v5 rpDevice];
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "[DSListener] Current Provider = %@\n", (uint8_t *)&v15, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentProvider, a3);
    v12 = +[DSLogging sharedInstance];
    uint64_t v13 = [v12 dsLogger];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v5 rpDevice];
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_impl(&dword_223BD6000, v13, OS_LOG_TYPE_DEFAULT, "[DSListener] Sending Subscription request to Provider = %@\n", (uint8_t *)&v15, 0xCu);
    }
    [(DSListener *)self _subscribeToMotionData];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DSListener _updateCurrentProvider:](v10);
    }
  }
}

- (void)_subscribeToMotionData
{
  v20[4] = *MEMORY[0x263EF8340];
  if (self->_currentProvider)
  {
    v20[0] = @"1.0";
    v19[0] = @"dsVersionKey";
    v19[1] = @"dataSubTypeKey";
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DSClientMotionDataOptions dataSubType](self->_motionDataOptions, "dataSubType"));
    v20[1] = v3;
    v19[2] = @"requestType";
    v19[3] = @"subscriptionStart";
    v20[2] = &unk_26D7517D0;
    v20[3] = MEMORY[0x263EFFA88];
    id v4 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

    *(void *)buf = 0;
    uint64_t v14 = buf;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy_;
    uint64_t v17 = __Block_byref_object_dispose_;
    id v18 = (DSProviderDevice *)0xAAAAAAAAAAAAAAAALL;
    id v18 = self->_currentProvider;
    [*((id *)v14 + 5) setIsResponsePending:1];
    id v5 = self;
    uint64_t v6 = *((void *)v14 + 5);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__DSListener__subscribeToMotionData__block_invoke;
    v9[3] = &unk_2646D52D8;
    v9[4] = v5;
    v12 = buf;
    id v7 = v4;
    id v10 = v7;
    id v11 = v5;
    [(DSListener *)v5 _sendRequestID:@"com.apple.distributedsensing.subscriptionRequest" request:v7 device:v6 options:0 responseHandler:v9];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = +[DSLogging sharedInstance];
    id v7 = [v8 dsLogger];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSListener] Trying to subscribe while there's no active provider\n", buf, 2u);
    }
  }
}

void __36__DSListener__subscribeToMotionData__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[4];
  if (!v10 || !*(void *)(v10 + 24)) {
    goto LABEL_22;
  }
  [*(id *)(*(void *)(a1[7] + 8) + 40) setIsResponsePending:0];
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  unsigned int v12 = Int64Ranged;
  uint64_t v13 = a1[4];
  if (*(unsigned char *)(v13 + 42))
  {
    if (v9)
    {
LABEL_5:
      uint64_t v14 = +[DSLogging sharedInstance];
      uint64_t v15 = [v14 dsLogger];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = (void *)a1[5];
        uint64_t v17 = [*(id *)(a1[4] + 24) rpDevice];
        id v18 = (void *)v17;
        if (v12 > 0xB) {
          v19 = "?";
        }
        else {
          v19 = off_2646D5340[v12];
        }
        int v34 = 138412802;
        v35 = v16;
        __int16 v36 = 2112;
        uint64_t v37 = v17;
        __int16 v38 = 2080;
        v39 = v19;
        _os_log_impl(&dword_223BD6000, v15, OS_LOG_TYPE_DEFAULT, "[DSListener] Send Subscription Start Request %@ to device %@ failed over data link: %s\n", (uint8_t *)&v34, 0x20u);
      }
      int v31 = (id *)a1[4];
      id v32 = [v31[3] rpDevice];
      [v31 _didLoseDevice:v32];

      uint64_t v33 = a1[4];
      if (*(unsigned char *)(v33 + 42)) {
        [*(id *)(v33 + 48) dsFirstListenerSessionSetUnsuccessful];
      }
      goto LABEL_22;
    }
  }
  else
  {
    *(unsigned char *)(v13 + 42) = 1;
    *(_DWORD *)(a1[4] + 56) = Int64Ranged;
    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v20 = a1[4];
  if (!*(unsigned char *)(v20 + 88)) {
    [*(id *)(v20 + 48) dsProviderAvailable];
  }
  v21 = +[DSLogging sharedInstance];
  uint64_t v22 = [v21 dsLogger];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)a1[5];
    int v24 = [*(id *)(*(void *)(a1[7] + 8) + 40) rpDevice];
    int v34 = 138412546;
    v35 = v23;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v24;
    _os_log_impl(&dword_223BD6000, v22, OS_LOG_TYPE_DEFAULT, "[DSListener] Sent Subscription Start Request %@ to device %@\n", (uint8_t *)&v34, 0x16u);
  }
  *(unsigned char *)(a1[4] + 41) = 1;
  if (v7)
  {
    uint64_t v25 = [v7 objectForKeyedSubscript:@"payloadKey"];

    if (v25)
    {
      uint64_t v26 = +[DSLogging sharedInstance];
      uint64_t v27 = [v26 dsLogger];

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [*(id *)(*(void *)(a1[7] + 8) + 40) rpDevice];
        int v34 = 138412290;
        v35 = v28;
        _os_log_impl(&dword_223BD6000, v27, OS_LOG_TYPE_DEFAULT, "[DSListener] Received data with subscription response from provider %@\n", (uint8_t *)&v34, 0xCu);
      }
      v29 = (void *)a1[6];
      id v30 = [v7 objectForKeyedSubscript:@"payloadKey"];
      [v29 _receivedData:v30 fromProvider:*(void *)(*(void *)(a1[7] + 8) + 40)];
    }
  }
LABEL_22:
}

- (void)_unsubscribeToMotionData
{
  void v17[4] = *MEMORY[0x263EF8340];
  if (self->_currentProvider)
  {
    v17[0] = @"1.0";
    v16[0] = @"dsVersionKey";
    v16[1] = @"dataSubTypeKey";
    id v3 = NSNumber;
    motionDataOptions = self->_motionDataOptions;
    id v5 = self;
    uint64_t v6 = objc_msgSend(v3, "numberWithUnsignedInt:", -[DSClientMotionDataOptions dataSubType](motionDataOptions, "dataSubType"));
    v17[1] = v6;
    v17[2] = &unk_26D7517D0;
    v16[2] = @"requestType";
    v16[3] = @"subscriptionStart";
    v17[3] = MEMORY[0x263EFFA80];
    id v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

    [(DSProviderDevice *)self->_currentProvider setIsResponsePending:1];
    currentProvider = self->_currentProvider;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__DSListener__unsubscribeToMotionData__block_invoke;
    v13[3] = &unk_2646D5300;
    v13[4] = v5;
    id v14 = v7;
    id v9 = v7;
    [(DSListener *)v5 _sendRequestID:@"com.apple.distributedsensing.subscriptionRequest" request:v9 device:currentProvider options:0 responseHandler:v13];
  }
  else
  {
    uint64_t v10 = self;
    id v11 = +[DSLogging sharedInstance];
    unsigned int v12 = [v11 dsLogger];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSListener] No active provider during unsubscribe\n", buf, 2u);
    }

    [(DSListener *)v10 _stopListener];
  }
}

uint64_t __38__DSListener__unsubscribeToMotionData__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*(void *)(result + 32)) {
    return result;
  }
  uint64_t v5 = result;
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  id v7 = +[DSLogging sharedInstance];
  id v8 = [v7 dsLogger];

  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(v5 + 40);
      uint64_t v11 = [*(id *)(*(void *)(v5 + 32) + 24) rpDevice];
      unsigned int v12 = (void *)v11;
      if (Int64Ranged > 0xB) {
        uint64_t v13 = "?";
      }
      else {
        uint64_t v13 = off_2646D5340[Int64Ranged];
      }
      *(_DWORD *)v19 = 138412802;
      *(void *)&void v19[4] = v10;
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v11;
      *(_WORD *)&v19[22] = 2080;
      uint64_t v20 = v13;
      uint64_t v15 = "[DSListener] Send Subscription Stop Request %@ to device %@ failed over data link: %s\n";
      uint64_t v16 = v8;
      uint32_t v17 = 32;
      goto LABEL_10;
    }
  }
  else if (v9)
  {
    uint64_t v14 = *(void *)(v5 + 40);
    unsigned int v12 = [*(id *)(*(void *)(v5 + 32) + 24) rpDevice];
    *(_DWORD *)v19 = 138412546;
    *(void *)&void v19[4] = v14;
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = v12;
    uint64_t v15 = "[DSListener] Sent Stop Subscription Request %@ to device %@\n";
    uint64_t v16 = v8;
    uint32_t v17 = 22;
LABEL_10:
    _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, v15, v19, v17);
  }
  [*(id *)(*(void *)(v5 + 32) + 24) setIsResponsePending:0];
  uint64_t v18 = *(void *)(v5 + 32);
  if (!*(unsigned char *)(v18 + 88))
  {
    [*(id *)(v18 + 48) dsProviderUnavailable];
    uint64_t v18 = *(void *)(v5 + 32);
  }
  return objc_msgSend((id)v18, "_stopListener", *(_OWORD *)v19, *(void *)&v19[16], v20);
}

- (void)_stopListener
{
  [(RPCompanionLinkClient *)self->_discoveryClient deregisterRequestID:@"com.apple.distributedsensing.dataRequest"];
  [(RPCompanionLinkClient *)self->_discoveryClient deregisterRequestID:@"com.apple.distributedsensing.heartbeatRequest"];
  id v3 = self;
  objc_sync_enter(v3);
  [(NSMutableDictionary *)v3->_providerDictionary enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
  [(NSMutableDictionary *)v3->_providerDictionary removeAllObjects];
  objc_sync_exit(v3);

  currentProvider = v3->_currentProvider;
  v3->_currentProvider = 0;

  [(DSClientMotionDataOptions *)v3->_motionDataOptions setDataSubType:0];
  [(DSClientMotionDataOptions *)v3->_motionDataOptions setDeviceType:0];
  [(RPCompanionLinkClient *)self->_discoveryClient invalidate];
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0;

  *(_WORD *)&v3->_isStopCalled = 0;
  v3->_isFirstSubscription = 0;
  [(DSListener *)v3 _stopCASessionMetricCollection];
  caEventHandler = v3->_caEventHandler;
  v3->_caEventHandler = 0;

  v3->_firstSubscriptionDataLinkType = 0;
  v3->_numMotionStateMessages = 0;
  v3->_activeProviderLostCount = 0;
  v3->_numHeartbeats = 0;
  id v7 = +[DSLogging sharedInstance];
  id v8 = [v7 dsLogger];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSListener] Stopped\n", v9, 2u);
  }

  [(DSListener *)v3 stoppedListener];
}

uint64_t __27__DSListener__stopListener__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_sendRequestID:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  if (a4) {
    id v10 = a4;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA78];
  }
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v17 = (id)[v10 mutableCopy];
  [v17 setObject:v14 forKeyedSubscript:@"RapportRequestIDKey"];

  uint64_t v15 = (void *)MEMORY[0x223CBE3A0](v11);
  [v17 setObject:v15 forKeyedSubscript:@"RapportRequestHandlerKey"];

  [v17 setObject:v12 forKeyedSubscript:@"RapportOptionsKey"];
  uint64_t v16 = (void *)[v17 copy];
  [v13 addRequestToQueue:v16];

  [v13 activateSessionClient];
}

- (void)_receivedData:(id)a3 fromProvider:(id)a4
{
}

- (void)_startCASessionMetricCollection
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_isTestMode)
  {
    int v2 = +[DSLogging sharedInstance];
    id v3 = [v2 dsLogger];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "[DSListener] Skipping core analytics event init\n";
LABEL_7:
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    }
  }
  else if (self->_caEventHandler)
  {
    uint64_t v6 = +[DSLogging sharedInstance];
    id v3 = [v6 dsLogger];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "[DSListener] Core analytics event handler already exists\n";
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = objc_alloc_init(DSCoreAnalyticsEventHandler);
    caEventHandler = self->_caEventHandler;
    self->_caEventHandler = v7;

    if (!self->_caEventHandler)
    {
      uint64_t v22 = +[DSLogging sharedInstance];
      id v3 = [v22 dsLogger];

      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      id v4 = "[DSListener] Core analytics event handler not initialized\n";
      goto LABEL_7;
    }
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v23 = self;
    BOOL v9 = [(RPCompanionLinkClient *)self->_discoveryClient activeDevices];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v15 = [v14 model];
          if (v15)
          {
            uint64_t v16 = (void *)v15;
            id v17 = [v14 model];
            int v18 = [v17 containsString:@"iPhone"];

            if (v18)
            {
              v19 = [v14 idsDeviceIdentifier];
              uint64_t v20 = [v3 objectForKeyedSubscript:v19];

              if (!v20)
              {
                uint64_t v21 = [v14 idsDeviceIdentifier];
                [v3 setObject:v14 forKey:v21];
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    [(DSCoreAnalyticsEventHandler *)v23->_caEventHandler dsSessionStartedWithDeviceRole:2 numPotentialProviders:[v3 count] unterminatedSession:0];
  }
LABEL_8:
}

- (void)_stopCASessionMetricCollection
{
  if (!self->_isTestMode)
  {
    caEventHandler = self->_caEventHandler;
    if (caEventHandler)
    {
      if (!self->_isSubscriptionActive)
      {
        [(DSCoreAnalyticsEventHandler *)caEventHandler dsFirstListenerSessionSetUnsuccessful];
        caEventHandler = self->_caEventHandler;
      }
      unint64_t numHeartbeats = self->_numHeartbeats;
      unint64_t numMotionStateMessages = self->_numMotionStateMessages;
      unint64_t activeProviderLostCount = self->_activeProviderLostCount;
      uint64_t firstSubscriptionDataLinkType = self->_firstSubscriptionDataLinkType;
      uint64_t maxListenerClients = self->_maxListenerClients;
      double avgListenerStartInterval = self->_avgListenerStartInterval;
      [(DSCoreAnalyticsEventHandler *)caEventHandler dsSessionCompletedWithStopReason:0 numHeartbeats:numHeartbeats numMotionStateMessages:numMotionStateMessages activeProviderLostCount:activeProviderLostCount dataLinkType:firstSubscriptionDataLinkType maxListenerClients:maxListenerClients avgListenerStartInterval:avgListenerStartInterval];
    }
    else
    {
      uint64_t v10 = +[DSLogging sharedInstance];
      uint64_t v11 = [v10 dsLogger];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "[DSListener] Core analytics event handler not initialized\n", v12, 2u);
      }
    }
  }
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (DSClientMotionDataOptions)motionDataOptions
{
  return self->_motionDataOptions;
}

- (void)setMotionDataOptions:(id)a3
{
}

- (unsigned)maxListenerClients
{
  return self->_maxListenerClients;
}

- (void)setMaxListenerClients:(unsigned int)a3
{
  self->_uint64_t maxListenerClients = a3;
}

- (double)avgListenerStartInterval
{
  return self->_avgListenerStartInterval;
}

- (void)setAvgListenerStartInterval:(double)a3
{
  self->_double avgListenerStartInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
  objc_storeStrong((id *)&self->_caEventHandler, 0);
  objc_storeStrong((id *)&self->_providerDictionary, 0);
  objc_storeStrong((id *)&self->_currentProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

- (void)_updateCurrentProvider:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_223BD6000, log, OS_LOG_TYPE_ERROR, "[DSListener] Trying to update current provider with invalid object\n", v1, 2u);
}

@end