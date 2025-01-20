@interface DKWiFiConnectionMonitor
@end

@implementation DKWiFiConnectionMonitor

void __33___DKWiFiConnectionMonitor_start__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (+[_DKWiFiConnectionMonitor writeToBiome])
  {
    v2 = BiomeLibrary();
    v3 = [v2 Device];
    v4 = [v3 Wireless];
    v5 = [v4 WiFi];
    uint64_t v6 = [v5 source];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v6;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x263F386E0]) initWithServiceType:3];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 152);
  *(void *)(v10 + 152) = v9;

  v12 = *(void **)(*(void *)(a1 + 32) + 152);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __33___DKWiFiConnectionMonitor_start__block_invoke_2;
  v25[3] = &unk_264714B90;
  objc_copyWeak(&v26, &location);
  [v12 setEventHandler:v25];
  [*(id *)(*(void *)(a1 + 32) + 152) activate];
  v13 = *(void **)(*(void *)(a1 + 32) + 152);
  id v24 = 0;
  char v14 = [v13 startMonitoringEventType:2 error:&v24];
  id v15 = v24;
  if ((v14 & 1) == 0)
  {
    v16 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      __33___DKWiFiConnectionMonitor_start__block_invoke_cold_2((uint64_t)v15, v16);
    }
  }
  v17 = *(void **)(*(void *)(a1 + 32) + 152);
  id v23 = v15;
  char v18 = [v17 startMonitoringEventType:30 error:&v23];
  id v19 = v23;

  if ((v18 & 1) == 0)
  {
    v20 = [MEMORY[0x263F34FB8] contextChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __33___DKWiFiConnectionMonitor_start__block_invoke_cold_1((uint64_t)v19, v20);
    }
  }
  v21 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_225002000, v21, OS_LOG_TYPE_DEFAULT, "WiFi Connection Monitor started", v22, 2u);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __33___DKWiFiConnectionMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33___DKWiFiConnectionMonitor_start__block_invoke_3;
    v7[3] = &unk_2647147D8;
    v7[4] = v5;
    id v8 = v3;
    dispatch_sync(v6, v7);
  }
}

uint64_t __33___DKWiFiConnectionMonitor_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleWiFiEvent:*(void *)(a1 + 40)];
}

uint64_t __67___DKWiFiConnectionMonitor__handleKnownNetworkProfileChangedEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = *(void **)(a1 + 32);
  v5 = [v3 SSID];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

void __32___DKWiFiConnectionMonitor_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
  v1 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_225002000, v1, OS_LOG_TYPE_DEFAULT, "WiFi Connection Monitor stopped", v2, 2u);
  }
}

void __33___DKWiFiConnectionMonitor_start__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225002000, a2, OS_LOG_TYPE_FAULT, "Failed to register for known network changes with error %@", (uint8_t *)&v2, 0xCu);
}

void __33___DKWiFiConnectionMonitor_start__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225002000, a2, OS_LOG_TYPE_FAULT, "Failed to register for SSID changes with error %@", (uint8_t *)&v2, 0xCu);
}

@end