@interface AMSUINotificationSettingsViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUILoadingView)loadingView;
- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5;
- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 bag:(id)a4;
- (AMSUINotificationSettingsViewModel)model;
- (BOOL)_isAuthenticated;
- (BOOL)shouldDeepLink;
- (NSMutableDictionary)changedItems;
- (NSString)identifier;
- (UITableView)tableView;
- (UNUserNotificationCenter)notificationCenter;
- (_UIContentUnavailableView)errorView;
- (id)_promptForAuthentication;
- (void)_commitChangedItemsUpdates;
- (void)_commonSetup;
- (void)_handleAllowNotificationsButton;
- (void)_handleAuthenticationError:(id)a3;
- (void)_loadData;
- (void)_updateNotificationStatus;
- (void)dealloc;
- (void)setChangedItems:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setModel:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setShouldDeepLink:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didReceiveValueChange:(id)a4 forItem:(id)a5;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUINotificationSettingsViewController

- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5
{
  return [(AMSUINotificationSettingsViewController *)self initWithIdentifier:a3 bag:a5];
}

- (AMSUINotificationSettingsViewController)initWithIdentifier:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUINotificationSettingsViewController;
  v9 = [(AMSUINotificationSettingsViewController *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    changedItems = v9->_changedItems;
    v9->_changedItems = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v9->_identifier, a3);
    [(AMSUINotificationSettingsViewController *)v9 _commonSetup];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)AMSUINotificationSettingsViewController;
  [(AMSUINotificationSettingsViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AMSUINotificationSettingsViewController;
  [(AMSUINotificationSettingsViewController *)&v16 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__appWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];

  objc_super v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [(AMSUINotificationSettingsViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(AMSUINotificationSettingsViewController *)self bag];
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v8 = AMSUILocalizedStringFromBundle(@"NOTIFICATIONS_SETTINGS_TITLE", v6, v7);
  [(AMSUINotificationSettingsViewController *)self setTitle:v8];

  v9 = [(AMSUINotificationSettingsViewController *)self navigationItem];
  [v9 setLargeTitleDisplayMode:2];

  if ([(AMSUINotificationSettingsViewController *)self _isAuthenticated])
  {
    [(AMSUINotificationSettingsViewController *)self _loadData];
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_opt_class();
      objc_super v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] User authenticated, setting up table";
LABEL_10:
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEBUG, v14, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = objc_opt_class();
      objc_super v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      v20 = v13;
      v14 = "%{public}@: [%{public}@] User not authenticated, delaying table setup";
      goto LABEL_10;
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AMSUINotificationSettingsViewController;
  [(AMSUINotificationSettingsViewController *)&v11 viewDidAppear:a3];
  if (![(AMSUINotificationSettingsViewController *)self _isAuthenticated])
  {
    objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v4)
    {
      objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User not authenticated, prompting for authentication.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    id v8 = [(AMSUINotificationSettingsViewController *)self _promptForAuthentication];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke;
    v9[3] = &unk_2643E4098;
    objc_copyWeak(&v10, (id *)buf);
    [v8 addFinishBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke_2;
  block[3] = &unk_2643E3360;
  id v11 = v5;
  id v12 = WeakRetained;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__AMSUINotificationSettingsViewController_viewDidAppear___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return [v2 _loadData];
  }
  else {
    return [v2 _handleAuthenticationError:a1[6]];
  }
}

- (void)viewWillLayoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)AMSUINotificationSettingsViewController;
  [(AMSUINotificationSettingsViewController *)&v33 viewWillLayoutSubviews];
  uint64_t v3 = [(AMSUINotificationSettingsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(AMSUINotificationSettingsViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  id v13 = [(AMSUINotificationSettingsViewController *)self view];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(AMSUINotificationSettingsViewController *)self loadingView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(AMSUINotificationSettingsViewController *)self view];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(AMSUINotificationSettingsViewController *)self errorView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUINotificationSettingsViewController;
  [(AMSUINotificationSettingsViewController *)&v4 viewWillDisappear:a3];
  [(AMSUINotificationSettingsViewController *)self _commitChangedItemsUpdates];
}

- (void)_commitChangedItemsUpdates
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUINotificationSettingsViewController *)self changedItems];
  objc_super v4 = [v3 allValues];

  uint64_t v5 = [v4 count];
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  double v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      double v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      double v10 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = [v4 count];
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating %lu notification settings", buf, 0x20u);
    }
    id v11 = objc_alloc(MEMORY[0x263F27DB0]);
    id v12 = [(AMSUINotificationSettingsViewController *)self identifier];
    id v13 = [(AMSUINotificationSettingsViewController *)self account];
    double v14 = [(AMSUINotificationSettingsViewController *)self bag];
    double v7 = (void *)[v11 initWithIdentifier:v12 account:v13 bag:v14];

    double v15 = [v7 updateSettings:v4];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__AMSUINotificationSettingsViewController__commitChangedItemsUpdates__block_invoke;
    v18[3] = &unk_2643E3520;
    v18[4] = self;
    [v15 addFinishBlock:v18];
  }
  else
  {
    if (!v6)
    {
      double v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v15 = [v7 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      double v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No settings changed, not updating", buf, 0x16u);
    }
  }
}

void __69__AMSUINotificationSettingsViewController__commitChangedItemsUpdates__block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F27CB8] sharedConfig];
  objc_super v4 = (void *)v3;
  if (a2)
  {
    if (!v3)
    {
      objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      double v7 = AMSLogKey();
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      double v8 = "%{public}@: [%{public}@] Successfully updated notification settings";
LABEL_10:
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (!v3)
    {
      objc_super v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      double v7 = AMSLogKey();
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v7;
      double v8 = "%{public}@: [%{public}@] Failed to update notification settings";
      goto LABEL_10;
    }
  }
}

- (void)_commonSetup
{
  uint64_t v3 = [AMSUILoadingView alloc];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = -[AMSUILoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  loadingView = self->_loadingView;
  self->_loadingView = v8;

  int v10 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v10;

  __int16 v12 = objc_alloc_init(AMSUINotificationSettingsViewModel);
  model = self->_model;
  self->_model = v12;

  [(AMSUINotificationSettingsViewModel *)self->_model setDelegate:self];
  uint64_t v14 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", 2, v4, v5, v6, v7);
  tableView = self->_tableView;
  self->_tableView = v14;

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kAMSUINotificationInAppSettingsCellIdentifier"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kAMSUINotificationInAppSettingsButtonCellIdentifier"];
  [(UITableView *)self->_tableView setDataSource:self->_model];
  [(UITableView *)self->_tableView setDelegate:self];
  [(AMSUINotificationSettingsViewController *)self _updateNotificationStatus];
  id v16 = objc_alloc(MEMORY[0x263F82EF0]);
  double v17 = [(AMSUINotificationSettingsViewController *)self bag];
  double v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  double v19 = AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_TITLE", v17, v18);
  uint64_t v20 = (_UIContentUnavailableView *)objc_msgSend(v16, "initWithFrame:title:style:", v19, 0, v4, v5, v6, v7);
  errorView = self->_errorView;
  self->_errorView = v20;

  [(_UIContentUnavailableView *)self->_errorView setMessage:&stru_26CC491D8];
  v22 = [(AMSUINotificationSettingsViewController *)self bag];
  __int16 v23 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  uint64_t v24 = AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_BUTTON", v22, v23);
  [(_UIContentUnavailableView *)self->_errorView setButtonTitle:v24];

  objc_initWeak(&location, self);
  uint64_t v25 = self->_errorView;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __55__AMSUINotificationSettingsViewController__commonSetup__block_invoke;
  v26[3] = &unk_2643E37D0;
  objc_copyWeak(&v27, &location);
  [(_UIContentUnavailableView *)v25 setButtonAction:v26];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __55__AMSUINotificationSettingsViewController__commonSetup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained errorView];
  [v1 removeFromSuperview];

  [WeakRetained _loadData];
}

- (void)_handleAllowNotificationsButton
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(AMSUINotificationSettingsViewController *)self shouldDeepLink])
  {
    uint64_t v3 = NSString;
    double v4 = [MEMORY[0x263F27E08] currentProcess];
    double v5 = [v4 bundleIdentifier];
    double v6 = [v3 stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", v5];

    double v7 = (void *)MEMORY[0x263F27DC8];
    double v8 = [NSURL URLWithString:v6];
    int v9 = [v7 openStandardURL:v8];

    uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    uint64_t v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      __int16 v12 = [v11 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v14;
      double v15 = "%{public}@: [%{public}@] Successfully opened URL to notifications page.";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!v10)
      {
        uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      __int16 v12 = [v11 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v18 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      __int16 v23 = v14;
      double v15 = "%{public}@: [%{public}@] Failed to open URL to notifications page.";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_21C134000, v16, v17, v15, buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  double v6 = [(AMSUINotificationSettingsViewController *)self notificationCenter];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__AMSUINotificationSettingsViewController__handleAllowNotificationsButton__block_invoke;
  v19[3] = &unk_2643E3520;
  v19[4] = self;
  [v6 requestAuthorizationWithOptions:38 completionHandler:v19];
LABEL_14:
}

void __74__AMSUINotificationSettingsViewController__handleAllowNotificationsButton__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  double v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      double v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      os_log_type_t v17 = v10;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authorization granted.", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) _updateNotificationStatus];
  }
  else
  {
    if (!v6)
    {
      double v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v11 = [v7 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      os_log_type_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire authorization. Error: %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_loadData
{
  uint64_t v3 = [(AMSUINotificationSettingsViewController *)self view];
  double v4 = [(AMSUINotificationSettingsViewController *)self loadingView];
  [v3 addSubview:v4];

  id v5 = [(AMSUINotificationSettingsViewController *)self loadingView];
  [v5 startAnimating];

  id v6 = objc_alloc(MEMORY[0x263F27DB0]);
  double v7 = [(AMSUINotificationSettingsViewController *)self identifier];
  double v8 = [(AMSUINotificationSettingsViewController *)self account];
  uint64_t v9 = [(AMSUINotificationSettingsViewController *)self bag];
  uint64_t v10 = (void *)[v6 initWithIdentifier:v7 account:v8 bag:v9];

  uint64_t v11 = [v10 fetchAllSettings];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke;
  v12[3] = &unk_2643E40C0;
  v12[4] = self;
  [v11 addFinishBlock:v12];
}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke_2;
    block[3] = &unk_2643E3118;
    void block[4] = *(void *)(a1 + 32);
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  else
  {
    double v4 = [a2 sections];
    id v5 = [*(id *)(a1 + 32) model];
    [v5 setSections:v4];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__AMSUINotificationSettingsViewController__loadData__block_invoke_3;
    v6[3] = &unk_2643E3118;
    v6[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingView];
  [v2 removeFromSuperview];

  id v4 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [*(id *)(a1 + 32) errorView];
  [v4 addSubview:v3];
}

void __52__AMSUINotificationSettingsViewController__loadData__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  [v2 addSubview:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 tableView];
  [v4 setContentScrollView:v5 forEdge:15];

  id v6 = [*(id *)(a1 + 32) tableView];
  [v6 reloadData];
}

- (void)_updateNotificationStatus
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(AMSUINotificationSettingsViewController *)self notificationCenter];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke;
  v4[3] = &unk_2643E40E8;
  objc_copyWeak(&v5, &location);
  [v3 getNotificationSettingsWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 authorizationStatus] == 2)
  {
    id v5 = [WeakRetained model];
    id v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    if ([v3 authorizationStatus] == 1) {
      [WeakRetained setShouldDeepLink:1];
    }
    id v5 = [WeakRetained model];
    id v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 setShowAllowNotificationsButton:v7];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke_2;
  block[3] = &unk_2643E3118;
  void block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__AMSUINotificationSettingsViewController__updateNotificationStatus__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (ACAccount)account
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

- (BOOL)_isAuthenticated
{
  v2 = [(AMSUINotificationSettingsViewController *)self account];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_handleAuthenticationError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    double v8 = AMSLogKey();
    int v12 = 138543874;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate an account. Error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v9 = [(AMSUINotificationSettingsViewController *)self navigationController];

  if (v9)
  {
    uint64_t v10 = [(AMSUINotificationSettingsViewController *)self navigationController];
    id v11 = (id)[v10 popViewControllerAnimated:1];
  }
  else
  {
    [(AMSUINotificationSettingsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_promptForAuthentication
{
  BOOL v3 = objc_opt_new();
  [v3 setAuthenticationType:2];
  id v4 = [(AMSUINotificationSettingsViewController *)self clientInfo];
  [v3 setClientInfo:v4];

  [v3 setDebugReason:@"Account is not present while attempting to show notification settings."];
  [v3 setEnableAccountCreation:0];
  id v5 = AMSLogKey();
  [v3 setLogKey:v5];

  id v6 = [AMSUIAuthenticateTask alloc];
  uint64_t v7 = [(AMSUINotificationSettingsViewController *)self account];
  double v8 = [(AMSUIAuthenticateTask *)v6 initWithAccount:v7 presentingViewController:self options:v3];

  uint64_t v9 = [(AMSAuthenticateTask *)v8 performAuthentication];

  return v9;
}

- (void)viewModel:(id)a3 didReceiveValueChange:(id)a4 forItem:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  double v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    id v11 = [v6 identifier];
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %@ setting changed", (uint8_t *)&v14, 0x20u);
  }
  int v12 = [(AMSUINotificationSettingsViewController *)self changedItems];
  uint64_t v13 = [v6 identifier];
  [v12 setObject:v6 forKeyedSubscript:v13];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    uint64_t v7 = [(AMSUINotificationSettingsViewController *)self model];
    int v8 = [v7 showAllowNotificationsButton];

    if (v8) {
      [(AMSUINotificationSettingsViewController *)self _handleAllowNotificationsButton];
    }
  }
  [v9 deselectRowAtIndexPath:v6 animated:1];
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)[MEMORY[0x263F27DB0] bagKeySet];
}

+ (NSString)bagSubProfile
{
  return (NSString *)[MEMORY[0x263F27DB0] bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)[MEMORY[0x263F27DB0] bagSubProfileVersion];
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)changedItems
{
  return self->_changedItems;
}

- (void)setChangedItems:(id)a3
{
}

- (_UIContentUnavailableView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (AMSUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (AMSUINotificationSettingsViewModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (BOOL)shouldDeepLink
{
  return self->_shouldDeepLink;
}

- (void)setShouldDeepLink:(BOOL)a3
{
  self->_shouldDeepLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_changedItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end