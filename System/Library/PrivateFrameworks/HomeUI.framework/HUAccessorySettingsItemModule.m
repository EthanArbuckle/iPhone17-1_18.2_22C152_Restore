@interface HUAccessorySettingsItemModule
- (BOOL)checkSoftwareVersionForAccessories:(id)a3 neededSoftwareVersion:(id)a4;
- (HFAccessorySettingsEntity)parentEntity;
- (HFAccessorySettingsItemProvider)accessorySettingsItemProvider;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HMAccessory)accessory;
- (HMSettingGroup)parentSettingGroup;
- (HMSettings)settings;
- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5;
- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 usageOptions:(id)a6;
- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 homeKitSettingsVendor:(id)a4 usageOptions:(id)a5;
- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 mediaAccessoryItem:(id)a4;
- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4 usageOptions:(id)a5;
- (NATreeNode)codex;
- (NSSet)groupItemsToBeDisplayed;
- (NSSet)settingItemsToBeDisplayed;
- (id)_itemSectionForGroup:(id)a3 entity:(id)a4 settingItems:(id)a5 groupItems:(id)a6;
- (id)_itemSectionWithEntity:(id)a3 items:(id)a4;
- (id)_itemSectionsForGroupKeyPaths:(id)a3;
- (id)_itemSectionsForParentGroupWithItems;
- (id)_itemSectionsForShowInSeperateSectionItems:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)getAllHomePodFromItem:(id)a3;
- (id)itemProviders;
- (id)updateItem:(id)a3 withValue:(id)a4;
- (void)_registerForAccessorySettingsUpdates;
- (void)_resetIfNeeded;
- (void)_unregisterForAccessorySettingsUpdates;
- (void)setGroupItemsToBeDisplayed:(id)a3;
- (void)setSettingItemsToBeDisplayed:(id)a3;
- (void)updateItems:(id)a3;
- (void)updateItems:(id)a3 matchingDependency:(id)a4;
- (void)updateItemsForKeyPath:(id)a3;
@end

@implementation HUAccessorySettingsItemModule

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  return [(HUAccessorySettingsItemModule *)self initWithItemUpdater:a3 home:a4 sourceItem:a5 usageOptions:0];
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 mediaAccessoryItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 accessories];
  v9 = [v8 anyObject];
  v10 = [v9 home];
  v11 = [(HUAccessorySettingsItemModule *)self initWithItemUpdater:v7 home:v10 sourceItem:v6 usageOptions:0];

  return v11;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 usageOptions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 latestResults];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68B20]];
  v17 = &unk_1F1A96BD8;
  if ([v16 conformsToProtocol:v17]) {
    v18 = v16;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    id v20 = v13;
    id v21 = [v20 conformsToProtocol:&unk_1F1A3D7E8] ? v20 : 0;
    id v22 = v21;

    v16 = [v22 homeKitSettingsVendor];

    if (!v16)
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"HUAccessorySettingsItemModule.m", 60, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];

      v16 = 0;
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)HUAccessorySettingsItemModule;
  v23 = [(HUServiceDetailsItemModule *)&v34 initWithItemUpdater:v11 home:v12 sourceItem:v13];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_homeKitSettingsVendor, v16);
    uint64_t v25 = [v16 settings];
    settings = v24->_settings;
    v24->_settings = (HMSettings *)v25;

    v27 = [v16 settings];
    uint64_t v28 = objc_msgSend(v27, "hf_codex");
    codex = v24->_codex;
    v24->_codex = (NATreeNode *)v28;

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F68E88]) initWithHomeKitSettingsVendor:v16 settingGroup:0 usageOptions:v14];
    accessorySettingsItemProvider = v24->_accessorySettingsItemProvider;
    v24->_accessorySettingsItemProvider = (HFAccessorySettingsItemProvider *)v30;
  }
  return v24;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 homeKitSettingsVendor:(id)a4 usageOptions:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F68E68];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v8 alloc] initWithHomeKitSettingsVendor:v10 usageOptions:v9];

  id v13 = [(HUAccessorySettingsItemModule *)self initWithItemUpdater:v11 settingGroupItem:v12 usageOptions:v9];
  return v13;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4 usageOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 homeKitSettingsVendor];
  id v12 = objc_msgSend(v11, "hf_home");
  id v13 = [(HUAccessorySettingsItemModule *)self initWithItemUpdater:v10 home:v12 sourceItem:v8 usageOptions:v9];

  if (v13)
  {
    uint64_t v14 = [v8 entity];
    parentEntity = v13->_parentEntity;
    v13->_parentEntity = (HFAccessorySettingsEntity *)v14;

    uint64_t v16 = [v8 settingGroup];
    parentSettingGroup = v13->_parentSettingGroup;
    v13->_parentSettingGroup = (HMSettingGroup *)v16;

    v18 = [v8 settingGroup];
    [(HFAccessorySettingsItemProvider *)v13->_accessorySettingsItemProvider setSettingGroup:v18];
  }
  return v13;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    id v6 = [(HUAccessorySettingsItemModule *)self accessorySettingsItemProvider];
    [(NSSet *)v5 na_safeAddObject:v6];

    id v7 = self->_itemProviders;
    self->_itemProviders = v5;
    id v8 = v5;

    v3 = self->_itemProviders;
  }

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  [(HUAccessorySettingsItemModule *)self _resetIfNeeded];
  uint64_t v5 = [(HUAccessorySettingsItemModule *)self settings];
  if (!v5) {
    goto LABEL_15;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(HUAccessorySettingsItemModule *)self parentSettingGroup];
  if (!v7)
  {

    goto LABEL_15;
  }
  id v8 = (void *)v7;
  id v9 = [(HUAccessorySettingsItemModule *)self codex];

  if (!v9)
  {
LABEL_15:
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_16;
  }
  id v10 = [(HUAccessorySettingsItemModule *)self accessorySettingsItemProvider];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v49[3] = &unk_1E6386108;
  id v11 = v10;
  id v50 = v11;
  id v12 = objc_msgSend(v4, "na_filter:", v49);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v48[3] = &unk_1E6386108;
  v48[4] = self;
  id v13 = objc_msgSend(v12, "na_filter:", v48);
  [(HUAccessorySettingsItemModule *)self setSettingItemsToBeDisplayed:v13];

  v46 = v12;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
  v47[3] = &unk_1E6386108;
  v47[4] = self;
  uint64_t v14 = objc_msgSend(v12, "na_filter:", v47);
  [(HUAccessorySettingsItemModule *)self setGroupItemsToBeDisplayed:v14];

  v15 = objc_opt_new();
  uint64_t v16 = [(HUAccessorySettingsItemModule *)self accessorySettingsItemProvider];
  v17 = [v16 settingGroup];
  uint64_t v18 = [v17 keyPath];

  id v19 = (void *)MEMORY[0x1E4F1CA70];
  id v20 = [(HUAccessorySettingsItemModule *)self codex];
  v45 = (void *)v18;
  id v21 = objc_msgSend(v20, "hf_nodeWithKeyPath:", v18);
  id v22 = objc_msgSend(v21, "hf_sortedAccessorySettingsChildren");
  v23 = objc_msgSend(v22, "na_filter:", &__block_literal_global_209);
  v24 = objc_msgSend(v23, "na_map:", &__block_literal_global_111_1);
  uint64_t v25 = [v19 orderedSetWithArray:v24];

  v26 = [(HUAccessorySettingsItemModule *)self _itemSectionsForParentGroupWithItems];
  [v15 addObjectsFromArray:v26];

  v27 = [(HUAccessorySettingsItemModule *)self parentEntity];
  LODWORD(v24) = [v27 wantsSeparateSectionPerGroup];

  if (v24)
  {
    uint64_t v28 = [(HUAccessorySettingsItemModule *)self _itemSectionsForGroupKeyPaths:v25];
    [v15 addObjectsFromArray:v28];
  }
  v29 = [v15 sortedArrayUsingComparator:&__block_literal_global_114_2];
  uint64_t v30 = [(HUAccessorySettingsItemModule *)self parentEntity];
  v31 = [v30 adapterIdentifier];

  if (v31)
  {
    v42 = v25;
    v43 = v15;
    id v44 = v11;
    v32 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
    v33 = objc_msgSend(v32, "hf_settingsAdapterManager");
    objc_super v34 = [(HUAccessorySettingsItemModule *)self parentEntity];
    v35 = [v34 adapterIdentifier];
    v36 = [v33 adapterForIdentifier:v35];
    if ([v36 conformsToProtocol:&unk_1F1AD95D0]) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    if (objc_opt_respondsToSelector())
    {
      v39 = [(HUAccessorySettingsItemModule *)self parentEntity];
      uint64_t v40 = [v38 customizeSections:v29 forEntity:v39];

      v29 = (void *)v40;
    }
    id v11 = v44;
    uint64_t v25 = v42;

    v15 = v43;
  }

LABEL_16:

  return v29;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 items];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 entity];
  int v8 = [v7 isSoftwareVersionNeeded];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 homeKitSettingsVendor];
    id v11 = [v9 getAllHomePodFromItem:v10];

    id v12 = *(void **)(a1 + 32);
    long long v16 = *MEMORY[0x1E4F653B0];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F653B0] + 16);
    id v13 = [MEMORY[0x1E4F65558] versionFromOperatingSystemVersion:&v16];
    uint64_t v14 = [v12 checkSoftwareVersionForAccessories:v11 neededSoftwareVersion:v13];
  }
  else
  {
    uint64_t v14 = v6 != 0;
  }

  return v14;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 entity];
  int v8 = [v7 isSoftwareVersionNeeded];

  if (v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 homeKitSettingsVendor];
    id v11 = [v9 getAllHomePodFromItem:v10];

    id v12 = *(void **)(a1 + 32);
    long long v16 = *MEMORY[0x1E4F653B0];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F653B0] + 16);
    id v13 = [MEMORY[0x1E4F65558] versionFromOperatingSystemVersion:&v16];
    uint64_t v14 = [v12 checkSoftwareVersionForAccessories:v11 neededSoftwareVersion:v13];
  }
  else
  {
    uint64_t v14 = v6 != 0;
  }

  return v14;
}

BOOL __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 representedObject];
  BOOL v3 = [v2 interfaceModality] == 0;

  return v3;
}

id __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 representedObject];
  BOOL v3 = [v2 keyPath];

  return v3;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v7 = [v4 userInfo];

  int v8 = [v7 objectForKeyedSubscript:@"HUAccessorySettingsItemModuleSortKey"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)updateItems:(id)a3
{
  id v6 = [MEMORY[0x1E4F69230] requestToUpdateItems:a3 senderSelector:a2];
  id v4 = [(HFItemModule *)self itemUpdater];
  id v5 = (id)[v4 performItemUpdateRequest:v6];
}

- (void)updateItems:(id)a3 matchingDependency:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithSet:a3];
  int v8 = [(HUAccessorySettingsItemModule *)self itemProviders];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke;
  uint64_t v14 = &unk_1E638F0A8;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "na_each:", &v11);

  -[HUAccessorySettingsItemModule updateItems:](self, "updateItems:", v9, v11, v12, v13, v14);
}

void __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 items];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke_2;
  v4[3] = &unk_1E6389D10;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);
}

void __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 latestResults];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F68BF0]];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)updateItemsForKeyPath:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = [(HUAccessorySettingsItemModule *)self itemProviders];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke;
  uint64_t v12 = &unk_1E638F0A8;
  id v13 = v4;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend(v6, "na_each:", &v9);

  -[HUAccessorySettingsItemModule updateItems:](self, "updateItems:", v7, v9, v10, v11, v12);
}

void __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 items];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke_2;
  v4[3] = &unk_1E6389D10;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);
}

void __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 latestResults];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F67FD8]];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)updateItem:(id)a3 withValue:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 latestResults];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F67FF8]];

  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to update item '%@' (Setting: %@) to value: %@", buf, 0x20u);
  }

  if (v5 && v8)
  {
    uint64_t v10 = [v5 updateValue:v6];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke;
    v24[3] = &unk_1E638C140;
    id v11 = v5;
    id v25 = v11;
    id v12 = v8;
    id v26 = v12;
    id v13 = v6;
    id v27 = v13;
    id v14 = [v10 addFailureBlock:v24];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke_136;
    v20[3] = &unk_1E638F0D0;
    id v21 = v11;
    id v22 = v12;
    id v23 = v13;
    id v15 = [v14 addSuccessBlock:v20];

    id v16 = v25;
  }
  else
  {
    uint64_t v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "Failed to update setting; no item or setting for item: %@ / value: %@",
        buf,
        0x16u);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 7);
    id v15 = [v18 futureWithError:v16];
  }

  return v15;
}

void __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    *(_DWORD *)buf = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update item '%@' (Setting: %@) to value: %@", buf, 0x20u);
  }

  id v8 = [MEMORY[0x1E4F69110] sharedHandler];
  uint64_t v9 = [NSString stringWithFormat:@"updateItem:%@ withValue:%@", a1[4], a1[6]];
  [v8 logError:v3 operationDescription:v9];
}

void __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke_136(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v6 = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Updated item '%@' (Setting: %@) to value: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_registerForAccessorySettingsUpdates
{
  id v4 = [(HUAccessorySettingsItemModule *)self settings];
  uint64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  if (v4) {
    [v3 addHomeKitSettingsObserver:self];
  }
  else {
    [v3 addMediaObjectObserver:self];
  }
}

- (void)_unregisterForAccessorySettingsUpdates
{
  uint64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 removeHomeKitSettingsObserver:self];

  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v4 removeMediaObjectObserver:self];
}

- (id)_itemSectionWithEntity:(id)a3 items:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HUAccessorySettingsItemModule.m", 268, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  uint64_t v9 = [v7 keyPath];
  __int16 v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v12 UUIDString];
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v11];
  [v13 setItems:v8];
  __int16 v14 = [v7 headerTitleFormatter];

  if (v14)
  {
    uint64_t v15 = [v7 headerTitleFormatter];
    uint64_t v16 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
    uint64_t v17 = [v15 attributedStringForObjectValue:v16 withDefaultAttributes:0];

    if (v17)
    {
      [v13 setAttributedHeaderTitle:v17];
    }
    else
    {
      id v19 = [v7 headerTitleFormatter];
      id v20 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
      id v21 = [v19 stringForObjectValue:v20];
      [v13 setHeaderTitle:v21];

      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v18 = [v7 localizedHeader];

    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v17 = [v7 localizedHeader];
    [v13 setHeaderTitle:v17];
  }

LABEL_13:
  id v22 = [v7 footerTitleFormatter];

  if (v22)
  {
    id v23 = [v7 footerTitleFormatter];
    v24 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
    id v25 = [v23 attributedStringForObjectValue:v24 withDefaultAttributes:0];

    if (v25)
    {
      [v13 setAttributedFooterTitle:v25];
    }
    else
    {
      id v27 = [v7 footerTitleFormatter];
      uint64_t v28 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
      id v29 = [v27 stringForObjectValue:v28];
      [v13 setFooterTitle:v29];

      id v25 = 0;
    }
  }
  else
  {
    id v26 = [v7 localizedFooter];

    if (!v26) {
      goto LABEL_20;
    }
    id v25 = [v7 localizedFooter];
    [v13 setFooterTitle:v25];
  }

LABEL_20:
  if (!v7)
  {
    __int16 v30 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0x7FFFFFFFFFFFFFFFLL, @"HUAccessorySettingsItemModuleSortKey");
    v41 = v30;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [v13 setUserInfo:v31];
LABEL_26:

    goto LABEL_27;
  }
  v42 = @"HUAccessorySettingsItemModuleSortKey";
  __int16 v30 = [v7 sortKey];
  id v31 = v30;
  if (!v30)
  {
    id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 0x7FFFFFFFFFFFFFFFLL);
  }
  v43[0] = v31;
  __int16 v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  [v13 setUserInfo:v32];

  if (!v30) {
    goto LABEL_26;
  }
LABEL_27:

  id v33 = [v7 adapterIdentifier];

  if (v33)
  {
    uint64_t v34 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
    v35 = objc_msgSend(v34, "hf_settingsAdapterManager");
    v36 = [v7 adapterIdentifier];
    v37 = [v35 adapterForIdentifier:v36];

    if (objc_opt_respondsToSelector()) {
      [v37 configureSection:v13 forEntity:v7];
    }
  }

  return v13;
}

- (id)_itemSectionsForParentGroupWithItems
{
  v2 = self;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v29 = [(HUAccessorySettingsItemModule *)self settingItemsToBeDisplayed];
  id v26 = [(HUAccessorySettingsItemModule *)v2 groupItemsToBeDisplayed];
  id v27 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v3 = [(HUAccessorySettingsItemModule *)v2 parentSettingGroup];
  id v4 = [v3 settings];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke;
        v34[3] = &unk_1E6386108;
        v34[4] = v9;
        __int16 v10 = objc_msgSend(v29, "na_firstObjectPassingTest:", v34);
        if (v10)
        {
          id v11 = v2;
          uint64_t v12 = [(HUAccessorySettingsItemModule *)v2 codex];
          uint64_t v13 = [v9 keyPath];
          __int16 v14 = objc_msgSend(v12, "hf_nodeWithKeyPath:", v13);

          if (v14)
          {
            [v27 addObject:v10];
          }
          else
          {
            uint64_t v15 = HFLogForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = [v9 keyPath];
              *(_DWORD *)buf = 138412546;
              uint64_t v40 = v10;
              __int16 v41 = 2112;
              v42 = v16;
              _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Dropping item (%@) with setting not in allowlist: %@", buf, 0x16u);
            }
          }
          v2 = v11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v6);
  }

  uint64_t v17 = [(HUAccessorySettingsItemModule *)v2 parentEntity];
  char v18 = [v17 wantsSeparateSectionPerGroup];

  if (v18)
  {
    id v19 = objc_opt_new();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_3;
    v30[3] = &unk_1E638F140;
    id v20 = (id *)v31;
    id v21 = v19;
    v31[0] = v21;
    v31[1] = v2;
    id v22 = v27;
    [v27 enumerateObjectsUsingBlock:v30];
    id v23 = v26;
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_152;
    v32[3] = &unk_1E638F0F8;
    id v20 = &v33;
    id v22 = v27;
    id v24 = v27;
    id v33 = v24;
    id v23 = v26;
    objc_msgSend(v26, "na_each:", v32);
    [v24 sortUsingComparator:&__block_literal_global_156];
    id v21 = [(HUAccessorySettingsItemModule *)v2 _itemSectionsForShowInSeperateSectionItems:v24];
  }

  return v21;
}

uint64_t __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 latestResults];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F67FD8]];
  uint64_t v5 = [*(id *)(a1 + 32) keyPath];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

void __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_152(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 entity];
  int v4 = [v3 alwaysShowGroup];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 entity];
  uint64_t v6 = [v5 sortKey];
  uint64_t v7 = [v4 entity];

  id v8 = [v7 sortKey];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

void __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v4 entity];
  v8[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v7 = [v3 _itemSectionWithEntity:v5 items:v6];
  objc_msgSend(v2, "na_safeAddObject:", v7);
}

- (id)_itemSectionsForShowInSeperateSectionItems:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = (void *)[v3 mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 entity];
        int v13 = [v12 showInSeperateSection];

        if (v13)
        {
          __int16 v14 = [v11 entity];
          uint64_t v28 = v11;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          uint64_t v16 = [(HUAccessorySettingsItemModule *)self _itemSectionWithEntity:v14 items:v15];
          objc_msgSend(v4, "na_safeAddObject:", v16);

          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v17 = v5;
  char v18 = [v5 firstObject];
  id v19 = [v18 entity];
  id v20 = [v5 array];
  id v21 = [(HUAccessorySettingsItemModule *)self _itemSectionWithEntity:v19 items:v20];
  objc_msgSend(v4, "na_safeAddObject:", v21);

  return v4;
}

- (id)_itemSectionsForGroupKeyPaths:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        __int16 v10 = [(HUAccessorySettingsItemModule *)self codex];
        id v11 = objc_msgSend(v10, "hf_nodeWithKeyPath:", v9);
        uint64_t v12 = [v11 representedObject];

        if (v12)
        {
          int v13 = [(HUAccessorySettingsItemModule *)self groupItemsToBeDisplayed];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __63__HUAccessorySettingsItemModule__itemSectionsForGroupKeyPaths___block_invoke;
          v21[3] = &unk_1E638F168;
          v21[4] = v9;
          __int16 v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", v21);

          if (v14)
          {
            uint64_t v15 = [(HUAccessorySettingsItemModule *)self settingItemsToBeDisplayed];
            uint64_t v16 = [(HUAccessorySettingsItemModule *)self groupItemsToBeDisplayed];
            uint64_t v17 = [(HUAccessorySettingsItemModule *)self _itemSectionForGroup:v14 entity:v12 settingItems:v15 groupItems:v16];

            objc_msgSend(v19, "na_safeAddObject:", v17);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v19;
}

uint64_t __63__HUAccessorySettingsItemModule__itemSectionsForGroupKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 settingKeyPath];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_itemSectionForGroup:(id)a3 entity:(id)a4 settingItems:(id)a5 groupItems:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke;
  v35[3] = &unk_1E638F190;
  id v11 = v9;
  id v36 = v11;
  id v12 = v10;
  id v37 = v12;
  id v13 = a5;
  __int16 v14 = objc_msgSend(a6, "na_filter:", v35);
  uint64_t v15 = [v11 settingGroup];
  uint64_t v16 = [v15 settings];

  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  __int16 v32 = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_2;
  id v33 = &unk_1E638F1E0;
  id v17 = v16;
  id v34 = v17;
  char v18 = objc_msgSend(v13, "na_filter:", &v30);

  id v19 = v14;
  if (v14)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1CAD0] set];
    if (v18)
    {
LABEL_3:
      id v20 = objc_msgSend(v19, "setByAddingObjectsFromSet:", v18, self, v30, v31, v32, v33);
      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  long long v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", self, v30, v31, v32, v33);
  id v20 = [v19 setByAddingObjectsFromSet:v26];

  if (!v14) {
LABEL_4:
  }

LABEL_5:
  id v21 = objc_msgSend(v20, "na_filter:", &__block_literal_global_165);
  long long v22 = objc_msgSend(v20, "na_setByRemovingObjectsFromSet:", v21);
  long long v23 = [v22 allObjects];
  long long v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_167];

  if ([v24 count])
  {
    long long v25 = [v29 _itemSectionWithEntity:v12 items:v24];
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) settingGroup];
  uint64_t v5 = [v4 groups];
  uint64_t v6 = [v3 settingGroup];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v3 entity];
    int v10 = [v9 alwaysShowGroup];

    if (v10)
    {
      id v11 = [v3 entity];
      id v12 = [v11 keyPath];
      id v13 = [*(id *)(a1 + 40) keyPath];
      uint64_t v8 = [v12 hasPrefix:v13];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F67FF8]];

  uint64_t v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_3;
  v9[3] = &unk_1E638F1B8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 keyPath];
  uint64_t v4 = [*(id *)(a1 + 32) keyPath];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

BOOL __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F68010]];
  BOOL v4 = v3 == 0;

  return v4;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68010];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F68010]];

  uint64_t v8 = [v4 latestResults];

  id v9 = [v8 objectForKey:v6];

  id v10 = [v7 sortKey];
  id v11 = [v9 sortKey];
  uint64_t v12 = [v10 compare:v11];

  return v12;
}

- (void)_resetIfNeeded
{
  id v3 = [(HUAccessorySettingsItemModule *)self settings];
  BOOL v4 = v3 == 0;

  if (!v3)
  {
    uint64_t v5 = [(HUAccessorySettingsItemModule *)self homeKitSettingsVendor];
    uint64_t v6 = [v5 settings];
    settings = self->_settings;
    self->_settings = v6;
  }
  uint64_t v8 = [(HUAccessorySettingsItemModule *)self parentSettingGroup];
  if (v8)
  {
    id v9 = (void *)v8;
  }
  else
  {
    id v10 = [(HMSettings *)self->_settings rootGroup];

    if (!v10) {
      goto LABEL_8;
    }
    id v11 = [(HMSettings *)self->_settings rootGroup];
    parentSettingGroup = self->_parentSettingGroup;
    self->_parentSettingGroup = v11;

    id v13 = self->_parentSettingGroup;
    id v9 = [(HUAccessorySettingsItemModule *)self accessorySettingsItemProvider];
    [v9 setSettingGroup:v13];
    BOOL v4 = 1;
  }

LABEL_8:
  __int16 v14 = [(HUAccessorySettingsItemModule *)self codex];

  if (!v14)
  {
    uint64_t v15 = [(HUAccessorySettingsItemModule *)self settings];
    objc_msgSend(v15, "hf_codex");
    uint64_t v16 = (NATreeNode *)objc_claimAutoreleasedReturnValue();
    codex = self->_codex;
    self->_codex = v16;

    BOOL v4 = 1;
  }
  char v18 = [(HUAccessorySettingsItemModule *)self parentEntity];
  if (v18
    || ([(HUAccessorySettingsItemModule *)self parentSettingGroup],
        char v18 = objc_claimAutoreleasedReturnValue(),
        [v18 keyPath],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_12;
  }
  id v20 = (void *)v19;
  id v21 = [(HUAccessorySettingsItemModule *)self codex];

  if (!v21)
  {
LABEL_12:
    if (!v4) {
      return;
    }
    goto LABEL_17;
  }
  long long v22 = [(HUAccessorySettingsItemModule *)self codex];
  long long v23 = [(HUAccessorySettingsItemModule *)self parentSettingGroup];
  long long v24 = [v23 keyPath];
  long long v25 = objc_msgSend(v22, "hf_nodeWithKeyPath:", v24);
  long long v26 = [v25 representedObject];
  parentEntity = self->_parentEntity;
  self->_parentEntity = v26;

LABEL_17:
  [(HUAccessorySettingsItemModule *)self _unregisterForAccessorySettingsUpdates];

  [(HUAccessorySettingsItemModule *)self _registerForAccessorySettingsUpdates];
}

- (id)getAllHomePodFromItem:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [v7 accessory];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    objc_opt_class();
    id v10 = v3;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v7 = v11;

    uint64_t v8 = [v7 components];
    uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_172);
  }
  uint64_t v12 = (void *)v9;

  id v4 = v12;
LABEL_12:

  return v4;
}

id __55__HUAccessorySettingsItemModule_getAllHomePodFromItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mediaProfile];
  id v3 = [v2 accessory];

  return v3;
}

- (BOOL)checkSoftwareVersionForAccessories:(id)a3 neededSoftwareVersion:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __90__HUAccessorySettingsItemModule_checkSoftwareVersionForAccessories_neededSoftwareVersion___block_invoke;
  v8[3] = &unk_1E63869C8;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "na_any:", v8);

  return (char)a3;
}

uint64_t __90__HUAccessorySettingsItemModule_checkSoftwareVersionForAccessories_neededSoftwareVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 softwareVersion];
  uint64_t v4 = [v3 isAtLeastVersion:*(void *)(a1 + 32)];

  return v4;
}

- (HFAccessorySettingsItemProvider)accessorySettingsItemProvider
{
  return self->_accessorySettingsItemProvider;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (NATreeNode)codex
{
  return self->_codex;
}

- (HFAccessorySettingsEntity)parentEntity
{
  return self->_parentEntity;
}

- (HMSettingGroup)parentSettingGroup
{
  return self->_parentSettingGroup;
}

- (NSSet)settingItemsToBeDisplayed
{
  return self->_settingItemsToBeDisplayed;
}

- (void)setSettingItemsToBeDisplayed:(id)a3
{
}

- (NSSet)groupItemsToBeDisplayed
{
  return self->_groupItemsToBeDisplayed;
}

- (void)setGroupItemsToBeDisplayed:(id)a3
{
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_groupItemsToBeDisplayed, 0);
  objc_storeStrong((id *)&self->_settingItemsToBeDisplayed, 0);
  objc_storeStrong((id *)&self->_parentSettingGroup, 0);
  objc_storeStrong((id *)&self->_parentEntity, 0);
  objc_storeStrong((id *)&self->_codex, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);

  objc_storeStrong((id *)&self->_accessorySettingsItemProvider, 0);
}

@end