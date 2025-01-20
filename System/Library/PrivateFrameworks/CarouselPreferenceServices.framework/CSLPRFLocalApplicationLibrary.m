@interface CSLPRFLocalApplicationLibrary
- (BOOL)_isVisibleApplicationForRecord:(uint64_t)a1;
- (CSLPRFLocalApplicationLibrary)init;
- (NSArray)allApplications;
- (NSDictionary)allApplicationsDictionary;
- (id)applicationWithBundleIdentifier:(id)a3;
- (void)_applicationsUninstalledWithRecords:(uint64_t)a1;
- (void)_stopObserving;
- (void)addObserver:(id)a3;
- (void)allApplicationsWithCompletion:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFLocalApplicationLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedApplications, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
}

- (void)applicationInstallsDidStart:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__CSLPRFLocalApplicationLibrary_applicationInstallsDidStart___block_invoke;
  v5[3] = &unk_264A0ABF0;
  v5[4] = self;
  v4 = objc_msgSend(a3, "bs_mapNoNulls:", v5);
  if ([v4 count]) {
    -[CSLPRFLocalApplicationLibrary _applicationsUninstalledWithRecords:]((uint64_t)self, v4);
  }
}

id __61__CSLPRFLocalApplicationLibrary_applicationInstallsDidStart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 appState];
  if (([v4 isValid] & 1) == 0)
  {

    goto LABEL_7;
  }
  v5 = [v3 appState];
  int v6 = [v5 isDowngraded];

  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v7 = cslprf_app_library_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [v3 bundleIdentifier];
    int v12 = 134218242;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "%p App with bundleID %@ is offloaded, will attempt to remove counterparts if needed", (uint8_t *)&v12, 0x16u);
  }
  v10 = objc_msgSend(v3, "cslprf_safeCorrespondingApplicationRecord");
LABEL_8:

  return v10;
}

- (void)_applicationsUninstalledWithRecords:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v4 = [MEMORY[0x263EFF980] array];
    lock = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "bundleIdentifier", lock);
          int v12 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v11 allowPlaceholder:1 error:0];
          uint64_t v13 = v12;
          if ((!v12 || [v12 isPlaceholder])
            && -[CSLPRFLocalApplicationLibrary _isVisibleApplicationForRecord:](a1, v10))
          {
            __int16 v14 = [*(id *)(a1 + 16) objectForKey:v11];

            if (v14)
            {
              v15 = cslprf_app_library_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v26 = a1;
                __int16 v27 = 2112;
                v28 = v11;
                _os_log_impl(&dword_22F4EA000, v15, OS_LOG_TYPE_INFO, "%p uninstalled, will remove application:%@", buf, 0x16u);
              }

              [*(id *)(a1 + 16) removeObjectForKey:v11];
              [v4 addObject:v11];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(lock);
    if ([v4 count])
    {
      uint64_t v16 = *(void **)(a1 + 8);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __69__CSLPRFLocalApplicationLibrary__applicationsUninstalledWithRecords___block_invoke;
      v19[3] = &unk_264A0B4C8;
      v19[4] = a1;
      id v20 = v4;
      [v16 notifyObserversWithBlock:v19];
    }
    id v3 = v18;
  }
}

- (BOOL)_isVisibleApplicationForRecord:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1
    && ([v3 appTags],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsObject:@"hidden"],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v8 = [v4 typeForInstallMachinery];
    BOOL v7 = ([v8 isEqualToString:*MEMORY[0x263F01838]] & 1) != 0
      || [v8 isEqualToString:*MEMORY[0x263F01848]];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __69__CSLPRFLocalApplicationLibrary__applicationsUninstalledWithRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (void)applicationsDidUninstall:(id)a3
{
  objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_8);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSLPRFLocalApplicationLibrary _applicationsUninstalledWithRecords:]((uint64_t)self, v4);
}

uint64_t __58__CSLPRFLocalApplicationLibrary_applicationsDidUninstall___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cslprf_safeCorrespondingApplicationRecord");
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_48);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v4;
  if (self)
  {
    v25 = [MEMORY[0x263EFF980] array];
    __int16 v27 = [MEMORY[0x263EFF980] array];
    uint64_t v26 = [MEMORY[0x263EFF980] array];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = v24;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (-[CSLPRFLocalApplicationLibrary _isVisibleApplicationForRecord:]((uint64_t)self, v10))
          {
            v11 = objc_msgSend(v10, "bundleIdentifier", lock);
            int v12 = [(NSMutableDictionary *)self->_lock_cachedApplications objectForKey:v11];

            uint64_t v13 = [v10 applicationState];
            int v14 = [v13 isInstalled];

            if (v14)
            {
              v15 = +[CSLPRFApp appWithApplicationRecord:v10];
              [(NSMutableDictionary *)self->_lock_cachedApplications setObject:v15 forKey:v11];
              uint64_t v16 = cslprf_app_library_log();
              BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
              if (v12)
              {
                id v18 = v27;
                if (v17)
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&uint8_t buf[4] = self;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v15;
                  _os_log_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_INFO, "%p updated application:%@", buf, 0x16u);
                  id v18 = v27;
                }
              }
              else
              {
                id v18 = v25;
                if (v17)
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&uint8_t buf[4] = self;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v15;
                  _os_log_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_INFO, "%p added application:%@", buf, 0x16u);
                  id v18 = v25;
                }
              }

              [v18 addObject:v15];
            }
            else if (v12)
            {
              v19 = cslprf_app_library_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v11;
                _os_log_impl(&dword_22F4EA000, v19, OS_LOG_TYPE_INFO, "%p not installed, will remove application:%@", buf, 0x16u);
              }

              [(NSMutableDictionary *)self->_lock_cachedApplications removeObjectForKey:v11];
              [v26 addObject:v11];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(lock);
    if ([v25 count])
    {
      observationHelper = self->_observationHelper;
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke;
      v37 = &unk_264A0B4C8;
      v38 = self;
      id v39 = v25;
      [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:buf];
    }
    if (objc_msgSend(v27, "count", lock))
    {
      long long v21 = self->_observationHelper;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke_2;
      v30[3] = &unk_264A0B4C8;
      v30[4] = self;
      id v31 = v27;
      [(CSLPRFObservationHelper *)v21 notifyObserversWithBlock:v30];
    }
    if ([v26 count])
    {
      long long v22 = self->_observationHelper;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke_3;
      v28[3] = &unk_264A0B4C8;
      v28[4] = self;
      id v29 = v26;
      [(CSLPRFObservationHelper *)v22 notifyObserversWithBlock:v28];
    }
    id v4 = v24;
  }
}

uint64_t __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

uint64_t __66__CSLPRFLocalApplicationLibrary_applicationsInstalledWithRecords___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

uint64_t __56__CSLPRFLocalApplicationLibrary_applicationsDidInstall___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cslprf_safeCorrespondingApplicationRecord");
}

- (void)removeObserver:(id)a3
{
  [(CSLPRFObservationHelper *)self->_observationHelper removeObserver:a3];
  if (![(CSLPRFObservationHelper *)self->_observationHelper observerCount])
  {
    -[CSLPRFLocalApplicationLibrary _stopObserving]((uint64_t)self);
  }
}

- (void)_stopObserving
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    int v3 = *(unsigned __int8 *)(a1 + 28);
    *(unsigned char *)(a1 + 28) = 0;
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      id v4 = [MEMORY[0x263F01880] defaultWorkspace];
      [v4 removeObserver:a1];
    }
  }
}

- (void)addObserver:(id)a3
{
  observationHelper = self->_observationHelper;
  id v5 = a3;
  uint64_t v6 = [(CSLPRFObservationHelper *)observationHelper observerCount];
  [(CSLPRFObservationHelper *)self->_observationHelper addObserver:v5];
  uint64_t v7 = [(CSLPRFLocalApplicationLibrary *)self allApplications];
  [v5 applicationLibrary:self didAddApplications:v7];

  if (!v6)
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_observing = self->_lock_observing;
    self->_BOOL lock_observing = 1;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_observing)
    {
      id v9 = [MEMORY[0x263F01880] defaultWorkspace];
      [v9 addObserver:self];
    }
  }
}

- (void)allApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(CSLPRFLocalApplicationLibrary *)self allApplications];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSDictionary)allApplicationsDictionary
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__CSLPRFLocalApplicationLibrary_allApplicationsDictionary__block_invoke;
  v21[3] = &unk_264A0ABA8;
  v21[4] = self;
  id v4 = (void *)MEMORY[0x230FB9060](v21);
  id v5 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  [v5 setFilter:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[CSLPRFApp appWithApplicationRecord:](CSLPRFApp, "appWithApplicationRecord:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        int v12 = [v11 bundleIdentifier];
        [(NSMutableDictionary *)v3 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  lock_cachedApplications = self->_lock_cachedApplications;
  self->_lock_cachedApplications = v3;
  int v14 = v3;

  os_unfair_lock_unlock(&self->_lock);
  v15 = (void *)[(NSMutableDictionary *)v14 copy];

  return (NSDictionary *)v15;
}

BOOL __58__CSLPRFLocalApplicationLibrary_allApplicationsDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isPlaceholder] & 1) != 0 || objc_msgSend(v3, "isSystemPlaceholder"))
  {
    id v4 = cslprf_app_library_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [v3 bundleIdentifier];
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_error_impl(&dword_22F4EA000, v4, OS_LOG_TYPE_ERROR, "%@ Unexpectedly received a placeholder for %@", (uint8_t *)&v9, 0x16u);
    }
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = -[CSLPRFLocalApplicationLibrary _isVisibleApplicationForRecord:](*(void *)(a1 + 32), v3);
  }

  return v5;
}

- (NSArray)allApplications
{
  v2 = [(CSLPRFLocalApplicationLibrary *)self allApplicationsDictionary];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(CSLPRFLocalApplicationLibrary *)self applicationWithBundleIdentifier:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 length])
  {
    id v12 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v12];
    id v7 = v12;
    if (v7)
    {
      id v8 = cslprf_app_library_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        int v14 = self;
        __int16 v15 = 2112;
        uint64_t v16 = v5;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_INFO, "%@ failed to lookup LSApplicationRecord for bundleIdentifier:%@  error:%@", buf, 0x20u);
      }

      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_lock_cachedApplications removeObjectForKey:v5];
      os_unfair_lock_unlock(&self->_lock);
      int v9 = 0;
    }
    else
    {
      int v9 = +[CSLPRFApp appWithApplicationRecord:v6];
      uint64_t v10 = [v9 bundleIdentifier];
      if (v10)
      {
        os_unfair_lock_lock(&self->_lock);
        [(NSMutableDictionary *)self->_lock_cachedApplications setObject:v9 forKey:v10];
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  -[CSLPRFLocalApplicationLibrary _stopObserving]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFLocalApplicationLibrary;
  [(CSLPRFLocalApplicationLibrary *)&v3 dealloc];
}

- (CSLPRFLocalApplicationLibrary)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLPRFLocalApplicationLibrary;
  v2 = [(CSLPRFLocalApplicationLibrary *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v3->_observationHelper;
    v3->_observationHelper = v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    lock_cachedApplications = v3->_lock_cachedApplications;
    v3->_lock_cachedApplications = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end