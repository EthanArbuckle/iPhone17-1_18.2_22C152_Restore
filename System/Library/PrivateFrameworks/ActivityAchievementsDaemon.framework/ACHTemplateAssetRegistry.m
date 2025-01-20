@interface ACHTemplateAssetRegistry
- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider;
- (ACHTemplateAssetRegistry)initWithRemoteTemplateAvailabilityKeyProvider:(id)a3;
- (ACHTemplateAssetRegistryDelegate)delegate;
- (NSMutableDictionary)templateAssetSourcesByIdentifier;
- (NSMutableDictionary)templateSourcesByIdentifier;
- (OS_dispatch_queue)serialQueue;
- (void)_setBundleURLsForAchievement:(id)a3;
- (void)deregisterTemplateAssetSource:(id)a3;
- (void)deregisterTemplateSource:(id)a3;
- (void)populateResourcePropertiesForAchievement:(id)a3;
- (void)registerTemplateAssetSource:(id)a3;
- (void)registerTemplateSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTemplateAssetSourcesByIdentifier:(id)a3;
- (void)setTemplateSourcesByIdentifier:(id)a3;
- (void)templateAssetSourceDidUpdateAssets:(id)a3;
- (void)templateSourceDidUpdateAssets:(id)a3;
@end

@implementation ACHTemplateAssetRegistry

- (ACHTemplateAssetRegistry)initWithRemoteTemplateAvailabilityKeyProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACHTemplateAssetRegistry;
  v6 = [(ACHTemplateAssetRegistry *)&v14 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templateSourcesByIdentifier = v6->_templateSourcesByIdentifier;
    v6->_templateSourcesByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templateAssetSourcesByIdentifier = v6->_templateAssetSourcesByIdentifier;
    v6->_templateAssetSourcesByIdentifier = v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_remoteTemplateAvailabilityKeyProvider, a3);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateAssetRegistry *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ACHTemplateAssetRegistry_setDelegate___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __40__ACHTemplateAssetRegistry_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)registerTemplateSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateAssetRegistry *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D121F18];
  id v4 = ACHLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*v2 identifier];
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Asset Registry added source with identifier %{public}@", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) templateSourcesByIdentifier];
    v9 = [*(id *)(a1 + 32) identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_357;
    block[3] = &unk_264515DE0;
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_cold_1();
    }
  }
}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_357(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) identifier];
  [v4 templateAssetRegistry:v2 didUpdateResourcesForTemplatesWithSourceName:v3];
}

- (void)deregisterTemplateSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateAssetRegistry *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D121F18];
  id v4 = [v2[1] templateSourcesByIdentifier];
  id v5 = [*v2 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v3) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v3)
    {
      if (v6) {
        return;
      }
      id v8 = ACHLogAssets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_1();
      }
    }
    else
    {
      id v8 = ACHLogAssets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_2();
      }
    }
  }
  else
  {
    v9 = ACHLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int8x16_t v11 = [*v2 identifier];
      int v13 = 138543362;
      objc_super v14 = v11;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Template Asset Registry removed source with identifier %{public}@", (uint8_t *)&v13, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [*v2 setDelegate:0];
    }
    id v8 = [*(id *)(a1 + 40) templateSourcesByIdentifier];
    v12 = [*(id *)(a1 + 32) identifier];
    [v8 removeObjectForKey:v12];
  }
}

- (void)registerTemplateAssetSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateAssetRegistry *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D122188];
  id v4 = ACHLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*v2 identifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v6;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Template Asset Registry added asset source with identifier %{public}@", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) setAssetSourceDelegate:*(void *)(a1 + 40)];
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) templateAssetSourcesByIdentifier];
    v9 = [*(id *)(a1 + 32) identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_366;
    block[3] = &unk_264515DE0;
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_cold_1();
    }
  }
}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_366(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) identifier];
  [v4 templateAssetRegistry:v2 didUpdateResourcesForTemplatesWithSourceName:v3];
}

- (void)deregisterTemplateAssetSource:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHTemplateAssetRegistry *)self serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke;
  v7[3] = &unk_264515DE0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) conformsToProtocol:&unk_26D122188];
  id v4 = [v2[1] templateAssetSourcesByIdentifier];
  id v5 = [*v2 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v3) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v3)
    {
      if (v6) {
        return;
      }
      id v8 = ACHLogAssets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_1();
      }
    }
    else
    {
      id v8 = ACHLogAssets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_2();
      }
    }
  }
  else
  {
    v9 = ACHLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int8x16_t v11 = [*v2 identifier];
      int v13 = 138543362;
      objc_super v14 = v11;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Template Asset Registry removed asset source with identifier %{public}@", (uint8_t *)&v13, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [*v2 setAssetSourceDelegate:0];
    }
    id v8 = [*(id *)(a1 + 40) templateAssetSourcesByIdentifier];
    v12 = [*(id *)(a1 + 32) identifier];
    [v8 removeObjectForKey:v12];
  }
}

- (void)populateResourcePropertiesForAchievement:(id)a3
{
  id v4 = a3;
  id v5 = ACHLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACHTemplateAssetRegistry populateResourcePropertiesForAchievement:](v4, v5);
  }

  [(ACHTemplateAssetRegistry *)self _setBundleURLsForAchievement:v4];
  id v6 = ACHLogAssets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACHTemplateAssetRegistry populateResourcePropertiesForAchievement:](v4, v6);
  }

  ACHApplyBadgePropertiesToAchievement();
}

- (void)_setBundleURLsForAchievement:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 template];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__6;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__6;
  v44 = __Block_byref_object_dispose__6;
  id v45 = 0;
  id v6 = [(ACHTemplateAssetRegistry *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ACHTemplateAssetRegistry__setBundleURLsForAchievement___block_invoke;
  block[3] = &unk_264516A38;
  v38 = &v46;
  void block[4] = self;
  id v7 = v5;
  id v37 = v7;
  v39 = &v40;
  dispatch_sync(v6, block);

  id v8 = (void *)v41[5];
  if (v8) {
    [v8 localizationBundleURLForTemplate:v7];
  }
  else {
  v9 = [(id)v47[5] localizationBundleURLForTemplate:v7];
  }
  id v10 = (void *)v41[5];
  if (v10) {
    [v10 resourceBundleURLForTemplate:v7];
  }
  else {
  int8x16_t v11 = [(id)v47[5] resourceBundleURLForTemplate:v7];
  }
  v12 = (void *)v41[5];
  if (v12) {
    [v12 propertyListBundleURLForTemplate:v7];
  }
  else {
  int v13 = [(id)v47[5] propertyListBundleURLForTemplate:v7];
  }
  objc_super v14 = (void *)v41[5];
  if (v14) {
    [v14 stickerBundleURLForTemplate:v7];
  }
  else {
  uint64_t v15 = [(id)v47[5] stickerBundleURLForTemplate:v7];
  }
  [v4 setLocalizationBundleURL:v9];
  [v4 setResourceBundleURL:v11];
  [v4 setPropertyListBundleURL:v13];
  [v4 setStickerBundleURL:v15];
  if (ACHTemplateIsRemote())
  {
    uint64_t v16 = [(ACHTemplateAssetRegistry *)self remoteTemplateAvailabilityKeyProvider];
    id v35 = 0;
    uint64_t v17 = [v16 templateAvailableOnPairedDevice:v7 error:&v35];
    id v18 = v35;

    if (v18)
    {
      v19 = ACHLogAssets();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ACHTemplateAssetRegistry _setBundleURLsForAchievement:]((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      [v7 setAvailableOnPairedDevice:v17];
    }
    if (objc_opt_respondsToSelector())
    {
      v26 = v41;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v26 = v47;
    }
    objc_msgSend(v7, "setMobileAssetVersion:", objc_msgSend((id)v26[5], "mobileAssetVersionForTemplate:", v7));
    goto LABEL_24;
  }
LABEL_25:
  if (objc_opt_respondsToSelector())
  {
    v27 = (void *)v41[5];
    id v34 = 0;
    v28 = [v27 customPlaceholderValuesForTemplate:v7 error:&v34];
    id v29 = v34;
    [v4 setCustomPlaceholderValues:v28];

    if (v29)
    {
      v30 = ACHLogAssets();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  if (objc_opt_respondsToSelector())
  {
    v31 = (void *)v47[5];
    id v33 = 0;
    v32 = [v31 customPlaceholderValuesForTemplate:v7 error:&v33];
    id v29 = v33;
    [v4 setCustomPlaceholderValues:v32];

    if (v29)
    {
      v30 = ACHLogAssets();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        *(_DWORD *)buf = 138412546;
        id v53 = v7;
        __int16 v54 = 2112;
        id v55 = v29;
        _os_log_impl(&dword_21F5DA000, v30, OS_LOG_TYPE_DEFAULT, "Error getting custom placeholder for template %@: %@", buf, 0x16u);
      }
LABEL_33:
    }
LABEL_34:
  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __57__ACHTemplateAssetRegistry__setBundleURLsForAchievement___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) templateSourcesByIdentifier];
  int v3 = [*(id *)(a1 + 40) sourceName];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v11 = [*(id *)(a1 + 32) templateAssetSourcesByIdentifier];
  id v7 = [*(id *)(a1 + 40) sourceName];
  uint64_t v8 = [v11 objectForKeyedSubscript:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)templateSourceDidUpdateAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ACHTemplateAssetRegistry_templateSourceDidUpdateAssets___block_invoke;
  v6[3] = &unk_264515DE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__ACHTemplateAssetRegistry_templateSourceDidUpdateAssets___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) identifier];
  [v4 templateAssetRegistry:v2 didUpdateResourcesForTemplatesWithSourceName:v3];
}

- (void)templateAssetSourceDidUpdateAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__ACHTemplateAssetRegistry_templateAssetSourceDidUpdateAssets___block_invoke;
  v6[3] = &unk_264515DE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __63__ACHTemplateAssetRegistry_templateAssetSourceDidUpdateAssets___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) identifier];
  [v4 templateAssetRegistry:v2 didUpdateResourcesForTemplatesWithSourceName:v3];
}

- (ACHTemplateAssetRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACHTemplateAssetRegistryDelegate *)WeakRetained;
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
}

- (NSMutableDictionary)templateSourcesByIdentifier
{
  return self->_templateSourcesByIdentifier;
}

- (void)setTemplateSourcesByIdentifier:(id)a3
{
}

- (NSMutableDictionary)templateAssetSourcesByIdentifier
{
  return self->_templateAssetSourcesByIdentifier;
}

- (void)setTemplateAssetSourcesByIdentifier:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_templateAssetSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_templateSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not add source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not remove template source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not remove template source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not add asset source %{public}@ because it does not conform to asset source protocol", v2, v3, v4, v5, v6);
}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not remove template asset source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Template Asset Registry did not remove template asset source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
}

- (void)populateResourcePropertiesForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 template];
  uint64_t v5 = [v4 uniqueName];
  uint8_t v6 = [a1 localizationBundleURL];
  id v7 = [a1 resourceBundleURL];
  uint64_t v8 = [a1 propertyListBundleURL];
  int v9 = 138544130;
  id v10 = v5;
  __int16 v11 = 2114;
  v12 = v6;
  __int16 v13 = 2114;
  objc_super v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v8;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "URLs for template %{public}@ are now %{public}@, %{public}@, %{public}@", (uint8_t *)&v9, 0x2Au);
}

- (void)populateResourcePropertiesForAchievement:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 template];
  uint64_t v4 = [v3 uniqueName];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Template Asset Registry populating asset URLs for template %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_setBundleURLsForAchievement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end