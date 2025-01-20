@interface HFZoneModule
- (BOOL)canExpand;
- (BOOL)isExpanded;
- (BOOL)toggleExpansion;
- (HFCurrentZonesItem)currentZoneItem;
- (HFItem)createNewZoneItem;
- (HFStaticItemProvider)createNewZoneItemProvider;
- (HFStaticItemProvider)currentZoneItemProvider;
- (HFStaticItemProvider)expandedItemProvider;
- (HFZoneItemProvider)zoneItemProvider;
- (HFZoneModule)initWithItemUpdater:(id)a3 room:(id)a4;
- (HFZoneSuggestionItemProvider)zoneSuggestionItemProvider;
- (HMRoom)room;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)_reloadItemProviders;
- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5;
- (void)home:(id)a3 didAddZone:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5;
- (void)home:(id)a3 didRemoveZone:(id)a4;
- (void)home:(id)a3 didUpdateNameForZone:(id)a4;
- (void)setCreateNewZoneItem:(id)a3;
- (void)setCreateNewZoneItemProvider:(id)a3;
- (void)setCurrentZoneItemProvider:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedItemProvider:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setZoneItemProvider:(id)a3;
- (void)setZoneSuggestionItemProvider:(id)a3;
@end

@implementation HFZoneModule

- (HFZoneModule)initWithItemUpdater:(id)a3 room:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HFZoneModule;
  v8 = [(HFItemModule *)&v26 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_room, a4);
    v10 = [HFZoneItemProvider alloc];
    v11 = [v7 home];
    uint64_t v12 = [(HFZoneItemProvider *)v10 initWithHome:v11];
    zoneItemProvider = v9->_zoneItemProvider;
    v9->_zoneItemProvider = (HFZoneItemProvider *)v12;

    v14 = [HFZoneSuggestionItemProvider alloc];
    v15 = [v7 home];
    uint64_t v16 = [(HFZoneSuggestionItemProvider *)v14 initWithHome:v15];
    zoneSuggestionItemProvider = v9->_zoneSuggestionItemProvider;
    v9->_zoneSuggestionItemProvider = (HFZoneSuggestionItemProvider *)v16;

    v18 = [[HFCurrentZonesItem alloc] initWithRoom:v7];
    currentZoneItem = v9->_currentZoneItem;
    v9->_currentZoneItem = v18;

    v20 = [HFStaticItemProvider alloc];
    v21 = [MEMORY[0x263EFFA08] setWithObject:v9->_currentZoneItem];
    uint64_t v22 = [(HFStaticItemProvider *)v20 initWithItems:v21];
    currentZoneItemProvider = v9->_currentZoneItemProvider;
    v9->_currentZoneItemProvider = (HFStaticItemProvider *)v22;

    v24 = +[HFHomeKitDispatcher sharedDispatcher];
    [v24 addHomeObserver:v9];
  }
  return v9;
}

- (NSSet)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    objc_initWeak(location, self);
    v5 = [(HFZoneModule *)self room];
    v6 = [HFStaticItem alloc];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __29__HFZoneModule_itemProviders__block_invoke;
    v33[3] = &unk_264094858;
    objc_copyWeak(&v35, location);
    id v7 = v5;
    id v34 = v7;
    v8 = [(HFStaticItem *)v6 initWithResultsBlock:v33];
    [(HFZoneModule *)self setCreateNewZoneItem:v8];

    v9 = [HFStaticItemProvider alloc];
    v10 = (void *)MEMORY[0x263EFFA08];
    v11 = [(HFZoneModule *)self createNewZoneItem];
    uint64_t v12 = [v10 setWithObject:v11];
    v13 = [(HFStaticItemProvider *)v9 initWithItems:v12];
    [(HFZoneModule *)self setCreateNewZoneItemProvider:v13];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__HFZoneModule_itemProviders__block_invoke_2;
    aBlock[3] = &unk_2640948A8;
    objc_copyWeak(&v32, location);
    id v14 = v7;
    id v31 = v14;
    v15 = _Block_copy(aBlock);
    uint64_t v16 = [HFTransformItemProvider alloc];
    v17 = [(HFZoneModule *)self zoneItemProvider];
    v18 = [(HFTransformItemProvider *)v16 initWithSourceProvider:v17 transformationBlock:v15];

    v19 = [HFTransformItemProvider alloc];
    v20 = [(HFZoneModule *)self zoneSuggestionItemProvider];
    v21 = [(HFTransformItemProvider *)v19 initWithSourceProvider:v20 transformationBlock:v15];

    uint64_t v22 = [HFTransformItemProvider alloc];
    v23 = [(HFZoneModule *)self currentZoneItemProvider];
    v24 = [(HFTransformItemProvider *)v22 initWithSourceProvider:v23 transformationBlock:v15];

    v25 = (void *)MEMORY[0x263EFFA08];
    objc_super v26 = [(HFZoneModule *)self createNewZoneItemProvider];
    objc_msgSend(v25, "setWithObjects:", v18, v21, v26, v24, 0);
    v27 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v28 = self->_itemProviders;
    self->_itemProviders = v27;

    v3 = self->_itemProviders;
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);
  }
  return v3;
}

id __29__HFZoneModule_itemProviders__block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x263F58190];
  v13[0] = @"title";
  uint64_t v4 = 1;
  v5 = _HFLocalizedStringWithDefaultValue(@"HFZoneModuleCreateNew", @"HFZoneModuleCreateNew", 1);
  v14[0] = v5;
  v13[1] = @"titlePlaceholder";
  v6 = _HFLocalizedStringWithDefaultValue(@"HFZoneModuleCreateNewPlaceholder", @"HFZoneModuleCreateNewPlaceholder", 1);
  v14[1] = v6;
  v13[2] = @"hidden";
  id v7 = NSNumber;
  v8 = [*(id *)(a1 + 32) home];
  if (objc_msgSend(v8, "hf_currentUserIsAdministrator")) {
    uint64_t v4 = [WeakRetained isExpanded] ^ 1;
  }
  v9 = [v7 numberWithInt:v4];
  v14[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v11 = [v3 futureWithResult:v10];

  return v11;
}

_HFDeletableTransformItem *__29__HFZoneModule_itemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [_HFDeletableTransformItem alloc];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneModule_itemProviders__block_invoke_3;
  v8[3] = &unk_264094880;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  v6 = [(HFTransformItem *)v4 initWithSourceItem:v5 transformationBlock:v8];

  objc_destroyWeak(&v11);
  return v6;
}

id __29__HFZoneModule_itemProviders__block_invoke_3(id *a1, void *a2)
{
  id v3 = a1 + 6;
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)[v4 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isExpanded"));
    [v6 setObject:v7 forKeyedSubscript:@"hidden"];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [a1[4] zone];
    id v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [v8 rooms];
    id v7 = [v9 setWithArray:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    v8 = [a1[4] zoneBuilder];
    id v7 = [v8 rooms];
  }

LABEL_9:
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "containsObject:", a1[5]));
  [v6 setObject:v11 forKeyedSubscript:@"selected"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(WeakRetained, "isExpanded") ^ 1);
  [v6 setObject:v12 forKeyedSubscript:@"hidden"];

LABEL_10:
  v13 = [a1[5] home];
  char v14 = objc_msgSend(v13, "hf_currentUserIsAdministrator");

  if ((v14 & 1) == 0)
  {
    id v15 = a1[4];
    id v16 = [WeakRetained currentZoneItem];

    if (v15 != v16) {
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isDisabled"];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (id v17 = a1[4],
          [WeakRetained createNewZoneItem],
          id v18 = (id)objc_claimAutoreleasedReturnValue(),
          v18,
          v17 == v18))
    {
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"selected"];
  }

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_96);
    v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_201_0);
    id v7 = [v6 allObjects];
    v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_204];

    id v9 = objc_msgSend(v5, "na_filter:", &__block_literal_global_206_0);
    id v10 = [v9 allObjects];
    id v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_209];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_6;
    v21[3] = &unk_264094910;
    v21[4] = self;
    uint64_t v12 = objc_msgSend(v5, "na_firstObjectPassingTest:", v21);
    v13 = objc_opt_new();
    objc_msgSend(v13, "na_safeAddObject:", v12);
    [v13 addObjectsFromArray:v8];
    [v13 addObjectsFromArray:v11];
    char v14 = [(HFZoneModule *)self createNewZoneItem];
    int v15 = [v4 containsObject:v14];

    if (v15)
    {
      id v16 = [(HFZoneModule *)self createNewZoneItem];
      objc_msgSend(v13, "na_safeAddObject:", v16);
    }
    if ([v13 count])
    {
      id v17 = [(HFItemSection *)[HFMutableItemSection alloc] initWithIdentifier:@"ZONE_SECTION"];
      [(HFItemSection *)v17 setItems:v13];
      id v18 = _HFLocalizedStringWithDefaultValue(@"HF_SERVICE_DETAILS_ZONE_FOOTER", @"HF_SERVICE_DETAILS_ZONE_FOOTER", 1);
      [(HFItemSection *)v17 setFooterTitle:v18];

      v22[0] = v17;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    }
    else
    {
      v19 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x263EFFA68];
  }

  return v19;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  v6 = [v5 objectForKey:@"title"];
  id v7 = [v4 latestResults];

  v8 = [v7 objectForKey:@"title"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  v6 = [v5 objectForKey:@"title"];
  id v7 = [v4 latestResults];

  v8 = [v7 objectForKey:@"title"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

BOOL __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 sourceItem];
  id v4 = [*(id *)(a1 + 32) currentZoneItem];
  BOOL v5 = v3 == v4;

  return v5;
}

- (BOOL)toggleExpansion
{
  [(HFZoneModule *)self setExpanded:[(HFZoneModule *)self isExpanded] ^ 1];
  return [(HFZoneModule *)self isExpanded];
}

- (BOOL)canExpand
{
  id v3 = [(HFZoneModule *)self zoneItemProvider];
  id v4 = [v3 home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (v5) {
    return 1;
  }
  id v7 = [(HFZoneModule *)self room];
  v8 = objc_msgSend(v7, "hf_allZones");
  BOOL v6 = (unint64_t)[v8 count] > 1;

  return v6;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HFZoneModule *)self canExpand] && self->_expanded != v3)
  {
    self->_expanded = v3;
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)_reloadItemProviders
{
  id v4 = [(HFZoneModule *)self itemProviders];
  id v7 = +[HFItemUpdateRequest requestToReloadItemProviders:v4 senderSelector:a2];

  char v5 = [(HFItemModule *)self itemUpdater];
  id v6 = (id)[v5 performItemUpdateRequest:v7];
}

- (void)home:(id)a3 didAddZone:(id)a4
{
  char v5 = objc_msgSend(a4, "rooms", a3);
  id v6 = [(HFZoneModule *)self room];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  char v5 = objc_msgSend(a4, "rooms", a3);
  id v6 = [(HFZoneModule *)self room];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)home:(id)a3 didUpdateNameForZone:(id)a4
{
  char v5 = objc_msgSend(a4, "rooms", a3);
  id v6 = [(HFZoneModule *)self room];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  id v6 = a4;
  int v7 = [(HFZoneModule *)self room];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5
{
  id v6 = a4;
  int v7 = [(HFZoneModule *)self room];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    [(HFZoneModule *)self _reloadItemProviders];
  }
}

- (void)setItemProviders:(id)a3
{
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCurrentZonesItem)currentZoneItem
{
  return self->_currentZoneItem;
}

- (HFItem)createNewZoneItem
{
  return self->_createNewZoneItem;
}

- (void)setCreateNewZoneItem:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (HFStaticItemProvider)expandedItemProvider
{
  return self->_expandedItemProvider;
}

- (void)setExpandedItemProvider:(id)a3
{
}

- (HFStaticItemProvider)createNewZoneItemProvider
{
  return self->_createNewZoneItemProvider;
}

- (void)setCreateNewZoneItemProvider:(id)a3
{
}

- (HFStaticItemProvider)currentZoneItemProvider
{
  return self->_currentZoneItemProvider;
}

- (void)setCurrentZoneItemProvider:(id)a3
{
}

- (HFZoneItemProvider)zoneItemProvider
{
  return self->_zoneItemProvider;
}

- (void)setZoneItemProvider:(id)a3
{
}

- (HFZoneSuggestionItemProvider)zoneSuggestionItemProvider
{
  return self->_zoneSuggestionItemProvider;
}

- (void)setZoneSuggestionItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSuggestionItemProvider, 0);
  objc_storeStrong((id *)&self->_zoneItemProvider, 0);
  objc_storeStrong((id *)&self->_currentZoneItemProvider, 0);
  objc_storeStrong((id *)&self->_createNewZoneItemProvider, 0);
  objc_storeStrong((id *)&self->_expandedItemProvider, 0);
  objc_storeStrong((id *)&self->_createNewZoneItem, 0);
  objc_storeStrong((id *)&self->_currentZoneItem, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end