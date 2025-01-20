@interface AAUIUbiquitySpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AAUIUbiquityAccessManager)ubiquityAccessManager;
- (AAUIUbiquitySpecifierProvider)init;
- (AAUIUbiquitySpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIUbiquitySpecifierProviderDelegate)ubiquityDelegate;
- (BOOL)_isAccountInGrayMode;
- (BOOL)_isSpecifierHiddenForBundleID:(id)a3;
- (BOOL)_shouldShowUbiquitySpecifier;
- (BOOL)shouldShowSpecifierForDataclass:(id)a3;
- (NSArray)appsUsingUbiquity;
- (NSArray)specifiers;
- (id)_account;
- (id)_appAccessGrantedForBundleID:(id)a3;
- (id)_appAccessGrantedForSpecifier:(id)a3;
- (id)_appSpecifierWithBundleID:(id)a3;
- (id)_appSpecifiersForUbiquityServices;
- (id)_dataclassState:(id)a3;
- (id)_groupUbiquityServices:(id)a3;
- (id)_isDocumentsAndDataEnabled:(id)a3;
- (id)_ubiquitySpecifier;
- (id)ubiquityDataclassSwitchSpecifer;
- (id)ubiquityLinklistSpecifer;
- (id)ubiquitySpecifer;
- (void)_clearSpecifiers;
- (void)_loadiCloudDriveSettingsBundleIfNeeded;
- (void)_presentiCloudUpgradeFlowForSpecifier:(id)a3;
- (void)_setAppAccessGranted:(id)a3 forSpecifier:(id)a4;
- (void)_setDocumentsAndDataEnabled:(id)a3 forSpecifier:(id)a4;
- (void)_startObservingTCCAccessChanges;
- (void)_startUsingiCloudDriveWithSpecifier:(id)a3;
- (void)_stopObservingTCCAccessChanges;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setUbiquityDelegate:(id)a3;
@end

@implementation AAUIUbiquitySpecifierProvider

- (AAUIUbiquitySpecifierProvider)init
{
  return 0;
}

- (AAUIUbiquitySpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIUbiquitySpecifierProvider;
  v6 = [(AAUIUbiquitySpecifierProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = objc_alloc_init(AAUIUbiquityAccessManager);
    ubiquityAccessManager = v7->_ubiquityAccessManager;
    v7->_ubiquityAccessManager = v8;

    [(AAUIUbiquitySpecifierProvider *)v7 _startObservingTCCAccessChanges];
  }

  return v7;
}

- (void)dealloc
{
  [(AAUIUbiquitySpecifierProvider *)self _stopObservingTCCAccessChanges];
  v3.receiver = self;
  v3.super_class = (Class)AAUIUbiquitySpecifierProvider;
  [(AAUIUbiquitySpecifierProvider *)&v3 dealloc];
}

- (id)_account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  objc_super v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if ([(AAUIUbiquitySpecifierProvider *)self shouldShowSpecifierForDataclass:kAccountDataclassUbiquity])
    {
      v4 = [(AAUIUbiquitySpecifierProvider *)self _appSpecifiersForUbiquityServices];
      id v5 = [(AAUIUbiquitySpecifierProvider *)self _groupUbiquityServices:v4];
    }
    else
    {
      id v5 = 0;
    }
    v6 = self->_specifiers;
    self->_specifiers = v5;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = +[AADataclassManager sharedManager];
  v6 = [(AAUIUbiquitySpecifierProvider *)self _account];
  unsigned int v7 = [v5 shouldShowSpecifierForDataclass:v4 forAccount:v6];

  if (v7)
  {
    v8 = [(AAUIUbiquitySpecifierProvider *)self _account];
    unsigned __int8 v9 = objc_msgSend(v8, "aa_isAccountClass:", AAAccountClassPrimary);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)ubiquitySpecifer
{
  objc_super v3 = +[AADataclassManager sharedManager];
  uint64_t v4 = kAccountDataclassUbiquity;
  id v5 = [(AAUIUbiquitySpecifierProvider *)self _account];
  LODWORD(v4) = [v3 shouldShowSpecifierForDataclass:v4 forAccount:v5];

  if (v4)
  {
    v6 = [(AAUIUbiquitySpecifierProvider *)self _ubiquitySpecifier];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_ubiquitySpecifier
{
  uint64_t v3 = kAccountDataclassUbiquity;
  uint64_t v4 = [(AAUIUbiquitySpecifierProvider *)self _account];
  id v5 = +[PSSpecifier acui_specifierForDataclass:v3 account:v4 target:self set:"_setDocumentsAndDataEnabled:forSpecifier:" get:"_isDocumentsAndDataEnabled:"];

  v6 = +[MCProfileConnection sharedConnection];
  LODWORD(v3) = [v6 effectiveBoolValueForSetting:MCFeatureCloudDocumentSyncAllowed];

  if (v3 == 2) {
    [v5 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }

  return v5;
}

- (id)ubiquityDataclassSwitchSpecifer
{
  if ([(AAUIUbiquitySpecifierProvider *)self _shouldShowUbiquitySpecifier])
  {
    id v3 = objc_alloc_init((Class)AADeviceInfo);
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
    v6 = [v4 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];

    unsigned int v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setDocumentsAndDataEnabled:forSpecifier:" get:"_isDocumentsAndDataEnabled:" detail:0 cell:6 edit:0];
    uint64_t v8 = PSEnabledKey;
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
    uint64_t v9 = ACAccountDataclassUbiquity;
    [v7 setObject:ACAccountDataclassUbiquity forKeyedSubscript:PSIDKey];
    [v7 setObject:v9 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
    v10 = +[MCProfileConnection sharedConnection];
    unsigned int v11 = [v10 effectiveBoolValueForSetting:MCFeatureCloudDocumentSyncAllowed];

    if (v11 == 2) {
      [v7 setProperty:&__kCFBooleanFalse forKey:v8];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (id)ubiquityLinklistSpecifer
{
  if ([(AAUIUbiquitySpecifierProvider *)self _shouldShowUbiquitySpecifier])
  {
    uint64_t v3 = ACAccountDataclassUbiquity;
    uint64_t v4 = [(AAUIUbiquitySpecifierProvider *)self _account];
    id v5 = +[PSSpecifier acui_linkListCellSpecifierForDataclass:v3 account:v4 target:self set:0 get:"_dataclassState:" detail:objc_opt_class()];

    v6 = +[MCProfileConnection sharedConnection];
    unsigned int v7 = [v6 effectiveBoolValueForSetting:MCFeatureCloudDocumentSyncAllowed];

    if (v7 == 2) {
      [v5 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    [v5 setObject:v3 forKeyedSubscript:PSIDKey];
    [v5 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_dataclassState:(id)a3
{
  uint64_t v3 = [(AAUIUbiquitySpecifierProvider *)self _isDocumentsAndDataEnabled:a3];
  unsigned int v4 = [v3 BOOLValue];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    CFStringRef v7 = @"ON";
  }
  else {
    CFStringRef v7 = @"OFF";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_76890 table:@"Localizable"];

  return v8;
}

- (BOOL)_shouldShowUbiquitySpecifier
{
  uint64_t v3 = +[AADataclassManager sharedManager];
  uint64_t v4 = ACAccountDataclassUbiquity;
  id v5 = [(AAUIUbiquitySpecifierProvider *)self _account];
  LOBYTE(v4) = [v3 shouldShowSpecifierForDataclass:v4 forAccount:v5];

  return v4;
}

- (id)_groupUbiquityServices:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableArray array];
  v25 = v3;
  id v5 = [v3 mutableCopy];
  v6 = [v5 specifierForID:@"com.apple.iBooks"];
  if (v6)
  {
    [v4 addObject:v6];
    [v5 removeObject:v6];
  }
  CFStringRef v7 = [v5 specifierForID:@"com.apple.Pages"];

  if (v7)
  {
    [v4 addObject:v7];
    [v5 removeObject:v7];
  }
  uint64_t v8 = [v5 specifierForID:@"com.apple.Numbers"];

  if (v8)
  {
    [v4 addObject:v8];
    [v5 removeObject:v8];
  }
  uint64_t v9 = [v5 specifierForID:@"com.apple.Keynote"];

  if (v9)
  {
    [v4 addObject:v9];
    [v5 removeObject:v9];
  }
  v10 = [v5 specifierForID:@"com.apple.mobilegarageband"];

  if (v10)
  {
    [v4 addObject:v10];
    [v5 removeObject:v10];
  }
  uint64_t v11 = [v5 specifierForID:@"com.apple.iMovie"];

  if (v11)
  {
    [v4 addObject:v11];
    [v5 removeObject:v11];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = objc_msgSend(v5, "copy", v11);
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = [v17 identifier];
        unsigned int v19 = [v18 hasPrefix:@"com.apple."];

        if (v19)
        {
          [v4 addObject:v17];
          [v5 removeObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  if ([v4 count])
  {
    v20 = +[PSSpecifier groupSpecifierWithID:@"APPS_GROUP_3"];
    [v4 insertObject:v20 atIndex:0];
  }
  if ([v5 count])
  {
    v21 = +[PSSpecifier groupSpecifierWithID:@"APPS_GROUP_4"];
    [v5 insertObject:v21 atIndex:0];
  }
  v22 = [v4 arrayByAddingObjectsFromArray:v5];

  return v22;
}

- (id)_appSpecifiersForUbiquityServices
{
  id v3 = +[NSMutableArray array];
  if (+[AADeviceInfo isMultiUserMode])
  {
    id v4 = [v3 copy];
    id v5 = v3;
  }
  else
  {
    v6 = [(AAUIUbiquityAccessManager *)self->_ubiquityAccessManager allBundleIDs];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2A5BC;
    v10[3] = &unk_75E80;
    v10[4] = self;
    CFStringRef v7 = objc_msgSend(v6, "aaf_map:", v10);
    id v5 = [v7 mutableCopy];

    [v5 sortUsingComparator:&stru_75EC0];
    uint64_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_4A030((uint64_t)v5, v8);
    }

    id v4 = [v5 copy];
  }

  return v4;
}

- (id)_appSpecifierWithBundleID:(id)a3
{
  id v4 = a3;
  if ([(AAUIUbiquitySpecifierProvider *)self _isSpecifierHiddenForBundleID:v4])
  {
    id v5 = 0;
  }
  else
  {
    v6 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    CFStringRef v7 = [v6 localizedName];
    id v5 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setAppAccessGranted:forSpecifier:" get:"_appAccessGrantedForSpecifier:" detail:0 cell:6 edit:0];

    [v5 setIdentifier:v4];
    [v5 setProperty:v4 forKey:PSLazyIconAppID];
    [v5 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
    uint64_t v8 = +[MCProfileConnection sharedConnection];
    unsigned int v9 = [v8 isCloudSyncAllowed:v4];

    if (v9) {
      v10 = &__kCFBooleanTrue;
    }
    else {
      v10 = &__kCFBooleanFalse;
    }
    [v5 setProperty:v10 forKey:PSEnabledKey];
  }

  return v5;
}

- (void)_clearSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  ubiquityAccessManager = self->_ubiquityAccessManager;

  [(AAUIUbiquityAccessManager *)ubiquityAccessManager reloadAccessInfo];
}

- (BOOL)_isAccountInGrayMode
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v3)
  {
    if ((objc_msgSend(v3, "aa_isSuspended") & 1) != 0
      || !objc_msgSend(v3, "aa_isPrimaryEmailVerified"))
    {
      char v5 = 1;
    }
    else
    {
      id v4 = objc_msgSend(v3, "aa_repairState");
      char v5 = [v4 unsignedIntegerValue] == (char *)&dword_0 + 3;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isSpecifierHiddenForBundleID:(id)a3
{
  id v4 = a3;
  char v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  v6 = [v5 appState];
  unsigned int v7 = [v6 isInstalled];

  if (v7)
  {
    uint64_t v8 = [v5 entitlementValueForKey:@"com.apple.private.appleaccount.app-hidden-from-icloud-settings" ofClass:objc_opt_class()];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
    {
      unsigned int v9 = [(AAUIUbiquitySpecifierProvider *)self _appAccessGrantedForBundleID:v4];

      if (v9)
      {
        BOOL v10 = 1;
      }
      else
      {
        ubiquityAccessManager = self->_ubiquityAccessManager;
        BOOL v10 = 1;
        [(AAUIUbiquityAccessManager *)ubiquityAccessManager setAppAccessGranted:1 forBundleID:v4];
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)_isDocumentsAndDataEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v9)
    {
      BOOL v10 = [(AAUIUbiquitySpecifierProvider *)self _account];
      if ([v10 isEnabledForDataclass:kAccountDataclassUbiquity])
      {
        uint64_t v11 = [(AAUIUbiquitySpecifierProvider *)self _account];
        id v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "aa_isUsingCloudDocs"));
      }
      else
      {
        id v12 = +[NSNumber numberWithInt:0];
      }

      goto LABEL_11;
    }
  }
  else
  {
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_4A0A8((id *)p_delegate);
    }
  }
  id v12 = &__kCFBooleanFalse;
LABEL_11:

  return v12;
}

- (void)_setDocumentsAndDataEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AAUIUbiquitySpecifierProvider *)self _account];
  unsigned __int8 v9 = objc_msgSend(v8, "aa_isUsingCloudDocs");

  if (v9)
  {
    BOOL v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(AAUIUbiquitySpecifierProvider *)self _account];
      unsigned int v12 = [v6 BOOLValue];
      CFStringRef v13 = @"NO";
      if (v12) {
        CFStringRef v13 = @"YES";
      }
      int v17 = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      CFStringRef v20 = v13;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Updating account %@ ubiquity state to %@.", (uint8_t *)&v17, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 specifierProvider:self dataclassSwitchStateDidChange:v6 withSpecifier:v7];
    }
  }
  else
  {
    [(AAUIUbiquitySpecifierProvider *)self _presentiCloudUpgradeFlowForSpecifier:v7];
  }
}

- (void)_startUsingiCloudDriveWithSpecifier:(id)a3
{
  id v15 = a3;
  [(AAUIUbiquitySpecifierProvider *)self _loadiCloudDriveSettingsBundleIfNeeded];
  id v4 = objc_alloc_init(NSClassFromString(@"CDSUpgradeViewController"));
  uint64_t v5 = [v15 userInfo];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v15 userInfo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_5:
      BOOL v10 = [v15 userInfo];
      id v11 = [v10 mutableCopy];

      goto LABEL_7;
    }
    id v8 = [v15 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_5;
    }
  }
  id v11 = +[NSMutableDictionary dictionary];
LABEL_7:
  unsigned int v12 = [(AAUIUbiquitySpecifierProvider *)self _account];
  [v11 setObject:v12 forKeyedSubscript:ACUIAccountKey];

  id v13 = [v11 copy];
  [v15 setUserInfo:v13];

  [v4 setSpecifier:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityDelegate);
  [WeakRetained ubiquityProviderShowViewController:v4];
}

- (void)_presentiCloudUpgradeFlowForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_TITLE" value:&stru_76890 table:@"Localizable"];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_MESSAGE" value:&stru_76890 table:@"Localizable"];

  unsigned __int8 v9 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"ICLOUD_SERVICE_UBIQUITY_UPGRAGE_BUTTON_TITLE" value:&stru_76890 table:@"Localizable"];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];

  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_2B01C;
  __int16 v19 = &unk_75108;
  CFStringRef v20 = self;
  id v21 = v4;
  id v13 = v4;
  id v14 = +[UIAlertController alertWithTitle:v6 message:v8 cancelButtonTitle:v12 defaultButtonTitle:v10 actionHandler:&v16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v14, v16, v17, v18, v19, v20);
}

- (void)_loadiCloudDriveSettingsBundleIfNeeded
{
  v2 = UISystemRootDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  id v4 = [v3 stringByAppendingPathComponent:@"iCloudDriveSettings.bundle"];
  uint64_t v5 = +[NSBundle bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "iCloud Drive settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (void)_startObservingTCCAccessChanges
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_2B2C8;
  handler[3] = &unk_75720;
  objc_copyWeak(&v8, &location);
  uint32_t v4 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccObserverToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  if (v4)
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Error registering for TCC notification.", v6, 2u);
    }
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopObservingTCCAccessChanges
{
  if (notify_is_valid_token(self->_tccObserverToken))
  {
    int tccObserverToken = self->_tccObserverToken;
    notify_cancel(tccObserverToken);
  }
}

- (id)_appAccessGrantedForSpecifier:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v9)
    {
      BOOL v10 = [v4 identifier];
      id v11 = [(AAUIUbiquitySpecifierProvider *)self _appAccessGrantedForBundleID:v10];

      goto LABEL_8;
    }
  }
  else
  {
    unsigned int v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_4A0A8((id *)p_delegate);
    }
  }
  id v11 = &__kCFBooleanFalse;
LABEL_8:

  return v11;
}

- (id)_appAccessGrantedForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MCProfileConnection sharedConnection];
  unsigned int v6 = [v5 isCloudSyncAllowed:v4];

  if (v6)
  {
    char v7 = +[NSNumber numberWithBool:[(AAUIUbiquityAccessManager *)self->_ubiquityAccessManager isAccessGrantedForBundleID:v4]];
  }
  else
  {
    char v7 = &__kCFBooleanFalse;
  }

  return v7;
}

- (void)_setAppAccessGranted:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2B71C;
    v11[3] = &unk_75EE8;
    objc_copyWeak(&v14, &location);
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v10 validateDataclassAccessForProvider:self specifier:v13 completion:v11];

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

- (NSArray)appsUsingUbiquity
{
  return [(AAUIUbiquityAccessManager *)self->_ubiquityAccessManager allBundleIDs];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (AAUIUbiquitySpecifierProviderDelegate)ubiquityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityDelegate);

  return (AAUIUbiquitySpecifierProviderDelegate *)WeakRetained;
}

- (void)setUbiquityDelegate:(id)a3
{
}

- (AAUIUbiquityAccessManager)ubiquityAccessManager
{
  return self->_ubiquityAccessManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityAccessManager, 0);
  objc_destroyWeak((id *)&self->_ubiquityDelegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end