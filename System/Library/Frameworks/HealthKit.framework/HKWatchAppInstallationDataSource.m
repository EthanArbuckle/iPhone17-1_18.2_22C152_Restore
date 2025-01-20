@interface HKWatchAppInstallationDataSource
- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource;
- (HKWatchAppInstallationDataSource)init;
- (HKWatchAppInstallationDataSource)initWithDevicePairingAndSwitchingNotificationDataSource:(id)a3;
- (NSMutableDictionary)watchAppInstallationManagersByBundleIdentifier;
- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (id)watchAppInstallationManagerForBundleIdentifier:(id)a3;
- (void)_populateManagersDictionaryForBundleIdentifier:(id)a3;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKWatchAppInstallationDataSource

- (HKWatchAppInstallationDataSource)init
{
  v3 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v4 = [(HKWatchAppInstallationDataSource *)self initWithDevicePairingAndSwitchingNotificationDataSource:v3];

  return v4;
}

- (HKWatchAppInstallationDataSource)initWithDevicePairingAndSwitchingNotificationDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKWatchAppInstallationDataSource;
  v6 = [(HKObserverBridge *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_devicePairingAndSwitchingDataSource, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    watchAppInstallationManagersByBundleIdentifier = v7->_watchAppInstallationManagersByBundleIdentifier;
    v7->_watchAppInstallationManagersByBundleIdentifier = v8;
  }
  return v7;
}

- (void)_populateManagersDictionaryForBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_HKBehavior sharedBehavior];
  char v6 = [v5 isAppleWatch];

  if (v6)
  {
    v7 = off_1E58BABF0;
  }
  else
  {
    v8 = +[_HKBehavior sharedBehavior];
    int v9 = [v8 isCompanionCapable];

    if (!v9) {
      goto LABEL_7;
    }
    v7 = off_1E58BADD0;
  }
  uint64_t v10 = [objc_alloc(*v7) initWithBundleIdentifier:v4];
  if (v10)
  {
    objc_super v11 = v10;
    [(NSMutableDictionary *)self->_watchAppInstallationManagersByBundleIdentifier setObject:v10 forKeyedSubscript:v4];
    goto LABEL_9;
  }
LABEL_7:
  _HKInitializeLogging();
  objc_super v11 = HKLogInfrastructure();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v12 = v14;
    _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Device does not support HKWatchAppInstallationManager", (uint8_t *)&v13, 0xCu);
  }
LABEL_9:
}

- (id)watchAppInstallationManagerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_watchAppInstallationManagersByBundleIdentifier objectForKeyedSubscript:v4];

  if (!v5) {
    [(HKWatchAppInstallationDataSource *)self _populateManagersDictionaryForBundleIdentifier:v4];
  }
  char v6 = [(NSMutableDictionary *)self->_watchAppInstallationManagersByBundleIdentifier objectForKeyedSubscript:v4];

  return v6;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v6 = a4;
  v7 = [(HKWatchAppInstallationDataSource *)self watchAppInstallationManagerForBundleIdentifier:a3];
  v8 = [[_HKWatchAppInstallationManagerObserverBridge alloc] initWithHandle:v6];

  [v7 registerObserver:v8];
  int v9 = +[_HKBehavior sharedBehavior];
  char v10 = [v9 isAppleWatch];

  if ((v10 & 1) == 0)
  {
    devicePairingAndSwitchingDataSource = self->_devicePairingAndSwitchingDataSource;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__HKWatchAppInstallationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
    v13[3] = &unk_1E58C9D50;
    id v14 = v8;
    id v15 = v7;
    [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)devicePairingAndSwitchingDataSource registerObserverForDevicePairingChanges:self block:v13];
  }

  return v8;
}

uint64_t __80__HKWatchAppInstallationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchAppInstallationManagerDidObserveChange:*(void *)(a1 + 40)];
}

- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HKWatchAppInstallationDataSource *)self watchAppInstallationManagerForBundleIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    id v17 = 0;
    int v9 = [v7 isWatchAppInstalledWithError:&v17];
    id v10 = v17;
    objc_super v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
      _HKInitializeLogging();
      int v13 = HKLogInfrastructure();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v19 = v15;
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2114;
        v23 = v11;
        id v16 = v15;
        _os_log_error_impl(&dword_19C023000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving value for watch app installation from data source for %{public}@: %{public}@", buf, 0x20u);
      }
      id v12 = 0;
    }
    else
    {
      id v12 = v9;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CC28];
  }

  return v12;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v8 = [(HKWatchAppInstallationDataSource *)self watchAppInstallationManagerForBundleIdentifier:a4];
  [v8 unregisterObserver:v6];

  v7 = +[_HKBehavior sharedBehavior];
  LOBYTE(v6) = [v7 isAppleWatch];

  if ((v6 & 1) == 0) {
    [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self->_devicePairingAndSwitchingDataSource unregisterObserverForDevicePairingChanges:self];
  }
}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource
{
  return self->_devicePairingAndSwitchingDataSource;
}

- (NSMutableDictionary)watchAppInstallationManagersByBundleIdentifier
{
  return self->_watchAppInstallationManagersByBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAppInstallationManagersByBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_devicePairingAndSwitchingDataSource, 0);
}

@end