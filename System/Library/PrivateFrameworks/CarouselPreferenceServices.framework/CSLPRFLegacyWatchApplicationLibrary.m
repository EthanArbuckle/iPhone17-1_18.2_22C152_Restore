@interface CSLPRFLegacyWatchApplicationLibrary
- (CSLPRFLegacyWatchApplicationLibrary)initWithPairedWatch:(id)a3;
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
- (void)nanoRegistrySource:(id)a3 updatedWithAllApplications:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFLegacyWatchApplicationLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_firstPartyApplications, 0);
  objc_storeStrong((id *)&self->_lock_cachedApplications, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
  objc_storeStrong((id *)&self->_pairedWatch, 0);
  objc_storeStrong((id *)&self->_nanoAppRegistrySource, 0);
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_pairedWatch pairingID];

  if (v8 == v7)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          [(NSMutableDictionary *)self->_lock_cachedApplications removeObjectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __85__CSLPRFLegacyWatchApplicationLibrary_applicationsUninstalled_onDeviceWithPairingID___block_invoke;
    v15[3] = &unk_264A0B4C8;
    v15[4] = self;
    id v16 = v9;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v15];
  }
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_applicationsUninstalled_onDeviceWithPairingID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_pairedWatch pairingID];

  if (v8 == v7)
  {
    id v9 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_15);
    os_unfair_lock_lock(&self->_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          lock_cachedApplications = self->_lock_cachedApplications;
          long long v17 = [v15 bundleIdentifier];
          [(NSMutableDictionary *)lock_cachedApplications setObject:v15 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__CSLPRFLegacyWatchApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke_2;
    v20[3] = &unk_264A0B4C8;
    v20[4] = self;
    id v21 = v10;
    id v19 = v10;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v20];
  }
}

uint64_t __81__CSLPRFLegacyWatchApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

CSLPRFApp *__81__CSLPRFLegacyWatchApplicationLibrary_applicationsUpdated_onDeviceWithPairingID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CSLPRFApp appWithACXRemoteApplication:a2];
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NRDevice *)self->_pairedWatch pairingID];

  if (v8 == v7)
  {
    id v9 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_12);
    os_unfair_lock_lock(&self->_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          lock_cachedApplications = self->_lock_cachedApplications;
          long long v17 = [v15 bundleIdentifier];
          [(NSMutableDictionary *)lock_cachedApplications setObject:v15 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    os_unfair_lock_unlock(&self->_lock);
    observationHelper = self->_observationHelper;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __83__CSLPRFLegacyWatchApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke_2;
    v20[3] = &unk_264A0B4C8;
    v20[4] = self;
    id v21 = v10;
    id v19 = v10;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v20];
  }
}

uint64_t __83__CSLPRFLegacyWatchApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

CSLPRFApp *__83__CSLPRFLegacyWatchApplicationLibrary_applicationsInstalled_onDeviceWithPairingID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CSLPRFApp appWithACXRemoteApplication:a2];
}

- (void)nanoRegistrySource:(id)a3 updatedWithAllApplications:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_lock_firstPartyApplications;
  id v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_2317);
  id v9 = [v7 dictionaryWithObjects:v5 forKeys:v8];

  v43 = v9;
  objc_storeStrong((id *)&self->_lock_firstPartyApplications, v9);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v59 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        lock_cachedApplications = self->_lock_cachedApplications;
        long long v17 = [v15 bundleIdentifier];
        [(NSMutableDictionary *)lock_cachedApplications setObject:v15 forKey:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  long long v18 = (void *)MEMORY[0x263EFFA08];
  v42 = v6;
  id v19 = [(NSMutableDictionary *)v6 allKeys];
  long long v20 = [v18 setWithArray:v19];

  id v21 = (void *)MEMORY[0x263EFFA08];
  long long v22 = [v43 allKeys];
  long long v23 = [v21 setWithArray:v22];

  long long v24 = (void *)[v23 mutableCopy];
  [v24 minusSet:v20];
  long long v25 = (void *)[v23 mutableCopy];
  [v25 minusSet:v24];
  v41 = v20;
  v26 = (void *)[v20 mutableCopy];
  [v26 minusSet:v23];
  os_unfair_lock_lock(&self->_lock);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v55 != v30) {
          objc_enumerationMutation(v27);
        }
        [(NSMutableDictionary *)self->_lock_cachedApplications removeObjectForKey:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v29);
  }

  os_unfair_lock_unlock(&self->_lock);
  if ([v24 count])
  {
    v32 = [v43 allValues];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_2;
    v52[3] = &unk_264A0B330;
    id v53 = v24;
    v33 = objc_msgSend(v32, "bs_filter:", v52);

    observationHelper = self->_observationHelper;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_3;
    v50[3] = &unk_264A0B4C8;
    v50[4] = self;
    id v51 = v33;
    id v35 = v33;
    [(CSLPRFObservationHelper *)observationHelper notifyObserversWithBlock:v50];
  }
  if ([v25 count])
  {
    v36 = [v43 allValues];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_4;
    v48[3] = &unk_264A0B330;
    id v49 = v25;
    v37 = objc_msgSend(v36, "bs_filter:", v48);

    v38 = self->_observationHelper;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_5;
    v46[3] = &unk_264A0B4C8;
    v46[4] = self;
    id v47 = v37;
    id v39 = v37;
    [(CSLPRFObservationHelper *)v38 notifyObserversWithBlock:v46];
  }
  if ([v27 count])
  {
    v40 = self->_observationHelper;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_6;
    v44[3] = &unk_264A0B4C8;
    v44[4] = self;
    id v45 = v27;
    [(CSLPRFObservationHelper *)v40 notifyObserversWithBlock:v44];
  }
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

void __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 allObjects];
  [v4 applicationLibrary:v2 didRemoveApplications:v5];
}

uint64_t __85__CSLPRFLegacyWatchApplicationLibrary_nanoRegistrySource_updatedWithAllApplications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CSLPRFLegacyWatchApplicationLibrary_addObserver___block_invoke;
  v6[3] = &unk_264A0B308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[CSLPRFLegacyWatchApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v6);
}

void __51__CSLPRFLegacyWatchApplicationLibrary_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  [v4 addObserver:v3];
  [*(id *)(a1 + 40) applicationLibrary:*(void *)(a1 + 32) didAddApplications:v5];
}

- (void)_loadApplicationsWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__CSLPRFLegacyWatchApplicationLibrary__loadApplicationsWithCompletion___block_invoke;
    v6[3] = &unk_264A0B650;
    v6[4] = a1;
    id v7 = v3;
    [v5 allApplicationsWithCompletion:v6];
  }
}

void __71__CSLPRFLegacyWatchApplicationLibrary__loadApplicationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = v2;
  if (v3)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionary];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke;
    v16[3] = &unk_264A0B378;
    id v17 = v4;
    id v7 = v6;
    id v18 = v7;
    uint64_t v19 = v3;
    id v20 = v5;
    id v8 = (void *)MEMORY[0x230FB9060](v16);
    id v9 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    [v9 addObserver:v3];
    uint64_t v10 = *(void *)(v3 + 16);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke_2;
    v13[3] = &unk_264A0B3A0;
    id v14 = v7;
    id v15 = v8;
    v13[4] = v3;
    id v11 = v7;
    id v12 = v8;
    [v9 enumerateLocallyAvailableApplicationsForPairedDevice:v10 options:1 withBlock:v13];
  }
}

void __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v24;
    *(void *)&long long v5 = 138412802;
    long long v18 = v5;
    uint64_t v19 = v2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "bundleIdentifier", v18);
        id v11 = [*(id *)(a1 + 40) objectForKey:v10];

        if (v11)
        {
          id v12 = cslprf_app_library_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = *(void *)(a1 + 48);
            id v14 = [*(id *)(a1 + 40) objectForKey:v10];
            *(_DWORD *)buf = v18;
            uint64_t v28 = v13;
            uint64_t v2 = v19;
            __int16 v29 = 2112;
            uint64_t v30 = v14;
            __int16 v31 = 2112;
            v32 = v9;
            _os_log_error_impl(&dword_22F4EA000, v12, OS_LOG_TYPE_ERROR, "%@ appConduit has same app:%@ as nanoAppRegistry:%@", buf, 0x20u);
          }
        }
        else
        {
          [*(id *)(a1 + 40) setObject:v9 forKey:v10];
          [v2 setObject:v9 forKey:v10];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v6);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 48));
  uint64_t v15 = *(void *)(a1 + 48);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v2;
  id v17 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 48));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke_16;
  block[3] = &unk_264A0B628;
  id v22 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = cslprf_app_library_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = [v6 localizedDescription];
      int v18 = 138412546;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v16;
      _os_log_error_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_ERROR, "%@ loadApplications error: %@", (uint8_t *)&v18, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  id v9 = cslprf_app_library_log();
  uint64_t v7 = v9;
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = [*(id *)(a1 + 40) count];
      int v18 = 138412546;
      uint64_t v19 = v13;
      __int16 v20 = 1024;
      LODWORD(v21) = v14;
      _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "%@ loadApplications found %d apps", (uint8_t *)&v18, 0x12u);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 138412546;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_debug_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEBUG, "%@ loadApplications app %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v10 = +[CSLPRFApp appWithACXRemoteApplication:v5];
  id v11 = [v10 bundleIdentifier];
  [*(id *)(a1 + 40) setObject:v10 forKey:v11];

  uint64_t v8 = 1;
LABEL_9:

  return v8;
}

void __108__CSLPRFLegacyWatchApplicationLibrary__withFirstPartyApplications_loadAppConduitApplicationsWithCompletion___block_invoke_16(uint64_t a1)
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
  v6[2] = __69__CSLPRFLegacyWatchApplicationLibrary_allApplicationsWithCompletion___block_invoke;
  v6[3] = &unk_264A0B2E0;
  id v7 = v4;
  id v5 = v4;
  -[CSLPRFLegacyWatchApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v6);
}

uint64_t __69__CSLPRFLegacyWatchApplicationLibrary_allApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__CSLPRFLegacyWatchApplicationLibrary_applicationWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_264A0B2B8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  -[CSLPRFLegacyWatchApplicationLibrary _loadApplicationsWithCompletion:]((uint64_t)self, v10);
}

void __82__CSLPRFLegacyWatchApplicationLibrary_applicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) applicationWithBundleIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (NSDictionary)allApplicationsDictionary
{
  -[CSLPRFLegacyWatchApplicationLibrary _ensureApplicationsCachedSync]((uint64_t)self);
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
    id v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
    os_unfair_lock_unlock(v2);
    if (v3)
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
      v7[2] = __68__CSLPRFLegacyWatchApplicationLibrary__ensureApplicationsCachedSync__block_invoke;
      v7[3] = &unk_264A0B290;
      dispatch_semaphore_t v8 = v4;
      id v6 = v4;
      [(id)a1 allApplicationsWithCompletion:v7];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

intptr_t __68__CSLPRFLegacyWatchApplicationLibrary__ensureApplicationsCachedSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)allApplications
{
  id v2 = [(CSLPRFLegacyWatchApplicationLibrary *)self allApplicationsDictionary];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  -[CSLPRFLegacyWatchApplicationLibrary _ensureApplicationsCachedSync]((uint64_t)self);
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

    [(CSLPRFNanoAppRegistryApplicationSource *)self->_nanoAppRegistrySource setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CSLPRFLegacyWatchApplicationLibrary;
  [(CSLPRFLegacyWatchApplicationLibrary *)&v4 dealloc];
}

- (CSLPRFLegacyWatchApplicationLibrary)initWithPairedWatch:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFLegacyWatchApplicationLibrary;
  id v6 = [(CSLPRFLegacyWatchApplicationLibrary *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pairedWatch, a3);
    dispatch_semaphore_t v8 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v7->_observationHelper;
    v7->_observationHelper = v8;

    uint64_t v10 = objc_alloc_init(CSLPRFNanoAppRegistryApplicationSource);
    nanoAppRegistrySource = v7->_nanoAppRegistrySource;
    v7->_nanoAppRegistrySource = v10;

    [(CSLPRFNanoAppRegistryApplicationSource *)v7->_nanoAppRegistrySource setDelegate:v7];
  }

  return v7;
}

@end