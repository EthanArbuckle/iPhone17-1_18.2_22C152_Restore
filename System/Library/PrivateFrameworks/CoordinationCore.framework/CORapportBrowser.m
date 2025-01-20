@interface CORapportBrowser
- (COBrowserObserverSet)observerSet;
- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory;
- (COCompanionLinkClientProtocol)listener;
- (CORapportBrowser)init;
- (CORapportTransport)sourceTransport;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)_rapportDeviceWithCompanionLinkDevice:(id)a3;
- (id)addObserverUsingBlock:(id)a3;
- (id)registeredObservers;
- (id)startCallback;
- (unsigned)listeningPort;
- (void)_onqueue_handleActivation:(id)a3;
- (void)_onqueue_handleFoundDevice:(id)a3;
- (void)_onqueue_handleLostDevice:(id)a3;
- (void)_onqueue_informObserversOfDiscoveredRecord:(id)a3;
- (void)_onqueue_informObserversOfLostRecord:(id)a3;
- (void)_onqueue_updateListeningPort:(id)a3;
- (void)_withLock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCompanionLinkClientFactory:(id)a3;
- (void)setSourceTransport:(id)a3;
- (void)setStartCallback:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation CORapportBrowser

- (CORapportBrowser)init
{
  v14.receiver = self;
  v14.super_class = (Class)CORapportBrowser;
  v2 = [(CORapportBrowser *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v3->_observerSet;
    v3->_observerSet = v4;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coordination.rapportbrowser.%p", v3);
    id v6 = objc_claimAutoreleasedReturnValue();
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v9;

    v11 = [[COCompanionLinkClientFactory alloc] initWithDispatchQueue:v3->_workQueue];
    companionLinkClientFactory = v3->_companionLinkClientFactory;
    v3->_companionLinkClientFactory = (COCompanionLinkClientFactoryProtocol *)v11;
  }
  return v3;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CORapportBrowser *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645CCB78;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 12))
    {
      v5 = COCoreLogForCategory(14);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v4;
        _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Browser is already running", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      *((unsigned char *)WeakRetained + 12) = 1;
      id v6 = [*(id *)(a1 + 32) companionLinkClientFactory];
      uint64_t v7 = [v6 companionLinkClientForCurrentDevice];
      id v8 = (void *)v4[4];
      v4[4] = v7;

      id v9 = (void *)v4[4];
      v10 = [*(id *)(a1 + 32) workQueue];
      [v9 setDispatchQueue:v10];

      v11 = (void *)v4[4];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_6;
      v21[3] = &unk_2645CB0A8;
      objc_copyWeak(&v22, v2);
      [v11 setDeviceFoundHandler:v21];
      v12 = (void *)v4[4];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_2645CB0A8;
      objc_copyWeak(&v20, v2);
      [v12 setDeviceLostHandler:v19];
      v13 = (void *)v4[4];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_2645CB0A8;
      objc_copyWeak(&v18, v2);
      [v13 setLocalDeviceUpdatedHandler:v17];
      [v4 setStartCallback:*(void *)(a1 + 40)];
      objc_super v14 = (void *)v4[4];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __47__CORapportBrowser_startWithCompletionHandler___block_invoke_4;
      v15[3] = &unk_2645CAEA8;
      objc_copyWeak(&v16, v2);
      [v14 activateWithCompletion:v15];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
    }
  }
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_onqueue_handleFoundDevice:", v5);
  }
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_onqueue_handleLostDevice:", v5);
  }
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_onqueue_updateListeningPort:", v5);
  }
}

void __47__CORapportBrowser_startWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_onqueue_handleActivation:", v5);
  }
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p Stopping browser", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(CORapportBrowser *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__CORapportBrowser_stop__block_invoke;
  block[3] = &unk_2645CB2E0;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __24__CORapportBrowser_stop__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 12) = 0;
    v3 = WeakRetained;
    [*((id *)WeakRetained + 4) invalidate];
    v2 = (void *)v3[4];
    v3[4] = 0;

    id WeakRetained = v3;
  }
}

- (id)registeredObservers
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12;
  uint64_t v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__CORapportBrowser_registeredObservers__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CORapportBrowser *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__CORapportBrowser_registeredObservers__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) observerSet];
  id v2 = [v6 observers];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)addObserverUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = [[COBrowserObserver alloc] initWithBlock:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CORapportBrowser_addObserverUsingBlock___block_invoke;
  v7[3] = &unk_2645CB120;
  v7[4] = self;
  void v7[5] = &v8;
  [(CORapportBrowser *)self _withLock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__CORapportBrowser_addObserverUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerSet];
  [v2 addObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__CORapportBrowser_removeObserver___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CORapportBrowser *)self _withLock:v6];
}

void __35__CORapportBrowser_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerSet];
  [v2 removeObserver:*(void *)(a1 + 40)];
}

- (void)setSourceTransport:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__CORapportBrowser_setSourceTransport___block_invoke;
  v10[3] = &unk_2645CAE80;
  v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  [(CORapportBrowser *)self _withLock:v10];
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__CORapportBrowser_setSourceTransport___block_invoke_2;
  v7[3] = &unk_2645CB2E0;
  objc_copyWeak(&v8, &location);
  dispatch_async(workQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __39__CORapportBrowser_setSourceTransport___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __39__CORapportBrowser_setSourceTransport___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained listener];
    id v4 = [v3 activeDevices];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __39__CORapportBrowser_setSourceTransport___block_invoke_3;
    v5[3] = &unk_2645CCBA0;
    v5[4] = v2;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

uint64_t __39__CORapportBrowser_setSourceTransport___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleFoundDevice:", a2);
}

- (CORapportTransport)sourceTransport
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12;
  uint64_t v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__CORapportBrowser_sourceTransport__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(CORapportBrowser *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORapportTransport *)v2;
}

uint64_t __35__CORapportBrowser_sourceTransport__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  return MEMORY[0x270F9A758]();
}

- (id)_rapportDeviceWithCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CORapportBrowser *)self sourceTransport];
  id v6 = [[CORapportDevice alloc] initWithCompanionLinkDevice:v4 sourceTransport:v5];
  objc_initWeak(&location, v6);
  uint64_t v7 = [(CORapportBrowser *)self companionLinkClientFactory];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CORapportBrowser__rapportDeviceWithCompanionLinkDevice___block_invoke;
  v11[3] = &unk_2645CCBC8;
  objc_copyWeak(&v14, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  [(CORapportDevice *)v6 setCompanionLinkProvider:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v6;
}

id __58__CORapportBrowser__rapportDeviceWithCompanionLinkDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [WeakRetained device];
    id v6 = [v3 IDSIdentifier];
    uint64_t v7 = [v4 companionLinkClientForDevice:v5 withIDSIdentifier:v6];

    id v8 = [*(id *)(a1 + 40) client];
    id v9 = [v8 dispatchQueue];
    [v7 setDispatchQueue:v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_onqueue_updateListeningPort:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a3)
  {
    [(CORapportBrowser *)self _onqueue_handleActivation:0];
  }
}

- (void)_onqueue_handleActivation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!self->_activated)
  {
    uint64_t v5 = [(CORapportBrowser *)self startCallback];
    id v6 = (void (**)(void, void))v5;
    if (v4 && v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
      [(CORapportBrowser *)self setStartCallback:0];
    }
    else
    {
      uint64_t v7 = [(CORapportBrowser *)self listener];
      id v8 = [v7 localDevice];

      int v9 = [v8 listeningPort];
      if (v9 >= 1)
      {
        unsigned __int16 v10 = v9;
        if (v9 != [(CORapportBrowser *)self listeningPort]) {
          self->_listeningPort = v10;
        }
      }
      id v11 = [(COCompanionLinkClientProtocol *)self->_listener localDevice];

      if (v11)
      {
        self->_activated = 1;
        if (v6)
        {
          v6[2](v6, 0);
          [(CORapportBrowser *)self setStartCallback:0];
        }
        id v12 = [[CORapportCurrentDevice alloc] initWithClient:self->_listener browser:self];
        [(CORapportBrowser *)self _onqueue_informObserversOfDiscoveredRecord:v12];
      }
      else
      {
        COCoreLogForCategory(14);
        id v12 = (CORapportCurrentDevice *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = self;
          _os_log_impl(&dword_2217C1000, &v12->super, OS_LOG_TYPE_DEFAULT, "%@ deferring activation, don't have local device yet", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
}

- (void)_onqueue_handleFoundDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Rapport Browser found device %@", buf, 0x16u);
  }

  if (!self->_started)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    v26 = self;
    id v18 = "%p Rapport Browser is not running";
LABEL_23:
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    goto LABEL_29;
  }
  if (!self->_activated)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    v26 = self;
    id v18 = "%p Rapport Browser not started completely";
    goto LABEL_23;
  }
  id v6 = [(CORapportBrowser *)self sourceTransport];

  if (!v6)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 134217984;
    v26 = self;
    id v18 = "%p source transport not established yet";
    goto LABEL_23;
  }
  uint64_t v7 = [(CORapportBrowser *)self _rapportDeviceWithCompanionLinkDevice:v4];
  id v8 = [v7 HomeKitIdentifier];

  if (!v8)
  {
    int v9 = [v7 IDSIdentifier];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unsigned __int16 v10 = [(CORapportBrowser *)self listener];
    id v11 = [v10 activeDevices];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v16 idsDeviceIdentifier];
          if (v17 && ![v9 compare:v17 options:1])
          {
            v19 = [v16 homeKitIdentifier];
            [v7 setHomeKitIdentifier:v19];
            id v20 = COCoreLogForCategory(14);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v26 = self;
              __int16 v27 = 2112;
              id v28 = v19;
              __int16 v29 = 2048;
              v30 = v7;
              _os_log_impl(&dword_2217C1000, v20, OS_LOG_TYPE_DEFAULT, "%@ used fallback to get HomeKit identifier(%@) for device %p", buf, 0x20u);
            }

            goto LABEL_27;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_27:
  }
  [(CORapportBrowser *)self _onqueue_informObserversOfDiscoveredRecord:v7];
LABEL_29:
}

- (void)_onqueue_handleLostDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = COCoreLogForCategory(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    unsigned __int16 v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p Rapport Browser lost device %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(CORapportBrowser *)self sourceTransport];
  if (!v6)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v9 = 134217984;
    unsigned __int16 v10 = self;
    id v8 = "%p Rapport Browser doesn't have source transport";
LABEL_13:
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_14;
  }
  if (!self->_started)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v9 = 134217984;
    unsigned __int16 v10 = self;
    id v8 = "%p Rapport Browser is not running";
    goto LABEL_13;
  }
  if (!self->_activated)
  {
    uint64_t v7 = COCoreLogForCategory(14);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v9 = 134217984;
    unsigned __int16 v10 = self;
    id v8 = "%p Rapport Browser not started completely";
    goto LABEL_13;
  }
  uint64_t v7 = [(CORapportBrowser *)self _rapportDeviceWithCompanionLinkDevice:v4];
  [(CORapportBrowser *)self _onqueue_informObserversOfLostRecord:v7];
LABEL_14:
}

- (void)_onqueue_informObserversOfDiscoveredRecord:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__12;
  uint64_t v14 = __Block_byref_object_dispose__12;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke;
  v9[3] = &unk_2645CAE08;
  v9[4] = self;
  v9[5] = &v10;
  [(CORapportBrowser *)self _withLock:v9];
  uint64_t v5 = (void *)v11[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke_2;
  v7[3] = &unk_2645CBAE0;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(&v10, 8);
}

void __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) observerSet];
  id v2 = [v6 observers];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __63__CORapportBrowser__onqueue_informObserversOfDiscoveredRecord___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 block];
  v3[2](v3, 1, *(void *)(a1 + 32));
}

- (void)_onqueue_informObserversOfLostRecord:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__12;
  uint64_t v14 = __Block_byref_object_dispose__12;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke;
  v9[3] = &unk_2645CAE08;
  v9[4] = self;
  v9[5] = &v10;
  [(CORapportBrowser *)self _withLock:v9];
  uint64_t v5 = (void *)v11[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke_2;
  v7[3] = &unk_2645CBAE0;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(&v10, 8);
}

void __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observerSet];
  uint64_t v2 = [v5 observers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __57__CORapportBrowser__onqueue_informObserversOfLostRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 block];
  (*((void (**)(id, void, void))v3 + 2))(v3, 0, *(void *)(a1 + 32));
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (COCompanionLinkClientProtocol)listener
{
  return self->_listener;
}

- (unsigned)listeningPort
{
  return self->_listeningPort;
}

- (id)startCallback
{
  return self->_startCallback;
}

- (void)setStartCallback:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory
{
  return self->_companionLinkClientFactory;
}

- (void)setCompanionLinkClientFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_startCallback, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
  objc_destroyWeak((id *)&self->_sourceTransport);
}

@end