@interface DSRapportDevice
- (DSRapportDevice)initWithRapportDevice:(id)a3 queue:(id)a4;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkDevice)rpDevice;
- (unsigned)deviceType;
- (void)_activateSessionClientWithForceL2CAP:(BOOL)a3;
- (void)_forceBLEDiscoverytoSendRequestID;
- (void)_startDiscoveryExitTimer;
- (void)_startResponseTimeoutTimer;
- (void)activateSessionClient;
- (void)addRequestToQueue:(id)a3;
- (void)invalidate;
- (void)sendNextRequest;
- (void)setDeviceType:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRpDevice:(id)a3;
@end

@implementation DSRapportDevice

- (DSRapportDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DSRapportDevice;
  v9 = [(DSRapportDevice *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rpDevice, a3);
    uint64_t v11 = [v7 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_deviceType = 1;
    sessionClient = v10->_sessionClient;
    v10->_sessionClient = 0;

    screenOffDiscoveryClient = v10->_screenOffDiscoveryClient;
    v10->_screenOffDiscoveryClient = 0;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v10->_queue, a4);
    *(_WORD *)&v10->_isTryingForceDiscovery = 0;
    discoveryExitTimer = v10->_discoveryExitTimer;
    v10->_discoveryExitTimer = 0;

    responseTimeoutTimer = v10->_responseTimeoutTimer;
    v10->_responseTimeoutTimer = 0;
  }
  return v10;
}

- (void)invalidate
{
  sessionClient = self->_sessionClient;
  if (sessionClient)
  {
    [(RPCompanionLinkClient *)sessionClient invalidate];
    v4 = self->_sessionClient;
    self->_sessionClient = 0;
  }
  screenOffDiscoveryClient = self->_screenOffDiscoveryClient;
  if (screenOffDiscoveryClient)
  {
    [(RPCompanionLinkClient *)screenOffDiscoveryClient invalidate];
    v6 = self->_screenOffDiscoveryClient;
    self->_screenOffDiscoveryClient = 0;
  }
  discoveryExitTimer = self->_discoveryExitTimer;
  if (discoveryExitTimer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->_discoveryExitTimer))
    {
      dispatch_source_cancel(discoveryExitTimer);
      discoveryExitTimer = self->_discoveryExitTimer;
    }
    self->_discoveryExitTimer = 0;
  }
  responseTimeoutTimer = self->_responseTimeoutTimer;
  if (responseTimeoutTimer)
  {
    source = self->_responseTimeoutTimer;
    if (dispatch_source_testcancel(responseTimeoutTimer))
    {
      v9 = (OS_dispatch_source *)source;
    }
    else
    {
      dispatch_source_cancel(source);
      v9 = self->_responseTimeoutTimer;
    }
    self->_responseTimeoutTimer = 0;
  }
}

- (void)activateSessionClient
{
}

- (void)addRequestToQueue:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  pendingRequests = v4->_pendingRequests;
  v6 = (void *)[v7 mutableCopy];
  [(NSMutableArray *)pendingRequests addObject:v6];

  objc_sync_exit(v4);
}

- (void)sendNextRequest
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_223BD6000, a2, OS_LOG_TYPE_ERROR, "[DSRapportDevice] Invalid request %@\n", (uint8_t *)&v2, 0xCu);
}

void __34__DSRapportDevice_sendNextRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    v39 = v9;
    uint64_t v12 = *((void *)WeakRetained + 5);
    v13 = +[DSLogging sharedInstance];
    v14 = [v13 dsLogger];

    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v16;
        _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Cancelling Response Timer for requestID %@\n", buf, 0xCu);
      }

      v17 = *((void *)v11 + 5);
      id v9 = v39;
      if (!dispatch_source_testcancel(v17))
      {
        dispatch_source_cancel(v17);
        v17 = *((void *)v11 + 5);
      }
      *((void *)v11 + 5) = 0;

      if (!v39) {
        goto LABEL_23;
      }
      v18 = [v39 domain];
      if ([v18 isEqualToString:@"DSErrorDomain"])
      {

LABEL_23:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        [v11 sendNextRequest];
        goto LABEL_24;
      }
      int v29 = v11[25];

      if (v29) {
        goto LABEL_23;
      }
      v30 = +[DSLogging sharedInstance];
      v31 = [v30 dsLogger];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v31, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Retrying sendRequest on error\n", buf, 2u);
      }

      [*((id *)v11 + 1) invalidate];
      v32 = (void *)*((void *)v11 + 1);
      *((void *)v11 + 1) = 0;

      if (*(void *)(a1 + 40)) {
        v33 = *(void **)(a1 + 40);
      }
      else {
        v33 = (void *)MEMORY[0x263EFFA78];
      }
      v34 = (void *)[v33 mutableCopy];
      [v34 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"RapportRequestIDKey"];
      v35 = (void *)MEMORY[0x223CBE3A0](*(void *)(a1 + 56));
      [v34 setObject:v35 forKeyedSubscript:@"RapportRequestHandlerKey"];

      [v34 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"RapportOptionsKey"];
      v36 = (void *)[v34 copy];
      [v11 addRequestToQueue:v36];

      [v11 _forceBLEDiscoverytoSendRequestID];
    }
    else
    {
      id v37 = v8;
      id v38 = v7;
      if (v15)
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = v19;
        _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Response Handler Timer invalidated for requestID %@\n", buf, 0xCu);
      }

      uint64_t v20 = *(void *)(a1 + 56);
      v21 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:9 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v21);

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v22 = *((id *)v11 + 6);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v41 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v40 + 1) + 8 * i) objectForKeyedSubscript:@"RapportRequestHandlerKey"];
            if (v27)
            {
              v28 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:9 userInfo:0];
              ((void (**)(void, void, void, void *))v27)[2](v27, 0, 0, v28);
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v24);
      }

      [*((id *)v11 + 6) removeAllObjects];
      id v8 = v37;
      id v7 = v38;
      id v9 = v39;
    }
  }
LABEL_24:
}

- (void)_activateSessionClientWithForceL2CAP:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = +[DSLogging sharedInstance];
  v6 = [v5 dsLogger];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(DSRapportDevice *)self rpDevice];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Creating a session client to device %@\n", buf, 0xCu);
  }
  if (self->_isTryingForceDiscovery)
  {
    id v8 = +[DSLogging sharedInstance];
    id v9 = [v8 dsLogger];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(DSRapportDevice *)self rpDevice];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Session can't be activated, Trying a force discovery for %@\n", buf, 0xCu);
    }
LABEL_6:

    return;
  }
  if (self->_sessionClient)
  {
    uint64_t v11 = +[DSLogging sharedInstance];
    id v9 = [v11 dsLogger];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(DSRapportDevice *)self rpDevice];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Session already exists for device %@\n", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v13 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
  sessionClient = self->_sessionClient;
  self->_sessionClient = v13;

  [(RPCompanionLinkClient *)self->_sessionClient setDestinationDevice:self->_rpDevice];
  [(RPCompanionLinkClient *)self->_sessionClient setControlFlags:14];
  if (v3)
  {
    BOOL v15 = +[DSLogging sharedInstance];
    uint64_t v16 = [v15 dsLogger];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(DSRapportDevice *)self rpDevice];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Forcing an L2CAP session for %@\n", buf, 0xCu);
    }
    [(RPCompanionLinkClient *)self->_sessionClient setControlFlags:[(RPCompanionLinkClient *)self->_sessionClient controlFlags] | 0x100];
    self->_isSessionInForceL2CAP = 1;
  }
  [(RPCompanionLinkClient *)self->_sessionClient setDispatchQueue:self->_queue];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v18 = self->_sessionClient;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__DSRapportDevice__activateSessionClientWithForceL2CAP___block_invoke;
  v19[3] = &unk_2646D51C0;
  objc_copyWeak(&v20, (id *)buf);
  BOOL v21 = v3;
  [(RPCompanionLinkClient *)v18 activateWithCompletion:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __56__DSRapportDevice__activateSessionClientWithForceL2CAP___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained queue];
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      [v5[1] invalidate];
      id v7 = v5[1];
      v5[1] = 0;

      *((unsigned char *)v5 + 25) = 0;
      if (*(unsigned char *)(a1 + 40))
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = v5[6];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "objectForKeyedSubscript:", @"RapportRequestHandlerKey", (void)v18);
              v14 = (void *)v13;
              if (v13) {
                (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0, 0, v3);
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
          }
          while (v10);
        }

        [v5[6] removeAllObjects];
      }
      else
      {
        [v5 _forceBLEDiscoverytoSendRequestID];
      }
    }
    else
    {
      BOOL v15 = +[DSLogging sharedInstance];
      uint64_t v16 = [v15 dsLogger];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v5 rpDevice];
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v17;
        _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Activated session client to device %@\n", buf, 0xCu);
      }
      [v5 sendNextRequest];
    }
  }
}

- (void)_forceBLEDiscoverytoSendRequestID
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_223BD6000, log, OS_LOG_TYPE_ERROR, "[DSRapportDevice] Screen off Discovery client already exists\n", v1, 2u);
}

void __52__DSRapportDevice__forceBLEDiscoverytoSendRequestID__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[24])
    {
      v6 = [WeakRetained rpDevice];
      id v7 = [v6 identifier];
      id v8 = [v3 idsDeviceIdentifier];
      int v9 = [v7 isEqualToString:v8];

      if (v9)
      {
        uint64_t v10 = +[DSLogging sharedInstance];
        uint64_t v11 = [v10 dsLogger];

        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [v3 identifier];
          uint64_t v13 = [v3 model];
          int v17 = 138412546;
          id v18 = v12;
          __int16 v19 = 2112;
          long long v20 = v13;
          _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "Device discovered via BLEScreenOff Rapport Discovery: %@ %@\n", (uint8_t *)&v17, 0x16u);
        }
        if (*((void *)v5 + 4))
        {
          v14 = +[DSLogging sharedInstance];
          BOOL v15 = [v14 dsLogger];

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 138412290;
            id v18 = v3;
            _os_log_impl(&dword_223BD6000, v15, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Cancelling Discovery Timer for device %@\n", (uint8_t *)&v17, 0xCu);
          }

          uint64_t v16 = *((void *)v5 + 4);
          if (!dispatch_source_testcancel(v16))
          {
            dispatch_source_cancel(v16);
            uint64_t v16 = *((void *)v5 + 4);
          }
          *((void *)v5 + 4) = 0;
        }
        v5[24] = 0;
        [v5 _activateSessionClientWithForceL2CAP:1];
      }
    }
  }
}

void __52__DSRapportDevice__forceBLEDiscoverytoSendRequestID__block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      [WeakRetained[2] invalidate];
      id v6 = v5[2];
      v5[2] = 0;

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v5[6];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "objectForKeyedSubscript:", @"RapportRequestHandlerKey", (void)v14);
            uint64_t v13 = (void *)v12;
            if (v12) {
              (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v3);
            }

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }

      [v5[6] removeAllObjects];
    }
    else
    {
      [WeakRetained _startDiscoveryExitTimer];
    }
  }
}

- (void)_startResponseTimeoutTimer
{
  id v3 = +[DSLogging sharedInstance];
  uint64_t v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Starting Response Timeout Timer\n", buf, 2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v6 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 200000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__DSRapportDevice__startResponseTimeoutTimer__block_invoke;
  v10[3] = &unk_2646D5210;
  id v7 = v5;
  uint64_t v11 = v7;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_source_set_event_handler(v7, v10);
  responseTimeoutTimer = self->_responseTimeoutTimer;
  self->_responseTimeoutTimer = (OS_dispatch_source *)v7;
  uint64_t v9 = v7;

  dispatch_resume((dispatch_object_t)self->_responseTimeoutTimer);
  objc_destroyWeak(&v12);

  objc_destroyWeak((id *)buf);
}

void __45__DSRapportDevice__startResponseTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[DSLogging sharedInstance];
    uint64_t v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [WeakRetained rpDevice];
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Timed out while waiting for a response from %@\n", (uint8_t *)&v10, 0xCu);
    }
    id v6 = WeakRetained[5];
    WeakRetained[5] = 0;

    [WeakRetained[1] invalidate];
    id v7 = WeakRetained[1];
    WeakRetained[1] = 0;

    *((unsigned char *)WeakRetained + 25) = 0;
    id v8 = WeakRetained[2];
    if (v8)
    {
      [v8 invalidate];
      id v9 = WeakRetained[2];
      WeakRetained[2] = 0;
    }
  }
}

- (void)_startDiscoveryExitTimer
{
  id v3 = +[DSLogging sharedInstance];
  uint64_t v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Starting Discovery Timer\n", buf, 2u);
  }

  queue = self->_queue;
  id v6 = self;
  id v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
  dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __43__DSRapportDevice__startDiscoveryExitTimer__block_invoke;
  handler[3] = &unk_2646D5238;
  id v9 = v7;
  uint64_t v13 = v9;
  long long v14 = v6;
  long long v15 = v6;
  dispatch_source_set_event_handler(v9, handler);
  discoveryExitTimer = v6->_discoveryExitTimer;
  v6->_discoveryExitTimer = (OS_dispatch_source *)v9;
  uint64_t v11 = v9;

  dispatch_resume((dispatch_object_t)v6->_discoveryExitTimer);
}

void __43__DSRapportDevice__startDiscoveryExitTimer__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 24))
    {
      id v3 = +[DSLogging sharedInstance];
      uint64_t v4 = [v3 dsLogger];

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = [*(id *)(a1 + 48) rpDevice];
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v5;
        _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSRapportDevice] Exit timer fired, stop force discovery for %@\n", buf, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 40) + 16) invalidate];
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = 0;

      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = 0;

      *(unsigned char *)(*(void *)(a1 + 40) + 24) = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = *(id *)(*(void *)(a1 + 40) + 48);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "objectForKeyedSubscript:", @"RapportRequestHandlerKey", (void)v18);
            long long v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              long long v16 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:8 userInfo:0];
              ((void (**)(void, void, void, void *))v15)[2](v15, 0, 0, v16);
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      [*(id *)(*(void *)(a1 + 40) + 48) removeAllObjects];
    }
    else
    {
      long long v17 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = 0;
    }
  }
}

- (RPCompanionLinkDevice)rpDevice
{
  return self->_rpDevice;
}

- (void)setRpDevice:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rpDevice, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_responseTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_discoveryExitTimer, 0);
  objc_storeStrong((id *)&self->_screenOffDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_sessionClient, 0);
}

@end