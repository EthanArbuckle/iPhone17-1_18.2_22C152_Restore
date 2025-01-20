@interface CNContactGridViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)inlineActionsEnabled;
- (CGSize)avatarSize;
- (CNContactDataSource)dataSource;
- (CNContactFormatter)contactFormatter;
- (CNContactGridViewController)initWithCoder:(id)a3;
- (CNContactGridViewController)initWithCollectionViewLayout:(id)a3;
- (CNContactGridViewController)initWithDataSource:(id)a3;
- (CNContactGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactGridViewControllerDelegate)delegate;
- (CNContactGridViewLayout)gridLayout;
- (CNKeyDescriptor)descriptorForRequiredKeys;
- (NSArray)inlineActionsCategories;
- (NSDictionary)nameTextAttributes;
- (NSIndexPath)indexPathOfContactWithExpandedInlineActions;
- (NSMutableDictionary)preloadedActionsManagers;
- (UIColor)backgroundColor;
- (UIEdgeInsets)avatarMargins;
- (id)_contactAtIndexPath:(id)a3;
- (id)_indexPathForGlobalIndex:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_globalIndexForIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indexOfContactWithExpandedInlineActions;
- (int64_t)monogrammerStyle;
- (int64_t)numberOfColumns;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_configureCell:(id)a3;
- (void)_updateItemSize;
- (void)actionsView:(id)a3 didPerformAction:(id)a4;
- (void)actionsView:(id)a3 willShowActions:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contactDataSourceDidChange:(id)a3;
- (void)preloadInlineActionsForContactsAtIndexes:(id)a3;
- (void)setAvatarMargins:(UIEdgeInsets)a3;
- (void)setAvatarSize:(CGSize)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridLayout:(id)a3;
- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3;
- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3 animated:(BOOL)a4;
- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3;
- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3 animated:(BOOL)a4;
- (void)setInlineActionsCategories:(id)a3;
- (void)setInlineActionsEnabled:(BOOL)a3;
- (void)setMonogrammerStyle:(int64_t)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setPreloadedActionsManagers:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willBeginPreviewInteractionForAvatarView:(id)a3;
@end

@implementation CNContactGridViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedActionsManagers, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_inlineActionsCategories, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPreloadedActionsManagers:(id)a3
{
}

- (NSMutableDictionary)preloadedActionsManagers
{
  return self->_preloadedActionsManagers;
}

- (void)setGridLayout:(id)a3
{
}

- (CNContactGridViewLayout)gridLayout
{
  return (CNContactGridViewLayout *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setNameTextAttributes:(id)a3
{
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setMonogrammerStyle:(int64_t)a3
{
  self->_monogrammerStyle = a3;
}

- (int64_t)monogrammerStyle
{
  return self->_monogrammerStyle;
}

- (void)setAvatarMargins:(UIEdgeInsets)a3
{
  self->_avatarMargins = a3;
}

- (UIEdgeInsets)avatarMargins
{
  double top = self->_avatarMargins.top;
  double left = self->_avatarMargins.left;
  double bottom = self->_avatarMargins.bottom;
  double right = self->_avatarMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAvatarSize:(CGSize)a3
{
  self->_avatarSize = a3;
}

- (CGSize)avatarSize
{
  double width = self->_avatarSize.width;
  double height = self->_avatarSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setInlineActionsCategories:(id)a3
{
}

- (void)setInlineActionsEnabled:(BOOL)a3
{
  self->_inlineActionsEnabled = a3;
}

- (BOOL)inlineActionsEnabled
{
  return self->_inlineActionsEnabled;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (CNContactDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactGridViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  v5 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
  v6 = v5;
  if (v5 && ([v5 isEqual:v8] & 1) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = v8;
  }
  [(CNContactGridViewController *)self setIndexPathOfContactWithExpandedInlineActions:v7];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CNContactGridViewController *)self inlineActionsEnabled])
  {
    v6 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
    id v7 = v6;
    if (v6 && ([v6 isEqual:v5] & 1) != 0
      || ([(CNContactGridViewController *)self delegate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = objc_opt_respondsToSelector(),
          v8,
          (v9 & 1) == 0))
    {
      char v12 = 1;
    }
    else
    {
      int64_t v10 = [(CNContactGridViewController *)self _globalIndexForIndexPath:v5];
      v11 = [(CNContactGridViewController *)self delegate];
      char v12 = [v11 gridViewController:self shouldShowInlineActionsForContactAtIndex:v10];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  [(CNContactGridViewController *)self _configureCell:v7];
  id v8 = [(CNContactGridViewController *)self _contactAtIndexPath:v6];

  char v9 = [(CNContactGridViewController *)self preloadedActionsManagers];
  int64_t v10 = [v8 identifier];
  v11 = [v9 objectForKeyedSubscript:v10];
  [v7 setActionsManager:v11];

  [v7 setContact:v8];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(CNContactGridViewController *)self dataSource];
  id v7 = [v6 sections];

  if ([v7 count])
  {
    id v8 = [v7 objectAtIndexedSubscript:a4];
    [v8 range];
    int64_t v10 = v9;
  }
  else
  {
    id v8 = [(CNContactGridViewController *)self dataSource];
    v11 = [v8 contacts];
    int64_t v10 = [v11 count];
  }
  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(CNContactGridViewController *)self dataSource];
  v4 = [v3 sections];

  if ([v4 count]) {
    int64_t v5 = [v4 count];
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (void)contactDataSourceDidChange:(id)a3
{
  id v3 = [(CNContactGridViewController *)self collectionView];
  [v3 reloadData];
}

- (void)actionsView:(id)a3 didPerformAction:(id)a4
{
  id v17 = a4;
  int64_t v5 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];

  if (v5)
  {
    id v6 = [(CNContactGridViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
      int64_t v9 = [(CNContactGridViewController *)self _globalIndexForIndexPath:v8];

      objc_opt_class();
      id v10 = v17;
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;

      if (v12)
      {
        v13 = [v12 propertyAction];
        v14 = [v13 propertyItem];
        v15 = [v14 contactProperty];
      }
      else
      {
        v15 = 0;
      }
      v16 = [(CNContactGridViewController *)self delegate];
      [v16 gridViewController:self didPerformAction:v10 forContactAtIndex:v9 withContactProperty:v15];
    }
  }
}

- (void)actionsView:(id)a3 willShowActions:(id)a4
{
  id v11 = a4;
  int64_t v5 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];

  if (v5)
  {
    id v6 = [(CNContactGridViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
      int64_t v9 = [(CNContactGridViewController *)self _globalIndexForIndexPath:v8];

      id v10 = [(CNContactGridViewController *)self delegate];
      [v10 gridViewController:self willShowInlineActions:v11 forContactAtIndex:v9];
    }
  }
}

- (void)willBeginPreviewInteractionForAvatarView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CNContactGridViewController *)self collectionView];
  int64_t v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(CNContactGridViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (CNKeyDescriptor)descriptorForRequiredKeys
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [(CNContactGridViewController *)self contactFormatter];
  v4 = [v3 descriptorForRequiredKeys];
  int64_t v5 = +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1, v4);
  v11[1] = v5;
  uint64_t v6 = +[CNQuickActionsView descriptorForRequiredKeys];
  v11[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v8 = [NSString stringWithUTF8String:"-[CNContactGridViewController descriptorForRequiredKeys]"];
  uint64_t v9 = [v2 descriptorWithKeyDescriptors:v7 description:v8];

  return (CNKeyDescriptor *)v9;
}

- (void)preloadInlineActionsForContactsAtIndexes:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (!self->_preloadedActionsManagers)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CNContactGridViewController *)self setPreloadedActionsManagers:v5];

    id v4 = v15;
  }
  uint64_t v6 = [v4 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = [(CNContactGridViewController *)self dataSource];
      uint64_t v9 = [v8 contacts];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v7];

      id v11 = +[CNQuickActionsView actionsManagerForContact:v10];
      long long v12 = [(CNContactGridViewController *)self inlineActionsCategories];
      [v11 setCategories:v12];

      preloadedActionsManagers = self->_preloadedActionsManagers;
      long long v14 = [v10 identifier];
      [(NSMutableDictionary *)preloadedActionsManagers setObject:v11 forKey:v14];

      [v11 updateActionsWithBlock:0];
      uint64_t v7 = [v15 indexGreaterThanIndex:v7];
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (int64_t)indexOfContactWithExpandedInlineActions
{
  id v3 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
  if (v3) {
    int64_t v4 = [(CNContactGridViewController *)self _globalIndexForIndexPath:v3];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3
{
}

- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 0)
  {
    -[CNContactGridViewController setIndexPathOfContactWithExpandedInlineActions:animated:](self, "setIndexPathOfContactWithExpandedInlineActions:animated:", 0);
  }
  else
  {
    -[CNContactGridViewController _indexPathForGlobalIndex:](self, "_indexPathForGlobalIndex:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(CNContactGridViewController *)self setIndexPathOfContactWithExpandedInlineActions:v6 animated:v4];
  }
}

- (NSIndexPath)indexPathOfContactWithExpandedInlineActions
{
  v2 = [(CNContactGridViewController *)self gridLayout];
  id v3 = [v2 selectedIndexPath];

  return (NSIndexPath *)v3;
}

- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3
{
}

- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CNContactGridViewController *)self collectionView];
  uint64_t v8 = [(CNContactGridViewController *)self indexPathOfContactWithExpandedInlineActions];
  uint64_t v9 = [(CNContactGridViewController *)self gridLayout];
  uint64_t v10 = (void *)[v9 copy];

  if (v6)
  {
    id v11 = [v7 cellForItemAtIndexPath:v6];
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    long long v12 = 0;
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v11 = 0;
  if (!v8) {
    goto LABEL_6;
  }
LABEL_3:
  long long v12 = [v7 cellForItemAtIndexPath:v8];
  if (v6)
  {
LABEL_4:
    long long v13 = [v11 animationBlockForPreparingToShowActions];
    goto LABEL_8;
  }
LABEL_7:
  long long v13 = 0;
LABEL_8:
  [v10 setSelectedIndexPath:v6];
  [(CNContactGridViewController *)self setGridLayout:v10];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke;
  aBlock[3] = &unk_1E549BF80;
  id v14 = v8;
  id v26 = v14;
  v27 = self;
  id v15 = (void (**)(void))_Block_copy(aBlock);
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_2;
    v19[3] = &unk_1E5499E78;
    id v20 = v12;
    v23 = v13;
    id v21 = v7;
    id v22 = v10;
    v24 = v15;
    [v16 _animateUsingDefaultTimingWithOptions:0 animations:v19 completion:0];

    uint64_t v17 = v20;
  }
  else
  {
    [v7 setCollectionViewLayout:v10 animated:0];
    if (v13) {
      v13[2](v13);
    }
    uint64_t v18 = [v12 completionBlockForHidingActions];
    uint64_t v17 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t))(v18 + 16))(v18);
    }
    v15[2](v15);
  }
}

void __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 40) _globalIndexForIndexPath:*(void *)(a1 + 32)];
      id v5 = [*(id *)(a1 + 40) delegate];
      [v5 gridViewController:*(void *)(a1 + 40) didHideInlineActionsForContactAtIndex:v4];
    }
  }
}

void __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlockForHidingActions];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_3;
  v7[3] = &unk_1E5499E50;
  id v8 = v2;
  id v9 = *(id *)(a1 + 64);
  id v6 = v2;
  [v4 setCollectionViewLayout:v5 animated:1 completion:v7];
}

uint64_t __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v2 + 40) + 16);
    return v4();
  }
  return result;
}

- (id)_contactAtIndexPath:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(CNContactGridViewController *)self _globalIndexForIndexPath:a3];
  uint64_t v5 = [(CNContactGridViewController *)self dataSource];
  id v6 = [v5 contacts];
  uint64_t v7 = [v6 objectAtIndexedSubscript:v4];

  id v8 = [(CNContactGridViewController *)self descriptorForRequiredKeys];
  v11[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 assertKeysAreAvailable:v9];

  return v7;
}

- (id)_indexPathForGlobalIndex:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(CNContactGridViewController *)self dataSource];
  uint64_t v5 = [v4 sections];

  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v9 + v8;
        int64_t v13 = a3;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "range", (void)v20);
          a3 = v13 - v14;
          if (v13 < v14)
          {
            uint64_t v12 = v9 + v11;
            a3 = v13;
            goto LABEL_14;
          }
          ++v11;
          v13 -= v14;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v9 = v12;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_14:

    id v15 = (void *)MEMORY[0x1E4F28D58];
    int64_t v16 = a3;
    uint64_t v17 = v12;
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28D58];
    int64_t v16 = a3;
    uint64_t v17 = 0;
  }
  uint64_t v18 = objc_msgSend(v15, "indexPathForItem:inSection:", v16, v17, (void)v20);

  return v18;
}

- (int64_t)_globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNContactGridViewController *)self dataSource];
  id v6 = [v5 sections];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    uint64_t v8 = [v7 range];
    int64_t v9 = v8 + [v4 row];
  }
  else
  {
    int64_t v9 = [v4 item];
  }

  return v9;
}

- (void)_configureCell:(id)a3
{
  id v4 = a3;
  [(CNContactGridViewController *)self avatarSize];
  objc_msgSend(v4, "setAvatarSize:");
  [(CNContactGridViewController *)self avatarMargins];
  objc_msgSend(v4, "setAvatarMargins:");
  uint64_t v5 = [(CNContactGridViewController *)self nameTextAttributes];
  [v4 setNameTextAttributes:v5];

  id v6 = [(CNContactGridViewController *)self contactFormatter];
  [v4 setContactFormatter:v6];

  [v4 setDelegate:self];
  objc_msgSend(v4, "setShowsContactOnTap:", -[CNContactGridViewController inlineActionsEnabled](self, "inlineActionsEnabled") ^ 1);
  id v7 = [(CNContactGridViewController *)self inlineActionsCategories];
  [v4 setActionCategories:v7];
}

- (void)viewWillLayoutSubviews
{
  id v12 = [(CNContactGridViewController *)self gridLayout];
  objc_msgSend(v12, "setNumberOfColumns:", -[CNContactGridViewController numberOfColumns](self, "numberOfColumns"));
  uint64_t v3 = [(CNContactGridViewController *)self collectionView];
  [v3 frame];
  double Width = CGRectGetWidth(v14);
  double v5 = (double)[(CNContactGridViewController *)self numberOfColumns];
  [(CNContactGridViewController *)self avatarMargins];
  double v7 = v6;
  [(CNContactGridViewController *)self avatarSize];
  double v9 = v7 + v8;
  [(CNContactGridViewController *)self avatarMargins];
  double v11 = (Width - v5 * (v9 + v10))
      / (double)([(CNContactGridViewController *)self numberOfColumns] - 1)
      + -1.0;

  if (v11 < 0.0)
  {
    ceil((1.0 - v11)* (double)([(CNContactGridViewController *)self numberOfColumns] - 1)/ (double)(2 * [(CNContactGridViewController *)self numberOfColumns]));
    [(CNContactGridViewController *)self avatarMargins];
    double v11 = 0.0;
    -[CNContactGridViewController setAvatarMargins:](self, "setAvatarMargins:");
    [(CNContactGridViewController *)self _updateItemSize];
  }
  [v12 setMinimumInteritemSpacing:v11];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactGridViewController;
  [(CNContactGridViewController *)&v7 viewDidLoad];
  uint64_t v3 = [(CNContactGridViewController *)self backgroundColor];
  id v4 = [(CNContactGridViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  double v5 = [(CNContactGridViewController *)self collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];

  double v6 = [(CNContactGridViewController *)self gridLayout];
  objc_msgSend(v6, "setSectionInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v6 setMinimumLineSpacing:0.0];
  [(CNContactGridViewController *)self _updateItemSize];
}

- (void)_updateItemSize
{
  [(CNContactGridViewController *)self avatarMargins];
  double v4 = v3;
  [(CNContactGridViewController *)self avatarSize];
  double v6 = v4 + v5;
  [(CNContactGridViewController *)self avatarMargins];
  double v8 = v6 + v7;
  uint64_t v17 = -[CNContactGridCell initWithFrame:]([CNContactGridCell alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v8, 200.0);
  [(CNContactGridViewController *)self _configureCell:v17];
  [(CNContactGridCell *)v17 setContact:0];
  double v9 = [(CNContactGridCell *)v17 contentView];
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 200.0, v10, v11);
  double v13 = v12;
  double v15 = v14;

  int64_t v16 = [(CNContactGridViewController *)self gridLayout];
  objc_msgSend(v16, "setItemSize:", v13, v15);
}

- (NSArray)inlineActionsCategories
{
  inlineActionsCategories = self->_inlineActionsCategories;
  if (inlineActionsCategories)
  {
    double v3 = inlineActionsCategories;
  }
  else
  {
    double v3 = +[CNQuickActionsView defaultCategories];
  }

  return v3;
}

- (void)setDataSource:(id)a3
{
  double v5 = (CNContactDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    double v7 = v5;
    [(CNContactDataSource *)dataSource setDelegate:0];
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(CNContactDataSource *)self->_dataSource setDelegate:self];
    double v5 = v7;
  }
}

- (CNContactGridViewController)initWithCoder:(id)a3
{
  return [(CNContactGridViewController *)self initWithDataSource:0];
}

- (CNContactGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNContactGridViewController initWithDataSource:](self, "initWithDataSource:", 0, a4);
}

- (CNContactGridViewController)initWithCollectionViewLayout:(id)a3
{
  return [(CNContactGridViewController *)self initWithDataSource:0];
}

- (CNContactGridViewController)initWithDataSource:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(CNContactGridViewLayout);
  v10.receiver = self;
  v10.super_class = (Class)CNContactGridViewController;
  double v6 = [(CNContactGridViewController *)&v10 initWithCollectionViewLayout:v5];
  double v7 = v6;
  if (v4) {
    [(CNContactGridViewController *)v6 setDataSource:v4];
  }
  [(CNContactGridViewController *)v7 setGridLayout:v5];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v8 setStyle:1001];
  [v8 setFallbackStyle:-1];
  [(CNContactGridViewController *)v7 setContactFormatter:v8];

  return v7;
}

@end