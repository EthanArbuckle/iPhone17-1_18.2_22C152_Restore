@interface CSListItemManager
+ (CSListItemManager)itemManagerWithItemContainer:(id)a3;
+ (CSListItemManager)itemManagerWithItemContainer:(id)a3 itemProviders:(id)a4;
- (BOOL)isPresentingSupplementaryContent;
- (BOOL)listHasNotificationContent;
- (CSListItem)nowPlayingItem;
- (CSListItemContaining)itemContainer;
- (NSArray)allItems;
- (NSDictionary)identifiersToProviders;
- (NSMutableDictionary)identifiersToItems;
- (id)_initWithItemContainer:(id)a3 itemProviders:(id)a4;
- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3;
- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3;
- (unint64_t)itemCount;
- (void)_restrictsTouches:(BOOL)a3 forSpecificContentHost:(id)a4;
- (void)addItem:(id)a3;
- (void)cancelTouchesForItem:(id)a3;
- (void)didAddNewSceneHostEnvironment;
- (void)handleRemovedItemsWithContentHosts:(id)a3;
- (void)item:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4;
- (void)item:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)removeItem:(id)a3;
- (void)restrictsTouches:(BOOL)a3 onHostedSceneOfContentHost:(id)a4;
- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3;
- (void)setIdentifiersToItems:(id)a3;
- (void)setIdentifiersToProviders:(id)a3;
- (void)setItemContainer:(id)a3;
- (void)setListHasNotificationContent:(BOOL)a3;
- (void)setNowPlayingItem:(id)a3;
- (void)significantUserInteractionBeganForItem:(id)a3;
- (void)significantUserInteractionEndedForItem:(id)a3;
- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5;
- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouchesOnAllSupplementaryViewControllers:(BOOL)a4;
- (void)updateItem:(id)a3;
- (void)willPresentPosterSwitcher;
@end

@implementation CSListItemManager

+ (CSListItemManager)itemManagerWithItemContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = CSListItemProvidingGetAllProviders();
  v6 = (void *)[v4 _initWithItemContainer:v3 itemProviders:v5];

  return (CSListItemManager *)v6;
}

+ (CSListItemManager)itemManagerWithItemContainer:(id)a3 itemProviders:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithItemContainer:v6 itemProviders:v5];

  return (CSListItemManager *)v7;
}

- (id)_initWithItemContainer:(id)a3 itemProviders:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CSListItemManager;
  v8 = [(CSListItemManager *)&v31 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_itemContainer, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifiersToItems = v9->_identifiersToItems;
    v9->_identifiersToItems = v10;

    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifiersToProviders = v9->_identifiersToProviders;
    v9->_identifiersToProviders = v12;

    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v7;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v20 setItemManager:v9];
          v21 = [v20 section];
          v22 = [v21 identifier];
          [(NSDictionary *)v14 setObject:v20 forKey:v22];

          v23 = [v20 section];
          [v6 itemManager:v9 insertSection:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v17);
    }

    v24 = v9->_identifiersToProviders;
    v9->_identifiersToProviders = v14;

    id v7 = v26;
  }

  return v9;
}

- (BOOL)isPresentingSupplementaryContent
{
  return [(CSListItemManager *)self itemCount] != 0;
}

- (unint64_t)itemCount
{
  return [(NSMutableDictionary *)self->_identifiersToItems count];
}

- (NSArray)allItems
{
  return (NSArray *)[(NSMutableDictionary *)self->_identifiersToItems allValues];
}

- (void)setListHasNotificationContent:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_listHasNotificationContent != a3)
  {
    self->_listHasNotificationContent = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(NSDictionary *)self->_identifiersToProviders allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            unint64_t v10 = [(CSListItemManager *)self itemCount];
            uint64_t v11 = [v9 itemCount];
            BOOL v13 = self->_listHasNotificationContent || v10 != v11;
            [v9 setListHasAdditionalContent:v13];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CSListItemManager_itemsGroupSortComparatorForListSectionIdentifier___block_invoke;
  v8[3] = &unk_1E6ADACB0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1D9487300](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __70__CSListItemManager_itemsGroupSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained identifiersToProviders];
    id v10 = [v9 objectForKey:*(void *)(a1 + 32)];

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v11 = [v10 itemsGroupSortComparator];
      uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v5, v6);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CSListItemManager_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke;
  v8[3] = &unk_1E6ADACD8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D9487300](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __79__CSListItemManager_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained identifiersToProviders];
    id v10 = [v9 objectForKey:*(void *)(a1 + 32)];

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v11 = [v10 itemsViewControllerSortComparator];
      uint64_t v12 = ((uint64_t (**)(void, id, id))v11)[2](v11, v5, v6);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)willPresentPosterSwitcher
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CSListItemManager *)self isPresentingSupplementaryContent])
  {
    id v3 = [(CSListItemManager *)self identifiersToProviders];
    id v4 = [v3 allValues];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v10, "willPresentPosterSwitcher", (void)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (CSListItem)nowPlayingItem
{
  return self->_nowPlayingItem;
}

- (void)setNowPlayingItem:(id)a3
{
  uint64_t v6 = (CSListItem *)a3;
  if (self->_nowPlayingItem != v6)
  {
    objc_storeStrong((id *)&self->_nowPlayingItem, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);
    [WeakRetained itemManager:self setNowPlayingItem:v6];
  }
}

- (void)addItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  id v5 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:v4];

  if (!v5)
  {
    [(NSMutableDictionary *)self->_identifiersToItems setObject:v7 forKey:v4];
    uint64_t v6 = [(CSListItemManager *)self itemContainer];
    [v6 itemManager:self insertItem:v7];
  }
}

- (void)updateItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  id v5 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:v4];

  if (v5)
  {
    uint64_t v6 = [(CSListItemManager *)self itemContainer];
    [v6 itemManager:self updateItem:v7];
  }
}

- (void)removeItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  id v5 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:v4];

  if (v5)
  {
    [(NSMutableDictionary *)self->_identifiersToItems removeObjectForKey:v4];
    uint64_t v6 = [(CSListItemManager *)self itemContainer];
    [v6 itemManager:self removeItem:v7];
  }
}

- (void)item:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  p_itemContainer = &self->_itemContainer;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  [WeakRetained itemManager:self requestsModalPresentationOfViewController:v12 forItem:v13 animated:v6 completion:v11];
}

- (void)item:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  p_itemContainer = &self->_itemContainer;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  [WeakRetained itemManager:self requestsAuthenticationAndPerformBlock:v6];
}

- (void)handleRemovedItemsWithContentHosts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(NSMutableDictionary *)self->_identifiersToItems allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [v11 contentHost];
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = [(CSListItemManager *)self identifiersToProviders];
  long long v15 = [v14 allValues];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v20 handleRemovedItems:v5];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)cancelTouchesForItem:(id)a3
{
  p_itemContainer = &self->_itemContainer;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  [WeakRetained itemManager:self cancelTouchesForInteractionWithItem:v5];
}

- (void)restrictsTouches:(BOOL)a3 onHostedSceneOfContentHost:(id)a4
{
  if (a4) {
    -[CSListItemManager _restrictsTouches:forSpecificContentHost:](self, "_restrictsTouches:forSpecificContentHost:", a3);
  }
}

- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3
{
}

- (void)significantUserInteractionBeganForItem:(id)a3
{
  p_itemContainer = &self->_itemContainer;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  [WeakRetained itemManager:self significantUserInteractionBeganWithItem:v5];
}

- (void)significantUserInteractionEndedForItem:(id)a3
{
  p_itemContainer = &self->_itemContainer;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  [WeakRetained itemManager:self significantUserInteractionEndedWithItem:v5];
}

- (void)didAddNewSceneHostEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);
  [WeakRetained itemManagerDidAddNewSceneHostEnvironment];
}

- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  identifiersToProviders = self->_identifiersToProviders;
  uint64_t v9 = [a3 identifier];
  id v10 = [(NSDictionary *)identifiersToProviders objectForKey:v9];

  if (objc_opt_respondsToSelector()) {
    [v10 restrictsTouches:v5 onHostedSceneInViewController:v11];
  }
}

- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouchesOnAllSupplementaryViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  identifiersToProviders = self->_identifiersToProviders;
  id v6 = [a3 identifier];
  id v7 = [(NSDictionary *)identifiersToProviders objectForKey:v6];

  if (objc_opt_respondsToSelector()) {
    [v7 restrictsTouchesOnAllHostedScenes:v4];
  }
}

- (void)_restrictsTouches:(BOOL)a3 forSpecificContentHost:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(NSMutableDictionary *)self->_identifiersToItems allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if (!v6
        || ([*(id *)(*((void *)&v17 + 1) + 8 * v11) contentHost],
            id v13 = (id)objc_claimAutoreleasedReturnValue(),
            v13,
            v13 == v6))
      {
        long long v14 = [v12 contentHost];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          uint64_t v16 = [v12 contentHost];
          [v16 restrictsTouchesOnHostedScene:v4];
        }
        if (v6) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (CSListItemContaining)itemContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);

  return (CSListItemContaining *)WeakRetained;
}

- (void)setItemContainer:(id)a3
{
}

- (BOOL)listHasNotificationContent
{
  return self->_listHasNotificationContent;
}

- (NSMutableDictionary)identifiersToItems
{
  return self->_identifiersToItems;
}

- (void)setIdentifiersToItems:(id)a3
{
}

- (NSDictionary)identifiersToProviders
{
  return self->_identifiersToProviders;
}

- (void)setIdentifiersToProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToProviders, 0);
  objc_storeStrong((id *)&self->_identifiersToItems, 0);
  objc_destroyWeak((id *)&self->_itemContainer);

  objc_storeStrong((id *)&self->_nowPlayingItem, 0);
}

@end