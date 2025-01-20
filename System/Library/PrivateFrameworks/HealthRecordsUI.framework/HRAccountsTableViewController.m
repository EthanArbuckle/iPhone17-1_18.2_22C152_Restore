@interface HRAccountsTableViewController
- (HKClinicalAccountStore)clinicalAccountStore;
- (HRAccountsTableViewController)init;
- (HRContentStatusView)loadingView;
- (HRProfile)profile;
- (HRRecordViewControllerFactory)factory;
- (NSArray)accounts;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_hideLoadingIndicator;
- (void)_reloadAccounts;
- (void)_showLoadingIndicator;
- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5;
- (void)setAccounts:(id)a3;
- (void)setFactory:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HRAccountsTableViewController

- (HRAccountsTableViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)HRAccountsTableViewController;
  v2 = [(HRAccountsTableViewController *)&v13 initWithStyle:2];
  if (v2)
  {
    v3 = +[HRProfileManager sharedInstance];
    uint64_t v4 = [v3 currentProfile];
    profile = v2->_profile;
    v2->_profile = (HRProfile *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F67710]);
    v7 = [(HRProfile *)v2->_profile healthStore];
    uint64_t v8 = [v6 initWithHealthStore:v7];
    clinicalAccountStore = v2->_clinicalAccountStore;
    v2->_clinicalAccountStore = (HKClinicalAccountStore *)v8;

    uint64_t v10 = +[HRViewControllerFactory shared];
    factory = v2->_factory;
    v2->_factory = (HRRecordViewControllerFactory *)v10;
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HRAccountsTableViewController;
  [(HRAccountsTableViewController *)&v10 viewDidLoad];
  v3 = HRLocalizedString(@"HEALTH_RECORDS_TITLE");
  [(HRAccountsTableViewController *)self setTitle:v3];

  uint64_t v4 = [(HRAccountsTableViewController *)self tableView];
  [v4 _setSectionCornerRadius:10.0];

  v5 = [(HRAccountsTableViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = +[HRAccountTableViewCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  uint64_t v8 = objc_alloc_init(HRContentStatusView);
  [(HRAccountsTableViewController *)self setLoadingView:v8];

  [(HRAccountsTableViewController *)self _reloadAccounts];
  v9 = [(HRAccountsTableViewController *)self clinicalAccountStore];
  [v9 addAccountStateChangeListener:self];
}

- (void)_reloadAccounts
{
  objc_initWeak(&location, self);
  [(HRAccountsTableViewController *)self _showLoadingIndicator];
  v3 = [(HRAccountsTableViewController *)self profile];
  uint64_t v4 = [v3 clinicalSourcesDataProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HRAccountsTableViewController__reloadAccounts__block_invoke;
  v6[3] = &unk_1E644A988;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v4 fetchAccountsForDisplayWithCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__HRAccountsTableViewController__reloadAccounts__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setAccounts:v3];
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
  [(HRAccountsTableViewController *)self _hideLoadingIndicator];
  id v4 = [(HRAccountsTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)_showLoadingIndicator
{
  id v3 = [(HRAccountsTableViewController *)self loadingView];
  [v3 startAnimating];

  id v4 = [(HRAccountsTableViewController *)self loadingView];
  id v5 = [(HRAccountsTableViewController *)self tableView];
  [v5 setBackgroundView:v4];

  id v6 = [(HRAccountsTableViewController *)self tableView];
  [v6 setScrollEnabled:0];
}

- (void)_hideLoadingIndicator
{
  id v3 = [(HRAccountsTableViewController *)self loadingView];
  [v3 stopAnimating];

  id v4 = [(HRAccountsTableViewController *)self tableView];
  [v4 setBackgroundView:0];

  id v5 = [(HRAccountsTableViewController *)self tableView];
  [v5 setScrollEnabled:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HRAccountsTableViewController *)self accounts];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HRAccountTableViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  objc_super v10 = [(HRAccountsTableViewController *)self accounts];
  uint64_t v11 = [v6 row];

  v12 = [v10 objectAtIndexedSubscript:v11];

  objc_super v13 = [(HRAccountsTableViewController *)self profile];
  v14 = [v13 clinicalSourcesDataProvider];
  [v9 configureWithAccount:v12 dataProvider:v14];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(HRAccountsTableViewController *)self accounts];
  uint64_t v8 = [v6 row];

  id v14 = [v7 objectAtIndexedSubscript:v8];

  v9 = [HRMedicalRecordTimelineViewController alloc];
  objc_super v10 = [(HRAccountsTableViewController *)self profile];
  uint64_t v11 = [v14 identifier];
  v12 = [(HRMedicalRecordTimelineViewController *)v9 initWithProfile:v10 accountId:v11];

  objc_super v13 = [(HRAccountsTableViewController *)self navigationController];
  [v13 pushViewController:v12 animated:1];
}

- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HRAccountsTableViewController_clinicalAccountStore_accountDidChange_changeType___block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__HRAccountsTableViewController_clinicalAccountStore_accountDidChange_changeType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccounts];
}

- (HRProfile)profile
{
  return self->_profile;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HRRecordViewControllerFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (HRContentStatusView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end