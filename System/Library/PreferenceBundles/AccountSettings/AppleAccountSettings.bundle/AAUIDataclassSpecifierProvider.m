@interface AAUIDataclassSpecifierProvider
- (AAUIDataclassSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIDataclassSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (AAUIUbiquitySpecifierProvider)ubiquitySpecifierProvider;
- (ACAccount)account;
- (BOOL)_canHandleDataclassURL:(id)a3;
- (BOOL)_canHandleURL:(id)a3;
- (BOOL)_showSpecifierForDataclass:(id)a3;
- (BOOL)handleURL:(id)a3;
- (BOOL)isRegularWatchPairing;
- (BOOL)shouldShowSpecifierForServiceType:(id)a3;
- (NSArray)specifiers;
- (id)_buildAppGroupHeaderSpecifiers;
- (id)_buildAppSpecifiers;
- (id)_buildEmailSpecifier;
- (id)_buildHealthDataSpecifier;
- (id)_buildKeychainSpecifier;
- (id)_buildPhotosSpecifier;
- (id)_buildShowAllAppSpecifier;
- (id)_buildUbiquitySpecifier;
- (id)_dataclassState:(id)a3;
- (id)_loadCalendarSpecifierProvider;
- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)_specifierForDataclass:(id)a3;
- (id)_specifierForDataclass:(id)a3 withCustomDetailClass:(Class)a4;
- (id)_specifierForMessagesDataclass;
- (id)_specifiersForAppListVC;
- (id)_specifiersForProvisionedDataclasses;
- (id)_specifiersForiCloudVC;
- (id)getICloudMailSpecifier;
- (id)loadBundle:(id)a3 atPath:(id)a4;
- (id)specifierForDataclass:(id)a3;
- (id)specifierForServiceType:(id)a3;
- (id)syncWithiCloudSpecifiers;
- (id)valueForServiceSpecifier:(id)a3;
- (void)_didTapShowAllSpecifier:(id)a3;
- (void)_didTapShowAllSpecifier:(id)a3 url:(id)a4 animated:(BOOL)a5;
- (void)_initiateServiceAuthHandler;
- (void)_initiateSpecifiers;
- (void)_performUpdateIfNeededOnSpecifier:(id)a3 forDataclass:(id)a4;
- (void)cleanupDataclassSpecifiers;
- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4;
- (void)reloadSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setValue:(id)a3 forServiceSpecifier:(id)a4;
@end

@implementation AAUIDataclassSpecifierProvider

- (AAUIDataclassSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIDataclassSpecifierProvider;
  v9 = [(AAUIDataclassSpecifierProvider *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", ACAccountDataclassPhotos, ACAccountDataclassUbiquity, ACAccountDataclassMail, ACAccountDataclassKeychainSync, ACAccountDataclassBackup, 0);
    mainViewDataclasses = v10->_mainViewDataclasses;
    v10->_mainViewDataclasses = (NSSet *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v13);
    accountWorkQueue = v10->_accountWorkQueue;
    v10->_accountWorkQueue = (OS_dispatch_queue *)v14;
  }
  return v10;
}

- (AAUIDataclassSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUIDataclassSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ACAccount)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return (ACAccount *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(AAUIDataclassSpecifierProvider *)self _initiateServiceAuthHandler];

  [(AAUIDataclassSpecifierProvider *)self _initiateSpecifiers];
}

- (void)_initiateServiceAuthHandler
{
  if (!self->_serviceAuthHandler)
  {
    v3 = [AAUIServiceAuthHandler alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v5 = [(AAUIServiceAuthHandler *)v3 initWithAccountManager:accountManager presenter:WeakRetained];
    serviceAuthHandler = self->_serviceAuthHandler;
    self->_serviceAuthHandler = v5;
  }
}

- (void)_initiateSpecifiers
{
  v3 = [(AAUIDataclassSpecifierProvider *)self getICloudMailSpecifier];
  mailSpecifierProvider = self->_mailSpecifierProvider;
  self->_mailSpecifierProvider = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_mailSpecifierProvider setDelegate:WeakRetained];

  v6 = [AAUIPrivateEmailSpecifierProvider alloc];
  accountManager = self->_accountManager;
  id v8 = objc_loadWeakRetained((id *)&self->_listController);
  v9 = [(AAUIPrivateEmailSpecifierProvider *)v6 initWithAccountManager:accountManager presenter:v8];
  hmeSpecifierProvider = self->_hmeSpecifierProvider;
  self->_hmeSpecifierProvider = v9;

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_hmeSpecifierProvider setDelegate:v11];

  v12 = [[AAUIHealthDataSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
  healthDataSpecifierProvider = self->_healthDataSpecifierProvider;
  self->_healthDataSpecifierProvider = (AAUISpecifierProvider *)v12;

  id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider setDelegate:v14];

  if (_os_feature_enabled_impl())
  {
    v15 = [(AAUIDataclassSpecifierProvider *)self _loadCalendarSpecifierProvider];
    calendarSpecifierProvider = self->_calendarSpecifierProvider;
    self->_calendarSpecifierProvider = v15;
  }
  else
  {
    objc_super v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_49CD8(v17);
    }
  }
  v18 = [[AAUIPhotoStreamSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
  photoStreamSpecifierProvider = self->_photoStreamSpecifierProvider;
  self->_photoStreamSpecifierProvider = (AAUISpecifierProvider *)v18;

  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider setDelegate:v20];

  v21 = [[AAUIKeychainSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
  keychainSpecifierProvider = self->_keychainSpecifierProvider;
  self->_keychainSpecifierProvider = (AAUISpecifierProvider *)v21;

  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_keychainSpecifierProvider setDelegate:v23];

  v24 = [[AAUIUbiquitySpecifierProvider alloc] initWithAccountManager:self->_accountManager];
  ubiquitySpecifierProvider = self->_ubiquitySpecifierProvider;
  self->_ubiquitySpecifierProvider = v24;

  id v26 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setDelegate:v26];

  v27 = [[AAUIOtherSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
  otherSpecifierProvider = self->_otherSpecifierProvider;
  self->_otherSpecifierProvider = (AAUISpecifierProvider *)v27;

  id v29 = objc_loadWeakRetained((id *)&self->_delegate);
  [(AAUISpecifierProvider *)self->_otherSpecifierProvider setDelegate:v29];
}

- (void)cleanupDataclassSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  appGroupSpecifiers = self->_appGroupSpecifiers;
  self->_appGroupSpecifiers = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  syncWithiCloudSpecifiers = self->_syncWithiCloudSpecifiers;
  self->_syncWithiCloudSpecifiers = 0;

  [(AAUISpecifierProvider *)self->_keychainSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mailSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_hmeSpecifierProvider setSpecifiers:0];
  [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setSpecifiers:0];
  healthDataSpecifierProvider = self->_healthDataSpecifierProvider;

  [(AAUISpecifierProvider *)healthDataSpecifierProvider setSpecifiers:0];
}

- (void)reloadSpecifiers
{
  v3 = self->_specifiers;
  [(AAUIDataclassSpecifierProvider *)self cleanupDataclassSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v3 animated:0];
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if ([v5 cellType] == (char *)&dword_4 + 2)
  {
    [v5 removePropertyForKey:PSValueKey];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v9 = WeakRetained;
    id v7 = v5;
    uint64_t v8 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v9 = WeakRetained;
    id v7 = v5;
    uint64_t v8 = 1;
  }
  [WeakRetained reloadSpecifier:v7 animated:v8];
}

- (BOOL)_showSpecifierForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = +[AADataclassManager sharedManager];
  v6 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned __int8 v7 = [v5 shouldShowSpecifierForDataclass:v4 forAccount:v6];

  return v7;
}

- (id)_buildShowAllAppSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SYNC_WITH_ICLOUD_SPECIFIER" value:&stru_76890 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:2 edit:0];
  showAllSpecifier = self->_showAllSpecifier;
  self->_showAllSpecifier = v5;

  [(PSSpecifier *)self->_showAllSpecifier setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
  [(PSSpecifier *)self->_showAllSpecifier setControllerLoadAction:"_didTapShowAllSpecifier:"];
  unsigned __int8 v7 = [(AAUIDataclassSpecifierProvider *)self account];

  if (v7)
  {
    uint64_t v8 = self->_showAllSpecifier;
    v13[0] = @"account";
    id v9 = [(AAUIDataclassSpecifierProvider *)self account];
    v13[1] = @"topLevel";
    v14[0] = v9;
    v14[1] = &__kCFBooleanFalse;
    v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(PSSpecifier *)v8 setUserInfo:v10];
  }
  id v11 = self->_showAllSpecifier;

  return v11;
}

- (void)_didTapShowAllSpecifier:(id)a3
{
}

- (void)_didTapShowAllSpecifier:(id)a3 url:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(AAUIiCloudAppListViewController);
  [(AAUIiCloudAppListViewController *)v9 setSpecifier:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v11 = [WeakRetained navigationController];
  [v11 pushViewController:v9 animated:v5];

  if (v12) {
    [(AAUIiCloudAppListViewController *)v9 handleURL:v12 withCompletion:0];
  }
}

- (id)_buildPhotosSpecifier
{
  if ((-[AAUIDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", ACAccountDataclassMediaStream)|| -[AAUIDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", ACAccountDataclassSharedStreams))&& (-[AAUISpecifierProvider specifiers](self->_photoStreamSpecifierProvider, "specifiers"), v3 = objc_claimAutoreleasedReturnValue(), id v4 = [v3 count], v3, v4))
  {
    BOOL v5 = [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider specifiers];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_buildHealthDataSpecifier
{
  v3 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
  id v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_buildUbiquitySpecifier
{
  v3 = [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider ubiquityLinklistSpecifer];
  if ([(AAUIDataclassSpecifierProvider *)self _showSpecifierForDataclass:kAccountDataclassUbiquity])
  {
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  if (v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (id)_buildEmailSpecifier
{
  uint64_t v3 = ACAccountDataclassMail;
  if (!-[AAUIDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", ACAccountDataclassMail)|| (-[AAUISpecifierProvider specifiers](self->_mailSpecifierProvider, "specifiers"), v4 = objc_claimAutoreleasedReturnValue(), id v5 = [v4 count], v4, !v5))
  {
    unsigned __int8 v7 = 0;
    goto LABEL_9;
  }
  if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled])goto LABEL_8; {
  v6 = [(AAUIDataclassSpecifierProvider *)self account];
  }
  if (objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary))
  {

LABEL_8:
    v10 = [(AAUISpecifierProvider *)self->_mailSpecifierProvider specifiers];
    unsigned __int8 v7 = [v10 firstObject];

    goto LABEL_9;
  }
  id v8 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned int v9 = objc_msgSend(v8, "aa_isManagedAppleID");

  if (v9) {
    goto LABEL_8;
  }
  unsigned __int8 v7 = [(AAUIDataclassSpecifierProvider *)self specifierForDataclass:v3];
LABEL_9:

  return v7;
}

- (id)_buildKeychainSpecifier
{
  if (-[AAUIDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", ACAccountDataclassKeychainSync)&& (-[AAUISpecifierProvider specifiers](self->_keychainSpecifierProvider, "specifiers"), v3 = objc_claimAutoreleasedReturnValue(), id v4 = [v3 count], v3, v4))
  {
    id v5 = [(AAUISpecifierProvider *)self->_keychainSpecifierProvider specifiers];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_specifierForMessagesDataclass
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    uint64_t v3 = (void *)qword_8FFE0;
    uint64_t v12 = qword_8FFE0;
    if (!qword_8FFE0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_26B60;
      v8[3] = &unk_75298;
      v8[4] = &v9;
      sub_26B60((uint64_t)v8);
      uint64_t v3 = (void *)v10[3];
    }
    uint64_t v4 = ACAccountDataclassMessages;
    id v5 = v3;
    _Block_object_dispose(&v9, 8);
    v6 = [(AAUIDataclassSpecifierProvider *)self _specifierForDataclass:v4 withCustomDetailClass:v5];
  }
  else
  {
    v6 = [(AAUIDataclassSpecifierProvider *)self _specifierForDataclass:ACAccountDataclassMessages];
  }

  return v6;
}

- (id)syncWithiCloudSpecifiers
{
  syncWithiCloudSpecifiers = self->_syncWithiCloudSpecifiers;
  if (!syncWithiCloudSpecifiers)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"SYNC_WITH_ICLOUD_GROUP_NAME" value:&stru_76890 table:@"Localizable"];
    unsigned __int8 v7 = +[PSSpecifier groupSpecifierWithName:v6];

    [v7 setIdentifier:@"SYNC WITH ICLOUD"];
    [v7 setObject:@" " forKeyedSubscript:PSFooterTextGroupKey];
    v27 = v7;
    [v4 addObject:v7];
    uint64_t v8 = [(AAUIDataclassSpecifierProvider *)self _buildPhotosSpecifier];
    if (v8) {
      [v4 addObject:v8];
    }
    uint64_t v9 = [(AAUIDataclassSpecifierProvider *)self _buildUbiquitySpecifier];
    if (v9) {
      [v4 addObject:v9];
    }
    uint64_t v10 = [(AAUIDataclassSpecifierProvider *)self _buildEmailSpecifier];
    if (v10) {
      [v4 addObject:v10];
    }
    id v26 = (void *)v8;
    uint64_t v11 = [(AAUIDataclassSpecifierProvider *)self _buildKeychainSpecifier];
    if (v11) {
      [v4 addObject:v11];
    }
    v25 = (void *)v9;
    uint64_t v12 = [(AAUIDataclassSpecifierProvider *)self _buildShowAllAppSpecifier];
    if (v12) {
      [v4 addObject:v12];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      uint64_t v17 = PSIDKey;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v20 = [v19 objectForKeyedSubscript:v17];
          [(AAUIDataclassSpecifierProvider *)self _performUpdateIfNeededOnSpecifier:v19 forDataclass:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    v21 = (NSArray *)[v13 copy];
    v22 = self->_syncWithiCloudSpecifiers;
    self->_syncWithiCloudSpecifiers = v21;

    syncWithiCloudSpecifiers = self->_syncWithiCloudSpecifiers;
  }

  return syncWithiCloudSpecifiers;
}

- (BOOL)isRegularWatchPairing
{
  if (qword_8FFD8 != -1) {
    dispatch_once(&qword_8FFD8, &stru_75CC0);
  }
  return 0;
}

- (id)_buildAppGroupHeaderSpecifiers
{
  v2 = +[PSSpecifier groupSpecifierWithID:@"APP_GROUP_HEADER_GROUP"];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DATACLASS_LIST_INFO_TEXT"];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_76890 table:@"Localizable"];
  v6 = +[NSString stringWithFormat:v5];
  [v2 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

  return v2;
}

- (id)_buildAppSpecifiers
{
  appSpecifiers = self->_appSpecifiers;
  if (appSpecifiers) {
    goto LABEL_78;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(AAUIDataclassSpecifierProvider *)self _specifiersForProvisionedDataclasses];
  if ([v5 count])
  {
    v6 = +[PSSpecifier groupSpecifierWithID:@"APPS_GROUP_0"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [(AAUIDataclassSpecifierProvider *)self _buildAppGroupHeaderSpecifiers];
      [v4 addObject:v9];
    }
    else
    {
      uint64_t v10 = [(AAUIDataclassSpecifierProvider *)self account];
      if (objc_msgSend(v10, "aa_isAccountClass:", AAAccountClassPrimary))
      {
        uint64_t v11 = [(AAUIDataclassSpecifierProvider *)self account];
        unsigned int v12 = objc_msgSend(v11, "aa_isManagedAppleID");

        if (!v12) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v9 localizedStringForKey:@"SYNC_WITH_ICLOUD_GROUP_NAME" value:&stru_76890 table:@"Localizable"];
      uint64_t v14 = +[PSSpecifier groupSpecifierWithID:@"SYNC WITH ICLOUD" name:v13];

      v6 = (void *)v14;
    }

LABEL_11:
    [v4 addObject:v6];
  }
  if ([(AAUIDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    id v15 = 0;
  }
  else
  {
    id v15 = [(AAUIDataclassSpecifierProvider *)self _buildPhotosSpecifier];
    if (v15) {
      [v4 addObject:v15];
    }
  }
  if (self->_ubiquitySpecifierProvider)
  {
    uint64_t v16 = [(AAUIDataclassSpecifierProvider *)self _buildUbiquitySpecifier];
    if (v16) {
      [v4 addObject:v16];
    }
  }
  uint64_t v17 = [(AAUIDataclassSpecifierProvider *)self _buildEmailSpecifier];
  if (v17) {
    [v4 addObject:v17];
  }
  if (![(AAUIDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    uint64_t v18 = [(AAUIDataclassSpecifierProvider *)self _buildKeychainSpecifier];

    if (v18)
    {
      [v4 addObject:v18];
      id v15 = (void *)v18;
    }
    else
    {
      id v15 = 0;
    }
  }
  v19 = [v5 specifierForID:ACAccountDataclassNotes];

  if (v19) {
    [v4 addObject:v19];
  }
  if (![(AAUIDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    uint64_t v20 = [v5 specifierForID:ACAccountDataclassMessages];

    if (v20)
    {
      [v4 addObject:v20];
      v19 = (void *)v20;
    }
    else
    {
      v19 = 0;
    }
  }
  v21 = +[AADataclassManager sharedManager];
  uint64_t v22 = ACAccountDataclassHealth;
  id v23 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned int v24 = [v21 shouldShowSpecifierForDataclass:v22 forAccount:v23];

  if (v24)
  {
    v25 = +[AADataclassManager sharedManager];
    unsigned int v26 = [v25 appIsNeitherInstalledOrPlaceholder:v22];

    if (v26) {
      [(AAUIDataclassSpecifierProvider *)self _buildHealthDataSpecifier];
    }
    else {
    uint64_t v27 = [v5 specifierForID:v22];
    }

    if (v27)
    {
      [v4 addObject:v27];
      v19 = (void *)v27;
    }
    else
    {
      v19 = 0;
    }
  }
  if (![(AAUIDataclassSpecifierProvider *)self isRegularWatchPairing])
  {
    if (_os_feature_enabled_impl()
      && ([(AAUIDataclassSpecifierProvider *)self account],
          long long v28 = objc_claimAutoreleasedReturnValue(),
          unsigned int v29 = objc_msgSend(v28, "aa_isAccountClass:", AAAccountClassPrimary),
          v28,
          v29))
    {
      long long v30 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
      id v31 = [v30 count];

      if (v31)
      {
        v32 = [(AAUISpecifierProvider *)self->_calendarSpecifierProvider specifiers];
        [v4 addObjectsFromArray:v32];
      }
      v33 = v19;
    }
    else
    {
      v33 = [v5 specifierForID:ACAccountDataclassCalendars];

      if (v33)
      {
        if (_os_feature_enabled_impl()) {
          [v33 setName:@"iCloud Calendar"];
        }
        [v4 addObject:v33];
      }
    }
    v34 = [v5 specifierForID:ACAccountDataclassContacts];

    if (v34) {
      [v4 addObject:v34];
    }
    v19 = [v5 specifierForID:ACAccountDataclassReminders];

    if (v19) {
      [v4 addObject:v19];
    }
  }
  v35 = [v5 specifierForID:ACAccountDataclassBookmarks];

  if (v35) {
    [v4 addObject:v35];
  }
  v36 = [v5 specifierForID:ACAccountDataclassNews];

  if (v36) {
    [v4 addObject:v36];
  }
  v37 = [v5 specifierForID:ACAccountDataclassStocks];

  if (v37) {
    [v4 addObject:v37];
  }
  v38 = [v5 specifierForID:ACAccountDataclassHome];

  if (v38) {
    [v4 addObject:v38];
  }
  v39 = [v5 specifierForID:ACAccountDataclassFitnessPlus];

  if (v39) {
    [v4 addObject:v39];
  }
  v40 = [v5 specifierForID:ACAccountDataclassShoebox];

  if (v40) {
    [v4 addObject:v40];
  }
  v41 = [(AAUIDataclassSpecifierProvider *)self specifierForServiceType:AIDAServiceTypeGameCenter];

  if (v41) {
    [v4 addObject:v41];
  }
  v42 = [v5 specifierForID:ACAccountDataclassSiri];

  if (v42) {
    [v4 addObject:v42];
  }
  v43 = [v5 specifierForID:ACAccountDataclassFreeform];

  if (v43) {
    [v4 addObject:v43];
  }
  if (+[AAPreferences isMomentsDataclassEnabled])
  {
    uint64_t v44 = [v5 specifierForID:ACAccountDataclassMoments];

    if (v44)
    {
      [v4 addObject:v44];
      v43 = (void *)v44;
    }
    else
    {
      v43 = 0;
    }
  }
  v45 = [v5 specifierForID:ACAccountDataclassPhoneFaceTime];

  if (v45) {
    [v4 addObject:v45];
  }
  v46 = (NSArray *)[v4 copy];
  v47 = self->_appSpecifiers;
  self->_appSpecifiers = v46;

  appSpecifiers = self->_appSpecifiers;
LABEL_78:

  return appSpecifiers;
}

- (NSArray)specifiers
{
  if (!self->_specifiers)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = [(AAUIDataclassSpecifierProvider *)self _specifiersForiCloudVC];
    }
    else
    {
      id v6 = objc_loadWeakRetained((id *)&self->_listController);
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();

      if ((v7 & 1) == 0) {
        goto LABEL_7;
      }
      id v5 = [(AAUIDataclassSpecifierProvider *)self _specifiersForAppListVC];
    }
    specifiers = self->_specifiers;
    self->_specifiers = v5;
  }
LABEL_7:
  uint64_t v9 = self->_specifiers;

  return v9;
}

- (id)_specifiersForiCloudVC
{
  uint64_t v3 = [(AAUIDataclassSpecifierProvider *)self account];
  if ((objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassPrimary) & 1) == 0)
  {

    goto LABEL_6;
  }
  id v4 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned __int8 v5 = objc_msgSend(v4, "aa_isManagedAppleID");

  if (v5)
  {
LABEL_6:
    p_appSpecifiers = &self->_appSpecifiers;
    appSpecifiers = self->_appSpecifiers;
    if (!appSpecifiers)
    {
      id v10 = [(AAUIDataclassSpecifierProvider *)self _buildAppSpecifiers];
      appSpecifiers = self->_appSpecifiers;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = appSpecifiers;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      uint64_t v15 = PSIDKey;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "objectForKeyedSubscript:", v15, (void)v20);
          [(AAUIDataclassSpecifierProvider *)self _performUpdateIfNeededOnSpecifier:v17 forDataclass:v18];
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    goto LABEL_16;
  }
  p_appSpecifiers = &self->_syncWithiCloudSpecifiers;
  syncWithiCloudSpecifiers = self->_syncWithiCloudSpecifiers;
  if (syncWithiCloudSpecifiers) {
    goto LABEL_17;
  }
  id v8 = [(AAUIDataclassSpecifierProvider *)self syncWithiCloudSpecifiers];
LABEL_16:
  syncWithiCloudSpecifiers = *p_appSpecifiers;
LABEL_17:

  return syncWithiCloudSpecifiers;
}

- (id)_specifiersForAppListVC
{
  appGroupSpecifiers = self->_appGroupSpecifiers;
  if (!appGroupSpecifiers)
  {
    id v4 = objc_opt_new();
    if (!self->_appSpecifiers)
    {
      unsigned __int8 v5 = [(AAUIDataclassSpecifierProvider *)self _buildAppSpecifiers];
      [v4 addObjectsFromArray:v5];
    }
    id v6 = [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
      [v4 addObjectsFromArray:v8];
    }
    uint64_t v9 = [(AAUIDataclassSpecifierProvider *)self account];
    unsigned int v10 = objc_msgSend(v9, "aa_isAccountClass:", AAAccountClassPrimary);

    if (v10)
    {
      uint64_t v11 = [(AAUISpecifierProvider *)self->_hmeSpecifierProvider specifiers];
      if ([v11 count])
      {
        id v12 = +[PSSpecifier emptyGroupSpecifier];
        [v4 addObject:v12];

        [v4 addObjectsFromArray:v11];
      }
    }
    id v13 = [(AAUISpecifierProvider *)self->_otherSpecifierProvider specifiers];
    id v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [(AAUISpecifierProvider *)self->_otherSpecifierProvider specifiers];
      [v4 addObjectsFromArray:v15];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v4;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      uint64_t v20 = PSIDKey;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = objc_msgSend(v22, "objectForKeyedSubscript:", v20, (void)v27);
          [(AAUIDataclassSpecifierProvider *)self _performUpdateIfNeededOnSpecifier:v22 forDataclass:v23];
        }
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    unsigned int v24 = (NSArray *)[v16 copy];
    v25 = self->_appGroupSpecifiers;
    self->_appGroupSpecifiers = v24;

    appGroupSpecifiers = self->_appGroupSpecifiers;
  }

  return appGroupSpecifiers;
}

- (BOOL)handleURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[AAUIDataclassSpecifierProvider handleURL:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s handleURL with dictionary - %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v6 = [(AAUIDataclassSpecifierProvider *)self _canHandleURL:v4];
  return v6;
}

- (BOOL)_canHandleURL:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider handleURL:v4] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(AAUIDataclassSpecifierProvider *)self _canHandleDataclassURL:v4];
  }

  return v5;
}

- (BOOL)_canHandleDataclassURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"path"];
  if ([v5 hasPrefix:@"com.apple.Dataclass"]
    && ![(NSSet *)self->_mainViewDataclasses containsObject:v5])
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_258E0;
    v9[3] = &unk_75130;
    v9[4] = self;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_specifiersForProvisionedDataclasses
{
  id v17 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = [(AAUIDataclassSpecifierProvider *)self account];
  id v4 = [v3 provisionedDataclasses];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = +[AADataclassManager sharedManager];
        id v12 = [(AAUIDataclassSpecifierProvider *)self account];
        unsigned int v13 = [v11 shouldShowSpecifierForDataclass:v10 forAccount:v12];

        if (v13)
        {
          id v14 = [(AAUIDataclassSpecifierProvider *)self specifierForDataclass:v10];
          if (v14) {
            [v17 addObject:v14];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v17;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Returning specifiers: %@", buf, 0xCu);
  }

  return v17;
}

- (id)specifierForDataclass:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:ACAccountDataclassMediaStream] & 1) != 0
    || [v4 isEqualToString:ACAccountDataclassSharedStreams])
  {
    id v5 = [(AAUISpecifierProvider *)self->_photoStreamSpecifierProvider specifiers];
    id v6 = [v5 count];

    if (v6)
    {
      photoStreamSpecifierProvider = self->_photoStreamSpecifierProvider;
LABEL_5:
      id WeakRetained = [(AAUISpecifierProvider *)photoStreamSpecifierProvider specifiers];
      uint64_t v9 = [WeakRetained firstObject];
LABEL_6:
      uint64_t v10 = (void *)v9;

      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v11 = ACAccountDataclassHealth;
  if ([v4 isEqualToString:ACAccountDataclassHealth])
  {
    id v12 = +[AADataclassManager sharedManager];
    unsigned int v13 = [v12 appIsNeitherInstalledOrPlaceholder:v11];

    if (v13)
    {
      id v14 = [(AAUISpecifierProvider *)self->_healthDataSpecifierProvider specifiers];
      id v15 = [v14 count];

      if (v15)
      {
        photoStreamSpecifierProvider = self->_healthDataSpecifierProvider;
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else
  {
    if ([v4 isEqualToString:ACAccountDataclassKeychainSync])
    {
      id v16 = [(AAUISpecifierProvider *)self->_keychainSpecifierProvider specifiers];
      id v17 = [v16 count];

      if (v17)
      {
        photoStreamSpecifierProvider = self->_keychainSpecifierProvider;
        goto LABEL_5;
      }
LABEL_14:
      uint64_t v10 = 0;
      goto LABEL_18;
    }
    if (![v4 isEqualToString:ACAccountDataclassNotes])
    {
      if (![v4 isEqualToString:ACAccountDataclassMessages])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
        uint64_t v9 = [WeakRetained specifierForDataclass:v4];
        goto LABEL_6;
      }
      uint64_t v18 = [(AAUIDataclassSpecifierProvider *)self _specifierForMessagesDataclass];
      goto LABEL_17;
    }
  }
  uint64_t v18 = [(AAUIDataclassSpecifierProvider *)self _specifierForDataclass:v4];
LABEL_17:
  uint64_t v10 = (void *)v18;
LABEL_18:

  return v10;
}

- (void)_performUpdateIfNeededOnSpecifier:(id)a3 forDataclass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned int v8 = objc_msgSend(v7, "aa_serverDisabledDataclass:", v6);

  if (v8)
  {
    [v15 cellType];
    [v15 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v15 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"MANAGED_BY_APPLE_ID" value:&stru_76890 table:@"Localizable"];
    [v15 setProperty:v10 forKey:PSTableCellSubtitleTextKey];
  }
  uint64_t v11 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);
  double v13 = UITableViewAutomaticDimension;
  if (!IsAccessibilityCategory) {
    double v13 = 50.0;
  }
  id v14 = +[NSNumber numberWithDouble:v13];
  [v15 setProperty:v14 forKey:PSTableCellHeightKey];
}

- (id)_specifierForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIDataclassSpecifierProvider *)self _specifierForDataclass:v4 withCustomDetailClass:objc_opt_class()];

  return v5;
}

- (id)_specifierForDataclass:(id)a3 withCustomDetailClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(AAUIDataclassSpecifierProvider *)self account];
  unsigned int v8 = +[PSSpecifier acui_linkListCellSpecifierForDataclass:v6 account:v7 target:self set:0 get:"_dataclassState:" detail:a4];

  [v8 setObject:v6 forKeyedSubscript:PSIDKey];
  [v8 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];

  return v8;
}

- (id)_dataclassState:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [WeakRetained specifierProvider:self dataclassSwitchStateForSpecifier:v5];

  LODWORD(v5) = [v7 BOOLValue];
  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (v5) {
    CFStringRef v10 = @"ON";
  }
  else {
    CFStringRef v10 = @"OFF";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_76890 table:@"Localizable"];

  return v11;
}

- (BOOL)shouldShowSpecifierForServiceType:(id)a3
{
  id v4 = a3;
  if ((+[AADeviceInfo isMultiUserMode] & 1) != 0
    || ([(AAUIDataclassSpecifierProvider *)self account],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = objc_msgSend(v5, "aa_isAccountClass:", AAAccountClassPrimary),
        v5,
        !v6))
  {
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v7 = [(AAUIServiceAuthHandler *)self->_serviceAuthHandler serviceOwnersManager];
  unsigned int v8 = [(id)objc_opt_class() supportedServices];
  unsigned __int8 v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Could not find a service owner for %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_8;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (id)specifierForServiceType:(id)a3
{
  id v4 = a3;
  if ([(AAUIDataclassSpecifierProvider *)self shouldShowSpecifierForServiceType:v4])
  {
    id v5 = AALocalizedStringForServiceType();
    unsigned int v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setValue:forServiceSpecifier:" get:"valueForServiceSpecifier:" detail:0 cell:6 edit:0];

    if ([v4 isEqualToString:AIDAServiceTypeGameCenter])
    {
      id v7 = +[PKIconImageCache settingsIconCache];
      unsigned int v8 = [v7 imageForKey:PKGameCenterIconKey];
      [v6 setProperty:v8 forKey:PSIconImageKey];
    }
    [v6 setProperty:v4 forKey:@"com.apple.appleaccount.ServiceType"];
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (void)setValue:(id)a3 forServiceSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v8 = [v7 propertyForKey:@"com.apple.appleaccount.ServiceType"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  BOOL v10 = [WeakRetained activeSpecifier];

  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_listController);
    [v11 startSpinnerInSpecifier:v7];

    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_26458;
    uint64_t v18 = &unk_75108;
    long long v19 = self;
    id v20 = v7;
    id v12 = objc_retainBlock(&v15);
    unsigned int v13 = objc_msgSend(v6, "BOOLValue", v15, v16, v17, v18, v19);
    serviceAuthHandler = self->_serviceAuthHandler;
    if (v13) {
      [(AAUIServiceAuthHandler *)serviceAuthHandler signInAccountForService:v8 completion:v12];
    }
    else {
      [(AAUIServiceAuthHandler *)serviceAuthHandler signOutAccountForService:v8 completion:v12];
    }
  }
}

- (id)valueForServiceSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"com.apple.appleaccount.ServiceType"];
  id v5 = [(AAUIServiceAuthHandler *)self->_serviceAuthHandler serviceOwnersManager];
  id v6 = [v5 accountForService:v4];

  if (v6)
  {
    id v7 = +[NSNumber numberWithBool:[(AAUIServiceAuthHandler *)self->_serviceAuthHandler accountMatchesPrimaryAccount:v6 service:v4]];
  }
  else
  {
    id v7 = &__kCFBooleanFalse;
  }

  return v7;
}

- (id)_loadCalendarSpecifierProvider
{
  uint64_t v3 = +[NSBundle aaui_loadBundle:@"icloudCalendarSettings.bundle" atPath:@"System/Library/PreferenceBundles/AccountSettings"];
  id v4 = NSClassFromString(@"CalendarSettingsSpecifierProvider");
  if ([(objc_class *)v4 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v5 = [v4 alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v8 = [v5 initWithAccountManager:accountManager presenter:WeakRetained];

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 setDelegate:v9];
  }
  else
  {
    BOOL v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_49D1C((uint64_t)self, (uint64_t)v3, v10);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)getICloudMailSpecifier
{
  uint64_t v3 = [(AAUIDataclassSpecifierProvider *)self loadBundle:@"icloudMailSettings.bundle" atPath:@"System/Library/PreferenceBundles/AccountSettings"];
  id v4 = [(AAUIDataclassSpecifierProvider *)self _loadSpecifierProviderWithClassName:@"MailSettingsSpecifierProvider" inBundle:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_49DA4(v7);
    }
  }

  return v5;
}

- (id)loadBundle:(id)a3 atPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = UISystemRootDirectory();
  id v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = [v8 stringByAppendingPathComponent:v5];
  BOOL v10 = +[NSBundle bundleWithPath:v9];
  if (([v10 isLoaded] & 1) == 0)
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@ not loaded. Loading...", (uint8_t *)&v13, 0xCu);
    }

    [v10 load];
  }

  return v10;
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v9 = [v8 alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v12 = [v9 initWithAccountManager:accountManager presenter:WeakRetained];
  }
  else
  {
    int v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    id v12 = 0;
  }

  return v12;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (AAUIUbiquitySpecifierProvider)ubiquitySpecifierProvider
{
  return self->_ubiquitySpecifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_showAllSpecifier, 0);
  objc_storeStrong((id *)&self->_serviceAuthHandler, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncWithiCloudSpecifiers, 0);
  objc_storeStrong((id *)&self->_calendarSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_otherSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_hmeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_keychainSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mailSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_healthDataSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_photoStreamSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end