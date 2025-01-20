@interface HDHAHealthAppApplicationInstallationManager
- (HDHAHealthAppApplicationInstallationManager)initWithProfile:(id)a3;
- (void)_cleanupInstallRequest;
- (void)_queue_cleanupInstallRequest;
- (void)_queue_installHealthAppIfTinkerProfileExists;
- (void)_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3;
- (void)_queue_startInstalling;
- (void)_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4;
@end

@implementation HDHAHealthAppApplicationInstallationManager

- (HDHAHealthAppApplicationInstallationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDHAHealthAppApplicationInstallationManager;
  v5 = [(HDHAHealthAppApplicationInstallationManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v10 = [WeakRetained daemon];
    [v10 registerDaemonReadyObserver:v6 queue:v6->_queue];

    id v11 = objc_loadWeakRetained((id *)&v6->_profile);
    v12 = [v11 daemon];
    v13 = [v12 profileManager];
    [v13 addProfileManagerObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained nanoSyncManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HDHAHealthAppApplicationInstallationManager;
  [(HDHAHealthAppApplicationInstallationManager *)&v5 dealloc];
}

- (void)daemonReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained nanoSyncManager];
  [v6 addObserver:self];

  id v7 = objc_loadWeakRetained((id *)p_profile);
  v8 = [v7 nanoSyncManager];
  id v9 = [v8 pairedDevicesSnapshot];

  [(HDHAHealthAppApplicationInstallationManager *)self _queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:v9];
  [(HDHAHealthAppApplicationInstallationManager *)self _queue_installHealthAppIfTinkerProfileExists];
}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
}

- (void)_queue_installHealthAppIfTinkerProfileExists
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  objc_super v5 = [v4 profileManager];
  v6 = [v5 allProfileIdentifiers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained((id *)p_profile);
        v13 = [v12 daemon];
        v14 = [v13 profileManager];
        objc_super v15 = [v14 profileForIdentifier:v11];

        if ([v15 profileType] == 3)
        {
          v16 = [MEMORY[0x263F0A980] sharedBehavior];
          int v17 = [v16 healthAppNotInstalled];

          if (v17)
          {
            _HKInitializeLogging();
            v18 = *MEMORY[0x263F098F8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_250D3F000, v18, OS_LOG_TYPE_DEFAULT, "Tinker profile detected and Health App is not installed, requesting installation.", buf, 2u);
            }
            [(HDHAHealthAppApplicationInstallationManager *)self _queue_startInstalling];
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__HDHAHealthAppApplicationInstallationManager__requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke;
  block[3] = &unk_265358BB0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __107__HDHAHealthAppApplicationInstallationManager__requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:", *(void *)(a1 + 32));
}

- (void)_queue_requestHealthAppInstallIfNecessaryWithPairedDeviceSnapshot:(id)a3
{
  if (!self->_installationRequestInProgress)
  {
    id v4 = [a3 allDeviceInfos];
    uint64_t v5 = [v4 count];
    id v6 = [MEMORY[0x263F0A980] sharedBehavior];
    int v7 = [v6 healthAppNotInstalled];

    _HKInitializeLogging();
    id v8 = *MEMORY[0x263F098F8];
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT);
    if (v5 && v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, "Device paired and Health is not installed, requesting installation.", buf, 2u);
      }
      [(HDHAHealthAppApplicationInstallationManager *)self _queue_startInstalling];
      goto LABEL_13;
    }
    if (v5)
    {
      if (v9)
      {
        __int16 v13 = 0;
        uint64_t v10 = "Devices paired and Health is already installed, nothing to do.";
        uint64_t v11 = (uint8_t *)&v13;
LABEL_12:
        _os_log_impl(&dword_250D3F000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      __int16 v12 = 0;
      uint64_t v10 = "No devices paired, nothing to do.";
      uint64_t v11 = (uint8_t *)&v12;
      goto LABEL_12;
    }
LABEL_13:
  }
}

- (void)_queue_startInstalling
{
  self->_installationRequestInProgress = 1;
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "Starting install request for Health app", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  id v4 = objc_alloc(MEMORY[0x263F25520]);
  uint64_t v5 = (void *)[v4 initWithBundleID:*MEMORY[0x263F0AD08]];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HDHAHealthAppApplicationInstallationManager__queue_startInstalling__block_invoke;
  v6[3] = &unk_265358940;
  objc_copyWeak(&v7, buf);
  [v5 startWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(buf);
}

void __69__HDHAHealthAppApplicationInstallationManager__queue_startInstalling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x263F098F8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 138412290;
      id v11 = v3;
      id v6 = "Error for request to install Health app: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_250D3F000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    id v6 = "Request to install Health app succeeded";
    id v7 = v4;
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
  v4[2] = __69__HDHAHealthAppApplicationInstallationManager__cleanupInstallRequest__block_invoke;
  v4[3] = &unk_2653588D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__HDHAHealthAppApplicationInstallationManager__cleanupInstallRequest__block_invoke(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemAppRequest, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end