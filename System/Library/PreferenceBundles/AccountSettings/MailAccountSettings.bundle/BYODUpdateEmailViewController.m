@interface BYODUpdateEmailViewController
- (BYODUpdateEmailViewController)initWithAccount:(id)a3 domain:(id)a4 addAlias:(BOOL)a5;
- (PSSpecifier)callingSpecifier;
- (id)_getEmailFromSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_addAliasAddress;
- (void)_addEmailAddress;
- (void)_cancelButtonTapped:(id)a3;
- (void)_postNotificationForDomainData:(id)a3;
- (void)_updatEmailAddress:(id)a3;
- (void)setCallingSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODUpdateEmailViewController

- (BYODUpdateEmailViewController)initWithAccount:(id)a3 domain:(id)a4 addAlias:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BYODUpdateEmailViewController;
  v11 = [(BYODUpdateEmailViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_loggedInUserAccount, a3);
    objc_storeStrong((id *)&v12->_domainResult, a4);
    v12->_addAlias = a5;
  }

  return v12;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)BYODUpdateEmailViewController;
  [(BYODUpdateEmailViewController *)&v13 viewDidLoad];
  v3 = [(BYODUpdateEmailViewController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_EMAIL_ADDRESS_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setTitle:v5];

  v6 = [(BYODUpdateEmailViewController *)self navigationItem];
  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  [v6 setLeftBarButtonItem:v7];

  v8 = [(BYODUpdateEmailViewController *)self navigationItem];
  id v9 = objc_alloc((Class)UIBarButtonItem);
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = [v9 initWithTitle:v11 style:0 target:self action:"_updatEmailAddress:"];
  [v8 setRightBarButtonItem:v12];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_NEW_EMAIL_GROUP_ID"];
  if (!self->_addAlias)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"BYOD_UPDATE_EMAIL_SCREEN_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v4 setProperty:v6 forKey:PSFooterTextGroupKey];
  }
  [v3 addObject:v4];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:8 edit:0];
  id v10 = (void *)_updateEmailSpecifier;
  _updateEmailSpecifier = v9;

  [(id)_updateEmailSpecifier setIdentifier:@"BYOD_UPDATE_EMAIL_SPECIFIER_ID"];
  [(id)_updateEmailSpecifier setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v3 addObject:_updateEmailSpecifier];
  id v11 = [v3 copy];
  uint64_t v12 = OBJC_IVAR___PSListController__specifiers;
  objc_super v13 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v11;

  id v14 = *(id *)&self->PSListController_opaque[v12];
  return v14;
}

- (void)_updatEmailAddress:(id)a3
{
  if (self->_addAlias) {
    [(BYODUpdateEmailViewController *)self _addAliasAddress];
  }
  else {
    [(BYODUpdateEmailViewController *)self _addEmailAddress];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (id)_getEmailFromSpecifier
{
  v2 = [(id)_updateEmailSpecifier propertyForKey:@"cellObject"];
  id v3 = [v2 value];

  return v3;
}

- (void)_addEmailAddress
{
  id v3 = [(BYODUpdateEmailViewController *)self callingSpecifier];
  uint64_t v4 = [v3 propertyForKey:@"MEMBER_DSID"];

  v20 = (void *)v4;
  v22 = [(BYODGetDomainResult *)self->_domainResult getMemberFromIdentifier:v4];
  v5 = [(BYODUpdateEmailViewController *)self _getEmailFromSpecifier];
  v6 = [(BYODGetDomainResult *)self->_domainResult domain];
  id v7 = [v6 name];
  v21 = +[NSString stringWithFormat:@"%@%@%@", v5, @"@", v7];

  v8 = [BYODAddEmailRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v10 = [(ACAccount *)loggedInUserAccount accountStore];
  id v11 = [(BYODGetDomainResult *)self->_domainResult domain];
  uint64_t v12 = [v11 name];
  v26 = v21;
  objc_super v13 = +[NSArray arrayWithObjects:&v26 count:1];
  id v14 = [v22 dsid];
  v15 = [v22 invitedEmail];
  v16 = [v22 invitedPhoneNumber];
  v17 = [(BYODAddEmailRequest *)v8 initWithAccount:loggedInUserAccount accountStore:v10 domain:v12 emailArray:v13 dsid:v14 withEmail:v15 withPhone:v16];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18 = [[BYODSpinner alloc] initWithViewController:self];
  spinner = self->_spinner;
  self->_spinner = v18;

  [(BYODSpinner *)self->_spinner startSpinner];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_69994;
  v23[3] = &unk_B9290;
  objc_copyWeak(&v24, &location);
  [(BYODAddEmailRequest *)v17 performRequestWithCallback:v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_addAliasAddress
{
  v2 = self;
  id v3 = [(BYODUpdateEmailViewController *)self _getEmailFromSpecifier];
  uint64_t v4 = [(BYODGetDomainResult *)v2->_domainResult domain];
  v5 = [v4 name];
  v6 = +[NSString stringWithFormat:@"%@%@%@", v3, @"@", v5];

  id v7 = [BYODAddAliasRequest alloc];
  loggedInUserAccount = v2->_loggedInUserAccount;
  uint64_t v9 = [(ACAccount *)loggedInUserAccount accountStore];
  id v10 = [(BYODGetDomainResult *)v2->_domainResult domain];
  id v11 = [v10 name];
  v20 = v6;
  uint64_t v12 = +[NSArray arrayWithObjects:&v20 count:1];
  objc_super v13 = [(ACAccount *)v2->_loggedInUserAccount normalizedDSID];
  id v14 = [(BYODAddAliasRequest *)v7 initWithAccount:loggedInUserAccount accountStore:v9 domain:v11 emailArray:v12 dsid:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v2);
  v15 = [[BYODSpinner alloc] initWithViewController:v2];
  v2 = (BYODUpdateEmailViewController *)((char *)v2 + 200);
  id v16 = *(id *)v2->PSListController_opaque;
  *(void *)v2->PSListController_opaque = v15;

  [*(id *)v2->PSListController_opaque startSpinner];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_69E60;
  v17[3] = &unk_B9290;
  objc_copyWeak(&v18, &location);
  [(BYODAddAliasRequest *)v14 performRequestWithCallback:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BYODUpdateEmailViewController;
  v5 = [(BYODUpdateEmailViewController *)&v15 tableView:a3 cellForRowAtIndexPath:a4];
  v6 = [v5 detailTextLabel];
  [v6 setNumberOfLines:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 textField];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"BYOD_UPDATE_EMAIL_TEXT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v7 setPlaceholder:v9];

    id v10 = [(BYODGetDomainResult *)self->_domainResult domain];
    id v11 = [v10 name];
    uint64_t v12 = +[NSString stringWithFormat:@"%@%@", @"@", v11];

    objc_super v13 = +[UIColor secondaryLabelColor];
    [v7 _setSuffix:v12 withColor:v13];

    [v7 setDelegate:self];
  }

  return v5;
}

- (void)_postNotificationForDomainData:(id)a3
{
  id v5 = a3;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:v5 forKey:@"domainData"];
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0 userInfo:v3];
}

- (PSSpecifier)callingSpecifier
{
  return self->_callingSpecifier;
}

- (void)setCallingSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingSpecifier, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end