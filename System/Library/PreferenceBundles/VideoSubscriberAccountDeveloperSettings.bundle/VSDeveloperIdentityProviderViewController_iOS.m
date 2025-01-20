@interface VSDeveloperIdentityProviderViewController_iOS
- (BOOL)testingSystemTrust;
- (NSNumber)apiEnabled;
- (NSNumber)requireAuthenticationURLSystemTrustEnabled;
- (NSNumber)requireXHRRequestSystemTrustEnabled;
- (NSNumber)samlEnabled;
- (NSOperationQueue)privateQueue;
- (NSString)authenticationURL;
- (NSString)displayName;
- (NSString)identifier;
- (PSSpecifier)authenticationURLSpecicier;
- (PSSpecifier)displayNameSpecicier;
- (PSSpecifier)identifierSpecicier;
- (PSSpecifier)requireAuthenticationURLSystemTrustSpecifier;
- (PSSpecifier)requireXHRRequestSystemTrustSpecifier;
- (PSSpecifier)testSystemTrustSpecifier;
- (UITextField)authenticationURLTextField;
- (UITextField)displayNameTextField;
- (UITextField)identifierTextField;
- (VSDeveloperIdentityProviderViewController_iOS)init;
- (VSDeveloperSettingsFacade)settingsFacade;
- (VSIdentityProvider)identityProvider;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)cancelSelected:(id)a3;
- (void)deletePressed:(id)a3;
- (void)persistProviderAndDismiss;
- (void)reevaluateActions;
- (void)returnPressedAtEnd;
- (void)saveSelected:(id)a3;
- (void)setApiEnabled:(id)a3;
- (void)setAuthenticationURL:(id)a3;
- (void)setAuthenticationURLSpecicier:(id)a3;
- (void)setAuthenticationURLTextField:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameSpecicier:(id)a3;
- (void)setDisplayNameTextField:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierSpecicier:(id)a3;
- (void)setIdentifierTextField:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequireAuthenticationURLSystemTrustEnabled:(id)a3;
- (void)setRequireAuthenticationURLSystemTrustSpecifier:(id)a3;
- (void)setRequireXHRRequestSystemTrustEnabled:(id)a3;
- (void)setRequireXHRRequestSystemTrustSpecifier:(id)a3;
- (void)setSamlEnabled:(id)a3;
- (void)setSettingsFacade:(id)a3;
- (void)setTestSystemTrustSpecifier:(id)a3;
- (void)setTestingSystemTrust:(BOOL)a3;
- (void)setupViewForIdentityProvider:(id)a3;
- (void)testSystemTrustPressed:(id)a3;
- (void)textFieldDidChangeNotification:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VSDeveloperIdentityProviderViewController_iOS

- (VSDeveloperIdentityProviderViewController_iOS)init
{
  v12.receiver = self;
  v12.super_class = (Class)VSDeveloperIdentityProviderViewController_iOS;
  v2 = [(VSDeveloperIdentityProviderViewController_iOS *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[VSDeveloperSettingsFacade sharedFacade];
    settingsFacade = v2->_settingsFacade;
    v2->_settingsFacade = (VSDeveloperSettingsFacade *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v5;

    v7 = v2->_privateQueue;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(NSOperationQueue *)v7 setName:v9];

    samlEnabled = v2->_samlEnabled;
    v2->_samlEnabled = (NSNumber *)&__kCFBooleanTrue;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v29.receiver = self;
  v29.super_class = (Class)VSDeveloperIdentityProviderViewController_iOS;
  [(VSDeveloperIdentityProviderViewController_iOS *)&v29 viewWillAppear:a3];
  v4 = [(VSDeveloperIdentityProviderViewController_iOS *)self identityProvider];

  if (!v4)
  {
    v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self specifier];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 identifier];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v8 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
      v9 = [v8 providers];

      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v10)
      {
        v24 = v6;
        uint64_t v11 = *(void *)v26;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v14 = [v13 uniqueID];
            v15 = [v14 forceUnwrapObject];
            unsigned int v16 = [v15 isEqualToString:v7];

            if (v16)
            {
              id v10 = v13;
              goto LABEL_13;
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v10) {
            continue;
          }
          break;
        }
LABEL_13:
        v6 = v24;
      }

      v17 = (VSIdentityProvider *)[v10 copy];
      identityProvider = self->_identityProvider;
      self->_identityProvider = v17;
    }
  }
  v19 = [(VSDeveloperIdentityProviderViewController_iOS *)self identityProvider];
  if (v19)
  {
    [(VSDeveloperIdentityProviderViewController_iOS *)self setupViewForIdentityProvider:v19];
    [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifiers];
    id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"saveSelected:"];
  }
  else
  {
    id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:self action:"saveSelected:"];
    [v20 setEnabled:0];
    id v21 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelSelected:"];
    v22 = [(VSDeveloperIdentityProviderViewController_iOS *)self navigationItem];
    [v22 setLeftBarButtonItem:v21];
  }
  v23 = [(VSDeveloperIdentityProviderViewController_iOS *)self navigationItem];
  [v23 setRightBarButtonItem:v20];
}

- (void)setupViewForIdentityProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 nameForSorting];
  displayName = self->_displayName;
  self->_displayName = v5;

  v7 = [v4 providerID];
  v8 = [v7 forceUnwrapObject];
  identifier = self->_identifier;
  self->_identifier = v8;

  id v10 = [v4 authenticationURL];
  uint64_t v11 = [v10 absoluteString];
  authenticationURL = self->_authenticationURL;
  self->_authenticationURL = v11;

  v13 = [v4 supportedAuthenticationSchemes];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 containsObject:VSAccountProviderAuthenticationSchemeSAML]);
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  samlEnabled = self->_samlEnabled;
  self->_samlEnabled = v14;

  id v18 = [v4 supportedAuthenticationSchemes];

  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 containsObject:VSAccountProviderAuthenticationSchemeAPI]);
  unsigned int v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  apiEnabled = self->_apiEnabled;
  self->_apiEnabled = v16;
}

- (void)reevaluateActions
{
  uint64_t v3 = [(VSDeveloperIdentityProviderViewController_iOS *)self navigationItem];
  id v12 = [v3 rightBarButtonItem];

  id v4 = [(VSDeveloperIdentityProviderViewController_iOS *)self displayName];
  if ([v4 length])
  {
    v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self identifier];
    if ([v5 length])
    {
      v6 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURL];
      BOOL v7 = [v6 length] != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  [v12 setEnabled:v7];
  v8 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURL];
  if ([v8 length]) {
    uint64_t v9 = [(VSDeveloperIdentityProviderViewController_iOS *)self testingSystemTrust] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }

  id v10 = [(VSDeveloperIdentityProviderViewController_iOS *)self testSystemTrustSpecifier];
  uint64_t v11 = +[NSNumber numberWithBool:v9];
  [v10 setProperty:v11 forKey:PSEnabledKey];
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);

  [(VSDeveloperIdentityProviderViewController_iOS *)self reevaluateActions];
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);

  [(VSDeveloperIdentityProviderViewController_iOS *)self reevaluateActions];
}

- (void)setAuthenticationURL:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationURL, a3);

  [(VSDeveloperIdentityProviderViewController_iOS *)self reevaluateActions];
}

- (void)setSamlEnabled:(id)a3
{
  id v4 = (NSNumber *)a3;
  if (![(NSNumber *)v4 BOOLValue])
  {
    v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self apiEnabled];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(VSDeveloperIdentityProviderViewController_iOS *)self apiEnabled];
      v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 BOOLValue] ^ 1);
      [(VSDeveloperIdentityProviderViewController_iOS *)self setApiEnabled:v8];
    }
  }
  samlEnabled = self->_samlEnabled;
  self->_samlEnabled = v4;

  [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifiers];
}

- (void)setApiEnabled:(id)a3
{
  id v4 = (NSNumber *)a3;
  if (![(NSNumber *)v4 BOOLValue])
  {
    v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self samlEnabled];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(VSDeveloperIdentityProviderViewController_iOS *)self samlEnabled];
      v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 BOOLValue] ^ 1);
      [(VSDeveloperIdentityProviderViewController_iOS *)self setSamlEnabled:v8];
    }
  }
  apiEnabled = self->_apiEnabled;
  self->_apiEnabled = v4;

  [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifiers];
}

- (void)setRequireAuthenticationURLSystemTrustEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_requireAuthenticationURLSystemTrustEnabled, a3);

  [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifiers];
}

- (void)setRequireXHRRequestSystemTrustEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_requireXHRRequestSystemTrustEnabled, a3);

  [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifiers];
}

- (void)persistProviderAndDismiss
{
  uint64_t v3 = [(VSDeveloperIdentityProviderViewController_iOS *)self displayName];
  if (![v3 length]) {
    goto LABEL_12;
  }
  id v4 = [(VSDeveloperIdentityProviderViewController_iOS *)self identifier];
  if (![v4 length])
  {

LABEL_12:
    goto LABEL_13;
  }
  v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURL];
  id v6 = [v5 length];

  if (!v6)
  {
LABEL_13:
    long long v25 = +[NSBundle vs_frameworkBundle];
    id v8 = [v25 localizedStringForKey:@"DEVELOPER_REQUIRED_FIELDS_ERROR_ALERT_TITLE" value:0 table:0];

    long long v26 = +[NSBundle vs_frameworkBundle];
    id v12 = [v26 localizedStringForKey:@"DEVELOPER_REQUIRED_FIELDS_ERROR_ALERT_MESSAGE" value:0 table:0];

    long long v27 = +[NSBundle vs_frameworkBundle];
    long long v28 = [v27 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

    +[UIAlertController alertControllerWithTitle:v8 message:v12 preferredStyle:1];
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_3F98;
    v34 = &unk_C5F8;
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v35;
    v30 = +[UIAlertAction actionWithTitle:v28 style:0 handler:&v31];
    objc_msgSend(v29, "addAction:", v30, v31, v32, v33, v34);
    [(VSDeveloperIdentityProviderViewController_iOS *)self presentViewController:v29 animated:1 completion:0];

    goto LABEL_14;
  }
  uint64_t v7 = [(VSDeveloperIdentityProviderViewController_iOS *)self identityProvider];
  id v8 = (id)v7;
  if (!v7)
  {
    id v8 = objc_alloc_init((Class)VSIdentityProvider);
    [v8 setDeveloper:1];
    uint64_t v9 = +[NSUUID UUID];
    id v10 = [v9 UUIDString];
    uint64_t v11 = +[VSOptional optionalWithObject:v10];
    [v8 setUniqueID:v11];
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = [(VSDeveloperIdentityProviderViewController_iOS *)self samlEnabled];
  unsigned int v14 = [v13 BOOLValue];

  if (v14) {
    [v12 addObject:VSAccountProviderAuthenticationSchemeSAML];
  }
  v15 = [(VSDeveloperIdentityProviderViewController_iOS *)self apiEnabled];
  unsigned int v16 = [v15 BOOLValue];

  if (v16) {
    [v12 addObject:VSAccountProviderAuthenticationSchemeAPI];
  }
  [v8 setSupportedAuthenticationSchemes:v12];
  v17 = [(VSDeveloperIdentityProviderViewController_iOS *)self identifier];
  id v18 = +[VSOptional optionalWithObject:v17];
  [v8 setProviderID:v18];

  v19 = [(VSDeveloperIdentityProviderViewController_iOS *)self displayName];
  [v8 setNameForSorting:v19];

  id v20 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURL];
  id v21 = +[NSURL URLWithString:v20];
  [v8 setAuthenticationURL:v21];

  v22 = [(VSDeveloperIdentityProviderViewController_iOS *)self requireAuthenticationURLSystemTrustEnabled];
  objc_msgSend(v8, "setRequireAuthenticationURLSystemTrust:", objc_msgSend(v22, "BOOLValue"));

  v23 = [(VSDeveloperIdentityProviderViewController_iOS *)self requireXHRRequestSystemTrustEnabled];
  objc_msgSend(v8, "setRequireXHRRequestSystemTrust:", objc_msgSend(v23, "BOOLValue"));

  v24 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_3DA8;
  v36[3] = &unk_C620;
  v36[4] = self;
  [v24 enqueueChange:v7 != 0 withIdentityProvider:v8 completionHandler:v36];

LABEL_14:
}

- (void)cancelSelected:(id)a3
{
}

- (void)saveSelected:(id)a3
{
}

- (void)deletePressed:(id)a3
{
  id v4 = [(VSDeveloperIdentityProviderViewController_iOS *)self identityProvider];
  v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_409C;
  v9[3] = &unk_C620;
  id v10 = v4;
  id v6 = v4;
  [v5 enqueueChange:2 withIdentityProvider:v6 completionHandler:v9];

  uint64_t v7 = [(VSDeveloperIdentityProviderViewController_iOS *)self navigationController];
  id v8 = [v7 popViewControllerAnimated:1];
}

- (void)testSystemTrustPressed:(id)a3
{
  if (+[VSProxyDetector isProxyConfigured])
  {
    id v4 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
    id v19 = [v4 alertTitleForProxyDetection];

    v5 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
    id v6 = [v5 alertMessageForProxyDetection];

    uint64_t v7 = +[UIAlertController alertControllerWithTitle:v19 message:v6 preferredStyle:1];
    id v8 = [(VSDeveloperIdentityProviderViewController_iOS *)self settingsFacade];
    uint64_t v9 = [v8 dismissTitleForProxyDetection];

    id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:0];
    [v7 addAction:v10];

    [(VSDeveloperIdentityProviderViewController_iOS *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    uint64_t v11 = [(VSDeveloperIdentityProviderViewController_iOS *)self testSystemTrustSpecifier];
    [v11 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];

    id v12 = [(VSDeveloperIdentityProviderViewController_iOS *)self testSystemTrustSpecifier];
    [(VSDeveloperIdentityProviderViewController_iOS *)self reloadSpecifier:v12];

    v13 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURL];
    unsigned int v14 = +[NSURL URLWithString:v13];

    id v15 = [objc_alloc((Class)VSApplicationBootURLOperation) initWithBootURL:v14 isDeveloper:0];
    [v15 setTest:1];
    id v20 = v15;
    id v16 = v15;
    v17 = VSMainThreadOperationWithBlock();
    [v17 addDependency:v16];
    id v18 = [(VSDeveloperIdentityProviderViewController_iOS *)self privateQueue];
    [v18 addOperation:v16];

    VSEnqueueCompletionOperation();
  }
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v62 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[NSBundle vs_frameworkBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"DEVELOPER_PROVIDER_DISPLAY_NAME_TITLE" value:0 table:0];

    uint64_t v7 = +[NSBundle vs_frameworkBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"DEVELOPER_PROVIDER_NAME_PLACEHOLDER" value:0 table:0];

    v61 = (void *)v6;
    uint64_t v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v6 target:self set:"setDisplayName:" get:"displayName" detail:0 cell:8 edit:0];
    v60 = (void *)v8;
    [v9 setPlaceholder:v8];
    [v9 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v4 addObject:v9];
    v59 = v9;
    [(VSDeveloperIdentityProviderViewController_iOS *)self setDisplayNameSpecicier:v9];
    id v10 = +[NSBundle vs_frameworkBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_TITLE" value:0 table:0];

    id v12 = +[NSBundle vs_frameworkBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_PLACEHOLDER" value:0 table:0];

    v58 = (void *)v11;
    unsigned int v14 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v11 target:self set:"setIdentifier:" get:"identifier" detail:0 cell:8 edit:0];
    v57 = (void *)v13;
    [v14 setPlaceholder:v13];
    [v14 setKeyboardType:0 autoCaps:0 autoCorrection:1];
    [v4 addObject:v14];
    v56 = v14;
    [(VSDeveloperIdentityProviderViewController_iOS *)self setIdentifierSpecicier:v14];
    id v15 = +[NSBundle vs_frameworkBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_TITLE" value:0 table:0];

    v17 = +[NSBundle vs_frameworkBundle];
    uint64_t v18 = [v17 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_PLACEHOLDER" value:0 table:0];

    v55 = (void *)v16;
    id v19 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v16 target:self set:"setAuthenticationURL:" get:"authenticationURL" detail:0 cell:8 edit:0];
    v54 = (void *)v18;
    [v19 setPlaceholder:v18];
    [v19 setKeyboardType:3 autoCaps:0 autoCorrection:1];
    [v4 addObject:v19];
    v53 = v19;
    [(VSDeveloperIdentityProviderViewController_iOS *)self setAuthenticationURLSpecicier:v19];
    id v20 = +[NSBundle vs_frameworkBundle];
    uint64_t v21 = [v20 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_SCHEME_TITLE" value:0 table:0];

    v22 = +[NSBundle vs_frameworkBundle];
    uint64_t v23 = [v22 localizedStringForKey:@"DEVELOPER_SETTINGS_AUTH_SCHEME_ERROR_MESSAGE" value:0 table:0];

    v52 = (void *)v21;
    v24 = +[PSSpecifier groupSpecifierWithName:v21];
    v51 = (void *)v23;
    [v24 setProperty:v23 forKey:PSFooterTextGroupKey];
    v50 = v24;
    [v4 addObject:v24];
    v49 = +[PSSpecifier preferenceSpecifierNamed:@"SAML" target:self set:"setSamlEnabled:" get:"samlEnabled" detail:0 cell:6 edit:0];
    objc_msgSend(v4, "addObject:");
    v48 = +[PSSpecifier preferenceSpecifierNamed:@"API" target:self set:"setApiEnabled:" get:"apiEnabled" detail:0 cell:6 edit:0];
    objc_msgSend(v4, "addObject:");
    long long v25 = +[NSBundle vs_frameworkBundle];
    uint64_t v26 = [v25 localizedStringForKey:@"DEVELOPER_PROVIDER_PRODUCTION_SECURITY_GROUP_TITLE" value:0 table:0];

    v47 = (void *)v26;
    v46 = +[PSSpecifier groupSpecifierWithName:v26];
    objc_msgSend(v4, "addObject:");
    long long v27 = +[NSBundle vs_frameworkBundle];
    uint64_t v28 = [v27 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_SYSTEM_TRUST" value:0 table:0];

    v45 = (void *)v28;
    id v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:"setRequireAuthenticationURLSystemTrustEnabled:" get:"requireAuthenticationURLSystemTrustEnabled" detail:0 cell:6 edit:0];
    [(VSDeveloperIdentityProviderViewController_iOS *)self setRequireAuthenticationURLSystemTrustSpecifier:v29];
    [v4 addObject:v29];
    v30 = +[NSBundle vs_frameworkBundle];
    uint64_t v31 = [v30 localizedStringForKey:@"DEVELOPER_PROVIDER_XHR_REQUEST_SYSTEM_TRUST" value:0 table:0];

    v44 = (void *)v31;
    uint64_t v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:"setRequireXHRRequestSystemTrustEnabled:" get:"requireXHRRequestSystemTrustEnabled" detail:0 cell:6 edit:0];
    [(VSDeveloperIdentityProviderViewController_iOS *)self setRequireXHRRequestSystemTrustSpecifier:v32];
    [v4 addObject:self->_requireXHRRequestSystemTrustSpecifier];
    v33 = +[PSSpecifier emptyGroupSpecifier];
    [v4 addObject:v33];
    v34 = +[NSBundle vs_frameworkBundle];
    id v35 = [v34 localizedStringForKey:@"DEVELOPER_TEST_SYSTEM_TRUST_ACTION_TITLE" value:0 table:0];

    v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v36 setButtonAction:"testSystemTrustPressed:"];
    [v4 addObject:v36];
    [(VSDeveloperIdentityProviderViewController_iOS *)self setTestSystemTrustSpecifier:v36];
    v37 = [(VSDeveloperIdentityProviderViewController_iOS *)self identityProvider];

    if (v37)
    {
      v38 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v38];
      v39 = +[NSBundle vs_frameworkBundle];
      v40 = [v39 localizedStringForKey:@"DEVELOPER_DELETION_ACTION_TITLE" value:0 table:0];

      v41 = +[PSSpecifier deleteButtonSpecifierWithName:v40 target:self action:"deletePressed:"];
      [v4 addObject:v41];
    }
    v42 = *(void **)&self->PSListController_opaque[v62];
    *(void *)&self->PSListController_opaque[v62] = v4;

    uint64_t v3 = *(void **)&self->PSListController_opaque[v62];
  }

  return v3;
}

- (void)returnPressedAtEnd
{
  id v3 = [(VSDeveloperIdentityProviderViewController_iOS *)self table];
  v2 = [v3 firstResponder];
  [v2 resignFirstResponder];
}

- (void)textFieldDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 text];
  id v6 = [(VSDeveloperIdentityProviderViewController_iOS *)self displayNameTextField];

  if (v6 == v4)
  {
    [(VSDeveloperIdentityProviderViewController_iOS *)self setDisplayName:v5];
  }
  else
  {
    id v7 = [(VSDeveloperIdentityProviderViewController_iOS *)self identifierTextField];

    if (v7 == v4)
    {
      [(VSDeveloperIdentityProviderViewController_iOS *)self setIdentifier:v5];
    }
    else
    {
      id v8 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURLTextField];

      if (v8 == v4)
      {
        [(VSDeveloperIdentityProviderViewController_iOS *)self setAuthenticationURL:v5];
      }
      else
      {
        uint64_t v9 = VSErrorLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_73C8((uint64_t)v4, v9);
        }
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VSDeveloperIdentityProviderViewController_iOS;
  v5 = [(VSDeveloperIdentityProviderViewController_iOS *)&v13 tableView:a3 cellForRowAtIndexPath:a4];
  id v6 = [v5 specifier];
  id v7 = [v5 editableTextField];
  id v8 = [(VSDeveloperIdentityProviderViewController_iOS *)self displayNameSpecicier];

  if (v6 == v8)
  {
    [(VSDeveloperIdentityProviderViewController_iOS *)self setDisplayNameTextField:v7];
  }
  else
  {
    uint64_t v9 = [(VSDeveloperIdentityProviderViewController_iOS *)self identifierSpecicier];

    if (v6 == v9)
    {
      [(VSDeveloperIdentityProviderViewController_iOS *)self setIdentifierTextField:v7];
    }
    else
    {
      id v10 = [(VSDeveloperIdentityProviderViewController_iOS *)self authenticationURLSpecicier];

      if (v6 != v10) {
        goto LABEL_8;
      }
      [(VSDeveloperIdentityProviderViewController_iOS *)self setAuthenticationURLTextField:v7];
    }
  }
  [v7 addTarget:self action:"textFieldDidChangeNotification:" forControlEvents:0x20000];
LABEL_8:
  if ([v5 tag] == &dword_8)
  {
    uint64_t v11 = [v5 editableTextField];
    [v11 setClearButtonMode:1];
  }

  return v5;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (VSDeveloperSettingsFacade)settingsFacade
{
  return self->_settingsFacade;
}

- (void)setSettingsFacade:(id)a3
{
}

- (BOOL)testingSystemTrust
{
  return self->_testingSystemTrust;
}

- (void)setTestingSystemTrust:(BOOL)a3
{
  self->_testingSystemTrust = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)authenticationURL
{
  return self->_authenticationURL;
}

- (PSSpecifier)displayNameSpecicier
{
  return self->_displayNameSpecicier;
}

- (void)setDisplayNameSpecicier:(id)a3
{
}

- (PSSpecifier)identifierSpecicier
{
  return self->_identifierSpecicier;
}

- (void)setIdentifierSpecicier:(id)a3
{
}

- (PSSpecifier)authenticationURLSpecicier
{
  return self->_authenticationURLSpecicier;
}

- (void)setAuthenticationURLSpecicier:(id)a3
{
}

- (PSSpecifier)testSystemTrustSpecifier
{
  return self->_testSystemTrustSpecifier;
}

- (void)setTestSystemTrustSpecifier:(id)a3
{
}

- (PSSpecifier)requireAuthenticationURLSystemTrustSpecifier
{
  return self->_requireAuthenticationURLSystemTrustSpecifier;
}

- (void)setRequireAuthenticationURLSystemTrustSpecifier:(id)a3
{
}

- (PSSpecifier)requireXHRRequestSystemTrustSpecifier
{
  return self->_requireXHRRequestSystemTrustSpecifier;
}

- (void)setRequireXHRRequestSystemTrustSpecifier:(id)a3
{
}

- (UITextField)displayNameTextField
{
  return self->_displayNameTextField;
}

- (void)setDisplayNameTextField:(id)a3
{
}

- (UITextField)identifierTextField
{
  return self->_identifierTextField;
}

- (void)setIdentifierTextField:(id)a3
{
}

- (UITextField)authenticationURLTextField
{
  return self->_authenticationURLTextField;
}

- (void)setAuthenticationURLTextField:(id)a3
{
}

- (NSNumber)samlEnabled
{
  return self->_samlEnabled;
}

- (NSNumber)apiEnabled
{
  return self->_apiEnabled;
}

- (NSNumber)requireAuthenticationURLSystemTrustEnabled
{
  return self->_requireAuthenticationURLSystemTrustEnabled;
}

- (NSNumber)requireXHRRequestSystemTrustEnabled
{
  return self->_requireXHRRequestSystemTrustEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requireXHRRequestSystemTrustEnabled, 0);
  objc_storeStrong((id *)&self->_requireAuthenticationURLSystemTrustEnabled, 0);
  objc_storeStrong((id *)&self->_apiEnabled, 0);
  objc_storeStrong((id *)&self->_samlEnabled, 0);
  objc_storeStrong((id *)&self->_authenticationURLTextField, 0);
  objc_storeStrong((id *)&self->_identifierTextField, 0);
  objc_storeStrong((id *)&self->_displayNameTextField, 0);
  objc_storeStrong((id *)&self->_requireXHRRequestSystemTrustSpecifier, 0);
  objc_storeStrong((id *)&self->_requireAuthenticationURLSystemTrustSpecifier, 0);
  objc_storeStrong((id *)&self->_testSystemTrustSpecifier, 0);
  objc_storeStrong((id *)&self->_authenticationURLSpecicier, 0);
  objc_storeStrong((id *)&self->_identifierSpecicier, 0);
  objc_storeStrong((id *)&self->_displayNameSpecicier, 0);
  objc_storeStrong((id *)&self->_authenticationURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_settingsFacade, 0);

  objc_storeStrong((id *)&self->_identityProvider, 0);
}

@end