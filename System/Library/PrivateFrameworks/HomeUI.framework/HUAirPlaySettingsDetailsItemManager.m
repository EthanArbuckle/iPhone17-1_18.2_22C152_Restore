@interface HUAirPlaySettingsDetailsItemManager
- (BOOL)_shouldHideModuleHavingGroupKeyPath:(id)a3;
- (HMAccessorySettingsController)settingsController;
- (HUAirPlaySettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4;
- (HUHomeKitAccessorySettingsItemModule)module;
- (NSArray)dependentSettingItems;
- (NSArray)homeKitAccessorySettingsModules;
- (NSMutableSet)allItemProviders;
- (NSString)settingGroupKeyPath;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)updateSettingItem:(id)a3 withValue:(id)a4;
- (void)_subscribeToAccessorySettings:(id)a3;
- (void)setAllItemProviders:(id)a3;
- (void)setDependentSettingItems:(id)a3;
- (void)setHomeKitAccessorySettingsModules:(id)a3;
- (void)setModule:(id)a3;
- (void)setSettingGroupKeyPath:(id)a3;
- (void)setSettingsController:(id)a3;
@end

@implementation HUAirPlaySettingsDetailsItemManager

- (HUAirPlaySettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 accessorySettingsItemProvider];
  v10 = [v9 items];
  v11 = [v10 anyObject];

  v12 = (void *)[v11 copy];
  v22.receiver = self;
  v22.super_class = (Class)HUAirPlaySettingsDetailsItemManager;
  v13 = [(HFItemManager *)&v22 initWithDelegate:v8 sourceItem:v12];

  if (v13)
  {
    uint64_t v14 = [v7 settingsController];
    settingsController = v13->_settingsController;
    v13->_settingsController = (HMAccessorySettingsController *)v14;

    uint64_t v16 = [v7 settingGroupKeyPath];
    settingGroupKeyPath = v13->_settingGroupKeyPath;
    v13->_settingGroupKeyPath = (NSString *)v16;

    v18 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v19 = [v18 accessorySettingsDataSource];
    [v19 addObserver:v13];

    objc_storeStrong((id *)&v13->_module, a4);
    v23[0] = *MEMORY[0x1E4F68028];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(HUAirPlaySettingsDetailsItemManager *)v13 _subscribeToAccessorySettings:v20];
  }
  return v13;
}

- (id)updateSettingItem:(id)a3 withValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v8 = [v5 updateValue:v6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__HUAirPlaySettingsDetailsItemManager_updateSettingItem_withValue___block_invoke;
  v16[3] = &unk_1E638DA48;
  id v9 = v7;
  id v17 = v9;
  id v18 = v6;
  id v19 = v5;
  id v10 = v5;
  id v11 = v6;
  id v12 = (id)[v8 addCompletionBlock:v16];
  v13 = v19;
  id v14 = v9;

  return v14;
}

uint64_t __67__HUAirPlaySettingsDetailsItemManager_updateSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v7 = [v6 accessorySettingsDataSource];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) settingKeyPath];
    id v10 = [*(id *)(a1 + 48) accessoryIdentifier];
    [v7 updateSettingValue:v8 forKeyPath:v9 accessoryIdentifier:v10];

    id v11 = *(void **)(a1 + 32);
    return [v11 finishWithNoResult];
  }
}

- (id)_buildItemModulesForHome:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  v30 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  v29 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_groupKeyPaths");
  id v5 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
  v33 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    id v9 = (void *)MEMORY[0x1E4F68030];
    uint64_t v31 = *(void *)v38;
    v32 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (![(HUAirPlaySettingsDetailsItemManager *)self _shouldHideModuleHavingGroupKeyPath:v11])
        {
          id v12 = [0 settingGroupKeyPath];
          int v13 = [v12 isEqualToString:*v9];

          if (v13)
          {
            id v14 = [(HUAirPlaySettingsDetailsItemManager *)self module];
          }
          else
          {
            v34 = [HUHomeKitAccessorySettingsItemModule alloc];
            v15 = [(HUAirPlaySettingsDetailsItemManager *)self settingsController];
            uint64_t v16 = [(HUAirPlaySettingsDetailsItemManager *)self module];
            id v17 = [v16 home];
            [(HUAirPlaySettingsDetailsItemManager *)self module];
            id v18 = v9;
            v20 = uint64_t v19 = v7;
            v21 = [v20 sourceItem];
            id v14 = [(HUHomeKitAccessorySettingsItemModule *)v34 initWithSettingsController:v15 itemUpdater:self home:v17 sourceItem:v21 settingGroupKeyPath:v11 isCollapsed:0];

            id v5 = v33;
            uint64_t v7 = v19;
            id v9 = v18;

            uint64_t v8 = v31;
            v4 = v32;
          }
          objc_msgSend(v4, "na_safeAddObject:", v14);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v7);
  }
  [(HUAirPlaySettingsDetailsItemManager *)self setHomeKitAccessorySettingsModules:v4];
  objc_super v22 = [(HUAirPlaySettingsDetailsItemManager *)self homeKitAccessorySettingsModules];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__HUAirPlaySettingsDetailsItemManager__buildItemModulesForHome___block_invoke;
  v35[3] = &unk_1E638E5C8;
  id v36 = v29;
  id v23 = v29;
  v24 = [v22 sortedArrayUsingComparator:v35];
  [(HUAirPlaySettingsDetailsItemManager *)self setHomeKitAccessorySettingsModules:v24];

  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v28 = [(HUAirPlaySettingsDetailsItemManager *)self homeKitAccessorySettingsModules];
    *(_DWORD *)buf = 138412546;
    v42 = v30;
    __int16 v43 = 2112;
    v44 = v28;
    _os_log_debug_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEBUG, ". settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x16u);
  }
  v26 = (void *)[v4 copy];

  return v26;
}

uint64_t __64__HUAirPlaySettingsDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 settingGroupKeyPath];
  unint64_t v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v6 settingGroupKeyPath];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 > v11) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v54 = (id)objc_opt_new();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"AirPlayMasterSettingSection"];
  id v5 = [(HUAirPlaySettingsDetailsItemManager *)self module];
  id v6 = [(HUAirPlaySettingsDetailsItemManager *)self module];
  uint64_t v7 = [v6 accessorySettingsItemProvider];
  unint64_t v8 = [v7 items];
  uint64_t v9 = [v8 anyObject];

  if (v9)
  {
    v66[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    [v4 setItems:v10];
  }
  else
  {
    [v4 setItems:0];
  }
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  id v12 = [(HUAirPlaySettingsDetailsItemManager *)self settingGroupKeyPath];
  int v13 = [v11 objectForKey:v12];

  v49 = v13;
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68470]];
  if (v14)
  {
    v15 = [MEMORY[0x1E4F68E60] defaultFactory];
    uint64_t v16 = [v15 formatterForKey:v14];
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v16 attributedStringForObjectValue:self withDefaultAttributes:0];
  v50 = (void *)v9;
  v47 = v16;
  v48 = (void *)v14;
  uint64_t v46 = (void *)v17;
  if (v17)
  {
    [v4 setAttributedFooterTitle:v17];
  }
  else
  {
    id v18 = [v16 stringForObjectValue:self];
    [v4 setFooterTitle:v18];
  }
  v52 = v4;
  objc_msgSend(v54, "na_safeAddObject:", v4);
  objc_opt_class();
  v51 = v5;
  uint64_t v19 = [v5 itemProviders];
  v20 = [v19 allObjects];
  v21 = [v20 lastObject];
  if (objc_opt_isKindOfClass()) {
    objc_super v22 = v21;
  }
  else {
    objc_super v22 = 0;
  }
  id v23 = v22;

  objc_opt_class();
  v45 = v23;
  v24 = [v23 items];
  v25 = [v24 allObjects];
  v26 = [v25 lastObject];
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  v29 = [v28 settingValue];
  int v30 = [v29 BOOLValue];

  uint64_t v31 = [(HUAirPlaySettingsDetailsItemManager *)self module];
  v32 = [v31 sourceItem];
  v33 = [v32 accessories];
  v34 = [v33 anyObject];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v35 = [(HUAirPlaySettingsDetailsItemManager *)self homeKitAccessorySettingsModules];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v35);
        }
        if (v30)
        {
          long long v40 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v41 = [v40 buildSectionsWithDisplayedItems:v53];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __72__HUAirPlaySettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke;
          v55[3] = &unk_1E638BEA0;
          id v56 = v34;
          v42 = objc_msgSend(v41, "na_filter:", v55);

          [v54 addObjectsFromArray:v42];
          __int16 v43 = HFLogForCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v62 = v42;
            __int16 v63 = 2112;
            v64 = v40;
            _os_log_debug_impl(&dword_1BE345000, v43, OS_LOG_TYPE_DEBUG, "Built Setting Sections = [%@] for module = [%@]", buf, 0x16u);
          }
        }
        else
        {
          v42 = HFLogForCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v62) = 0;
            _os_log_impl(&dword_1BE345000, v42, OS_LOG_TYPE_DEFAULT, "Hiding all other sections since airPlayEnabledSettingValue = %{BOOL}d", buf, 8u);
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v37);
  }

  return v54;
}

uint64_t __72__HUAirPlaySettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F68748]];

  if (!v4) {
    return 1;
  }
  id v5 = *(void **)(a1 + 32);

  return [v5 supportsPreferredMediaUser];
}

- (BOOL)_shouldHideModuleHavingGroupKeyPath:(id)a3
{
  v11[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F68030];
  v11[0] = *MEMORY[0x1E4F68CC8];
  v11[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F68308];
  v11[2] = *MEMORY[0x1E4F682B0];
  v11[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F68738];
  v11[4] = *MEMORY[0x1E4F68320];
  v11[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F68468];
  v11[6] = *MEMORY[0x1E4F68408];
  v11[7] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:v11 count:8];
  LOBYTE(v7) = [v9 containsObject:v8];

  return (char)v7;
}

- (void)_subscribeToAccessorySettings:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUAirPlaySettingsDetailsItemManager *)self module];
  uint64_t v6 = [v5 sourceItem];
  uint64_t v7 = [v6 accessories];
  id v8 = [v7 anyObject];

  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Now subscribing to setting accessoryUUID [%@] - keyPaths [%@]", buf, 0x16u);
  }
  unint64_t v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v12 = [v11 accessorySettingsDataSource];
  int v13 = [(HUAirPlaySettingsDetailsItemManager *)self module];
  uint64_t v14 = [v13 home];
  v15 = [v14 uniqueIdentifier];
  uint64_t v16 = [v8 uniqueIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__HUAirPlaySettingsDetailsItemManager__subscribeToAccessorySettings___block_invoke;
  v18[3] = &unk_1E6386708;
  id v19 = v4;
  id v17 = v4;
  objc_msgSend(v12, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v15, v16, v17, 0, v18);
}

void __69__HUAirPlaySettingsDetailsItemManager__subscribeToAccessorySettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keypaths [%@] Error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (HUHomeKitAccessorySettingsItemModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
}

- (NSArray)homeKitAccessorySettingsModules
{
  return self->_homeKitAccessorySettingsModules;
}

- (void)setHomeKitAccessorySettingsModules:(id)a3
{
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (NSMutableSet)allItemProviders
{
  return self->_allItemProviders;
}

- (void)setAllItemProviders:(id)a3
{
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
}

- (NSArray)dependentSettingItems
{
  return self->_dependentSettingItems;
}

- (void)setDependentSettingItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentSettingItems, 0);
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_allItemProviders, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

@end