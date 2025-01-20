@interface ATXIntentMetadataCacheInvalidationMonitor
- (id)_getCurrentBuild;
- (void)_checkForOSUpdate;
- (void)_listenForAppRegistrationAndUninstall;
- (void)_notifyDelegateApplicationsDidUninstall:(id)a3;
- (void)_notifyDelegateApplicationsDidUpdate:(id)a3;
- (void)_notifyDelegateSystemDidUpdate;
- (void)setDelegateAndStartMonitoring:(id)a3;
- (void)setDelegateAndStartMonitoring:(id)a3 userDefaults:(id)a4;
@end

@implementation ATXIntentMetadataCacheInvalidationMonitor

- (void)setDelegateAndStartMonitoring:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [(ATXIntentMetadataCacheInvalidationMonitor *)self setDelegateAndStartMonitoring:v5 userDefaults:v7];
}

- (void)setDelegateAndStartMonitoring:(id)a3 userDefaults:(id)a4
{
  objc_storeStrong((id *)&self->_userDefaults, a4);
  id v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);

  [(ATXIntentMetadataCacheInvalidationMonitor *)self _listenForAppRegistrationAndUninstall];
  [(ATXIntentMetadataCacheInvalidationMonitor *)self _checkForOSUpdate];
}

- (void)_listenForAppRegistrationAndUninstall
{
  objc_initWeak(&location, self);
  v3 = (ATXInternalAppRegistrationNotification *)objc_opt_new();
  appRegistrationListener = self->_appRegistrationListener;
  self->_appRegistrationListener = v3;

  id v5 = self->_appRegistrationListener;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke;
  v11[3] = &unk_1E68AB9B0;
  objc_copyWeak(&v12, &location);
  [(ATXInternalAppRegistrationNotification *)v5 registerForNotificationsWithRegisterBlock:v11];
  id v6 = (_ATXInternalUninstallNotification *)objc_opt_new();
  appUninstallListener = self->_appUninstallListener;
  self->_appUninstallListener = v6;

  v8 = self->_appUninstallListener;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke_11;
  v9[3] = &unk_1E68AB9D8;
  objc_copyWeak(&v10, &location);
  [(_ATXInternalUninstallNotification *)v8 registerForNotificationsWithUninstallBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor received ATXInternalAppRegistrationNotification", v7, 2u);
    }

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
    [WeakRetained _notifyDelegateApplicationsDidUpdate:v6];
  }
}

void __82__ATXIntentMetadataCacheInvalidationMonitor__listenForAppRegistrationAndUninstall__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor received _ATXInternalUninstallNotification", v6, 2u);
    }

    [WeakRetained _notifyDelegateApplicationsDidUninstall:v3];
  }
}

- (id)_getCurrentBuild
{
  return (id)[MEMORY[0x1E4F93B10] currentOsBuild];
}

- (void)_checkForOSUpdate
{
  id v3 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"ATXIntentCache.OSVersion"];
  v4 = [(ATXIntentMetadataCacheInvalidationMonitor *)self _getCurrentBuild];
  if (([v3 isEqualToString:v4] & 1) == 0)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCacheInvalidationMonitor determined that OS updated", v6, 2u);
    }

    [(ATXIntentMetadataCacheInvalidationMonitor *)self _notifyDelegateSystemDidUpdate];
  }
  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"ATXIntentCache.OSVersion"];
}

- (void)_notifyDelegateApplicationsDidUpdate:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained applicationsDidUpdate:v4];
}

- (void)_notifyDelegateApplicationsDidUninstall:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained applicationsDidUninstall:v4];
}

- (void)_notifyDelegateSystemDidUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemDidUpdate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_appUninstallListener, 0);
  objc_storeStrong((id *)&self->_appRegistrationListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end