@interface HUServiceGridItemManager
- (BOOL)shouldGroupByRoom;
- (BOOL)shouldShowSectionHeaders;
- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5;
- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 shouldShowSectionHeaders:(BOOL)a5 itemProvidersCreator:(id)a6;
- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_roomComparator;
- (id)_roomForItem:(id)a3;
- (id)itemProvidersCreator;
- (int64_t)actionSetSectionIndex;
- (void)setActionSetSectionIndex:(int64_t)a3;
- (void)setItemProvidersCreator:(id)a3;
- (void)setShouldGroupByRoom:(BOOL)a3;
- (void)setShouldShowSectionHeaders:(BOOL)a3;
@end

@implementation HUServiceGridItemManager

- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_sourceItem_shouldGroupByRoom_shouldShowSectionHeaders_itemProvidersCreator_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceGridItemManager.m", 26, @"%s is unavailable; use %@ instead",
    "-[HUServiceGridItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  return [(HUServiceGridItemManager *)self initWithDelegate:a3 shouldGroupByRoom:a4 shouldShowSectionHeaders:1 itemProvidersCreator:a5];
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 shouldShowSectionHeaders:(BOOL)a5 itemProvidersCreator:(id)a6
{
  return [(HUServiceGridItemManager *)self initWithDelegate:a3 sourceItem:0 shouldGroupByRoom:a4 shouldShowSectionHeaders:a5 itemProvidersCreator:a6];
}

- (HUServiceGridItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HUServiceGridItemManager;
  v13 = [(HFItemManager *)&v16 initWithDelegate:a3 sourceItem:a4];
  v14 = v13;
  if (v13)
  {
    [(HUServiceGridItemManager *)v13 setItemProvidersCreator:v12];
    v14->_shouldGroupByRoom = a5;
    v14->_shouldShowSectionHeaders = a6;
  }

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = [(HUServiceGridItemManager *)self itemProvidersCreator];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v48 = (id)objc_opt_new();
  v5 = objc_opt_new();
  table = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v6 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = *(id *)v55;
    unint64_t v11 = 0x1E4F68000uLL;
    obuint64_t j = *(id *)v55;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(id *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = v5;
LABEL_13:
          [v14 addObject:v13];
          continue;
        }
        if (![(HUServiceGridItemManager *)self shouldGroupByRoom])
        {
          v14 = v6;
          goto LABEL_13;
        }
        unint64_t v15 = v11;
        objc_super v16 = v6;
        id v17 = v7;
        v18 = v5;
        v19 = [(HUServiceGridItemManager *)self _roomForItem:v13];
        v20 = [(NSMapTable *)table objectForKey:v19];
        if (!v20)
        {
          v20 = objc_opt_new();
          [(NSMapTable *)table setObject:v20 forKey:v19];
        }
        [v20 addObject:v13];

        v5 = v18;
        id v7 = v17;
        v6 = v16;
        unint64_t v11 = v15;
        id v10 = obj;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUServiceGridActionSetsSectionIdentifier"];
    if ([(HUServiceGridItemManager *)self shouldShowSectionHeaders])
    {
      v22 = _HULocalizedStringWithDefaultValue(@"HUGridScenesSectionTitle", @"HUGridScenesSectionTitle", 1);
      [v21 setHeaderTitle:v22];
    }
    else
    {
      [v21 setHeaderTitle:0];
    }
    v23 = [v21 identifier];
    v24 = [(HFItemManager *)self _sortedItems:v5 forSectionIdentifier:v23];
    [v21 setItems:v24];

    [v48 addObject:v21];
    -[HUServiceGridItemManager setActionSetSectionIndex:](self, "setActionSetSectionIndex:", [v48 count] - 1);
  }
  if ([(HUServiceGridItemManager *)self shouldGroupByRoom])
  {
    v25 = NSAllMapTableKeys(table);
    if ([v25 count])
    {
      v45 = v5;
      v26 = [(HUServiceGridItemManager *)self _roomComparator];
      v44 = v25;
      v27 = [v25 sortedArrayUsingComparator:v26];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obja = v27;
      uint64_t v28 = [obja countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v51 != v30) {
              objc_enumerationMutation(obja);
            }
            v32 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            id v33 = objc_alloc(MEMORY[0x1E4F692E8]);
            v34 = [v32 uniqueIdentifier];
            v35 = [v34 UUIDString];
            v36 = (void *)[v33 initWithIdentifier:v35];

            if ([(HUServiceGridItemManager *)self shouldShowSectionHeaders])
            {
              v37 = [v32 name];
              [v36 setHeaderTitle:v37];
            }
            else
            {
              [v36 setHeaderTitle:0];
            }
            v38 = [(NSMapTable *)table objectForKey:v32];
            v39 = [v36 identifier];
            v40 = [(HFItemManager *)self _sortedItems:v38 forSectionIdentifier:v39];
            [v36 setItems:v40];

            [v48 addObject:v36];
          }
          uint64_t v29 = [obja countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v29);
      }

      v25 = v44;
      v5 = v45;
    }
  }
  else
  {
    if (![v6 count]) {
      goto LABEL_37;
    }
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUServiceGridAllServicesSectionIdentifier"];
    v41 = [v25 identifier];
    v42 = [(HFItemManager *)self _sortedItems:v6 forSectionIdentifier:v41];
    [v25 setItems:v42];

    [v48 addObject:v25];
  }

LABEL_37:

  return v48;
}

- (id)_itemsToHideInSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HUServiceGridItemManager;
  v5 = [(HFItemManager *)&v22 _itemsToHideInSet:v4];
  v6 = (void *)[v5 mutableCopy];

  id v7 = [(HFItemManager *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v15 = [(HFItemManager *)self delegate];
          int v16 = [v15 serviceGridItemManager:self shouldHideItem:v14];

          if (v16) {
            [v6 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }

  return v6;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return &__block_literal_global_102;
}

uint64_t __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(v4);
  uint64_t v7 = __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(v5);
  char v8 = (void *)v7;
  if (!v6 || !v7) {
    goto LABEL_7;
  }
  id v9 = [v6 matterEndpointID];
  uint64_t v10 = [v8 matterEndpointID];
  uint64_t v11 = v10;
  if (!v9 || !v10)
  {

LABEL_7:
    id v9 = [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v12 = ((uint64_t (**)(void, id, id))v9)[2](v9, v4, v5);
    goto LABEL_8;
  }
  uint64_t v12 = [v9 compare:v10];

LABEL_8:
  return v12;
}

id __60__HUServiceGridItemManager__comparatorForSectionIdentifier___block_invoke_2(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1F1A3D460]) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;
  id v4 = [v3 services];

  id v5 = [v4 anyObject];

  return v5;
}

- (id)_roomComparator
{
  v2 = [(HFItemManager *)self home];
  id v3 = objc_msgSend(v2, "hf_dashboardSectionReorderableHomeKitObjectComparator");

  return v3;
}

- (id)_roomForItem:(id)a3
{
  id v4 = [a3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];

  if (!v5
    || ([(HFItemManager *)self home],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "hf_roomWithIdentifier:", v5),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    char v8 = [(HFItemManager *)self home];
    uint64_t v7 = [v8 roomForEntireHome];
  }

  return v7;
}

- (BOOL)shouldGroupByRoom
{
  return self->_shouldGroupByRoom;
}

- (void)setShouldGroupByRoom:(BOOL)a3
{
  self->_shouldGroupByRoom = a3;
}

- (BOOL)shouldShowSectionHeaders
{
  return self->_shouldShowSectionHeaders;
}

- (void)setShouldShowSectionHeaders:(BOOL)a3
{
  self->_shouldShowSectionHeaders = a3;
}

- (int64_t)actionSetSectionIndex
{
  return self->_actionSetSectionIndex;
}

- (void)setActionSetSectionIndex:(int64_t)a3
{
  self->_actionSetSectionIndex = a3;
}

- (id)itemProvidersCreator
{
  return self->_itemProvidersCreator;
}

- (void)setItemProvidersCreator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end