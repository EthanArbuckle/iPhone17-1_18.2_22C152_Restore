@interface ASSettingsAccountsUIController
+ (BOOL)isHotmailAccount;
+ (id)usernameFromAccessToken:(id)a3;
- (ASExchangeIdView)exchangeIdView;
- (ASWebAuthenticationSession)webAuthenticationSession;
- (BOOL)_isNetworkOfflineError:(id)a3;
- (BOOL)_isSSLError:(id)a3;
- (BOOL)_storeHasDuplicateForUsername:(id)a3;
- (BOOL)autodiscoverAccount;
- (BOOL)haveEnoughValues;
- (BOOL)remotedManaged;
- (BOOL)transitionsAfterInitialSetup;
- (BOOL)validateAccount;
- (BOOL)verifyAccountPassword;
- (DAExchangeOAuthFlowController)oauthFlowController;
- (NSURLSession)autoDV2RedirectSession;
- (id)_defaultAccountDescription;
- (id)_specifiersForCompletedAutodiscovery;
- (id)_specifiersForMinimalAutodiscoveryRemovingIDs:(id)a3;
- (id)_specifiersForOptionalServerAutodiscovery;
- (id)account;
- (id)accountFromSpecifier;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)accountSpecifiers;
- (id)localizedAccountSetupTitleString;
- (id)localizedAccountTitleString;
- (id)localizedConfirmSaveUnvalidatedAccountMessageString;
- (id)localizedValidationFailureTitleString;
- (id)newDefaultAccount;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (id)redirectHandlerBlock;
- (int64_t)autodiscoveryState;
- (unint64_t)backgroundTaskID;
- (unsigned)diagsVisibleValue;
- (void)OAuthAccount:(id)a3 authorizationURI:(id)a4 error:(id)a5;
- (void)_autodiscoverOAuthAccountAfterInitialRedirect;
- (void)_bringUpOAuthEndPointWithURL:(id)a3 isOnPrem:(BOOL)a4;
- (void)_fallBackToAutoDiscoverV1;
- (void)_reallyStartAutoDiscoverAccount;
- (void)_setViewsEnabled;
- (void)_showAlertWithTitle:(id)a3 body:(id)a4 completion:(id)a5;
- (void)_transitionToCompletedAutodiscovery;
- (void)_transitionToOptionalServerAutodiscovery;
- (void)_tryUpdatingCompositeValueWithId:(id)a3 fromValue:(id)a4 forKey:(id)a5;
- (void)_validateUniquenessAndAddAccount:(id)a3 username:(id)a4 token:(id)a5 refreshToken:(id)a6 completion:(id)a7;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)account:(id)a3 wasAutoDiscovered:(BOOL)a4 error:(id)a5;
- (void)dealloc;
- (void)doneButtonTapped:(id)a3;
- (void)handleRedirectURL:(id)a3;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAutoDV2RedirectSession:(id)a3;
- (void)setAutodiscoveryState:(int64_t)a3;
- (void)setBackgroundTaskID:(unint64_t)a3;
- (void)setDiagsVisibleValue:(unsigned int)a3;
- (void)setExchangeIdView:(id)a3;
- (void)setOauthFlowController:(id)a3;
- (void)setRedirectHandlerBlock:(id)a3;
- (void)setRemotedManaged:(BOOL)a3;
- (void)setWebAuthenticationSession:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASSettingsAccountsUIController

+ (BOOL)isHotmailAccount
{
  return 0;
}

- (id)account
{
  if (!self->super._account) {
    [(ASSettingsAccountsUIController *)self setAutodiscoveryState:4];
  }
  v5.receiver = self;
  v5.super_class = (Class)ASSettingsAccountsUIController;
  v3 = [(ESSettingsAccountsUIController *)&v5 account];

  return v3;
}

- (id)accountFromSpecifier
{
  v2 = [(ASSettingsAccountsUIController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:ACUIAccountKey];

  if (v4)
  {
    objc_super v5 = +[ESAccountLoader sharedInstance];
    v6 = (objc_class *)[v5 daemonAppropriateAccountClassForACAccount:v4];

    id v7 = [[v6 alloc] initWithBackingAccountInfo:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)newDefaultAccount
{
  unsigned int v3 = [(id)objc_opt_class() isHotmailAccount];
  v4 = [(ASSettingsAccountsUIController *)self accountStore];
  objc_super v5 = v4;
  v6 = &ACAccountTypeIdentifierHotmail;
  if (!v3) {
    v6 = &ACAccountTypeIdentifierExchange;
  }
  id v7 = [v4 accountTypeWithAccountTypeIdentifier:*v6];

  id v8 = [objc_alloc((Class)ACAccount) initWithAccountType:v7];
  v9 = [v7 supportedDataclasses];
  id v10 = [v9 mutableCopy];

  [v10 removeObject:kAccountDataclassNotes];
  [v8 setProvisionedDataclasses:v10];
  v11 = +[ESAccount esAccountSubclassWithBackingAccountInfo:v8];
  [v11 setUseSSL:1];
  [v11 setEnabled:1 forDADataclass:1];
  if ([(id)objc_opt_class() isHotmailAccount]) {
    [v11 setHost:@"m.hotmail.com"];
  }
  else {
    *(void *)(&self->_remotedManaged + 1) = 0;
  }

  return v11;
}

- (id)_specifiersForMinimalAutodiscoveryRemovingIDs:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"ASSettingsAccountsUIController.m" lineNumber:140 description:@"Hotmail accounts should never be asked for minimal autodiscovery specifiers"];
  }
  v6 = [(ASSettingsAccountsUIController *)self loadSpecifiersFromPlistName:@"ASAccountSetup" target:self];
  id v7 = +[NSMutableArray arrayWithArray:v6];

  id v8 = &off_327E8;
  if (v5)
  {
    id v8 = [&off_327E8 arrayByAddingObjectsFromArray:v5];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(v7, "specifierForID:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        [v7 removeObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  v15 = +[PSSpecifier groupSpecifierWithName:0];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"DEVICE_WARNING_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];
  [v15 setProperty:v17 forKey:PSFooterTextGroupKey];

  [v7 addObject:v15];
  v18 = +[PSSpecifier groupSpecifierWithName:0];
  v19 = [(ASSettingsAccountsUIController *)self exchangeIdView];

  if (!v19)
  {
    v20 = +[ESDConnection sharedConnection];
    v21 = [v20 activeSyncDeviceIdentifier];

    [v18 setProperty:v21 forKey:@"ASExchangeIdKey"];
    v22 = [[ASExchangeIdView alloc] initWithSpecifier:v18];
    [(ASSettingsAccountsUIController *)self setExchangeIdView:v22];
  }
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  [v18 setProperty:v24 forKey:PSFooterCellClassGroupKey];

  v25 = [(ASSettingsAccountsUIController *)self exchangeIdView];
  [v18 setProperty:v25 forKey:PSFooterViewKey];

  [v7 addObject:v18];

  return v7;
}

- (id)_specifiersForOptionalServerAutodiscovery
{
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"ASSettingsAccountsUIController.m" lineNumber:175 description:@"Hotmail accounts should never be asked for server-optional autodiscovery specifiers"];
  }
  v4 = [(ASSettingsAccountsUIController *)self loadSpecifiersFromPlistName:@"ASAccountSetup" target:self];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  v6 = [v5 specifierForID:@"HOST"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OPTIONAL" value:&stru_30C50 table:@"ASAccountSetup"];
  [v6 setPlaceholder:v8];

  v9 = +[PSSpecifier groupSpecifierWithName:0];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"DEVICE_WARNING_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];
  [v9 setProperty:v11 forKey:PSFooterTextGroupKey];

  [v5 addObject:v9];
  uint64_t v12 = +[PSSpecifier groupSpecifierWithName:0];
  v13 = [(ASSettingsAccountsUIController *)self exchangeIdView];

  if (!v13)
  {
    v14 = +[ESDConnection sharedConnection];
    v15 = [v14 activeSyncDeviceIdentifier];

    [v12 setProperty:v15 forKey:@"ASExchangeIdKey"];
    v16 = [[ASExchangeIdView alloc] initWithSpecifier:v12];
    [(ASSettingsAccountsUIController *)self setExchangeIdView:v16];
  }
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [v12 setProperty:v18 forKey:PSFooterCellClassGroupKey];

  v19 = [(ASSettingsAccountsUIController *)self exchangeIdView];
  [v12 setProperty:v19 forKey:PSFooterViewKey];

  [v5 addObject:v12];

  return v5;
}

- (id)_specifiersForCompletedAutodiscovery
{
  if (([(id)objc_opt_class() isHotmailAccount] & 1) != 0
    || ([(ASSettingsAccountsUIController *)self account],
        unsigned int v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKeyedSubscript:kESExchangeOAuthSupportedKey],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 BOOLValue],
        v4,
        v3,
        v5))
  {
    CFStringRef v6 = @"ASHotmailAccountSetup";
  }
  else
  {
    CFStringRef v6 = @"ASAccountSetup";
  }
  id v7 = [(ASSettingsAccountsUIController *)self loadSpecifiersFromPlistName:v6 target:self];
  id v8 = +[NSMutableArray arrayWithArray:v7];

  if (![(ESSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    uint64_t v9 = +[PSSpecifier groupSpecifierWithName:0];
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"ADVANCED_SETTINGS" value:&stru_30C50 table:@"Localizable"];
    uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    v13 = [(ASSettingsAccountsUIController *)self account];
    [v12 setProperty:v13 forKey:@"ASAdvancedControllerAccountKey"];

    [v12 setIdentifier:@"ADVANCED_SETTINGS"];
    v54 = (void *)v9;
    [v8 addObject:v9];
    v53 = v12;
    [v8 addObject:v12];
    v14 = [(ASSettingsAccountsUIController *)self account];
    v15 = [v14 backingAccountInfo];
    v16 = [v15 mcBackingProfile];

    v55 = v16;
    if (v16)
    {
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_30C50 table:@"ASAccountSetup"];
      v19 = [v16 friendlyName];
      v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);

      v20 = [(ASSettingsAccountsUIController *)self account];
      v21 = [v20 identityPersist];

      if (v21)
      {
        v22 = [(ASSettingsAccountsUIController *)self account];
        v23 = [v22 username];

        if (v23)
        {
          v24 = [v8 specifierForID:@"PASSWORD"];
          v25 = +[NSBundle bundleForClass:objc_opt_class()];
          v26 = [v25 localizedStringForKey:@"OPTIONAL" value:&stru_30C50 table:@"ASAccountSetup"];
          [v24 setPlaceholder:v26];
        }
        else
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v27 = [&off_32800 countByEnumeratingWithState:&v64 objects:v72 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v65;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v65 != v29) {
                  objc_enumerationMutation(&off_32800);
                }
                long long v31 = [v8 specifierForID:*(void *)(*((void *)&v64 + 1) + 8 * i)];
                if (v31) {
                  [v8 removeObject:v31];
                }
              }
              id v28 = [&off_32800 countByEnumeratingWithState:&v64 objects:v72 count:16];
            }
            while (v28);
          }
        }
      }
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v32 = v8;
      id v33 = [v32 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v61;
        uint64_t v36 = PSEnabledKey;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v61 != v35) {
              objc_enumerationMutation(v32);
            }
            v38 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            v39 = [v38 identifier];
            if (([&off_32818 containsObject:v39] & 1) == 0) {
              [v38 setProperty:&__kCFBooleanFalse forKey:v36];
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v34);
      }

      v40 = [(ESSettingsAccountsUIController *)self lastGroupSpecifierInSpecifiers:v32];
      v16 = v55;
      if (!v40)
      {
        v41 = DALoggingwithCategory();
        os_log_type_t v42 = _CPLog_to_os_log_type[3];
        if (os_log_type_enabled(v41, v42))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v32;
          _os_log_impl(&dword_0, v41, v42, "No group found, not setting the profile text.  Specifiers: %@", buf, 0xCu);
        }
      }
      [v40 setProperty:v52 forKey:PSFooterTextGroupKey];
    }
    if ([(ASSettingsAccountsUIController *)self remotedManaged])
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v43 = v8;
      id v44 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v57;
        uint64_t v47 = PSEnabledKey;
        do
        {
          for (k = 0; k != v45; k = (char *)k + 1)
          {
            if (*(void *)v57 != v46) {
              objc_enumerationMutation(v43);
            }
            v49 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
            v50 = [v49 identifier];
            if ([&off_32830 containsObject:v50]) {
              [v49 setProperty:&__kCFBooleanFalse forKey:v47];
            }
          }
          id v45 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v45);
      }

      v16 = v55;
    }
  }

  return v8;
}

- (id)accountSpecifiers
{
  id v3 = [(ASSettingsAccountsUIController *)self account];
  v4 = [(ASSettingsAccountsUIController *)self account];
  unsigned int v5 = [v4 backingAccountInfo];
  CFStringRef v6 = [v5 managingOwnerIdentifier];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(ASSettingsAccountsUIController *)self account];
    id v8 = [v9 objectForKeyedSubscript:ACAccountPropertyConfigurationProfileIdentifier];
  }
  if (v8)
  {
    v4 = DALoggingwithCategory();
    os_log_type_t v10 = _CPLog_to_os_log_type[7];
    if (os_log_type_enabled(v4, v10))
    {
      id v11 = [(ASSettingsAccountsUIController *)self account];
      int v19 = 138412546;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_0, v4, v10, "Disable editing for %@, account is managed by %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v12 = self;
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v12 = self;
    uint64_t v13 = 0;
  }
  [(ASSettingsAccountsUIController *)v12 setRemotedManaged:v13];
  switch(*(void *)(&self->_remotedManaged + 1))
  {
    case 0:
    case 1:
      v14 = &off_32848;
      v15 = self;
      goto LABEL_12;
    case 2:
      v15 = self;
      v14 = 0;
LABEL_12:
      uint64_t v16 = [(ASSettingsAccountsUIController *)v15 _specifiersForMinimalAutodiscoveryRemovingIDs:v14];
      goto LABEL_14;
    case 3:
      uint64_t v16 = [(ASSettingsAccountsUIController *)self _specifiersForOptionalServerAutodiscovery];
LABEL_14:
      v4 = v16;
      break;
    case 4:
      v4 = [(ASSettingsAccountsUIController *)self _specifiersForCompletedAutodiscovery];
      v17 = [(ASSettingsAccountsUIController *)self localizedAccountTitleString];
      [(ASSettingsAccountsUIController *)self setTitle:v17];

      break;
    default:
      break;
  }

  return v4;
}

- (void)_transitionToOptionalServerAutodiscovery
{
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    __int16 v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"ASSettingsAccountsUIController.m" lineNumber:313 description:@"Hotmail accounts should never be asked to transition from minimal autodiscovery specifiers"];
  }
  v4 = [(ASSettingsAccountsUIController *)self specifierForID:@"HOST"];

  if (!v4)
  {
    unsigned int v5 = [(ASSettingsAccountsUIController *)self loadSpecifiersFromPlistName:@"ASAccountSetup" target:self];
    CFStringRef v6 = +[NSMutableArray arrayWithArray:v5];

    id v7 = [v6 specifierForID:@"HOST"];
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"OPTIONAL" value:&stru_30C50 table:@"ASAccountSetup"];
    [v7 setPlaceholder:v9];

    os_log_type_t v10 = [v6 specifierForID:@"DESCRIPTION_GROUP"];
    v24 = v10;
    id v11 = +[NSArray arrayWithObjects:&v24 count:1];

    [(ASSettingsAccountsUIController *)self insertContiguousSpecifiers:v11 afterSpecifierID:@"PASSWORD" animated:1];
    uint64_t v12 = [v6 specifierForID:@"USER_INFO_GROUP"];
    v23[0] = v12;
    uint64_t v13 = [v6 specifierForID:@"DOMAIN"];
    v23[1] = v13;
    v14 = [v6 specifierForID:@"USERNAME"];
    v23[2] = v14;
    v15 = +[NSArray arrayWithObjects:v23 count:3];

    [(ASSettingsAccountsUIController *)self insertContiguousSpecifiers:v15 afterSpecifierID:@"EMAIL" animated:1];
    uint64_t v16 = [v6 specifierForID:@"HOST_GROUP"];
    v22[0] = v16;
    v17 = [v6 specifierForID:@"HOST"];
    v22[1] = v17;
    v18 = +[NSArray arrayWithObjects:v22 count:2];

    [(ASSettingsAccountsUIController *)self insertContiguousSpecifiers:v18 afterSpecifierID:@"EMAIL" animated:1];
  }
  [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"EMAIL"];
  int v19 = [(ASSettingsAccountsUIController *)self account];
  [v19 setUsername:&stru_30C50];

  v20 = [(ASSettingsAccountsUIController *)self account];
  [v20 setHost:&stru_30C50];

  [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"DOMAIN"];
  [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"USERNAME"];
  [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"HOST"];
}

- (void)_transitionToCompletedAutodiscovery
{
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASSettingsAccountsUIController.m" lineNumber:352 description:@"Hotmail accounts should never be asked to transition from server-optional autodiscovery specifiers"];
  }
  v4 = [(ESSettingsAccountsUIController *)self specifiers];
  id v8 = [v4 specifierForID:@"HOST"];

  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v6 = [v5 localizedStringForKey:@"REQUIRED" value:&stru_30C50 table:@"ASAccountSetup"];
  [v8 setPlaceholder:v6];

  [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"HOST"];
}

- (BOOL)validateAccount
{
  id v3 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v3 resignFirstResponder];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v5 = [v4 localizedStringForKey:@"VERIFYING" value:&stru_30C50 table:@"Localizable"];
  [(ASSettingsAccountsUIController *)self startValidationWithPrompt:v5];

  CFStringRef v6 = [(ASSettingsAccountsUIController *)self account];
  id v7 = [(ASSettingsAccountsUIController *)self accountStore];
  [v6 checkValidityOnAccountStore:v7 withConsumer:self inQueue:&_dispatch_main_q];

  return 1;
}

- (void)_showAlertWithTitle:(id)a3 body:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v12 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  os_log_type_t v10 = [v9 localizedStringForKey:@"OK" value:&stru_30C50 table:@"ASAccountSetup"];
  id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v8];

  [v12 addAction:v11];
  [(ASSettingsAccountsUIController *)self presentViewController:v12 animated:1 completion:0];
  [(ASSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:0];
}

- (BOOL)verifyAccountPassword
{
  uint64_t v3 = OBJC_IVAR___PSListController__table;
  v4 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v4 resignFirstResponder];

  unsigned int v5 = [(ASSettingsAccountsUIController *)self account];
  CFStringRef v6 = [v5 emailAddress];
  unsigned int v7 = objc_msgSend(v6, "mf_isLegalEmailAddress");

  if (!v7)
  {
    id v11 = [(ASSettingsAccountsUIController *)self specifierForID:@"EMAIL"];
    id v12 = [v11 propertyForKey:PSTableCellKey];
    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_TITLE" value:&stru_30C50 table:@"ASAccountSetup"];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_BODY" value:&stru_30C50 table:@"ASAccountSetup"];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1382C;
    v21[3] = &unk_30928;
    id v22 = v12;
    id v17 = v12;
    [(ASSettingsAccountsUIController *)self _showAlertWithTitle:v14 body:v16 completion:v21];

    v18 = *(void **)&self->super.ACUIViewController_opaque[v3];
    int v19 = [v18 indexPathForCell:v17];
    [v18 scrollToRowAtIndexPath:v19 atScrollPosition:2 animated:1];

    [(ASSettingsAccountsUIController *)self _setViewsEnabled];
LABEL_6:

    return v7;
  }
  id v8 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v9 = [v8 emailAddress];
  unsigned int v10 = [(ASSettingsAccountsUIController *)self _storeHasDuplicateForUsername:v9];

  if (!v10)
  {
    id v11 = [(ASSettingsAccountsUIController *)self account];
    [(ASSettingsAccountsUIController *)self account:v11 wasAutoDiscovered:1 error:0];
    goto LABEL_6;
  }
  [(ESSettingsAccountsUIController *)self showIdenticalAccountFailureView];
  [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:1];
  return v7;
}

- (BOOL)autodiscoverAccount
{
  uint64_t v3 = OBJC_IVAR___PSListController__table;
  v4 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v4 resignFirstResponder];

  unsigned int v5 = [(ASSettingsAccountsUIController *)self account];
  CFStringRef v6 = [v5 emailAddress];
  unsigned int v7 = objc_msgSend(v6, "mf_isLegalEmailAddress");

  if (!v7)
  {
    id v11 = [(ASSettingsAccountsUIController *)self specifierForID:@"EMAIL"];
    id v12 = [v11 propertyForKey:PSTableCellKey];
    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_TITLE" value:&stru_30C50 table:@"ASAccountSetup"];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_BODY" value:&stru_30C50 table:@"ASAccountSetup"];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_13E78;
    v35[3] = &unk_30928;
    id v36 = v12;
    id v17 = v12;
    [(ASSettingsAccountsUIController *)self _showAlertWithTitle:v14 body:v16 completion:v35];

    v18 = *(void **)&self->super.ACUIViewController_opaque[v3];
    int v19 = [v18 indexPathForCell:v17];
    [v18 scrollToRowAtIndexPath:v19 atScrollPosition:2 animated:1];

    [(ASSettingsAccountsUIController *)self _setViewsEnabled];
LABEL_5:

    return v7;
  }
  id v8 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v9 = [v8 emailAddress];
  unsigned int v10 = [(ASSettingsAccountsUIController *)self _storeHasDuplicateForUsername:v9];

  if (!v10)
  {
    if (*(void *)(&self->_remotedManaged + 1))
    {
      [(ASSettingsAccountsUIController *)self _reallyStartAutoDiscoverAccount];
      return v7;
    }
    __int16 v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"ALLOW_MODERN_AUTHENTICATION" value:&stru_30C50 table:@"ASAccountSetup"];
    v23 = [(ASSettingsAccountsUIController *)self account];
    v24 = [v23 emailAddress];
    v25 = objc_msgSend(v24, "mf_addressDomain");
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v25);

    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    id v27 = [v26 localizedStringForKey:@"ALLOW_MODERN_AUTHENTICATION_ALERT_BODY" value:&stru_30C50 table:@"ASAccountSetup"];
    id v28 = +[UIAlertController alertControllerWithTitle:v11 message:v27 preferredStyle:1];

    uint64_t v29 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v30 = [v29 localizedStringForKey:@"MANUAL_ACCOUNT_SETUP" value:&stru_30C50 table:@"ASAccountSetup"];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_13D70;
    v38[3] = &unk_30928;
    v38[4] = self;
    long long v31 = +[UIAlertAction actionWithTitle:v30 style:0 handler:v38];
    [v28 addAction:v31];

    id v32 = +[NSBundle bundleForClass:objc_opt_class()];
    id v33 = [v32 localizedStringForKey:@"SIGN_IN" value:&stru_30C50 table:@"ASAccountSetup"];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_13E34;
    v37[3] = &unk_30928;
    v37[4] = self;
    id v34 = +[UIAlertAction actionWithTitle:v33 style:0 handler:v37];
    [v28 addAction:v34];

    [(ASSettingsAccountsUIController *)self presentViewController:v28 animated:0 completion:0];
    goto LABEL_5;
  }
  [(ESSettingsAccountsUIController *)self showIdenticalAccountFailureView];
  [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:1];
  return v7;
}

- (void)_reallyStartAutoDiscoverAccount
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"VERIFYING" value:&stru_30C50 table:@"Localizable"];
  [(ASSettingsAccountsUIController *)self startValidationWithPrompt:v4];

  if (*(void *)(&self->_remotedManaged + 1) > 1uLL)
  {
    id v5 = [(ASSettingsAccountsUIController *)self account];
    [v5 autodiscoverAccountConfigurationWithConsumer:self];
  }
  else
  {
    [(ASSettingsAccountsUIController *)self _autodiscoverOAuthAccountAfterInitialRedirect];
  }
}

- (void)_setViewsEnabled
{
  uint64_t v3 = OBJC_IVAR___PSListController__table;
  [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] setUserInteractionEnabled:1];
  v4 = (char *)[*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (v4)
  {
    id v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      unsigned int v7 = *(void **)&self->super.ACUIViewController_opaque[v3];
      id v8 = [(ASSettingsAccountsUIController *)self indexPathForIndex:i];
      uint64_t v9 = [v7 cellForRowAtIndexPath:v8];

      if (v9) {
        [v9 setUserInteractionEnabled:1];
      }
    }
  }
}

- (void)_autodiscoverOAuthAccountAfterInitialRedirect
{
  uint64_t v3 = objc_opt_new();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_140BC;
  v4[3] = &unk_30978;
  v4[4] = self;
  [v3 sendRequestForRedirectWithCompletionHandler:v4];
}

- (void)account:(id)a3 wasAutoDiscovered:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ([(id)objc_opt_class() isHotmailAccount])
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ASSettingsAccountsUIController.m" lineNumber:518 description:@"Hotmail accounts should never be autodiscovered"];

    if (v5) {
      goto LABEL_3;
    }
  }
  else if (v5)
  {
LABEL_3:
    ADClientAddValueForScalarKey();
    *(void *)(&self->_remotedManaged + 1) = 4;
    uint64_t v9 = [(ASSettingsAccountsUIController *)self account];
    unsigned int v10 = [(ASSettingsAccountsUIController *)self accountStore];
    [v9 checkValidityOnAccountStore:v10 withConsumer:self inQueue:&_dispatch_main_q];

    goto LABEL_17;
  }
  uint64_t v12 = *(void *)(&self->_remotedManaged + 1);
  if (v12 == 3)
  {
    *(void *)(&self->_remotedManaged + 1) = 4;
    [(ASSettingsAccountsUIController *)self _transitionToCompletedAutodiscovery];
  }
  else if (v12 == 2)
  {
    ADClientAddValueForScalarKey();
    *(void *)(&self->_remotedManaged + 1) = 3;
    [(ASSettingsAccountsUIController *)self _transitionToOptionalServerAutodiscovery];
  }
  else
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ASSettingsAccountsUIController.m", 536, @"If we were in state ASAccountSetupAutodiscoverStateComplete, we shouldn't have gotten an autodiscovery response" object file lineNumber description];
  }
  v14 = [v8 domain];
  if ([v14 isEqualToString:ASHTTPConnectionErrorDomain])
  {
    v15 = (char *)[v8 code];

    if (v15 == (unsigned char *)&stru_158.reloff + 1)
    {
      uint64_t v16 = DALoggingwithCategory();
      os_log_type_t v17 = _CPLog_to_os_log_type[6];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)int v19 = 0;
        _os_log_impl(&dword_0, v16, v17, "Autodiscovery encounters 401 error. Wiping password box.", v19, 2u);
      }

      v18 = [(ASSettingsAccountsUIController *)self account];
      [v18 setPassword:&stru_30C50];

      [(ASSettingsAccountsUIController *)self reloadSpecifierID:@"PASSWORD"];
    }
  }
  else
  {
  }
  [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:1];
  [(ESSettingsAccountsUIController *)self updateDoneButton];
LABEL_17:
  [(ASSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:0];
}

- (BOOL)_isNetworkOfflineError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
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
      unsigned int v10 = [v3 domain];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      id v15 = [v3 code];
      _os_log_impl(&dword_0, v8, v9, "AutoDV2 Discovery Failed With Fatal Network Error %{public}@:%ld ", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (BOOL)_isSSLError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSURLErrorDomain];

  if (v5) {
    BOOL v6 = (unint64_t)[v3 code] + 1204 < 5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)OAuthAccount:(id)a3 authorizationURI:(id)a4 error:(id)a5
{
  id v8 = a3;
  os_log_type_t v9 = (__CFString *)a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = DALoggingwithCategory();
    os_log_type_t v12 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = [v10 domain];
      int v33 = 138543618;
      CFStringRef v34 = v13;
      __int16 v35 = 2048;
      id v36 = [v10 code];
      _os_log_impl(&dword_0, v11, v12, "AutoDV2 Discovery Failed With Error %{public}@:%ld ", (uint8_t *)&v33, 0x16u);
    }
    if ([(ASSettingsAccountsUIController *)self _isNetworkOfflineError:v10])
    {
      __int16 v14 = DALoggingwithCategory();
      if (os_log_type_enabled(v14, v12))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_0, v14, v12, "Received an Internet Offline Error duing AutoDV2. Presenting Internet Offline Alert", (uint8_t *)&v33, 2u);
      }

      +[DAEASOAuthWebViewController presentInternetOfflineError];
      [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:1];
      goto LABEL_41;
    }
    if (![(ASSettingsAccountsUIController *)self _isSSLError:v10]
      || *(void *)(&self->_remotedManaged + 1) == 1)
    {
      BOOL v18 = v9 != 0;
      goto LABEL_17;
    }
    long long v31 = DALoggingwithCategory();
    os_log_type_t v32 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v31, v32))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_0, v31, v32, "Received an SSL Error during auto discover. Canceling", (uint8_t *)&v33, 2u);
    }

    +[DAEASOAuthWebViewController presentSSLError];
    [(ESSettingsAccountsUIController *)self cancelButtonTapped:0];
  }
  else
  {
    if (!v9)
    {
      BOOL v18 = 0;
LABEL_17:
      uint64_t v19 = *(void *)(&self->_remotedManaged + 1);
      if (v19 == 1)
      {
        v24 = DALoggingwithCategory();
        os_log_type_t v25 = _CPLog_to_os_log_type[6];
        if (os_log_type_enabled(v24, v25))
        {
          CFStringRef v26 = @"Not Valid";
          if (v18) {
            CFStringRef v26 = v9;
          }
          int v33 = 138543618;
          CFStringRef v34 = v26;
          __int16 v35 = 2114;
          id v36 = v10;
          _os_log_impl(&dword_0, v24, v25, "OAuthURI %{public}@ : Error %{public}@ Falling Back to AutoDiscvoer-V1", (uint8_t *)&v33, 0x16u);
        }

        [(ASSettingsAccountsUIController *)self _fallBackToAutoDiscoverV1];
      }
      else
      {
        if (v19)
        {
          v23 = DALoggingwithCategory();
          os_log_type_t v27 = _CPLog_to_os_log_type[3];
          if (os_log_type_enabled(v23, v27))
          {
            CFStringRef v28 = *(const __CFString **)(&self->_remotedManaged + 1);
            int v33 = 134217984;
            CFStringRef v34 = v28;
            _os_log_impl(&dword_0, v23, v27, "OAuth autodiscover failed with inconsistent state %ld", (uint8_t *)&v33, 0xCu);
          }
        }
        else
        {
          v20 = DALoggingwithCategory();
          os_log_type_t v21 = _CPLog_to_os_log_type[6];
          if (os_log_type_enabled(v20, v21))
          {
            CFStringRef v22 = @"Not Valid";
            if (v18) {
              CFStringRef v22 = v9;
            }
            int v33 = 138543618;
            CFStringRef v34 = v22;
            __int16 v35 = 2114;
            id v36 = v10;
            _os_log_impl(&dword_0, v20, v21, "OAuthURI %{public}@ : Error %{public}@ Trying on-prem AutoDiscvoer-V2", (uint8_t *)&v33, 0x16u);
          }

          *(void *)(&self->_remotedManaged + 1) = 1;
          v23 = [(ASSettingsAccountsUIController *)self account];
          [v23 autodiscoverOnPremOAuthAccountWithConsumer:self];
        }
      }
      goto LABEL_41;
    }
    id v15 = DALoggingwithCategory();
    os_log_type_t v16 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v15, v16))
    {
      int v33 = 138543362;
      CFStringRef v34 = v9;
      _os_log_impl(&dword_0, v15, v16, "AutoDiscover succeeded with OAuthURI : %{public}@", (uint8_t *)&v33, 0xCu);
    }

    [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:0];
    if (*(void *)(&self->_remotedManaged + 1) == 1)
    {
      id v17 = &dword_0 + 1;
    }
    else
    {
      uint64_t v29 = [v8 backingAccountInfo];
      long long v30 = [v29 objectForKeyedSubscript:kESExchangeOAuthOnPremKey];

      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v17 = [v30 BOOLValue];
      }
      else {
        id v17 = 0;
      }
    }
    [(ASSettingsAccountsUIController *)self _bringUpOAuthEndPointWithURL:v9 isOnPrem:v17];
  }
LABEL_41:
}

- (void)_fallBackToAutoDiscoverV1
{
  *(void *)(&self->_remotedManaged + 1) = 2;
  [(ASSettingsAccountsUIController *)self reloadSpecifiers];
  [(ESSettingsAccountsUIController *)self setAttemptedValidation:0];
  [(ESSettingsAccountsUIController *)self updateDoneButton];

  [(ASSettingsAccountsUIController *)self stopValidationWithPrompt:0 showButtons:1];
}

- (BOOL)_storeHasDuplicateForUsername:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ASSettingsAccountsUIController *)self accountStore];
  BOOL v6 = [(ASSettingsAccountsUIController *)self account];
  BOOL v7 = [v6 accountTypeIdentifier];
  id v8 = [v5 accountTypeWithAccountTypeIdentifier:v7];

  os_log_type_t v9 = [(ASSettingsAccountsUIController *)self accountStore];
  id v10 = [v9 accountsWithAccountType:v8];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    uint64_t v15 = kDAAccountEmailAddress;
    v23 = v8;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        BOOL v18 = [v17 username];
        if (![v4 compare:v18 options:1])
        {

          BOOL v20 = 1;
LABEL_13:
          id v8 = v23;
          goto LABEL_14;
        }
        uint64_t v19 = [v17 objectForKeyedSubscript:v15];
        BOOL v20 = 1;
        id v21 = [v4 compare:v19 options:1];

        if (!v21) {
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      BOOL v20 = 0;
      id v8 = v23;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_14:

  return v20;
}

- (void)handleRedirectURL:(id)a3
{
  SEL v46 = a2;
  id v47 = a3;
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"VERIFYING" value:&stru_30C50 table:@"Localizable"];
  [(ASSettingsAccountsUIController *)self startValidationWithPrompt:v4];

  unsigned int v5 = +[NSURLComponents componentsWithURL:v47 resolvingAgainstBaseURL:1];
  BOOL v6 = [v5 queryItems];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (!v7)
  {

    v50 = 0;
    id v8 = 0;
    goto LABEL_25;
  }
  long long v49 = 0uLL;
  v50 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v55;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v55 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      id v12 = objc_msgSend(v11, "name", v46);
      BOOL v13 = [v12 caseInsensitiveCompare:@"code"] == 0;

      if (v13)
      {
        uint64_t v22 = [v11 value];
        id v21 = v8;
        id v8 = (void *)v22;
      }
      else
      {
        uint64_t v14 = [v11 name];
        BOOL v15 = [v14 caseInsensitiveCompare:@"state"] == 0;

        if (v15)
        {
          uint64_t v23 = [v11 value];
          id v21 = v50;
          v50 = (void *)v23;
        }
        else
        {
          os_log_type_t v16 = [v11 name];
          BOOL v17 = [v16 caseInsensitiveCompare:@"error"] == 0;

          if (v17)
          {
            uint64_t v24 = [v11 value];
            id v21 = (void *)*((void *)&v49 + 1);
            *((void *)&v49 + 1) = v24;
          }
          else
          {
            BOOL v18 = [v11 name];
            BOOL v19 = [v18 caseInsensitiveCompare:@"error_description"] == 0;

            if (!v19) {
              continue;
            }
            uint64_t v20 = [v11 value];
            id v21 = (void *)v49;
            *(void *)&long long v49 = v20;
          }
        }
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  }
  while (v7);

  if (v49 == 0)
  {
    if (v8)
    {
      CFStringRef v28 = [(ASSettingsAccountsUIController *)self oauthFlowController];
      uint64_t v29 = [v28 state];
      unsigned __int8 v30 = [v50 isEqualToString:v29];

      if (v30)
      {
        objc_initWeak((id *)buf, self);
        long long v31 = [(ASSettingsAccountsUIController *)self oauthFlowController];
        os_log_type_t v32 = [(ASSettingsAccountsUIController *)self oauthFlowController];
        int v33 = [v32 challenge];
        CFStringRef v34 = [v33 codeVerifier];
        __int16 v35 = [(ASSettingsAccountsUIController *)self account];
        id v36 = [v35 backingAccountInfo];
        v37 = [v36 objectForKeyedSubscript:kESExchangePendingClaimsChallenge];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1553C;
        v52[3] = &unk_309C8;
        objc_copyWeak(v53, (id *)buf);
        v53[1] = (id)v46;
        v52[4] = self;
        [v31 exchangeAuthCode:v8 codeVerifier:v34 claims:v37 withCompletion:v52];

        objc_destroyWeak(v53);
        objc_destroyWeak((id *)buf);
LABEL_28:
        long long v49 = 0uLL;
        goto LABEL_29;
      }
    }
LABEL_25:
    v38 = DALoggingwithCategory();
    os_log_type_t v39 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v38, v39))
    {
      v40 = [(ASSettingsAccountsUIController *)self oauthFlowController];
      v41 = [v40 state];
      *(_DWORD *)buf = 138412802;
      long long v59 = v8;
      __int16 v60 = 2112;
      long long v61 = v50;
      __int16 v62 = 2112;
      long long v63 = v41;
      _os_log_impl(&dword_0, v38, v39, "Error retrieving an OAuth identity. Params: authCode %@, state %@ [self.oauthFlowController state] %@", buf, 0x20u);
    }
    os_log_type_t v42 = +[NSError errorWithDomain:DAAccountValidationDomain code:102 userInfo:0];
    id v43 = [(ASSettingsAccountsUIController *)self account];
    [(ASSettingsAccountsUIController *)self account:v43 isValid:0 validationError:v42];

    [(ASSettingsAccountsUIController *)self _fallBackToAutoDiscoverV1];
    goto LABEL_28;
  }
  long long v25 = DALoggingwithCategory();
  os_log_type_t v26 = _CPLog_to_os_log_type[3];
  if (os_log_type_enabled(v25, v26))
  {
    *(_DWORD *)buf = 138412546;
    long long v59 = (void *)*((void *)&v49 + 1);
    __int16 v60 = 2112;
    long long v61 = (void *)v49;
    _os_log_impl(&dword_0, v25, v26, "Error retrieving an OAuth identity. Failed with error %@, error_description %@", buf, 0x16u);
  }

  long long v27 = [(ASSettingsAccountsUIController *)self account];
  [(ASSettingsAccountsUIController *)self account:v27 isValid:0 validationError:0];

  [(ASSettingsAccountsUIController *)self _fallBackToAutoDiscoverV1];
LABEL_29:
  id v44 = +[PSOAuthAccountRedirectURLController sharedInstance];
  id v45 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  [v44 unRegisterOAuthClientForRedirectURL:v45];
}

- (void)_bringUpOAuthEndPointWithURL:(id)a3 isOnPrem:(BOOL)a4
{
  BOOL v4 = a4;
  id v36 = a3;
  v38 = v36;
  if (!v4)
  {
    v38 = +[DAEASOAuthFlowController upgradeAuthorizationEndpoint:v36];
  }
  BOOL v6 = [(ASSettingsAccountsUIController *)self account];
  id v7 = [v6 emailAddress];
  id v8 = [(ASSettingsAccountsUIController *)self account];
  [v8 setUsername:v7];

  uint64_t v9 = [(ASSettingsAccountsUIController *)self account];
  v37 = [v9 objectForKeyedSubscript:kESEASEndPointFQDN];

  id v10 = objc_alloc((Class)DAExchangeOAuthFlowController);
  id v11 = [(ASSettingsAccountsUIController *)self account];
  id v12 = [v11 emailAddress];
  BOOL v13 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v14 = [v13 backingAccountInfo];
  BOOL v15 = [v14 identifier];
  if (v4)
  {
    os_log_type_t v16 = @"{\"access_token\":{\"xms_cc\":{\"values\":[\"cp1\"]}}}";
  }
  else
  {
    __int16 v35 = [(ASSettingsAccountsUIController *)self account];
    id v7 = [v35 backingAccountInfo];
    os_log_type_t v16 = [v7 objectForKeyedSubscript:kESExchangePendingClaimsChallenge];
  }
  id v17 = [v10 initWithAuthURI:v38 easEndPoint:v37 username:v12 accountId:v15 claims:v16 isOnPrem:v4];
  [(ASSettingsAccountsUIController *)self setOauthFlowController:v17];

  if (!v4)
  {
  }
  BOOL v18 = [(ASSettingsAccountsUIController *)self oauthFlowController];
  BOOL v19 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  [v18 setRedirectURI:v19];

  uint64_t v20 = [(ASSettingsAccountsUIController *)self oauthFlowController];
  id v21 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v22 = [v21 emailAddress];
  if (v4) {
    [v20 onPremAuthURLForUsername:v22 originalAuthURL:v38 resource:v37];
  }
  else {
  uint64_t v23 = [v20 authURLForUsername:v22 originalAuthURL:v38];
  }

  objc_initWeak(&location, self);
  uint64_t v24 = +[UIApplication sharedApplication];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_161D4;
  v42[3] = &unk_309F0;
  objc_copyWeak(&v43, &location);
  -[ASSettingsAccountsUIController setBackgroundTaskID:](self, "setBackgroundTaskID:", [v24 beginBackgroundTaskWithName:@"ASSettingsAccountsUIController" expirationHandler:v42]);

  long long v25 = DALoggingwithCategory();
  os_log_type_t v26 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = [(ASSettingsAccountsUIController *)self backgroundTaskID];
    *(_DWORD *)buf = 134217984;
    unint64_t v46 = v27;
    _os_log_impl(&dword_0, v25, v26, "Begin background task %lu", buf, 0xCu);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_162E4;
  v40[3] = &unk_30A18;
  objc_copyWeak(&v41, &location);
  [(ASSettingsAccountsUIController *)self setRedirectHandlerBlock:v40];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_16410;
  v39[3] = &unk_30A40;
  v39[4] = self;
  CFStringRef v28 = objc_retainBlock(v39);
  uint64_t v29 = +[DAOAuthSafariViewController authenticationSessionWithURL:v23 handler:v28];
  [(ASSettingsAccountsUIController *)self setWebAuthenticationSession:v29];

  unsigned __int8 v30 = [(ASSettingsAccountsUIController *)self webAuthenticationSession];
  [v30 setPresentationContextProvider:self];

  long long v31 = +[PSOAuthAccountRedirectURLController sharedInstance];
  os_log_type_t v32 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  int v33 = [(ASSettingsAccountsUIController *)self redirectHandlerBlock];
  [v31 registerOAuthClientForRedirectURL:v32 redirectHandler:v33];

  CFStringRef v34 = [(ASSettingsAccountsUIController *)self webAuthenticationSession];
  [v34 start];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)_validateUniquenessAndAddAccount:(id)a3 username:(id)a4 token:(id)a5 refreshToken:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_167D0;
  v22[3] = &unk_30A68;
  objc_copyWeak(&v29, &location);
  id v23 = v14;
  uint64_t v24 = self;
  id v25 = v13;
  id v26 = v12;
  id v27 = v15;
  id v28 = v16;
  id v17 = v15;
  id v18 = v12;
  id v19 = v16;
  id v20 = v13;
  id v21 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

+ (id)usernameFromAccessToken:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v3 count] >= 3)
  {
    unsigned int v5 = [v3 objectAtIndexedSubscript:1];
    BOOL v6 = +[DAEASOAuthJWTValidator base64URLDecode:v5];
    id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
    id v8 = [v7 objectForKeyedSubscript:@"upn"];
    uint64_t v9 = v8;
    if (v8 && objc_msgSend(v8, "mf_isLegalEmailAddress")) {
      id v4 = v9;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void *)(&self->_remotedManaged + 1);
  if (v5) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    if (v5 != 3
      || ([(ASSettingsAccountsUIController *)self account],
          id v20 = objc_claimAutoreleasedReturnValue(),
          [v20 host],
          id v21 = objc_claimAutoreleasedReturnValue(),
          id v22 = [v21 length],
          v21,
          v20,
          v22))
    {
      v23.receiver = self;
      v23.super_class = (Class)ASSettingsAccountsUIController;
      [(ESSettingsAccountsUIController *)&v23 doneButtonTapped:v4];
      goto LABEL_19;
    }
  }
  id v7 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v8 = kESEASEndPointFQDN;
  uint64_t v9 = [v7 objectForKeyedSubscript:kESEASEndPointFQDN];
  if (!v9 || *(void *)(&self->_remotedManaged + 1) == 2) {
    goto LABEL_17;
  }
  id v10 = [(ASSettingsAccountsUIController *)self account];
  uint64_t v11 = [v10 objectForKeyedSubscript:kDAAccountHost];
  if (!v11)
  {

LABEL_17:
    goto LABEL_18;
  }
  id v12 = (void *)v11;
  id v13 = [(ASSettingsAccountsUIController *)self account];
  id v14 = [v13 host];
  id v15 = [v14 length];

  if (!v15)
  {
LABEL_18:
    [(ASSettingsAccountsUIController *)self autodiscoverAccount];
    goto LABEL_19;
  }
  id v16 = DALoggingwithCategory();
  os_log_type_t v17 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = [(ASSettingsAccountsUIController *)self account];
    id v19 = [v18 objectForKeyedSubscript:v8];
    *(_DWORD *)buf = 138412290;
    id v25 = v19;
    _os_log_impl(&dword_0, v16, v17, "Not performing autodiscover. EAS endpoint : %@", buf, 0xCu);
  }
  [(ASSettingsAccountsUIController *)self verifyAccountPassword];
LABEL_19:
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if ([(ESSettingsAccountsUIController *)self accountNeedsAdd])
    {
      id v10 = [(ASSettingsAccountsUIController *)self account];
      [v10 setEnabled:1 forDADataclass:1];

      uint64_t v11 = [(ASSettingsAccountsUIController *)self account];
      [v11 setEnabled:0 forDADataclass:2];

      id v12 = [(ASSettingsAccountsUIController *)self account];
      [v12 setEnabled:0 forDADataclass:4];

      id v13 = [(ASSettingsAccountsUIController *)self account];
      [v13 setEnabled:0 forDADataclass:16];

      id v14 = [(ASSettingsAccountsUIController *)self account];
      [v14 setEnabled:0 forDADataclass:32];

      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 1;
      uint64_t v30 = 0;
      long long v31 = &v30;
      uint64_t v32 = 0x2020000000;
      char v33 = 0;
      id v16 = [(ASSettingsAccountsUIController *)self accountStore];
      os_log_type_t v17 = [(ASSettingsAccountsUIController *)self account];
      id v18 = [v17 backingAccountInfo];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1728C;
      v26[3] = &unk_30A90;
      id v28 = &v30;
      p_long long buf = &buf;
      id v19 = v15;
      id v27 = v19;
      [v16 canSaveAccount:v18 withCompletionHandler:v26];

      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v20 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        [(ESSettingsAccountsUIController *)self setAccountNeedsAdd:0];
        [(ESSettingsAccountsUIController *)self setValidatedSuccessfully:1];
      }
      else
      {
        if (*((unsigned char *)v31 + 24)) {
          [(ESSettingsAccountsUIController *)self showIdenticalAccountFailureView];
        }
        else {
          [(ESSettingsAccountsUIController *)self showCanSaveAccountFailureView];
        }
        [(ESSettingsAccountsUIController *)self setAttemptedValidation:0];
      }
      ADClientAddValueForScalarKey();

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      BOOL v20 = 1;
      ADClientAddValueForScalarKey();
      [(ESSettingsAccountsUIController *)self setValidatedSuccessfully:1];
    }
    id v22 = 0;
  }
  else
  {
    id v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_30C50 table:@"ASAccountSetup"];

    [(ESSettingsAccountsUIController *)self setValidatedSuccessfully:0];
    [(ESSettingsAccountsUIController *)self setAttemptedValidation:1];
    objc_super v23 = DALoggingwithCategory();
    os_log_type_t v24 = _CPLog_to_os_log_type[3];
    if (os_log_type_enabled(v23, v24))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_0, v23, v24, "validation failed with error %@", (uint8_t *)&buf, 0xCu);
    }

    ADClientAddValueForScalarKey();
    BOOL v20 = 1;
  }
  [(ESSettingsAccountsUIController *)self hideProgressWithPrompt:v22];
  v25.receiver = self;
  v25.super_class = (Class)ASSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v25 account:v8 isValid:v20 & v6 validationError:v9];
}

- (BOOL)haveEnoughValues
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (!qword_3A5D0)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"USERNAME", @"EMAIL", 0);
    BOOL v6 = (void *)qword_3A5D0;
    qword_3A5D0 = (uint64_t)v5;
  }
  if (!qword_3A5D8)
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"PASSWORD", @"EMAIL", 0);
    id v8 = (void *)qword_3A5D8;
    qword_3A5D8 = (uint64_t)v7;
  }
  unsigned int v9 = [(id)objc_opt_class() isHotmailAccount];
  id v10 = &qword_3A5D0;
  if (v9) {
    id v10 = &qword_3A5D8;
  }
  id v11 = (id)*v10;
  if (v4)
  {
    uint64_t v12 = 0;
    id v24 = v4;
    while (1)
    {
      id v13 = [*(id *)&self->super.ACUIViewController_opaque[v3] objectAtIndexedSubscript:v12];
      if (v12 == [(ESSettingsAccountsUIController *)self indexOfCurrentlyEditingCell])
      {
        id v14 = [(ESSettingsAccountsUIController *)self currentlyEditingCell];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_semaphore_t v15 = [v13 identifier];
          if ([v11 containsObject:v15])
          {
            id v16 = [v14 textField];
            [v16 text];
            uint64_t v17 = v3;
            id v19 = v18 = v11;
            id v20 = [v19 length];

            id v11 = v18;
            uint64_t v3 = v17;
            id v4 = v24;
            goto LABEL_24;
          }
          char v22 = 1;
LABEL_25:

          goto LABEL_27;
        }
      }
      else
      {
        id v14 = [v13 identifier];
        if ([v14 isEqualToString:@"USERNAME"])
        {
          dispatch_semaphore_t v15 = [(ASSettingsAccountsUIController *)self account];
          id v21 = [v15 usernameWithoutDomain];
          goto LABEL_23;
        }
        if ([v14 isEqualToString:@"PASSWORD"])
        {
          dispatch_semaphore_t v15 = [(ASSettingsAccountsUIController *)self account];
          id v21 = [v15 passwordWithExpected:0];
          goto LABEL_23;
        }
        if ([v14 isEqualToString:@"EMAIL"])
        {
          dispatch_semaphore_t v15 = [(ASSettingsAccountsUIController *)self account];
          id v21 = [v15 emailAddress];
          goto LABEL_23;
        }
        if ([v14 isEqualToString:@"HOST"]
          && *(void *)(&self->_remotedManaged + 1) == 4)
        {
          dispatch_semaphore_t v15 = [(ASSettingsAccountsUIController *)self account];
          id v21 = [v15 host];
LABEL_23:
          id v16 = v21;
          id v20 = [v21 length];
LABEL_24:
          char v22 = v20 != 0;

          goto LABEL_25;
        }
      }
      char v22 = 1;
LABEL_27:

      if (++v12 >= (unint64_t)v4 || (v22 & 1) == 0) {
        goto LABEL_31;
      }
    }
  }
  char v22 = 0;
LABEL_31:

  return v22;
}

- (BOOL)transitionsAfterInitialSetup
{
  return 1;
}

- (void)_tryUpdatingCompositeValueWithId:(id)a3 fromValue:(id)a4 forKey:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v38 isEqualToString:@"EMAIL"])
  {
    id v10 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v11 = [v10 emailAddress];
LABEL_5:
    uint64_t v12 = (void *)v11;

    goto LABEL_7;
  }
  if ([v38 isEqualToString:@"DESCRIPTION"])
  {
    id v10 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v11 = [v10 accountDescription];
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_7:
  id v13 = [v12 componentsSeparatedByString:@"@"];
  if ([v13 count] == (char *)&dword_0 + 2)
  {
    id v14 = [v13 objectAtIndexedSubscript:0];
    dispatch_semaphore_t v15 = [v13 objectAtIndexedSubscript:1];
    if ([v9 isEqualToString:@"HOST"])
    {
      if (v15)
      {
        id v16 = [(ASSettingsAccountsUIController *)self account];
        uint64_t v17 = [v16 host];
        id v18 = v17;
        id v19 = v15;
LABEL_18:
        unsigned int v20 = [v17 isEqualToString:v19];

        goto LABEL_19;
      }
    }
    else if (([v9 isEqualToString:@"USERNAME"] & 1) != 0 && v14)
    {
      id v16 = [(ASSettingsAccountsUIController *)self account];
      uint64_t v17 = [v16 username];
      id v18 = v17;
      id v19 = v14;
      goto LABEL_18;
    }
  }
  else
  {
    if (([v9 isEqualToString:@"HOST"] & 1) == 0) {
      [v9 isEqualToString:@"USERNAME"];
    }
    dispatch_semaphore_t v15 = 0;
    id v14 = 0;
  }
  unsigned int v20 = 0;
LABEL_19:
  if ([v12 length] && !v20) {
    goto LABEL_43;
  }
  if ([v9 isEqualToString:@"HOST"])
  {
    id v21 = v14;
    if (v21
      || ([(ASSettingsAccountsUIController *)self account],
          char v22 = objc_claimAutoreleasedReturnValue(),
          [v22 usernameWithoutDomain],
          id v21 = (id)objc_claimAutoreleasedReturnValue(),
          v22,
          v21))
    {
      +[NSString stringWithFormat:@"%@@%@", v21, v8];
      id v24 = LABEL_29:;

      goto LABEL_31;
    }
  }
  else if ([v9 isEqualToString:@"USERNAME"])
  {
    id v21 = v15;
    if (v21
      || ([(ASSettingsAccountsUIController *)self account],
          objc_super v23 = objc_claimAutoreleasedReturnValue(),
          [v23 host],
          id v21 = (id)objc_claimAutoreleasedReturnValue(),
          v23,
          v21))
    {
      +[NSString stringWithFormat:@"%@@%@", v8, v21];
      goto LABEL_29;
    }
  }
  id v24 = 0;
LABEL_31:
  char v36 = v14;
  id v37 = v8;
  uint64_t v35 = v15;
  if ([v38 isEqualToString:@"EMAIL"])
  {
    objc_super v25 = [(ASSettingsAccountsUIController *)self account];
    [v25 setEmailAddress:v24];
LABEL_35:

    goto LABEL_36;
  }
  if ([v38 isEqualToString:@"DESCRIPTION"])
  {
    objc_super v25 = [(ASSettingsAccountsUIController *)self account];
    [v25 setAccountDescription:v24];
    goto LABEL_35;
  }
LABEL_36:
  uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
  id v27 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = 0;
    while (1)
    {
      uint64_t v30 = [*(id *)&self->super.ACUIViewController_opaque[v26] objectAtIndexedSubscript:v29];
      long long v31 = [v30 identifier];

      if ([v31 isEqualToString:v38]) {
        break;
      }

      if (v28 == (id)++v29) {
        goto LABEL_42;
      }
    }
    uint64_t v32 = [(ASSettingsAccountsUIController *)self table];
    char v33 = [(ASSettingsAccountsUIController *)self indexPathForIndex:v29];
    CFStringRef v34 = [v32 cellForRowAtIndexPath:v33];

    [v34 setValue:v24];
  }
LABEL_42:

  id v14 = v36;
  id v8 = v37;
  dispatch_semaphore_t v15 = v35;
LABEL_43:
}

- (id)_defaultAccountDescription
{
  unsigned int v2 = [(id)objc_opt_class() isHotmailAccount];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"HOTMAIL";
  }
  else {
    CFStringRef v5 = @"EXCHANGE";
  }
  BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_30C50 table:@"ASAccountSetup"];

  return v6;
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  id v9 = [(ASSettingsAccountsUIController *)self accountPropertyWithSpecifier:v7];
  unsigned int v10 = [v6 isEqualToString:v9];

  if ([v8 isEqualToString:@"HOST"])
  {
    [(ASSettingsAccountsUIController *)self _tryUpdatingCompositeValueWithId:@"EMAIL" fromValue:v6 forKey:v8];
    [(ASSettingsAccountsUIController *)self _tryUpdatingCompositeValueWithId:@"DESCRIPTION" fromValue:v6 forKey:v8];
    uint64_t v11 = [(ASSettingsAccountsUIController *)self account];
    [v11 setHost:v6];
LABEL_3:

    goto LABEL_29;
  }
  if ([v8 isEqualToString:@"DOMAIN"])
  {
    uint64_t v12 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v13 = [v12 usernameWithoutDomain];

    if (v13) {
      id v14 = (__CFString *)v13;
    }
    else {
      id v14 = &stru_30C50;
    }
    id v6 = v6;
    if ([v6 length])
    {
      dispatch_semaphore_t v15 = [v6 stringByAppendingFormat:@"\\%@", v14];
    }
    else
    {
      dispatch_semaphore_t v15 = v14;
    }
    unsigned int v20 = v15;

    id v21 = [(ASSettingsAccountsUIController *)self account];
    [v21 setUsername:v20];
  }
  else if ([v8 isEqualToString:@"USERNAME"])
  {
    [(ASSettingsAccountsUIController *)self _tryUpdatingCompositeValueWithId:@"EMAIL" fromValue:v6 forKey:v8];
    [(ASSettingsAccountsUIController *)self _tryUpdatingCompositeValueWithId:@"DESCRIPTION" fromValue:v6 forKey:v8];
    id v16 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v17 = [v16 domainOnly];

    if ([v17 length])
    {
      id v18 = [v17 stringByAppendingFormat:@"\\%@", v6];
    }
    else
    {
      id v18 = v6;
    }
    id v27 = v18;

    id v28 = [(ASSettingsAccountsUIController *)self account];
    [v28 setUsername:v27];
  }
  else
  {
    if ((([v8 isEqualToString:@"DESCRIPTION"] ^ 1 | v10) & 1) == 0)
    {
      if (![v6 length])
      {
        unsigned int v22 = [(id)objc_opt_class() isHotmailAccount];
        objc_super v23 = +[NSBundle bundleForClass:objc_opt_class()];
        id v24 = v23;
        if (v22) {
          CFStringRef v25 = @"HOTMAIL_DESCRIPTION";
        }
        else {
          CFStringRef v25 = @"EXCHANGE_DESCRIPTION";
        }
        uint64_t v26 = [v23 localizedStringForKey:v25 value:&stru_30C50 table:@"ASAccountSetup"];

        id v6 = (id)v26;
      }
      uint64_t v11 = [(ASSettingsAccountsUIController *)self account];
      [v11 setAccountDescription:v6];
      goto LABEL_3;
    }
    if ([v8 isEqualToString:@"EMAIL"])
    {
      if ([(id)objc_opt_class() isHotmailAccount])
      {
        id v19 = [(ASSettingsAccountsUIController *)self account];
        [v19 setUsername:v6];
      }
      v30.receiver = self;
      v30.super_class = (Class)ASSettingsAccountsUIController;
      [(ESSettingsAccountsUIController *)&v30 setAccountProperty:v6 withSpecifier:v7];
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)ASSettingsAccountsUIController;
      [(ESSettingsAccountsUIController *)&v29 setAccountProperty:v6 withSpecifier:v7];
    }
  }
LABEL_29:
  [(ESSettingsAccountsUIController *)self setNeedsSave:1];
  [(ESSettingsAccountsUIController *)self updateDoneButton];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 identifier];
  if ([v5 isEqualToString:@"DOMAIN"])
  {
    id v6 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v7 = [v6 domainOnly];
LABEL_5:
    id v8 = (__CFString *)v7;

    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"USERNAME"])
  {
    id v6 = [(ASSettingsAccountsUIController *)self account];
    uint64_t v7 = [v6 usernameWithoutDomain];
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)ASSettingsAccountsUIController;
  id v8 = [(ESSettingsAccountsUIController *)&v12 accountPropertyWithSpecifier:v4];
LABEL_7:
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = &stru_30C50;
  }
  unsigned int v10 = v9;

  return v10;
}

- (id)localizedValidationFailureTitleString
{
  unsigned int v2 = [(id)objc_opt_class() isHotmailAccount];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"HOTMAIL_ACCOUNT";
  }
  else {
    CFStringRef v5 = @"EXCHANGE_ACCOUNT";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_30C50 table:@"ASAccountSetup"];

  return v6;
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  unsigned int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"CONFIRM_SAVE_ACCOUNT_ANYWAYS_MESSAGE" value:&stru_30C50 table:@"ASAccountSetup"];

  return v3;
}

- (id)localizedAccountSetupTitleString
{
  unsigned int v2 = [(id)objc_opt_class() isHotmailAccount];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"HOTMAIL";
  }
  else {
    CFStringRef v5 = @"EXCHANGE";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_30C50 table:@"ASAccountSetup"];

  return v6;
}

- (id)localizedAccountTitleString
{
  unsigned int v3 = [(id)objc_opt_class() isHotmailAccount];
  unsigned int v4 = [(ESSettingsAccountsUIController *)self isSettingUpNewAccount];
  CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  CFStringRef v7 = @"NEW_ACCOUNT_SETTINGS";
  if (v3) {
    CFStringRef v7 = @"NEW_HOTMAIL_ACCOUNT_SETTINGS";
  }
  if (v4) {
    CFStringRef v8 = v7;
  }
  else {
    CFStringRef v8 = @"ACCOUNT";
  }
  id v9 = [v5 localizedStringForKey:v8 value:&stru_30C50 table:@"ASAccountSetup"];

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASSettingsAccountsUIController *)self account];
  v6.receiver = self;
  v6.super_class = (Class)ASSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v6 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASSettingsAccountsUIController *)self autoDV2RedirectSession];
  [v5 invalidateAndCancel];

  v6.receiver = self;
  v6.super_class = (Class)ASSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v6 viewWillDisappear:v3];
}

- (void)dealloc
{
  BOOL v3 = +[PSOAuthAccountRedirectURLController sharedInstance];
  unsigned int v4 = +[DAEASOAuthClient clientRedirectForOAuthType:1];
  [v3 unRegisterOAuthClientForRedirectURL:v4];

  v5.receiver = self;
  v5.super_class = (Class)ASSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v5 dealloc];
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  BOOL v3 = [(ASSettingsAccountsUIController *)self view];
  unsigned int v4 = [v3 window];

  return v4;
}

- (int64_t)autodiscoveryState
{
  return *(void *)(&self->_remotedManaged + 1);
}

- (void)setAutodiscoveryState:(int64_t)a3
{
  *(void *)(&self->_remotedManaged + 1) = a3;
}

- (unsigned)diagsVisibleValue
{
  return *(_DWORD *)(&self->super._transitioningToFinishedAccountSetup + 5);
}

- (void)setDiagsVisibleValue:(unsigned int)a3
{
  *(_DWORD *)(&self->super._transitioningToFinishedAccountSetup + 5) = a3;
}

- (ASExchangeIdView)exchangeIdView
{
  return *(ASExchangeIdView **)((char *)&self->_autodiscoveryState + 1);
}

- (void)setExchangeIdView:(id)a3
{
}

- (NSURLSession)autoDV2RedirectSession
{
  return *(NSURLSession **)((char *)&self->_exchangeIdView + 1);
}

- (void)setAutoDV2RedirectSession:(id)a3
{
}

- (DAExchangeOAuthFlowController)oauthFlowController
{
  return *(DAExchangeOAuthFlowController **)((char *)&self->_autoDV2RedirectSession + 1);
}

- (void)setOauthFlowController:(id)a3
{
}

- (ASWebAuthenticationSession)webAuthenticationSession
{
  return *(ASWebAuthenticationSession **)((char *)&self->_oauthFlowController + 1);
}

- (void)setWebAuthenticationSession:(id)a3
{
}

- (id)redirectHandlerBlock
{
  return *(ASWebAuthenticationSession **)((char *)&self->_webAuthenticationSession + 1);
}

- (void)setRedirectHandlerBlock:(id)a3
{
}

- (unint64_t)backgroundTaskID
{
  return *(unint64_t *)((char *)&self->_redirectHandlerBlock + 1);
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  *(id *)((char *)&self->_redirectHandlerBlock + 1) = (id)a3;
}

- (BOOL)remotedManaged
{
  return *(&self->super._transitioningToFinishedAccountSetup + 1);
}

- (void)setRemotedManaged:(BOOL)a3
{
  *(&self->super._transitioningToFinishedAccountSetup + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_webAuthenticationSession + 1), 0);
  objc_storeStrong((id *)((char *)&self->_oauthFlowController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_autoDV2RedirectSession + 1), 0);
  objc_storeStrong((id *)((char *)&self->_exchangeIdView + 1), 0);

  objc_storeStrong((id *)((char *)&self->_autodiscoveryState + 1), 0);
}

@end