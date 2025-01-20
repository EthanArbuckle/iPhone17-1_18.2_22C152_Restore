@interface HFAccessorySettingsItemProvider
+ (id)buildItemTuplesForHomeKitSettings:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5 underNode:(id)a6 cache:(id)a7;
- (HFAccessorySettingsItemProvider)initWithHomeKitSettingsVendor:(id)a3 settingGroup:(id)a4 usageOptions:(id)a5;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HMSettingGroup)settingGroup;
- (NATreeNode)parentNode;
- (NSDictionary)usageOptions;
- (NSMutableDictionary)settingToItemCache;
- (NSMutableSet)settingItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setSettingGroup:(id)a3;
- (void)setSettingItems:(id)a3;
- (void)setSettingToItemCache:(id)a3;
- (void)setUsageOptions:(id)a3;
@end

@implementation HFAccessorySettingsItemProvider

- (HFAccessorySettingsItemProvider)initWithHomeKitSettingsVendor:(id)a3 settingGroup:(id)a4 usageOptions:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HFAccessorySettingsItemProvider.m", 429, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HFAccessorySettingsItemProvider;
  v13 = [(HFItemProvider *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    uint64_t v15 = objc_opt_new();
    settingItems = v14->_settingItems;
    v14->_settingItems = (NSMutableSet *)v15;

    uint64_t v17 = objc_opt_new();
    settingToItemCache = v14->_settingToItemCache;
    v14->_settingToItemCache = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v14->_usageOptions, a5);
    [(HFAccessorySettingsItemProvider *)v14 setSettingGroup:v11];
  }

  return v14;
}

- (void)setSettingGroup:(id)a3
{
  id obj = a3;
  if ([obj isEqual:self->_settingGroup]) {
    goto LABEL_11;
  }
  if (!obj)
  {
    v8 = [(HFAccessorySettingsItemProvider *)self homeKitSettingsVendor];
    v14 = [v8 settings];
    id obj = [v14 rootGroup];
    goto LABEL_7;
  }
  v5 = [obj keyPath];
  char v6 = [v5 isEqualToString:@"root"];

  if ((v6 & 1) == 0)
  {
    v7 = [(HFAccessorySettingsItemProvider *)self homeKitSettingsVendor];
    v8 = [v7 settings];

    v9 = [obj keyPath];
    id v10 = objc_msgSend(v8, "hf_accessorySettingGroupAtKeyPath:", v9);
    char v11 = [obj isEqual:v10];

    if (v11)
    {
LABEL_8:

      goto LABEL_9;
    }
    id v12 = [MEMORY[0x263F08690] currentHandler];
    SEL v13 = a2;
    v14 = v12;
    [v12 handleFailureInMethod:v13 object:self file:@"HFAccessorySettingsItemProvider.m" lineNumber:453 description:@"HMAccessorySettingGroup must belong to parent HMMediaProfile!"];
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:
  uint64_t v15 = [(HFAccessorySettingsItemProvider *)self settingToItemCache];
  [v15 removeAllObjects];

  objc_storeStrong((id *)&self->_settingGroup, obj);
  v16 = obj;
  if (!obj) {
    goto LABEL_12;
  }
  uint64_t v17 = [(HFAccessorySettingsItemProvider *)self homeKitSettingsVendor];
  v18 = [v17 settings];
  v19 = objc_msgSend(v18, "hf_codex");
  v20 = [obj keyPath];
  objc_msgSend(v19, "hf_nodeWithKeyPath:", v20);
  objc_super v21 = (NATreeNode *)objc_claimAutoreleasedReturnValue();
  parentNode = self->_parentNode;
  self->_parentNode = v21;

LABEL_11:
  v16 = obj;
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFAccessorySettingsItemProvider *)self homeKitSettingsVendor];
  char v6 = [(HFAccessorySettingsItemProvider *)self settingGroup];
  v7 = [(HFAccessorySettingsItemProvider *)self usageOptions];
  v8 = (void *)[v4 initWithHomeKitSettingsVendor:v5 settingGroup:v6 usageOptions:v7];

  return v8;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = objc_opt_class();
  v4 = [(HFAccessorySettingsItemProvider *)self homeKitSettingsVendor];
  v5 = [(HFAccessorySettingsItemProvider *)self usageOptions];
  char v6 = [(HFAccessorySettingsItemProvider *)self settingGroup];
  v7 = [(HFAccessorySettingsItemProvider *)self parentNode];
  v8 = [(HFAccessorySettingsItemProvider *)self settingToItemCache];
  v9 = [v3 buildItemTuplesForHomeKitSettings:v4 usageOptions:v5 settingGroup:v6 underNode:v7 cache:v8];

  id v10 = [v9 allObjects];
  char v11 = [(HFAccessorySettingsItemProvider *)self filter];
  if (v11)
  {
    id v12 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_4;
    v18[3] = &unk_2640951E0;
    v5 = &v19;
    objc_copyWeak(&v19, &location);
  }
  else
  {
    id v12 = 0;
  }
  SEL v13 = [(HFItemProvider *)self reloadItemsWithObjects:v10 keyAdaptor:&__block_literal_global_398 itemAdaptor:&__block_literal_global_401 filter:v12 itemMap:&__block_literal_global_395];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_5;
  v16[3] = &unk_26408D198;
  objc_copyWeak(&v17, &location);
  v14 = [v13 flatMap:v16];
  objc_destroyWeak(&v17);

  if (v11) {
    objc_destroyWeak(v5);
  }

  objc_destroyWeak(&location);
  return v14;
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 outputItem];
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 keyPath];
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 settingKeyPath];
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained filter];
  char v6 = [v3 settingKeyPath];

  uint64_t v7 = ((uint64_t (**)(void, void *))v5)[2](v5, v6);
  return v7;
}

id __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained settingItems];
  char v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained settingItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)items
{
  v2 = [(HFAccessorySettingsItemProvider *)self settingItems];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFAccessorySettingsItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"accessory"];

  return v3;
}

+ (id)buildItemTuplesForHomeKitSettings:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5 underNode:(id)a6 cache:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v54 = a6;
  id v14 = a7;
  if (!v14) {
    id v14 = (id)objc_opt_new();
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke;
  aBlock[3] = &unk_264095208;
  id v15 = v14;
  id v89 = v15;
  v16 = _Block_copy(aBlock);
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_2;
  v86[3] = &unk_264095230;
  id v87 = v15;
  id v53 = v15;
  id v17 = _Block_copy(v86);
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_3;
  v81[3] = &unk_264095258;
  id v18 = v16;
  id v84 = v18;
  id v19 = v11;
  id v82 = v19;
  id v20 = v12;
  id v83 = v20;
  id v21 = v17;
  id v85 = v21;
  v22 = _Block_copy(v81);
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_4;
  v76[3] = &unk_264095280;
  id v23 = v18;
  id v79 = v23;
  id v24 = v19;
  id v77 = v24;
  id v25 = v20;
  id v78 = v25;
  id v26 = v21;
  id v80 = v26;
  v27 = _Block_copy(v76);
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_5;
  v71[3] = &unk_2640952A8;
  id v28 = v23;
  id v74 = v28;
  id v29 = v24;
  id v72 = v29;
  id v30 = v25;
  id v73 = v30;
  id v31 = v26;
  id v75 = v31;
  v32 = _Block_copy(v71);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_6;
  v65[3] = &unk_2640952D0;
  id v66 = v29;
  id v67 = v30;
  id v68 = v28;
  id v69 = v31;
  id v70 = v22;
  id v33 = v22;
  id v50 = v31;
  id v52 = v30;
  id v51 = v29;
  id v34 = v28;
  v35 = _Block_copy(v65);
  v36 = objc_opt_new();
  v37 = [v13 settings];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_7;
  v62[3] = &unk_2640952F8;
  id v38 = v35;
  id v64 = v38;
  id v39 = v36;
  id v63 = v39;
  objc_msgSend(v37, "na_each:", v62);

  v40 = [v13 groups];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_8;
  v58[3] = &unk_264095348;
  id v60 = v27;
  id v41 = v39;
  id v59 = v41;
  id v61 = v38;
  id v42 = v38;
  id v43 = v27;
  objc_msgSend(v40, "na_each:", v58);

  v44 = [v54 childNodes];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_11;
  v55[3] = &unk_264095370;
  id v57 = v32;
  id v45 = v41;
  id v56 = v45;
  id v46 = v32;
  objc_msgSend(v44, "na_each:", v55);

  v47 = v56;
  id v48 = v45;

  return v48;
}

id __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = _HomeKitSettingToHFItem_CacheItemCacheKey(a2);
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 cacheKey];
  objc_msgSend(v2, "na_safeSetObject:forKey:", v3, v4);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(a1[6] + 16))();
  v9 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = [[_HomeKitSettingToHFItem_CacheItem alloc] initWithHomeKitSettingsVendor:a1[4] usageOptions:a1[5] setting:v7 optionItem:v8];
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v10, "na_safeAddObject:", v9);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  char v6 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    char v6 = [[_HomeKitSettingToHFItem_CacheItem alloc] initWithHomeKitSettingsVendor:a1[4] usageOptions:a1[5] group:v5];
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v7, "na_safeAddObject:", v6);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_5(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  char v6 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    char v6 = [[_HomeKitSettingToHFItem_CacheItem alloc] initWithHomeKitSettingsVendor:a1[4] usageOptions:a1[5] accessoryGroupEntity:v5];
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v7, "na_safeAddObject:", v6);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_6(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  id v7 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v7 = [[_HomeKitSettingToHFItem_CacheItem alloc] initWithHomeKitSettingsVendor:a1[4] usageOptions:a1[5] setting:v6];
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v5, "na_safeAddObject:", v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = objc_msgSend(v8, "items", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(a1[8] + 16))();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_8(id *a1, void *a2)
{
  id v4 = a1[4];
  id v3 = a1[5];
  id v5 = (void (*)(void *, id, id))v3[2];
  id v6 = a2;
  v5(v3, v4, v6);
  id v7 = [v6 settings];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_9;
  v12[3] = &unk_2640952F8;
  id v14 = a1[6];
  id v13 = a1[4];
  objc_msgSend(v7, "na_each:", v12);

  id v8 = [v6 groups];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_10;
  v9[3] = &unk_264095320;
  id v11 = a1[5];
  id v10 = a1[4];
  objc_msgSend(v8, "na_each:", v9);
}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 representedObject];
  int v5 = [v4 alwaysShowGroup];

  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = [v3 representedObject];
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);
  }
  v9 = [v3 childNodes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_12;
  v10[3] = &unk_264095370;
  id v12 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "na_each:", v10);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_12(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 representedObject];
  int v4 = [v3 alwaysShowGroup];

  if (v4)
  {
    uint64_t v7 = a1 + 32;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v7 + 8);
    id v8 = [v9 representedObject];
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v5, v8);
  }
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
}

- (NSMutableDictionary)settingToItemCache
{
  return self->_settingToItemCache;
}

- (void)setSettingToItemCache:(id)a3
{
}

- (NSMutableSet)settingItems
{
  return self->_settingItems;
}

- (void)setSettingItems:(id)a3
{
}

- (NATreeNode)parentNode
{
  return self->_parentNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentNode, 0);
  objc_storeStrong((id *)&self->_settingItems, 0);
  objc_storeStrong((id *)&self->_settingToItemCache, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
}

@end