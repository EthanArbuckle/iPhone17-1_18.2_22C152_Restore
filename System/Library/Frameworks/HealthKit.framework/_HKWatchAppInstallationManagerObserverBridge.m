@interface _HKWatchAppInstallationManagerObserverBridge
- (HKObserverBridgeHandle)handle;
- (_HKWatchAppInstallationManagerObserverBridge)initWithHandle:(id)a3;
- (void)watchAppInstallationManagerDidObserveChange:(id)a3;
@end

@implementation _HKWatchAppInstallationManagerObserverBridge

- (_HKWatchAppInstallationManagerObserverBridge)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWatchAppInstallationManagerObserverBridge;
  v6 = [(_HKWatchAppInstallationManagerObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (void)watchAppInstallationManagerDidObserveChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed change in watch app installation, notifying observers", buf, 0xCu);
  }
  id v14 = 0;
  v7 = [v4 isWatchAppInstalledWithError:&v14];
  id v8 = v14;
  if (v8)
  {
    _HKInitializeLogging();
    objc_super v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = [v4 bundleIdentifier];
      *(_DWORD *)buf = 138543874;
      id v16 = v10;
      __int16 v17 = 2114;
      v18 = v12;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_error_impl(&dword_19C023000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Error retrieving value for watch app installation for %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    handle = self->_handle;
    objc_super v9 = [v4 bundleIdentifier];
    [(HKObserverBridgeHandle *)handle notifyObserversOfChangeForKey:v9 newValue:v7];
  }
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end