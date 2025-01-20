@interface AMUILastSelectedPosterStore
+ (id)new;
- (AMUILastSelectedPosterStore)init;
- (AMUILastSelectedPosterStore)initWithAmbientDefaults:(id)a3;
- (id)lastSelectedConfigurationUUIDForChargerIdentifier:(id)a3 providerBundleIdentifier:(id)a4;
- (unint64_t)_currentChargerIds;
- (unint64_t)_maximumChargerIds;
- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 block:(id)a4;
- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 onlyIfPresent:(BOOL)a4 block:(id)a5;
- (void)_synchronize;
- (void)setLastSelectedConfigurationUUID:(id)a3 forChargerIdentifier:(id)a4 providerBundleIdentifier:(id)a5;
@end

@implementation AMUILastSelectedPosterStore

- (AMUILastSelectedPosterStore)initWithAmbientDefaults:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMUILastSelectedPosterStore;
  v6 = [(AMUILastSelectedPosterStore *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientDefaults, a3);
    v8 = [(AMAmbientDefaults *)v7->_ambientDefaults lastSelectedConfigurations];
    v9 = v8;
    if (!v8) {
      v8 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v10 = [v8 mutableCopy];
    cachedLastSelectedConfigurations = v7->_cachedLastSelectedConfigurations;
    v7->_cachedLastSelectedConfigurations = (NSMutableDictionary *)v10;

    v12 = [MEMORY[0x263F29C50] serial];
    v13 = [v12 serviceClass:17];
    uint64_t v14 = BSDispatchQueueCreate();
    persistenceQueue = v7->_persistenceQueue;
    v7->_persistenceQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (AMUILastSelectedPosterStore)init
{
  v4 = [NSString stringWithFormat:@"-init not implemented"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"AMUILastSelectedPosterStore.m";
    __int16 v17 = 1024;
    int v18 = 46;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_247837000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (AMUILastSelectedPosterStore *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  v4 = [NSString stringWithFormat:@"+new not implemented"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"AMUILastSelectedPosterStore.m";
    __int16 v17 = 1024;
    int v18 = 51;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_247837000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)lastSelectedConfigurationUUIDForChargerIdentifier:(id)a3 providerBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__0;
  int v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__AMUILastSelectedPosterStore_lastSelectedConfigurationUUIDForChargerIdentifier_providerBundleIdentifier___block_invoke;
  v11[3] = &unk_265224E08;
  __int16 v13 = &v14;
  id v8 = v7;
  id v12 = v8;
  [(AMUILastSelectedPosterStore *)self _performWithSelectedConfigurationsForChargerIdentifier:v6 onlyIfPresent:1 block:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __106__AMUILastSelectedPosterStore_lastSelectedConfigurationUUIDForChargerIdentifier_providerBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastSelectedConfigurationUUIDForProviderBundleIdentifier:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x270F9A758](v3, v5);
}

- (void)setLastSelectedConfigurationUUID:(id)a3 forChargerIdentifier:(id)a4 providerBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__AMUILastSelectedPosterStore_setLastSelectedConfigurationUUID_forChargerIdentifier_providerBundleIdentifier___block_invoke;
  v12[3] = &unk_265224E30;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AMUILastSelectedPosterStore *)self _performWithSelectedConfigurationsForChargerIdentifier:a4 block:v12];
}

uint64_t __110__AMUILastSelectedPosterStore_setLastSelectedConfigurationUUID_forChargerIdentifier_providerBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLastSelectedConfigurationUUID:*(void *)(a1 + 32) forProviderBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 block:(id)a4
{
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(id)a3 onlyIfPresent:(BOOL)a4 block:(id)a5
{
  *(void *)((char *)&v37[1] + 4) = *MEMORY[0x263EF8340];
  id v26 = a3;
  v27 = (void (**)(id, AMUISelectedConfigurations *))a5;
  uint64_t v8 = [(NSMutableDictionary *)self->_cachedLastSelectedConfigurations objectForKeyedSubscript:v26];
  BOOL v9 = v8 == 0;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = (void *)MEMORY[0x263EFFA78];
  }
  id v11 = [[AMUISelectedConfigurations alloc] initWithDictionaryRepresentation:v10];
  if (!v11)
  {
    id v12 = objc_alloc_init(AMUISelectedConfigurations);
LABEL_8:
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  id v12 = v11;
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  id v13 = v12;
  v27[2](v27, v12);
  v25 = v13;
  id v14 = [(AMUISelectedConfigurations *)v13 dictionaryRepresentation];
  [(NSMutableDictionary *)self->_cachedLastSelectedConfigurations setObject:v14 forKeyedSubscript:v26];

  if ((unint64_t)[(NSMutableDictionary *)self->_cachedLastSelectedConfigurations count] >= 0x33)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    do
    {
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__0;
      v34[4] = __Block_byref_object_dispose__0;
      id v35 = 0;
      uint64_t v31 = 0;
      v32[0] = &v31;
      v32[1] = 0x3032000000;
      v32[2] = __Block_byref_object_copy__0;
      v32[3] = __Block_byref_object_dispose__0;
      id v33 = 0;
      cachedLastSelectedConfigurations = self->_cachedLastSelectedConfigurations;
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke;
      v30[3] = &unk_265224E58;
      v30[4] = v34;
      v30[5] = &v31;
      [(NSMutableDictionary *)cachedLastSelectedConfigurations enumerateKeysAndObjectsUsingBlock:v30];
      uint64_t v17 = *(void *)(v32[0] + 40);
      if (!v17)
      {
        int v18 = [(NSMutableDictionary *)self->_cachedLastSelectedConfigurations allKeys];
        uint64_t v19 = [v18 lastObject];
        v20 = *(void **)(v32[0] + 40);
        *(void *)(v32[0] + 40) = v19;

        v21 = AMUILogSwitcher();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[AMUILastSelectedPosterStore _performWithSelectedConfigurationsForChargerIdentifier:onlyIfPresent:block:](buf, (uint64_t)v32, v37, v21);
        }

        uint64_t v17 = *(void *)(v32[0] + 40);
      }
      [(NSMutableDictionary *)self->_cachedLastSelectedConfigurations removeObjectForKey:v17];
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(v34, 8);
    }
    while ((unint64_t)[(NSMutableDictionary *)self->_cachedLastSelectedConfigurations count] > 0x32);
  }
  v22 = (void *)[(NSMutableDictionary *)self->_cachedLastSelectedConfigurations copy];
  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke_15;
  block[3] = &unk_265224858;
  block[4] = self;
  id v29 = v22;
  id v24 = v22;
  dispatch_async(persistenceQueue, block);

  id v12 = v25;
LABEL_17:
}

void __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_class();
  id v15 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v15;
    }
    else {
      id v7 = 0;
    }
  }
  id v8 = v7;

  uint64_t v9 = objc_opt_class();
  id v10 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  id v13 = +[AMUISelectedConfigurations lastUsedDateFromDictionaryRepresentation:v12];

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v14 + 40))
  {
    if (objc_msgSend(v13, "compare:") != -1) {
      goto LABEL_14;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v14 + 40), v13);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
LABEL_14:
}

uint64_t __106__AMUILastSelectedPosterStore__performWithSelectedConfigurationsForChargerIdentifier_onlyIfPresent_block___block_invoke_15(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setLastSelectedConfigurations:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_cachedLastSelectedConfigurations, 0);

  objc_storeStrong((id *)&self->_ambientDefaults, 0);
}

- (void)_synchronize
{
  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AMUILastSelectedPosterStore_Testing___synchronize__block_invoke;
  block[3] = &unk_2652247E0;
  block[4] = self;
  dispatch_sync(persistenceQueue, block);
}

void __52__AMUILastSelectedPosterStore_Testing___synchronize__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) lastSelectedConfigurations];
  id v6 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  uint64_t v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;
}

- (unint64_t)_maximumChargerIds
{
  return 50;
}

- (unint64_t)_currentChargerIds
{
  return [(NSMutableDictionary *)self->_cachedLastSelectedConfigurations count];
}

- (void)_performWithSelectedConfigurationsForChargerIdentifier:(void *)a3 onlyIfPresent:(os_log_t)log block:.cold.1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Error pruning selected representations by charger ID - no oldest entry found, evicting %@ at semi-random", buf, 0xCu);
}

@end