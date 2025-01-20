@interface HUSideBarItemManager
- (HFAccessoryCategoryStatusItemProvider)categoryItemProvider;
- (HFReorderableHomeKitItemList)reorderableRoomList;
- (HFRoomItemProvider)roomItemProvider;
- (HFStaticItemProvider)staticItemProvider;
- (HUSideBarItemManager)initWithDelegate:(id)a3;
- (HUSideBarStaticItem)automationItem;
- (HUSideBarStaticItem)discoverItem;
- (HUSideBarStaticItem)homeItem;
- (NSDictionary)discoverContentAvailabilityDictionary;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)allItems;
- (id)categoryItemForCategory:(id)a3;
- (id)roomItemForRoom:(id)a3;
- (id)sortedCategoryItems;
- (id)sortedRoomItems;
- (void)setAutomationItem:(id)a3;
- (void)setCategoryItemProvider:(id)a3;
- (void)setDiscoverContentAvailabilityDictionary:(id)a3;
- (void)setDiscoverItem:(id)a3;
- (void)setHomeItem:(id)a3;
- (void)setReorderableRoomList:(id)a3;
- (void)setRoomItemProvider:(id)a3;
- (void)setStaticItemProvider:(id)a3;
@end

@implementation HUSideBarItemManager

- (HUSideBarItemManager)initWithDelegate:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUSideBarItemManager;
  v3 = [(HFItemManager *)&v15 initWithDelegate:a3];
  if (v3)
  {
    v4 = [[HUSideBarStaticItem alloc] initWithSideBarStaticItemType:0];
    homeItem = v3->_homeItem;
    v3->_homeItem = v4;

    v6 = [[HUSideBarStaticItem alloc] initWithSideBarStaticItemType:1];
    automationItem = v3->_automationItem;
    v3->_automationItem = v6;

    v8 = [[HUSideBarStaticItem alloc] initWithSideBarStaticItemType:2];
    discoverItem = v3->_discoverItem;
    v3->_discoverItem = v8;

    id v10 = objc_alloc(MEMORY[0x1E4F695C8]);
    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v3->_homeItem, v3->_automationItem, v3->_discoverItem, 0);
    uint64_t v12 = [v10 initWithItems:v11];
    staticItemProvider = v3->_staticItemProvider;
    v3->_staticItemProvider = (HFStaticItemProvider *)v12;
  }
  return v3;
}

- (id)roomItemForRoom:(id)a3
{
  id v4 = a3;
  v5 = [(HUSideBarItemManager *)self roomItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__HUSideBarItemManager_roomItemForRoom___block_invoke;
  v10[3] = &unk_1E6389CC0;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __40__HUSideBarItemManager_roomItemForRoom___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 room];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)categoryItemForCategory:(id)a3
{
  id v4 = a3;
  v5 = [(HUSideBarItemManager *)self categoryItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HUSideBarItemManager_categoryItemForCategory___block_invoke;
  v10[3] = &unk_1E6389CE8;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __48__HUSideBarItemManager_categoryItemForCategory___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accessoryTypeGroup];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HUSideBarItemManager;
  id v7 = [(HFItemManager *)&v31 _itemsToHideInSet:v6];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(HFItemManager *)self home];
  char v10 = objc_msgSend(v9, "hf_hasAnyVisibleTriggers");
  if (v10)
  {
    int v11 = 0;
  }
  else
  {
    v3 = [(HFItemManager *)self home];
    if (objc_msgSend(v3, "hf_userCanCreateTrigger") & 1) != 0 || (HFForceAllowAutomationCreation())
    {
      int v11 = 0;
    }
    else
    {
      uint64_t v4 = [(HFItemManager *)self home];
      if ((objc_msgSend(v4, "hf_userIsAllowedToCreateTrigger") & 1) == 0
        && ([MEMORY[0x1E4F69758] isRunningInStoreDemoMode] & 1) == 0
        && ([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) == 0)
      {

        goto LABEL_12;
      }
      int v11 = 1;
    }
  }
  uint64_t v12 = [(HFItemManager *)self home];
  int v13 = objc_msgSend(v12, "hf_shouldBlockCurrentUserFromHome");

  if (v11) {
  if ((v10 & 1) == 0)
  }
  {

    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (v13)
  {
LABEL_12:
    v14 = [(HUSideBarItemManager *)self automationItem];
    [v8 addObject:v14];
  }
LABEL_13:
  objc_super v15 = [(HUSideBarItemManager *)self discoverContentAvailabilityDictionary];
  if (v15)
  {
    v16 = [(HFItemManager *)self home];
    int v17 = objc_msgSend(v16, "hf_shouldBlockCurrentUserFromHome");
  }
  else
  {
    int v17 = 1;
  }

  v18 = [(HFItemManager *)self home];
  char v19 = objc_msgSend(v18, "hf_currentUserIsRestrictedGuest");

  if ((v19 & 1) != 0 || v17)
  {
    v20 = [(HUSideBarItemManager *)self discoverItem];
    [v8 addObject:v20];
  }
  v21 = [(HFItemManager *)self home];
  int v22 = objc_msgSend(v21, "hf_currentUserIsRestrictedGuest");

  if (v22)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __42__HUSideBarItemManager__itemsToHideInSet___block_invoke;
    v29[3] = &unk_1E6389D10;
    v29[4] = self;
    id v30 = v8;
    objc_msgSend(v6, "na_each:", v29);
  }
  v23 = [(HFItemManager *)self home];
  v24 = [v23 accessories];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __42__HUSideBarItemManager__itemsToHideInSet___block_invoke_2;
    v27[3] = &unk_1E6389D10;
    v27[4] = self;
    id v28 = v8;
    objc_msgSend(v6, "na_each:", v27);
  }

  return v8;
}

void __42__HUSideBarItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) home];
    char v8 = objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome");
  }
  else
  {
    char v8 = 0;
  }
  objc_opt_class();
  id v11 = v4;
  if (objc_opt_isKindOfClass()) {
    v9 = v11;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if ((v8 & 1) != 0 || v10) {
    [*(id *)(a1 + 40) addObject:v11];
  }
}

void __42__HUSideBarItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v10;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 room];
    id v7 = [*(id *)(a1 + 32) home];
    char v8 = [v7 roomForEntireHome];
    int v9 = [v6 isEqual:v8];

    if (v9) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F69488]) initWithHome:v4];
  [(HUSideBarItemManager *)self setRoomItemProvider:v5];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__HUSideBarItemManager__buildItemProvidersForHome___block_invoke;
  v19[3] = &unk_1E6385F78;
  id v20 = v4;
  id v6 = v4;
  id v7 = [(HUSideBarItemManager *)self roomItemProvider];
  [v7 setFilter:v19];

  char v8 = objc_msgSend(v6, "hf_reorderableRoomsList");
  [(HUSideBarItemManager *)self setReorderableRoomList:v8];

  int v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = [(HUSideBarItemManager *)self staticItemProvider];
  id v11 = [(HUSideBarItemManager *)self roomItemProvider];
  uint64_t v12 = objc_msgSend(v9, "arrayWithObjects:", v10, v11, 0);

  int v13 = [MEMORY[0x1E4F695F0] getAvailabilityDictionary];
  [(HUSideBarItemManager *)self setDiscoverContentAvailabilityDictionary:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F68DD0]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F69360]);
  v16 = (void *)[v14 initWithHome:v6 room:0 overrideValueSource:v15];
  [(HUSideBarItemManager *)self setCategoryItemProvider:v16];

  int v17 = [(HUSideBarItemManager *)self categoryItemProvider];
  [v12 addObject:v17];

  return v12;
}

uint64_t __51__HUSideBarItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_shouldBlockCurrentUserFromHome") ^ 1;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"home"];
  id v7 = [(HUSideBarItemManager *)self homeItem];
  char v8 = [(HUSideBarItemManager *)self automationItem];
  v21[1] = v8;
  uint64_t v9 = [(HUSideBarItemManager *)self discoverItem];
  v21[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  [v6 setItems:v10];

  [v5 addObject:v6];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"category"];
  uint64_t v12 = [(HUSideBarItemManager *)self sortedCategoryItems];
  [v11 setItems:v12];

  int v13 = _HULocalizedStringWithDefaultValue(@"HUSideBarCategorySectionTitle", @"HUSideBarCategorySectionTitle", 1);
  [v11 setHeaderTitle:v13];

  id v14 = [(HFItemManager *)self home];
  LOBYTE(v9) = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

  if ((v9 & 1) == 0) {
    [v5 addObject:v11];
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"room"];
  v16 = [(HUSideBarItemManager *)self sortedRoomItems];
  [v15 setItems:v16];

  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HURoomSectionTitle", @"HURoomSectionTitle", 1);
  [v15 setHeaderTitle:v17];

  v18 = [(HFItemManager *)self home];
  LOBYTE(v17) = objc_msgSend(v18, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if ((v17 & 1) == 0) {
    [v5 addObject:v15];
  }
  char v19 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v19;
}

- (id)allItems
{
  v2 = [(HFItemManager *)self itemProviders];
  id v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_92);

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return v4;
}

id __32__HUSideBarItemManager_allItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 items];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)sortedRoomItems
{
  id v3 = [(HUSideBarItemManager *)self roomItemProvider];
  id v4 = [v3 items];
  id v5 = [v4 allObjects];
  id v6 = [(HFItemManager *)self home];
  id v7 = objc_msgSend(v6, "hf_dashboardSectionReorderableItemComparator");
  if (v7)
  {
    char v8 = [v5 sortedArrayUsingComparator:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F69220] defaultItemComparator];
    char v8 = [v5 sortedArrayUsingComparator:v9];
  }

  return v8;
}

- (id)sortedCategoryItems
{
  id v3 = [(HUSideBarItemManager *)self categoryItemProvider];
  id v4 = [v3 items];
  id v5 = [v4 allObjects];
  id v6 = [(HFItemManager *)self home];
  id v7 = objc_msgSend(v6, "hf_accessoryCategoriesReorderableItemComparator");
  if (v7)
  {
    char v8 = [v5 sortedArrayUsingComparator:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F69220] defaultItemComparator];
    char v8 = [v5 sortedArrayUsingComparator:v9];
  }

  return v8;
}

- (HUSideBarStaticItem)homeItem
{
  return self->_homeItem;
}

- (void)setHomeItem:(id)a3
{
}

- (HUSideBarStaticItem)automationItem
{
  return self->_automationItem;
}

- (void)setAutomationItem:(id)a3
{
}

- (HUSideBarStaticItem)discoverItem
{
  return self->_discoverItem;
}

- (void)setDiscoverItem:(id)a3
{
}

- (HFReorderableHomeKitItemList)reorderableRoomList
{
  return self->_reorderableRoomList;
}

- (void)setReorderableRoomList:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HFRoomItemProvider)roomItemProvider
{
  return self->_roomItemProvider;
}

- (void)setRoomItemProvider:(id)a3
{
}

- (HFAccessoryCategoryStatusItemProvider)categoryItemProvider
{
  return self->_categoryItemProvider;
}

- (void)setCategoryItemProvider:(id)a3
{
}

- (NSDictionary)discoverContentAvailabilityDictionary
{
  return self->_discoverContentAvailabilityDictionary;
}

- (void)setDiscoverContentAvailabilityDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverContentAvailabilityDictionary, 0);
  objc_storeStrong((id *)&self->_categoryItemProvider, 0);
  objc_storeStrong((id *)&self->_roomItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_reorderableRoomList, 0);
  objc_storeStrong((id *)&self->_discoverItem, 0);
  objc_storeStrong((id *)&self->_automationItem, 0);

  objc_storeStrong((id *)&self->_homeItem, 0);
}

@end