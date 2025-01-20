@interface HUSiriSettingsDetailsItemManager
- (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3;
- (HFHomeKitAccessorySettingsItemProvider)siriSettingsItemProvider;
- (HMAccessorySettingsController)settingsController;
- (HUHomeKitAccessorySettingsItemModule)module;
- (HUSiriSettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4;
- (NSArray)homeKitAccessorySettingsModules;
- (NSString)settingGroupKeyPath;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)updateSettingItem:(id)a3 withValue:(id)a4;
- (void)setHomeKitAccessorySettingsModules:(id)a3;
- (void)setModule:(id)a3;
- (void)setSettingGroupKeyPath:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setSiriSettingsItemProvider:(id)a3;
@end

@implementation HUSiriSettingsDetailsItemManager

- (HUSiriSettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 accessorySettingsItemProvider];
  v10 = [v9 items];
  v11 = [v10 anyObject];

  v12 = (void *)[v11 copy];
  v21.receiver = self;
  v21.super_class = (Class)HUSiriSettingsDetailsItemManager;
  v13 = [(HFItemManager *)&v21 initWithDelegate:v8 sourceItem:v12];

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
  v16[2] = __64__HUSiriSettingsDetailsItemManager_updateSettingItem_withValue___block_invoke;
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

uint64_t __64__HUSiriSettingsDetailsItemManager_updateSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  v26 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  v25 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_groupKeyPaths");
  objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    v27 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * v8);
        if (![(HUSiriSettingsDetailsItemManager *)self _shouldSkipModuleCreationForGroupKeyPath:v9])
        {
          id v10 = [HUHomeKitAccessorySettingsItemModule alloc];
          id v11 = [(HUSiriSettingsDetailsItemManager *)self settingsController];
          id v12 = [(HUSiriSettingsDetailsItemManager *)self module];
          v13 = [v12 home];
          id v14 = [(HUSiriSettingsDetailsItemManager *)self module];
          v15 = [v14 sourceItem];
          uint64_t v16 = v10;
          v4 = v27;
          id v17 = [(HUHomeKitAccessorySettingsItemModule *)v16 initWithSettingsController:v11 itemUpdater:self home:v13 sourceItem:v15 settingGroupKeyPath:v9 isCollapsed:0];

          uint64_t v6 = v28;
          objc_msgSend(v27, "na_safeAddObject:", v17);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v6);
  }
  [(HUSiriSettingsDetailsItemManager *)self setHomeKitAccessorySettingsModules:v4];
  id v18 = [(HUSiriSettingsDetailsItemManager *)self homeKitAccessorySettingsModules];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__HUSiriSettingsDetailsItemManager__buildItemModulesForHome___block_invoke;
  v30[3] = &unk_1E638E5C8;
  id v31 = v25;
  id v19 = v25;
  v20 = [v18 sortedArrayUsingComparator:v30];
  [(HUSiriSettingsDetailsItemManager *)self setHomeKitAccessorySettingsModules:v20];

  objc_super v21 = HFLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v24 = [(HUSiriSettingsDetailsItemManager *)self homeKitAccessorySettingsModules];
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    __int16 v38 = 2112;
    v39 = v24;
    _os_log_debug_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEBUG, ". settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x16u);
  }
  v22 = (void *)[v4 copy];

  return v22;
}

uint64_t __61__HUSiriSettingsDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 settingGroupKeyPath];
  unint64_t v8 = [v5 indexOfObject:v7];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 settingGroupKeyPath];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 > v11) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary", a3);
  uint64_t v5 = [(HUSiriSettingsDetailsItemManager *)self settingGroupKeyPath];
  id v6 = [v4 objectForKey:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F683A0]];
  unint64_t v8 = (void *)MEMORY[0x1E4F68CC0];
  v27 = v7;
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68CC0]];
  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68460]];
  unint64_t v11 = [v10 objectForKeyedSubscript:*v8];
  v26 = (void *)v9;
  id v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
  v13 = v12;
  if (v11) {
    [v12 addObjectsFromArray:v11];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F69198]);
  v15 = [(HUSiriSettingsDetailsItemManager *)self settingsController];
  uint64_t v16 = [(HUSiriSettingsDetailsItemManager *)self module];
  id v17 = [v16 sourceItem];
  id v18 = [(HUSiriSettingsDetailsItemManager *)self settingGroupKeyPath];
  id v19 = (void *)[v14 initWithSettingsController:v15 sourceItem:v17 settingGroupKeyPath:v18 moduleSettings:v13 usageOptions:0];
  [(HUSiriSettingsDetailsItemManager *)self setSiriSettingsItemProvider:v19];

  v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v24 = [(HUSiriSettingsDetailsItemManager *)self siriSettingsItemProvider];
    v25 = [(HUSiriSettingsDetailsItemManager *)self settingGroupKeyPath];
    *(_DWORD *)buf = 138412546;
    v30 = v24;
    __int16 v31 = 2112;
    long long v32 = v25;
    _os_log_debug_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEBUG, "Built siriSettingsItemProvider [%@] for settingGroupKeyPath = [%@]", buf, 0x16u);
  }
  objc_super v21 = [(HUSiriSettingsDetailsItemManager *)self siriSettingsItemProvider];
  uint64_t v28 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

  return v22;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUSiriSettingsDetailsItemManager *)self siriSettingsItemProvider];
  id v6 = [v5 items];
  uint64_t v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);

  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"SiriSettingsTopSection"];
  uint64_t v9 = objc_msgSend(v7, "na_filter:", &__block_literal_global_282);

  __int16 v31 = v9;
  id v10 = [v9 allObjects];
  [v8 setItems:v10];

  unint64_t v11 = [v8 items];
  id v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_14_2];
  [v8 setItems:v12];

  v13 = objc_msgSend(MEMORY[0x1E4F68E90], "hf_accessorySettingsDictionary");
  id v14 = [(HUSiriSettingsDetailsItemManager *)self settingGroupKeyPath];
  v15 = [v13 objectForKey:v14];

  uint64_t v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68470]];
  if (v16)
  {
    id v17 = [MEMORY[0x1E4F68E60] defaultFactory];
    id v18 = [v17 formatterForKey:v16];
  }
  else
  {
    id v18 = 0;
  }
  id v19 = [v18 attributedStringForObjectValue:self withDefaultAttributes:0];
  if (v19)
  {
    [v8 setAttributedFooterTitle:v19];
  }
  else
  {
    v20 = [v18 stringForObjectValue:self];
    [v8 setFooterTitle:v20];
  }
  objc_super v21 = [(HUSiriSettingsDetailsItemManager *)self siriSettingsItemProvider];
  v22 = [v21 items];
  v23 = objc_msgSend(v22, "na_setByIntersectingWithSet:", v4);

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"SiriSettingsBottomSection"];
  v25 = objc_msgSend(v23, "na_filter:", &__block_literal_global_20_5);

  v26 = [v25 allObjects];
  [v24 setItems:v26];

  v27 = [v24 items];
  uint64_t v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_22_4];
  [v24 setItems:v28];

  v32[0] = v8;
  v32[1] = v24;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

  return v29;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
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

  id v6 = [v5 settingKeyPath];
  if ([v6 isEqualToString:*MEMORY[0x1E4F68038]])
  {
    uint64_t v7 = 1;
  }
  else
  {
    unint64_t v8 = [v5 settingKeyPath];
    uint64_t v7 = [v8 isEqualToString:*MEMORY[0x1E4F68D68]];
  }
  return v7;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  unint64_t v12 = [v8 displayIndex];
  if (v12 > [v11 displayIndex]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
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

  id v6 = [v5 settingKeyPath];
  if ([v6 isEqualToString:*MEMORY[0x1E4F685B8]])
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = [v5 settingKeyPath];
    if ([v8 isEqualToString:*MEMORY[0x1E4F68038]])
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v9 = [v5 settingKeyPath];
      uint64_t v7 = [v9 isEqualToString:*MEMORY[0x1E4F68D68]] ^ 1;
    }
  }

  return v7;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  unint64_t v12 = [v8 displayIndex];
  if (v12 > [v11 displayIndex]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

- (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F68308];
  if ([v4 isEqualToString:*MEMORY[0x1E4F68308]]
    && (![v4 isEqualToString:*v5]
     || ![MEMORY[0x1E4F69758] isAMac]))
  {
    goto LABEL_10;
  }
  id v6 = (void *)MEMORY[0x1E4F68320];
  if ([v4 isEqualToString:*MEMORY[0x1E4F68320]])
  {
    if (![v4 isEqualToString:*v6]
      || ![MEMORY[0x1E4F69758] isAMac])
    {
      goto LABEL_10;
    }
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F68408];
  if (![v4 isEqualToString:*MEMORY[0x1E4F68408]])
  {
    BOOL v11 = 1;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*v7])
  {
    id v8 = [(HUSiriSettingsDetailsItemManager *)self module];
    id v9 = [v8 home];
    id v10 = objc_msgSend(v9, "hf_allCameraProfilesWithDoorbellService");
    BOOL v11 = [v10 count] == 0;
  }
  else
  {
LABEL_10:
    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
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

- (HFHomeKitAccessorySettingsItemProvider)siriSettingsItemProvider
{
  return self->_siriSettingsItemProvider;
}

- (void)setSiriSettingsItemProvider:(id)a3
{
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_siriSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

@end