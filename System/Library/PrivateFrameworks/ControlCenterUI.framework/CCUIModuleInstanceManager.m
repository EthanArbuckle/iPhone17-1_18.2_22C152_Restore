@interface CCUIModuleInstanceManager
- (CCUIContentModuleContextDelegate)contextDelegate;
- (CCUIModuleInstanceManager)initWithSystemAgent:(id)a3;
- (NSArray)alertModuleInstances;
- (NSArray)moduleInstances;
- (NSSet)enabledModuleIdentifiersFromSettingsApp;
- (NSSet)loadableModuleIdentifiers;
- (id)_instantiateModuleWithMetadata:(id)a3 uniqueIdentifier:(id)a4;
- (id)_loadBundlesForModuleMetadata:(id)a3;
- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4;
- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3;
- (id)loadAlertModuleWithBundleIdentifier:(id)a3;
- (id)obtainModuleWithBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (void)_runBlockOnObservers:(id)a3;
- (void)_updateModuleInstances;
- (void)addObserver:(id)a3;
- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4;
- (void)dismissControlCenterForContentModuleContext:(id)a3;
- (void)dismissExpandedViewForContentModuleContext:(id)a3;
- (void)loadableModulesChangedForModuleRepository:(id)a3;
- (void)removeModuleWithUniqueIdentifier:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestExpandModuleForContentModuleContext:(id)a3;
- (void)setContextDelegate:(id)a3;
- (void)setEnabledModuleIdentifiersFromSettingsApp:(id)a3;
@end

@implementation CCUIModuleInstanceManager

uint64_t __51__CCUIModuleInstanceManager__updateModuleInstances__block_invoke(uint64_t a1, void *a2)
{
  return [a2 moduleInstancesChangedForModuleInstanceManager:*(void *)(a1 + 32)];
}

uint64_t __71__CCUIModuleInstanceManager_loadableModulesChangedForModuleRepository___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateModuleInstances];
}

- (void)_updateModuleInstances
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__CCUIModuleInstanceManager__updateModuleInstances__block_invoke;
  v2[3] = &unk_1E6A89BD8;
  v2[4] = self;
  [(CCUIModuleInstanceManager *)self _runBlockOnObservers:v2];
}

- (void)_runBlockOnObservers:(id)a3
{
  observers = self->_observers;
  id v4 = a3;
  id v5 = [(NSHashTable *)observers allObjects];
  objc_msgSend(v5, "bs_each:", v4);
}

- (void)loadableModulesChangedForModuleRepository:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CCUIModuleInstanceManager_loadableModulesChangedForModuleRepository___block_invoke;
  block[3] = &unk_1E6A898F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (CCUIModuleInstanceManager)initWithSystemAgent:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CCUIModuleInstanceManager;
  v6 = [(CCUIModuleInstanceManager *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    uint64_t v8 = [MEMORY[0x1E4F5ACF8] repositoryWithDefaults];
    repository = v7->_repository;
    v7->_repository = (CCSModuleRepository *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    alertModuleInstanceByModuleIdentifier = v7->_alertModuleInstanceByModuleIdentifier;
    v7->_alertModuleInstanceByModuleIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enabledModuleInstanceByUniqueIdentifer = v7->_enabledModuleInstanceByUniqueIdentifer;
    v7->_enabledModuleInstanceByUniqueIdentifer = v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.ControlCenter.ModuleInstanceManager", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    CCUIRegisterControlCenterLogging();
    [(CCUIModuleInstanceManager *)v7 _updateModuleInstances];
    [(CCSModuleRepository *)v7->_repository addObserver:v7];
  }

  return v7;
}

- (void)setEnabledModuleIdentifiersFromSettingsApp:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSSet *)[v6 copy];
    enabledModuleIdentifiersFromSettingsApp = self->_enabledModuleIdentifiersFromSettingsApp;
    self->_enabledModuleIdentifiersFromSettingsApp = v4;

    [(CCUIModuleInstanceManager *)self _updateModuleInstances];
  }
}

- (NSSet)loadableModuleIdentifiers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(CCSModuleRepository *)self->_repository loadableModuleIdentifiers];
  v3 = (void *)[v2 mutableCopy];

  id v4 = *MEMORY[0x1E4F5AD90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = @"com.apple.control-center.SatelliteModule";
    _os_log_impl(&dword_1D7B17000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forcefully removing any existing Satellite modules.", (uint8_t *)&v6, 0xCu);
  }
  [v3 removeObject:@"com.apple.control-center.SatelliteModule"];

  return (NSSet *)v3;
}

- (id)loadAlertModuleWithBundleIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    dispatch_queue_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CCUIModuleInstanceManager.m", 84, @"Invalid parameter not satisfying: %@", @"moduleIdentifier != nil" object file lineNumber description];
  }
  int v6 = [(NSMutableDictionary *)self->_alertModuleInstanceByModuleIdentifier objectForKey:v5];
  if (!v6)
  {
    v7 = [(CCSModuleRepository *)self->_repository moduleMetadataForModuleIdentifier:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E4F28B50];
      v10 = [v7 moduleBundleURL];
      v11 = [v9 bundleWithURL:v10];

      if (([v11 isLoaded] & 1) == 0)
      {
        v18[0] = v8;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        id v13 = [(CCUIModuleInstanceManager *)self _loadBundlesForModuleMetadata:v12];
      }
      uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
      v15 = [v14 UUIDString];
      int v6 = [(CCUIModuleInstanceManager *)self _instantiateModuleWithMetadata:v8 uniqueIdentifier:v15];

      [(NSMutableDictionary *)self->_alertModuleInstanceByModuleIdentifier bs_setSafeObject:v6 forKey:v5];
    }
    else
    {
      int v6 = 0;
    }
  }

  return v6;
}

- (id)obtainModuleWithBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CCUIModuleInstanceManager.m", 102, @"Invalid parameter not satisfying: %@", @"moduleIdentifier != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CCUIModuleInstanceManager.m", 103, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier != nil" object file lineNumber description];

LABEL_3:
  v10 = [(NSMutableDictionary *)self->_enabledModuleInstanceByUniqueIdentifer objectForKey:v9];
  if (!v10)
  {
    v11 = [(CCSModuleRepository *)self->_repository moduleMetadataForModuleIdentifier:v7];
    v12 = v11;
    if (v11)
    {
      id v13 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v14 = [v11 moduleBundleURL];
      v15 = [v13 bundleWithURL:v14];

      if (([v15 isLoaded] & 1) == 0)
      {
        v21[0] = v12;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        id v17 = [(CCUIModuleInstanceManager *)self _loadBundlesForModuleMetadata:v16];
      }
      v10 = [(CCUIModuleInstanceManager *)self _instantiateModuleWithMetadata:v12 uniqueIdentifier:v9];
      [(NSMutableDictionary *)self->_enabledModuleInstanceByUniqueIdentifer bs_setSafeObject:v10 forKey:v9];
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)removeModuleWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"CCUIModuleInstanceManager.m", 121, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableDictionary *)self->_enabledModuleInstanceByUniqueIdentifer removeObjectForKey:v5];
}

- (NSArray)moduleInstances
{
  return (NSArray *)[(NSMutableDictionary *)self->_enabledModuleInstanceByUniqueIdentifer allValues];
}

- (NSArray)alertModuleInstances
{
  return (NSArray *)[(NSMutableDictionary *)self->_alertModuleInstanceByModuleIdentifier allValues];
}

- (id)_loadBundlesForModuleMetadata:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138543362;
    long long v26 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E4F28B50];
        v12 = objc_msgSend(v10, "moduleBundleURL", v26);
        id v13 = [v11 bundleWithURL:v12];

        if (([v13 isLoaded] & 1) == 0)
        {
          uint64_t v14 = (void *)*MEMORY[0x1E4F5AD90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = [v10 moduleIdentifier];
            *(_DWORD *)buf = 138543618;
            v34 = v16;
            __int16 v35 = 2114;
            id v36 = v13;
            _os_log_impl(&dword_1D7B17000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading bundle %{public}@ for module", buf, 0x16u);
          }
          id v28 = 0;
          int v17 = [v13 loadAndReturnError:&v28];
          id v18 = v28;
          v19 = (void *)*MEMORY[0x1E4F5AD90];
          objc_super v20 = *MEMORY[0x1E4F5AD90];
          if (v17)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = v19;
              v22 = [v10 moduleIdentifier];
              *(_DWORD *)buf = v26;
              v34 = v22;
              _os_log_impl(&dword_1D7B17000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bundle was loaded successfully", buf, 0xCu);
            }
            [v27 addObject:v13];
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            v23 = v19;
            v24 = [v10 moduleIdentifier];
            *(_DWORD *)buf = 138543618;
            v34 = v24;
            __int16 v35 = 2114;
            id v36 = v18;
            _os_log_fault_impl(&dword_1D7B17000, v23, OS_LOG_TYPE_FAULT, "[%{public}@] Bundle was not loaded, error=%{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v7);
  }

  return v27;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CCUIModuleInstanceManager *)self contextDelegate];
  [v8 contentModuleContext:v7 enqueueStatusUpdate:v6];
}

- (void)requestExpandModuleForContentModuleContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIModuleInstanceManager *)self contextDelegate];
  [v5 requestExpandModuleForContentModuleContext:v4];
}

- (void)dismissExpandedViewForContentModuleContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIModuleInstanceManager *)self contextDelegate];
  [v5 dismissExpandedViewForContentModuleContext:v4];
}

- (void)dismissControlCenterForContentModuleContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIModuleInstanceManager *)self contextDelegate];
  [v5 dismissControlCenterForContentModuleContext:v4];
}

- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CCUIModuleInstanceManager *)self contextDelegate];
  id v8 = [v7 contentModuleContext:v6 requestsSensorActivityDataForActiveSensorType:a4];

  return v8;
}

- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIModuleInstanceManager *)self contextDelegate];
  id v6 = [v5 contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:v4];

  return v6;
}

- (id)_instantiateModuleWithMetadata:(id)a3 uniqueIdentifier:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F28B50];
  v9 = [v6 moduleBundleURL];
  v10 = [v8 bundleWithURL:v9];

  v11 = [v6 moduleIdentifier];
  if ([v10 isLoaded])
  {
    v12 = (void *)[v10 principalClass];
    if ([v12 conformsToProtocol:&unk_1F2F8DA38]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__0;
    v59 = __Block_byref_object_dispose__0;
    id v60 = (id)[v14 alloc];
    if (v56[5])
    {
      objc_msgSend(v10, "ccui_associateWithModuleInstance:");
      if ([(id)v56[5] conformsToProtocol:&unk_1F2FB3F28]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke;
        v53[3] = &unk_1E6A89C00;
        v15 = (id *)v54;
        id v16 = v11;
        v54[1] = self;
        v54[2] = &v55;
        v54[0] = v16;
        int v17 = "instantiate internal module";
        id v18 = v53;
      }
      else
      {
        activity_block[0] = MEMORY[0x1E4F143A8];
        activity_block[1] = 3221225472;
        activity_block[2] = __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke_93;
        activity_block[3] = &unk_1E6A89C28;
        v15 = (id *)v52;
        v52[0] = v11;
        v52[1] = &v55;
        int v17 = "instantiate module";
        id v18 = activity_block;
      }
      _os_activity_initiate(&dword_1D7B17000, v17, OS_ACTIVITY_FLAG_DEFAULT, v18);

      if (v56[5])
      {
        if (objc_opt_respondsToSelector())
        {
          id v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
          id v28 = (void *)[objc_alloc(MEMORY[0x1E4F5ADE8]) initWithModuleIdentifier:v11 uniqueIdentifier:v27];
          [v28 setDelegate:self];
          [(id)v56[5] setContentModuleContext:v28];
        }
        long long v29 = [CCUIModuleInstance alloc];
        uint64_t v30 = v56[5];
        uint64_t v31 = objc_msgSend(v10, "ccui_prototypeModuleSize");
        uint64_t v33 = v32;
        v34 = objc_msgSend(v10, "ccui_displayName");
        long long v26 = -[CCUIModuleInstance initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:](v29, "initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:", v6, v30, v31, v33, v7, v34);
      }
      else
      {
        v42 = *MEMORY[0x1E4F5AD90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_ERROR)) {
          -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:]((uint64_t)v11, v42, v43, v44, v45, v46, v47, v48);
        }
        [v10 unload];
        long long v26 = 0;
      }
      if (![v11 isEqualToString:@"com.apple.control-center.SatelliteModule"]) {
        goto LABEL_28;
      }
      v49 = *MEMORY[0x1E4F5AD90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v11;
        _os_log_impl(&dword_1D7B17000, v49, OS_LOG_TYPE_DEFAULT, "[Satellite Module] [%{public}@] is not supported. Setting module instance to nil.", buf, 0xCu);
      }
    }
    else
    {
      __int16 v35 = *MEMORY[0x1E4F5AD90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_ERROR)) {
        -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:]((uint64_t)v11, v35, v36, v37, v38, v39, v40, v41);
      }
      [v10 unload];
    }
    long long v26 = 0;
LABEL_28:
    _Block_object_dispose(&v55, 8);

    goto LABEL_29;
  }
  v19 = *MEMORY[0x1E4F5AD90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_ERROR)) {
    -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:]((uint64_t)v11, v19, v20, v21, v22, v23, v24, v25);
  }
  long long v26 = 0;
LABEL_29:

  return v26;
}

void __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5AD90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D7B17000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will instantiate internal module", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) initWithSystemAgent:*(void *)(a1[5] + 16)];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke_93(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5AD90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD90], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D7B17000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will instantiate module", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) init];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (CCUIContentModuleContextDelegate)contextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextDelegate);

  return (CCUIContentModuleContextDelegate *)WeakRetained;
}

- (void)setContextDelegate:(id)a3
{
}

- (NSSet)enabledModuleIdentifiersFromSettingsApp
{
  return self->_enabledModuleIdentifiersFromSettingsApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledModuleIdentifiersFromSettingsApp, 0);
  objc_destroyWeak((id *)&self->_contextDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_enabledModuleInstanceByUniqueIdentifer, 0);
  objc_storeStrong((id *)&self->_alertModuleInstanceByModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_systemAgent, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D7B17000, a2, a3, "[%{public}@] Module's init method returned nil, will unload bundle", a5, a6, a7, a8, 2u);
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end