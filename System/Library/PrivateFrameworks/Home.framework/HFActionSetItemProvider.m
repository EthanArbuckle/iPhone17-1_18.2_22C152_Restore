@interface HFActionSetItemProvider
- (BOOL)onlyShowsFavorites;
- (HFActionSetItemProvider)initWithHome:(id)a3;
- (HFActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4;
- (HFCharacteristicValueSource)overrideValueSource;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceLikeItem)serviceLikeItem;
- (HMHome)home;
- (HMRoom)room;
- (NSMutableSet)actionSetItems;
- (id)_favoriteFilter;
- (id)_roomFilter;
- (id)_showInHomeDashboardFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)actionSetItemStyle;
- (void)setActionSetItems:(id)a3;
- (void)setFilter:(id)a3;
- (void)setOnlyShowsFavorites:(BOOL)a3;
- (void)setOverrideValueSource:(id)a3;
- (void)setRoom:(id)a3;
- (void)setServiceLikeItem:(id)a3;
@end

@implementation HFActionSetItemProvider

- (NSMutableSet)actionSetItems
{
  return self->_actionSetItems;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFActionSetItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:@"actionSet"];

  return v3;
}

HFActionSetItem *__38__HFActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [HFActionSetItem alloc];
  uint64_t v6 = [WeakRetained actionSetItemStyle];
  v7 = [WeakRetained valueSource];
  v8 = [(HFActionSetItem *)v5 initWithActionSet:v3 actionSetItemStyle:v6 valueSource:v7];

  v9 = [WeakRetained serviceLikeItem];
  [(HFActionSetItem *)v8 setServiceLikeItem:v9];

  return v8;
}

- (HFCharacteristicValueSource)valueSource
{
  id v3 = [(HFActionSetItemProvider *)self overrideValueSource];

  if (v3)
  {
    v4 = [(HFActionSetItemProvider *)self overrideValueSource];
  }
  else
  {
    objc_super v5 = [(HFActionSetItemProvider *)self home];
    v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }
  return (HFCharacteristicValueSource *)v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

uint64_t __38__HFActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isAnonymous"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_super v5 = [v3 actions];
    if ([v5 count])
    {
      uint64_t v6 = [*(id *)(a1 + 32) _roomFilter];
      if (((unsigned int (**)(void, id))v6)[2](v6, v3))
      {
        v7 = [*(id *)(a1 + 32) _showInHomeDashboardFilter];
        uint64_t v4 = ((uint64_t (**)(void, id))v7)[2](v7, v3);
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

uint64_t __53__HFActionSetItemProvider__showInHomeDashboardFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) onlyShowsFavorites]) {
    uint64_t v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __38__HFActionSetItemProvider__roomFilter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v31 = 1;
    goto LABEL_37;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  objc_super v5 = [v3 actions];
  uint64_t v41 = [v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v41)
  {
    uint64_t v31 = 0;
    goto LABEL_36;
  }
  uint64_t v6 = *(void *)v51;
  v38 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      if (*(void *)v51 != v6) {
        objc_enumerationMutation(v5);
      }
      v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [v8 characteristic];
        v10 = [v9 service];

        v11 = *(void **)(a1 + 32);
        v12 = [v10 accessory];
        v13 = [v12 room];
        v14 = [v13 uniqueIdentifier];
        LOBYTE(v11) = [v11 isEqual:v14];

        if (v11)
        {
          uint64_t v31 = 1;
LABEL_34:
          uint64_t v4 = v38;
          goto LABEL_36;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v8;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v16 = [v15 mediaProfiles];
          uint64_t v37 = [v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v37)
          {
            uint64_t v17 = *(void *)v47;
            v39 = v16;
            v40 = v5;
            uint64_t v35 = v6;
            id v36 = v15;
            uint64_t v34 = *(void *)v47;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v16);
                }
                v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                v20 = objc_msgSend(v19, "accessories", v34, v35);
                uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v54 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v43;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v22; ++j)
                    {
                      if (*(void *)v43 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      v25 = *(void **)(a1 + 32);
                      v26 = [*(id *)(*((void *)&v42 + 1) + 8 * j) room];
                      v27 = [v26 uniqueIdentifier];
                      LOBYTE(v25) = [v25 isEqual:v27];

                      if (v25)
                      {
                        uint64_t v31 = 1;
                        v28 = v39;
                        objc_super v5 = v40;
                        v29 = v36;
                        goto LABEL_33;
                      }
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v54 count:16];
                    if (v22) {
                      continue;
                    }
                    break;
                  }
                }

                ++v18;
                v16 = v39;
                objc_super v5 = v40;
                uint64_t v17 = v34;
                uint64_t v6 = v35;
              }
              while (v18 != v37);
              id v15 = v36;
              uint64_t v37 = [v39 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v37);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = [v8 commands];
            v33 = [v32 firstObject];
            v29 = [v33 accessory];

            v28 = [v29 room];
            v20 = [v28 uniqueIdentifier];
            uint64_t v31 = [v20 isEqual:*(void *)(a1 + 32)];
LABEL_33:

            goto LABEL_34;
          }
        }
      }
    }
    uint64_t v31 = 0;
    uint64_t v4 = v38;
    uint64_t v41 = [v5 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v41) {
      continue;
    }
    break;
  }
LABEL_36:

LABEL_37:
  return v31;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (id)_showInHomeDashboardFilter
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HFActionSetItemProvider__showInHomeDashboardFilter__block_invoke;
  aBlock[3] = &unk_26408FD50;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_roomFilter
{
  v2 = [(HFActionSetItemProvider *)self room];
  id v3 = [v2 uniqueIdentifier];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__HFActionSetItemProvider__roomFilter__block_invoke;
  aBlock[3] = &unk_26408E348;
  id v9 = v3;
  id v4 = v3;
  objc_super v5 = _Block_copy(aBlock);
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFActionSetItemProvider;
  v8 = [(HFItemProvider *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    actionSetItems = v9->_actionSetItems;
    v9->_actionSetItems = (NSMutableSet *)v10;

    v9->_actionSetItemStyle = a4;
  }

  return v9;
}

- (void)setFilter:(id)a3
{
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v15, &location);
  id v3 = _Block_copy(aBlock);
  id v4 = [(HFActionSetItemProvider *)self home];
  objc_super v5 = [v4 actionSets];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke_2;
  v13[3] = &unk_26408E348;
  v13[4] = self;
  uint64_t v6 = objc_msgSend(v5, "na_filter:", v13);

  id v7 = [(HFActionSetItemProvider *)self filter];
  v8 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v6 filter:v7 itemMap:v3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, &location);
  id v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

- (id)filter
{
  return self->_filter;
}

- (void)setRoom:(id)a3
{
}

id __38__HFActionSetItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained actionSetItems];
  uint64_t v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained actionSetItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (HFActionSetItemProvider)initWithHome:(id)a3
{
  return [(HFActionSetItemProvider *)self initWithHome:a3 actionSetItemStyle:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  objc_super v5 = [(HFActionSetItemProvider *)self home];
  uint64_t v6 = objc_msgSend(v4, "initWithHome:actionSetItemStyle:", v5, -[HFActionSetItemProvider actionSetItemStyle](self, "actionSetItemStyle"));

  return v6;
}

- (void)setServiceLikeItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_serviceLikeItem, a3);
  uint64_t v6 = [(HFActionSetItemProvider *)self actionSetItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__HFActionSetItemProvider_setServiceLikeItem___block_invoke;
  v8[3] = &unk_26408FD00;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "na_each:", v8);
}

uint64_t __46__HFActionSetItemProvider_setServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setServiceLikeItem:*(void *)(a1 + 32)];
}

- (id)_favoriteFilter
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFActionSetItemProvider__favoriteFilter__block_invoke;
  aBlock[3] = &unk_26408FD28;
  void aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

uint64_t __42__HFActionSetItemProvider__favoriteFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) onlyShowsFavorites]) {
    uint64_t v4 = objc_msgSend(v3, "hf_effectiveIsFavorite");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void)setActionSetItems:(id)a3
{
}

- (void)setOverrideValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_actionSetItems, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end