@interface SGDPluginManager
+ (id)sharedInstance;
+ (void)_processHistoricalDataRequestsForPluginIdentifier:(id)a3 result:(id)a4;
- (SGDPluginManager)init;
- (id)_processSearchableItem:(id)a3 harvestMetrics:(id)a4 userAction:(id)a5;
- (id)pluginIdentifiers;
- (id)processSearchableItem:(id)a3 harvestMetrics:(id)a4;
- (id)processUserAction:(id)a3 searchableItem:(id)a4;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)processInteraction:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 completion:(id)a6;
- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)setPlugins:(id)a3;
@end

@implementation SGDPluginManager

- (void).cxx_destruct
{
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E65BFFF0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  SGNotUserInitiated(@"plugin-deleteSpotlightReferences", 2, v10);
}

uint64_t __77__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1[4] + 8) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1CB79B230]();
        id v8 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:v6];
        if (objc_opt_respondsToSelector())
        {
          id v9 = sgLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = a1[5];
            *(_DWORD *)buf = 138412546;
            uint64_t v20 = v12;
            __int16 v21 = 2112;
            uint64_t v22 = v6;
            _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of bundle %@ to plugin %@", buf, 0x16u);
          }

          v10 = [v8 identifier];
          +[SGDPowerLog pluginStartDeletion:v10];

          [v8 deleteSpotlightReferencesWithBundleIdentifier:a1[5]];
          id v11 = [v8 identifier];
          +[SGDPowerLog pluginEndDeletion:v11];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v3);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E65B85A8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  SGNotUserInitiated(@"plugin-deleteSpotlightReferences", 2, v14);
}

uint64_t __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1CB79B230]();
        id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
        if (objc_opt_respondsToSelector())
        {
          id v9 = sgLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = [*(id *)(a1 + 40) count];
            uint64_t v13 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            uint64_t v21 = v12;
            __int16 v22 = 2112;
            uint64_t v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v6;
            _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of %lu domains from %@ to plugin %@", buf, 0x20u);
          }

          id v10 = [v8 identifier];
          +[SGDPowerLog pluginStartDeletion:v10];

          [v8 deleteSpotlightReferencesWithBundleIdentifier:*(void *)(a1 + 48) domainIdentifiers:*(void *)(a1 + 40)];
          id v11 = [v8 identifier];
          +[SGDPowerLog pluginEndDeletion:v11];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E65B85A8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  SGNotUserInitiated(@"plugin-deleteSpotlightReferences", 2, v14);
}

uint64_t __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1CB79B230]();
        id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
        if (objc_opt_respondsToSelector())
        {
          id v9 = sgLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = [*(id *)(a1 + 40) count];
            uint64_t v13 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            uint64_t v21 = v12;
            __int16 v22 = 2112;
            uint64_t v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v6;
            _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of %lu items from %@ to plugin %@", buf, 0x20u);
          }

          id v10 = [v8 identifier];
          +[SGDPowerLog pluginStartDeletion:v10];

          [v8 deleteSpotlightReferencesWithBundleIdentifier:*(void *)(a1 + 48) uniqueIdentifiers:*(void *)(a1 + 40)];
          id v11 = [v8 identifier];
          +[SGDPowerLog pluginEndDeletion:v11];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__SGDPluginManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E65B85A8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  SGNotUserInitiated(@"plugin-purgeSpotlightReferences", 2, v14);
}

uint64_t __94__SGDPluginManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1CB79B230]();
        id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v6];
        if (objc_opt_respondsToSelector())
        {
          id v9 = sgLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = [*(id *)(a1 + 40) count];
            uint64_t v13 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            uint64_t v21 = v12;
            __int16 v22 = 2112;
            uint64_t v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v6;
            _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "sending purge of %lu items from %@ to plugin %@", buf, 0x20u);
          }

          id v10 = [v8 identifier];
          +[SGDPowerLog pluginStartDeletion:v10];

          [v8 purgeSpotlightReferencesWithBundleIdentifier:*(void *)(a1 + 48) uniqueIdentifiers:*(void *)(a1 + 40)];
          id v11 = [v8 identifier];
          +[SGDPowerLog pluginEndDeletion:v11];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)processInteraction:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[SGXpcTransaction transactionWithName:"SGDPluginManager.processInteraction"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__SGDPluginManager_processInteraction_bundleIdentifier_protectionClass_completion___block_invoke;
  v20[3] = &unk_1E65B6998;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v14;
  id v25 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  SGNotUserInitiated(@"plugin-processInteraction", 2, v20);
}

void __83__SGDPluginManager_processInteraction_bundleIdentifier_protectionClass_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    v29 = 0;
    uint64_t v5 = sel_processInteraction_bundleIdentifier_protectionClass_;
    uint64_t v6 = *(void *)v31;
    *(void *)&long long v3 = 138412546;
    long long v26 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v27 = v4;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1CB79B230]();
        id v10 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v8];
        if (objc_opt_respondsToSelector())
        {
          id v11 = v5;
          id v12 = sgLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v22 = [*(id *)(a1 + 40) identifier];
            id v23 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138412802;
            v35 = v22;
            __int16 v36 = 2112;
            v37 = v23;
            __int16 v38 = 2112;
            v39 = v8;
            _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "Sending processing of interaction %@ from %@ to %@", buf, 0x20u);
          }
          id v13 = [v10 identifier];
          +[SGDPowerLog pluginStartProcessingSearchableItem:v13];

          v14 = [v10 processInteraction:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48) protectionClass:*(void *)(a1 + 56)];
          id v15 = [v10 identifier];
          +[SGDPowerLog pluginEndProcessingSearchableItem:v15];

          id v16 = [v14 error];

          if (v16)
          {
            id v17 = sgLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v14 error];
              *(_DWORD *)buf = v26;
              v35 = v8;
              __int16 v36 = 2112;
              v37 = v24;
              _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "Plugin reported error: %@: %@", buf, 0x16u);
            }
            id v18 = v29;
            if (!v29) {
              id v18 = objc_opt_new();
            }
            id v19 = objc_msgSend(v14, "error", v26);
            v29 = v18;
            [v18 setObject:v19 forKeyedSubscript:v8];
          }
          uint64_t v20 = objc_msgSend(v14, "historicalDataRequests", v26);
          uint64_t v21 = [v20 count];

          if (v21) {
            +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:v8 result:v14];
          }

          uint64_t v5 = v11;
          uint64_t v4 = v27;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v4);
  }
  else
  {
    v29 = 0;
  }

  uint64_t v25 = *(void *)(a1 + 72);
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v29);
  }
  objc_msgSend(*(id *)(a1 + 64), "done", v26);
}

- (id)_processSearchableItem:(id)a3 harvestMetrics:(id)a4 userAction:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = &selRef_processUserAction_searchableItem_;
  if (!v9) {
    id v10 = &selRef_processSearchableItem_;
  }
  id v11 = *v10;
  v46 = v8;
  [v8 startTimer:kHarvestMetricsPluginsTimer];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(NSDictionary *)self->_plugins allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
  uint64_t v41 = v9;
  if (v12)
  {
    uint64_t v14 = v12;
    id v45 = 0;
    uint64_t v15 = *(void *)v48;
    id v16 = @"NSUA";
    if (!v9) {
      id v16 = @"CSSI";
    }
    v39 = v16;
    *(void *)&long long v13 = 138412546;
    long long v38 = v13;
    do
    {
      uint64_t v17 = 0;
      uint64_t v42 = v14;
      do
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(__CFString **)(*((void *)&v47 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v20 = [(NSDictionary *)self->_plugins objectForKeyedSubscript:v18];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v21 = v11;
          id v22 = self;
          id v23 = sgLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v40 = [v43 uniqueIdentifier];
            v35 = [v43 bundleID];
            *(_DWORD *)buf = 138413058;
            v52 = v39;
            __int16 v53 = 2112;
            v54 = v40;
            __int16 v55 = 2112;
            v56 = v35;
            __int16 v57 = 2112;
            v58 = v18;
            _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Sending processing of %@ %@ from %@ to plugin %@", buf, 0x2Au);
          }
          id v24 = [v20 identifier];
          [v46 startTimer:v24];

          uint64_t v25 = [v20 identifier];
          +[SGDPowerLog pluginStartProcessingSearchableItem:v25];

          if (v41) {
            [v20 processUserAction:v41 searchableItem:v43];
          }
          else {
          long long v26 = [v20 processSearchableItem:v43];
          }
          uint64_t v27 = objc_msgSend(v20, "identifier", v38);
          +[SGDPowerLog pluginEndProcessingSearchableItem:v27];

          v28 = [v20 identifier];
          [v46 endTimer:v28 significantWork:1];

          v29 = [v26 error];

          if (v29)
          {
            long long v30 = sgLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              __int16 v36 = [v26 error];
              *(_DWORD *)buf = v38;
              v52 = v18;
              __int16 v53 = 2112;
              v54 = v36;
              _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "Plugin reported error: %@: %@", buf, 0x16u);
            }
            long long v31 = v45;
            if (!v45) {
              long long v31 = objc_opt_new();
            }
            long long v32 = [v26 error];
            id v45 = v31;
            [v31 setObject:v32 forKeyedSubscript:v18];
          }
          long long v33 = [v26 historicalDataRequests];
          uint64_t v34 = [v33 count];

          if (v34) {
            +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:v18 result:v26];
          }

          self = v22;
          id v11 = v21;
          uint64_t v14 = v42;
        }

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v14);
  }
  else
  {
    id v45 = 0;
  }

  [v46 endTimer:kHarvestMetricsPluginsTimer significantWork:1];
  return v45;
}

- (id)processUserAction:(id)a3 searchableItem:(id)a4
{
  return [(SGDPluginManager *)self _processSearchableItem:a4 harvestMetrics:0 userAction:a3];
}

- (id)processSearchableItem:(id)a3 harvestMetrics:(id)a4
{
  return [(SGDPluginManager *)self _processSearchableItem:a3 harvestMetrics:a4 userAction:0];
}

- (SGDPluginManager)init
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)SGDPluginManager;
  uint64_t v2 = [(SGDPluginManager *)&v31 init];
  long long v3 = v2;
  if (v2)
  {
    long long v26 = v2;
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    v37[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v14 = [v12 identifier];
          [v4 setObject:v12 forKeyedSubscript:v14];
          goto LABEL_15;
        }
        long long v13 = [v12 identifier];
        +[SGDPowerLog pluginStartSetup:v13];

        uint64_t v14 = [v12 setup];
        uint64_t v15 = [v12 identifier];
        +[SGDPowerLog pluginEndSetup:v15];

        id v16 = [v14 error];

        if (v16)
        {
          uint64_t v17 = sgLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = [v12 identifier];
            id v19 = [v14 error];
            *(_DWORD *)buf = 138412546;
            long long v33 = v18;
            __int16 v34 = 2112;
            v35 = v19;
            _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "Error during %@ setup: %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v20 = [v12 identifier];
          [v4 setObject:v12 forKeyedSubscript:v20];

          uint64_t v21 = [v14 historicalDataRequests];
          uint64_t v22 = [v21 count];

          if (!v22) {
            goto LABEL_15;
          }
          uint64_t v17 = [v12 identifier];
          +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:v17 result:v14];
        }

LABEL_15:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (!v9)
      {
LABEL_17:

        uint64_t v23 = [v4 copy];
        long long v3 = v26;
        plugins = v26->_plugins;
        v26->_plugins = (NSDictionary *)v23;

        return v3;
      }
    }
  }
  return v3;
}

+ (void)_processHistoricalDataRequestsForPluginIdentifier:(id)a3 result:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SGDSpotlightCommander sharedInstance];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v15 = v6;
  uint64_t v8 = [v6 historicalDataRequests];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        uint64_t v14 = sgLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v5;
          __int16 v22 = 2112;
          uint64_t v23 = v13;
          _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "Plugin %@ requesting historical data: %@", buf, 0x16u);
        }

        [v7 requestReimportForHistoricalDataRequest:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SGDPluginManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_6400 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_6400, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_6401;
  return v2;
}

void __34__SGDPluginManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_6401;
  sharedInstance__pasExprOnceResult_6401 = v1;
}

- (id)pluginIdentifiers
{
  return [(NSDictionary *)self->_plugins allKeys];
}

- (void)setPlugins:(id)a3
{
}

@end