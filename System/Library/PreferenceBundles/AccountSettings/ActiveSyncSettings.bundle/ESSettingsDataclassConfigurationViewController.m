@interface ESSettingsDataclassConfigurationViewController
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

@implementation ESSettingsDataclassConfigurationViewController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACAccountStoreDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v4 dealloc];
}

- (id)accountDescriptionForFirstTimeSetup
{
  v2 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  v3 = [v2 accountDescription];

  return v3;
}

- (id)_navTitle
{
  if ([(ESSettingsDataclassConfigurationViewController *)self isFirstTimeSetup])
  {
    v3 = [(ESSettingsDataclassConfigurationViewController *)self accountDescriptionForFirstTimeSetup];
  }
  else
  {
    objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    v3 = [v4 accountDescription];
  }

  return v3;
}

- (void)loadView
{
  v3 = [(ESSettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self _navTitle];
  [v3 setTitle:v4];

  v5.receiver = self;
  v5.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v5 loadView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v5 viewDidLoad];
  v3 = [(ESSettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self _navTitle];
  [v3 setTitle:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:ACAccountStoreDidChangeNotification object:0];

  self->_haveRegisteredForAccountsChanged = 0;
  v6.receiver = self;
  v6.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v6 viewWillDisappear:v3];
}

- (void)_listenForAccountsChangedNotifications
{
  if (!self->_haveRegisteredForAccountsChanged)
  {
    self->_haveRegisteredForAccountsChanged = 1;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_accountsChanged:" name:ACAccountStoreDidChangeNotification object:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v6 viewWillAppear:a3];
  [(ESSettingsDataclassConfigurationViewController *)self _listenForAccountsChangedNotifications];
  objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self navigationItem];
  objc_super v5 = [(ESSettingsDataclassConfigurationViewController *)self _navTitle];
  [v4 setTitle:v5];
}

- (DAAccount)daAccount
{
  daAccount = self->_daAccount;
  if (!daAccount)
  {
    objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self accountFromSpecifier];
    objc_super v5 = self->_daAccount;
    self->_daAccount = v4;

    daAccount = self->_daAccount;
  }

  return daAccount;
}

- (void)reloadAccount
{
  id v3 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  [v3 reload];

  id v5 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  objc_super v4 = [v5 backingAccountInfo];
  [v4 setAuthenticated:1];
}

- (id)accountFromSpecifier
{
  v2 = [(ESSettingsDataclassConfigurationViewController *)self specifier];
  id v3 = [v2 userInfo];
  objc_super v4 = [v3 objectForKeyedSubscript:ACUIAccountKey];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:kDAAccountEmailAddress];
    uint64_t v6 = kDAAccountStolenDisplayUsername;
    v7 = [v4 objectForKeyedSubscript:kDAAccountStolenDisplayUsername];
    v8 = v7;
    if (v5 && ([v7 isEqualToString:v5] & 1) == 0) {
      [v4 setObject:v5 forKeyedSubscript:v6];
    }
    v9 = +[DAAccountLoader sharedInstance];
    v10 = (objc_class *)[v9 daemonAppropriateAccountClassForACAccount:v4];

    id v11 = [[v10 alloc] initWithBackingAccountInfo:v4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_accountsChanged:(id)a3
{
  [(ESSettingsDataclassConfigurationViewController *)self reloadAccount];

  [(ESSettingsDataclassConfigurationViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  [(ESSettingsDataclassConfigurationViewController *)self _listenForAccountsChangedNotifications];
  v5.receiver = self;
  v5.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  id v3 = [(ESSettingsDataclassConfigurationViewController *)&v5 specifiers];

  return v3;
}

- (id)otherSpecifiers
{
  id v3 = +[NSMutableArray array];
  objc_super v4 = [(ESSettingsDataclassConfigurationViewController *)self account];
  objc_super v5 = [v4 mcBackingProfile];

  if (v5)
  {
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_30C50 table:@"Localizable"];
    v8 = [v5 friendlyName];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

    [(ESSettingsDataclassConfigurationViewController *)self setShouldShowDeleteAccountButton:0];
    v10 = +[PSSpecifier emptyGroupSpecifier];
    [v10 setProperty:v9 forKey:PSFooterTextGroupKey];
    [v3 addObject:v10];
  }

  return v3;
}

- (Class)accountInfoControllerClass
{
  objc_super v4 = +[NSAssertionHandler currentHandler];
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"ESSettingsDataclassConfigurationViewController.m", 158, @"You need to subclass %@", v6 object file lineNumber description];

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
    v13 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    [v13 cleanupAccountFiles];
  }
  v14.receiver = self;
  v14.super_class = (Class)ESSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v14 operationsHelper:v10 didRemoveAccount:v11 withSuccess:v7 error:v12];
}

- (void)cancelButtonClicked:(id)a3
{
  id v3 = [(ESSettingsDataclassConfigurationViewController *)self rootController];
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