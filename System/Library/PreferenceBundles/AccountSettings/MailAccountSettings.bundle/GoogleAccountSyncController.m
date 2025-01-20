@interface GoogleAccountSyncController
- (BOOL)_needsReAuthenciationSection;
- (BOOL)didFirstTimeSetupValidation;
- (BOOL)reAuthenticating;
- (GoogleAccountSyncController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_reAuthenticationSectionSpecifiers;
- (id)specifiers;
- (void)_accountStoreDidChange:(id)a3;
- (void)_beginObservingAccountStoreDidChangeNotification;
- (void)_effectiveSettingsDidChange:(id)a3;
- (void)_reAuthenticationButtonTapped:(id)a3;
- (void)_stopObservingAccountStoreDidChangeNotification;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)setDidFirstTimeSetupValidation:(BOOL)a3;
- (void)setReAuthenticating:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation GoogleAccountSyncController

- (GoogleAccountSyncController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GoogleAccountSyncController;
  v8 = [(GoogleAccountSyncController *)&v12 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    v8->_showingReAuthenticationSection = 0;
    [(GoogleAccountSyncController *)v8 _beginObservingAccountStoreDidChangeNotification];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"_effectiveSettingsDidChange:" name:MCEffectiveSettingsChangedNotification object:0];
  }
  return v9;
}

- (void)dealloc
{
  [(GoogleAccountSyncController *)self _stopObservingAccountStoreDidChangeNotification];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MCEffectiveSettingsChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)GoogleAccountSyncController;
  [(GoogleAccountSyncController *)&v4 dealloc];
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GoogleAccountSyncController;
  [(GoogleAccountSyncController *)&v7 handleURL:v4];
  v5 = [v4 objectForKeyedSubscript:@"slGoogleAction"];
  unsigned int v6 = [v5 isEqualToString:@"showAuthSheet"];

  if (v6) {
    [(GoogleAccountSyncController *)self _reAuthenticationButtonTapped:self];
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
  id v4 = [(GoogleAccountSyncController *)self account];
  [v4 refresh];

  LODWORD(v4) = self->_showingReAuthenticationSection;
  if (v4 != [(GoogleAccountSyncController *)self _needsReAuthenciationSection])
  {
    [(GoogleAccountSyncController *)self reloadSpecifiers];
  }
}

- (void)_effectiveSettingsDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6D098;
  block[3] = &unk_B8E88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)GoogleAccountSyncController;
  [(AccountPSSyncController *)&v8 viewDidLoad];
  if ([(GoogleAccountSyncController *)self isFirstTimeSetup])
  {
    id v3 = [(GoogleAccountSyncController *)self navigationItem];
    id v4 = [v3 title];
    firstTimeSetupValidationOriginalTitle = self->_firstTimeSetupValidationOriginalTitle;
    self->_firstTimeSetupValidationOriginalTitle = v4;

    [(GoogleAccountSyncController *)self startValidationWithPrompt:self->_firstTimeSetupValidationOriginalTitle];
    [(GoogleAccountSyncController *)self setTaskCompletionAssertionEnabled:1];
    id v6 = objc_alloc_init((Class)+[GmailAccount accountValidatorClass]);
    [v6 setDelegate:self];
    objc_super v7 = [(AccountPSSyncController *)self mailAccount];
    [v6 validateAccount:v7 useSSL:1];
  }
}

- (BOOL)_needsReAuthenciationSection
{
  if ([(GoogleAccountSyncController *)self isFirstTimeSetup]) {
    return 0;
  }
  id v4 = [(GoogleAccountSyncController *)self account];
  unsigned __int8 v5 = [v4 isAuthenticated];

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(GoogleAccountSyncController *)self account];
  objc_super v7 = [v6 credential];
  objc_super v8 = [v7 oauthToken];
  if (v8)
  {
    BOOL v3 = 0;
  }
  else
  {
    v9 = [(GoogleAccountSyncController *)self account];
    v10 = [v9 credential];
    v11 = [v10 oauthRefreshToken];
    BOOL v3 = v11 == 0;
  }
  return v3;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    if ([(GoogleAccountSyncController *)self isFirstTimeSetup]) {
      BOOL v3 = !v2->_didFirstTimeSetupValidation;
    }
    else {
      BOOL v3 = 0;
    }
    unsigned int v4 = [(GoogleAccountSyncController *)v2 _needsReAuthenciationSection];
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (v4)
    {
      v29 = [(GoogleAccountSyncController *)v2 _reAuthenticationSectionSpecifiers];
      [v5 addObjectsFromArray:v29];
    }
    else
    {
      v29 = 0;
    }
    self->_showingReAuthenticationSection = v4;
    v35.receiver = self;
    v35.super_class = (Class)GoogleAccountSyncController;
    id v6 = [(AccountPSSyncController *)&v35 specifiers];
    [v5 addObjectsFromArray:v6];

    objc_super v7 = +[MCProfileConnection sharedConnection];
    unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      int v10 = v3 | v4;
      uint64_t v11 = *(void *)v32;
      uint64_t v12 = PSEnabledKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v15 = [v14 propertyForKey:v12];
          if (v15)
          {
            v16 = [v14 propertyForKey:v12];
            unsigned int v17 = [v16 BOOLValue];

            if (!v17) {
              continue;
            }
          }
          if (v10)
          {
            v18 = [(GoogleAccountSyncController *)self deleteButtonSpecifier];
            if (v14 == v18)
            {
            }
            else
            {
              unsigned __int8 v19 = [v29 containsObject:v14];

              v20 = &__kCFBooleanFalse;
              if ((v19 & 1) == 0)
              {
LABEL_23:
                [v14 setProperty:v20 forKey:v12];
                continue;
              }
            }
          }
          if (v8 != 2 || (unsigned int v21 = [v29 containsObject:v14], v20 = &__kCFBooleanFalse, v21)) {
            v20 = &__kCFBooleanTrue;
          }
          goto LABEL_23;
        }
        id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    v22 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v27];
    *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v27] = obj;

    v2 = self;
  }
  if (v2->_IMAPValidationFailure)
  {
    v23 = [(GoogleAccountSyncController *)v2 account];
    [v23 setEnabled:0 forDataclass:ACAccountDataclassMail];

    v24 = [(GoogleAccountSyncController *)self account];
    [v24 refresh];

    v2 = self;
  }
  v25 = *(void **)&v2->super.ACUIDataclassConfigurationViewController_opaque[v27];

  return v25;
}

- (id)_reAuthenticationSectionSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = +[PSSpecifier emptyGroupSpecifier];
  id v5 = [(GoogleAccountSyncController *)self account];
  id v6 = [v5 username];
  [v4 setProperty:v6 forKey:@"GoogleNameForAccountToAuthenticate"];

  objc_super v7 = (objc_class *)objc_opt_class();
  unsigned int v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v3 addObject:v4];
  id v9 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v9];

  int v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"REENTER_PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

  [v12 setButtonAction:"_reAuthenticationButtonTapped:"];
  [v3 addObject:v12];

  return v3;
}

- (void)_reAuthenticationButtonTapped:(id)a3
{
  if (!self->_reAuthenticating)
  {
    self->_reAuthenticating = 1;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    unsigned int v4 = [(GoogleAccountSyncController *)self account];
    id v5 = [(GoogleAccountSyncController *)self accountStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6DA54;
    v9[3] = &unk_B9A70;
    v9[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_6DA68;
    v7[3] = &unk_B8FC0;
    objc_copyWeak(&v8, &location);
    id v6 = +[SLGoogleAuthController googleAuthControllerWithAccount:v4 accountStore:v5 presentationBlock:v9 completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v12 = a3;
  id v7 = a4;
  self->_didFirstTimeSetupValidation = 1;
  [(GoogleAccountSyncController *)self stopValidationWithPrompt:self->_firstTimeSetupValidationOriginalTitle showButtons:1];
  if ([v12 accountIsValid])
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v7 deliveryAccount];
      if (v8)
      {
        id v9 = v7;
        if (v9)
        {
          int v10 = +[MFInvocationQueue sharedInvocationQueue];
          uint64_t v11 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliases" target:v9];
          [v10 addInvocation:v11];
        }
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
      id v8 = 0;
    }
  }
  else
  {
    id v9 = 0;
    self->_IMAPValidationFailure = 1;
  }
  [(GoogleAccountSyncController *)self reloadSpecifiers];
  [(GoogleAccountSyncController *)self setTaskCompletionAssertionEnabled:0];
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
}

@end