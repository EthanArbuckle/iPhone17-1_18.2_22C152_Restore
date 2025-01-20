@interface DMCEnrollmentManagementDetailsOverviewViewController
- (DMCEnrollmentManagementDetailsOverviewViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 profile:(id)a5;
- (DMCEnrollmentManagementDetailsOverviewViewControllerDelegate)delegate;
- (MCProfile)profile;
- (NSString)managedAppleID;
- (void)_setupNavigationBar;
- (void)leftBarButtonTapped:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setManagedAppleID:(id)a3;
- (void)setProfile:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentManagementDetailsOverviewViewController

- (DMCEnrollmentManagementDetailsOverviewViewController)initWithDelegate:(id)a3 managedAppleID:(id)a4 profile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DMCLocalizedString();
  v23.receiver = self;
  v23.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  v12 = [(DMCEnrollmentTemplateTableViewController *)&v23 initWithIconNames:&unk_26D44B080 title:v11 subTitle:0];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a5);
    objc_storeWeak((id *)&v12->_delegate, v8);
    v13 = objc_opt_new();
    v14 = [DMCEnrollmentTableViewTextCell alloc];
    v15 = DMCLocalizedFormat();
    v16 = -[DMCEnrollmentTableViewTextCell initWithText:bold:](v14, "initWithText:bold:", v15, 0, v9);
    [v13 addObject:v16];

    v17 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:&stru_26D435FC0 bold:0];
    objc_initWeak(&location, v12);
    v18 = DMCLocalizedString();
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke;
    v20[3] = &unk_2645E9398;
    objc_copyWeak(&v21, &location);
    [(DMCEnrollmentTableViewTextCell *)v17 configureLinkText:v18 forceLineBreak:0 linkAction:v20];

    [v13 addObject:v17];
    [(DMCEnrollmentTemplateTableViewController *)v12 addCellData:v13 animated:0];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke_2;
    block[3] = &unk_2645E90A0;
    id v4 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __96__DMCEnrollmentManagementDetailsOverviewViewController_initWithDelegate_managedAppleID_profile___block_invoke_2(uint64_t a1)
{
  v2 = [DMCProfileViewModel alloc];
  v3 = [*(id *)(a1 + 32) profile];
  v7 = [(DMCProfileViewModel *)v2 initWithProfile:v3 managedPayloads:0];

  id v4 = [[DMCProfileDetailsViewController alloc] initWithProfileViewModel:v7 mode:1];
  v5 = DMCLocalizedString();
  [(DMCProfileDetailsViewController *)v4 setTableTitle:v5];

  v6 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v4];
  if ([MEMORY[0x263F38B98] isPad]) {
    [v6 setModalPresentationStyle:2];
  }
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  [(DMCEnrollmentManagementDetailsOverviewViewController *)&v12 loadView];
  objc_initWeak(&location, self);
  v3 = [DMCEnrollmentConfirmationView alloc];
  id v4 = DMCLocalizedString();
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __64__DMCEnrollmentManagementDetailsOverviewViewController_loadView__block_invoke;
  id v9 = &unk_2645E9398;
  objc_copyWeak(&v10, &location);
  v5 = [(DMCEnrollmentConfirmationView *)v3 initWithConfirmationText:v4 cancelText:@" " confirmationAction:&v6 cancelAction:&__block_literal_global_3];

  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__DMCEnrollmentManagementDetailsOverviewViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 managementDetailsOverviewViewController:v3 didReceiveUserAction:1];

    id WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentManagementDetailsOverviewViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v4 viewWillAppear:a3];
  if (([(DMCEnrollmentManagementDetailsOverviewViewController *)self isBeingPresented] & 1) != 0
    || [(DMCEnrollmentManagementDetailsOverviewViewController *)self isMovingToParentViewController])
  {
    [(DMCEnrollmentManagementDetailsOverviewViewController *)self _setupNavigationBar];
  }
}

- (void)_setupNavigationBar
{
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = [(DMCEnrollmentManagementDetailsOverviewViewController *)self delegate];
  [v4 managementDetailsOverviewViewController:self didReceiveUserAction:0];
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (DMCEnrollmentManagementDetailsOverviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentManagementDetailsOverviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
}

@end