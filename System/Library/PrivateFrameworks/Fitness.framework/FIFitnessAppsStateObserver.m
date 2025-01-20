@interface FIFitnessAppsStateObserver
- (BOOL)areFitnessAppsRestricted;
- (FIFitnessAppsStateObserver)init;
- (FIFitnessAppsStateObserver)initWithBundleIdentifiers:(id)a3;
- (FIFitnessAppsStateObserverDelegate)delegate;
- (id)_filteredAppProxies:(id)a3;
- (int64_t)_lock_installStateForBundleIdentifier:(id)a3;
- (int64_t)installStateForBundleIdentifier:(id)a3;
- (void)_cacheInitialFitnessAppsInstallState;
- (void)_cacheInitialFitnessAppsRestrictedState;
- (void)_updateCurrentFitnessAppsInstallStateWithProxies:(id)a3 newState:(int64_t)a4;
- (void)_updateCurrentFitnessAppsRestrictedStateWithProxies:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation FIFitnessAppsStateObserver

- (FIFitnessAppsStateObserver)init
{
  v6[4] = *MEMORY[0x263EF8340];
  v6[0] = @"com.apple.ActivityMonitorApp";
  v6[1] = @"com.apple.Fitness";
  v6[2] = @"com.apple.Mind";
  v6[3] = @"com.apple.SessionTrackerApp";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [(FIFitnessAppsStateObserver *)self initWithBundleIdentifiers:v3];

  return v4;
}

- (FIFitnessAppsStateObserver)initWithBundleIdentifiers:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FIFitnessAppsStateObserver;
  v6 = [(FIFitnessAppsStateObserver *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_fitnessAppsRestrictedState = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fitnessAppsInstallationState = v7->_fitnessAppsInstallationState;
    v7->_fitnessAppsInstallationState = v8;

    objc_storeStrong((id *)&v7->_appBundleIdentifersToMonitor, a3);
    [(FIFitnessAppsStateObserver *)v7 _cacheInitialFitnessAppsInstallState];
    [(FIFitnessAppsStateObserver *)v7 _cacheInitialFitnessAppsRestrictedState];
    v10 = [MEMORY[0x263F01880] defaultWorkspace];
    [v10 addObserver:v7];
  }
  return v7;
}

- (void)_cacheInitialFitnessAppsRestrictedState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_appBundleIdentifersToMonitor;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(MEMORY[0x263F01868], "applicationProxyForIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        if (v9) {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(FIFitnessAppsStateObserver *)self _updateCurrentFitnessAppsRestrictedStateWithProxies:v3];
}

- (void)_updateCurrentFitnessAppsRestrictedStateWithProxies:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "appState", (void)v17);
        char v10 = [v9 isRestricted];

        if (v10)
        {
          LODWORD(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (self->_fitnessAppsRestrictedState == v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_fitnessAppsRestrictedState = v6;
    os_unfair_lock_unlock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      long long v13 = @"Allowed";
      if (v6) {
        long long v13 = @"Restricted";
      }
      v14 = v13;
      _HKInitializeLogging();
      uint64_t v15 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_impl(&dword_21C74B000, v15, OS_LOG_TYPE_DEFAULT, "Fitness App Restricted State changed to %{public}@, notifying delegate", buf, 0xCu);
      }
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 fitnessAppsStateObserver:self restrictedStateDidChange:v6];
    }
  }
}

- (void)_cacheInitialFitnessAppsInstallState
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  id v3 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C74B000, v3, OS_LOG_TYPE_DEFAULT, "Caching app installation states", buf, 2u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_appBundleIdentifersToMonitor;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        char v10 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v9];
        long long v11 = [v10 appState];
        int v12 = [v11 isInstalled];

        _HKInitializeLogging();
        long long v13 = *MEMORY[0x263F098C8];
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          uint64_t v15 = &unk_26CD11C88;
          if (v14)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v22 = v9;
            _os_log_impl(&dword_21C74B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is installed", buf, 0xCu);
            uint64_t v15 = &unk_26CD11C88;
          }
        }
        else
        {
          uint64_t v15 = &unk_26CD11CA0;
          if (v14)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v22 = v9;
            _os_log_impl(&dword_21C74B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is uninstalled", buf, 0xCu);
            uint64_t v15 = &unk_26CD11CA0;
          }
        }
        [(NSMutableDictionary *)self->_fitnessAppsInstallationState setObject:v15 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (int64_t)installStateForBundleIdentifier:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  int64_t v6 = [(FIFitnessAppsStateObserver *)self _lock_installStateForBundleIdentifier:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)_lock_installStateForBundleIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_fitnessAppsInstallationState objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FIFitnessAppsStateObserver;
  [(FIFitnessAppsStateObserver *)&v4 dealloc];
}

- (BOOL)areFitnessAppsRestricted
{
  v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fitnessAppsRestrictedState == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_filteredAppProxies:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  appBundleIdentifersToMonitor = self->_appBundleIdentifersToMonitor;
  id v5 = a3;
  int64_t v6 = [v3 setWithArray:appBundleIdentifersToMonitor];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__FIFitnessAppsStateObserver__filteredAppProxies___block_invoke;
  v10[3] = &unk_26441CAC0;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v5, "hk_filter:", v10);

  return v8;
}

uint64_t __50__FIFitnessAppsStateObserver__filteredAppProxies___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v4 = [(FIFitnessAppsStateObserver *)self _filteredAppProxies:a3];
  if ([v4 count])
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v6 = 0;
      _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "App State notice received for monitored apps", v6, 2u);
    }
    [(FIFitnessAppsStateObserver *)self _updateCurrentFitnessAppsRestrictedStateWithProxies:v4];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v4 = [(FIFitnessAppsStateObserver *)self _filteredAppProxies:a3];
  if ([v4 count])
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v6 = 0;
      _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Uninstall notice received for monitored apps", v6, 2u);
    }
    [(FIFitnessAppsStateObserver *)self _updateCurrentFitnessAppsInstallStateWithProxies:v4 newState:2];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v4 = [(FIFitnessAppsStateObserver *)self _filteredAppProxies:a3];
  if ([v4 count])
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v6 = 0;
      _os_log_impl(&dword_21C74B000, v5, OS_LOG_TYPE_DEFAULT, "Install notice received for monitored apps", v6, 2u);
    }
    [(FIFitnessAppsStateObserver *)self _updateCurrentFitnessAppsInstallStateWithProxies:v4 newState:1];
  }
}

- (void)_updateCurrentFitnessAppsInstallStateWithProxies:(id)a3 newState:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    int v12 = @"Uninstalled";
    if (a4 == 1) {
      int v12 = @"Installed";
    }
    v21 = v12;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) bundleIdentifier];
        if ([(FIFitnessAppsStateObserver *)self _lock_installStateForBundleIdentifier:v14] != a4)
        {
          _HKInitializeLogging();
          uint64_t v15 = *MEMORY[0x263F098C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v27 = v14;
            __int16 v28 = 2114;
            v29 = v21;
            _os_log_impl(&dword_21C74B000, v15, OS_LOG_TYPE_DEFAULT, "Updating installed stated for %{public}@ to %{public}@", buf, 0x16u);
          }
          id v16 = [NSNumber numberWithInteger:a4];
          [(NSMutableDictionary *)self->_fitnessAppsInstallationState setObject:v16 forKeyedSubscript:v14];

          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
  if ([v7 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      long long v20 = (void *)[v7 copy];
      [v19 fitnessAppsStateObserver:self applicationInstallStateDidChangeForBundleIdentifiers:v20];
    }
  }
}

- (FIFitnessAppsStateObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FIFitnessAppsStateObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fitnessAppsInstallationState, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifersToMonitor, 0);
}

@end