@interface CNContactContainerPickerViewController
+ (id)os_log;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CNAccountsAndGroupsDataSource)accountsDataSource;
- (CNContactContainerPickerViewController)initWithContactViewCache:(id)a3 selectedContainerIdentifiers:(id)a4;
- (CNContactContainerPickerViewControllerDelegate)delegate;
- (CNContactViewCache)contactViewCache;
- (NSArray)containers;
- (NSArray)items;
- (NSArray)selectedContainerIdentifiers;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)allAccounts;
- (id)currentSnapshot;
- (id)dataSourceWithCellRegistration:(id)a3;
- (id)writableContainersForAccount:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)discoverContainers;
- (void)reloadData;
- (void)setAccountsDataSource:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContactViewCache:(id)a3;
- (void)setContainers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setSelectedContainerIdentifiers:(id)a3;
- (void)setupCollectionView;
- (void)setupDiffableDataSource;
- (void)setupDoneButton;
- (void)viewDidLoad;
@end

@implementation CNContactContainerPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_accountsDataSource, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_selectedContainerIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContainers:(id)a3
{
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setAccountsDataSource:(id)a3
{
}

- (CNAccountsAndGroupsDataSource)accountsDataSource
{
  return self->_accountsDataSource;
}

- (void)setContactViewCache:(id)a3
{
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (NSArray)selectedContainerIdentifiers
{
  return self->_selectedContainerIdentifiers;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactContainerPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactContainerPickerViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(CNContactContainerPickerViewController *)self items];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [(CNContactContainerPickerViewController *)self selectedContainerIdentifiers];
  v10 = (void *)[v9 mutableCopy];

  v11 = [v8 identifier];
  [v10 removeObject:v11];

  v12 = (void *)[v10 copy];
  [(CNContactContainerPickerViewController *)self setSelectedContainerIdentifiers:v12];

  v13 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [v8 identifier];
    int v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_18B625000, v13, OS_LOG_TYPE_DEBUG, "User de-selected container %@", (uint8_t *)&v15, 0xCu);
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactContainerPickerViewController *)self items];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [(CNContactContainerPickerViewController *)self delegate];
  v10 = [v8 identifier];
  int v11 = [v9 containerPicker:self shouldAllowDeselectionOfContainerWithIdentifier:v10];

  if (v11)
  {
    v12 = [(CNContactContainerPickerViewController *)self selectedContainerIdentifiers];
    BOOL v13 = (unint64_t)[v12 count] > 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(CNContactContainerPickerViewController *)self items];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [(CNContactContainerPickerViewController *)self selectedContainerIdentifiers];
  v10 = [v8 identifier];
  int v11 = [v9 arrayByAddingObject:v10];
  [(CNContactContainerPickerViewController *)self setSelectedContainerIdentifiers:v11];

  v12 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL v13 = [v8 identifier];
    int v14 = 138412290;
    int v15 = v13;
    _os_log_debug_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEBUG, "User selected container %@", (uint8_t *)&v14, 0xCu);
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactContainerPickerViewController *)self items];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];

  v9 = [(CNContactContainerPickerViewController *)self selectedContainerIdentifiers];
  v10 = [v8 identifier];
  LOBYTE(v7) = [v9 containsObject:v10] ^ 1;

  return v7;
}

- (void)setSelectedContainerIdentifiers:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_selectedContainerIdentifiers != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedContainerIdentifiers, a3);
    [(CNContactContainerPickerViewController *)self reloadData];
    id v5 = v6;
  }
}

- (void)reloadData
{
  v3 = [(CNContactContainerPickerViewController *)self collectionView];
  [v3 reloadData];

  v4 = [(CNContactContainerPickerViewController *)self items];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CNContactContainerPickerViewController_reloadData__block_invoke;
  v5[3] = &unk_1E549BE40;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __52__CNContactContainerPickerViewController_reloadData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 selectedContainerIdentifiers];
  v8 = [v6 identifier];

  LODWORD(v6) = [v7 containsObject:v8];
  if (v6)
  {
    id v10 = [*(id *)(a1 + 32) collectionView];
    v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    [v10 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
  }
}

- (id)currentSnapshot
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v3 appendSectionsWithIdentifiers:&unk_1ED915C98];
  v4 = [(CNContactContainerPickerViewController *)self items];
  [v3 appendItemsWithIdentifiers:v4 intoSectionWithIdentifier:@"SECTION"];

  return v3;
}

- (id)dataSourceWithCellRegistration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v6 = [(CNContactContainerPickerViewController *)self collectionView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CNContactContainerPickerViewController_dataSourceWithCellRegistration___block_invoke;
  v10[3] = &unk_1E549BE18;
  id v11 = v4;
  id v7 = v4;
  v8 = (void *)[v5 initWithCollectionView:v6 cellProvider:v10];

  return v8;
}

uint64_t __73__CNContactContainerPickerViewController_dataSourceWithCellRegistration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (void)setupDiffableDataSource
{
  id v3 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CNContactContainerPickerViewController_setupDiffableDataSource__block_invoke;
  v7[3] = &unk_1E549BDF0;
  v7[4] = self;
  id v5 = [v3 registrationWithCellClass:v4 configurationHandler:v7];
  id v6 = [(CNContactContainerPickerViewController *)self dataSourceWithCellRegistration:v5];
  [(CNContactContainerPickerViewController *)self setDataSource:v6];
}

void __65__CNContactContainerPickerViewController_setupDiffableDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  id v20 = v6;
  if (objc_opt_isKindOfClass()) {
    v8 = v20;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  id v10 = (void *)MEMORY[0x1E4FB1948];
  id v11 = v7;
  v12 = [v10 cellConfiguration];
  BOOL v13 = [*(id *)(a1 + 32) delegate];
  uint64_t v14 = *(void *)(a1 + 32);
  int v15 = [v11 identifier];
  uint64_t v16 = [v13 containerPicker:v14 shouldAllowDeselectionOfContainerWithIdentifier:v15];

  uint64_t v17 = [v11 name];

  [v12 setText:v17];
  [v9 setAllowsDeselection:v16];
  [v9 setContentConfiguration:v12];
  v18 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v18 setBackgroundColor:v19];

  [v9 setBackgroundConfiguration:v18];
}

- (void)setupCollectionView
{
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v11 setShowsSeparators:1];
  id v3 = [MEMORY[0x1E4FB1580] layoutWithListConfiguration:v11];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v5 = [(CNContactContainerPickerViewController *)self view];
  [v5 bounds];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  [(CNContactContainerPickerViewController *)self setCollectionView:v6];

  id v7 = [(CNContactContainerPickerViewController *)self collectionView];
  [v7 setAllowsMultipleSelection:1];

  v8 = [(CNContactContainerPickerViewController *)self view];
  id v9 = [(CNContactContainerPickerViewController *)self collectionView];
  [v8 addSubview:v9];

  id v10 = [(CNContactContainerPickerViewController *)self collectionView];
  [v10 setAutoresizingMask:18];
}

- (void)setupDoneButton
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 menu:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke;
  v6[3] = &unk_1E549BDC8;
  v6[4] = self;
  id v4 = [MEMORY[0x1E4FB13F0] actionWithHandler:v6];
  [v3 setPrimaryAction:v4];

  id v5 = [(CNContactContainerPickerViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v3];
}

uint64_t __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) containers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke_2;
    v8[3] = &unk_1E549BDA0;
    v8[4] = *(void *)(a1 + 32);
    id v5 = objc_msgSend(v4, "_cn_filter:", v8);

    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 containerPicker:*(void *)(a1 + 32) didFinishWithPickedContainers:v5];
  }
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedContainerIdentifiers];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactContainerPickerViewController;
  [(CNContactContainerPickerViewController *)&v8 viewDidLoad];
  [(CNContactContainerPickerViewController *)self setupDoneButton];
  [(CNContactContainerPickerViewController *)self setupCollectionView];
  [(CNContactContainerPickerViewController *)self setupDiffableDataSource];
  id v3 = [(CNContactContainerPickerViewController *)self dataSource];
  id v4 = [(CNContactContainerPickerViewController *)self collectionView];
  [v4 setDataSource:v3];

  id v5 = [(CNContactContainerPickerViewController *)self collectionView];
  [v5 setDelegate:self];

  uint64_t v6 = [(CNContactContainerPickerViewController *)self dataSource];
  id v7 = [(CNContactContainerPickerViewController *)self currentSnapshot];
  [v6 applySnapshot:v7 animatingDifferences:0];

  [(CNContactContainerPickerViewController *)self reloadData];
}

- (id)writableContainersForAccount:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1B9B0];
  uint64_t v6 = [v4 identifier];
  id v7 = [v5 predicateForContainersInAccountWithIdentifier:v6];

  objc_super v8 = [(CNContactContainerPickerViewController *)self contactViewCache];
  id v9 = [v8 contactStore];
  id v18 = 0;
  id v10 = [v9 containersMatchingPredicate:v7 error:&v18];
  id v11 = v18;

  if (v11)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v4 identifier];
      uint64_t v16 = [v11 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Error fetching containers in account %@: %@", buf, 0x16u);
    }
    BOOL v13 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__CNContactContainerPickerViewController_writableContainersForAccount___block_invoke;
    v17[3] = &unk_1E549BDA0;
    v17[4] = self;
    BOOL v13 = objc_msgSend(v10, "_cn_filter:", v17);
  }

  return v13;
}

uint64_t __71__CNContactContainerPickerViewController_writableContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    id v4 = [*(id *)(a1 + 32) contactViewCache];
    id v5 = [v4 policyForContainer:v3];

    uint64_t v6 = [v5 shouldAddContact:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)allAccounts
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(CNContactContainerPickerViewController *)self contactViewCache];
  id v3 = [v2 contactStore];
  id v9 = 0;
  id v4 = [v3 accountsMatchingPredicate:0 error:&v9];
  id v5 = v9;

  if (v5)
  {
    uint64_t v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_super v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);
    }
  }

  return v4;
}

- (void)discoverContainers
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "Fetching containers", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(CNContactContainerPickerViewController *)self allAccounts];
  uint64_t v7 = *MEMORY[0x1E4F5A258];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v6))
  {
    objc_super v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Accounts fetch returned 0 items", buf, 2u);
    }
    goto LABEL_37;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v45 = v6;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v9) {
    goto LABEL_34;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v58;
  uint64_t v46 = v7;
  uint64_t v47 = *(void *)v58;
  do
  {
    uint64_t v12 = 0;
    uint64_t v48 = v10;
    do
    {
      if (*(void *)v58 != v11) {
        objc_enumerationMutation(obj);
      }
      BOOL v13 = *(void **)(*((void *)&v57 + 1) + 8 * v12);
      uint64_t v14 = [(CNContactContainerPickerViewController *)self writableContainersForAccount:v13];
      if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v14) & 1) == 0)
      {
        uint64_t v50 = v12;
        v51 = v14;
        unint64_t v15 = [v14 count];
        uint64_t v16 = objc_msgSend((id)objc_opt_class(), "os_log");
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
        if (v15 < 2)
        {
          if (v17)
          {
            v39 = [v13 identifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v39;
            _os_log_debug_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEBUG, "Account %@ has only 1 container", buf, 0xCu);
          }
          v33 = [v14 firstObject];
          v34 = objc_msgSend(v13, "_cnui_displayName");
          v35 = objc_alloc_init(CNContactContainerPickerItem);
          [(CNContactContainerPickerItem *)v35 setName:v34];
          v36 = [v33 identifier];
          [(CNContactContainerPickerItem *)v35 setIdentifier:v36];

          [v5 addObject:v35];
          id v52 = v33;
          [v4 addObject:v33];
          v37 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v40 = [v33 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v62 = (uint64_t)v40;
            __int16 v63 = 2112;
            v64 = v34;
            _os_log_debug_impl(&dword_18B625000, v37, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);
          }
LABEL_30:
          uint64_t v11 = v47;
        }
        else
        {
          if (v17)
          {
            v38 = [v13 identifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v38;
            _os_log_debug_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEBUG, "Account %@ has more than 1 container", buf, 0xCu);
          }
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v52 = v14;
          uint64_t v18 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v54;
            __int16 v21 = (char *)&unk_1EC171000;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v54 != v20) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                id v24 = objc_alloc_init((Class)(v21 + 3352));
                v25 = [v23 name];
                [v24 setName:v25];

                v26 = [v23 identifier];
                [v24 setIdentifier:v26];

                [v5 addObject:v24];
                [v4 addObject:v23];
                v27 = objc_msgSend((id)objc_opt_class(), "os_log");
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  [v23 identifier];
                  v28 = self;
                  v29 = v5;
                  v31 = v30 = v4;
                  v32 = [v23 name];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v62 = (uint64_t)v31;
                  __int16 v63 = 2112;
                  v64 = v32;
                  _os_log_debug_impl(&dword_18B625000, v27, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

                  id v4 = v30;
                  id v5 = v29;
                  self = v28;
                  __int16 v21 = (unsigned char *)&unk_1EC171000;
                }
              }
              uint64_t v19 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }
            while (v19);
            uint64_t v7 = v46;
            goto LABEL_30;
          }
        }

        uint64_t v10 = v48;
        uint64_t v12 = v50;
        uint64_t v14 = v51;
      }

      ++v12;
    }
    while (v12 != v10);
    uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  }
  while (v10);
LABEL_34:

  v41 = (void *)[v4 copy];
  [(CNContactContainerPickerViewController *)self setContainers:v41];

  v42 = (void *)[v5 copy];
  [(CNContactContainerPickerViewController *)self setItems:v42];

  objc_super v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v43 = [(CNContactContainerPickerViewController *)self containers];
    uint64_t v44 = [v43 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v62 = v44;
    _os_log_debug_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEBUG, "Finished fetching %lu containers", buf, 0xCu);
  }
  uint64_t v6 = v45;
LABEL_37:
}

- (CNContactContainerPickerViewController)initWithContactViewCache:(id)a3 selectedContainerIdentifiers:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactContainerPickerViewController;
  uint64_t v11 = [(CNContactContainerPickerViewController *)&v17 initWithNibName:0 bundle:0];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contactViewCache, a3);
    uint64_t v13 = [v10 count];
    uint64_t v14 = v10;
    if (!v13)
    {
      id v4 = [v9 contactStore];
      id v5 = [v4 defaultContainerIdentifier];
      v18[0] = v5;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
    objc_storeStrong((id *)&v12->_selectedContainerIdentifiers, v14);
    if (!v13)
    {
    }
    objc_storeStrong((id *)&v12->_contactViewCache, a3);
    [(CNContactContainerPickerViewController *)v12 discoverContainers];
    unint64_t v15 = v12;
  }

  return v12;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_65069 != -1) {
    dispatch_once(&os_log_cn_once_token_1_65069, &__block_literal_global_65070);
  }
  v2 = (void *)os_log_cn_once_object_1_65071;

  return v2;
}

void __48__CNContactContainerPickerViewController_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "container-picker");
  v1 = (void *)os_log_cn_once_object_1_65071;
  os_log_cn_once_object_1_65071 = (uint64_t)v0;
}

@end