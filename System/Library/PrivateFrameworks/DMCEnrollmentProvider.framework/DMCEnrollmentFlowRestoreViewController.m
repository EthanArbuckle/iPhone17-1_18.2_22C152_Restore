@interface DMCEnrollmentFlowRestoreViewController
- (DMCEnrollmentConfirmationView)confirmationView;
- (DMCEnrollmentFlowRestoreViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 restoreSnapshot:(id)a5 conflictingApps:(id)a6;
- (DMCEnrollmentFlowRestoreViewControllerDelegate)delegate;
- (DMCRFSnapshot)restoreSnapshot;
- (id)_appNamesFromBunldeIDs:(id)a3;
- (void)loadView;
- (void)setConfirmationView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRestoreSnapshot:(id)a3;
- (void)updateContinueButtonStatus;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentFlowRestoreViewController

- (DMCEnrollmentFlowRestoreViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 restoreSnapshot:(id)a5 conflictingApps:(id)a6
{
  v48[1] = *MEMORY[0x263EF8340];
  id obj = a3;
  id v36 = a4;
  id v39 = a5;
  id v10 = a6;
  v38 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"clock.arrow.circlepath"];
  v48[0] = v38;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
  v12 = DMCLocalizedString();
  v43.receiver = self;
  v43.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  v13 = [(DMCEnrollmentTemplateTableViewController *)&v43 initWithIconImages:v11 title:v12 subTitle:0];

  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, obj);
    objc_storeStrong((id *)&v13->_restoreSnapshot, a5);
    v35 = [v39 date];
    v34 = [MEMORY[0x263F08790] localizedStringFromDate:v35 dateStyle:2 timeStyle:1];
    v14 = [DMCEnrollmentTableViewTextCell alloc];
    v15 = DMCLocalizedFormat();
    v16 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v14, "initWithText:bold:", v15, 0, v36, v34);
    v47[0] = v16;
    v17 = [DMCEnrollmentTableViewTextCell alloc];
    v18 = [v39 deviceName];
    v19 = [(DMCEnrollmentTableViewTextCell *)v17 initWithText:v18 bold:1];
    v47[1] = v19;
    v20 = [DMCEnrollmentTableViewTextCell alloc];
    v21 = DMCLocalizedString();
    v22 = [(DMCEnrollmentTableViewTextCell *)v20 initWithText:v21 bold:0];
    v47[2] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];

    [(DMCEnrollmentTemplateTableViewController *)v13 addSectionWithCellData:v23 animated:0];
    if ([v10 count])
    {
      [v10 count];
      v24 = DMCLocalizedStringByDevice();
      v25 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:v24 bold:0];
      v46 = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      [(DMCEnrollmentTemplateTableViewController *)v13 addCellData:v26 animated:0];

      v27 = [DMCEnrollmentNameListCell alloc];
      v28 = [(DMCEnrollmentFlowRestoreViewController *)v13 _appNamesFromBunldeIDs:v10];
      v29 = [(DMCEnrollmentNameListCell *)v27 initWithNames:v28 numberOfColumns:2];
      v45 = v29;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      [(DMCEnrollmentTemplateTableViewController *)v13 addSectionWithCellData:v30 animated:0];
    }
    objc_initWeak(&location, v13);
    uint64_t v44 = objc_opt_class();
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke;
    v40[3] = &unk_2645E8EB0;
    objc_copyWeak(&v41, &location);
    id v32 = (id)[(DMCEnrollmentFlowRestoreViewController *)v13 registerForTraitChanges:v31 withHandler:v40];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = WeakRetained;
  BSRunLoopPerformAfterCACommit();
}

void __106__DMCEnrollmentFlowRestoreViewController_initWithDelegate_managedAppleID_restoreSnapshot_conflictingApps___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  [(DMCEnrollmentFlowRestoreViewController *)&v12 loadView];
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  v4 = DMCLocalizedString();
  v5 = DMCLocalizedString();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke;
  v9[3] = &unk_2645E9398;
  objc_copyWeak(&v10, &location);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke_32;
  v7[3] = &unk_2645E9398;
  objc_copyWeak(&v8, &location);
  v6 = [(DMCEnrollmentConfirmationView *)v3 initWithConfirmationText:v4 cancelText:v5 confirmationAction:v9 cancelAction:v7];

  [(DMCEnrollmentTemplateTableViewController *)self addBottomView:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_221CC5000, v2, OS_LOG_TYPE_INFO, "DMCEnrollmentFlowRestoreViewController will restore", v4, 2u);
    }
    [WeakRetained setInProgress:1];
    v3 = [WeakRetained delegate];
    [v3 restoreViewController:WeakRetained didReceiveUserAction:1];
  }
}

void __50__DMCEnrollmentFlowRestoreViewController_loadView__block_invoke_32(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_221CC5000, v2, OS_LOG_TYPE_INFO, "DMCEnrollmentFlowRestoreViewController skip restore", v4, 2u);
    }
    v3 = [WeakRetained delegate];
    [v3 restoreViewController:WeakRetained didReceiveUserAction:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMCEnrollmentFlowRestoreViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v5 viewWillAppear:a3];
  v4 = [(DMCEnrollmentFlowRestoreViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  [(DMCEnrollmentFlowRestoreViewController *)self setModalInPresentation:1];
}

- (void)updateContinueButtonStatus
{
  BOOL v3 = [(DMCEnrollmentTemplateTableViewController *)self inProgress];
  id v4 = [(DMCEnrollmentFlowRestoreViewController *)self confirmationView];
  [v4 setInProgress:v3];
}

- (id)_appNamesFromBunldeIDs:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138543618;
    long long v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263F01878]);
        id v23 = 0;
        v13 = (void *)[v12 initWithBundleIdentifier:v11 allowPlaceholder:0 error:&v23];
        id v14 = v23;
        if (v14)
        {
          v15 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v29 = v11;
            __int16 v30 = 2114;
            id v31 = v14;
            _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@", buf, 0x16u);
          }
        }
        v16 = objc_msgSend(v13, "localizedShortName", v22);
        v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v18 = [v13 localizedName];
        }
        v19 = v18;

        if (v19) {
          v20 = v19;
        }
        else {
          v20 = v11;
        }
        [v4 addObject:v20];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  return v4;
}

- (DMCEnrollmentFlowRestoreViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentFlowRestoreViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DMCRFSnapshot)restoreSnapshot
{
  return self->_restoreSnapshot;
}

- (void)setRestoreSnapshot:(id)a3
{
}

- (DMCEnrollmentConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_restoreSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end