@interface HFItemModule
- (BOOL)containsItem:(id)a3;
- (BOOL)supportsReordering;
- (HFItemModule)init;
- (HFItemModule)initWithItemUpdater:(id)a3;
- (HFItemUpdating)itemUpdater;
- (HFReorderableHomeKitItemList)clientReorderableHomeKitItemList;
- (HFReorderableHomeKitItemList)reorderableHomeKitItemList;
- (NSSet)allItems;
- (NSSet)itemProviders;
- (NSString)moduleIdentifier;
- (id)_itemComparator;
- (id)_reorderableHomeKitItemListKey;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)matchingItemForHomeKitObject:(id)a3;
- (void)reset;
- (void)setClientReorderableHomeKitItemList:(id)a3;
- (void)setReorderableHomeKitItemList:(id)a3;
- (void)updateModuleIdentifierInItems;
@end

@implementation HFItemModule

uint64_t __24__HFItemModule_allItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

uint64_t __29__HFItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 items];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (NSSet)allItems
{
  v2 = [(HFItemModule *)self itemProviders];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_159);

  return (NSSet *)v3;
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  v5 = [(HFItemModule *)self itemProviders];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__HFItemModule_containsItem___block_invoke;
  v9[3] = &unk_264090A00;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSSet)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders
    || ([(HFItemModule *)self buildItemProviders],
        v5 = (NSSet *)objc_claimAutoreleasedReturnValue(),
        id v6 = self->_itemProviders,
        self->_itemProviders = v5,
        v6,
        (itemProviders = self->_itemProviders) != 0))
  {
    char v7 = itemProviders;
  }
  else
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"HFItemModule.m", 47, @"%@ must either override itemProviders or buildItemProviders, but does not", v11 object file lineNumber description];

    char v7 = [MEMORY[0x263EFFA08] set];
  }
  return v7;
}

void __45__HFItemModule_updateModuleIdentifierInItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 moduleIdentifier];
  [v3 setModuleIdentifier:v4];
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (HFReorderableHomeKitItemList)reorderableHomeKitItemList
{
  if ([(HFItemModule *)self supportsReordering])
  {
    id v3 = [(HFItemModule *)self clientReorderableHomeKitItemList];

    if (v3)
    {
      id v4 = [(HFItemModule *)self clientReorderableHomeKitItemList];
    }
    else
    {
      v5 = [(HFItemModule *)self itemUpdater];
      id v6 = [v5 sourceItem];
      char v7 = [v6 latestResults];
      v8 = [(HFItemModule *)self _reorderableHomeKitItemListKey];
      id v4 = [v7 objectForKeyedSubscript:v8];
    }
  }
  else
  {
    id v4 = 0;
  }
  return (HFReorderableHomeKitItemList *)v4;
}

- (BOOL)supportsReordering
{
  v2 = [(HFItemModule *)self _reorderableHomeKitItemListKey];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HFItemUpdating)itemUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemUpdater);
  return (HFItemUpdating *)WeakRetained;
}

- (HFReorderableHomeKitItemList)clientReorderableHomeKitItemList
{
  return self->_clientReorderableHomeKitItemList;
}

- (id)_reorderableHomeKitItemListKey
{
  return 0;
}

- (id)_itemComparator
{
  v2 = [(HFItemModule *)self reorderableHomeKitItemList];
  BOOL v3 = [v2 sortedHomeKitItemComparator];
  id v4 = v3;
  if (v3)
  {
    v5 = _Block_copy(v3);
  }
  else
  {
    id v6 = +[HFItemSection defaultItemComparator];
    v5 = _Block_copy(v6);
  }
  return v5;
}

- (void)setReorderableHomeKitItemList:(id)a3
{
  id v4 = a3;
  if ([(HFItemModule *)self supportsReordering]) {
    [(HFItemModule *)self setClientReorderableHomeKitItemList:v4];
  }
}

- (void)setClientReorderableHomeKitItemList:(id)a3
{
}

- (void)updateModuleIdentifierInItems
{
  BOOL v3 = [(HFItemModule *)self allItems];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HFItemModule_updateModuleIdentifierInItems__block_invoke;
  v4[3] = &unk_264093508;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);
}

- (HFItemModule)initWithItemUpdater:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFItemModule;
  v5 = [(HFItemModule *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemUpdater, v4);
    char v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v7 stringWithFormat:@"%@-%p", v9, v6];
    moduleIdentifier = v6->_moduleIdentifier;
    v6->_moduleIdentifier = (NSString *)v10;
  }
  return v6;
}

- (HFItemModule)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItemUpdater_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemModule.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFItemModule init]",
    v5);

  return 0;
}

- (id)buildItemProviders
{
  return 0;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFItemModule.m", 58, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemModule buildSectionsWithDisplayedItems:]", objc_opt_class() object file lineNumber description];

  return (id)MEMORY[0x263EFFA68];
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4 = a3;
  v5 = [(HFItemModule *)self allItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HFItemModule_matchingItemForHomeKitObject___block_invoke;
  v9[3] = &unk_26408EC60;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__HFItemModule_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C0FBAD0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 homeKitObject];

  if (v5)
  {
    if ([v6 isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v7 = 1;
    }
    else
    {
      v8 = [v6 uniqueIdentifier];
      v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v7 = [v8 isEqual:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)reset
{
  if (+[HFUtilities isInternalTest])
  {
    id v3 = [MEMORY[0x263EFFA08] set];
    itemProviders = self->_itemProviders;
    self->_itemProviders = v3;
    MEMORY[0x270F9A758](v3, itemProviders);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableHomeKitItemList, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end