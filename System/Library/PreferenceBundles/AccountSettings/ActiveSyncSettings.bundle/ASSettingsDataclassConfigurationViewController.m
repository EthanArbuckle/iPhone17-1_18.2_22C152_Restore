@interface ASSettingsDataclassConfigurationViewController
+ (BOOL)isHotmailAccount;
- (ASWebAuthenticationSession)webAuthenticationSession;
- (BOOL)_isNetworkOfflineError:(id)a3;
- (BOOL)_storeHasDuplicateForUsername:(id)a3 withoutIdentifier:(id)a4 withAccountType:(id)a5;
- (BOOL)isFetchingOutOfOfficeState;
- (BOOL)outOfOfficeEnabled;
- (Class)accountInfoControllerClass;
- (DAEASOAuthWebViewController)webAuthController;
- (DAExchangeOAuthFlowController)oauthFlowController;
- (DAOofParams)serverOutOfOfficeInformation;
- (DAOofSettingsInfo)DASettingsInfo;
- (NSMutableArray)reauthSpecifiers;
- (NSNumber)isOofSupported;
- (NSURLSession)autoDV2RedirectSession;
- (PSSpecifier)outOfOfficeSpecifier;
- (PSSpecifier)reAuthenticationButtonSpecifier;
- (UIView)originalAccessoryView;
- (id)_reAuthenticationSectionSpecifiers;
- (id)accountDescriptionForFirstTimeSetup;
- (id)accountFromSpecifier;
- (id)accountIntegerPropertyWithSpecifier:(id)a3;
- (id)completion;
- (id)numFoldersToPushString:(id)a3;
- (id)otherSpecifiers;
- (id)outOfOfficeEnabled:(id)a3;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (id)redirectHandlerBlock;
- (id)specifiers;
- (unint64_t)backgroundTaskID;
- (unint64_t)numberOfRetriedFetchingOutOfOfficeCounter;
- (void)OAuthAccount:(id)a3 authorizationURI:(id)a4 error:(id)a5;
- (void)_autodiscoverOAuthAccountIsOnPrem:(BOOL)a3;
- (void)_disableReAuthenticationButton;
- (void)_enableReAuthenticationButton;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)_reAuthenticationButtonTapped;
- (void)checkAndFetchOutOfOfficeState;
- (void)dealloc;
- (void)fetchingOutOfOfficeState;
- (void)handleRedirectURL:(id)a3;
- (void)handleURL:(id)a3;
- (void)oofRequestInfo:(id)a3 finishedWithResult:(id)a4 error:(id)a5;
- (void)reloadAccount;
- (void)removeOutOfOfficeSpecifier;
- (void)saveOutOfOfficeData:(id)a3;
- (void)setAccountIntegerProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAutoDV2RedirectSession:(id)a3;
- (void)setBackgroundTaskID:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDASettingsInfo:(id)a3;
- (void)setIsFetchingOutOfOfficeState:(BOOL)a3;
- (void)setIsOofSupported:(id)a3;
- (void)setNumberOfRetriedFetchingOutOfOfficeCounter:(unint64_t)a3;
- (void)setOauthFlowController:(id)a3;
- (void)setOriginalAccessoryView:(id)a3;
- (void)setOutOfOfficeEnabled:(BOOL)a3;
- (void)setOutOfOfficeSpecifier:(id)a3;
- (void)setReAuthenticationButtonSpecifier:(id)a3;
- (void)setReauthSpecifiers:(id)a3;
- (void)setRedirectHandlerBlock:(id)a3;
- (void)setServerOutOfOfficeInformation:(id)a3;
- (void)setWebAuthController:(id)a3;
- (void)setWebAuthenticationSession:(id)a3;
- (void)updateOutOfOfficeSpecifier;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASSettingsDataclassConfigurationViewController

+ (BOOL)isHotmailAccount
{
  return 0;
}

- (Class)accountInfoControllerClass
{
  [(id)objc_opt_class() isHotmailAccount];
  v2 = objc_opt_class();

  return (Class)v2;
}

- (id)accountDescriptionForFirstTimeSetup
{
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"HOTMAIL";
  }
  else
  {
    v6 = [(ASSettingsDataclassConfigurationViewController *)self account];
    v7 = [v6 accountDescription];

    if (v7)
    {
      v4 = [(ASSettingsDataclassConfigurationViewController *)self account];
      uint64_t v8 = [v4 accountDescription];
      goto LABEL_7;
    }
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"EXCHANGE";
  }
  uint64_t v8 = [v3 localizedStringForKey:v5 value:&stru_30C50 table:@"ASAccountSetup"];
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (void)reloadAccount
{
  id v2 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  [v2 reload];
}

- (void)dealloc
{
  v3 = +[PSOAuthAccountRedirectURLController sharedInstance];
  v4 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  [v3 unRegisterOAuthClientForRedirectURL:v4];

  v5.receiver = self;
  v5.super_class = (Class)ASSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v5 dealloc];
}

- (id)specifiers
{
  if (([(id)objc_opt_class() isHotmailAccount] & 1) == 0)
  {
    v3 = [(ASSettingsDataclassConfigurationViewController *)self account];
    v4 = [v3 objectForKeyedSubscript:kESExchangeOAuthSupportedKey];
    if (v4)
    {
    }
    else
    {
      objc_super v5 = [(ASSettingsDataclassConfigurationViewController *)self account];
      v6 = (char *)[v5 migrationStatus];

      if (v6 != (unsigned char *)&dword_0 + 1)
      {
        v35.receiver = self;
        v35.super_class = (Class)ASSettingsDataclassConfigurationViewController;
        v7 = [(ESSettingsDataclassConfigurationViewController *)&v35 specifiers];
        goto LABEL_31;
      }
    }
  }
  v7 = objc_opt_new();
  uint64_t v8 = [(ASSettingsDataclassConfigurationViewController *)self account];
  unsigned int v9 = [v8 isAuthenticated];

  if (v9
    && ([(ASSettingsDataclassConfigurationViewController *)self account],
        v10 = objc_claimAutoreleasedReturnValue(),
        v11 = (char *)[v10 migrationStatus],
        v10,
        v11 != (unsigned char *)&dword_0 + 1))
  {
    v12 = 0;
  }
  else
  {
    v12 = [(ASSettingsDataclassConfigurationViewController *)self _reAuthenticationSectionSpecifiers];
    [v7 addObjectsFromArray:v12];
  }
  v40.receiver = self;
  v40.super_class = (Class)ASSettingsDataclassConfigurationViewController;
  v13 = [(ESSettingsDataclassConfigurationViewController *)&v40 specifiers];
  id v14 = [v13 mutableCopy];
  [v7 addObjectsFromArray:v14];

  if (!v9
    || [(ASSettingsDataclassConfigurationViewController *)self isAccountModificationDisabled])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v34 = v7;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v37;
      uint64_t v19 = PSEnabledKey;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v22 = [(ASSettingsDataclassConfigurationViewController *)self deleteButtonSpecifier];
          if (v21 == (void *)v22)
          {
          }
          else
          {
            v23 = (void *)v22;
            unsigned __int8 v24 = [v12 containsObject:v21];

            if ((v24 & 1) == 0) {
              [v21 setProperty:&__kCFBooleanFalse forKey:v19];
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
    }

    v7 = v34;
  }
  if ([v7 count])
  {
    v25 = [v7 objectAtIndexedSubscript:0];
    v26 = [v25 name];
    id v27 = [v26 length];

    if (v27)
    {
      unsigned int v28 = [(id)objc_opt_class() isHotmailAccount];
      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = v29;
      if (v28) {
        CFStringRef v31 = @"HOTMAIL";
      }
      else {
        CFStringRef v31 = @"EXCHANGE";
      }
      v32 = [v29 localizedStringForKey:v31 value:&stru_30C50 table:@"ASAccountSetup"];
      [v25 setName:v32];
    }
  }
  objc_storeStrong((id *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers], v7);

LABEL_31:

  return v7;
}

- (id)accountFromSpecifier
{
  id v2 = [(ASSettingsDataclassConfigurationViewController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:ACUIAccountKey];

  if (v4)
  {
    objc_super v5 = [v4 objectForKeyedSubscript:kDAAccountEmailAddress];
    uint64_t v6 = kDAAccountStolenDisplayUsername;
    v7 = [v4 objectForKeyedSubscript:kDAAccountStolenDisplayUsername];
    uint64_t v8 = v7;
    if (v5 && ([v7 isEqualToString:v5] & 1) == 0) {
      [v4 setObject:v5 forKeyedSubscript:v6];
    }
    unsigned int v9 = +[ESAccountLoader sharedInstance];
    v10 = (objc_class *)[v9 daemonAppropriateAccountClassForACAccount:v4];

    id v11 = [[v10 alloc] initWithBackingAccountInfo:v4];
    [v11 reload];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_reAuthenticationSectionSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier emptyGroupSpecifier];
  objc_super v5 = [(ASSettingsDataclassConfigurationViewController *)self account];
  uint64_t v6 = [v5 username];
  [v4 setProperty:v6 forKey:@"EASNameForAccountToAuthenticate"];

  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v4 setProperty:v8 forKey:PSFooterCellClassGroupKey];

  [v3 addObject:v4];
  unsigned int v9 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v9];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"REENTER_PASSWORD" value:&stru_30C50 table:@"ASAccountSetup"];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];
  [(ASSettingsDataclassConfigurationViewController *)self setReAuthenticationButtonSpecifier:v12];

  v13 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [v13 setButtonAction:"_reAuthenticationButtonTapped"];

  id v14 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [v3 addObject:v14];

  return v3;
}

- (void)_enableReAuthenticationButton
{
  id v3 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  id v4 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [(ASSettingsDataclassConfigurationViewController *)self reloadSpecifier:v4];
}

- (void)_disableReAuthenticationButton
{
  id v3 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];

  id v4 = [(ASSettingsDataclassConfigurationViewController *)self reAuthenticationButtonSpecifier];
  [(ASSettingsDataclassConfigurationViewController *)self reloadSpecifier:v4];
}

- (BOOL)_storeHasDuplicateForUsername:(id)a3 withoutIdentifier:(id)a4 withAccountType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ASSettingsDataclassConfigurationViewController *)self accountStore];
  v12 = [v11 accountsWithAccountType:v10];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    id v26 = v10;
    uint64_t v15 = *(void *)v29;
    uint64_t v16 = kDAAccountEmailAddress;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "identifier", v26);
        id v20 = [v9 compare:v19 options:1];

        if (v20)
        {
          v21 = [v18 username];
          if (![v8 compare:v21 options:1])
          {

            BOOL v23 = 1;
            goto LABEL_14;
          }
          uint64_t v22 = [v18 objectForKeyedSubscript:v16];
          BOOL v23 = 1;
          id v24 = [v8 compare:v22 options:1];

          if (!v24) {
            goto LABEL_14;
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    BOOL v23 = 0;
LABEL_14:
    id v10 = v26;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)handleRedirectURL:(id)a3
{
  SEL v45 = a2;
  id v46 = a3;
  id v3 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:");
  id v4 = [v3 queryItems];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (!v5)
  {

    uint64_t v6 = 0;
    v50 = 0;
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    goto LABEL_22;
  }
  v48 = 0;
  v49 = 0;
  v50 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v55;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v55 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      id v10 = objc_msgSend(v9, "name", v45);
      BOOL v11 = [v10 caseInsensitiveCompare:@"code"] == 0;

      if (v11)
      {
        uint64_t v20 = [v9 value];
        uint64_t v19 = v6;
        uint64_t v6 = (void *)v20;
      }
      else
      {
        v12 = [v9 name];
        BOOL v13 = [v12 caseInsensitiveCompare:@"state"] == 0;

        if (v13)
        {
          uint64_t v21 = [v9 value];
          uint64_t v19 = v50;
          v50 = (void *)v21;
        }
        else
        {
          id v14 = [v9 name];
          BOOL v15 = [v14 caseInsensitiveCompare:@"error"] == 0;

          if (v15)
          {
            uint64_t v22 = [v9 value];
            uint64_t v19 = v49;
            v49 = (void *)v22;
          }
          else
          {
            uint64_t v16 = [v9 name];
            BOOL v17 = [v16 caseInsensitiveCompare:@"error_description"] == 0;

            if (!v17) {
              continue;
            }
            uint64_t v18 = [v9 value];
            uint64_t v19 = v48;
            v48 = (void *)v18;
          }
        }
      }
    }
    id v5 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  }
  while (v5);

  if (v6)
  {
    BOOL v23 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
    id v24 = [v23 state];
    unsigned int v25 = [v50 isEqualToString:v24];

    if (v25)
    {
      objc_initWeak((id *)location, self);
      id v26 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
      id v27 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
      long long v28 = [v27 challenge];
      long long v29 = [v28 codeVerifier];
      long long v30 = [(ASSettingsDataclassConfigurationViewController *)self account];
      long long v31 = [v30 objectForKeyedSubscript:kESExchangePendingClaimsChallenge];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1AC64;
      v52[3] = &unk_309C8;
      objc_copyWeak(v53, (id *)location);
      v52[4] = self;
      v53[1] = (id)v45;
      [v26 exchangeAuthCode:v6 codeVerifier:v29 claims:v31 withCompletion:v52];

      objc_destroyWeak(v53);
      objc_destroyWeak((id *)location);
      goto LABEL_29;
    }
  }
  unint64_t v33 = (unint64_t)v48;
  unint64_t v32 = (unint64_t)v49;
LABEL_22:
  v48 = (void *)v33;
  v49 = (void *)v32;
  BOOL v34 = (v32 | v33) != 0;
  objc_super v35 = DALoggingwithCategory();
  os_log_type_t v36 = _CPLog_to_os_log_type[3];
  BOOL v37 = os_log_type_enabled(v35, v36);
  if (v34)
  {
    if (v37)
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v49;
      __int16 v59 = 2112;
      v60 = v48;
      _os_log_impl(&dword_0, v35, v36, "DAEASOAuthWebViewController error retrieving an OAuth identity. Failed with error %@, error_description %@", location, 0x16u);
    }
  }
  else
  {
    if (v37)
    {
      long long v38 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
      long long v39 = [v38 state];
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v6;
      __int16 v59 = 2112;
      v60 = v50;
      __int16 v61 = 2112;
      v62 = v39;
      _os_log_impl(&dword_0, v35, v36, "DAEASOAuthWebViewController failed with authCode %@, state %@ [self.oauthFlowController state] %@", location, 0x20u);
    }
    v48 = 0;
    v49 = 0;
  }
LABEL_29:
  objc_super v40 = DALoggingwithCategory();
  os_log_type_t v41 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v40, v41))
  {
    v42 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = self;
    __int16 v59 = 2112;
    v60 = v42;
    _os_log_impl(&dword_0, v40, v41, "Exchange OAuth Setup: Un-Registering %@ for RedirectURL %@.", location, 0x16u);
  }
  v43 = +[PSOAuthAccountRedirectURLController sharedInstance];
  v44 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  [v43 unRegisterOAuthClientForRedirectURL:v44];
}

- (void)_reAuthenticationButtonTapped
{
  id v4 = DALoggingwithCategory();
  os_log_type_t type = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v4, type))
  {
    id v5 = [(ASSettingsDataclassConfigurationViewController *)self account];
    uint64_t v6 = [v5 accountType];
    id v2 = [v6 identifier];
    *(_DWORD *)buf = 138412290;
    unint64_t v91 = (unint64_t)v2;
    _os_log_impl(&dword_0, v4, type, "_reAuthenticationButtonTapped for account type: %@.", buf, 0xCu);
  }
  uint64_t v7 = [(ASSettingsDataclassConfigurationViewController *)self account];
  uint64_t v8 = kESExchangeOAuthSupportedKey;
  id v9 = [v7 objectForKeyedSubscript:kESExchangeOAuthSupportedKey];
  if (v9
    || ([(ASSettingsDataclassConfigurationViewController *)self account],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 migrationStatus] == (char *)&dword_0 + 1))
  {
    id v10 = [(ASSettingsDataclassConfigurationViewController *)self account];
    BOOL v11 = [v10 accountType];
    v12 = [v11 identifier];
    unsigned __int8 v13 = [v12 isEqualToString:ACAccountTypeIdentifierHotmail];

    if (v9) {
    else
    }

    if ((v13 & 1) == 0)
    {
      id v14 = [(ASSettingsDataclassConfigurationViewController *)self account];
      v77 = [v14 objectForKeyedSubscript:kESExchangeOAuthURI];

      BOOL v15 = [(ASSettingsDataclassConfigurationViewController *)self account];
      v76 = [v15 objectForKeyedSubscript:kESEASEndPointFQDN];

      uint64_t v16 = [(ASSettingsDataclassConfigurationViewController *)self account];
      v75 = [v16 objectForKeyedSubscript:kESAccountDiscoveredHost];

      BOOL v17 = [(ASSettingsDataclassConfigurationViewController *)self account];
      v78 = [v17 objectForKeyedSubscript:kESExchangeOAuthOnPremKey];

      if (v78 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v18 = [v78 BOOLValue];
      }
      else {
        id v18 = 0;
      }
      uint64_t v19 = [(ASSettingsDataclassConfigurationViewController *)self account];
      BOOL v20 = [v19 migrationStatus] == (char *)&dword_0 + 1;

      if (v20)
      {
        uint64_t v21 = DALoggingwithCategory();
        if (os_log_type_enabled(v21, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, type, "_reAuthenticationButtonTapped for migrating an Exchange account from Basic to OAuth", buf, 2u);
        }
      }
      if (v77 && v76 && v75)
      {
        id v22 = v77;
        v74 = v22;
        if ((v18 & 1) != 0
          || (+[DAEASOAuthFlowController upgradeAuthorizationEndpoint:v22], v74 = objc_claimAutoreleasedReturnValue(), v22, v74))
        {
          id v23 = objc_alloc((Class)DAExchangeOAuthFlowController);
          id v24 = [(ASSettingsDataclassConfigurationViewController *)self account];
          unsigned int v25 = [v24 username];
          id v26 = [(ASSettingsDataclassConfigurationViewController *)self account];
          id v27 = [v26 identifier];
          if (v18)
          {
            long long v28 = @"{\"access_token\":{\"xms_cc\":{\"values\":[\"cp1\"]}}}";
          }
          else
          {
            id v2 = [(ASSettingsDataclassConfigurationViewController *)self account];
            long long v28 = [v2 objectForKeyedSubscript:kESExchangePendingClaimsChallenge];
          }
          id v40 = [v23 initWithAuthURI:v74 easEndPoint:v76 username:v25 accountId:v27 claims:v28 isOnPrem:v18];
          [(ASSettingsDataclassConfigurationViewController *)self setOauthFlowController:v40];

          if ((v18 & 1) == 0)
          {
          }
          os_log_type_t v41 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
          v42 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
          [v41 setRedirectURI:v42];

          v43 = [(ASSettingsDataclassConfigurationViewController *)self oauthFlowController];
          v44 = [(ASSettingsDataclassConfigurationViewController *)self account];
          SEL v45 = [v44 username];
          if (v18) {
            [v43 onPremAuthURLForUsername:v45 originalAuthURL:v22 resource:v76];
          }
          else {
          id v46 = [v43 authURLForUsername:v45 originalAuthURL:v74];
          }

          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472;
          v89[2] = sub_1C4B0;
          v89[3] = &unk_30A40;
          v89[4] = self;
          v47 = objc_retainBlock(v89);
          v48 = +[DAOAuthSafariViewController authenticationSessionWithURL:v46 handler:v47];
          [(ASSettingsDataclassConfigurationViewController *)self setWebAuthenticationSession:v48];

          v49 = [(ASSettingsDataclassConfigurationViewController *)self webAuthenticationSession];
          LODWORD(v48) = v49 == 0;

          if (v48)
          {
            v64 = DALoggingwithCategory();
            os_log_type_t v65 = _CPLog_to_os_log_type[3];
            if (os_log_type_enabled(v64, v65))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v91 = (unint64_t)v74;
              _os_log_impl(&dword_0, v64, v65, "_reAuthenticationButtonTapped unable to initialize ASWebAuthenticationSession with authorization URL (%@).", buf, 0xCu);
            }

            v66 = +[NSBundle bundleForClass:objc_opt_class()];
            v67 = [v66 localizedStringForKey:@"EXCHANGE_ACCOUNT" value:&stru_30C50 table:@"ASAccountSetup"];
            v68 = +[NSBundle bundleForClass:objc_opt_class()];
            v69 = [v68 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_30C50 table:@"ASAccountSetup"];
            [(ASSettingsDataclassConfigurationViewController *)self _presentAlertWithTitle:v67 message:v69];
          }
          else
          {
            v50 = [(ASSettingsDataclassConfigurationViewController *)self webAuthenticationSession];
            [v50 setPresentationContextProvider:self];

            objc_initWeak(&location, self);
            v51 = +[UIApplication sharedApplication];
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_1C700;
            v86[3] = &unk_309F0;
            objc_copyWeak(&v87, &location);
            -[ASSettingsDataclassConfigurationViewController setBackgroundTaskID:](self, "setBackgroundTaskID:", [v51 beginBackgroundTaskWithName:@"ASSettingsDataclassConfigurationViewController" expirationHandler:v86]);

            v52 = DALoggingwithCategory();
            os_log_type_t v53 = _CPLog_to_os_log_type[7];
            if (os_log_type_enabled(v52, v53))
            {
              unint64_t v54 = [(ASSettingsDataclassConfigurationViewController *)self backgroundTaskID];
              *(_DWORD *)buf = 134217984;
              unint64_t v91 = v54;
              _os_log_impl(&dword_0, v52, v53, "Begin background task %lu", buf, 0xCu);
            }

            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472;
            v84[2] = sub_1C810;
            v84[3] = &unk_30A18;
            objc_copyWeak(&v85, &location);
            [(ASSettingsDataclassConfigurationViewController *)self setRedirectHandlerBlock:v84];
            long long v55 = DALoggingwithCategory();
            if (os_log_type_enabled(v55, type))
            {
              long long v56 = [(ASSettingsDataclassConfigurationViewController *)self redirectHandlerBlock];
              id v57 = objc_retainBlock(v56);
              v58 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
              *(_DWORD *)buf = 134218242;
              unint64_t v91 = (unint64_t)v57;
              __int16 v92 = 2112;
              v93 = v58;
              _os_log_impl(&dword_0, v55, type, "Exchange OAuth Setup: Registering Block %p client for RedirectURL %@.", buf, 0x16u);
            }
            __int16 v59 = +[PSOAuthAccountRedirectURLController sharedInstance];
            v60 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
            __int16 v61 = [(ASSettingsDataclassConfigurationViewController *)self redirectHandlerBlock];
            [v59 registerOAuthClientForRedirectURL:v60 redirectHandler:v61];

            v62 = DALoggingwithCategory();
            if (os_log_type_enabled(v62, type))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v62, type, "Exchange OAuth Setup: Presenting SafariOAuth page for password re-entry.", buf, 2u);
            }

            v63 = [(ASSettingsDataclassConfigurationViewController *)self webAuthenticationSession];
            [v63 start];

            objc_destroyWeak(&v85);
            objc_destroyWeak(&v87);
            objc_destroyWeak(&location);
          }
        }
        else
        {
          v70 = DALoggingwithCategory();
          os_log_type_t v71 = _CPLog_to_os_log_type[3];
          if (os_log_type_enabled(v70, v71))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v91 = 0;
            _os_log_impl(&dword_0, v70, v71, "_reAuthenticationButtonTapped unable to continue without a valid authorization URL (%@).", buf, 0xCu);
          }

          v74 = +[NSBundle bundleForClass:objc_opt_class()];
          id v46 = [v74 localizedStringForKey:@"EXCHANGE_ACCOUNT" value:&stru_30C50 table:@"ASAccountSetup"];
          v72 = +[NSBundle bundleForClass:objc_opt_class()];
          v73 = [v72 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_30C50 table:@"ASAccountSetup"];
          [(ASSettingsDataclassConfigurationViewController *)self _presentAlertWithTitle:v46 message:v73];
        }
      }
      else
      {
        [(ASSettingsDataclassConfigurationViewController *)self _disableReAuthenticationButton];
        [(ASSettingsDataclassConfigurationViewController *)self _autodiscoverOAuthAccountIsOnPrem:v18];
      }

      return;
    }
  }
  else
  {
  }
  long long v29 = [(ASSettingsDataclassConfigurationViewController *)self account];
  long long v30 = [v29 objectForKeyedSubscript:v8];

  if (v30)
  {
    long long v31 = DALoggingwithCategory();
    os_log_type_t v32 = _CPLog_to_os_log_type[4];
    if (os_log_type_enabled(v31, v32))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v31, v32, "rdar://84524914: Found kDAExchangeOAuthSupportedKey incorrectly set for a Hotmail account. See rdar://74329281 for details.", buf, 2u);
    }
  }
  objc_initWeak((id *)buf, self);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_1C93C;
  v82[3] = &unk_30B38;
  objc_copyWeak(&v83, (id *)buf);
  unint64_t v33 = objc_retainBlock(v82);
  id v34 = objc_alloc((Class)DAEASOAuthWebViewController);
  objc_super v35 = [(ASSettingsDataclassConfigurationViewController *)self account];
  os_log_type_t v36 = [(ASSettingsDataclassConfigurationViewController *)self accountStore];
  id v37 = [v34 initWithAccount:v35 accountStore:v36 presentationBlock:v33];
  long long v38 = (id *)((char *)&self->_numberOfRetriedFetchingOutOfOfficeCounter + 1);
  id v39 = *v38;
  *long long v38 = v37;

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1C9A0;
  v80[3] = &unk_30AE0;
  objc_copyWeak(&v81, (id *)buf);
  [*v38 setCompletion:v80];
  objc_destroyWeak(&v81);

  objc_destroyWeak(&v83);
  objc_destroyWeak((id *)buf);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v8 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"OK" value:&stru_30C50 table:@"ASAccountSetup"];
  uint64_t v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:&stru_30B78];

  [v8 addAction:v7];
  [(ASSettingsDataclassConfigurationViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_autodiscoverOAuthAccountIsOnPrem:(BOOL)a3
{
  id v5 = objc_opt_new();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1CC54;
  v6[3] = &unk_30BC8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 sendRequestForRedirectWithCompletionHandler:v6];
}

- (BOOL)_isNetworkOfflineError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSURLErrorDomain];

  if (!v5)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  id v6 = [v3 code];
  BOOL v7 = 1;
  if (v6 != (id)-1009 && v6 != (id)-1000)
  {
    id v8 = DALoggingwithCategory();
    os_log_type_t v9 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = [v3 domain];
      int v12 = 138543618;
      unsigned __int8 v13 = v10;
      __int16 v14 = 2048;
      id v15 = [v3 code];
      _os_log_impl(&dword_0, v8, v9, "AutoDV2 Discovery Failed With Fatal Network Error %{public}@:%ld ", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASSettingsDataclassConfigurationViewController;
  [(ASSettingsDataclassConfigurationViewController *)&v11 handleURL:v4];
  unsigned int v5 = DALoggingwithCategory();
  os_log_type_t v6 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_0, v5, v6, "Exchange OAuth Setup: Received an action: %@ to present SafariViewController for Re-Entering password.", buf, 0xCu);
  }

  BOOL v7 = [v4 objectForKeyedSubscript:@"easOAuthAction"];
  unsigned int v8 = [v7 isEqualToString:@"showAuthSheet"];

  os_log_type_t v9 = DALoggingwithCategory();
  BOOL v10 = os_log_type_enabled(v9, v6);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, v6, "Exchange OAuth Setup: ActionKey indicates that we should AutoLaunch the SafariOAuth page.", buf, 2u);
    }

    [(ASSettingsDataclassConfigurationViewController *)self _reAuthenticationButtonTapped];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, v6, "Exchange OAuth Setup: ActionKey does not indicate that we should AutoLaunch the SafariOAuth page.", buf, 2u);
    }
  }
}

- (id)otherSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v5 = [v4 localizedStringForKey:@"MAIL_PAST_DAYS_STRING" value:&stru_30C50 table:@"ASAccountSetup"];
  os_log_type_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setAccountIntegerProperty:withSpecifier:" get:"accountIntegerPropertyWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  BOOL v7 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  unsigned int v8 = [v7 mailNumberOfPastDaysToSyncUpperLimit];

  if (v8)
  {
    os_log_type_t v9 = +[NSMutableArray array];
    BOOL v10 = +[NSMutableArray array];
    objc_super v11 = &off_32628;
    if ((int)v8 >= 1)
    {
      [v9 addObject:&off_32628];
      int v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"1_DAY" value:&stru_30C50 table:@"ASAccountSetup"];
      [v10 addObject:v13];

      if (v8 >= 3)
      {
        objc_super v11 = &off_325F8;
        [v9 addObject:&off_325F8];
        __int16 v14 = +[NSBundle bundleForClass:objc_opt_class()];
        id v15 = [v14 localizedStringForKey:@"3_DAYS" value:&stru_30C50 table:@"ASAccountSetup"];
        [v10 addObject:v15];

        if (v8 >= 7)
        {
          [v9 addObject:&off_32640];
          uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
          BOOL v17 = [v16 localizedStringForKey:@"1_WEEK" value:&stru_30C50 table:@"ASAccountSetup"];
          [v10 addObject:v17];

          if (v8 >= 0xE)
          {
            [v9 addObject:&off_32658];
            id v18 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v19 = [v18 localizedStringForKey:@"2_WEEKS" value:&stru_30C50 table:@"ASAccountSetup"];
            [v10 addObject:v19];

            if (v8 >= 0x1F)
            {
              [v9 addObject:&off_32670];
              BOOL v20 = +[NSBundle bundleForClass:objc_opt_class()];
              uint64_t v21 = [v20 localizedStringForKey:@"1_MONTH" value:&stru_30C50 table:@"ASAccountSetup"];
              [v10 addObject:v21];
            }
          }
        }
      }
    }
  }
  else
  {
    v68 = +[NSBundle bundleForClass:objc_opt_class()];
    v66 = [v68 localizedStringForKey:@"NO_LIMIT" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[0] = v66;
    v64 = +[NSBundle bundleForClass:objc_opt_class()];
    v63 = [v64 localizedStringForKey:@"1_DAY" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[1] = v63;
    +[NSBundle bundleForClass:objc_opt_class()];
    v62 = v70 = v3;
    id v22 = [v62 localizedStringForKey:@"3_DAYS" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[2] = v22;
    id v23 = +[NSBundle bundleForClass:objc_opt_class()];
    id v24 = [v23 localizedStringForKey:@"1_WEEK" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[3] = v24;
    unsigned int v25 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v25 localizedStringForKey:@"2_WEEKS" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[4] = v26;
    id v27 = v6;
    long long v28 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v29 = [v28 localizedStringForKey:@"1_MONTH" value:&stru_30C50 table:@"ASAccountSetup"];
    v76[5] = v29;
    uint64_t v30 = +[NSArray arrayWithObjects:v76 count:6];

    BOOL v10 = (void *)v30;
    os_log_type_t v6 = v27;

    id v3 = v70;
    os_log_type_t v9 = &off_32860;
    objc_super v11 = &off_325F8;
  }
  [v6 setValues:v9 titles:v10];
  [v6 setProperty:v11 forKey:PSDefaultValueKey];
  [v6 setProperty:@"MAIL_PAST_DAYS" forKey:PSIDKey];
  if (-[ASSettingsDataclassConfigurationViewController isAccountModificationDisabled](self, "isAccountModificationDisabled"))[v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey]; {
  [v3 addObject:v6];
  }
  if (([(id)objc_opt_class() isHotmailAccount] & 1) == 0)
  {
    long long v31 = [(ASSettingsDataclassConfigurationViewController *)self isOofSupported];

    if (v31)
    {
      os_log_type_t v32 = [(ASSettingsDataclassConfigurationViewController *)self isOofSupported];
      unsigned __int8 v33 = [v32 BOOLValue];

      if ((v33 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
      id v34 = +[ESDConnection sharedConnection];
      objc_super v35 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
      os_log_type_t v36 = [v35 accountID];
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_1DC5C;
      v73[3] = &unk_30BF0;
      v73[4] = self;
      [v34 isOofSettingsSupportedForAccountWithID:v36 completionBlock:v73];
    }
    v69 = v6;
    id v37 = [(ASSettingsDataclassConfigurationViewController *)self isOofSupported];

    if (v37) {
      [(ASSettingsDataclassConfigurationViewController *)self checkAndFetchOutOfOfficeState];
    }
    long long v38 = +[NSBundle bundleForClass:objc_opt_class()];
    id v39 = [v38 localizedStringForKey:@"OOF_AUTO_REPLY" value:&stru_30C50 table:@"ASAccountSetup"];
    id v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:"saveOutOfOfficeData:" get:"outOfOfficeEnabled:" detail:objc_opt_class() cell:2 edit:0];
    [(ASSettingsDataclassConfigurationViewController *)self setOutOfOfficeSpecifier:v40];

    os_log_type_t v41 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    [v41 setProperty:v43 forKey:PSSetupCustomClassKey];

    v44 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];

    if (v44)
    {
      os_log_type_t v65 = v9;
      v67 = v10;
      os_log_type_t v71 = v3;
      SEL v45 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
      v75[0] = @"outOfOfficeONState";
      v75[1] = @"outOfOfficeOFFState";
      v75[2] = @"outOfOfficeLoadingState";
      id v46 = +[NSArray arrayWithObjects:v75 count:3];
      v47 = +[NSBundle bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:@"OOF_ON_STATE" value:&stru_30C50 table:@"ASAccountSetup"];
      v74[0] = v48;
      v49 = +[NSBundle bundleForClass:objc_opt_class()];
      v50 = [v49 localizedStringForKey:@"OOF_OFF_STATE" value:&stru_30C50 table:@"ASAccountSetup"];
      v74[1] = v50;
      v51 = +[NSBundle bundleForClass:objc_opt_class()];
      v52 = [v51 localizedStringForKey:@"OOF_LOADING_STATE" value:&stru_30C50 table:@"ASAccountSetup"];
      v74[2] = v52;
      os_log_type_t v53 = +[NSArray arrayWithObjects:v74 count:3];
      [v45 setValues:v46 titles:v53];

      unint64_t v54 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
      [v54 setIdentifier:@"kPSOofSpecifierID"];

      if ([(ASSettingsDataclassConfigurationViewController *)self isAccountModificationDisabled])
      {
        long long v55 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
        [v55 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      }
      long long v56 = +[PSSpecifier emptyGroupSpecifier];
      id v3 = v71;
      [v71 addObject:v56];

      id v57 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
      [v71 addObject:v57];

      BOOL v10 = v67;
      os_log_type_t v6 = v69;
      os_log_type_t v9 = v65;
    }
  }
LABEL_22:
  v58 = +[ESDiagnosticsPSController linkSpecifier];

  if (v58)
  {
    __int16 v59 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v59];

    [v3 addObject:v58];
  }
  v72.receiver = self;
  v72.super_class = (Class)ASSettingsDataclassConfigurationViewController;
  v60 = [(ESSettingsDataclassConfigurationViewController *)&v72 otherSpecifiers];
  [v3 addObjectsFromArray:v60];

  return v3;
}

- (void)updateOutOfOfficeSpecifier
{
  id v3 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];

  if (v3)
  {
    id v4 = [(ASSettingsDataclassConfigurationViewController *)self specifierForID:@"kPSOofSpecifierID"];
    unsigned int v5 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];
    -[ASSettingsDataclassConfigurationViewController setOutOfOfficeEnabled:](self, "setOutOfOfficeEnabled:", [v5 oofState] != 0);

    os_log_type_t v6 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
    CFStringRef v29 = @"kPSOofServerData";
    BOOL v7 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];
    uint64_t v30 = v7;
    unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v6 setUserInfo:v8];

    if (([(ASSettingsDataclassConfigurationViewController *)self isAccountModificationDisabled] & 1) == 0)
    {
      os_log_type_t v9 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
      [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    }
    BOOL v10 = DALoggingwithCategory();
    os_log_type_t v11 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];
      id v13 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
      __int16 v14 = [v13 accountID];
      *(_DWORD *)buf = 138412546;
      id v26 = v12;
      __int16 v27 = 2112;
      long long v28 = v14;
      _os_log_impl(&dword_0, v10, v11, "Got out of office data back %@ for account %@", buf, 0x16u);
    }
    if (v4)
    {
      id v15 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];

      if (v15)
      {
        id v24 = v4;
        uint64_t v16 = +[NSArray arrayWithObjects:&v24 count:1];
        BOOL v17 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
        id v23 = v17;
        id v18 = +[NSArray arrayWithObjects:&v23 count:1];
        [(ASSettingsDataclassConfigurationViewController *)self replaceContiguousSpecifiers:v16 withSpecifiers:v18 animated:0];

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v19 = DALoggingwithCategory();
      os_log_type_t v20 = _CPLog_to_os_log_type[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, v20, "outOfOfficeSpecifier is nil, why?", buf, 2u);
      }
    }
    uint64_t v21 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];

    if (v21)
    {
LABEL_16:

      return;
    }
    uint64_t v16 = DALoggingwithCategory();
    uint64_t v22 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v16, (os_log_type_t)_CPLog_to_os_log_type[3]))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, (os_log_type_t)v22, "self.outOfOfficeSpecifier is nil, why?", buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
}

- (void)removeOutOfOfficeSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"OOF_AUTO_REPLY" value:&stru_30C50 table:@"ASAccountSetup"];
  [(ASSettingsDataclassConfigurationViewController *)self removeSpecifierID:v4 animated:1];

  [(ASSettingsDataclassConfigurationViewController *)self reloadSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASSettingsDataclassConfigurationViewController;
  [(ESSettingsDataclassConfigurationViewController *)&v9 viewWillAppear:a3];
  if (([(id)objc_opt_class() isHotmailAccount] & 1) == 0)
  {
    id v4 = [(ASSettingsDataclassConfigurationViewController *)self isOofSupported];
    unsigned int v5 = [v4 BOOLValue];

    if (v5)
    {
      os_log_type_t v6 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];

      if (!v6)
      {
        BOOL v7 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
        [v7 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];

        unsigned int v8 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
        [(ASSettingsDataclassConfigurationViewController *)self reloadSpecifier:v8];
      }
    }
  }
}

- (void)OAuthAccount:(id)a3 authorizationURI:(id)a4 error:(id)a5
{
  BOOL v7 = (__CFString *)a4;
  id v8 = a5;
  [(ASSettingsDataclassConfigurationViewController *)self _enableReAuthenticationButton];
  if (!v7 || v8)
  {
    if (v8
      && [(ASSettingsDataclassConfigurationViewController *)self _isNetworkOfflineError:v8])
    {
      os_log_type_t v11 = DALoggingwithCategory();
      os_log_type_t v12 = _CPLog_to_os_log_type[6];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_0, v11, v12, "Received an Internet Offline Error duing AutoDV2. Presenting Internet Offline Alert", (uint8_t *)&v16, 2u);
      }

      +[DAEASOAuthWebViewController presentInternetOfflineError];
    }
    else
    {
      id v13 = DALoggingwithCategory();
      os_log_type_t v14 = _CPLog_to_os_log_type[6];
      if (os_log_type_enabled(v13, v14))
      {
        CFStringRef v15 = @"Not Valid";
        if (v7) {
          CFStringRef v15 = v7;
        }
        int v16 = 138543618;
        CFStringRef v17 = v15;
        __int16 v18 = 2114;
        id v19 = v8;
        _os_log_impl(&dword_0, v13, v14, "OAuthURI %{public}@ : Error %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    [(ASSettingsDataclassConfigurationViewController *)self stopValidationWithPrompt:0 showButtons:1];
  }
  else
  {
    objc_super v9 = DALoggingwithCategory();
    os_log_type_t v10 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v9, v10))
    {
      int v16 = 138543362;
      CFStringRef v17 = v7;
      _os_log_impl(&dword_0, v9, v10, "AutoDiscover succeeded with OAuthURI : %{public}@", (uint8_t *)&v16, 0xCu);
    }

    [(ASSettingsDataclassConfigurationViewController *)self _reAuthenticationButtonTapped];
  }
}

- (void)oofRequestInfo:(id)a3 finishedWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = self;
  objc_sync_enter(v11);
  [(ASSettingsDataclassConfigurationViewController *)v11 setIsFetchingOutOfOfficeState:0];
  objc_sync_exit(v11);

  if (!v10)
  {
    if (!v9) {
      goto LABEL_11;
    }
    [(ASSettingsDataclassConfigurationViewController *)v11 setServerOutOfOfficeInformation:v9];
    [(ASSettingsDataclassConfigurationViewController *)v11 performSelectorOnMainThread:"updateOutOfOfficeSpecifier" withObject:0 waitUntilDone:1];
    os_log_type_t v12 = DALoggingwithCategory();
    os_log_type_t v13 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = [(ESSettingsDataclassConfigurationViewController *)v11 daAccount];
      CFStringRef v15 = [v14 accountID];
      int v19 = 138412546;
      os_log_type_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_0, v12, v13, "Server response for Out of Office Data for account %@ with data %@", (uint8_t *)&v19, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([(ASSettingsDataclassConfigurationViewController *)v11 numberOfRetriedFetchingOutOfOfficeCounter] > 4)
  {
    os_log_type_t v12 = DALoggingwithCategory();
    os_log_type_t v16 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v12, v16))
    {
      CFStringRef v17 = [(ESSettingsDataclassConfigurationViewController *)v11 daAccount];
      __int16 v18 = [v17 accountID];
      int v19 = 138412546;
      os_log_type_t v20 = v18;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_0, v12, v16, "Failed to get Out Of Office data for account %@: %@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_10;
  }
  [(ASSettingsDataclassConfigurationViewController *)v11 setNumberOfRetriedFetchingOutOfOfficeCounter:(char *)[(ASSettingsDataclassConfigurationViewController *)v11 numberOfRetriedFetchingOutOfOfficeCounter]+ 1];
  [(ASSettingsDataclassConfigurationViewController *)v11 checkAndFetchOutOfOfficeState];
LABEL_11:
}

- (void)checkAndFetchOutOfOfficeState
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned __int8 v3 = [(ASSettingsDataclassConfigurationViewController *)v2 isFetchingOutOfOfficeState];
  [(ASSettingsDataclassConfigurationViewController *)v2 setIsFetchingOutOfOfficeState:1];
  objc_sync_exit(v2);

  if ((v3 & 1) == 0)
  {
    [(ASSettingsDataclassConfigurationViewController *)v2 performSelectorOnMainThread:"fetchingOutOfOfficeState" withObject:0 waitUntilDone:0];
  }
}

- (void)fetchingOutOfOfficeState
{
  id v3 = objc_alloc_init((Class)DAOofSettingsInfo);
  [(ASSettingsDataclassConfigurationViewController *)self setDASettingsInfo:v3];

  id v4 = [(ASSettingsDataclassConfigurationViewController *)self DASettingsInfo];
  [v4 setConsumer:self];

  unsigned int v5 = +[ESDConnection sharedConnection];
  os_log_type_t v6 = [(ASSettingsDataclassConfigurationViewController *)self DASettingsInfo];
  BOOL v7 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
  id v8 = [v7 accountID];
  [v5 retrieveOofSettingsRequest:v6 forAccountWithID:v8];

  id v9 = DALoggingwithCategory();
  os_log_type_t v10 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    os_log_type_t v12 = [v11 accountID];
    int v13 = 138412290;
    os_log_type_t v14 = v12;
    _os_log_impl(&dword_0, v9, v10, "Fetching Out of Office Data for account %@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)saveOutOfOfficeData:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() isHotmailAccount] & 1) == 0)
  {
    unsigned int v5 = +[ESDConnection sharedConnection];
    os_log_type_t v6 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    BOOL v7 = [v6 accountID];
    [v5 updateOofSettingsRequest:v4 forAccountWithID:v7];

    -[ASSettingsDataclassConfigurationViewController setOutOfOfficeEnabled:](self, "setOutOfOfficeEnabled:", [v4 oofState] != 0);
    [(ASSettingsDataclassConfigurationViewController *)self setServerOutOfOfficeInformation:0];
    id v8 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
    [v8 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];

    id v9 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeSpecifier];
    [(ASSettingsDataclassConfigurationViewController *)self reloadSpecifier:v9];

    [(ASSettingsDataclassConfigurationViewController *)self checkAndFetchOutOfOfficeState];
  }
  os_log_type_t v10 = DALoggingwithCategory();
  os_log_type_t v11 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    int v13 = [v12 accountID];
    int v14 = 138412546;
    CFStringRef v15 = v13;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_0, v10, v11, "Saving new out of office Data %@ for account %@", (uint8_t *)&v14, 0x16u);
  }
}

- (id)numFoldersToPushString:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 folderIdsThatExternalClientsCareAbout];
  id v5 = [v4 count];

  os_log_type_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v5)
  {
    BOOL v7 = [v6 localizedStringForKey:@"INBOX_PLUS_COUNT_STRING" value:&stru_30C50 table:@"ASAccountSetup"];
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"INBOX_STRING" value:&stru_30C50 table:@"ASAccountSetup"];
    os_log_type_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9, v5);
  }
  else
  {
    os_log_type_t v10 = [v6 localizedStringForKey:@"INBOX_STRING" value:&stru_30C50 table:@"ASAccountSetup"];
  }

  return v10;
}

- (id)accountIntegerPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"MAIL_PAST_DAYS"])
  {
    id v5 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    id v6 = [v5 mailNumberOfPastDaysToSync];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = +[NSNumber numberWithInt:v6];

  return v7;
}

- (void)setAccountIntegerProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 intValue];
  id v13 = [v6 identifier];

  if ([v13 isEqualToString:@"MAIL_PAST_DAYS"])
  {
    id v8 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
    unsigned int v9 = [v8 mailNumberOfPastDaysToSync];
    [v8 setMailNumberOfPastDaysToSync:v7];

    if (v7 != v9
      && ([(ASSettingsDataclassConfigurationViewController *)self isFirstTimeSetup] & 1) == 0)
    {
      os_log_type_t v10 = [(ASSettingsDataclassConfigurationViewController *)self accountOperationsHelper];
      os_log_type_t v11 = [(ESSettingsDataclassConfigurationViewController *)self daAccount];
      os_log_type_t v12 = [v11 backingAccountInfo];
      [v10 saveAccount:v12 requireVerification:0];
    }
  }
}

- (id)outOfOfficeEnabled:(id)a3
{
  id v4 = [(ASSettingsDataclassConfigurationViewController *)self serverOutOfOfficeInformation];

  if (v4)
  {
    unsigned int v5 = [(ASSettingsDataclassConfigurationViewController *)self outOfOfficeEnabled];
    id v6 = @"outOfOfficeOFFState";
    if (v5) {
      id v6 = @"outOfOfficeONState";
    }
    id v7 = v6;
  }
  else
  {
    id v7 = @"outOfOfficeLoadingState";
  }

  return v7;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = [(ASSettingsDataclassConfigurationViewController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (UIView)originalAccessoryView
{
  return *(UIView **)&self->_isFetchingOutOfOfficeState;
}

- (void)setOriginalAccessoryView:(id)a3
{
}

- (PSSpecifier)outOfOfficeSpecifier
{
  return *(PSSpecifier **)((char *)&self->_originalAccessoryView + 1);
}

- (void)setOutOfOfficeSpecifier:(id)a3
{
}

- (PSSpecifier)reAuthenticationButtonSpecifier
{
  return *(PSSpecifier **)((char *)&self->_outOfOfficeSpecifier + 1);
}

- (void)setReAuthenticationButtonSpecifier:(id)a3
{
}

- (NSMutableArray)reauthSpecifiers
{
  return *(NSMutableArray **)((char *)&self->_reAuthenticationButtonSpecifier + 1);
}

- (void)setReauthSpecifiers:(id)a3
{
}

- (DAOofSettingsInfo)DASettingsInfo
{
  return *(DAOofSettingsInfo **)((char *)&self->_reauthSpecifiers + 1);
}

- (void)setDASettingsInfo:(id)a3
{
}

- (DAOofParams)serverOutOfOfficeInformation
{
  return *(DAOofSettingsInfo **)((char *)&self->_DASettingsInfo + 1);
}

- (void)setServerOutOfOfficeInformation:(id)a3
{
}

- (BOOL)outOfOfficeEnabled
{
  return *(&self->super._haveRegisteredForAccountsChanged + 1);
}

- (void)setOutOfOfficeEnabled:(BOOL)a3
{
  *(&self->super._haveRegisteredForAccountsChanged + 1) = a3;
}

- (BOOL)isFetchingOutOfOfficeState
{
  return *(&self->super._haveRegisteredForAccountsChanged + 2);
}

- (void)setIsFetchingOutOfOfficeState:(BOOL)a3
{
  *(&self->super._haveRegisteredForAccountsChanged + 2) = a3;
}

- (unint64_t)numberOfRetriedFetchingOutOfOfficeCounter
{
  return *(unint64_t *)((char *)&self->_serverOutOfOfficeInformation + 1);
}

- (void)setNumberOfRetriedFetchingOutOfOfficeCounter:(unint64_t)a3
{
  *(DAOofParams **)((char *)&self->_serverOutOfOfficeInformation + 1) = (DAOofParams *)a3;
}

- (DAEASOAuthWebViewController)webAuthController
{
  return *(DAEASOAuthWebViewController **)((char *)&self->_numberOfRetriedFetchingOutOfOfficeCounter + 1);
}

- (void)setWebAuthController:(id)a3
{
}

- (id)completion
{
  return *(DAEASOAuthWebViewController **)((char *)&self->_webAuthController + 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSNumber)isOofSupported
{
  return *(NSNumber **)((char *)&self->_completion + 1);
}

- (void)setIsOofSupported:(id)a3
{
}

- (DAExchangeOAuthFlowController)oauthFlowController
{
  return *(DAExchangeOAuthFlowController **)((char *)&self->_isOofSupported + 1);
}

- (void)setOauthFlowController:(id)a3
{
}

- (id)redirectHandlerBlock
{
  return *(DAExchangeOAuthFlowController **)((char *)&self->_oauthFlowController + 1);
}

- (void)setRedirectHandlerBlock:(id)a3
{
}

- (ASWebAuthenticationSession)webAuthenticationSession
{
  return *(ASWebAuthenticationSession **)((char *)&self->_redirectHandlerBlock + 1);
}

- (void)setWebAuthenticationSession:(id)a3
{
}

- (NSURLSession)autoDV2RedirectSession
{
  return *(NSURLSession **)((char *)&self->_webAuthenticationSession + 1);
}

- (void)setAutoDV2RedirectSession:(id)a3
{
}

- (unint64_t)backgroundTaskID
{
  return *(unint64_t *)((char *)&self->_autoDV2RedirectSession + 1);
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  *(NSURLSession **)((char *)&self->_autoDV2RedirectSession + 1) = (NSURLSession *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_webAuthenticationSession + 1), 0);
  objc_storeStrong((id *)((char *)&self->_redirectHandlerBlock + 1), 0);
  objc_storeStrong((id *)((char *)&self->_oauthFlowController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_isOofSupported + 1), 0);
  objc_storeStrong((id *)((char *)&self->_completion + 1), 0);
  objc_storeStrong((id *)((char *)&self->_webAuthController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_numberOfRetriedFetchingOutOfOfficeCounter + 1), 0);
  objc_storeStrong((id *)((char *)&self->_DASettingsInfo + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reauthSpecifiers + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reAuthenticationButtonSpecifier + 1), 0);
  objc_storeStrong((id *)((char *)&self->_outOfOfficeSpecifier + 1), 0);
  objc_storeStrong((id *)((char *)&self->_originalAccessoryView + 1), 0);

  objc_storeStrong((id *)&self->_isFetchingOutOfOfficeState, 0);
}

@end