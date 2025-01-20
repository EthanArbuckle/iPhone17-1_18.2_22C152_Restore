@interface HUManagedConfigurationProfilesViewController
- (BOOL)profileViewControllerIsProfileInstalled;
- (HMAccessory)accessory;
- (HUManagedConfigurationProfilesViewController)initWithAccessory:(id)a3;
- (HUPresentationDelegate)presentationDelegate;
- (NAFuture)fetchDataFuture;
- (NSArray)profiles;
- (UITableViewDiffableDataSource)tableViewDataSource;
- (id)_confirmProfileDeletion:(id)a3;
- (id)_newCellForProfile:(id)a3;
- (id)_profileForIdentifier:(id)a3;
- (id)_removeProfileForIdentifier:(id)a3;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)_fetchDataAndReloadTable;
- (void)_reloadTableViewWithExistingData;
- (void)profileViewControllerDidSelectRemoveProfile:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setFetchDataFuture:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setTableViewDataSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUManagedConfigurationProfilesViewController

- (HUManagedConfigurationProfilesViewController)initWithAccessory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUManagedConfigurationProfilesViewController;
  v5 = [(HUManagedConfigurationProfilesViewController *)&v8 initWithStyle:2];
  if (v5)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HUManagedConfigurationProfilesTitle", @"HUManagedConfigurationProfilesTitle", 1);
    [(HUManagedConfigurationProfilesViewController *)v5 setTitle:v6];

    [(HUManagedConfigurationProfilesViewController *)v5 setAccessory:v4];
  }

  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUManagedConfigurationProfilesViewController;
  [(HUManagedConfigurationProfilesViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42EB0]);
  id v4 = [(HUManagedConfigurationProfilesViewController *)self tableView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUManagedConfigurationProfilesViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E638F740;
  v6[4] = self;
  v5 = (void *)[v3 initWithTableView:v4 cellProvider:v6];
  [(HUManagedConfigurationProfilesViewController *)self setTableViewDataSource:v5];
}

id __59__HUManagedConfigurationProfilesViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = (void *)[*(id *)(a1 + 32) _newCellForProfile:a4];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)HUManagedConfigurationProfilesViewController;
  [(HUManagedConfigurationProfilesViewController *)&v5 viewWillAppear:a3];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v7 = self;
    __int16 v8 = 2080;
    v9 = "-[HUManagedConfigurationProfilesViewController viewWillAppear:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@)%s: beginning fetch & reload sequence", buf, 0x16u);
  }

  [(HUManagedConfigurationProfilesViewController *)self _fetchDataAndReloadTable];
}

- (id)_newCellForProfile:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F742B0]);
  objc_super v7 = [(HUManagedConfigurationProfilesViewController *)self profiles];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__HUManagedConfigurationProfilesViewController__newCellForProfile___block_invoke;
  v18[3] = &unk_1E638F768;
  id v8 = v5;
  id v19 = v8;
  v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v18);

  uint64_t v10 = (void *)MEMORY[0x1E4F74220];
  v11 = [v9 profileData];
  id v17 = 0;
  v12 = [v10 profileWithData:v11 outError:&v17];
  id v13 = v17;

  if (v13)
  {
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);
    }
  }
  [v6 setProfile:v12];
  [v6 setAccessoryType:1];

  return v6;
}

uint64_t __67__HUManagedConfigurationProfilesViewController__newCellForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_fetchDataAndReloadTable
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUManagedConfigurationProfilesViewController *)self fetchDataFuture];
  if (v4)
  {
    id v5 = [(HUManagedConfigurationProfilesViewController *)self fetchDataFuture];
    char v6 = [v5 isFinished];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = self;
        __int16 v24 = 2080;
        v25 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]";
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%@)%s: Called with existing fetch future - cancelling existing future", buf, 0x16u);
      }

      id v8 = [(HUManagedConfigurationProfilesViewController *)self fetchDataFuture];
      [v8 cancel];
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke;
  v21[3] = &unk_1E6388BE0;
  v21[4] = self;
  v9 = [MEMORY[0x1E4F7A0D8] futureWithCompletionHandlerAdapterBlock:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_2;
  v20[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v20[4] = a2;
  id v10 = (id)[v9 addFailureBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_36;
  v19[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v19[4] = a2;
  id v11 = (id)[v9 addSuccessBlock:v19];
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    __int16 v24 = 2080;
    v25 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]";
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%@)%s: Kicking off fetch future - will reload if successful", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_39;
  id v17 = &unk_1E638F790;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = [v9 flatMap:&v14];
  -[HUManagedConfigurationProfilesViewController setFetchDataFuture:](self, "setFetchDataFuture:", v13, v14, v15, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessory];
  [v4 fetchManagedConfigurationProfilesWithCompletionHandler:v3];
}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    objc_super v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching managed configuration profiles %@", (uint8_t *)&v6, 0x16u);
  }
}

void __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    objc_super v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "%@ fetching managed configuration profiles returned %@", (uint8_t *)&v6, 0x16u);
  }
}

id __72__HUManagedConfigurationProfilesViewController__fetchDataAndReloadTable__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setProfiles:v3];

  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = WeakRetained;
    __int16 v10 = 2080;
    id v11 = "-[HUManagedConfigurationProfilesViewController _fetchDataAndReloadTable]_block_invoke";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%@)%s: fetch future succeeded, reloading table view...", (uint8_t *)&v8, 0x16u);
  }

  [WeakRetained _reloadTableViewWithExistingData];
  int v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v6;
}

- (void)_reloadTableViewWithExistingData
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke;
  v3[3] = &unk_1E63862A0;
  objc_copyWeak(&v4, &location);
  [v2 performBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = WeakRetained;
    __int16 v15 = 2080;
    v16 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: Reload for managed configuration profiles table", buf, 0x16u);
  }

  id v3 = objc_opt_new();
  id v4 = [WeakRetained profiles];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_222);
  [v3 appendSectionsWithIdentifiers:v5];

  int v6 = [WeakRetained profiles];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_2;
  v11[3] = &unk_1E638F7D8;
  id v7 = v3;
  id v12 = v7;
  objc_msgSend(v6, "na_each:", v11);

  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v14 = WeakRetained;
    __int16 v15 = 2080;
    v16 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke_3";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(%@)%s: applying snapshot: %@", buf, 0x20u);
  }

  id v9 = [WeakRetained tableViewDataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_48;
  v10[3] = &unk_1E6386018;
  v10[4] = WeakRetained;
  [v9 applySnapshot:v7 animatingDifferences:0 completion:v10];
}

uint64_t __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_43(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  int v6 = [v3 identifier];

  [v2 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:v6];
}

void __80__HUManagedConfigurationProfilesViewController__reloadTableViewWithExistingData__block_invoke_48(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2080;
    id v7 = "-[HUManagedConfigurationProfilesViewController _reloadTableViewWithExistingData]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%@)%s: snapshot applied", (uint8_t *)&v4, 0x16u);
  }
}

- (id)_profileForIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = [(HUManagedConfigurationProfilesViewController *)self profiles];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__HUManagedConfigurationProfilesViewController__profileForIdentifier___block_invoke;
  v17[3] = &unk_1E638F768;
  id v7 = v5;
  id v18 = v7;
  uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v17);

  id v9 = (void *)MEMORY[0x1E4F74220];
  __int16 v10 = [v8 profileData];
  id v16 = 0;
  id v11 = [v9 profileWithData:v10 outError:&v16];
  id v12 = v16;

  if (v12)
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);
    }
  }

  return v11;
}

uint64_t __70__HUManagedConfigurationProfilesViewController__profileForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_removeProfileForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[HUManagedConfigurationProfilesViewController _removeProfileForIdentifier:]";
    __int16 v16 = 2112;
    __int16 v17 = self;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%s(%@) Removing profileIdentifier = %@ ", buf, 0x20u);
  }

  id v7 = [(HUManagedConfigurationProfilesViewController *)self _profileForIdentifier:v5];
  if (v7)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v8 = [(HUManagedConfigurationProfilesViewController *)self _confirmProfileDeletion:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke;
    v11[3] = &unk_1E638F850;
    objc_copyWeak(v13, (id *)buf);
    id v12 = v5;
    v13[1] = (id)a2;
    id v9 = [v8 flatMap:v11];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v9;
}

id __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_2;
  v19[3] = &unk_1E638F800;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  id v20 = *(id *)(a1 + 32);
  __int16 v6 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_3;
  v16[3] = &unk_1E6386978;
  uint64_t v18 = *(void *)(a1 + 48);
  id v17 = *(id *)(a1 + 32);
  id v7 = (id)[v6 addFailureBlock:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_51;
  v12[3] = &unk_1E638F828;
  uint64_t v15 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 32);
  id v14 = WeakRetained;
  id v8 = (id)[v6 addSuccessBlock:v12];
  id v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  __int16 v10 = [v6 reschedule:v9];

  objc_destroyWeak(&v21);

  return v10;
}

void __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained accessory];
  [v5 removeManagedConfigurationProfileWithIdentifier:*(void *)(a1 + 32) completionHandler:v4];
}

void __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    id v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@ Error removing profile %@: %@", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __76__HUManagedConfigurationProfilesViewController__removeProfileForIdentifier___block_invoke_51(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    int v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@ Profile %@ removed", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 40) _fetchDataAndReloadTable];
}

- (id)_confirmProfileDeletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  int v6 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerRemoveProfile", @"HUAccessorySettingsProfileViewControllerRemoveProfile", 1);
  int v7 = [v4 needsReboot];

  if (v7) {
    __int16 v8 = @"HUAccessorySettingsProfileViewControllerRemoveNeedsReboot";
  }
  else {
    __int16 v8 = @"HUAccessorySettingsProfileViewControllerRemove";
  }
  uint64_t v9 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerDeleteActionTitle", @"HUAccessorySettingsProfileViewControllerDeleteActionTitle", 1);
  __int16 v11 = _HULocalizedStringWithDefaultValue(@"HUAccessorySettingsProfileViewControllerCancelActionTitle", @"HUAccessorySettingsProfileViewControllerCancelActionTitle", 1);
  id v12 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  uint64_t v13 = (void *)MEMORY[0x1E4F42720];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke;
  v27[3] = &unk_1E6385188;
  id v14 = v5;
  id v28 = v14;
  uint64_t v15 = [v13 actionWithTitle:v10 style:2 handler:v27];
  [v12 addAction:v15];

  __int16 v16 = (void *)MEMORY[0x1E4F42720];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke_2;
  v25 = &unk_1E6385188;
  id v17 = v14;
  id v26 = v17;
  uint64_t v18 = [v16 actionWithTitle:v11 style:1 handler:&v22];
  objc_msgSend(v12, "addAction:", v18, v22, v23, v24, v25);

  [(HUManagedConfigurationProfilesViewController *)self presentViewController:v12 animated:1 completion:0];
  id v19 = v26;
  id v20 = v17;

  return v20;
}

uint64_t __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

void __72__HUManagedConfigurationProfilesViewController__confirmProfileDeletion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(HUManagedConfigurationProfilesViewController *)self tableViewDataSource];
  int v7 = [v6 itemIdentifierForIndexPath:v5];

  __int16 v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    uint64_t v13 = "-[HUManagedConfigurationProfilesViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v14 = 2112;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@) tapping indexPath = %@/profileIdentifier = %@ ", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t v9 = [(HUManagedConfigurationProfilesViewController *)self _profileForIdentifier:v7];
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F742B8]) initWithStyle:1 profile:v9 profileViewMode:2];
    [v10 setProfileViewControllerDelegate:self];
    __int16 v11 = [(HUManagedConfigurationProfilesViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "-[HUManagedConfigurationProfilesViewController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]";
    __int16 v23 = 2112;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@) User swiped for trailing actions on indexPath = %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v9 = (void *)MEMORY[0x1E4F42900];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUProfileDeletion", @"HUProfileDeletion", 1);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__HUManagedConfigurationProfilesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v17[3] = &unk_1E638B400;
  objc_copyWeak(&v19, (id *)buf);
  id v11 = v7;
  id v18 = v11;
  int v12 = [v9 contextualActionWithStyle:1 title:v10 handler:v17];

  uint64_t v13 = (void *)MEMORY[0x1E4F42E68];
  uint64_t v20 = v12;
  __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v15 = [v13 configurationWithActions:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v15;
}

void __109__HUManagedConfigurationProfilesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained tableViewDataSource];
  __int16 v8 = [v7 itemIdentifierForIndexPath:*(void *)(a1 + 32)];

  id v9 = (id)[WeakRetained _removeProfileForIdentifier:v8];
  v6[2](v6, 1);
}

- (BOOL)profileViewControllerIsProfileInstalled
{
  id v2 = [(HUManagedConfigurationProfilesViewController *)self profiles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)profileViewControllerDidSelectRemoveProfile:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HUManagedConfigurationProfilesViewController *)self profiles];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke;
  v19[3] = &unk_1E638F878;
  SEL v21 = a2;
  id v7 = v5;
  id v20 = v7;
  __int16 v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v19);

  if (v8)
  {
    objc_initWeak((id *)location, self);
    id v9 = [v8 identifier];
    uint64_t v10 = [(HUManagedConfigurationProfilesViewController *)self _removeProfileForIdentifier:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke_80;
    v16[3] = &unk_1E638B0E0;
    objc_copyWeak(&v18, (id *)location);
    id v17 = v7;
    id v11 = (id)[v10 flatMap:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    int v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      __int16 v14 = [v7 UIProfile];
      uint64_t v15 = [v14 profile];
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v13;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@ Profile %@ not found !?", location, 0x16u);
    }
  }
}

uint64_t __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F74220];
  id v5 = [v3 profileData];
  id v16 = 0;
  id v6 = [v4 profileWithData:v5 outError:&v16];
  id v7 = v16;

  if (v7)
  {
    __int16 v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "%@ Profile not found for %@", buf, 0x16u);
    }
  }
  id v9 = [v6 UUID];
  uint64_t v10 = [*(id *)(a1 + 32) UIProfile];
  id v11 = [v10 profile];
  int v12 = [v11 UUID];
  uint64_t v13 = [v9 isEqualToString:v12];

  return v13;
}

id __92__HUManagedConfigurationProfilesViewController_profileViewControllerDidSelectRemoveProfile___block_invoke_80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) navigationController];
  id v4 = (id)[v3 popViewControllerAnimated:1];

  id v5 = [WeakRetained profiles];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    id v7 = [WeakRetained navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
  [WeakRetained _fetchDataAndReloadTable];
  id v9 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v9;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (NAFuture)fetchDataFuture
{
  return self->_fetchDataFuture;
}

- (void)setFetchDataFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDataFuture, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end