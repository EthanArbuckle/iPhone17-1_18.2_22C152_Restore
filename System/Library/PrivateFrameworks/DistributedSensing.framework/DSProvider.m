@interface DSProvider
- (BOOL)_persistListenerState;
- (BOOL)_removePersistedState;
- (BOOL)_unPersistListenerState;
- (BOOL)isSubscriptionActive;
- (BOOL)isTestMode;
- (DSClientMotionDataOptions)motionDataOptions;
- (DSProvider)initWithDispatchQueue:(id)a3;
- (void)_addNewListener:(id)a3;
- (void)_didFindDevice:(id)a3;
- (void)_didLoseDevice:(id)a3;
- (void)_fetchScreenState;
- (void)_heartBeatWithListener;
- (void)_receivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_removeCurrentListenerWithStopReason:(int)a3;
- (void)_sendMotionData:(id)a3;
- (void)_sendRequestID:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_startCASessionMetricCollection;
- (void)_stopCASessionMetricCollectionWithStopReason:(int)a3;
- (void)_stopProvider;
- (void)sendMotionData:(id)a3;
- (void)setIsSubscriptionActive:(BOOL)a3;
- (void)setIsTestMode:(BOOL)a3;
- (void)setMotionDataOptions:(id)a3;
- (void)startMotionDataProviderWithOptions:(id)a3;
- (void)stopMotionDataProvider;
@end

@implementation DSProvider

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[DSLogging sharedInstance];
    v3 = [v2 dsLogger];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "[DSProvider] companion link invalidated\n", v4, 2u);
    }
  }
}

- (DSProvider)initWithDispatchQueue:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DSProvider;
  v5 = [(DSProvider *)&v22 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
      v7 = *((void *)v5 + 1);
      *((void *)v5 + 1) = v6;
    }
    else
    {
      v8 = (const char *)[@"com.apple.distributedsensing.clientQueue" UTF8String];
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
      v11 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v10;

      v12 = +[DSLogging sharedInstance];
      v7 = [v12 dsLogger];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSProvider] client queue created \n", v21, 2u);
      }
    }

    v13 = objc_alloc_init(DSClientMotionDataOptions);
    v14 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v13;

    v15 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = 0;

    v16 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = 0;

    v17 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = 0;

    v5[56] = 0;
    v18 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = 0;

    v5[72] = 0;
    v5[110] = 0;
    v19 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = 0;

    *((void *)v5 + 11) = 0;
    *((void *)v5 + 12) = 0;
    *(void *)(v5 + 102) = 0;
  }

  return (DSProvider *)v5;
}

- (void)startMotionDataProviderWithOptions:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[DSLogging sharedInstance];
  id v6 = [v5 dsLogger];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] starting motion data provider\n", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    if (notify_register_check("com.apple.springboard.hasBlankedScreen", &self->_screenStateToken))
    {
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      v51 = @"Couldn't register for device screen state";
      v8 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v9 = [v7 errorWithDomain:@"DSErrorDomain" code:5 userInfo:v8];

      [(DSProvider *)self failedToStartProviderWithOptions:v4 error:v9];
    }
    else
    {
      char v13 = [v4 deviceType];
      char v14 = [v4 dataSubType];
      if ((v13 & 2) != 0)
      {
        v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v48 = *MEMORY[0x263F08320];
        v49 = @"Unrelated devices not supported";
        v20 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        v21 = [v19 errorWithDomain:@"DSErrorDomain" code:5 userInfo:v20];

        [(DSProvider *)self failedToStartProviderWithOptions:v4 error:v21];
      }
      else
      {
        char v15 = v14;
        if (v13) {
          [(DSClientMotionDataOptions *)self->_motionDataOptions setDeviceType:[(DSClientMotionDataOptions *)self->_motionDataOptions deviceType] | 1];
        }
        if (v15) {
          [(DSClientMotionDataOptions *)self->_motionDataOptions setDataSubType:[(DSClientMotionDataOptions *)self->_motionDataOptions dataSubType] | 1];
        }
        if ([(DSClientMotionDataOptions *)self->_motionDataOptions dataSubType]
          && [(DSClientMotionDataOptions *)self->_motionDataOptions deviceType])
        {
          if (self->_linkClient)
          {
            v16 = (void *)MEMORY[0x263F087E8];
            uint64_t v44 = *MEMORY[0x263F08320];
            v45 = @"Provider companion link already exists";
            v17 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            v18 = [v16 errorWithDomain:@"DSErrorDomain" code:7 userInfo:v17];

            [(DSProvider *)self failedToStartProviderWithOptions:v4 error:v18];
          }
          else
          {
            v25 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
            linkClient = self->_linkClient;
            self->_linkClient = v25;

            [(RPCompanionLinkClient *)self->_linkClient setControlFlags:14];
            [(RPCompanionLinkClient *)self->_linkClient setDispatchQueue:self->_clientQueue];
            *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
            objc_initWeak((id *)buf, self);
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke;
            v41[3] = &unk_2646D4EE8;
            objc_copyWeak(&v42, (id *)buf);
            [(RPCompanionLinkClient *)self->_linkClient setInvalidationHandler:v41];
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_72;
            v39[3] = &unk_2646D4F10;
            objc_copyWeak(&v40, (id *)buf);
            [(RPCompanionLinkClient *)self->_linkClient setDeviceFoundHandler:v39];
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_2;
            v37[3] = &unk_2646D4F10;
            objc_copyWeak(&v38, (id *)buf);
            [(RPCompanionLinkClient *)self->_linkClient setDeviceLostHandler:v37];
            v27 = self->_linkClient;
            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_3;
            v35[3] = &unk_2646D4F38;
            objc_copyWeak(&v36, (id *)buf);
            [(RPCompanionLinkClient *)v27 registerRequestID:@"com.apple.distributedsensing.subscriptionRequest" options:0 handler:v35];
            v28 = +[DSLogging sharedInstance];
            v29 = [v28 dsLogger];

            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v34 = 0;
              _os_log_impl(&dword_223BD6000, v29, OS_LOG_TYPE_DEFAULT, "[DSProvider] activating CompanionLink\n", v34, 2u);
            }

            v30 = self->_linkClient;
            v31[0] = MEMORY[0x263EF8330];
            v31[1] = 3221225472;
            v31[2] = __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_75;
            v31[3] = &unk_2646D4F60;
            objc_copyWeak(&v33, (id *)buf);
            id v32 = v4;
            [(RPCompanionLinkClient *)v30 activateWithCompletion:v31];

            objc_destroyWeak(&v33);
            objc_destroyWeak(&v36);
            objc_destroyWeak(&v38);
            objc_destroyWeak(&v40);
            objc_destroyWeak(&v42);
            objc_destroyWeak((id *)buf);
          }
        }
        else
        {
          objc_super v22 = (void *)MEMORY[0x263F087E8];
          uint64_t v46 = *MEMORY[0x263F08320];
          v47 = @"Invalid options";
          v23 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          v24 = [v22 errorWithDomain:@"DSErrorDomain" code:2 userInfo:v23];

          [(DSProvider *)self failedToStartProviderWithOptions:v4 error:v24];
        }
      }
    }
  }
  else
  {
    dispatch_queue_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F08320];
    v53[0] = @"Unsupported feature";
    v11 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
    v12 = [v10 errorWithDomain:@"DSErrorDomain" code:5 userInfo:v11];

    [(DSProvider *)self failedToStartProviderWithOptions:v4 error:v12];
  }
}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_72(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didFindDevice:v5];
  }
}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didLoseDevice:v5];
  }
}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _receivedDataRequest:v11 options:v7 responseHandler:v8];
  }
}

void __49__DSProvider_startMotionDataProviderWithOptions___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = +[DSLogging sharedInstance];
    id v6 = [v5 dsLogger];

    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v7)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] link activation failed\n", (uint8_t *)&v11, 2u);
      }

      [WeakRetained failedToStartProviderWithOptions:*(void *)(a1 + 32) error:v3];
    }
    else
    {
      if (v7)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] companion link activated\n", (uint8_t *)&v11, 2u);
      }

      [WeakRetained startedProviderWithOptions:WeakRetained[3]];
      [WeakRetained _unPersistListenerState];
      if (WeakRetained[4])
      {
        id v8 = +[DSLogging sharedInstance];
        v9 = [v8 dsLogger];

        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v10 = [WeakRetained[4] identifier];
          int v11 = 138412290;
          v12 = v10;
          _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "[DSProvider] START data subscription to listener %@\n", (uint8_t *)&v11, 0xCu);
        }
        [WeakRetained subscribedToMotionDataWithOptions:WeakRetained[3]];
      }
    }
  }
}

- (void)sendMotionData:(id)a3
{
  id v4 = a3;
  id v5 = +[DSLogging sharedInstance];
  id v6 = [v5 dsLogger];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] Sending motion Data\n", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  clientQueue = self->_clientQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__DSProvider_sendMotionData___block_invoke;
  v9[3] = &unk_2646D4F88;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(clientQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __29__DSProvider_sendMotionData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _sendMotionData:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)stopMotionDataProvider
{
  id v3 = +[DSLogging sharedInstance];
  id v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Stopping motion data provider\n", buf, 2u);
  }

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DSProvider_stopMotionDataProvider__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  id v6 = self;
  dispatch_async(clientQueue, block);
}

uint64_t __36__DSProvider_stopMotionDataProvider__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopProvider];
}

- (void)_didFindDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  currentListener = self->_currentListener;
  if (currentListener)
  {
    id v6 = [(DSRapportDevice *)currentListener identifier];
    BOOL v7 = [v4 idsDeviceIdentifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = +[DSLogging sharedInstance];
      id v10 = [v9 dsLogger];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "[DSProvider] did find device %@\n", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_didLoseDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  currentListener = self->_currentListener;
  if (currentListener)
  {
    id v6 = [(DSRapportDevice *)currentListener identifier];
    BOOL v7 = [v4 idsDeviceIdentifier];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      [(DSProvider *)self _fetchScreenState];
      if (self->_isScreenON)
      {
        [(DSProvider *)self _heartBeatWithListener];
      }
      else
      {
        v9 = +[DSLogging sharedInstance];
        id v10 = [v9 dsLogger];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412290;
          id v12 = v4;
          _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "[DSProvider] did lose device when screen was OFF %@, ignorning...\n", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }
}

- (void)_receivedDataRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  int v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[DSLogging sharedInstance];
  id v12 = [v11 dsLogger];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v8;
    _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data Request received %@\n", buf, 0xCu);
  }

  CFStringGetTypeID();
  uint64_t v13 = CFDictionaryGetTypedValue();
  if (!v13)
  {
    v18 = +[DSLogging sharedInstance];
    v19 = [v18 dsLogger];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v8;
      _os_log_impl(&dword_223BD6000, v19, OS_LOG_TYPE_DEFAULT, "[DSProvider] No senderID for request %@\n", buf, 0xCu);
    }
    goto LABEL_54;
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  char v15 = +[DSLogging sharedInstance];
  v16 = [v15 dsLogger];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (Int64Ranged > 0xB) {
      v17 = "?";
    }
    else {
      v17 = off_2646D4FD0[Int64Ranged];
    }
    *(_DWORD *)buf = 136315138;
    v64 = v17;
    _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data link type %s", buf, 0xCu);
  }

  if (v8)
  {
    v20 = [v8 objectForKeyedSubscript:@"requestType"];

    if (v20)
    {
      int v60 = CFDictionaryGetInt64Ranged();
      uint64_t Int64 = CFDictionaryGetInt64();
      int v21 = CFDictionaryGetInt64Ranged();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v62 = objc_claimAutoreleasedReturnValue();
      v61 = self;
      id v22 = v10;
      if ([v62 UTF8String]) {
        uint64_t v23 = TextToSourceVersion();
      }
      else {
        uint64_t v23 = 0;
      }
      v24 = +[DSLogging sharedInstance];
      v25 = [v24 dsLogger];

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v64) = v23;
        _os_log_impl(&dword_223BD6000, v25, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data requested with version key : %d\n", buf, 8u);
      }

      id v10 = v22;
      if (!v23 || v23 > TextToSourceVersion())
      {
        v26 = +[DSLogging sharedInstance];
        v27 = [v26 dsLogger];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v64) = v23;
          _os_log_impl(&dword_223BD6000, v27, OS_LOG_TYPE_DEFAULT, "[DSProvider] Unsupported version %d specified\n", buf, 8u);
        }

        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = 4;
        goto LABEL_52;
      }
      if ([(DSClientMotionDataOptions *)v61->_motionDataOptions dataSubType] == v21)
      {
        if (v60 == 2 && v59)
        {
          currentListener = v61->_currentListener;
          if (currentListener)
          {
            v31 = [(DSRapportDevice *)currentListener identifier];
            int v32 = [v13 isEqualToString:v31];

            id v33 = +[DSLogging sharedInstance];
            v34 = [v33 dsLogger];

            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if (v32)
            {
              v19 = v62;
              if (v35)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_223BD6000, v34, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data re-subscription request received\n", buf, 2u);
              }

              [(DSListenerDevice *)v61->_currentListener setResponseHandler:v22];
              [(DSProvider *)v61 requestedMotionDataWithOption:v61->_motionDataOptions];
            }
            else
            {
              v19 = v62;
              if (v35)
              {
                *(_DWORD *)buf = 138412290;
                v64 = (const char *)v13;
                _os_log_impl(&dword_223BD6000, v34, OS_LOG_TYPE_DEFAULT, "[DSProvider] Data Subscription request rejected for senderID %@, listener already exists\n", buf, 0xCu);
              }

              v56 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
              (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v56);
            }
          }
          else
          {
            id v48 = objc_alloc_init(MEMORY[0x263F62B80]);
            v49 = v48;
            if (v48)
            {
              [v48 setIdentifier:v13];
              uint64_t v50 = [[DSListenerDevice alloc] initWithRapportDevice:v49 queue:v61->_clientQueue];
              v61->_linkType = CFDictionaryGetInt64Ranged();
              [(DSListenerDevice *)v50 setResponseHandler:v22];
              [(DSListenerDevice *)v50 setVersion:v23];
              [(DSListenerDevice *)v50 setInOptions:v61->_motionDataOptions];
              [(DSProvider *)v61 _addNewListener:v50];
              v51 = +[DSLogging sharedInstance];
              uint64_t v52 = [v51 dsLogger];

              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = [(DSRapportDevice *)v50 identifier];
                *(_DWORD *)buf = 138412290;
                v64 = v53;
                _os_log_impl(&dword_223BD6000, v52, OS_LOG_TYPE_DEFAULT, "[DSProvider] START data subscription to listener %@\n", buf, 0xCu);
              }
              [(DSProvider *)v61 subscribedToMotionDataWithOptions:v61->_motionDataOptions];
            }
            else
            {
              v57 = +[DSLogging sharedInstance];
              uint64_t v50 = [v57 dsLogger];

              if (os_log_type_enabled(&v50->super.super, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_223BD6000, &v50->super.super, OS_LOG_TYPE_DEFAULT, "[DSProvider] Could not allocate rpDevice\n", buf, 2u);
              }
            }
            v19 = v62;

            id v10 = v22;
          }
          goto LABEL_54;
        }
        if (v60 == 2 && !v59)
        {
          id v42 = v61->_currentListener;
          if (v42)
          {
            v43 = [(DSRapportDevice *)v42 identifier];
            int v44 = [v43 isEqualToString:v13];

            if (v44)
            {
              [(DSProvider *)v61 _removeCurrentListenerWithStopReason:1];
              v45 = +[DSLogging sharedInstance];
              uint64_t v46 = [v45 dsLogger];

              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v64 = (const char *)v13;
                _os_log_impl(&dword_223BD6000, v46, OS_LOG_TYPE_DEFAULT, "[DSProvider] STOP data subscription from sender %@\n", buf, 0xCu);
              }

              (*((void (**)(id, void, void, void))v22 + 2))(v22, 0, 0, 0);
              [(DSProvider *)v61 unsubscribed];
              goto LABEL_53;
            }
          }
          v54 = +[DSLogging sharedInstance];
          v37 = [v54 dsLogger];

          if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)buf = 138412290;
          v64 = (const char *)v13;
          v39 = "[DSProvider] Received stop subscription from unknown listener %@, ignoring\n";
          goto LABEL_49;
        }
        v47 = +[DSLogging sharedInstance];
        v37 = [v47 dsLogger];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v8;
          v39 = "[DSProvider] Invalid Data Request %@\n";
LABEL_49:
          id v40 = v37;
          uint32_t v41 = 12;
          goto LABEL_50;
        }
      }
      else
      {
        id v36 = +[DSLogging sharedInstance];
        v37 = [v36 dsLogger];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v38 = [(DSClientMotionDataOptions *)v61->_motionDataOptions dataSubType];
          *(_DWORD *)buf = 138412546;
          v64 = (const char *)v13;
          __int16 v65 = 1024;
          unsigned int v66 = v38;
          v39 = "[DSProvider] Data Subscription request rejected for senderID %@ with motion datatype %d\n";
          id v40 = v37;
          uint32_t v41 = 18;
LABEL_50:
          _os_log_impl(&dword_223BD6000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
        }
      }
LABEL_51:

      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = 1;
LABEL_52:
      v55 = [v28 errorWithDomain:@"DSErrorDomain" code:v29 userInfo:0];
      (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v55);

LABEL_53:
      v19 = v62;
LABEL_54:
    }
  }
}

- (void)_sendMotionData:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_currentListener)
  {
    char v14 = @"payloadKey";
    v15[0] = v4;
    id v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    ++self->_numMotionStateMessages;
    BOOL v7 = [(DSListenerDevice *)self->_currentListener responseHandler];

    currentListener = self->_currentListener;
    if (v7)
    {
      id v9 = [(DSListenerDevice *)self->_currentListener responseHandler];
      ((void (**)(void, NSObject *, void, void))v9)[2](v9, v6, 0, 0);

      [(DSListenerDevice *)self->_currentListener setResponseHandler:0];
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __30__DSProvider__sendMotionData___block_invoke;
      v12[3] = &unk_2646D4FB0;
      v12[4] = self;
      int v11 = self;
      [(DSProvider *)v11 _sendRequestID:@"com.apple.distributedsensing.dataRequest" request:v6 device:currentListener options:0 responseHandler:v12];
    }
  }
  else
  {
    id v10 = +[DSLogging sharedInstance];
    id v6 = [v10 dsLogger];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSProvider] No Listeners registered\n", buf, 2u);
    }
  }
}

void __30__DSProvider__sendMotionData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32))
  {
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      unsigned int v11 = Int64Ranged;
      id v12 = +[DSLogging sharedInstance];
      uint64_t v13 = [v12 dsLogger];

      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v14)
        {
          uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) rpDevice];
          v16 = (void *)v15;
          if (v11 > 0xB) {
            v17 = "?";
          }
          else {
            v17 = off_2646D4FD0[v11];
          }
          int v19 = 138412802;
          id v20 = v9;
          __int16 v21 = 2112;
          uint64_t v22 = v15;
          __int16 v23 = 2080;
          v24 = v17;
          _os_log_impl(&dword_223BD6000, v13, OS_LOG_TYPE_DEFAULT, "[DSProvider] %@ in sending data to device %@ over data link: %s. STOP subscription\n", (uint8_t *)&v19, 0x20u);
        }
        [*(id *)(a1 + 32) _removeCurrentListenerWithStopReason:3];
        [*(id *)(a1 + 32) unsubscribed];
      }
      else
      {
        if (v14)
        {
          v18 = [*(id *)(*(void *)(a1 + 32) + 32) rpDevice];
          int v19 = 138412290;
          id v20 = v18;
          _os_log_impl(&dword_223BD6000, v13, OS_LOG_TYPE_DEFAULT, "[DSProvider] Sent Data to device %@\n", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
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
  v16 = (void *)[v17 copy];
  [v13 addRequestToQueue:v16];

  [v13 activateSessionClient];
}

- (void)_fetchScreenState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(self->_screenStateToken, &state64);
  self->_isScreenON = state64 != 1;
  id v3 = +[DSLogging sharedInstance];
  id v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isScreenON) {
      id v5 = "ON";
    }
    else {
      id v5 = "OFF";
    }
    *(_DWORD *)buf = 136315138;
    id v8 = v5;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Current screen state is %s\n", buf, 0xCu);
  }
}

- (void)_heartBeatWithListener
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_isPendingHeartbeat)
  {
    self->_isPendingHeartbeat = 1;
    id v3 = +[DSLogging sharedInstance];
    id v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(DSRapportDevice *)self->_currentListener rpDevice];
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Heartbeating with Listener %@\n", buf, 0xCu);
    }
    ++self->_numHeartbeats;
    currentListener = self->_currentListener;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__DSProvider__heartBeatWithListener__block_invoke;
    v8[3] = &unk_2646D4FB0;
    v8[4] = self;
    id v7 = self;
    [(DSProvider *)v7 _sendRequestID:@"com.apple.distributedsensing.heartbeatRequest" request:MEMORY[0x263EFFA78] device:currentListener options:0 responseHandler:v8];
  }
}

void __36__DSProvider__heartBeatWithListener__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32))
  {
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(v11 + 32))
    {
      unsigned int v12 = Int64Ranged;
      *(unsigned char *)(v11 + 56) = 0;
      id v13 = +[DSLogging sharedInstance];
      id v14 = [v13 dsLogger];

      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v15)
        {
          uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 32) rpDevice];
          id v17 = (void *)v16;
          if (v12 > 0xB) {
            v18 = "?";
          }
          else {
            v18 = off_2646D4FD0[v12];
          }
          int v20 = 138412802;
          id v21 = v9;
          __int16 v22 = 2112;
          uint64_t v23 = v16;
          __int16 v24 = 2080;
          uint64_t v25 = v18;
          _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSProvider] %@ in heartbeating with listener %@ over data link: %s. STOP subscription\n", (uint8_t *)&v20, 0x20u);
        }
        [*(id *)(a1 + 32) _removeCurrentListenerWithStopReason:2];
        [*(id *)(a1 + 32) subscriptionExpired];
      }
      else
      {
        if (v15)
        {
          int v19 = [*(id *)(*(void *)(a1 + 32) + 32) rpDevice];
          int v20 = 138412290;
          id v21 = v19;
          _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSProvider] Listener %@ is still active\n", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
}

- (void)_stopProvider
{
  [(RPCompanionLinkClient *)self->_linkClient deregisterRequestID:@"com.apple.distributedsensing.subscriptionRequest"];
  [(DSClientMotionDataOptions *)self->_motionDataOptions setDataSubType:0];
  [(DSClientMotionDataOptions *)self->_motionDataOptions setDeviceType:0];
  [(DSProvider *)self _removeCurrentListenerWithStopReason:4];
  [(RPCompanionLinkClient *)self->_linkClient invalidate];
  linkClient = self->_linkClient;
  self->_linkClient = 0;

  [(DSProvider *)self stoppedProvider];
}

- (void)_addNewListener:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentListener, a3);
  self->_isSubscriptionActive = 1;
  id v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_clientQueue);
  id v7 = +[DSLogging sharedInstance];
  id v8 = [v7 dsLogger];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] Creating Heartbeat timer\n", buf, 2u);
  }

  dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1800000000000);
  dispatch_source_set_timer(v6, v9, 0x1A3185C5000uLL, 0x6FC23AC00uLL);
  id v10 = self;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __30__DSProvider__addNewListener___block_invoke;
  handler[3] = &unk_2646D4E18;
  handler[4] = v10;
  dispatch_source_set_event_handler(v6, handler);
  objc_storeStrong((id *)&v10->_heartbeatTimer, v6);
  dispatch_resume((dispatch_object_t)v10->_heartbeatTimer);
  [(DSProvider *)v10 _startCASessionMetricCollection];
  if (!v10->_isUnterminatedSession) {
    [(DSProvider *)v10 _persistListenerState];
  }
}

void __30__DSProvider__addNewListener___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v2[4])
    {
      [v2 _heartBeatWithListener];
    }
    else
    {
      id v3 = v2[6];
      if (v3)
      {
        dispatch_source_cancel(v3);
        uint64_t v4 = *(void *)(a1 + 32);
        id v5 = *(void **)(v4 + 48);
        *(void *)(v4 + 48) = 0;
      }
    }
  }
}

- (void)_removeCurrentListenerWithStopReason:(int)a3
{
  self->_isSubscriptionActive = 0;
  if (self->_currentListener)
  {
    uint64_t v4 = *(void *)&a3;
    [(DSProvider *)self _removePersistedState];
    [(DSRapportDevice *)self->_currentListener invalidate];
    currentListener = self->_currentListener;
    self->_currentListener = 0;

    [(DSProvider *)self _stopCASessionMetricCollectionWithStopReason:v4];
    caEventHandler = self->_caEventHandler;
    self->_caEventHandler = 0;

    self->_numHeartbeats = 0;
    self->_numMotionStateMessages = 0;
    self->_linkType = 0;
  }
  if (self->_heartbeatTimer)
  {
    id v7 = +[DSLogging sharedInstance];
    id v8 = [v7 dsLogger];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] Cancelling Heartbeat timer\n", v11, 2u);
    }

    heartbeatTimer = self->_heartbeatTimer;
    if (!dispatch_source_testcancel(heartbeatTimer))
    {
      dispatch_source_cancel(heartbeatTimer);
      heartbeatTimer = self->_heartbeatTimer;
    }
    self->_heartbeatTimer = 0;
  }
  responseTimeoutTimer = self->_responseTimeoutTimer;
  if (responseTimeoutTimer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->_responseTimeoutTimer))
    {
      dispatch_source_cancel(responseTimeoutTimer);
      responseTimeoutTimer = self->_responseTimeoutTimer;
    }
    self->_responseTimeoutTimer = 0;
  }
}

- (void)_startCASessionMetricCollection
{
  if (!self->_isTestMode)
  {
    if (self->_caEventHandler)
    {
      id v3 = +[DSLogging sharedInstance];
      uint64_t v4 = [v3 dsLogger];

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v9 = 0;
        _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSProvider] Core analytics event handler already exists\n", v9, 2u);
      }
    }
    else
    {
      id v5 = objc_alloc_init(DSCoreAnalyticsEventHandler);
      caEventHandler = self->_caEventHandler;
      self->_caEventHandler = v5;

      id v7 = self->_caEventHandler;
      BOOL isUnterminatedSession = self->_isUnterminatedSession;
      [(DSCoreAnalyticsEventHandler *)v7 dsSessionStartedWithDeviceRole:1 numPotentialProviders:0 unterminatedSession:isUnterminatedSession];
    }
  }
}

- (void)_stopCASessionMetricCollectionWithStopReason:(int)a3
{
  if (!self->_isTestMode)
  {
    caEventHandler = self->_caEventHandler;
    if (caEventHandler)
    {
      unint64_t numHeartbeats = self->_numHeartbeats;
      unint64_t numMotionStateMessages = self->_numMotionStateMessages;
      uint64_t linkType = self->_linkType;
      [(DSCoreAnalyticsEventHandler *)caEventHandler dsSessionCompletedWithStopReason:*(void *)&a3 numHeartbeats:numHeartbeats numMotionStateMessages:numMotionStateMessages activeProviderLostCount:0 dataLinkType:linkType maxListenerClients:0 avgListenerStartInterval:0.0];
    }
    else
    {
      id v8 = +[DSLogging sharedInstance];
      dispatch_time_t v9 = [v8 dsLogger];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "[DSProvider] Core analytics event handler not initialized\n", v10, 2u);
      }
    }
  }
}

- (BOOL)_persistListenerState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [[DSKeychainPersistence alloc] initWithQueue:self->_clientQueue];
  currentListener = self->_currentListener;
  id v10 = 0;
  BOOL v5 = [(DSKeychainPersistence *)v3 saveListenerState:currentListener withError:&v10];
  id v6 = v10;
  if (!v5)
  {
    id v7 = +[DSLogging sharedInstance];
    id v8 = [v7 dsLogger];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] failed to save peristence data with error %@", buf, 0xCu);
    }
  }
  return v5;
}

- (BOOL)_unPersistListenerState
{
  *(void *)&v31[5] = *MEMORY[0x263EF8340];
  id v3 = [[DSKeychainPersistence alloc] initWithQueue:self->_clientQueue];
  id v28 = 0;
  id v29 = 0;
  BOOL v4 = [(DSKeychainPersistence *)v3 loadListenerState:&v29 withError:&v28];
  id v5 = v29;
  id v6 = v28;
  if (!v4)
  {
    BOOL v15 = +[DSLogging sharedInstance];
    uint64_t v16 = [v15 dsLogger];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v6;
      id v17 = "[DSProvider] No persistence data found with error: %@";
      v18 = v16;
      uint32_t v19 = 12;
LABEL_15:
      _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
LABEL_16:

    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (!v5)
  {
    uint64_t v23 = +[DSLogging sharedInstance];
    uint64_t v16 = [v23 dsLogger];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v17 = "[DSProvider] no listener device persisted\n";
      v18 = v16;
      uint32_t v19 = 2;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (![v5 version]
    || (int v7 = [v5 version], v7 != TextToSourceVersion()))
  {
    int v20 = +[DSLogging sharedInstance];
    uint64_t v16 = [v20 dsLogger];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v5 version];
      int v22 = TextToSourceVersion();
      *(_DWORD *)buf = 67109376;
      v31[0] = v21;
      LOWORD(v31[1]) = 1024;
      *(_DWORD *)((char *)&v31[1] + 2) = v22;
      id v17 = "[DSProvider] version %d in persisted listener doesn't match current version: %d\n";
      v18 = v16;
      uint32_t v19 = 14;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v8 = [v5 inOptions];
  int v9 = [v8 dataSubType];
  unsigned int v10 = [(DSClientMotionDataOptions *)self->_motionDataOptions dataSubType];

  if (v9 != v10)
  {
    uint64_t v25 = +[DSLogging sharedInstance];
    uint64_t v16 = [v25 dsLogger];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v5 inOptions];
      int v27 = [v26 dataSubType];
      *(_DWORD *)buf = 67109120;
      v31[0] = v27;
      _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSProvider] Invalid motion datatype %d in persisted listener\n", buf, 8u);
    }
    goto LABEL_16;
  }
  self->_BOOL isUnterminatedSession = 1;
  uint64_t v11 = +[DSLogging sharedInstance];
  id v12 = [v11 dsLogger];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    *(void *)v31 = v13;
    _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSProvider] UNTERMINATED session found with listener ID %@", buf, 0xCu);
  }
  [(DSProvider *)self _addNewListener:v5];
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_removePersistedState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_BOOL isUnterminatedSession = 0;
  id v3 = [[DSKeychainPersistence alloc] initWithQueue:self->_clientQueue];
  currentListener = self->_currentListener;
  id v10 = 0;
  BOOL v5 = [(DSKeychainPersistence *)v3 removeListenerState:currentListener withError:&v10];
  id v6 = v10;
  if (!v5)
  {
    int v7 = +[DSLogging sharedInstance];
    id v8 = [v7 dsLogger];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSProvider] failed to remove peristence data with error %@", buf, 0xCu);
    }
  }
  return v5;
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

- (BOOL)isSubscriptionActive
{
  return self->_isSubscriptionActive;
}

- (void)setIsSubscriptionActive:(BOOL)a3
{
  self->_isSubscriptionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caEventHandler, 0);
  objc_storeStrong((id *)&self->_responseTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_currentListener, 0);
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
  objc_storeStrong((id *)&self->_linkClient, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end