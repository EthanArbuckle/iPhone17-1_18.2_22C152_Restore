@interface CNPhotoPickerDataSource
+ (AVTAvatarStore)avatarStore;
- (AVTAvatarStore)avatarStore;
- (BOOL)allowsPhotoLibraryAccess;
- (BOOL)isItemAtIndexPathAddItem:(id)a3;
- (CNContactViewCache)contactViewCache;
- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 photoPickerConfiguration:(id)a5;
- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 providerGroups:(id)a5 avatarStore:(id)a6;
- (CNPhotoPickerProviderGroupDelegate)delegate;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentity)visualIdentity;
- (NSArray)emojiSuggestionItems;
- (NSArray)providerGroups;
- (NSIndexPath)activePhotoIndexPath;
- (NSMutableArray)groupIsCollapsedState;
- (id)actionTitleForSection:(int64_t)a3;
- (id)findActiveIndexPathInGroup:(id)a3 withImageData:(id)a4;
- (id)indexOfAddedItem:(id)a3 inGroupOfType:(int64_t)a4;
- (id)indexPathsToReloadForUpdatedGroup:(id)a3;
- (id)injectedItemsGroup;
- (id)monogramProviderDefaultItemWithSize:(CGSize)a3;
- (id)monogramProviderMonogramItemWithSize:(CGSize)a3;
- (id)providerGroupAtIndexPath:(id)a3;
- (id)providerGroupAtSection:(int64_t)a3;
- (id)providerItemAtIndexPath:(id)a3;
- (id)removeItem:(id)a3;
- (id)suggestionsGroup;
- (id)titleForSection:(int64_t)a3;
- (id)uniqueEmojiSuggestionItems:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionIndexForProviderGroup:(id)a3;
- (int64_t)sectionIndexForProviderGroupType:(int64_t)a3;
- (unint64_t)itemsPerRow;
- (unint64_t)itemsPerRowForSection:(int64_t)a3;
- (void)loadProviderGroupsItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6;
- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4;
- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4;
- (void)setActivePhotoIndexPath:(id)a3;
- (void)setAllowsPhotoLibraryAccess:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojiSuggestionItems:(id)a3;
- (void)setGroupIsCollapsedState:(id)a3;
- (void)setItemsPerRow:(unint64_t)a3;
- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4;
- (void)setVisualIdentity:(id)a3;
- (void)updateGroupCollapsedStateForSection:(int64_t)a3;
@end

@implementation CNPhotoPickerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIsCollapsedState, 0);
  objc_storeStrong((id *)&self->_providerGroups, 0);
  objc_storeStrong((id *)&self->_emojiSuggestionItems, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_activePhotoIndexPath, 0);

  objc_storeStrong((id *)&self->_visualIdentity, 0);
}

- (void)setAllowsPhotoLibraryAccess:(BOOL)a3
{
  self->_allowsPhotoLibraryAccess = a3;
}

- (BOOL)allowsPhotoLibraryAccess
{
  return self->_allowsPhotoLibraryAccess;
}

- (void)setGroupIsCollapsedState:(id)a3
{
}

- (NSMutableArray)groupIsCollapsedState
{
  return self->_groupIsCollapsedState;
}

- (NSArray)providerGroups
{
  return self->_providerGroups;
}

- (void)setEmojiSuggestionItems:(id)a3
{
}

- (NSArray)emojiSuggestionItems
{
  return self->_emojiSuggestionItems;
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerProviderGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerProviderGroupDelegate *)WeakRetained;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setActivePhotoIndexPath:(id)a3
{
}

- (NSIndexPath)activePhotoIndexPath
{
  return self->_activePhotoIndexPath;
}

- (void)setVisualIdentity:(id)a3
{
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (id)uniqueEmojiSuggestionItems:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerDataSource *)self emojiSuggestionItems];
  v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_43);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke_2;
  v10[3] = &unk_1E5497808;
  id v11 = v6;
  id v7 = v6;
  v8 = objc_msgSend(v4, "_cn_filter:", v10);

  return v8;
}

uint64_t __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 stringRepresentation];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __54__CNPhotoPickerDataSource_uniqueEmojiSuggestionItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(CNPhotoPickerDataSource *)self delegate];

  if (v7)
  {
    v8 = [(CNPhotoPickerDataSource *)self delegate];
    [v8 photoPickerProviderGroup:v9 didUpdateItem:v6];
  }
}

- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(CNPhotoPickerDataSource *)self delegate];

  if (v6)
  {
    id v7 = [(CNPhotoPickerDataSource *)self delegate];
    [v7 photoPickerProviderGroupDidUpdate:v8 requiresFullReload:v4];
  }
}

- (void)updateGroupCollapsedStateForSection:(int64_t)a3
{
  v5 = [(CNPhotoPickerDataSource *)self groupIsCollapsedState];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    id v7 = [(CNPhotoPickerDataSource *)self groupIsCollapsedState];
    id v8 = [v7 objectAtIndexedSubscript:a3];
    int v9 = [v8 BOOLValue];

    id v11 = [(CNPhotoPickerDataSource *)self groupIsCollapsedState];
    v10 = [NSNumber numberWithInt:v9 ^ 1u];
    [v11 replaceObjectAtIndex:a3 withObject:v10];
  }
}

- (id)removeItem:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = [(CNPhotoPickerDataSource *)self providerGroups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__CNPhotoPickerDataSource_removeItem___block_invoke;
  v9[3] = &unk_1E54977C0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v13;
  v12 = &v17;
  [v5 enumerateObjectsUsingBlock:v9];

  if (v18[3] == 0x7FFFFFFFFFFFFFFFLL || v14[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __38__CNPhotoPickerDataSource_removeItem___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 removeProviderItem:a1[4]];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = result;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)indexOfAddedItem:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNPhotoPickerDataSource *)self providerGroups];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__CNPhotoPickerDataSource_indexOfAddedItem_inGroupOfType___block_invoke;
  v15[3] = &__block_descriptor_40_e36_B16__0__CNPhotoPickerProviderGroup_8l;
  v15[4] = a4;
  id v8 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", v15);

  if (v8 && (uint64_t v9 = [v8 addProviderItem:v6], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = v9;
    v12 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v13 = [(CNPhotoPickerDataSource *)self providerGroups];
    id v10 = objc_msgSend(v12, "indexPathForItem:inSection:", v11, objc_msgSend(v13, "indexOfObjectIdenticalTo:", v8));
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

BOOL __58__CNPhotoPickerDataSource_indexOfAddedItem_inGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == *(void *)(a1 + 32);
}

- (id)findActiveIndexPathInGroup:(id)a3 withImageData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNPhotoPickerDataSource *)self providerGroups];
  uint64_t v9 = [v8 indexOfObject:v6];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || [v6 numberOfItems] < 1) {
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = [v6 providerItemAtIndex:v10];
    v12 = [v11 imageData];
    char v13 = [v12 isEqualToData:v7];

    if (v13) {
      break;
    }
    if (++v10 >= [v6 numberOfItems]) {
      goto LABEL_8;
    }
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    v14 = 0;
  }
  else
  {
    v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:v9];
  }

  return v14;
}

- (id)injectedItemsGroup
{
  v2 = [(CNPhotoPickerDataSource *)self providerGroups];
  v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_37);

  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

BOOL __45__CNPhotoPickerDataSource_injectedItemsGroup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == 4;
}

- (id)suggestionsGroup
{
  v2 = [(CNPhotoPickerDataSource *)self providerGroups];
  v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_34);

  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

BOOL __43__CNPhotoPickerDataSource_suggestionsGroup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == 1;
}

- (id)monogramProviderMonogramItemWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  id v7 = [(CNPhotoPickerDataSource *)self visualIdentity];
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  uint64_t v11 = +[CNPhotoPickerMonogramProvider monogramProviderItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:](CNPhotoPickerMonogramProvider, "monogramProviderItemForVisualIdentity:size:scale:RTL:isVariantOptionItem:backgroundColor:", v8, v6, 1, 0, width, height, v10);

  return v11;
}

- (id)monogramProviderDefaultItemWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  id v7 = [(CNPhotoPickerDataSource *)self visualIdentity];
  id v8 = +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v7, v6, width, height);

  return v8;
}

- (id)providerItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerDataSource *)self providerGroupAtIndexPath:v4];
  uint64_t v6 = [v4 row];

  id v7 = [v5 providerItemAtIndex:v6];

  return v7;
}

- (id)providerGroupAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 section];

  return [(CNPhotoPickerDataSource *)self providerGroupAtSection:v4];
}

- (id)providerGroupAtSection:(int64_t)a3
{
  if (a3 < 0
    || ([(CNPhotoPickerDataSource *)self providerGroups],
        v5 = objc_claimAutoreleasedReturnValue(),
        int64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(CNPhotoPickerDataSource *)self providerGroups];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (BOOL)isItemAtIndexPathAddItem:(id)a3
{
  id v4 = a3;
  v5 = [(CNPhotoPickerDataSource *)self providerGroups];
  int64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  if ([v6 allowAddItem])
  {
    unint64_t v7 = [v4 row];
    id v8 = [v6 addItems];
    BOOL v9 = v7 < [v8 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)actionTitleForSection:(int64_t)a3
{
  v5 = [(CNPhotoPickerDataSource *)self providerGroups];
  int64_t v6 = [v5 objectAtIndexedSubscript:a3];

  if ([v6 groupType] == 2)
  {
    unint64_t v7 = [(CNPhotoPickerDataSource *)self groupIsCollapsedState];
    id v8 = [v7 objectAtIndexedSubscript:a3];
    int v9 = [v8 BOOLValue];

    double v10 = CNContactsUIBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"PHOTO_EDIT_ANIMOJI_HEADER_COLLAPSE_ACTION" value:&stru_1ED8AC728 table:@"Localized"];

    v12 = CNContactsUIBundle();
    char v13 = [v12 localizedStringForKey:@"PHOTO_EDIT_ANIMOJI_HEADER_EXPAND_ACTION" value:&stru_1ED8AC728 table:@"Localized"];

    if (v9) {
      v14 = v13;
    }
    else {
      v14 = v11;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)titleForSection:(int64_t)a3
{
  id v4 = [(CNPhotoPickerDataSource *)self providerGroups];
  v5 = [v4 objectAtIndexedSubscript:a3];

  uint64_t v6 = [v5 groupType];
  switch(v6)
  {
    case 3:
      double v10 = CNContactsUIBundle();
      unint64_t v7 = v10;
      uint64_t v11 = @"PHOTO_EDIT_EMOJI_HEADER";
LABEL_8:
      int v9 = [v10 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized"];
LABEL_9:

      goto LABEL_11;
    case 2:
      double v10 = CNContactsUIBundle();
      unint64_t v7 = v10;
      uint64_t v11 = @"PHOTO_EDIT_ANIMOJI_HEADER";
      goto LABEL_8;
    case 1:
      unint64_t v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v7 userInterfaceIdiom])
      {
        id v8 = CNContactsUIBundle();
        int v9 = [v8 localizedStringForKey:@"PHOTO_EDIT_PHOTOS_HEADER" value:&stru_1ED8AC728 table:@"Localized"];
      }
      else
      {
        int v9 = 0;
      }
      goto LABEL_9;
  }
  int v9 = 0;
LABEL_11:

  return v9;
}

- (id)indexPathsToReloadForUpdatedGroup:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNPhotoPickerDataSource *)self sectionIndexForProviderGroup:v4];
  uint64_t v6 = [v4 numberOfItems];
  uint64_t v7 = v6 - 1;
  if (v6 < 1)
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v5];
      v12 = [v10 arrayByAddingObject:v11];

      ++v9;
      double v10 = v12;
    }
    while (v8 != v9);
  }
  if ([v4 allowAddItem])
  {
    uint64_t v13 = objc_msgSend(v12, "_cn_takeLast:", v7);

    v12 = (void *)v13;
  }

  return v12;
}

- (int64_t)sectionIndexForProviderGroupType:(int64_t)a3
{
  id v4 = [(CNPhotoPickerDataSource *)self providerGroups];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CNPhotoPickerDataSource_sectionIndexForProviderGroupType___block_invoke;
  v7[3] = &__block_descriptor_40_e36_B16__0__CNPhotoPickerProviderGroup_8l;
  v7[4] = a3;
  int64_t v5 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", v7);

  return v5;
}

BOOL __60__CNPhotoPickerDataSource_sectionIndexForProviderGroupType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupType] == *(void *)(a1 + 32);
}

- (int64_t)sectionIndexForProviderGroup:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNPhotoPickerDataSource *)self providerGroups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CNPhotoPickerDataSource_sectionIndexForProviderGroup___block_invoke;
  v9[3] = &unk_1E5497758;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = objc_msgSend(v5, "_cn_indexOfFirstObjectPassingTest:", v9);

  return v7;
}

uint64_t __56__CNPhotoPickerDataSource_sectionIndexForProviderGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t v5 = [(CNPhotoPickerDataSource *)self providerGroups];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  int64_t v7 = [(CNPhotoPickerDataSource *)self groupIsCollapsedState];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    unint64_t v10 = 2 * [(CNPhotoPickerDataSource *)self itemsPerRowForSection:a3];
    unint64_t v11 = [v6 numberOfItems];
    if (v10 >= v11) {
      unint64_t v10 = v11;
    }
  }
  else
  {
    unint64_t v10 = [v6 numberOfItems];
  }

  return v10;
}

- (int64_t)numberOfSections
{
  v2 = [(CNPhotoPickerDataSource *)self providerGroups];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)setItemsPerRow:(unint64_t)a3 requiresFullReload:(BOOL)a4
{
  id v6 = [(CNPhotoPickerDataSource *)self providerGroups];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CNPhotoPickerDataSource_setItemsPerRow_requiresFullReload___block_invoke;
  v7[3] = &__block_descriptor_41_e36_v16__0__CNPhotoPickerProviderGroup_8l;
  v7[4] = a3;
  BOOL v8 = a4;
  objc_msgSend(v6, "_cn_each:", v7);
}

uint64_t __61__CNPhotoPickerDataSource_setItemsPerRow_requiresFullReload___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setItemsPerRow:*(void *)(a1 + 32) requiresFullReload:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setItemsPerRow:(unint64_t)a3
{
}

- (unint64_t)itemsPerRowForSection:(int64_t)a3
{
  id v4 = [(CNPhotoPickerDataSource *)self providerGroups];
  int64_t v5 = [v4 objectAtIndex:a3];

  unint64_t v6 = [v5 itemsPerRow];
  return v6;
}

- (unint64_t)itemsPerRow
{
  v2 = [(CNPhotoPickerDataSource *)self providerGroups];
  int64_t v3 = [v2 firstObject];
  unint64_t v4 = [v3 itemsPerRow];

  return v4;
}

- (void)loadProviderGroupsItemsForSize:(CGSize)a3 itemsPerRow:(double)a4 scale:(double)a5 RTL:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = [(CNPhotoPickerDataSource *)self providerGroups];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "loadProvidersItemsForSize:itemsPerRow:scale:RTL:", v6, width, height, a4, a5);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 providerGroups:(id)a5 avatarStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNPhotoPickerDataSource;
  uint64_t v15 = [(CNPhotoPickerDataSource *)&v29 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualIdentity, a3);
    objc_storeStrong((id *)&v16->_contactViewCache, a4);
    activePhotoIndexPath = v16->_activePhotoIndexPath;
    v16->_activePhotoIndexPath = 0;

    objc_storeStrong((id *)&v16->_providerGroups, a5);
    objc_storeStrong((id *)&v16->_avatarStore, a6);
    long long v18 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v16->_variantsManager;
    v16->_variantsManager = v18;

    uint64_t v20 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_13061);
    uint64_t v21 = [v20 mutableCopy];
    groupIsCollapsedState = v16->_groupIsCollapsedState;
    v16->_groupIsCollapsedState = (NSMutableArray *)v21;

    emojiSuggestionItems = v16->_emojiSuggestionItems;
    v16->_emojiSuggestionItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke_2;
    v27[3] = &unk_1E5497710;
    v24 = v16;
    v28 = v24;
    objc_msgSend(v13, "_cn_each:", v27);
    v25 = v24;
  }
  return v16;
}

uint64_t __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

id __94__CNPhotoPickerDataSource_initWithVisualIdentity_contactViewCache_providerGroups_avatarStore___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 groupType] == 2) {
    v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v2 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v2;
}

- (CNPhotoPickerDataSource)initWithVisualIdentity:(id)a3 contactViewCache:(id)a4 photoPickerConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() avatarStore];
  id v12 = (void *)[v10 mutableCopy];
  id v13 = +[CNUIContactsEnvironment currentEnvironment];
  id v14 = +[CNPhotoPickerProviderGroupsBuilder builderWithVisualIdentity:v12 avatarStore:v11 environment:v13 contactViewCache:v9 photoPickerConfiguration:v8];

  LOBYTE(v12) = [v8 allowPhotoCapture];
  self->_allowsPhotoLibraryAccess = (char)v12;
  uint64_t v15 = [v14 build];
  long long v16 = [(CNPhotoPickerDataSource *)self initWithVisualIdentity:v10 contactViewCache:v9 providerGroups:v15 avatarStore:v11];

  return v16;
}

+ (AVTAvatarStore)avatarStore
{
  if (+[CNPhotoPickerCapabilities allowsAvatarUI])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2050000000;
    v2 = (void *)getAVTAvatarStoreClass_softClass;
    uint64_t v10 = getAVTAvatarStoreClass_softClass;
    if (!getAVTAvatarStoreClass_softClass)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __getAVTAvatarStoreClass_block_invoke;
      v6[3] = &unk_1E549AD00;
      v6[4] = &v7;
      __getAVTAvatarStoreClass_block_invoke((uint64_t)v6);
      v2 = (void *)v8[3];
    }
    int64_t v3 = v2;
    _Block_object_dispose(&v7, 8);
    id v4 = objc_alloc_init(v3);
  }
  else
  {
    id v4 = 0;
  }

  return (AVTAvatarStore *)v4;
}

@end