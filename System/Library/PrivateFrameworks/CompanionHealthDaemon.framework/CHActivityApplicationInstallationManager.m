@interface CHActivityApplicationInstallationManager
- (CHActivityApplicationInstallationManager)initWithProfile:(id)a3;
- (void)_applicationsInstalled:(id)a3;
- (void)_applicationsUninstalled:(id)a3;
- (void)_cleanupInstallRequest;
- (void)_queue_cleanupInstallRequest;
- (void)_queue_requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3;
- (void)_queue_startInstalling;
- (void)_requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3;
- (void)_setAndNotifyStickersAvailable:(BOOL)a3;
- (void)dealloc;
- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation CHActivityApplicationInstallationManager

- (CHActivityApplicationInstallationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHActivityApplicationInstallationManager;
  v5 = [(CHActivityApplicationInstallationManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    [(CHActivityApplicationInstallationManager *)v6 _setAndNotifyStickersAvailable:CHIsFitnessInstalled()];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__applicationsInstalled_ name:*MEMORY[0x263F43008] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v6 selector:sel__applicationsUninstalled_ name:*MEMORY[0x263F43018] object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained nanoSyncManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CHActivityApplicationInstallationManager;
  [(CHActivityApplicationInstallationManager *)&v5 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained nanoSyncManager];
  [v6 addObserver:self];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  v8 = [v7 nanoSyncManager];
  id v9 = [v8 pairedDevicesSnapshot];

  [(CHActivityApplicationInstallationManager *)self _requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:v9];
}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
}

- (void)_applicationsInstalled:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F43000]];
  int v6 = [v5 containsObject:@"com.apple.Fitness"];

  if (v6)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_225615000, v7, OS_LOG_TYPE_DEFAULT, "Fitness app installed, marking stickers available, posting notification", v8, 2u);
    }
    [(CHActivityApplicationInstallationManager *)self _setAndNotifyStickersAvailable:1];
    notify_post("com.apple.fitness.FitnessAppInstalled");
  }
}

- (void)_applicationsUninstalled:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F43010]];
  int v6 = [v5 containsObject:@"com.apple.Fitness"];

  if (v6)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_225615000, v7, OS_LOG_TYPE_DEFAULT, "Fitness app uninstalled, marking stickers unavailable and delete achievements", v8, 2u);
    }
    [(CHActivityApplicationInstallationManager *)self _setAndNotifyStickersAvailable:0];
  }
}

- (void)_requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__CHActivityApplicationInstallationManager__requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke;
  block[3] = &unk_26471FFC8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __106__CHActivityApplicationInstallationManager__requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:", *(void *)(a1 + 32));
}

- (void)_queue_requestActivityAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  if (!self->_installationRequestInProgress)
  {
    id v4 = [a3 allDeviceInfos];
    BOOL v5 = [v4 count] != 0;
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v7 = [v6 BOOLForKey:@"ForceInstallActivityApp"];
    id v8 = (os_log_t *)MEMORY[0x263F098C8];
    if (v7)
    {
      _HKInitializeLogging();
      id v9 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225615000, v9, OS_LOG_TYPE_DEFAULT, "Fitness app force install default set, overriding deviced paired to YES", buf, 2u);
      }
      BOOL v5 = 1;
    }
    v10 = [MEMORY[0x263F01880] defaultWorkspace];
    char v11 = [v10 applicationIsInstalled:@"com.apple.Fitness"];

    _HKInitializeLogging();
    v12 = *v8;
    BOOL v13 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    if (v5 && (v11 & 1) == 0)
    {
      if (v13)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_225615000, v12, OS_LOG_TYPE_DEFAULT, "Device paired and Acitivty is not installed, requesting installation.", v18, 2u);
      }
      [(CHActivityApplicationInstallationManager *)self _queue_startInstalling];
      goto LABEL_17;
    }
    if (v5)
    {
      if (v13)
      {
        __int16 v17 = 0;
        v14 = "Devices paired and Activity is already installed, nothing to do.";
        v15 = (uint8_t *)&v17;
LABEL_16:
        _os_log_impl(&dword_225615000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      }
    }
    else if (v13)
    {
      __int16 v16 = 0;
      v14 = "No devices paired, nothing to do.";
      v15 = (uint8_t *)&v16;
      goto LABEL_16;
    }
LABEL_17:
  }
}

- (void)_queue_startInstalling
{
  self->_installationRequestInProgress = 1;
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_225615000, v3, OS_LOG_TYPE_DEFAULT, "Starting install request for Activty app", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  id v4 = (void *)[objc_alloc(MEMORY[0x263F25520]) initWithBundleID:@"com.apple.Fitness"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__CHActivityApplicationInstallationManager__queue_startInstalling__block_invoke;
  v5[3] = &unk_26471FE90;
  objc_copyWeak(&v6, buf);
  [v4 startWithErrorHandler:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(buf);
}

void __66__CHActivityApplicationInstallationManager__queue_startInstalling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F098C8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 138412290;
      id v11 = v3;
      id v6 = "Error for request to install Fitness app: %@";
      int v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_225615000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    id v6 = "Request to install Fitness app succeeded";
    int v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupInstallRequest];
}

- (void)_cleanupInstallRequest
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__CHActivityApplicationInstallationManager__cleanupInstallRequest__block_invoke;
  v4[3] = &unk_26471FEB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__CHActivityApplicationInstallationManager__cleanupInstallRequest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cleanupInstallRequest");
}

- (void)_queue_cleanupInstallRequest
{
  systemAppRequest = self->_systemAppRequest;
  self->_systemAppRequest = 0;

  self->_installationRequestInProgress = 0;
}

- (void)_setAndNotifyStickersAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v4 = (NSObject **)MEMORY[0x263F098C8];
  id v5 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_225615000, v5, OS_LOG_TYPE_DEFAULT, "Updating Activity sticker availability", (uint8_t *)&v11, 2u);
  }
  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v7 = *MEMORY[0x263F0AC38];
  int v8 = [v6 BOOLForKey:*MEMORY[0x263F0AC38]];
  _HKInitializeLogging();
  id v9 = *v4;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == v3)
  {
    if (v10)
    {
      int v11 = 67109120;
      BOOL v12 = v3;
      _os_log_impl(&dword_225615000, v9, OS_LOG_TYPE_DEFAULT, "Stickers available already set to %{BOOL}d", (uint8_t *)&v11, 8u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 67109120;
      BOOL v12 = v3;
      _os_log_impl(&dword_225615000, v9, OS_LOG_TYPE_DEFAULT, "Setting stickers available to: %{BOOL}d", (uint8_t *)&v11, 8u);
    }
    [v6 setBool:v3 forKey:v7];
    [v6 synchronize];
    notify_post((const char *)*MEMORY[0x263F0AC30]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemAppRequest, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end