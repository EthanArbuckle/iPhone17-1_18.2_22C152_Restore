@interface CNPhotoPickerProviderSuggestionsGroup
- (CNPhotoPickerProviderSuggestionsGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5;
- (id)addItems;
- (id)dedupedSuggestionItemsGroupedByProvider;
- (id)defaultMonogramItem;
- (id)itemsForProviderIdentifier:(id)a3;
- (id)paddedDisplayItems:(id)a3;
- (id)providerItems:(id)a3 withMaxRecentsAndMonogramsCount:(unint64_t)a4;
- (id)providerOfClass:(Class)a3;
- (int64_t)addProviderItem:(id)a3;
- (int64_t)indexForDefaultMonogram;
- (int64_t)removeProviderItem:(id)a3;
- (void)loadAvailablePaddingItems;
- (void)prepareDisplayItems:(id)a3;
- (void)providerItemDidUpdate:(id)a3;
- (void)reloadMonogramProviderGroupWithVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5;
- (void)setAddItems:(id)a3;
@end

@implementation CNPhotoPickerProviderSuggestionsGroup

- (void).cxx_destruct
{
}

- (void)setAddItems:(id)a3
{
}

- (id)addItems
{
  return self->_addItems;
}

- (void)providerItemDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerProviderGroup *)self callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNPhotoPickerProviderSuggestionsGroup_providerItemDidUpdate___block_invoke;
  v7[3] = &unk_1E549BF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __63__CNPhotoPickerProviderSuggestionsGroup_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerProviderGroup:*(void *)(a1 + 32) didUpdateItem:*(void *)(a1 + 40)];
}

- (void)reloadMonogramProviderGroupWithVisualIdentity:(id)a3 size:(CGSize)a4 RTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerOfClass:objc_opt_class()];
  v11 = +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v9, v5, width, height);

  [v11 setDelegate:self];
  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v13 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
  v14 = [v10 identifier];
  [v13 setObject:v12 forKeyedSubscript:v14];

  [(CNPhotoPickerProviderSuggestionsGroup *)self loadAvailablePaddingItems];
  [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:1];
}

- (id)defaultMonogramItem
{
  v3 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerOfClass:objc_opt_class()];
  if (v3)
  {
    id v4 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
    BOOL v5 = [v3 identifier];
    id v6 = [v4 objectForKeyedSubscript:v5];
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)removeProviderItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPhotoPickerProviderSuggestionsGroup *)self defaultMonogramItem];
  if (v5 == v4)
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPhotoPickerProviderSuggestionsGroup;
    int64_t v6 = [(CNPhotoPickerProviderGroup *)&v8 removeProviderItem:v4];
  }

  return v6;
}

- (int64_t)addProviderItem:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNPhotoPickerProviderSuggestionsGroup *)self defaultMonogramItem];
  if (v5 == v4)
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v7 = [(CNPhotoPickerProviderGroup *)self removedItems];
    if (isKindOfClass)
    {
      objc_super v8 = v24;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      id v9 = __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke;
    }
    else
    {
      objc_super v8 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      id v9 = __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke_2;
    }
    v8[2] = v9;
    v8[3] = &unk_1E549B0E8;
    id v11 = v4;
    v8[4] = v11;
    v12 = objc_msgSend(v7, "_cn_filter:", v8);
    [(CNPhotoPickerProviderGroup *)self setRemovedItems:v12];

    v13 = [(CNPhotoPickerProviderGroup *)self addedItems];
    unint64_t v14 = [v13 count];
    unint64_t v15 = [(CNPhotoPickerProviderSuggestionsGroup *)self maxRecentsAndMonogramsCount];

    if (v14 <= v15)
    {
      id v25 = v11;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v17 = [(CNPhotoPickerProviderGroup *)self addedItems];
      v18 = [v16 arrayByAddingObjectsFromArray:v17];
      [(CNPhotoPickerProviderGroup *)self setAddedItems:v18];
    }
    else
    {
      v26[0] = v11;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v17 = [(CNPhotoPickerProviderGroup *)self addedItems];
      v18 = [(CNPhotoPickerProviderGroup *)self addedItems];
      v19 = objc_msgSend(v17, "_cn_take:", objc_msgSend(v18, "count") - 1);
      v20 = [v16 arrayByAddingObjectsFromArray:v19];
      [(CNPhotoPickerProviderGroup *)self setAddedItems:v20];
    }
    [(CNPhotoPickerProviderGroup *)self reloadDisplayItemsNotifyDelegate:0];
    v21 = [(CNPhotoPickerProviderGroup *)self displayItems];
    int64_t v10 = [v21 indexOfObject:v11];
  }
  return v10;
}

uint64_t __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

BOOL __57__CNPhotoPickerProviderSuggestionsGroup_addProviderItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (id)paddedDisplayItems:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 < [(CNPhotoPickerProviderGroup *)self itemsPerRow])
  {
    uint64_t v6 = [(CNPhotoPickerProviderGroup *)self availablePaddingItems];
    if (!v6) {
      goto LABEL_10;
    }
    v7 = (void *)v6;
    unint64_t v8 = [v4 count];
    unint64_t v9 = v8 % [(CNPhotoPickerProviderGroup *)self itemsPerRow];

    if (!v9) {
      goto LABEL_10;
    }
    unint64_t v10 = [(CNPhotoPickerProviderGroup *)self itemsPerRow];
    unint64_t v11 = [v4 count];
    unint64_t v12 = [(CNPhotoPickerProviderGroup *)self itemsPerRow];
    unint64_t v13 = v10 + v11 / v12 * v12 - v11;
    unint64_t v14 = [(CNPhotoPickerProviderGroup *)self paddingItems];
    uint64_t v15 = [v14 count];

    uint64_t v16 = [(CNPhotoPickerProviderGroup *)self paddingItems];
    if (!v16
      || (v17 = (void *)v16,
          [(CNPhotoPickerProviderGroup *)self paddingItems],
          v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = [v18 count],
          v18,
          v17,
          v13 < v19))
    {
      uint64_t v15 = v13;
    }
    if (v15)
    {
      v20 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_23_61985);
      v21 = objc_msgSend(v20, "_cn_map:", &__block_literal_global_25_61986);

      v22 = [(CNPhotoPickerProviderGroup *)self availablePaddingItems];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_3;
      v29[3] = &unk_1E549B130;
      id v23 = v4;
      id v30 = v23;
      v31 = self;
      id v32 = v21;
      id v24 = v21;
      id v25 = objc_msgSend(v22, "_cn_filter:", v29);
      v26 = objc_msgSend(v25, "_cn_take:", v15);

      [(CNPhotoPickerProviderGroup *)self setPaddingItems:v26];
      id v27 = [v23 arrayByAddingObjectsFromArray:v26];

      goto LABEL_11;
    }
  }
  [(CNPhotoPickerProviderGroup *)self setPaddingItems:MEMORY[0x1E4F1CBF0]];
LABEL_10:
  id v27 = v4;
LABEL_11:

  return v27;
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || ([*(id *)(a1 + 40) removedPaddingItems],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 containsObject:v3],
        v4,
        (v5 & 1) != 0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    unint64_t v8 = [v3 imageData];
    uint64_t v6 = [v7 containsObject:v8] ^ 1;
  }
  return v6;
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 imageData];
}

uint64_t __60__CNPhotoPickerProviderSuggestionsGroup_paddedDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = v2;
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    uint64_t v6 = [v5 hasUnknownColor];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)providerItems:(id)a3 withMaxRecentsAndMonogramsCount:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v10 >= a4) {
            continue;
          }
          ++v10;
        }
        objc_msgSend(v6, "addObject:", v13, (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)prepareDisplayItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNPhotoPickerProviderGroup *)self availablePaddingItems];

  if (!v5) {
    [(CNPhotoPickerProviderSuggestionsGroup *)self loadAvailablePaddingItems];
  }
  unint64_t v6 = [(CNPhotoPickerProviderSuggestionsGroup *)self indexForDefaultMonogram];
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];

  if ([v7 count] > v6)
  {
    uint64_t v8 = [v7 objectAtIndex:v6];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__CNPhotoPickerProviderSuggestionsGroup_prepareDisplayItems___block_invoke;
    v18[3] = &unk_1E549B0E8;
    id v9 = v8;
    id v19 = v9;
    uint64_t v10 = objc_msgSend(v7, "_cn_indexOfFirstObjectPassingTest:", v18);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      unint64_t v12 = [v7 objectAtIndex:v10];
      uint64_t v13 = [MEMORY[0x1E4F28E60] indexSet];
      [v13 addIndex:v6];
      [v13 addIndex:v11];
      unint64_t v14 = [v13 count];
      if (v14 >= [v7 count])
      {
        long long v15 = CNUILogContactPhotoPicker();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v13;
          __int16 v22 = 2112;
          id v23 = v7;
          _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEFAULT, "Failed to update placeholder monogram, attempting to remove indices: %@ from display items: %@", buf, 0x16u);
        }
      }
      else
      {
        [v7 removeObjectsAtIndexes:v13];
        [v7 insertObject:v12 atIndex:v6];
      }
    }
  }
  long long v16 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerItems:v7 withMaxRecentsAndMonogramsCount:[(CNPhotoPickerProviderSuggestionsGroup *)self maxRecentsAndMonogramsCount]];
  long long v17 = [(CNPhotoPickerProviderSuggestionsGroup *)self paddedDisplayItems:v16];
  [(CNPhotoPickerProviderGroup *)self setDisplayItems:v17];
}

uint64_t __61__CNPhotoPickerProviderSuggestionsGroup_prepareDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)loadAvailablePaddingItems
{
  id v3 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerOfClass:objc_opt_class()];
  if (v3)
  {
    id v15 = v3;
    id v4 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
    id v5 = [v15 identifier];
    unint64_t v6 = [v4 objectForKeyedSubscript:v5];
    id v7 = [v6 firstObject];

    id v8 = v7;
    if ([v8 conformsToProtocol:&unk_1ED9A0450]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = *MEMORY[0x1E4F5A2A0];
    unint64_t v12 = [v10 itemText];
    LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    if (v11)
    {
      if ([v8 imageType] == 2)
      {
        uint64_t v13 = [v8 createColorVariantItemsExcludingSelf];
        [(CNPhotoPickerProviderGroup *)self setAvailablePaddingItems:v13];
      }
      else
      {
        uint64_t v13 = objc_alloc_init(CNPhotoPickerVariantsManager);
        unint64_t v14 = [v8 createVariantsItemsWithVariantsManager:v13];
        [(CNPhotoPickerProviderGroup *)self setAvailablePaddingItems:v14];
      }
      [(CNPhotoPickerProviderGroup *)self setPaddingItems:0];
    }

    id v3 = v15;
  }
}

- (id)dedupedSuggestionItemsGroupedByProvider
{
  id v3 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerOfClass:objc_opt_class()];
  id v4 = [(CNPhotoPickerProviderSuggestionsGroup *)self providerOfClass:objc_opt_class()];
  if (v4 && ([v3 containsContactImage] & 1) != 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
    unint64_t v6 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
    id v7 = (void *)[v5 initWithDictionary:v6];

    id v8 = [v4 identifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if ((unint64_t)[v9 count] > 1)
    {
      uint64_t v11 = [v3 identifier];
      unint64_t v12 = [v7 objectForKeyedSubscript:v11];
      uint64_t v13 = objc_msgSend(v12, "_cn_map:", &__block_literal_global_61999);

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke_2;
      v17[3] = &unk_1E549B0E8;
      id v18 = v13;
      id v14 = v13;
      id v10 = objc_msgSend(v9, "_cn_filter:", v17);
    }
    else
    {

      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v15 = [v4 identifier];
    [v7 setObject:v10 forKeyedSubscript:v15];
  }
  else
  {
    id v7 = [(CNPhotoPickerProviderGroup *)self itemsGroupedByProvider];
  }

  return v7;
}

uint64_t __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 imageData];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __80__CNPhotoPickerProviderSuggestionsGroup_dedupedSuggestionItemsGroupedByProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 imageData];
}

- (id)itemsForProviderIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPhotoPickerProviderSuggestionsGroup *)self dedupedSuggestionItemsGroupedByProvider];
  unint64_t v6 = [v5 valueForKey:v4];

  return v6;
}

- (int64_t)indexForDefaultMonogram
{
  if (![(CNPhotoPickerProviderGroup *)self allowAddItem]) {
    return 0;
  }
  id v3 = [(CNPhotoPickerProviderSuggestionsGroup *)self addItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)providerOfClass:(Class)a3
{
  int64_t v4 = [(CNPhotoPickerProviderGroup *)self providers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CNPhotoPickerProviderSuggestionsGroup_providerOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e33_B16__0___CNPhotoPickerProvider__8lu32l8;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", v7);

  return v5;
}

uint64_t __57__CNPhotoPickerProviderSuggestionsGroup_providerOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (CNPhotoPickerProviderSuggestionsGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerProviderSuggestionsGroup;
  id v5 = [(CNPhotoPickerProviderGroup *)&v9 initWithProviders:a3 groupType:1 environment:a4 allowAddItem:a5];
  unint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

@end