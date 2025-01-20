@interface DASettingsDataclassConfigurationViewController
- (BOOL)shouldVerifyBeforeAccountSave;
- (Class)accountInfoControllerClass;
- (DAAccount)daAccount;
- (id)_navTitle;
- (id)accountDescriptionForFirstTimeSetup;
- (id)accountFromSpecifier;
- (id)otherSpecifiers;
- (id)specifiers;
- (void)_accountsChanged:(id)a3;
- (void)_listenForAccountsChangedNotifications;
- (void)cancelButtonClicked:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)reloadAccount;
- (void)setDaAccount:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DASettingsDataclassConfigurationViewController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFAE28] object:0];

  v4.receiver = self;
  v4.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v4 dealloc];
}

- (id)accountDescriptionForFirstTimeSetup
{
  v2 = [(DASettingsDataclassConfigurationViewController *)self daAccount];
  v3 = [v2 accountDescription];

  return v3;
}

- (id)_navTitle
{
  if ([(ACUIDataclassConfigurationViewController *)self isFirstTimeSetup])
  {
    v3 = [(DASettingsDataclassConfigurationViewController *)self accountDescriptionForFirstTimeSetup];
  }
  else
  {
    objc_super v4 = [(DASettingsDataclassConfigurationViewController *)self daAccount];
    v3 = [v4 accountDescription];
  }

  return v3;
}

- (void)loadView
{
  v3 = [(DASettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v4 = [(DASettingsDataclassConfigurationViewController *)self _navTitle];
  [v3 setTitle:v4];

  v5.receiver = self;
  v5.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(DASettingsDataclassConfigurationViewController *)&v5 loadView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v5 viewDidLoad];
  v3 = [(DASettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v4 = [(DASettingsDataclassConfigurationViewController *)self _navTitle];
  [v3 setTitle:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263EFAE28] object:0];

  self->_haveRegisteredForAccountsChanged = 0;
  v6.receiver = self;
  v6.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v6 viewWillDisappear:v3];
}

- (void)_listenForAccountsChangedNotifications
{
  if (!self->_haveRegisteredForAccountsChanged)
  {
    self->_haveRegisteredForAccountsChanged = 1;
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__accountsChanged_ name:*MEMORY[0x263EFAE28] object:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v6 viewWillAppear:a3];
  [(DASettingsDataclassConfigurationViewController *)self _listenForAccountsChangedNotifications];
  objc_super v4 = [(DASettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v5 = [(DASettingsDataclassConfigurationViewController *)self _navTitle];
  [v4 setTitle:v5];
}

- (DAAccount)daAccount
{
  daAccount = self->_daAccount;
  if (!daAccount)
  {
    objc_super v4 = [(DASettingsDataclassConfigurationViewController *)self accountFromSpecifier];
    objc_super v5 = self->_daAccount;
    self->_daAccount = v4;

    daAccount = self->_daAccount;
  }

  return daAccount;
}

- (void)reloadAccount
{
  id v3 = [(DASettingsDataclassConfigurationViewController *)self daAccount];
  [v3 reload];

  id v5 = [(DASettingsDataclassConfigurationViewController *)self daAccount];
  objc_super v4 = [v5 backingAccountInfo];
  [v4 setAuthenticated:1];
}

- (id)accountFromSpecifier
{
  v2 = [(DASettingsDataclassConfigurationViewController *)self specifier];
  id v3 = [v2 userInfo];
  objc_super v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F23118]];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F38E28]];
    uint64_t v6 = *MEMORY[0x263F38E48];
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F38E48]];
    v8 = v7;
    if (v5 && ([v7 isEqualToString:v5] & 1) == 0) {
      [v4 setObject:v5 forKeyedSubscript:v6];
    }
    v9 = [MEMORY[0x263F38D58] sharedInstance];
    v10 = (objc_class *)[v9 daemonAppropriateAccountClassForACAccount:v4];

    v11 = (void *)[[v10 alloc] initWithBackingAccountInfo:v4];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_accountsChanged:(id)a3
{
  [(DASettingsDataclassConfigurationViewController *)self reloadAccount];

  [(DASettingsDataclassConfigurationViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  [(DASettingsDataclassConfigurationViewController *)self _listenForAccountsChangedNotifications];
  v5.receiver = self;
  v5.super_class = (Class)DASettingsDataclassConfigurationViewController;
  id v3 = [(ACUIDataclassConfigurationViewController *)&v5 specifiers];

  return v3;
}

- (id)otherSpecifiers
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [(ACUIDataclassConfigurationViewController *)self account];
  objc_super v5 = [v4 mcBackingProfile];

  if (v5)
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_26E020258 table:@"Localizable"];
    v9 = [v5 friendlyName];
    v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

    [(ACUIDataclassConfigurationViewController *)self setShouldShowDeleteAccountButton:0];
    v11 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v11 setProperty:v10 forKey:*MEMORY[0x263F600F8]];
    [v3 addObject:v11];
  }

  return v3;
}

- (Class)accountInfoControllerClass
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"DASettingsDataclassConfigurationViewController.m", 158, @"You need to subclass %@", v6 object file lineNumber description];

  return 0;
}

- (BOOL)shouldVerifyBeforeAccountSave
{
  return 0;
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    v13 = [(DASettingsDataclassConfigurationViewController *)self daAccount];
    [v13 cleanupAccountFiles];
  }
  v14.receiver = self;
  v14.super_class = (Class)DASettingsDataclassConfigurationViewController;
  [(ACUIDataclassConfigurationViewController *)&v14 operationsHelper:v10 didRemoveAccount:v11 withSuccess:v7 error:v12];
}

- (void)cancelButtonClicked:(id)a3
{
  id v3 = [(DASettingsDataclassConfigurationViewController *)self rootController];
  if (objc_opt_respondsToSelector()) {
    [v3 dismiss];
  }
}

- (void)setDaAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end