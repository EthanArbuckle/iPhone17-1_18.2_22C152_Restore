@interface AOLAccountSyncController
- (id)_reAuthenticationSectionSpecifiers;
- (void)_reAuthenticationButtonTapped:(id)a3;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation AOLAccountSyncController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AOLAccountSyncController;
  [(YahooAccountSyncController *)&v8 viewDidLoad];
  if ([(AOLAccountSyncController *)self isFirstTimeSetup])
  {
    v3 = [(AOLAccountSyncController *)self navigationItem];
    uint64_t v4 = [v3 title];
    v5 = *(void **)(&self->super._reAuthenticating + 1);
    *(void *)(&self->super._reAuthenticating + 1) = v4;

    [(AOLAccountSyncController *)self setTaskCompletionAssertionEnabled:1];
    id v6 = objc_alloc_init((Class)+[AOLAccount accountValidatorClass]);
    [v6 setDelegate:self];
    v7 = [(AccountPSSyncController *)self mailAccount];
    [v6 validateAccount:v7 useSSL:1];
  }
}

- (void)_reAuthenticationButtonTapped:(id)a3
{
  if (![(YahooAccountSyncController *)self reAuthenticating])
  {
    [(YahooAccountSyncController *)self setReAuthenticating:1];
    id v4 = objc_alloc(NSClassFromString(@"SLAOLWebAuthController"));
    v5 = [(AOLAccountSyncController *)self account];
    id v6 = [(AOLAccountSyncController *)self accountStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_23050;
    v12[3] = &unk_B8F98;
    v12[4] = self;
    v7 = (NSString *)[v4 initWithAccount:v5 accountStore:v6 presentationBlock:v12];
    objc_super v8 = *(NSString **)((char *)&self->_firstTimeSetupValidationOriginalTitle + 3);
    *(NSString **)((char *)&self->_firstTimeSetupValidationOriginalTitle + 3) = v7;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_23064;
    v9[3] = &unk_B8FC0;
    objc_copyWeak(&v10, &location);
    [*(id *)((char *)&self->_firstTimeSetupValidationOriginalTitle + 3) setCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (id)_reAuthenticationSectionSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier emptyGroupSpecifier];
  v5 = [(AOLAccountSyncController *)self account];
  id v6 = [v5 username];
  [v4 setProperty:v6 forKey:@"YahooNameForAccountToAuthenticate"];

  v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v3 addObject:v4];
  v9 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v9];

  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"REENTER_PASSWORD" value:&stru_B9F70 table:@"AccountPreferences"];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

  [v12 setButtonAction:"_reAuthenticationButtonTapped:"];
  [v3 addObject:v12];

  return v3;
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v13 = a3;
  id v7 = a4;
  [(YahooAccountSyncController *)self setDidFirstTimeSetupValidation:1];
  [(AOLAccountSyncController *)self stopValidationWithPrompt:*(void *)(&self->super._reAuthenticating + 1) showButtons:1];
  if ([v13 accountIsValid])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 deliveryAccount], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v9 = v7;
      if (v9)
      {
        id v10 = +[MFInvocationQueue sharedInvocationQueue];
        v11 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliases" target:v9];
        [v10 addInvocation:v11];
      }
      v12 = (void *)v8;
    }
    else
    {
      id v9 = 0;
      v12 = 0;
    }
    [(AOLAccountSyncController *)self reloadSpecifiers];
  }
  else
  {
    id v9 = 0;
    [(AOLAccountSyncController *)self cancelButtonTapped:self];
  }
  [(AOLAccountSyncController *)self setTaskCompletionAssertionEnabled:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firstTimeSetupValidationOriginalTitle + 3), 0);

  objc_storeStrong((id *)(&self->super._reAuthenticating + 1), 0);
}

@end