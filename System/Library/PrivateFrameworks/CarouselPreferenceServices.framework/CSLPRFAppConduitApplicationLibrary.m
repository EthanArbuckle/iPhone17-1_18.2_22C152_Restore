@interface CSLPRFAppConduitApplicationLibrary
- (CSLPRFAppConduitApplicationLibrary)initWithPairedWatch:(id)a3;
- (NSArray)allApplications;
- (NSDictionary)allApplicationsDictionary;
- (id)applicationWithBundleIdentifier:(id)a3;
- (void)_ensureApplicationsCachedSync;
- (void)_loadApplicationsWithCompletion:(uint64_t)a1;
- (void)addObserver:(id)a3;
- (void)allApplicationsWithCompletion:(id)a3;
- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFAppConduitApplicationLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedApplications, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
  objc_storeStrong((id *)&self->_pairedWatch, 0);
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRDevice *)self->_pairedWatch pairingID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          [(NSMutableDictionary *)self->_lock_cachedApplications removeObjectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84__CSLPRFAppConduitApplicationLibrary_applicationsUninstalled_onDeviceWithPairingID___block_invoke;
    v16[3] = &unk_264A0B4C8;
    v16[4] = self;
    id v17 = v10;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v16];
  }
}

uint64_t __84__CSLPRFAppConduitApplicationLibrary_applicationsUninstalled_onDeviceWithPairingID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRDevice *)self->_pairedWatch pairingID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_24);
    os_unfair_lock_lock(&self->_lock);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          lock_cachedApplications = self->_lock_cachedApplications;
          long long v18 = [v16 bundleIdentifier];
          [(NSMutableDictionary *)lock_cachedApplications setObject:v16 forKey:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __80__CSLPRFAppConduitApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke_2;
    v21[3] = &unk_264A0B4C8;
    v21[4] = self;
    id v22 = v11;
    id v20 = v11;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v21];
  }
}

uint64_t __80__CSLPRFAppConduitApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

CSLPRFApp *__80__CSLPRFAppConduitApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CSLPRFApp appWithACXRemoteApplication:a2];
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRDevice *)self->_pairedWatch pairingID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_566);
    os_unfair_lock_lock(&self->_lock);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          lock_cachedApplications = self->_lock_cachedApplications;
          long long v18 = [v16 bundleIdentifier];
          [(NSMutableDictionary *)lock_cachedApplications setObject:v16 forKey:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __82__CSLPRFAppConduitApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke_2;
    v21[3] = &unk_264A0B4C8;
    v21[4] = self;
    id v22 = v11;
    id v20 = v11;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v21];
  }
}

uint64_t __82__CSLPRFAppConduitApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

CSLPRFApp *__82__CSLPRFAppConduitApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CSLPRFApp appWithACXRemoteApplication:a2];
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CSLPRFAppConduitApplicationLibrary_addObserver___block_invoke;
  v6[3] = &unk_264A0B308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[CSLPRFAppConduitApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v6);
}

void __50__CSLPRFAppConduitApplicationLibrary_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = a2;
  [v4 addObserver:v3];
  [*(id *)(a1 + 40) applicationLibrary:*(void *)(a1 + 32) didAddApplications:v5];
}

- (void)_loadApplicationsWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    [v5 addObserver:a1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke;
    v14[3] = &unk_264A0AE20;
    v14[4] = a1;
    id v6 = v4;
    id v15 = v6;
    id v16 = v3;
    id v7 = (void *)MEMORY[0x230FB9060](v14);
    uint64_t v8 = *(void *)(a1 + 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke_3;
    v11[3] = &unk_264A0B3A0;
    id v12 = v6;
    id v13 = v7;
    v11[4] = a1;
    id v9 = v6;
    id v10 = v7;
    [v5 enumerateInstalledApplicationsOnPairedDevice:v8 withBlock:v11];
  }
}

void __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke_2;
  v2[3] = &unk_264A0B628;
  id v4 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  +[CSLPRFSharedWorkloop dispatchWithQOSClass:33 block:v2];
}

uint64_t __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = cslprf_app_library_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = [v6 localizedDescription];
      int v22 = 138412546;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      id v25 = v20;
      _os_log_error_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_ERROR, "%@ loadApplications error: %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  id v9 = cslprf_app_library_log();
  id v7 = v9;
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = [*(id *)(a1 + 40) count];
      int v22 = 138412546;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      LODWORD(v25) = v16;
      _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "%@ loadApplications found %d apps", (uint8_t *)&v22, 0x12u);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    int v22 = 138412546;
    uint64_t v23 = v21;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%@ loadApplications app %@", (uint8_t *)&v22, 0x16u);
  }

  id v10 = +[CSLPRFApp appWithACXRemoteApplication:v5];
  id v11 = [v10 bundleIdentifier];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v11;
  uint64_t v14 = v13;
  if (v12
    && [v13 isEqualToString:@"com.apple.nanonews"]
    && (BPSIsNewsAllowed() & 1) == 0)
  {
    id v17 = cslprf_app_library_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 138412546;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_debug_impl(&dword_22F4EA000, v17, OS_LOG_TYPE_DEBUG, "%@ app %@ hidden by policy", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {

    [*(id *)(a1 + 40) setObject:v10 forKey:v14];
  }

  uint64_t v8 = 1;
LABEL_18:

  return v8;
}

void __70__CSLPRFAppConduitApplicationLibrary__loadApplicationsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) allValues];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)allApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CSLPRFAppConduitApplicationLibrary_allApplicationsWithCompletion___block_invoke;
  v6[3] = &unk_264A0B2E0;
  id v7 = v4;
  id v5 = v4;
  -[CSLPRFAppConduitApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v6);
}

uint64_t __68__CSLPRFAppConduitApplicationLibrary_allApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__CSLPRFAppConduitApplicationLibrary_applicationWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_264A0B2B8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  -[CSLPRFAppConduitApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v10);
}

void __81__CSLPRFAppConduitApplicationLibrary_applicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (NSDictionary)allApplicationsDictionary
{
  -[CSLPRFAppConduitApplicationLibrary _ensureApplicationsCachedSync]((uint64_t)self);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_lock_cachedApplications copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)_ensureApplicationsCachedSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 24);
    os_unfair_lock_unlock(v2);
    if (!v3)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      id v5 = cslprf_app_library_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = a1;
        _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_DEFAULT, "%@ will block while fetching applications asynchronously", buf, 0xCu);
      }

      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __67__CSLPRFAppConduitApplicationLibrary__ensureApplicationsCachedSync__block_invoke;
      v7[3] = &unk_264A0B290;
      dispatch_semaphore_t v8 = v4;
      id v6 = v4;
      [(id)a1 allApplicationsWithCompletion:v7];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

intptr_t __67__CSLPRFAppConduitApplicationLibrary__ensureApplicationsCachedSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)allApplications
{
  id v2 = [(CSLPRFAppConduitApplicationLibrary *)self allApplicationsDictionary];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  -[CSLPRFAppConduitApplicationLibrary _ensureApplicationsCachedSync]((uint64_t)self);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_lock_cachedApplications objectForKey:v4];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)dealloc
{
  if (self)
  {
    uint64_t v3 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)CSLPRFAppConduitApplicationLibrary;
  [(CSLPRFAppConduitApplicationLibrary *)&v4 dealloc];
}

- (CSLPRFAppConduitApplicationLibrary)initWithPairedWatch:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFAppConduitApplicationLibrary;
  id v6 = [(CSLPRFAppConduitApplicationLibrary *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pairedWatch, a3);
    dispatch_semaphore_t v8 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v7->_observationHelper;
    v7->_observationHelper = v8;
  }
  return v7;
}

@end