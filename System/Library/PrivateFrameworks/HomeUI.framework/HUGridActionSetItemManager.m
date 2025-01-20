@interface HUGridActionSetItemManager
- (BOOL)_requiresNotificationsForCharacteristic:(id)a3;
- (BOOL)hideActionSetPlaceholderItem;
- (BOOL)isItemReorderableAtIndex:(id)a3;
- (BOOL)onlyShowsFavorites;
- (BOOL)shouldPerformInitialLoadOnMainThread;
- (HFActionSetItemProvider)actionSetItemProvider;
- (HFReorderableHomeKitItemList)clientReorderableActionSetList;
- (HFReorderableHomeKitItemList)reorderableActionSetList;
- (HFStaticItem)actionSetPlaceholderItem;
- (HFStaticItemProvider)actionSetPlaceholderItemProvider;
- (HMRoom)room;
- (HUGridActionSetItemManager)initWithDelegate:(id)a3;
- (HUGridActionSetItemManager)initWithDelegate:(id)a3 actionSetStyle:(unint64_t)a4 room:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)actionSetItemAssociatedWithActionSet:(id)a3;
- (unint64_t)actionSetStyle;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)_updateFilters;
- (void)setActionSetItemProvider:(id)a3;
- (void)setActionSetPlaceholderItem:(id)a3;
- (void)setActionSetPlaceholderItemProvider:(id)a3;
- (void)setClientReorderableActionSetList:(id)a3;
- (void)setHideActionSetPlaceholderItem:(BOOL)a3;
- (void)setOnlyShowsFavorites:(BOOL)a3;
- (void)setRoom:(id)a3;
@end

@implementation HUGridActionSetItemManager

- (HUGridActionSetItemManager)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUGridActionSetItemManager;
  result = [(HFItemManager *)&v4 initWithDelegate:a3];
  if (result) {
    result->_actionSetStyle = 1;
  }
  return result;
}

- (HUGridActionSetItemManager)initWithDelegate:(id)a3 actionSetStyle:(unint64_t)a4 room:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUGridActionSetItemManager;
  v10 = [(HFItemManager *)&v13 initWithDelegate:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_room, a5);
    v11->_actionSetStyle = a4;
  }

  return v11;
}

- (id)actionSetItemAssociatedWithActionSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(HFItemManager *)self allItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 actionSet];

          if (v12 == v4) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (void)setRoom:(id)a3
{
  v5 = (HMRoom *)a3;
  if (self->_room != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_room, a3);
    [(HUGridActionSetItemManager *)self _updateFilters];
    v5 = v6;
  }
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  if (self->_onlyShowsFavorites != a3)
  {
    self->_onlyShowsFavorites = a3;
    [(HUGridActionSetItemManager *)self _updateFilters];
  }
}

- (HFReorderableHomeKitItemList)reorderableActionSetList
{
  v3 = [(HUGridActionSetItemManager *)self clientReorderableActionSetList];

  if (v3)
  {
    id v4 = [(HUGridActionSetItemManager *)self clientReorderableActionSetList];
  }
  else
  {
    v5 = [(HFItemManager *)self sourceItem];
    uint64_t v6 = [v5 latestResults];
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A30]];
  }

  return (HFReorderableHomeKitItemList *)v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUGridActionSetItemManager *)self room];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F69480]);
    uint64_t v7 = [(HUGridActionSetItemManager *)self room];
    uint64_t v8 = (void *)[v6 initWithHome:v4 room:v7];
    [(HFItemManager *)self setSourceItem:v8];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F69188]) initWithHome:v4];
    [(HFItemManager *)self setSourceItem:v7];
  }

LABEL_6:
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F68EC0]), "initWithHome:actionSetItemStyle:", v4, -[HUGridActionSetItemManager actionSetStyle](self, "actionSetStyle"));
  [(HUGridActionSetItemManager *)self setActionSetItemProvider:v9];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResultsBlock:&__block_literal_global_86];
  [(HUGridActionSetItemManager *)self setActionSetPlaceholderItem:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v13 = [(HUGridActionSetItemManager *)self actionSetPlaceholderItem];
  long long v14 = [v12 setWithObject:v13];
  long long v15 = (void *)[v11 initWithItems:v14];
  [(HUGridActionSetItemManager *)self setActionSetPlaceholderItemProvider:v15];

  [(HUGridActionSetItemManager *)self _updateFilters];
  long long v16 = [(HUGridActionSetItemManager *)self actionSetItemProvider];
  v20[0] = v16;
  long long v17 = [(HUGridActionSetItemManager *)self actionSetPlaceholderItemProvider];
  v20[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  return v18;
}

id __57__HUGridActionSetItemManager__buildItemProvidersForHome___block_invoke()
{
  v0 = objc_opt_new();
  [v0 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B30]];
  v1 = _HULocalizedStringWithDefaultValue(@"HUPlaceholderActionSetTitle", @"HUPlaceholderActionSetTitle", 1);
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v2 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"plus.circle.fill"];
  [v0 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v3 = (void *)MEMORY[0x1E4F7A0D8];
  id v4 = (void *)[v0 copy];
  v5 = [v3 futureWithResult:v4];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUGridActionSetSectionIdentifier"];
  uint64_t v7 = [v4 allObjects];
  uint64_t v8 = [v6 identifier];
  id v9 = [(HUGridActionSetItemManager *)self _comparatorForSectionIdentifier:v8];
  v10 = [v7 sortedArrayUsingComparator:v9];
  [v6 setItems:v10];

  id v11 = _HULocalizedStringWithDefaultValue(@"HUGridScenesSectionTitle", @"HUGridScenesSectionTitle", 1);
  [v6 setHeaderTitle:v11];

  [v5 addObject:v6];
  id v12 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v12;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HUGridActionSetItemManager *)self reorderableActionSetList];
  id v6 = [v5 sortedHomeKitItemComparator];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = _Block_copy(v6);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUGridActionSetItemManager;
    id v9 = [(HFItemManager *)&v11 _comparatorForSectionIdentifier:v4];
    uint64_t v8 = _Block_copy(v9);
  }

  return v8;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridActionSetItemManager;
  id v4 = a3;
  [(HFItemManager *)&v7 _didFinishUpdateTransactionWithAffectedItems:v4];
  v5 = [(HFItemManager *)self sourceItem];
  int v6 = [v4 containsObject:v5];

  if (v6) {
    [(HUGridActionSetItemManager *)self setReorderableActionSetList:0];
  }
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  return 1;
}

- (id)_itemsToHideInSet:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUGridActionSetItemManager;
  id v4 = [(HFItemManager *)&v11 _itemsToHideInSet:a3];
  v5 = (void *)[v4 mutableCopy];

  if ([(HUGridActionSetItemManager *)self hideActionSetPlaceholderItem]
    || ([(HUGridActionSetItemManager *)self actionSetItemProvider],
        int v6 = objc_claimAutoreleasedReturnValue(),
        [v6 items],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_msgSend(v7, "hmf_isEmpty"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    id v9 = [(HUGridActionSetItemManager *)self actionSetPlaceholderItem];
    objc_msgSend(v5, "na_safeAddObject:", v9);
  }

  return v5;
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 1;
}

- (void)_updateFilters
{
  v3 = [(HUGridActionSetItemManager *)self room];
  id v4 = [(HUGridActionSetItemManager *)self actionSetItemProvider];
  [v4 setRoom:v3];

  BOOL v5 = [(HUGridActionSetItemManager *)self onlyShowsFavorites];
  id v6 = [(HUGridActionSetItemManager *)self actionSetItemProvider];
  [v6 setOnlyShowsFavorites:v5];
}

- (BOOL)isItemReorderableAtIndex:(id)a3
{
  id v4 = [(HFItemManager *)self displayedItemAtIndexPath:a3];
  BOOL v5 = [(HUGridActionSetItemManager *)self actionSetPlaceholderItem];
  char v6 = [v4 isEqual:v5];

  if (v6) {
    return 0;
  }
  char v8 = [(HUGridActionSetItemManager *)self reorderableActionSetList];
  BOOL v7 = v8 != 0;

  return v7;
}

- (HMRoom)room
{
  return self->_room;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (BOOL)hideActionSetPlaceholderItem
{
  return self->_hideActionSetPlaceholderItem;
}

- (void)setHideActionSetPlaceholderItem:(BOOL)a3
{
  self->_hideActionSetPlaceholderItem = a3;
}

- (unint64_t)actionSetStyle
{
  return self->_actionSetStyle;
}

- (HFStaticItem)actionSetPlaceholderItem
{
  return self->_actionSetPlaceholderItem;
}

- (void)setActionSetPlaceholderItem:(id)a3
{
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  return self->_actionSetItemProvider;
}

- (void)setActionSetItemProvider:(id)a3
{
}

- (HFStaticItemProvider)actionSetPlaceholderItemProvider
{
  return self->_actionSetPlaceholderItemProvider;
}

- (void)setActionSetPlaceholderItemProvider:(id)a3
{
}

- (HFReorderableHomeKitItemList)clientReorderableActionSetList
{
  return self->_clientReorderableActionSetList;
}

- (void)setClientReorderableActionSetList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableActionSetList, 0);
  objc_storeStrong((id *)&self->_actionSetPlaceholderItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetPlaceholderItem, 0);

  objc_storeStrong((id *)&self->_room, 0);
}

@end