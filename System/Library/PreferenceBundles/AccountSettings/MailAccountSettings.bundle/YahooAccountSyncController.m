@interface YahooAccountSyncController
- (BOOL)_needsReAuthenciationSection;
- (BOOL)didFirstTimeSetupValidation;
- (BOOL)reAuthenticating;
- (YahooAccountSyncController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_reAuthenticationSectionSpecifiers;
- (id)specifiers;
- (void)_accountStoreDidChange:(id)a3;
- (void)_beginObservingAccountStoreDidChangeNotification;
- (void)_reAuthenticationButtonTapped:(id)a3;
- (void)_stopObservingAccountStoreDidChangeNotification;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)setDidFirstTimeSetupValidation:(BOOL)a3;
- (void)setReAuthenticating:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation YahooAccountSyncController

- (YahooAccountSyncController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)YahooAccountSyncController;
  v8 = [(YahooAccountSyncController *)&v11 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    v8->_showingReAuthenticationSection = 0;
    [(YahooAccountSyncController *)v8 _beginObservingAccountStoreDidChangeNotification];
  }

  return v9;
}

- (void)dealloc
{
  [(YahooAccountSyncController *)self _stopObservingAccountStoreDidChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)YahooAccountSyncController;
  [(YahooAccountSyncController *)&v3 dealloc];
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)YahooAccountSyncController;
  [(YahooAccountSyncController *)&v7 handleURL:v4];
  v5 = [v4 objectForKeyedSubscript:@"slYahooAction"];
  unsigned int v6 = [v5 isEqualToString:@"showAuthSheet"];

  if (v6) {
    [(YahooAccountSyncController *)self _reAuthenticationButtonTapped:self];
  }
}

- (void)_beginObservingAccountStoreDidChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_accountStoreDidChange:" name:ACAccountStoreDidChangeNotification object:0];
}

- (void)_stopObservingAccountStoreDidChangeNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACAccountStoreDidChangeNotification object:0];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = [(YahooAccountSyncController *)self account];
  [v4 refresh];

  LODWORD(v4) = self->_showingReAuthenticationSection;
  if (v4 != [(YahooAccountSyncController *)self _needsReAuthenciationSection])
  {
    [(YahooAccountSyncController *)self reloadSpecifiers];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)YahooAccountSyncController;
  [(AccountPSSyncController *)&v8 viewDidLoad];
  if ([(YahooAccountSyncController *)self isFirstTimeSetup])
  {
    id v3 = [(YahooAccountSyncController *)self navigationItem];
    id v4 = [v3 title];
    firstTimeSetupValidationOriginalTitle = self->_firstTimeSetupValidationOriginalTitle;
    self->_firstTimeSetupValidationOriginalTitle = v4;

    [(YahooAccountSyncController *)self startValidationWithPrompt:self->_firstTimeSetupValidationOriginalTitle];
    [(YahooAccountSyncController *)self setTaskCompletionAssertionEnabled:1];
    id v6 = objc_alloc_init((Class)+[YahooAccount accountValidatorClass]);
    [v6 setDelegate:self];
    objc_super v7 = [(AccountPSSyncController *)self mailAccount];
    [v6 validateAccount:v7 useSSL:1];
  }
}

- (BOOL)_needsReAuthenciationSection
{
  if ([(YahooAccountSyncController *)self isFirstTimeSetup]) {
    return 0;
  }
  id v4 = [(YahooAccountSyncController *)self account];
  unsigned __int8 v5 = [v4 isAuthenticated];

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(YahooAccountSyncController *)self account];
  objc_super v7 = [v6 credential];
  objc_super v8 = [v7 oauthToken];
  if (v8)
  {
    BOOL v3 = 0;
  }
  else
  {
    v9 = [(YahooAccountSyncController *)self account];
    v10 = [v9 credential];
    objc_super v11 = [v10 oauthRefreshToken];
    BOOL v3 = v11 == 0;
  }
  return v3;
}

- (id)specifiers
{
  if ([(YahooAccountSyncController *)self isFirstTimeSetup]) {
    BOOL v3 = !self->_didFirstTimeSetupValidation;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = [(YahooAccountSyncController *)self _needsReAuthenciationSection];
  id obj = objc_alloc_init((Class)NSMutableArray);
  if (v4)
  {
    unsigned __int8 v5 = [(YahooAccountSyncController *)self _reAuthenticationSectionSpecifiers];
    [obj addObjectsFromArray:v5];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  self->_showingReAuthenticationSection = v4;
  v21.receiver = self;
  v21.super_class = (Class)YahooAccountSyncController;
  id v6 = [(AccountPSSyncController *)&v21 specifiers];
  [obj addObjectsFromArray:v6];

  if (v3 || v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = obj;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      uint64_t v10 = PSEnabledKey;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [(YahooAccountSyncController *)self deleteButtonSpecifier];
          if (v12 == v13)
          {
          }
          else
          {
            unsigned __int8 v14 = [v5 containsObject:v12];

            if ((v14 & 1) == 0) {
              [v12 setProperty:&__kCFBooleanFalse forKey:v10];
            }
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }
  }
  objc_storeStrong((id *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers], obj);

  return obj;
}

- (id)_reAuthenticationSectionSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  BOOL v4 = +[PSSpecifier emptyGroupSpecifier];
  unsigned __int8 v5 = [(YahooAccountSyncController *)self account];
  id v6 = [v5 username];
  [v4 setProperty:v6 forKey:@"YahooNameForAccountToAuthenticate"];

  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v3 addObject:v4];
  uint64_t v9 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v9];

  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v11 = [v10 localizedStringForKey:@"REENTER_PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

  [v12 setButtonAction:"_reAuthenticationButtonTapped:"];
  [v3 addObject:v12];

  return v3;
}

- (void)_reAuthenticationButtonTapped:(id)a3
{
  if (!self->_reAuthenticating)
  {
    self->_reAuthenticating = 1;
    id v4 = objc_alloc((Class)SLYahooWebAuthController);
    unsigned __int8 v5 = [(YahooAccountSyncController *)self account];
    id v6 = [(YahooAccountSyncController *)self accountStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_7A718;
    v12[3] = &unk_B8F98;
    v12[4] = self;
    id v7 = (SLYahooWebAuthController *)[v4 initWithAccount:v5 accountStore:v6 presentationBlock:v12];
    webAuthController = self->_webAuthController;
    self->_webAuthController = v7;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7A72C;
    v9[3] = &unk_B8FC0;
    objc_copyWeak(&v10, &location);
    [(SLYahooWebAuthController *)self->_webAuthController setCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v13 = a3;
  id v7 = a4;
  self->_didFirstTimeSetupValidation = 1;
  [(YahooAccountSyncController *)self stopValidationWithPrompt:self->_firstTimeSetupValidationOriginalTitle showButtons:1];
  if ([v13 accountIsValid])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 deliveryAccount], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v9 = v7;
      if (v9)
      {
        id v10 = +[MFInvocationQueue sharedInvocationQueue];
        objc_super v11 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliases" target:v9];
        [v10 addInvocation:v11];
      }
      v12 = (void *)v8;
    }
    else
    {
      id v9 = 0;
      v12 = 0;
    }
    [(YahooAccountSyncController *)self reloadSpecifiers];
  }
  else
  {
    id v9 = 0;
    [(YahooAccountSyncController *)self cancelButtonTapped:self];
  }
  [(YahooAccountSyncController *)self setTaskCompletionAssertionEnabled:0];
}

- (BOOL)didFirstTimeSetupValidation
{
  return self->_didFirstTimeSetupValidation;
}

- (void)setDidFirstTimeSetupValidation:(BOOL)a3
{
  self->_didFirstTimeSetupValidation = a3;
}

- (BOOL)reAuthenticating
{
  return self->_reAuthenticating;
}

- (void)setReAuthenticating:(BOOL)a3
{
  self->_reAuthenticating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAuthController, 0);

  objc_storeStrong((id *)&self->_firstTimeSetupValidationOriginalTitle, 0);
}

@end