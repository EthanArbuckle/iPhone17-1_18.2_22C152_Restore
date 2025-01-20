@interface CNContactGroupPickerViewController
+ (id)os_log;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isValidGroupAtIndexPath:(id)a3;
- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource;
- (CNContactGroupPickerViewController)initWithContactStore:(id)a3;
- (CNContactGroupPickerViewController)initWithContactStore:(id)a3 sourceAccountExternalIdentifiers:(id)a4;
- (CNContactGroupPickerViewControllerDelegate)delegate;
- (NSArray)sourceAccountExternalIdentifiers;
- (NSDirectionalEdgeInsets)bottomSeparatorInsetsForIndexPath:(id)a3 configuration:(id)a4;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (_UIDiffableDataSourceOutlineSectionController)sectionController;
- (id)accessoryTintColorForStateEnabled:(BOOL)a3;
- (id)cellAccessoriesForItem:(id)a3 enabled:(BOOL)a4;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)cancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)reloadData;
- (void)setAccountsAndGroupsDataSource:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setSectionController:(id)a3;
- (void)setSourceAccountExternalIdentifiers:(id)a3;
- (void)setupCollectionView;
- (void)setupDiffableDataSource;
- (void)setupNavigationButtons;
- (void)viewDidLoad;
@end

@implementation CNContactGroupPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSectionController:(id)a3
{
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return self->_sectionController;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setSourceAccountExternalIdentifiers:(id)a3
{
}

- (NSArray)sourceAccountExternalIdentifiers
{
  return self->_sourceAccountExternalIdentifiers;
}

- (void)setAccountsAndGroupsDataSource:(id)a3
{
}

- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource
{
  return self->_accountsAndGroupsDataSource;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactGroupPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactGroupPickerViewControllerDelegate *)WeakRetained;
}

- (BOOL)isValidGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(CNContactGroupPickerViewController *)self diffableDataSource];
  v6 = [v5 itemIdentifierForIndexPath:v4];

  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 group];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  if (-[CNContactGroupPickerViewController isValidGroupAtIndexPath:](self, "isValidGroupAtIndexPath:"))
  {
    objc_opt_class();
    v5 = [(CNContactGroupPickerViewController *)self diffableDataSource];
    v6 = [v5 itemIdentifierForIndexPath:v11];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    v9 = [(CNContactGroupPickerViewController *)self delegate];
    BOOL v10 = [v8 group];

    [v9 groupPicker:self didSelectGroup:v10];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [(CNContactGroupPickerViewController *)self isValidGroupAtIndexPath:a4];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(CNContactGroupPickerViewController *)self isValidGroupAtIndexPath:a4];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v11 = a3;
  id v4 = [(CNContactGroupPickerViewController *)self accountsAndGroupsDataSource];
  v5 = [v4 sections];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1658] emptyConfiguration];
    v7 = [v8 updatedConfigurationForState:v11];

    v9 = CNContactsUIBundle();
    BOOL v10 = [v9 localizedStringForKey:@"NO_GROUPS" value:&stru_1ED8AC728 table:@"Localized"];
    [v7 setText:v10];
  }
  [(CNContactGroupPickerViewController *)self _setContentUnavailableConfiguration:v7];
}

- (void)reloadData
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v3 = [(CNContactGroupPickerViewController *)self sectionController];
  id v4 = [v3 associatedSectionIdentifiers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v41;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v40 + 1) + 8 * v8);
        BOOL v10 = [(CNContactGroupPickerViewController *)self accountsAndGroupsDataSource];
        id v11 = [v10 sections];
        char v12 = [v11 containsObject:v9];

        if ((v12 & 1) == 0)
        {
          v13 = [(CNContactGroupPickerViewController *)self sectionController];
          v14 = [v13 snapshotForSection:v9];

          [v14 deleteAllItems];
          v15 = [(CNContactGroupPickerViewController *)self sectionController];
          [v15 applySnapshot:v14 toSection:v9 animatingDifferences:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v6);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v16 = [(CNContactGroupPickerViewController *)self accountsAndGroupsDataSource];
  v17 = [v16 sections];

  id obj = v17;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    uint64_t v21 = *MEMORY[0x1E4F5A298];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v36 + 1) + 8 * v22);
        id v24 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        v25 = [v23 title];
        int v26 = (*(uint64_t (**)(uint64_t, void *))(v21 + 16))(v21, v25);

        if (v26)
        {
          v27 = [v23 items];
          [v24 appendItems:v27];
        }
        else
        {
          v45 = v23;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
          [v24 appendItems:v28];

          v29 = [v23 items];
          [v24 appendItems:v29 intoParent:v23];

          v44 = v23;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
          [v24 expandItems:v27];
        }

        v30 = [(CNContactGroupPickerViewController *)self sectionController];
        [v30 applySnapshot:v24 toSection:v23 animatingDifferences:0 completion:0];

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v19);
  }

  v31 = [(CNContactGroupPickerViewController *)self diffableDataSource];
  v32 = [v31 snapshot];

  v33 = [v32 itemIdentifiers];
  [v32 reloadItemsWithIdentifiers:v33];

  v34 = [(CNContactGroupPickerViewController *)self diffableDataSource];
  [v34 applySnapshot:v32 animatingDifferences:0];
}

- (id)accessoryTintColorForStateEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = +[CNUIColorRepository groupsDisabledTextColor];
  }
  return v5;
}

- (id)cellAccessoriesForItem:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CNContactGroupPickerViewController *)self accessoryTintColorForStateEnabled:v4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 contactCountString];
  if (v9)
  {
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v9];
    [v10 setTintColor:v7];
    [v8 addObject:v10];
  }
  id v11 = [v6 groupSymbol];
  if (v11)
  {
    char v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v12 placement:0];
    [v13 setTintColor:v7];
    [v8 addObject:v13];
  }

  return v8;
}

- (void)setupDiffableDataSource
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB2218]);
  uint64_t v4 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke;
  v18[3] = &unk_1E5497A28;
  v18[4] = self;
  uint64_t v5 = (void *)[v3 initWithIdentifier:@"Header" cellClass:v4 handler:v18];
  id v6 = objc_alloc(MEMORY[0x1E4FB2218]);
  uint64_t v7 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_2;
  v17[3] = &unk_1E5497320;
  v17[4] = self;
  id v8 = (void *)[v6 initWithIdentifier:@"List" cellClass:v7 handler:v17];
  id v9 = objc_alloc(MEMORY[0x1E4FB2098]);
  v20[0] = v5;
  v20[1] = v8;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v11 = (void *)[v9 initWithItemRenderers:v10];

  [(CNContactGroupPickerViewController *)self setSectionController:v11];
  id v12 = objc_alloc(MEMORY[0x1E4FB1598]);
  v13 = [(CNContactGroupPickerViewController *)self collectionView];
  uint64_t v19 = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v15 = (void *)[v12 initWithCollectionView:v13 sectionControllers:v14 rendererIdentifierProvider:&__block_literal_global_40];

  [(CNContactGroupPickerViewController *)self setDiffableDataSource:v15];
  v16 = [(CNContactGroupPickerViewController *)self collectionView];
  [v16 setDelegate:self];
}

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a3;
  id v7 = a2;
  id v19 = [v5 prominentInsetGroupedHeaderConfiguration];
  id v8 = [v7 title];

  [v19 setText:v8];
  [v19 directionalLayoutMargins];
  double v10 = v9;
  double v12 = v11;
  v13 = [*(id *)(a1 + 32) view];
  [v13 layoutMargins];
  double v15 = v14;

  v16 = [*(id *)(a1 + 32) view];
  [v16 layoutMargins];
  double v18 = v17;

  objc_msgSend(v19, "setDirectionalLayoutMargins:", v10, v15, v12, v18);
  [v6 setContentConfiguration:v19];
}

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 delegate];
  if (v8)
  {
    double v9 = [*(id *)(a1 + 32) delegate];
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = [v5 identifier];
    uint64_t v12 = [v9 groupPicker:v10 shouldEnableGroupWithIdentifier:v11];
  }
  else
  {
    uint64_t v12 = 1;
  }

  v13 = [MEMORY[0x1E4FB1948] cellConfiguration];
  double v14 = [v5 name];
  [v13 setText:v14];

  [v7 setContentConfiguration:v13];
  [v7 setIndentationWidth:0.0];
  double v15 = [*(id *)(a1 + 32) cellAccessoriesForItem:v5 enabled:v12];
  [v7 setAccessories:v15];

  [v7 setUserInteractionEnabled:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_3;
  v16[3] = &unk_1E5497BB8;
  v16[4] = *(void *)(a1 + 32);
  [v7 setConfigurationUpdateHandler:v16];
}

__CFString *__61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v4 = @"Header";
  }
  else {
    uint64_t v4 = @"List";
  }

  return v4;
}

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "accessoryTintColorForStateEnabled:", objc_msgSend(a3, "isDisabled") ^ 1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = objc_msgSend(v5, "accessories", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setTintColor:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSDirectionalEdgeInsets)bottomSeparatorInsetsForIndexPath:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  [a4 bottomSeparatorInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [(CNContactGroupPickerViewController *)self collectionView];
  uint64_t v16 = objc_msgSend(v15, "numberOfItemsInSection:", objc_msgSend(v6, "section"));

  uint64_t v17 = [v6 row];
  if (v17 == v16 - 1)
  {
    double v18 = [(CNContactGroupPickerViewController *)self view];
    [v18 layoutMargins];
    double v10 = v19;
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.trailing = v23;
  result.bottom = v22;
  result.leading = v21;
  result.top = v20;
  return result;
}

- (void)setupCollectionView
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:1];
  uint64_t v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __57__CNContactGroupPickerViewController_setupCollectionView__block_invoke;
  uint64_t v16 = &unk_1E54972F8;
  objc_copyWeak(&v17, &location);
  [v3 setItemSeparatorHandler:&v13];
  id v5 = objc_msgSend(MEMORY[0x1E4FB1580], "layoutWithListConfiguration:", v3, v13, v14, v15, v16);
  id v6 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v7 = [(CNContactGroupPickerViewController *)self view];
  [v7 bounds];
  double v8 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5);
  [(CNContactGroupPickerViewController *)self setCollectionView:v8];

  double v9 = [(CNContactGroupPickerViewController *)self view];
  double v10 = [(CNContactGroupPickerViewController *)self collectionView];
  [v9 addSubview:v10];

  double v11 = [(CNContactGroupPickerViewController *)self collectionView];
  [v11 setAutoresizingMask:18];

  double v12 = [(CNContactGroupPickerViewController *)self collectionView];
  [v12 setDelegate:self];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __57__CNContactGroupPickerViewController_setupCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bottomSeparatorInsetsForIndexPath:v6 configuration:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v5, "setBottomSeparatorInsets:", v9, v11, v13, v15);
  [v5 setTopSeparatorVisibility:2];

  return v5;
}

- (void)cancel:(id)a3
{
  uint64_t v4 = [(CNContactGroupPickerViewController *)self delegate];

  if (v4)
  {
    id v5 = [(CNContactGroupPickerViewController *)self delegate];
    [v5 groupPickerDidCancel:self];
  }
  else
  {
    id v5 = [(CNContactGroupPickerViewController *)self navigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)setupNavigationButtons
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  id v3 = [(CNContactGroupPickerViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactGroupPickerViewController;
  [(CNContactGroupPickerViewController *)&v3 viewDidLoad];
  [(CNContactGroupPickerViewController *)self setupNavigationButtons];
  [(CNContactGroupPickerViewController *)self setupCollectionView];
  [(CNContactGroupPickerViewController *)self setupDiffableDataSource];
  [(CNContactGroupPickerViewController *)self reloadData];
}

- (CNContactGroupPickerViewController)initWithContactStore:(id)a3 sourceAccountExternalIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNContactGroupPickerViewController;
  double v8 = [(CNContactGroupPickerViewController *)&v16 initWithNibName:0 bundle:0];
  if (v8)
  {
    double v9 = [[CNAccountsAndGroupsDataSource alloc] initWithStore:v6];
    [(CNContactGroupPickerViewController *)v8 setAccountsAndGroupsDataSource:v9];

    double v10 = [(CNContactGroupPickerViewController *)v8 accountsAndGroupsDataSource];
    [v10 setOnlyShowsGroupsInSections:1];

    double v11 = [(CNContactGroupPickerViewController *)v8 accountsAndGroupsDataSource];
    [v11 setSourceAccountExternalIdentifiers:v7];

    double v12 = CNContactsUIBundle();
    double v13 = [v12 localizedStringForKey:@"LISTS" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactGroupPickerViewController *)v8 setTitle:v13];

    double v14 = v8;
  }

  return v8;
}

- (CNContactGroupPickerViewController)initWithContactStore:(id)a3
{
  return [(CNContactGroupPickerViewController *)self initWithContactStore:a3 sourceAccountExternalIdentifiers:0];
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_9426 != -1) {
    dispatch_once(&os_log_cn_once_token_1_9426, &__block_literal_global_9427);
  }
  id v2 = (void *)os_log_cn_once_object_1_9428;

  return v2;
}

void __44__CNContactGroupPickerViewController_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactGroupPickerViewController");
  v1 = (void *)os_log_cn_once_object_1_9428;
  os_log_cn_once_object_1_9428 = (uint64_t)v0;
}

@end