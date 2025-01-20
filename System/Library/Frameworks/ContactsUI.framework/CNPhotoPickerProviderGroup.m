@interface CNPhotoPickerProviderGroup
+ (id)addItemsGroupWithProviders:(id)a3 environment:(id)a4;
+ (id)animojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
+ (id)emojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
+ (id)injectedItemsGroupWithEnvironment:(id)a3;
+ (id)suggestionsGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
- (BOOL)allowAddItem;
- (BOOL)hasAddedProviderItems;
- (BOOL)showCircleMask;
- (CNPhotoPickerProviderGroup)initWithProviders:(id)a3 groupType:(int64_t)a4 environment:(id)a5 allowAddItem:(BOOL)a6;
- (CNPhotoPickerProviderGroupDelegate)delegate;
- (CNScheduler)callbackQueue;
- (CNScheduler)providerItemRenderingQueue;
- (CNScheduler)workQueue;
- (NSArray)addItems;
- (NSArray)addedItems;
- (NSArray)availablePaddingItems;
- (NSArray)displayItems;
- (NSArray)paddingItems;
- (NSArray)providers;
- (NSArray)removedItems;
- (NSArray)removedPaddingItems;
- (NSMutableDictionary)itemsGroupedByProvider;
- (id)itemsForProviderIdentifier:(id)a3;
- (id)providerItemAtIndex:(int64_t)a3;
- (id)suggestionsProviderPrecedingFacesProvider;
- (int64_t)addProviderItem:(id)a3;
- (int64_t)groupType;
- (int64_t)numberOfItems;
- (int64_t)removeProviderItem:(id)a3;
- (unint64_t)itemsPerRow;
- (void)loadProvidersItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6;
- (void)providerItemDidUpdate:(id)a3;
- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3;
- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3 requiresFullReload:(BOOL)a4;
- (void)removeAllAddedProviderItems;
- (void)setAddItems:(id)a3;
- (void)setAddedItems:(id)a3;
- (void)setAvailablePaddingItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setItemsGroupedByProvider:(id)a3;
- (void)setItemsPerRow:(unint64_t)a3;
- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4;
- (void)setPaddingItems:(id)a3;
- (void)setProviders:(id)a3;
- (void)setRemovedItems:(id)a3;
- (void)setRemovedPaddingItems:(id)a3;
@end

@implementation CNPhotoPickerProviderGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_providerItemRenderingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_paddingItems, 0);
  objc_storeStrong((id *)&self->_removedPaddingItems, 0);
  objc_storeStrong((id *)&self->_availablePaddingItems, 0);
  objc_storeStrong((id *)&self->_itemsGroupedByProvider, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_addItems, 0);
  objc_storeStrong((id *)&self->_providers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CNScheduler)callbackQueue
{
  return self->_callbackQueue;
}

- (CNScheduler)providerItemRenderingQueue
{
  return self->_providerItemRenderingQueue;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void)setPaddingItems:(id)a3
{
}

- (NSArray)paddingItems
{
  return self->_paddingItems;
}

- (void)setRemovedPaddingItems:(id)a3
{
}

- (NSArray)removedPaddingItems
{
  return self->_removedPaddingItems;
}

- (void)setAvailablePaddingItems:(id)a3
{
}

- (NSArray)availablePaddingItems
{
  return self->_availablePaddingItems;
}

- (void)setItemsGroupedByProvider:(id)a3
{
}

- (NSMutableDictionary)itemsGroupedByProvider
{
  return self->_itemsGroupedByProvider;
}

- (void)setRemovedItems:(id)a3
{
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (void)setAddedItems:(id)a3
{
}

- (NSArray)addedItems
{
  return self->_addedItems;
}

- (void)setDisplayItems:(id)a3
{
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setAddItems:(id)a3
{
}

- (void)setProviders:(id)a3
{
}

- (NSArray)providers
{
  return self->_providers;
}

- (unint64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerProviderGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerProviderGroupDelegate *)WeakRetained;
}

- (BOOL)showCircleMask
{
  return self->_showCircleMask;
}

- (BOOL)allowAddItem
{
  return self->_allowAddItem;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)providerItemDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerProviderGroup *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CNPhotoPickerProviderGroup_providerItemDidUpdate___block_invoke;
  v7[3] = &unk_1E549BF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __52__CNPhotoPickerProviderGroup_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerProviderGroup:*(void *)(a1 + 32) didUpdateItem:*(void *)(a1 + 40)];
}

- (BOOL)hasAddedProviderItems
{
  uint64_t v2 = *MEMORY[0x1E4F5A258];
  v3 = [(CNPhotoPickerProviderGroup *)self addedItems];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (void)removeAllAddedProviderItems
{
  [(CNPhotoPickerProviderGroup *)self setAddedItems:MEMORY[0x1E4F1CBF0]];

  [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:0];
}

- (int64_t)removeProviderItem:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNPhotoPickerProviderGroup *)self displayItems];
  int64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(CNPhotoPickerProviderGroup *)self addedItems];
    uint64_t v8 = [v7 indexOfObject:v4];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [(CNPhotoPickerProviderGroup *)self paddingItems];
      int v10 = [v9 containsObject:v4];

      if (!v10)
      {
        v20 = [(CNPhotoPickerProviderGroup *)self removedItems];
        v21 = [v20 arrayByAddingObject:v4];
        [(CNPhotoPickerProviderGroup *)self setRemovedItems:v21];

LABEL_11:
        [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:0];
        goto LABEL_12;
      }
      v11 = [(CNPhotoPickerProviderGroup *)self paddingItems];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke_2;
      v26 = &unk_1E549B0E8;
      id v12 = v4;
      id v27 = v12;
      v13 = objc_msgSend(v11, "_cn_filter:", &v23);
      -[CNPhotoPickerProviderGroup setPaddingItems:](self, "setPaddingItems:", v13, v23, v24, v25, v26);

      v14 = [(CNPhotoPickerProviderGroup *)self removedPaddingItems];
      if (v14)
      {
        v15 = [(CNPhotoPickerProviderGroup *)self removedPaddingItems];
        v16 = [v15 arrayByAddingObject:v12];
        [(CNPhotoPickerProviderGroup *)self setRemovedPaddingItems:v16];
      }
      else
      {
        v30[0] = v12;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        [(CNPhotoPickerProviderGroup *)self setRemovedPaddingItems:v15];
      }

      v19 = v27;
    }
    else
    {
      v17 = [(CNPhotoPickerProviderGroup *)self addedItems];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke;
      v28[3] = &unk_1E549B0E8;
      id v29 = v4;
      v18 = objc_msgSend(v17, "_cn_filter:", v28);
      [(CNPhotoPickerProviderGroup *)self setAddedItems:v18];

      v19 = v29;
    }

    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

BOOL __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

uint64_t __49__CNPhotoPickerProviderGroup_removeProviderItem___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (int64_t)addProviderItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  int64_t v6 = [v4 arrayWithObjects:&v12 count:1];
  v7 = [(CNPhotoPickerProviderGroup *)self addedItems];
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];
  [(CNPhotoPickerProviderGroup *)self setAddedItems:v8];

  [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:0];
  v9 = [(CNPhotoPickerProviderGroup *)self displayItems];
  int64_t v10 = [v9 indexOfObject:v5];

  return v10;
}

- (id)providerItemAtIndex:(int64_t)a3
{
  if ([(CNPhotoPickerProviderGroup *)self numberOfItems] <= a3)
  {
    int64_t v6 = 0;
  }
  else
  {
    id v5 = [(CNPhotoPickerProviderGroup *)self displayItems];
    int64_t v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (int64_t)numberOfItems
{
  uint64_t v2 = [(CNPhotoPickerProviderGroup *)self displayItems];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSArray)addItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  addItems = self->_addItems;
  if (!addItems)
  {
    id v4 = [[CNPhotoPickerGlyphProviderItem alloc] initWithSymbolImageNamed:@"plus"];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    int64_t v6 = self->_addItems;
    self->_addItems = v5;

    addItems = self->_addItems;
  }

  return addItems;
}

- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3 requiresFullReload:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [(CNPhotoPickerProviderGroup *)self addedItems];
  [v7 addObject:v8];

  v9 = [(CNPhotoPickerProviderGroup *)self providers];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke;
  v16[3] = &unk_1E54969C8;
  v16[4] = self;
  id v10 = v7;
  id v17 = v10;
  objc_msgSend(v9, "_cn_each:", v16);

  if ([(CNPhotoPickerProviderGroup *)self allowAddItem])
  {
    v11 = [(CNPhotoPickerProviderGroup *)self addItems];
    [v10 insertObject:v11 atIndex:0];
  }
  id v12 = objc_msgSend(v10, "_cn_flatten");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_3;
  v15[3] = &unk_1E549B0E8;
  v15[4] = self;
  uint64_t v13 = objc_msgSend(v12, "_cn_filter:", v15);

  [(CNPhotoPickerProviderGroup *)self prepareDisplayItems:v13];
  if (v5)
  {
    v14 = [(CNPhotoPickerProviderGroup *)self delegate];
    [v14 photoPickerProviderGroupDidUpdate:self requiresFullReload:v4];
  }
}

void __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  BOOL v5 = [v3 identifier];
  int64_t v6 = [v4 itemsForProviderIdentifier:v5];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(*(id *)(a1 + 40), "_cn_insertNonNilObject:atIndex:", v6, 0);
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_2;
      v8[3] = &unk_1E549B0E8;
      v8[4] = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend(v6, "_cn_filter:", v8);

      objc_msgSend(*(id *)(a1 + 40), "_cn_addNonNilObject:", v7);
      int64_t v6 = (void *)v7;
    }
  }
}

BOOL __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 removedItems];
  uint64_t v5 = [v4 indexOfObjectIdenticalTo:v3];

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __82__CNPhotoPickerProviderGroup_reloadDisplayItemsNotifyDelegate_requiresFullReload___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 addedItems];
  uint64_t v5 = [v4 indexOfObject:v3];

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)reloadDisplayItemsNotifyDelegate:(BOOL)a3
{
}

- (id)itemsForProviderIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
  int64_t v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4
{
  if (self->_itemsPerRow != a3)
  {
    self->_itemsPerRow = a3;
    [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:1 requiresFullReload:a4];
  }
}

- (void)setItemsPerRow:(unint64_t)a3
{
}

- (id)suggestionsProviderPrecedingFacesProvider
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v3 = [(CNPhotoPickerProviderGroup *)self providers];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_1567];

  unint64_t v5 = v4 - 1;
  if (v4 == 1
    || ([(CNPhotoPickerProviderGroup *)self providers],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 count],
        v6,
        v5 >= v7))
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    uint64_t v8 = [(CNPhotoPickerProviderGroup *)self providers];
    v9 = [v8 objectAtIndex:v5];
  }

  return v9;
}

uint64_t __71__CNPhotoPickerProviderGroup_suggestionsProviderPrecedingFacesProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)loadProvidersItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  self->_itemsPerRow = (unint64_t)a4;
  v11 = [(CNPhotoPickerProviderGroup *)self workQueue];
  id v12 = [(CNPhotoPickerProviderGroup *)self providerItemRenderingQueue];
  uint64_t v13 = [(CNPhotoPickerProviderGroup *)self callbackQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke;
  v16[3] = &unk_1E5496980;
  CGFloat v19 = width;
  CGFloat v20 = height;
  double v21 = a5;
  BOOL v22 = a6;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [v11 performBlock:v16];
}

void __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) suggestionsProviderPrecedingFacesProvider];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [*(id *)(a1 + 32) providers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "loadItemsForSize:scale:RTL:renderingQueue:callbackQueue:itemDelegate:", *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
        v9 = *(void **)(a1 + 48);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_2;
        v14[3] = &unk_1E5497540;
        v14[4] = *(void *)(a1 + 32);
        v14[5] = v7;
        id v15 = v8;
        BOOL v16 = v7 == v2;
        id v10 = v8;
        [v9 performBlock:v14];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  v11 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_3;
  v13[3] = &unk_1E549B488;
  v13[4] = *(void *)(a1 + 32);
  [v11 performBlock:v13];
}

uint64_t __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) itemsGroupedByProvider];
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);

  return [v5 reloadDisplayItemsNotifyDelegate:v6];
}

void __78__CNPhotoPickerProviderGroup_loadProvidersItemsForSize_itemsPerRow_scale_RTL___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerProviderGroupDidUpdate:*(void *)(a1 + 32) requiresFullReload:0];
}

- (CNPhotoPickerProviderGroup)initWithProviders:(id)a3 groupType:(int64_t)a4 environment:(id)a5 allowAddItem:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CNPhotoPickerProviderGroup;
  uint64_t v13 = [(CNPhotoPickerProviderGroup *)&v31 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_providers, a3);
    v14->_groupType = a4;
    v14->_allowAddItem = a6;
    id v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (a6)
    {
      uint64_t v16 = [(CNPhotoPickerProviderGroup *)v14 addItems];
      displayItems = v14->_displayItems;
      v14->_displayItems = (NSArray *)v16;
    }
    else
    {
      displayItems = v14->_displayItems;
      v14->_displayItems = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    addedItems = v14->_addedItems;
    v14->_addedItems = v15;

    removedItems = v14->_removedItems;
    v14->_removedItems = v15;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    itemsGroupedByProvider = v14->_itemsGroupedByProvider;
    v14->_itemsGroupedByProvider = (NSMutableDictionary *)v20;

    uint64_t v22 = [v12 defaultSchedulerProvider];
    uint64_t v23 = [v22 newSerialSchedulerWithName:@"com.apple.ContactsUI.PhotoPickerProvider.workQueue"];
    workQueue = v14->_workQueue;
    v14->_workQueue = (CNScheduler *)v23;

    uint64_t v25 = [v22 newSerialSchedulerWithName:@"com.apple.ContactsUI.PhotoPickerProvider.ProviderItem.workQueue"];
    providerItemRenderingQueue = v14->_providerItemRenderingQueue;
    v14->_providerItemRenderingQueue = (CNScheduler *)v25;

    uint64_t v27 = [v22 mainThreadScheduler];
    callbackQueue = v14->_callbackQueue;
    v14->_callbackQueue = (CNScheduler *)v27;

    id v29 = v14;
  }

  return v14;
}

+ (id)addItemsGroupWithProviders:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [[CNPhotoPickerProviderAddItemsGroup alloc] initWithProviders:v6 environment:v5];

  return v7;
}

+ (id)emojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CNPhotoPickerProviderEmojiGroup alloc] initWithProviders:v8 environment:v7 allowAddItem:v5];

  return v9;
}

+ (id)animojiGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CNPhotoPickerProviderAnimojiGroup alloc] initWithProviders:v8 environment:v7 allowAddItem:v5];

  return v9;
}

+ (id)suggestionsGroupWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[CNPhotoPickerProviderSuggestionsGroup alloc] initWithProviders:v8 environment:v7 allowAddItem:v5];

  return v9;
}

+ (id)injectedItemsGroupWithEnvironment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CNPhotoPickerProviderInjectedItemsGroup alloc] initWithEnvironment:v3];

  return v4;
}

@end