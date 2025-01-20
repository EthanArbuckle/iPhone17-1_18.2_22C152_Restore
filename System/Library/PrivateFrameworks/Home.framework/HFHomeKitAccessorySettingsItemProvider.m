@interface HFHomeKitAccessorySettingsItemProvider
- (BOOL)settingsAlreadyFetched;
- (BOOL)shouldUpdateForKeyPaths:(id)a3;
- (BOOL)updateSettings:(id)a3;
- (HFHomeKitAccessorySettingsItemProvider)initWithSettingsController:(id)a3 sourceItem:(id)a4 settingGroupKeyPath:(id)a5 moduleSettings:(id)a6 usageOptions:(id)a7;
- (HFServiceLikeItem)sourceItem;
- (HMAccessorySettingsController)settingsController;
- (HMHomeManager)homeManager;
- (NSArray)allKeyPaths;
- (NSArray)homeKitKeyPaths;
- (NSArray)moduleSettings;
- (NSDictionary)nonHomeKitSettingsDictionary;
- (NSDictionary)splitSettingsDictionary;
- (NSDictionary)usageOptions;
- (NSMutableSet)settingItems;
- (NSString)groupKeyPath;
- (NSUUID)accessoryIdentifier;
- (id)_fetchSettingsAndReloadItems;
- (id)_generateAccessorySettingItemForSettings:(id)a3 homeKitSettings:(id)a4 keyPaths:(id)a5;
- (id)_generateAccessorySettingItemForSettings:(id)a3 keyPaths:(id)a4;
- (id)_reloadItemsFromSettings:(id)a3 performInitialUpdateOnItems:(BOOL)a4;
- (id)items;
- (id)reloadItems;
- (id)sourceItemAccessory;
- (void)_subscribeToAccessorySettings:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAllKeyPaths:(id)a3;
- (void)setGroupKeyPath:(id)a3;
- (void)setHomeKitKeyPaths:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setModuleSettings:(id)a3;
- (void)setNonHomeKitSettingsDictionary:(id)a3;
- (void)setSettingItems:(id)a3;
- (void)setSettingsAlreadyFetched:(BOOL)a3;
- (void)setSettingsController:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setSplitSettingsDictionary:(id)a3;
- (void)setUsageOptions:(id)a3;
- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation HFHomeKitAccessorySettingsItemProvider

- (HFHomeKitAccessorySettingsItemProvider)initWithSettingsController:(id)a3 sourceItem:(id)a4 settingGroupKeyPath:(id)a5 moduleSettings:(id)a6 usageOptions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HFHomeKitAccessorySettingsItemProvider;
  v17 = [(HFItemProvider *)&v26 init];
  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    settingItems = v17->_settingItems;
    v17->_settingItems = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v17->_settingsController, a3);
    objc_storeStrong((id *)&v17->_sourceItem, a4);
    objc_storeStrong((id *)&v17->_groupKeyPath, a5);
    objc_storeStrong((id *)&v17->_moduleSettings, a6);
    objc_storeStrong((id *)&v17->_usageOptions, a7);
    v20 = [(HFServiceLikeItem *)v17->_sourceItem accessories];
    v21 = [v20 anyObject];

    uint64_t v22 = [v21 uniqueIdentifier];
    accessoryIdentifier = v17->_accessoryIdentifier;
    v17->_accessoryIdentifier = (NSUUID *)v22;
  }
  return v17;
}

- (id)items
{
  v2 = [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)reloadItems
{
  BOOL v3 = [(HFHomeKitAccessorySettingsItemProvider *)self settingsAlreadyFetched];
  v4 = HFLogForCategory(0x26uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "We have already fetched settings, so we will just reload the existing setting items to refresh the UI", v10, 2u);
    }

    v6 = [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
    v7 = [v6 allObjects];
    v8 = [(HFHomeKitAccessorySettingsItemProvider *)self _reloadItemsFromSettings:v7 performInitialUpdateOnItems:0];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Now fetching the settings", buf, 2u);
    }

    v8 = [(HFHomeKitAccessorySettingsItemProvider *)self _fetchSettingsAndReloadItems];
  }
  return v8;
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 settingKeyPath];
        if ([v14 isEqualToString:v7])
        {
        }
        else
        {
          id v15 = [v13 targetSettingKeyPath];
          int v16 = [v15 isEqualToString:v7];

          if (!v16) {
            continue;
          }
        }
        [v13 updateSettingValue:v6];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)updateSettings:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  uint64_t v25 = 0;
  objc_super v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke;
  v22[3] = &unk_26408D1C0;
  v22[4] = self;
  v24 = &v25;
  id v6 = v5;
  id v23 = v6;
  objc_msgSend(v4, "na_each:", v22);
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x263EFF980];
    v8 = [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
    uint64_t v9 = [v8 allObjects];
    uint64_t v10 = [v7 arrayWithArray:v9];

    [v10 addObjectsFromArray:v6];
    uint64_t v11 = [(HFHomeKitAccessorySettingsItemProvider *)self splitSettingsDictionary];
    v12 = [(HFHomeKitAccessorySettingsItemProvider *)self allKeyPaths];
    id v13 = [(HFHomeKitAccessorySettingsItemProvider *)self _generateAccessorySettingItemForSettings:v11 homeKitSettings:v6 keyPaths:v12];

    [v10 addObjectsFromArray:v13];
    id v14 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Creating New Settings = [%@]", buf, 0xCu);
    }

    id v15 = [(HFHomeKitAccessorySettingsItemProvider *)self _reloadItemsFromSettings:v10 performInitialUpdateOnItems:1];
  }
  int v16 = [(HFHomeKitAccessorySettingsItemProvider *)self nonHomeKitSettingsDictionary];
  BOOL v17 = [v16 count] == 0;

  if (!v17)
  {
    long long v18 = [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke_2;
    v21[3] = &unk_26408D1E8;
    v21[4] = self;
    objc_msgSend(v18, "na_each:", v21);
  }
  BOOL v19 = *((unsigned char *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return v19;
}

void __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = a1;
  id v4 = [*(id *)(a1 + 32) settingItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    char v24 = 0;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "settingKeyPath", v22);
        v12 = [v3 keyPath];
        if ([v11 isEqualToString:v12])
        {
        }
        else
        {
          id v13 = [v10 targetSettingKeyPath];
          [v3 keyPath];
          uint64_t v14 = v7;
          uint64_t v15 = v8;
          v17 = int v16 = v4;
          int v25 = [v13 isEqualToString:v17];

          id v4 = v16;
          uint64_t v8 = v15;
          uint64_t v7 = v14;

          if (!v25) {
            continue;
          }
        }
        if ([v10 updateSetting:v3])
        {
          *(unsigned char *)(*(void *)(*(void *)(v23 + 48) + 8) + 24) = 1;
          long long v18 = HFLogForCategory(0x26uLL);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            id v31 = v3;
            _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "New value has been found for [%@]", buf, 0xCu);
          }
        }
        char v24 = 1;
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (!v7)
      {

        if (v24) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  BOOL v19 = [*(id *)(v23 + 32) homeKitKeyPaths];
  long long v20 = [v3 keyPath];
  int v21 = [v19 containsObject:v20];

  if (v21)
  {
    *(unsigned char *)(*(void *)(*(void *)(v23 + 48) + 8) + 24) = 1;
    [*(id *)(v23 + 40) addObject:v3];
  }
LABEL_21:
}

void __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) nonHomeKitSettingsDictionary];
  id v4 = [v6 settingKeyPath];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    [v6 setIsControllable:1];
  }
}

- (BOOL)shouldUpdateForKeyPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFHomeKitAccessorySettingsItemProvider *)self homeKitKeyPaths];
  uint64_t v6 = [v5 count];

  uint64_t v7 = HFLogForCategory(0x26uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [(HFHomeKitAccessorySettingsItemProvider *)self homeKitKeyPaths];
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      int v16 = v9;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Deciding whether we should update [%@], current homeKitKeyPaths [%@]", buf, 0x16u);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__HFHomeKitAccessorySettingsItemProvider_shouldUpdateForKeyPaths___block_invoke;
    v12[3] = &unk_26408D210;
    v12[4] = self;
    char v10 = objc_msgSend(v4, "na_any:", v12);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Should always update for the first callback for [%@]", buf, 0xCu);
    }

    char v10 = 1;
  }

  return v10;
}

uint64_t __66__HFHomeKitAccessorySettingsItemProvider_shouldUpdateForKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 homeKitKeyPaths];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)sourceItemAccessory
{
  v2 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItem];
  id v3 = [v2 accessories];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)_fetchSettingsAndReloadItems
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v41 = objc_alloc_init(MEMORY[0x263F58190]);
  id v3 = [(HFHomeKitAccessorySettingsItemProvider *)self moduleSettings];
  id v4 = objc_opt_new();
  uint64_t v5 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItemAccessory];
  v43 = [v5 home];

  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  BOOL v8 = objc_opt_new();
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke;
  v47[3] = &unk_26408D238;
  id v48 = v4;
  id v9 = v6;
  id v49 = v9;
  id v10 = v7;
  id v50 = v10;
  id v11 = v8;
  id v51 = v11;
  id v12 = v4;
  v42 = v3;
  objc_msgSend(v3, "na_each:", v47);
  if ([v9 count])
  {
    id v13 = (void *)[v9 copy];
    [(HFHomeKitAccessorySettingsItemProvider *)self setSplitSettingsDictionary:v13];

    id v14 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v9;
      _os_log_debug_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEBUG, "Identified Settings that need to be split = [%@]", buf, 0xCu);
    }
  }
  __int16 v15 = v9;
  if ([v10 count])
  {
    int v16 = (void *)[v10 copy];
    [(HFHomeKitAccessorySettingsItemProvider *)self setNonHomeKitSettingsDictionary:v16];
  }
  uint64_t v17 = (void *)[v12 copy];
  [(HFHomeKitAccessorySettingsItemProvider *)self setAllKeyPaths:v17];

  long long v18 = (void *)[v11 copy];
  [(HFHomeKitAccessorySettingsItemProvider *)self setHomeKitKeyPaths:v18];

  BOOL v19 = (void *)MEMORY[0x263EFF980];
  [(HFHomeKitAccessorySettingsItemProvider *)self settingItems];
  v21 = id v20 = v12;
  [v21 allObjects];
  id v22 = v10;
  uint64_t v23 = v40 = v10;
  char v24 = [v19 arrayWithArray:v23];

  int v25 = v20;
  v39 = [(HFHomeKitAccessorySettingsItemProvider *)self _generateAccessorySettingItemForSettings:v22 keyPaths:v20];
  [v24 addObjectsFromArray:v39];
  long long v26 = +[HFHomeKitDispatcher sharedDispatcher];
  long long v27 = [v26 accessorySettingsDataSource];
  long long v28 = [v43 uniqueIdentifier];
  long long v29 = [(HFHomeKitAccessorySettingsItemProvider *)self accessoryIdentifier];
  id v30 = objc_msgSend(v27, "hf_defaultSettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:", v28, v29, v11);

  id v31 = [(HFHomeKitAccessorySettingsItemProvider *)self _generateAccessorySettingItemForSettings:v15 homeKitSettings:v30 keyPaths:v25];
  objc_msgSend(v24, "na_safeAddObjectsFromArray:", v30);
  objc_msgSend(v24, "na_safeAddObjectsFromArray:", v31);
  v32 = [(HFHomeKitAccessorySettingsItemProvider *)self _reloadItemsFromSettings:v24 performInitialUpdateOnItems:0];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke_9;
  v44[3] = &unk_26408D260;
  v44[4] = self;
  id v45 = v11;
  id v33 = v41;
  id v46 = v33;
  id v34 = v11;
  id v35 = (id)[v32 addCompletionBlock:v44];
  v36 = v46;
  id v37 = v33;

  return v37;
}

void __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 allKeys];
  id v11 = [v4 objectAtIndexedSubscript:0];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 allKeys];
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v6);

  uint64_t v7 = [v3 objectForKeyedSubscript:v11];

  BOOL v8 = [v7 objectForKeyedSubscript:HFHomeKitSettingTargetKeyPathKey];
  id v9 = [v7 objectForKeyedSubscript:HFNonHomeKitSettingKey];
  if (v8 && ([v8 isEqualToString:v11] & 1) == 0)
  {
    id v10 = *(void **)(a1 + 40);
  }
  else
  {
    if (!v9 || ![v9 BOOLValue])
    {
      [*(id *)(a1 + 56) addObject:v11];
      goto LABEL_9;
    }
    id v10 = *(void **)(a1 + 48);
  }
  [v10 setObject:v7 forKey:v11];
LABEL_9:
}

void __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setSettingsAlreadyFetched:1];
  [*(id *)(a1 + 32) _subscribeToAccessorySettings:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) finishWithResult:v7 error:v6];
}

- (id)_reloadItemsFromSettings:(id)a3 performInitialUpdateOnItems:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_3;
  v12[3] = &unk_26408D2F0;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a4;
  id v7 = [(HFItemProvider *)self reloadItemsWithObjects:v6 keyAdaptor:&__block_literal_global_3 itemAdaptor:&__block_literal_global_16_0 filter:0 itemMap:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_19;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, &location);
  BOOL v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v5) {
    [v5 keyPath];
  }
  else {
  id v9 = [v8 settingKeyPath];
  }

  return v9;
}

uint64_t __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 settingKeyPath];
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    id v11 = [WeakRetained moduleSettings];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_4;
    v49[3] = &unk_26408D2C8;
    id v50 = v7;
    id v12 = objc_msgSend(v11, "na_filter:", v49);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v7;
    __int16 v53 = 2112;
    id v54 = v10;
    _os_log_debug_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEBUG, "HMImmutableSetting = [%@] HFHomeKitAccessorySettingItem = [%@]", buf, 0x16u);
  }

  if (v7 && [v12 count])
  {
    id v48 = WeakRetained;
    id v44 = v10;
    uint64_t v45 = a1;
    BOOL v14 = [v12 objectAtIndexedSubscript:0];
    __int16 v15 = [v7 keyPath];
    int v16 = [v14 objectForKeyedSubscript:v15];

    v42 = v16;
    uint64_t v17 = [v16 objectForKeyedSubscript:HFLocalizedSettingTitleKey];
    long long v18 = v17;
    if (v17)
    {
      uint64_t v19 = _HFLocalizedStringWithDefaultValue(v17, 0, 0);
      if (!v19)
      {
        uint64_t v19 = _HFLocalizedStringWithDefaultValue(v18, 0, 0);
      }
    }
    else
    {
      id v22 = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v23 = [v22 accessorySettingsDataSource];
      char v24 = [v7 keyPath];
      uint64_t v19 = objc_msgSend(v23, "hf_localizedTitleForKeyPath:", v24);
    }
    v40 = (void *)v19;
    id v41 = v18;
    int v25 = [v48 settingsAlreadyFetched];
    v39 = [HFHomeKitAccessorySettingItem alloc];
    v47 = [v48 sourceItem];
    id v46 = [v48 settingsController];
    long long v26 = [v48 sourceItemAccessory];
    long long v27 = [v26 home];
    long long v28 = [v27 uniqueIdentifier];
    long long v29 = [v48 accessoryIdentifier];
    v43 = v12;
    id v30 = [v12 objectAtIndexedSubscript:0];
    uint64_t v31 = [v48 usageOptions];
    v32 = (void *)v31;
    if (v25)
    {
      id v33 = v40;
      uint64_t v34 = [(HFHomeKitAccessorySettingItem *)v39 initWithSetting:v8 sourceItem:v47 localizedTitle:v40 settingsController:v46 homeIdentifier:v28 accessoryIdentifier:v29 settingDict:v30 usageOptions:v31];
    }
    else
    {
      id v33 = v40;
      uint64_t v34 = [(HFHomeKitAccessorySettingItem *)v39 initWithDefaultSetting:v8 sourceItem:v47 localizedTitle:v40 settingsController:v46 homeIdentifier:v28 accessoryIdentifier:v29 settingDict:v30 usageOptions:v31];
    }
    int v21 = (void *)v34;

    id WeakRetained = v48;
    id v35 = [v48 allKeyPaths];
    v36 = [v7 keyPath];
    objc_msgSend(v21, "setDisplayIndex:", objc_msgSend(v35, "indexOfObject:", v36));

    id v10 = v44;
    a1 = v45;
    id v12 = v43;
  }
  else if (v10)
  {
    id v20 = v10;
    int v21 = v8;
  }
  else
  {
    int v21 = 0;
  }
  if (*(unsigned char *)(a1 + 40)) {
    id v37 = (id)[v21 updateWithOptions:MEMORY[0x263EFFA78]];
  }

  return v21;
}

uint64_t __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 allKeys];
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [*(id *)(a1 + 32) keyPath];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained settingItems];
  uint64_t v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained settingItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [WeakRetained settingItems];
    int v13 = 138412546;
    BOOL v14 = v10;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Assembled settingItems = [%@], results = [%@]", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v11;
}

- (void)_subscribeToAccessorySettings:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x26uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(HFHomeKitAccessorySettingsItemProvider *)self accessoryIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Now subscribing to setting accessoryUUID [%@] - keyPaths [%@]", buf, 0x16u);
  }
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 accessorySettingsDataSource];
  id v9 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItemAccessory];
  id v10 = [v9 home];
  id v11 = [v10 uniqueIdentifier];
  id v12 = [(HFHomeKitAccessorySettingsItemProvider *)self accessoryIdentifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__HFHomeKitAccessorySettingsItemProvider__subscribeToAccessorySettings___block_invoke;
  v14[3] = &unk_26408CDF0;
  id v15 = v4;
  id v13 = v4;
  objc_msgSend(v8, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v11, v12, v13, 0, v14);
}

void __72__HFHomeKitAccessorySettingsItemProvider__subscribeToAccessorySettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory(0x26uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keypaths [%@] Error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)_generateAccessorySettingItemForSettings:(id)a3 homeKitSettings:(id)a4 keyPaths:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v7 = a4;
  id v44 = a5;
  v43 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v7;
  uint64_t v40 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v60;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v60 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v8;
        id v54 = *(void **)(*((void *)&v59 + 1) + 8 * v8);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v9 = v39;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v56;
          uint64_t v45 = *(void *)v56;
          id v46 = v9;
          do
          {
            uint64_t v13 = 0;
            uint64_t v47 = v11;
            do
            {
              if (*(void *)v56 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v55 + 1) + 8 * v13);
              id v15 = [v9 objectForKeyedSubscript:v14];
              id v16 = [v15 objectForKeyedSubscript:HFHomeKitSettingTargetKeyPathKey];
              uint64_t v17 = [v54 keyPath];
              int v18 = [v16 isEqualToString:v17];

              if (v18)
              {
                id v19 = [v15 objectForKeyedSubscript:HFLocalizedSettingTitleKey];
                uint64_t v20 = v19;
                id v52 = v16;
                __int16 v53 = v15;
                if (v19)
                {
                  id v21 = v19;
                }
                else
                {
                  id v21 = [NSString stringWithFormat:@"HFAccessorySettingsGroupTitle-%@", v14];
                }
                id v22 = v21;
                uint64_t v48 = v14;
                id v49 = v21;

                uint64_t v23 = _HFLocalizedStringWithDefaultValue(v22, 0, 0);
                id v50 = [HFHomeKitAccessorySettingItem alloc];
                char v24 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItem];
                int v25 = [(HFHomeKitAccessorySettingsItemProvider *)self settingsController];
                long long v26 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItemAccessory];
                long long v27 = [v26 home];
                long long v28 = [v27 uniqueIdentifier];
                long long v29 = [(HFHomeKitAccessorySettingsItemProvider *)self accessoryIdentifier];
                uint64_t v69 = v14;
                v70 = v53;
                id v30 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
                uint64_t v31 = [(HFHomeKitAccessorySettingsItemProvider *)self usageOptions];
                v32 = v50;
                id v51 = (void *)v23;
                id v33 = [(HFHomeKitAccessorySettingItem *)v32 initWithSetting:v54 sourceItem:v24 localizedTitle:v23 settingsController:v25 homeIdentifier:v28 accessoryIdentifier:v29 settingDict:v30 usageOptions:v31];

                uint64_t v34 = HFLogForCategory(0x26uLL);
                id v16 = v52;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  v64 = v33;
                  __int16 v65 = 2112;
                  uint64_t v66 = v48;
                  __int16 v67 = 2112;
                  v68 = v52;
                  _os_log_debug_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEBUG, "SplitSetting: Generated HFHomeKitAccessorySettingItem [%@] for unique keypath %@ having targetKeyPath %@", buf, 0x20u);
                }

                -[HFHomeKitAccessorySettingItem setDisplayIndex:](v33, "setDisplayIndex:", [v44 indexOfObject:v48]);
                [v43 addObject:v33];

                uint64_t v12 = v45;
                id v9 = v46;
                uint64_t v11 = v47;
                id v15 = v53;
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v40);
  }

  id v35 = (void *)[v43 copy];
  return v35;
}

- (id)_generateAccessorySettingItemForSettings:(id)a3 keyPaths:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  long long v29 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v31)
  {
    uint64_t v27 = *(void *)v40;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v39 + 1) + 8 * v6);
        uint64_t v8 = [obj objectForKeyedSubscript:v7];
        id v9 = [v8 objectForKeyedSubscript:HFLocalizedSettingTitleKey];
        uint64_t v10 = v9;
        uint64_t v35 = v7;
        uint64_t v33 = v6;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [NSString stringWithFormat:@"HFAccessorySettingsGroupTitle-%@", v7];
        }
        uint64_t v12 = v11;
        v36 = v11;

        uint64_t v13 = _HFLocalizedStringWithDefaultValue(v12, 0, 0);
        id v37 = [HFHomeKitAccessorySettingItem alloc];
        uint64_t v14 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItem];
        id v15 = [(HFHomeKitAccessorySettingsItemProvider *)self settingsController];
        id v16 = [(HFHomeKitAccessorySettingsItemProvider *)self sourceItemAccessory];
        uint64_t v17 = [v16 home];
        int v18 = [v17 uniqueIdentifier];
        id v19 = [(HFHomeKitAccessorySettingsItemProvider *)self accessoryIdentifier];
        uint64_t v47 = v35;
        uint64_t v48 = v8;
        [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        uint64_t v20 = v34 = v8;
        id v21 = [(HFHomeKitAccessorySettingsItemProvider *)self usageOptions];
        id v22 = v37;
        uint64_t v38 = (void *)v13;
        uint64_t v23 = [(HFHomeKitAccessorySettingItem *)v22 initWithSourceItem:v14 localizedTitle:v13 settingsController:v15 homeIdentifier:v18 accessoryIdentifier:v19 settingDict:v20 usageOptions:v21];

        char v24 = HFLogForCategory(0x26uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v23;
          __int16 v45 = 2112;
          uint64_t v46 = v35;
          _os_log_debug_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEBUG, "Non-HomeKit Setting: Generated HFHomeKitAccessorySettingItem [%@] for unique keypath %@", buf, 0x16u);
        }

        -[HFHomeKitAccessorySettingItem setDisplayIndex:](v23, "setDisplayIndex:", [v30 indexOfObject:v35]);
        [v29 addObject:v23];

        uint64_t v6 = v33 + 1;
      }
      while (v31 != v33 + 1);
      uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v31);
  }

  int v25 = (void *)[v29 copy];
  return v25;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (NSArray)moduleSettings
{
  return self->_moduleSettings;
}

- (void)setModuleSettings:(id)a3
{
}

- (NSString)groupKeyPath
{
  return self->_groupKeyPath;
}

- (void)setGroupKeyPath:(id)a3
{
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSMutableSet)settingItems
{
  return self->_settingItems;
}

- (void)setSettingItems:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (NSArray)allKeyPaths
{
  return self->_allKeyPaths;
}

- (void)setAllKeyPaths:(id)a3
{
}

- (NSArray)homeKitKeyPaths
{
  return self->_homeKitKeyPaths;
}

- (void)setHomeKitKeyPaths:(id)a3
{
}

- (NSDictionary)splitSettingsDictionary
{
  return self->_splitSettingsDictionary;
}

- (void)setSplitSettingsDictionary:(id)a3
{
}

- (NSDictionary)nonHomeKitSettingsDictionary
{
  return self->_nonHomeKitSettingsDictionary;
}

- (void)setNonHomeKitSettingsDictionary:(id)a3
{
}

- (BOOL)settingsAlreadyFetched
{
  return self->_settingsAlreadyFetched;
}

- (void)setSettingsAlreadyFetched:(BOOL)a3
{
  self->_settingsAlreadyFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonHomeKitSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_splitSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_homeKitKeyPaths, 0);
  objc_storeStrong((id *)&self->_allKeyPaths, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_settingItems, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_groupKeyPath, 0);
  objc_storeStrong((id *)&self->_moduleSettings, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
}

@end