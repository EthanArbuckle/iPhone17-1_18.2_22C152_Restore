@interface HKPairedDeviceAppInstallationManager
- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3;
- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3 forPairedDeviceRegistry:(id)a4;
- (id)handleErrorWithAppConduitFetch:(id)a3 errorOut:(id *)a4;
- (id)isWatchAppInstalledWithError:(id *)a3;
- (void)_watchAppInstallStateDidChange:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation HKPairedDeviceAppInstallationManager

- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v14 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v10[3] = &unk_1E58BD760;
    v10[4] = &v11;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = [v6 sharedInstance];
  v8 = [(HKPairedDeviceAppInstallationManager *)self initWithBundleIdentifier:v4 forPairedDeviceRegistry:v7];

  return v8;
}

- (HKPairedDeviceAppInstallationManager)initWithBundleIdentifier:(id)a3 forPairedDeviceRegistry:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKPairedDeviceAppInstallationManager;
  v8 = [(HKWatchAppInstallationManager *)&v11 initWithBundleIdentifier:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_pairedDeviceRegistry, a4);
  }

  return v9;
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  unsigned __int8 v19 = 0;
  v5 = [self->_pairedDeviceRegistry getActivePairedDevice];
  if (v5)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    id v6 = (void *)getNRDevicePropertyIsSetupSymbolLoc_ptr;
    uint64_t v28 = getNRDevicePropertyIsSetupSymbolLoc_ptr;
    if (!getNRDevicePropertyIsSetupSymbolLoc_ptr)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __getNRDevicePropertyIsSetupSymbolLoc_block_invoke;
      v23 = &unk_1E58BD760;
      v24 = &v25;
      id v7 = (void *)NanoRegistryLibrary();
      v26[3] = (uint64_t)dlsym(v7, "NRDevicePropertyIsSetup");
      getNRDevicePropertyIsSetupSymbolLoc_ptr = *(void *)(v24[1] + 24);
      id v6 = (void *)v26[3];
    }
    _Block_object_dispose(&v25, 8);
    if (!v6) {
      -[HKPairedDeviceAppInstallationManager isWatchAppInstalledWithError:]();
    }
    v8 = [v5 valueForProperty:*v6];
    char v9 = [v8 BOOLValue];

    v10 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    objc_super v11 = [(HKWatchAppInstallationManager *)self bundleIdentifier];
    if (v9)
    {
      v17 = 0;
      char v12 = [v10 getApplicationIsInstalled:&v19 withBundleID:v11 onPairedDevice:v5 error:&v17];
      uint64_t v13 = v17;
    }
    else
    {
      v18 = 0;
      char v12 = [v10 getApplicationWithBundleID:v11 willInstallAfterPairing:&v19 onDevice:v5 error:&v18];
      uint64_t v13 = v18;
    }
    id v15 = v13;

    if (v12) {
      [NSNumber numberWithBool:v19];
    }
    else {
    uint64_t v14 = [(HKPairedDeviceAppInstallationManager *)self handleErrorWithAppConduitFetch:v15 errorOut:a3];
    }
  }
  else
  {
    uint64_t v14 = [NSNumber numberWithBool:0];
  }

  return v14;
}

- (id)handleErrorWithAppConduitFetch:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (a4) {
      *a4 = v6;
    }
    else {
      _HKLogDroppedError(v6);
    }
  }

  _HKInitializeLogging();
  v8 = HKLogInfrastructure();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[HKPairedDeviceAppInstallationManager handleErrorWithAppConduitFetch:errorOut:](self, (uint64_t)v7, v8);
  }

  return 0;
}

- (void)startObserving
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:self selector:sel__watchAppInstallStateDidChange_ name:*MEMORY[0x1E4F4AC48] object:0];
  [v4 addObserver:self selector:sel__watchAppInstallStateDidChange_ name:*MEMORY[0x1E4F4AC50] object:0];
}

- (void)stopObserving
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F4AC48] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F4AC50] object:0];
}

- (void)_watchAppInstallStateDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  int v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 name];
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    __int16 v18 = 2114;
    unsigned __int8 v19 = v8;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received pairing/active notification: %{public}@", buf, 0x16u);
  }
  char v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4AC40]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v11 = [(HKWatchAppInstallationManager *)self bundleIdentifier];
    int v12 = [v10 containsObject:v11];

    if (v12)
    {
      queue = self->super._queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HKPairedDeviceAppInstallationManager__watchAppInstallStateDidChange___block_invoke;
      block[3] = &unk_1E58BBA00;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = HKLogInfrastructure();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HKPairedDeviceAppInstallationManager _watchAppInstallStateDidChange:](v14);
    }
  }
}

uint64_t __71__HKPairedDeviceAppInstallationManager__watchAppInstallStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void).cxx_destruct
{
}

- (void)isWatchAppInstalledWithError:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyIsSetup(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKWatchAppInstallationManager.m", 27, @"%s", dlerror());

  __break(1u);
}

- (void)handleErrorWithAppConduitFetch:(NSObject *)a3 errorOut:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 bundleIdentifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "Failed to check install status of %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_watchAppInstallStateDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Notification user info dictionary is of wrong type", v1, 2u);
}

@end