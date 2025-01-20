@interface AMSUIPasswordSettingsViewController
+ (BOOL)isUseSwiftUIPasswordSettingsViewEnabled;
- (ACAccount)account;
- (AMSUIPasswordSettingsViewController)initWithAccount:(id)a3;
- (BOOL)isBiometricsEnabled;
- (NSBundle)bundle;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)freeSetting;
- (unint64_t)paidSetting;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)donePressed:(id)a3;
- (void)freeDownloadsToggle:(id)a3 changedValue:(BOOL)a4;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)setBundle:(id)a3;
- (void)setFreeSetting:(unint64_t)a3;
- (void)setIsBiometricsEnabled:(BOOL)a3;
- (void)setPaidSetting:(unint64_t)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AMSUIPasswordSettingsViewController

- (AMSUIPasswordSettingsViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIPasswordSettingsViewController;
  v6 = [(AMSUIPasswordSettingsViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    p_account = (id *)&v6->_account;
    objc_storeStrong((id *)&v6->_account, a3);
    uint64_t v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    bundle = v7->_bundle;
    v7->_bundle = (NSBundle *)v9;

    if (!+[AMSUIPasswordSettingsViewController isUseSwiftUIPasswordSettingsViewEnabled])
    {
      v7->_freeSetting = objc_msgSend(*p_account, "ams_freePasswordPromptSetting");
      v7->_paidSetting = objc_msgSend(*p_account, "ams_paidPasswordPromptSetting");
      v7->_isBiometricsEnabled = [MEMORY[0x263F27B60] isAvailableForAccount:v5];
      id v11 = objc_alloc(MEMORY[0x263F82C78]);
      uint64_t v12 = objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      tableView = v7->_tableView;
      v7->_tableView = (UITableView *)v12;

      [(UITableView *)v7->_tableView setDataSource:v7];
      [(UITableView *)v7->_tableView setDelegate:v7];
      [(UITableView *)v7->_tableView setSeparatorStyle:1];
      [(UITableView *)v7->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Free"];
      [(UITableView *)v7->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"Purchases"];
    }
  }

  return v7;
}

- (void)loadView
{
  if (+[AMSUIPasswordSettingsViewController isUseSwiftUIPasswordSettingsViewEnabled])
  {
    id v4 = +[AMSUIPasswordSettingsViewProvider makeViewWithAccount:self->_account];
    v3 = [v4 view];
    [v4 setView:0];
    [(AMSUIPasswordSettingsViewController *)self setView:v3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AMSUIPasswordSettingsViewController;
    [(AMSUIPasswordSettingsViewController *)&v5 loadView];
  }
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)AMSUIPasswordSettingsViewController;
  [(AMSUIPasswordSettingsViewController *)&v20 viewDidLoad];
  v3 = [(AMSUIPasswordSettingsViewController *)self bundle];
  id v4 = [v3 localizedStringForKey:@"PASSWORD_SETTINGS_TITLE" value:&stru_26CC491D8 table:0];
  [(AMSUIPasswordSettingsViewController *)self setTitle:v4];

  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_donePressed_];
  v6 = [(AMSUIPasswordSettingsViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  if (!+[AMSUIPasswordSettingsViewController isUseSwiftUIPasswordSettingsViewEnabled])
  {
    v7 = [(AMSUIPasswordSettingsViewController *)self view];
    v8 = [(AMSUIPasswordSettingsViewController *)self tableView];
    [v7 addSubview:v8];

    uint64_t v9 = [(AMSUIPasswordSettingsViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(AMSUIPasswordSettingsViewController *)self tableView];
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    v19 = [(AMSUIPasswordSettingsViewController *)self tableView];
    [v19 setAutoresizingMask:18];
  }
}

- (void)donePressed:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"Free" forIndexPath:v7];
    uint64_t v9 = [(AMSUIPasswordSettingsViewController *)self bundle];
    double v10 = [v9 localizedStringForKey:@"PASSWORD_SETTINGS_REQUIRE" value:&stru_26CC491D8 table:0];
    double v11 = [v8 textLabel];
    [v11 setText:v10];

    if ([MEMORY[0x263F27E70] requirePasswordImmediately])
    {
      double v12 = [v8 toggle];
      double v13 = v12;
      uint64_t v14 = 1;
    }
    else
    {
      BOOL v21 = [(AMSUIPasswordSettingsViewController *)self freeSetting] == 1;
      double v12 = [v8 toggle];
      double v13 = v12;
      uint64_t v14 = v21;
    }
    [v12 setOn:v14];

    [v8 setDelegate:self];
    if (![(AMSUIPasswordSettingsViewController *)self paidSetting]
      || ([MEMORY[0x263F27E70] requirePasswordImmediately] & 1) != 0
      || self->_isBiometricsEnabled)
    {
      v22 = [v8 contentView];
      [v22 setAlpha:0.5];

      v23 = [v8 toggle];
      v24 = v23;
      uint64_t v25 = 0;
    }
    else
    {
      v32 = [v8 contentView];
      [v32 setAlpha:1.0];

      v23 = [v8 toggle];
      v24 = v23;
      uint64_t v25 = 1;
    }
    [v23 setEnabled:v25];

    goto LABEL_23;
  }
  v8 = [v6 dequeueReusableCellWithIdentifier:@"Purchases" forIndexPath:v7];
  if ([MEMORY[0x263F27E70] requirePasswordImmediately])
  {
    double v15 = [v8 contentView];
    [v15 setAlpha:0.5];
  }
  uint64_t v16 = [v7 row];
  double v17 = [(AMSUIPasswordSettingsViewController *)self bundle];
  v18 = v17;
  if (!v16)
  {
    v26 = [v17 localizedStringForKey:@"PASSWORD_SETTINGS_ALWAYS" value:&stru_26CC491D8 table:0];
    v27 = [v8 textLabel];
    [v27 setText:v26];

    if ([(AMSUIPasswordSettingsViewController *)self paidSetting] != 1
      && [(AMSUIPasswordSettingsViewController *)self paidSetting]
      && ![MEMORY[0x263F27E70] requirePasswordImmediately])
    {
      goto LABEL_20;
    }
LABEL_19:
    [v6 selectRowAtIndexPath:v7 animated:1 scrollPosition:0];
    goto LABEL_21;
  }
  v19 = [v17 localizedStringForKey:@"PASSWORD_SETTINGS_SOMETIMES" value:&stru_26CC491D8 table:0];
  objc_super v20 = [v8 textLabel];
  [v20 setText:v19];

  if ([(AMSUIPasswordSettingsViewController *)self paidSetting] == 2
    && ([MEMORY[0x263F27E70] requirePasswordImmediately] & 1) == 0)
  {
    goto LABEL_19;
  }
LABEL_20:
  [v6 deselectRowAtIndexPath:v7 animated:1];
LABEL_21:
  if (self->_isBiometricsEnabled)
  {
    v28 = [v8 contentView];
    [v28 setAlpha:0.5];

    v29 = [MEMORY[0x263F825C8] tintColor];
    v30 = [v29 colorWithAlphaComponent:0.5];
    [v8 setTintColor:v30];

    [v8 setUserInteractionEnabled:0];
  }
LABEL_23:

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v5 = [(AMSUIPasswordSettingsViewController *)self bundle];
  id v6 = v5;
  if (a4) {
    id v7 = @"PASSWORD_SETTINGS_FREE_HEADER";
  }
  else {
    id v7 = @"PASSWORD_SETTINGS_PAID_HEADER";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26CC491D8 table:0];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Paid Downloads toggled", buf, 0x16u);
  }
  if ([v5 row]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [(AMSUIPasswordSettingsViewController *)self setPaidSetting:v10];
  id v11 = objc_alloc(MEMORY[0x263F27EA8]);
  double v12 = [(AMSUIPasswordSettingsViewController *)self account];
  unint64_t v13 = [(AMSUIPasswordSettingsViewController *)self freeSetting];
  unint64_t v14 = [(AMSUIPasswordSettingsViewController *)self paidSetting];
  double v15 = [MEMORY[0x263F27EA8] createBagForSubProfile];
  uint64_t v16 = (void *)[v11 initWithAccount:v12 freeSetting:v13 paidSetting:v14 delegate:self bag:v15];

  double v17 = [v16 performSync];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v19[3] = &unk_2643E42F0;
  v19[4] = self;
  id v20 = v5;
  id v18 = v5;
  [v17 addFinishBlock:v19];
}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  id v6 = (void *)v5;
  if (a3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      BOOL v21 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Paid Downloads sync failed - Toggling back", buf, 0x16u);
    }
    if ([*(id *)(a1 + 32) paidSetting] == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [*(id *)(a1 + 32) setPaidSetting:v10];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_45;
    block[3] = &unk_2643E34D0;
    id v11 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v17 = v11;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v12 = [v6 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      unint64_t v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      BOOL v21 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Paid Downloads Success", buf, 0x16u);
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_48;
    v15[3] = &unk_2643E3118;
    v15[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }
}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_45(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) tableView];
  v2 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v3 reloadSections:v2 withRowAnimation:5];
}

void __73__AMSUIPasswordSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_48(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (([MEMORY[0x263F27E70] requirePasswordImmediately] & 1) != 0 || self->_isBiometricsEnabled)
  {
    id v6 = 0;
  }
  else
  {
    if ([v5 section]) {
      id v7 = 0;
    }
    else {
      id v7 = v5;
    }
    id v6 = v7;
  }

  return v6;
}

- (void)freeDownloadsToggle:(id)a3 changedValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Free Downloads toggled", buf, 0x16u);
  }
  if (v4) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 3;
  }
  [(AMSUIPasswordSettingsViewController *)self setFreeSetting:v11];
  id v12 = objc_alloc(MEMORY[0x263F27EA8]);
  uint64_t v13 = [(AMSUIPasswordSettingsViewController *)self account];
  unint64_t v14 = [(AMSUIPasswordSettingsViewController *)self freeSetting];
  unint64_t v15 = [(AMSUIPasswordSettingsViewController *)self paidSetting];
  uint64_t v16 = [MEMORY[0x263F27EA8] createBagForSubProfile];
  id v17 = (void *)[v12 initWithAccount:v13 freeSetting:v14 paidSetting:v15 delegate:self bag:v16];

  id v18 = [v17 performSync];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __72__AMSUIPasswordSettingsViewController_freeDownloadsToggle_changedValue___block_invoke;
  v20[3] = &unk_2643E42F0;
  v20[4] = self;
  id v21 = v6;
  id v19 = v6;
  [v18 addFinishBlock:v20];
}

void __72__AMSUIPasswordSettingsViewController_freeDownloadsToggle_changedValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  id v6 = (void *)v5;
  if (a3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Free Download sync failed - Toggling back", (uint8_t *)&v13, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setOn:", objc_msgSend(*(id *)(a1 + 40), "isOn") ^ 1);
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v10 = [v6 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Free Downloads Success", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[AMSUIAuthenticateTask alloc] initWithRequest:v7 presentingViewController:self];

  uint64_t v9 = [(AMSAuthenticateTask *)v8 performAuthentication];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__AMSUIPasswordSettingsViewController_handleAuthenticateRequest_completion___block_invoke;
  v11[3] = &unk_2643E31B8;
  id v12 = v6;
  id v10 = v6;
  [v9 addFinishBlock:v11];
}

uint64_t __76__AMSUIPasswordSettingsViewController_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[AMSUIAlertDialogTask alloc] initWithRequest:v7 presentingViewController:self];

  uint64_t v9 = [(AMSUIAlertDialogTask *)v8 present];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__AMSUIPasswordSettingsViewController_handleDialogRequest_completion___block_invoke;
  v11[3] = &unk_2643E31E0;
  id v12 = v6;
  id v10 = v6;
  [v9 addFinishBlock:v11];
}

uint64_t __70__AMSUIPasswordSettingsViewController_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isUseSwiftUIPasswordSettingsViewEnabled
{
  return _os_feature_enabled_impl();
}

- (ACAccount)account
{
  return self->_account;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (unint64_t)freeSetting
{
  return self->_freeSetting;
}

- (void)setFreeSetting:(unint64_t)a3
{
  self->_freeSetting = a3;
}

- (unint64_t)paidSetting
{
  return self->_paidSetting;
}

- (void)setPaidSetting:(unint64_t)a3
{
  self->_paidSetting = a3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (BOOL)isBiometricsEnabled
{
  return self->_isBiometricsEnabled;
}

- (void)setIsBiometricsEnabled:(BOOL)a3
{
  self->_isBiometricsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end