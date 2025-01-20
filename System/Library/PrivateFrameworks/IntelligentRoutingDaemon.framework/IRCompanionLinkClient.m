@interface IRCompanionLinkClient
- (IRCompanionLinkClient)initWithRapportProvider:(id)a3 targetQueue:(id)a4;
- (IRRapportProvider)rapportProvider;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)client;
- (int64_t)currentRssiThreshold;
- (unint64_t)currentControlFlags;
- (void)_didUpdateRapportDevices;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
@end

@implementation IRCompanionLinkClient

- (IRCompanionLinkClient)initWithRapportProvider:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IRCompanionLinkClient;
  v8 = [(IRCompanionLinkClient *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rapportProvider, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      dispatchQueue = v9->_dispatchQueue;
      v9->_dispatchQueue = v10;
    }
    else
    {
      dispatchQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.intelligentroutingd.IRCompanionLinkClient", dispatchQueue);
      v13 = v9->_dispatchQueue;
      v9->_dispatchQueue = (OS_dispatch_queue *)v12;
    }
  }

  return v9;
}

- (void)dealloc
{
  [(IRCompanionLinkClient *)self stopDiscovery];
  v3.receiver = self;
  v3.super_class = (Class)IRCompanionLinkClient;
  [(IRCompanionLinkClient *)&v3 dealloc];
}

- (RPCompanionLinkClient)client
{
  client = self->_client;
  if (!client)
  {
    v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    v5 = self->_client;
    self->_client = v4;

    id v6 = [(IRCompanionLinkClient *)self dispatchQueue];

    if (v6)
    {
      id v7 = [(IRCompanionLinkClient *)self dispatchQueue];
      [(RPCompanionLinkClient *)self->_client setDispatchQueue:v7];
    }
    v8 = [(IRCompanionLinkClient *)self client];
    uint64_t v9 = [v8 controlFlags];

    [(RPCompanionLinkClient *)self->_client setControlFlags:v9 | 0x1C04];
    [(RPCompanionLinkClient *)self->_client setRssiThreshold:-75];
    client = self->_client;
  }

  return client;
}

- (void)startDiscovery
{
  objc_initWeak(&location, self);
  objc_super v3 = [(IRCompanionLinkClient *)self client];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke;
  v19[3] = &unk_2653A03F0;
  objc_copyWeak(&v20, &location);
  [v3 setDeviceFoundHandler:v19];

  v4 = [(IRCompanionLinkClient *)self client];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_4;
  v17[3] = &unk_2653A03F0;
  objc_copyWeak(&v18, &location);
  [v4 setDeviceLostHandler:v17];

  v5 = [(IRCompanionLinkClient *)self client];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_5;
  v15[3] = &unk_2653A0418;
  objc_copyWeak(&v16, &location);
  [v5 setDeviceChangedHandler:v15];

  id v6 = [(IRCompanionLinkClient *)self client];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_7;
  v13[3] = &unk_26539FA70;
  objc_copyWeak(&v14, &location);
  [v6 setInterruptionHandler:v13];

  id v7 = [(IRCompanionLinkClient *)self client];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_10;
  v11[3] = &unk_26539FA70;
  objc_copyWeak(&v12, &location);
  [v7 setInvalidationHandler:v11];

  if (!self->_companionLinkClientActive)
  {
    v8 = [(IRCompanionLinkClient *)self client];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_11;
    v9[3] = &unk_2653A0440;
    objc_copyWeak(&v10, &location);
    [v8 activateWithCompletion:v9];

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v6);

    id v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }
    [v5 _didUpdateRapportDevices];
  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v6);

    id v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_4_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }
    [v5 _didUpdateRapportDevices];
  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v6);

    id v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG)) {
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_5_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }
    [v5 _didUpdateRapportDevices];
  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v3);

    v4 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient connection interrupted, reset knownDevices", v7, 2u);
    }
    v5 = [v2 rapportProvider];
    id v6 = [MEMORY[0x263EFFA08] set];
    [v5 didUpdateRapportDevices:v6];
  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v3);

    v4 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient connection invalidated, reset knownDevices", v7, 2u);
    }
    v5 = [v2 rapportProvider];
    id v6 = [MEMORY[0x263EFFA08] set];
    [v5 didUpdateRapportDevices:v6];
  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      id v7 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient failed to activate. Error - %@", (uint8_t *)&v9, 0xCu);
      }
      [v5 stopDiscovery];
    }
    else
    {
      v5[8] = 1;
      uint64_t v8 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery client activated. Searching for Rapport devices...", (uint8_t *)&v9, 2u);
      }
    }
  }
}

- (void)_didUpdateRapportDevices
{
  id v3 = [(IRCompanionLinkClient *)self client];
  v4 = [v3 activeDevices];
  v5 = (void *)[v4 copy];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__IRCompanionLinkClient__didUpdateRapportDevices__block_invoke;
  v10[3] = &unk_2653A0468;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = [(IRCompanionLinkClient *)self rapportProvider];
  int v9 = (void *)[v7 copy];
  [v8 didUpdateRapportDevices:v9];
}

void __49__IRCompanionLinkClient__didUpdateRapportDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 effectiveIdentifier];
  v5 = [v3 idsDeviceIdentifier];
  id v6 = [v3 name];
  id v7 = [v3 model];
  uint64_t v8 = [v3 mediaRemoteIdentifier];
  int v9 = [v3 accountID];
  id v10 = [v3 mediaRouteIdentifier];

  id v11 = +[IRRapportDeviceDO rapportDeviceDOWithRapportEffectiveID:v4 idsID:v5 name:v6 deviceModel:v7 mediaRemoteIdentifier:v8 iCloudId:v9 mediaRouteIdentifier:v10];

  [*(id *)(a1 + 32) addObject:v11];
}

- (void)stopDiscovery
{
  id v3 = [(IRCompanionLinkClient *)self client];
  [v3 setDeviceFoundHandler:0];

  v4 = [(IRCompanionLinkClient *)self client];
  [v4 setDeviceLostHandler:0];

  v5 = [(IRCompanionLinkClient *)self client];
  [v5 setInterruptionHandler:0];

  id v6 = [(IRCompanionLinkClient *)self client];
  [v6 setInvalidationHandler:0];

  id v7 = [(IRCompanionLinkClient *)self client];
  [v7 invalidate];

  [(IRCompanionLinkClient *)self setClient:0];
  self->_companionLinkClientActive = 0;
}

- (unint64_t)currentControlFlags
{
  v2 = [(IRCompanionLinkClient *)self client];
  unint64_t v3 = [v2 controlFlags];

  return v3;
}

- (int64_t)currentRssiThreshold
{
  v2 = [(IRCompanionLinkClient *)self client];
  int64_t v3 = [v2 rssiThreshold];

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (IRRapportProvider)rapportProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rapportProvider);

  return (IRRapportProvider *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_rapportProvider);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end