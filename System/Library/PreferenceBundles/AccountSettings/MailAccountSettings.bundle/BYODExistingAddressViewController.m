@interface BYODExistingAddressViewController
+ (id)log;
- (BYODExistingAddressViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4 existingAddress:(BOOL)a5;
- (id)_getDomainName;
- (id)_usernamePrefillForSpecifier:(id)a3;
- (id)specifiers;
- (void)_addDomain;
- (void)_cancelButtonTapped:(id)a3;
- (void)_continueButtonTapped:(id)a3;
- (void)_fetchDomainDetails;
- (void)_fetchFamilyDetails;
- (void)_setUsernamePrefill:(id)a3 withSpecifier:(id)a4;
- (void)_showDomainConnectSignInAlert:(id)a3;
- (void)_triggerManualDomainSetupFlow;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODExistingAddressViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4C514;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7458 != -1) {
    dispatch_once(&qword_D7458, block);
  }
  v2 = (void *)qword_D7450;

  return v2;
}

- (BYODExistingAddressViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4 existingAddress:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BYODExistingAddressViewController;
  v10 = [(BYODExistingAddressViewController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_loggedInuserAccount, a3);
    v11->_isFamilyFlow = a4;
    v11->_hasExistingAddress = a5;
    v12 = (FAFetchFamilyCircleRequest *)objc_alloc_init((Class)FAFetchFamilyCircleRequest);
    familyRequest = v11->_familyRequest;
    v11->_familyRequest = v12;

    [(FAFetchFamilyCircleRequest *)v11->_familyRequest setCachePolicy:1];
  }

  return v11;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)BYODExistingAddressViewController;
  [(BYODExistingAddressViewController *)&v14 viewDidLoad];
  v3 = [(BYODExistingAddressViewController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_ADD_DOMAIN_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setTitle:v5];

  v6 = [(BYODExistingAddressViewController *)self navigationItem];
  [v6 setHidesBackButton:0];

  v7 = [(BYODExistingAddressViewController *)self navigationItem];
  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  [v7 setLeftBarButtonItem:v8];

  id v9 = [(BYODExistingAddressViewController *)self navigationItem];
  id v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v13 = [v10 initWithTitle:v12 style:0 target:self action:"_continueButtonTapped:"];
  [v9 setRightBarButtonItem:v13];
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (void)_continueButtonTapped:(id)a3
{
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier groupSpecifierWithID:@"EXISTING_ADDRESS_SPECIFIER_TITLE"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"SETUP_DOMAIN_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v7 = +[PSSpecifier groupSpecifierWithID:@"EXISTING_ADDRESS_SPECIFIER_TEXT"];
  [v3 addObject:v7];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"SETUP_DOMAIN_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v10 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v9 target:self set:"_setUsernamePrefill:withSpecifier:" get:"_usernamePrefillForSpecifier:" detail:0 cell:8 edit:0];

  [v10 setKeyboardType:0 autoCaps:0 autoCorrection:1];
  [v10 setProperty:@"Domain" forKey:PSKeyNameKey];
  [v10 setIdentifier:@"DOMAIN_TEXT_FIELD"];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SETUP_DOMAIN_TEXT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v10 setPlaceholder:v12];

  [v3 addObject:v10];
  uint64_t v13 = OBJC_IVAR___PSListController__specifiers;
  objc_super v14 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v15 = v3;

  id v16 = *(id *)&self->PSListController_opaque[v13];
  return v16;
}

- (void)_setUsernamePrefill:(id)a3 withSpecifier:(id)a4
{
}

- (id)_usernamePrefillForSpecifier:(id)a3
{
  return 0;
}

- (void)_addDomain
{
  spinner = self->_spinner;
  if (!spinner)
  {
    v4 = [[BYODSpinner alloc] initWithViewController:self];
    v5 = self->_spinner;
    self->_spinner = v4;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4CDE4;
  v17[3] = &unk_B8E88;
  v17[4] = self;
  v6 = objc_retainBlock(v17);
  v7 = [BYODAddDomainRequest alloc];
  loggedInuserAccount = self->_loggedInuserAccount;
  id v9 = [(ACAccount *)loggedInuserAccount accountStore];
  id v10 = [(BYODExistingAddressViewController *)self _getDomainName];
  v11 = [(BYODAddDomainRequest *)v7 initWithAccount:loggedInuserAccount accountStore:v9 domain:v10 familyFlow:self->_isFamilyFlow hasEmail:self->_hasExistingAddress];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4D1C4;
  v13[3] = &unk_B9548;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  id v14 = v12;
  [(BYODAddDomainRequest *)v11 performRequestWithCallback:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_triggerManualDomainSetupFlow
{
  if (_os_feature_enabled_impl())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4D59C;
    v5[3] = &unk_B8E88;
    v5[4] = self;
    id v3 = +[EFScheduler mainThreadScheduler];
    [v3 performBlock:v5];
  }
  else
  {
    id v3 = +[BYODExistingAddressViewController log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Mail.CustomEmailDomainManualSetupFlow feature is unavailable", v4, 2u);
    }
  }
}

- (void)_fetchDomainDetails
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [BYODGetDomainRequest alloc];
  loggedInuserAccount = self->_loggedInuserAccount;
  v5 = [(ACAccount *)loggedInuserAccount accountStore];
  v6 = [(BYODExistingAddressViewController *)self _getDomainName];
  v7 = [(BYODGetDomainRequest *)v3 initWithAccount:loggedInuserAccount accountStore:v5 domain:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4D770;
  v8[3] = &unk_B9290;
  objc_copyWeak(&v9, &location);
  [(BYODGetDomainRequest *)v7 performRequestWithCallback:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)_showDomainConnectSignInAlert:(id)a3
{
  id v4 = a3;
  v5 = [v4 domainConnectServerUrl];
  if ([v5 length])
  {
    id v23 = [objc_alloc((Class)NSURL) initWithString:v5];
    v24 = v5;
    v27 = [v4 dnsProviderName];
    v26 = [v4 name];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v27);

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v26, v27);

    v22 = (void *)v10;
    v11 = +[UIAlertController alertControllerWithTitle:v25 message:v10 preferredStyle:1];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v24;
    id v16 = [v15 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_4DF1C;
    v30[3] = &unk_B9310;
    v17 = v23;
    v31 = v17;
    v32 = self;
    v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v30];

    [v11 addAction:v14];
    [v11 addAction:v18];
    [v11 setPreferredAction:v18];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_4DFAC;
    v28[3] = &unk_B9010;
    v28[4] = self;
    id v19 = v11;
    id v29 = v19;
    v20 = +[EFScheduler mainThreadScheduler];
    [v20 performBlock:v28];
  }
  else
  {
    v17 = +[BYODExistingAddressViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v4, "ef_publicDescription");
      sub_7B6D8(v21, buf, v17);
    }
  }
}

- (void)_fetchFamilyDetails
{
  familyRequest = self->_familyRequest;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4E040;
  v3[3] = &unk_B9570;
  v3[4] = self;
  [(FAFetchFamilyCircleRequest *)familyRequest startRequestWithCompletionHandler:v3];
}

- (id)_getDomainName
{
  v2 = [(BYODExistingAddressViewController *)self specifierForID:@"DOMAIN_TEXT_FIELD"];
  id v3 = [v2 propertyForKey:@"cellObject"];
  id v4 = [v3 textField];
  v5 = [v4 text];

  return v5;
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

  [(BYODExistingAddressViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainResult, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_familyRequest, 0);
  objc_storeStrong((id *)&self->_userEnteredDomain, 0);

  objc_storeStrong((id *)&self->_loggedInuserAccount, 0);
}

@end