@interface CDPUIBeneficiaryWelcomeViewController
- (CDPUIBeneficiaryWelcomeViewController)init;
- (CDPUIBeneficiaryWelcomeViewControllerDelegate)delegate;
- (id)_configurationForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupAppOptions;
- (void)_setupTableView;
- (void)_setupViews;
- (void)cancelTapped:(id)a3;
- (void)learnMoreTapped:(id)a3;
- (void)okTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation CDPUIBeneficiaryWelcomeViewController

- (CDPUIBeneficiaryWelcomeViewController)init
{
  v3 = [MEMORY[0x263F34328] sharedInstance];
  v4 = [v3 primaryAccountFirstName];

  v5 = [MEMORY[0x263F343A8] sharedInstance];
  v6 = [v5 deviceClass];

  v7 = NSString;
  v8 = CDPLocalizedString();
  v9 = [v7 stringWithValidatedFormat:v8, @"%@", 0, v4 validFormatSpecifiers error];

  v10 = NSString;
  v11 = CDPLocalizedString();
  v12 = objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%1$@ %2$@", 0, v4, v6);

  v16.receiver = self;
  v16.super_class = (Class)CDPUIBeneficiaryWelcomeViewController;
  v13 = [(OBTableWelcomeController *)&v16 initWithTitle:v9 detailText:v12 icon:0 adoptTableViewScrollView:1];
  v14 = v13;
  if (v13) {
    [(CDPUIBeneficiaryWelcomeViewController *)v13 _setupViews];
  }

  return v14;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CDPUIBeneficiaryWelcomeViewController;
  [(OBTableWelcomeController *)&v9 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTapped_];
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setBackBarButtonItem:v3];

  [(CDPUIBeneficiaryWelcomeViewController *)self _setupTableView];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CDPUIBeneficiaryWelcomeViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_26433D150;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__CDPUIBeneficiaryWelcomeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tableView];
  [v1 reloadData];
}

- (void)_setupViews
{
  id v8 = [MEMORY[0x263F5B898] boldButton];
  v3 = CDPLocalizedString();
  [v8 setTitle:v3 forState:0];

  [v8 addTarget:self action:sel_okTapped_ forControlEvents:64];
  v4 = [(CDPUIBeneficiaryWelcomeViewController *)self buttonTray];
  [v4 addButton:v8];

  if ((_BYSetupAssistantNeedsToRun() & 1) == 0)
  {
    dispatch_time_t v5 = [MEMORY[0x263F5B8D0] linkButton];
    v6 = CDPLocalizedString();
    [v5 setTitle:v6 forState:0];

    [v5 addTarget:self action:sel_learnMoreTapped_ forControlEvents:64];
    id v7 = [(CDPUIBeneficiaryWelcomeViewController *)self buttonTray];
    [v7 addButton:v5];
  }
}

- (void)_setupTableView
{
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  dispatch_time_t v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setRowHeight:62.0];

  id v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDelegate:self];

  id v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setDataSource:self];

  [(CDPUIBeneficiaryWelcomeViewController *)self _setupAppOptions];
}

- (void)_setupAppOptions
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(25, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke;
  v3[3] = &unk_26433D150;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke(uint64_t a1)
{
  v28[8] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v24 = CDPLocalizedString();
    v22 = CDPLocalizedString();
    v2 = CDPLocalizedString();
    v23 = CDPLocalizedString();
    v21 = CDPLocalizedString();
    v20 = CDPLocalizedString();
    v19 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.mobileslideshow" accessString:v24];
    v18 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.mobilenotes" accessString:v24];
    v17 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.mobilemail" accessString:v2];
    objc_super v16 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.MobileSMS" accessString:v2];
    v15 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.mobilephone" accessString:v23];
    id v3 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.VoiceMemos" accessString:v22];
    id v4 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.Home" accessString:v21];
    dispatch_time_t v5 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.AppStore" accessString:v20];
    v28[0] = v19;
    v28[1] = v18;
    v28[2] = v17;
    v28[3] = v16;
    v28[4] = v15;
    v28[5] = v3;
    v6 = v3;
    v28[6] = v4;
    v28[7] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:8];
    id v8 = (void *)WeakRetained[154];
    WeakRetained[154] = v7;

    objc_super v9 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.Music"];
    v10 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.tv"];
    v11 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.iBooks"];
    v12 = [[CDPUIInheritanceAppAccessDetails alloc] initWithBundleID:@"com.apple.AppStore"];
    v27[0] = v9;
    v27[1] = v10;
    v27[2] = v11;
    v27[3] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    v14 = (void *)WeakRetained[155];
    WeakRetained[155] = v13;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke_2;
    block[3] = &unk_26433CC58;
    v26 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 tableView];
    [v3 reloadData];

    id v4 = [*(id *)(a1 + 32) view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__restrictedAppsDetails;
  if (!a4) {
    id v4 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__accessibleAppsDetails;
  }
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v4), "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"BeneficiaryWelcomeAppCell"];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"BeneficiaryWelcomeAppCell"];
  }
  id v8 = [(CDPUIBeneficiaryWelcomeViewController *)self _configurationForIndexPath:v6];
  [v7 setContentConfiguration:v8];
  uint64_t v9 = [v6 row];

  if (v9)
  {
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 1.79769313e308, 0.0, 0.0);
  }
  else
  {
    v10 = [(OBTableWelcomeController *)self tableView];
    [v10 layoutMargins];
    [v7 setSeparatorInset:0.0];
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = CDPLocalizedString();

  return v4;
}

- (id)_configurationForIndexPath:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  id v6 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__restrictedAppsDetails;
  if (!v5) {
    id v6 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__accessibleAppsDetails;
  }
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6);
  uint64_t v8 = [v4 row];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
  v10 = [MEMORY[0x263F82918] cellConfiguration];
  v11 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81828]];
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v13 = [v9 appName];
  uint64_t v14 = *MEMORY[0x263F814F0];
  uint64_t v29 = *MEMORY[0x263F814F0];
  v30[0] = v11;
  v15 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  objc_super v16 = (void *)[v12 initWithString:v13 attributes:v15];

  [v10 setAttributedText:v16];
  v17 = [v9 accessString];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    id v20 = objc_alloc(MEMORY[0x263F086A0]);
    v21 = [v9 accessString];
    v27[0] = *MEMORY[0x263F81500];
    v22 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v27[1] = v14;
    v28[0] = v22;
    v28[1] = v19;
    v23 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v24 = (void *)[v20 initWithString:v21 attributes:v23];

    [v10 setSecondaryAttributedText:v24];
  }
  v25 = [v9 appIcon];
  [v10 setImage:v25];

  return v10;
}

- (void)okTapped:(id)a3
{
  id v4 = [(CDPUIBeneficiaryWelcomeViewController *)self delegate];
  [v4 welcomeViewController:self didCompleteWithError:0];
}

- (void)cancelTapped:(id)a3
{
  id v5 = [(CDPUIBeneficiaryWelcomeViewController *)self delegate];
  id v4 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5307);
  [v5 welcomeViewController:self didCompleteWithError:v4];
}

- (void)learnMoreTapped:(id)a3
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2187CF000, v3, OS_LOG_TYPE_DEFAULT, "Learn more was tapped", v6, 2u);
  }

  id v4 = [NSURL URLWithString:@"https://support.apple.com/kb/HT212361"];
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  [v5 openURL:v4 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (CDPUIBeneficiaryWelcomeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIBeneficiaryWelcomeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_restrictedAppsDetails, 0);

  objc_storeStrong((id *)&self->_accessibleAppsDetails, 0);
}

@end