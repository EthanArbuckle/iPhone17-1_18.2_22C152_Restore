@interface HUNaturalLightingSetupModule
+ (BOOL)showNaturalLightingContainingHomeKitObject:(id)a3;
- (HFAccessoryItemProvider)accessoryItemProvider;
- (HFServiceGroupItemProvider)serviceGroupItemProvider;
- (HFServiceItemProvider)serviceItemProvider;
- (HMHome)home;
- (HUNaturalLightingSetupModule)initWithHome:(id)a3 itemUpdater:(id)a4;
- (HUNaturalLightingSetupModuleDelegate)delegate;
- (NSNumber)defaultSelectedValue;
- (id)_buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)commitSelectedItems;
- (id)filter;
- (id)itemProviders;
- (id)selectedItems;
- (void)setAccessoryItemProvider:(id)a3;
- (void)setDefaultSelectedValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHome:(id)a3;
- (void)setServiceGroupItemProvider:(id)a3;
- (void)setServiceItemProvider:(id)a3;
- (void)toggleSelectedForItem:(id)a3;
@end

@implementation HUNaturalLightingSetupModule

- (HUNaturalLightingSetupModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingSetupModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_home, a3);
  }

  return v9;
}

- (id)selectedItems
{
  v2 = [(HFItemModule *)self allItems];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_253);

  return v3;
}

uint64_t __45__HUNaturalLightingSetupModule_selectedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [v5 selected];
  }
  else
  {
    id v7 = [v3 latestResults];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    uint64_t v6 = [v8 BOOLValue];
  }
  return v6;
}

- (void)toggleSelectedForItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  objc_msgSend(v8, "setSelected:", objc_msgSend(v10, "BOOLValue") ^ 1);

  objc_super v11 = (void *)MEMORY[0x1E4F69230];
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  v13 = [v11 requestToUpdateItems:v12 senderSelector:a2];

  v14 = [(HFItemModule *)self itemUpdater];
  v15 = [v14 performItemUpdateRequest:v13];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__HUNaturalLightingSetupModule_toggleSelectedForItem___block_invoke;
  v17[3] = &unk_1E6389828;
  v17[4] = self;
  id v16 = (id)[v15 addCompletionBlock:v17];
}

void __54__HUNaturalLightingSetupModule_toggleSelectedForItem___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 selectedItems];
  [v4 naturalLanguageSetupModule:v2 didUpdateSelectedItems:v3];
}

- (id)commitSelectedItems
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUNaturalLightingSetupModule *)self home];
  id v5 = objc_msgSend(v4, "hf_allLightProfilesSupportingNaturalLighting");
  id v6 = [v3 setWithArray:v5];

  id v7 = [(HFItemModule *)self allItems];
  id v8 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_6_0);

  v9 = [(HUNaturalLightingSetupModule *)self selectedItems];
  v10 = objc_msgSend(v9, "na_flatMap:", &__block_literal_global_8_2);

  objc_super v11 = objc_msgSend(v8, "na_setByIntersectingWithSet:", v6);
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  v13 = [v11 allObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_3;
  v18[3] = &unk_1E6390FE8;
  id v19 = v10;
  id v14 = v10;
  v15 = objc_msgSend(v13, "na_map:", v18);
  id v16 = [v12 combineAllFutures:v15];

  return v16;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke(uint64_t a1, void *a2)
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

  id v6 = [v5 lightProfiles];

  return v6;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_2(uint64_t a1, void *a2)
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

  id v6 = [v5 lightProfiles];

  return v6;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_4;
  v8[3] = &unk_1E63877F8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 futureWithErrorOnlyHandlerAdapterBlock:v8];

  return v6;
}

void __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v2, "setNaturalLightingEnabled:completionHandler:", objc_msgSend(v3, "containsObject:", v2), v4);
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    id v4 = [(HUNaturalLightingSetupModule *)self _buildItemProviders];
    id v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HFItemModule *)self allItems];
  id v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);

  id v7 = objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_14_1);
  id v8 = (void *)MEMORY[0x1E4F69220];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v12[3] = &unk_1E6391030;
  v12[4] = self;
  id v9 = objc_msgSend(v7, "na_map:", v12);
  id v10 = [v8 filterSections:v9 toDisplayedItems:v4];

  return v10;
}

id __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
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

  id v6 = objc_msgSend(v5, "hf_parentRoom");
  id v7 = [v6 uniqueIdentifier];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;

  return v10;
}

id __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 home];
  id v9 = objc_msgSend(v8, "hf_roomWithIdentifier:", v7);

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F692E8]);
    objc_super v11 = [v9 uniqueIdentifier];
    v12 = [v11 UUIDString];
    v13 = (void *)[v10 initWithIdentifier:v12];

    id v14 = objc_msgSend(v9, "hf_displayName");
    [v13 setHeaderTitle:v14];

    v15 = [v5 allObjects];
    id v16 = [MEMORY[0x1E4F69220] defaultItemComparator];
    v17 = [v15 sortedArrayUsingComparator:v16];
    [v13 setItems:v17];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_buildItemProviders
{
  id v3 = [HUNaturalLightingItemProvider alloc];
  id v4 = [(HUNaturalLightingSetupModule *)self home];
  id v5 = [(HUNaturalLightingItemProvider *)v3 initWithHome:v4];

  id v6 = [(HUNaturalLightingSetupModule *)self filter];
  [(HUNaturalLightingItemProvider *)v5 setLightProfileFilter:v6];

  id v7 = [(HUNaturalLightingSetupModule *)self defaultSelectedValue];
  [(HUNaturalLightingItemProvider *)v5 setDefaultSelectedValue:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HUNaturalLightingSetupModule__buildItemProviders__block_invoke;
  v10[3] = &unk_1E6385F78;
  v10[4] = self;
  [(HUNaturalLightingItemProvider *)v5 setHomeKitObjectFilter:v10];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  return v8;
}

uint64_t __51__HUNaturalLightingSetupModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() showNaturalLightingContainingHomeKitObject:v2];

  return v3;
}

+ (BOOL)showNaturalLightingContainingHomeKitObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithSafeObject:", v6);
  if (!v9) {
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "hf_isVisibleAccessory") && (objc_msgSend(v9, "hf_isVisibleAsBridge") & 1) == 0)
  {
    uint64_t v12 = [v9 services];

    id v10 = (void *)v12;
LABEL_12:
    char v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_26_2);
    goto LABEL_13;
  }
  char v11 = 0;
LABEL_13:

  return v11;
}

uint64_t __75__HUNaturalLightingSetupModule_showNaturalLightingContainingHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

- (HUNaturalLightingSetupModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUNaturalLightingSetupModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSNumber)defaultSelectedValue
{
  return self->_defaultSelectedValue;
}

- (void)setDefaultSelectedValue:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
}

- (HFServiceGroupItemProvider)serviceGroupItemProvider
{
  return self->_serviceGroupItemProvider;
}

- (void)setServiceGroupItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroupItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_defaultSelectedValue, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end