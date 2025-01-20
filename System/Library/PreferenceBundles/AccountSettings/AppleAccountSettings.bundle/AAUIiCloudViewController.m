@interface AAUIiCloudViewController
- (AAUIiCloudViewController)init;
- (BOOL)_canHandleURL:(id)a3;
- (BOOL)_isAccountCleanupUIEnabled;
- (BOOL)_shouldDisableiCloudUI;
- (BOOL)isSecondaryAccount;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4;
- (BOOL)shouldEnableAccountSummaryCell;
- (BOOL)shouldShowiCloudDetails;
- (Class)accountInfoControllerClass;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_buildiCloudPlusSpecifiers;
- (id)_iCloudBackupSpecifiers;
- (id)_loadCustomDomainSpecifierProvider;
- (id)groupSpecifierAccountSummary;
- (id)specifiers;
- (void)_changePasswordLinkWasTapped;
- (void)_cleanupADPSpecifiers;
- (void)_cleanupAllSpecifiers;
- (void)_cleanupiCloudSpecifiers;
- (void)_fetchCloudStorageSummary;
- (void)_initiateSpecifiers;
- (void)_loadMailSettingsBundleIfNeeded;
- (void)_reloadADPStatusAndSpecifierIfNeeded;
- (void)_startObservingADPStateChangeNotification;
- (void)_startObservingQuotaChangeNotifications;
- (void)_stopObservingADPStateChangeNotification;
- (void)_stopObservingQuotaChangeNotifications;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setShouldShowiCloudDetails:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIiCloudViewController

- (AAUIiCloudViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIiCloudViewController;
  v2 = [(AAUIDataclassViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", ACAccountDataclassPhotos, ACAccountDataclassUbiquity, ACAccountDataclassMail, ACAccountDataclassKeychainSync, ACAccountDataclassBackup, 0);
    mainViewDataclasses = v2->_mainViewDataclasses;
    v2->_mainViewDataclasses = (NSSet *)v3;

    v2->_shouldShowiCloudDetails = 1;
    v2->_isADPEnabled = 0;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIiCloudViewController;
  [(AAUIiCloudViewController *)&v7 viewWillAppear:a3];
  v4 = [(AAUIiCloudViewController *)self navigationItem];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"ICLOUD_SERVICE_TITLE" value:&stru_76890 table:@"Localizable"];
  [v4 setTitle:v6];
}

- (void)dealloc
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAUIiCloudViewController dealloc.", buf, 2u);
  }

  [(AAUIiCloudViewController *)self _stopObservingQuotaChangeNotifications];
  [(AAUIiCloudViewController *)self _stopObservingADPStateChangeNotification];
  v4.receiver = self;
  v4.super_class = (Class)AAUIiCloudViewController;
  [(AAUIDataclassViewController *)&v4 dealloc];
}

- (Class)accountInfoControllerClass
{
  if ([(AAUIiCloudViewController *)self isSecondaryAccount]) {
    [(AAUIiCloudViewController *)self _loadMailSettingsBundleIfNeeded];
  }

  return NSClassFromString(@"AccountPSDetailController");
}

- (BOOL)shouldEnableAccountSummaryCell
{
  unsigned int v3 = +[AAUIFeatureFlags isAccountDataclassListRedesignEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(AAUIiCloudViewController *)self isSecondaryAccount];
  }
  return v3;
}

- (void)_loadMailSettingsBundleIfNeeded
{
  v2 = UISystemRootDirectory();
  unsigned int v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  objc_super v4 = [v3 stringByAppendingPathComponent:@"MailAccountSettings.bundle"];
  v5 = +[NSBundle bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    objc_super v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Mail settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (void)setAccountManager:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_490C4();
  }

  v6.receiver = self;
  v6.super_class = (Class)AAUIiCloudViewController;
  [(AAUIDataclassViewController *)&v6 setAccountManager:v4];

  [(AAUIiCloudViewController *)self _initiateSpecifiers];
  [(AAUIiCloudViewController *)self _fetchCloudStorageSummary];
  [(AAUIiCloudViewController *)self _startObservingQuotaChangeNotifications];
  [(AAUIiCloudViewController *)self _startObservingADPStateChangeNotification];
  [(AAUIiCloudViewController *)self _reloadADPStatusAndSpecifierIfNeeded];
}

- (BOOL)isSecondaryAccount
{
  unsigned int v3 = [(AAUIDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassPrimary))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(AAUIDataclassViewController *)self account];
    unsigned int v4 = objc_msgSend(v5, "aa_isManagedAppleID") ^ 1;
  }
  return v4;
}

- (BOOL)shouldShowiCloudDetails
{
  uint64_t v3 = [(AAUIiCloudViewController *)self pendingURLResourceDictionary];
  if (!v3) {
    return self->_shouldShowiCloudDetails;
  }
  unsigned int v4 = (void *)v3;
  v5 = [(AAUIiCloudViewController *)self pendingURLResourceDictionary];
  objc_super v6 = [v5 objectForKeyedSubscript:@"showiCloudDetails"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7) {
    return self->_shouldShowiCloudDetails;
  }
  v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(AAUIiCloudViewController *)self pendingURLResourceDictionary];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Not showing iCloud details due to pending url %@", (uint8_t *)&v11, 0xCu);
  }
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIiCloudViewController;
  [(AAUIiCloudViewController *)&v4 traitCollectionDidChange:a3];
  [(AAUIiCloudViewController *)self reloadSpecifiers];
}

- (void)_fetchCloudStorageSummary
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_177A4;
  v13 = sub_177B4;
  id v3 = objc_alloc((Class)ICQCloudStorageDataController);
  objc_super v4 = [(AAUIDataclassViewController *)self account];
  id v14 = [v3 initWithAccount:v4];

  objc_initWeak(&location, self);
  v5 = (void *)v10[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_177BC;
  v6[3] = &unk_75A40;
  objc_copyWeak(&v7, &location);
  v6[4] = &v9;
  [v5 fetchStorageSummaryWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
}

- (void)_initiateSpecifiers
{
  id v3 = objc_alloc((Class)ICQiCloudHeaderSpecifierProvider);
  objc_super v4 = [(AAUIDataclassViewController *)self accountManager];
  v5 = (AAUISpecifierProvider *)[v3 initWithAccountManager:v4 presenter:self];
  headerSpecifierProvider = self->_headerSpecifierProvider;
  self->_headerSpecifierProvider = v5;

  [(AAUISpecifierProvider *)self->_headerSpecifierProvider setDelegate:self];
  if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]|| ![(AAUIiCloudViewController *)self isSecondaryAccount])
  {
    id v7 = objc_alloc((Class)ICQInternetPrivacySpecifierProvider);
    v8 = [(AAUIDataclassViewController *)self accountManager];
    uint64_t v9 = (AAUISpecifierProvider *)[v7 initWithAccountManager:v8];
    privateRelaySpecifierProvider = self->_privateRelaySpecifierProvider;
    self->_privateRelaySpecifierProvider = v9;

    [(AAUISpecifierProvider *)self->_privateRelaySpecifierProvider setDelegate:self];
    uint64_t v11 = [AAUIPrivateEmailSpecifierProvider alloc];
    v12 = [(AAUIDataclassViewController *)self accountManager];
    v13 = [(AAUIPrivateEmailSpecifierProvider *)v11 initWithAccountManager:v12 presenter:self];
    hmeSpecifierProvider = self->_hmeSpecifierProvider;
    self->_hmeSpecifierProvider = v13;

    [(AAUISpecifierProvider *)self->_hmeSpecifierProvider setDelegate:self];
    v15 = [(AAUIiCloudViewController *)self _loadCustomDomainSpecifierProvider];
    customDomainSpecifierProvider = self->_customDomainSpecifierProvider;
    self->_customDomainSpecifierProvider = v15;

    id v17 = objc_alloc((Class)ICQiCloudFooterSpecifierProvider);
    v18 = [(AAUIDataclassViewController *)self accountManager];
    v19 = (AAUISpecifierProvider *)[v17 initWithAccountManager:v18 presenter:self];
    footerSpecifierProvider = self->_footerSpecifierProvider;
    self->_footerSpecifierProvider = v19;

    [(AAUISpecifierProvider *)self->_footerSpecifierProvider setDelegate:self];
    id v21 = objc_alloc((Class)ICQUITipSpecifierProvider);
    v22 = [(AAUIDataclassViewController *)self accountManager];
    v23 = (AAUISpecifierProvider *)[v21 initWithAccountManager:v22 presenter:self sectionAnchorIdentifier:ICQTipSyncWithiCloudSectionIdentifier showUpwardPointingTips:1];
    syncWithiCloudTipSpecifierProvider = self->_syncWithiCloudTipSpecifierProvider;
    self->_syncWithiCloudTipSpecifierProvider = v23;

    [(AAUISpecifierProvider *)self->_syncWithiCloudTipSpecifierProvider setDelegate:self];
    v25 = [AAUIiCloudBackupSpecifierProvider alloc];
    v26 = [(AAUIDataclassViewController *)self accountManager];
    v27 = [(AAUIiCloudBackupSpecifierProvider *)v25 initWithAccountManager:v26 presenter:self];
    backupSpecifierProvider = self->_backupSpecifierProvider;
    self->_backupSpecifierProvider = v27;

    [(AAUISpecifierProvider *)self->_backupSpecifierProvider setDelegate:self];
  }
  v29 = [AAUIDataclassSpecifierProvider alloc];
  v30 = [(AAUIDataclassViewController *)self accountManager];
  v31 = [(AAUIDataclassSpecifierProvider *)v29 initWithAccountManager:v30 presenter:self];
  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  self->_dataClassSpecifierProvider = v31;

  [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider setDelegate:self];
  if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]|| ![(AAUIiCloudViewController *)self isSecondaryAccount])
  {
    v33 = _AAUILogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_491D8();
    }

    v34 = [AAUICDPSpecifierProvider alloc];
    v35 = [(AAUIDataclassViewController *)self accountManager];
    v36 = [(AAUICDPSpecifierProvider *)v34 initWithAccountManager:v35 presenter:self];
    cdpSpecifierProvider = self->_cdpSpecifierProvider;
    self->_cdpSpecifierProvider = v36;

    [(AAUISpecifierProvider *)self->_cdpSpecifierProvider setDelegate:self];
    v38 = _AAUILogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_491A4();
    }

    v39 = [AAUICDPWebSpecifierProvider alloc];
    v40 = [(AAUIDataclassViewController *)self accountManager];
    v41 = [(AAUICDPWebSpecifierProvider *)v39 initWithAccountManager:v40 presenter:self];
    cdpWebSpecifierProvider = self->_cdpWebSpecifierProvider;
    self->_cdpWebSpecifierProvider = v41;

    [(AAUISpecifierProvider *)self->_cdpWebSpecifierProvider setDelegate:self];
    id v43 = objc_alloc((Class)ICQUIRecommendationsSpecifierProvider);
    v44 = [(AAUIDataclassViewController *)self accountManager];
    v45 = (AAUISpecifierProvider *)[v43 initWithAccountManager:v44];
    recommendationsSpecifierProvider = self->_recommendationsSpecifierProvider;
    self->_recommendationsSpecifierProvider = v45;

    [(AAUISpecifierProvider *)self->_recommendationsSpecifierProvider setDelegate:self];
  }
}

- (void)_cleanupAllSpecifiers
{
  [(AAUIiCloudViewController *)self cleanupDataclassSpecifiers];

  [(AAUIiCloudViewController *)self _cleanupiCloudSpecifiers];
}

- (void)_cleanupADPSpecifiers
{
  [(AAUISpecifierProvider *)self->_cdpSpecifierProvider setSpecifiers:0];
  cdpWebSpecifierProvider = self->_cdpWebSpecifierProvider;

  [(AAUISpecifierProvider *)cdpWebSpecifierProvider setSpecifiers:0];
}

- (void)cleanupDataclassSpecifiers
{
  [(AAUISpecifierProvider *)self->_backupSpecifierProvider setSpecifiers:0];
  deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
  self->_deviceBackupSpecifiers = 0;

  [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_syncWithiCloudTipSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_customDomainSpecifierProvider setSpecifiers:0];
  iCloudPlusSpecifiers = self->_iCloudPlusSpecifiers;
  self->_iCloudPlusSpecifiers = 0;

  v5 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;
}

- (void)_cleanupiCloudSpecifiers
{
  [(AAUISpecifierProvider *)self->_headerSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_footerSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_privateRelaySpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_hmeSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_customDomainSpecifierProvider setSpecifiers:0];
  iCloudPlusSpecifiers = self->_iCloudPlusSpecifiers;
  self->_iCloudPlusSpecifiers = 0;

  objc_super v4 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;
}

- (id)specifiers
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "updating the specifiers in the iCloudVC", buf, 2u);
  }

  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]|| ![(AAUIiCloudViewController *)self isSecondaryAccount])
    {
      objc_super v6 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
      id v7 = [v6 count];

      if (v7)
      {
        v8 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
        [v5 addObjectsFromArray:v8];
      }
    }
    if (_os_feature_enabled_impl())
    {
      uint64_t v9 = [(AAUISpecifierProvider *)self->_recommendationsSpecifierProvider specifiers];
      id v10 = [v9 count];

      if (v10)
      {
        uint64_t v11 = [(AAUISpecifierProvider *)self->_recommendationsSpecifierProvider specifiers];
        [v5 addObjectsFromArray:v11];
      }
    }
    v12 = [(AAUIDataclassViewController *)self account];

    if (v12)
    {
      if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]|| ![(AAUIiCloudViewController *)self isSecondaryAccount])
      {
LABEL_18:
        v16 = [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider specifiers];
        [v5 addObjectsFromArray:v16];

        id v17 = [(AAUISpecifierProvider *)self->_syncWithiCloudTipSpecifierProvider specifiers];

        if (v17)
        {
          v18 = [(AAUISpecifierProvider *)self->_syncWithiCloudTipSpecifierProvider specifiers];
          [v5 addObjectsFromArray:v18];
        }
        v19 = [(AAUIiCloudViewController *)self _iCloudBackupSpecifiers];
        [v5 addObjectsFromArray:v19];

        v20 = [(AAUIDataclassViewController *)self account];
        uint64_t v21 = AAAccountClassPrimary;
        unsigned int v22 = objc_msgSend(v20, "aa_isAccountClass:", AAAccountClassPrimary);

        if (v22)
        {
          v23 = [(AAUIiCloudViewController *)self _buildiCloudPlusSpecifiers];
          [v5 addObjectsFromArray:v23];
        }
        v24 = [(AAUISpecifierProvider *)self->_footerSpecifierProvider specifiers];
        id v25 = [v24 count];

        if (v25)
        {
          v26 = [(AAUISpecifierProvider *)self->_footerSpecifierProvider specifiers];
          [v5 addObjectsFromArray:v26];
        }
        v27 = [(AAUIDataclassViewController *)self account];
        if (objc_msgSend(v27, "aa_isAccountClass:", v21))
        {
          unsigned int v28 = [(AAUIiCloudViewController *)self _isAccountCleanupUIEnabled];

          if (!v28) {
            goto LABEL_32;
          }
          v29 = +[CDPAccount sharedInstance];
          v27 = [v29 primaryAccountDSID];

          if (+[CDPAccount isICDPEnabledForDSID:v27 checkWithServer:0])
          {
            v30 = [(AAUISpecifierProvider *)self->_cdpSpecifierProvider specifiers];
            id v31 = [v30 count];

            if (v31)
            {
              v32 = [(AAUISpecifierProvider *)self->_cdpSpecifierProvider specifiers];
              [v5 addObjectsFromArray:v32];

              [(AAUISpecifierProvider *)self->_cdpSpecifierProvider setADPState:self->_isADPEnabled];
              [(AAUISpecifierProvider *)self->_cdpWebSpecifierProvider setADPState:self->_isADPEnabled];
            }
          }
          v33 = [(AAUISpecifierProvider *)self->_cdpWebSpecifierProvider specifiers];
          id v34 = [v33 count];

          if (v34)
          {
            v35 = [(AAUISpecifierProvider *)self->_cdpWebSpecifierProvider specifiers];
            [v5 addObjectsFromArray:v35];
          }
        }

LABEL_32:
        v36 = [(AAUIDataclassViewController *)self account];

        if (v36)
        {
          if (!+[AAUIFeatureFlags isAccountDataclassListRedesignEnabled]|| ![(AAUIiCloudViewController *)self isSecondaryAccount])
          {
            goto LABEL_40;
          }
          v37 = +[PSSpecifier groupSpecifierWithID:@"accountSettingsSpecifier"];
          [v5 addObject:v37];
          v38 = [(AAUIiCloudViewController *)self specifierForAccountSettingsCell];
          [v5 addObject:v38];

          v39 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
          id v40 = [v39 count];

          if (v40)
          {
            v41 = [(AAUISpecifierProvider *)self->_headerSpecifierProvider specifiers];
            [v5 addObjectsFromArray:v41];
          }
        }
        else
        {
          v37 = _AAUILogSystem();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_4920C();
          }
        }

LABEL_40:
        id v42 = [v5 copy];
        id v43 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v4];
        *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v4] = v42;

        goto LABEL_41;
      }
      v13 = +[PSSpecifier groupSpecifierWithName:0];
      id v14 = [(AAUIiCloudViewController *)self groupSpecifierAccountSummary];

      v15 = [(AAUIiCloudViewController *)self specifierForAccountSummaryCell];
      [v5 addObject:v14];
      [v5 addObject:v15];
    }
    else
    {
      id v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_49240();
      }
    }

    goto LABEL_18;
  }
LABEL_41:
  if ([(AAUIiCloudViewController *)self _shouldDisableiCloudUI])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v44 = *(id *)&self->super.ACUIDataclassConfigurationViewController_opaque[v4];
    id v45 = [v44 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v53;
      uint64_t v48 = PSEnabledKey;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v53 != v47) {
            objc_enumerationMutation(v44);
          }
          objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v48, (void)v52);
        }
        id v46 = [v44 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v46);
    }
  }
  v50 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v4];

  return v50;
}

- (id)groupSpecifierAccountSummary
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"identifier" name:0];
  if ([(AAUIiCloudViewController *)self isSecondaryAccount]
    && +[AAUIFeatureFlags isAccountDataclassListRedesignEnabled])
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"PASSWORD_CHANGE_LABEL_SECONDARY_ACCOUNT" value:&stru_76890 table:@"Localizable"];
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = @"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT";
    if (([@"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
    {
      int v8 = 0;
    }
    else
    {
      id v7 = [@"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT" stringByAppendingString:@"_REBRAND"];
      int v8 = 1;
    }
    id v25 = [v6 localizedStringForKey:v7 value:&stru_76890 table:@"Localizable"];
    v15 = +[NSString stringWithFormat:@"%@ %@", v5, v25];

    if (v8) {
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    }
    id v17 = @"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT";
    if (([@"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
    {
      char v26 = 0;
    }
    else
    {
      id v17 = [@"CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT" stringByAppendingString:@"_REBRAND"];
      char v26 = 1;
    }
    v27 = [v16 localizedStringForKey:v17 value:&stru_76890 table:@"Localizable"];
    v31.id location = (NSUInteger)[v15 rangeOfString:v27];
    unsigned int v28 = NSStringFromRange(v31);
    [v3 setProperty:v28 forKey:PSFooterHyperlinkViewLinkRangeKey];

    if ((v26 & 1) == 0) {
      goto LABEL_18;
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"PASSWORD_CHANGE_LABEL" value:&stru_76890 table:@"Localizable"];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = @"CHANGE_PASSWORD_LINK";
  if (([@"CHANGE_PASSWORD_LINK" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v13 = 0;
  }
  else
  {
    v12 = [@"CHANGE_PASSWORD_LINK" stringByAppendingString:@"_REBRAND"];
    int v13 = 1;
  }
  id v14 = [v11 localizedStringForKey:v12 value:&stru_76890 table:@"Localizable"];
  v15 = +[NSString stringWithFormat:@"%@ %@", v10, v14];

  if (v13) {
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  }
  id v17 = @"CHANGE_PASSWORD_LINK";
  if (([@"CHANGE_PASSWORD_LINK" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v18 = 0;
  }
  else
  {
    id v17 = [@"CHANGE_PASSWORD_LINK" stringByAppendingString:@"_REBRAND"];
    int v18 = 1;
  }
  v19 = [v16 localizedStringForKey:v17 value:&stru_76890 table:@"Localizable"];
  v30.id location = (NSUInteger)[v15 rangeOfString:v19];
  v20 = NSStringFromRange(v30);
  [v3 setProperty:v20 forKey:PSFooterHyperlinkViewLinkRangeKey];

  if (v18) {
    goto LABEL_17;
  }
LABEL_18:

  [v3 setProperty:v15 forKey:PSFooterTextGroupKey];
  uint64_t v21 = (objc_class *)objc_opt_class();
  unsigned int v22 = NSStringFromClass(v21);
  [v3 setProperty:v22 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v15 forKey:PSFooterHyperlinkViewTitleKey];
  v23 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v23 forKey:PSFooterHyperlinkViewTargetKey];

  [v3 setProperty:@"_changePasswordLinkWasTapped" forKey:PSFooterHyperlinkViewActionKey];

  return v3;
}

- (void)_changePasswordLinkWasTapped
{
  id v3 = +[NSURL URLWithString:@"https://appleid.apple.com"];
  v2 = +[UIApplication sharedApplication];
  [v2 openURL:v3 withCompletionHandler:0];
}

- (BOOL)_shouldDisableiCloudUI
{
  id v3 = [(AAUIDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(AAUIDataclassViewController *)self account];
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      objc_super v6 = [(AAUIDataclassViewController *)self account];
      id v7 = objc_msgSend(v6, "aa_suspensionInfo");
      unsigned __int8 v4 = [v7 isiCloudSuspended];
    }
    else
    {
      unsigned __int8 v4 = 1;
    }
  }
  return v4;
}

- (id)_iCloudBackupSpecifiers
{
  if (!self->_deviceBackupSpecifiers)
  {
    id v3 = [(AAUISpecifierProvider *)self->_backupSpecifierProvider specifiers];
    id v4 = [v3 count];

    if (v4)
    {
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v6 = [v5 localizedStringForKey:@"DEVICE_BACKUP_GROUP_NAME" value:&stru_76890 table:@"Localizable"];
      id v7 = +[PSSpecifier groupSpecifierWithName:v6];

      v14[0] = v7;
      int v8 = [(AAUISpecifierProvider *)self->_backupSpecifierProvider specifiers];
      uint64_t v9 = [v8 firstObject];
      v14[1] = v9;
      id v10 = +[NSArray arrayWithObjects:v14 count:2];
      deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
      self->_deviceBackupSpecifiers = v10;
    }
  }
  v12 = self->_deviceBackupSpecifiers;

  return v12;
}

- (id)_buildiCloudPlusSpecifiers
{
  if (!self->_iCloudPlusSpecifiers)
  {
    storageSummary = self->_storageSummary;
    id v4 = _AAUILogSystem();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (storageSummary)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Storage summary exist, using it to determine iCloud+ subscriber state.", buf, 2u);
      }

      objc_super v6 = [(ICQCloudStorageSummary *)self->_storageSummary subscriptionInfo];
      unsigned __int8 v7 = [v6 isiCloudPlusSubscriber];

      if (v7)
      {
LABEL_6:
        int v8 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = [v9 localizedStringForKey:@"ICLOUD_PLUS_GROUP_NAME" value:&stru_76890 table:@"Localizable"];
        uint64_t v11 = +[PSSpecifier groupSpecifierWithName:v10];
        [v8 addObject:v11];

        v12 = [(AAUISpecifierProvider *)self->_privateRelaySpecifierProvider specifiers];
        id v13 = [v12 count];

        if (v13)
        {
          id v14 = [(AAUISpecifierProvider *)self->_privateRelaySpecifierProvider specifiers];
          [v8 addObjectsFromArray:v14];
        }
        v15 = [(AAUISpecifierProvider *)self->_hmeSpecifierProvider specifiers];
        id v16 = [v15 count];

        if (v16)
        {
          id v17 = [(AAUISpecifierProvider *)self->_hmeSpecifierProvider specifiers];
          [v8 addObjectsFromArray:v17];
        }
        int v18 = [(AAUISpecifierProvider *)self->_customDomainSpecifierProvider specifiers];
        id v19 = [v18 count];

        if (v19)
        {
          v20 = [(AAUISpecifierProvider *)self->_customDomainSpecifierProvider specifiers];
          [v8 addObjectsFromArray:v20];
        }
        uint64_t v21 = [v8 copy];
        iCloudPlusSpecifiers = self->_iCloudPlusSpecifiers;
        self->_iCloudPlusSpecifiers = v21;

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)char v26 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "No storage summary exist, using CSFFeatureManager to determine iCloud+ subscriber state.", v26, 2u);
      }

      if (+[CSFFeatureManager isCloudSubscriber]) {
        goto LABEL_6;
      }
    }
    int v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v25 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Not an iCloud+ user, will return no iCloud+ specifiers.", v25, 2u);
    }
    goto LABEL_18;
  }
LABEL_19:
  v23 = self->_iCloudPlusSpecifiers;

  return v23;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  BOOL v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(AAUIiCloudViewController *)self navigationController];
    CFStringRef v7 = @"NO";
    if (!v6) {
      CFStringRef v7 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "shouldDeferPush? %@", (uint8_t *)&v11, 0xCu);
  }
  int v8 = [(AAUIiCloudViewController *)self navigationController];
  BOOL v9 = v8 == 0;

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = (void (**)(void))a4;
  int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[AAUIiCloudViewController handleURL:withCompletion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s handleURL with dictionary - %@", buf, 0x16u);
  }

  BOOL v9 = [v6 objectForKeyedSubscript:@"showiCloudDetails"];
  [(AAUIiCloudViewController *)self setShouldShowiCloudDetails:v9 != 0];

  if ([(AAUIiCloudViewController *)self _canHandleURL:v6])
  {
    v7[2](v7);
    uint64_t v10 = [(AAUIiCloudViewController *)self presentedViewController];
    if (v10)
    {
      int v11 = (void *)v10;
      CFStringRef v12 = [(AAUIiCloudViewController *)self presentedViewController];
      id v13 = [v12 parentViewController];

      if (!v13)
      {
        id v14 = [(AAUIiCloudViewController *)self presentedViewController];
        [v14 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
  else
  {
    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Calling superclass handleURL.", buf, 2u);
    }

    v16.receiver = self;
    v16.super_class = (Class)AAUIiCloudViewController;
    [(AAUIiCloudViewController *)&v16 handleURL:v6 withCompletion:v7];
  }
}

- (BOOL)_canHandleURL:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(AAUISpecifierProvider *)self->_headerSpecifierProvider handleURL:v4])
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Header specifier provider handled url: %@";
LABEL_37:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_footerSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Footer specifier provider handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_customDomainSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Custom domain specifier handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_hmeSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s HME specifier handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_privateRelaySpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Private Relay specifier provider handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_dataClassSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s iCloud specifier provider handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_cdpSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s CDP specifier provider handled url: %@";
      goto LABEL_37;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [(AAUISpecifierProvider *)self->_cdpWebSpecifierProvider handleURL:v4])
  }
  {
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s CDP on the web specifier provider handled url: %@";
      goto LABEL_37;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ![(AAUISpecifierProvider *)self->_recommendationsSpecifierProvider handleURL:v4])
    {
      BOOL v7 = 0;
      goto LABEL_39;
    }
    BOOL v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[AAUIiCloudViewController _canHandleURL:]";
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = "%s Recommendations specifier provider handle url: %@";
      goto LABEL_37;
    }
  }

  BOOL v7 = 1;
LABEL_39:

  return v7;
}

- (void)_startObservingQuotaChangeNotifications
{
  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    id v3 = +[NSNotificationCenter defaultCenter];
    id v4 = +[NSOperationQueue mainQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_19CA0;
    v7[3] = &unk_75640;
    objc_copyWeak(&v8, &location);
    BOOL v5 = [v3 addObserverForName:@"QuotaDidChange" object:0 queue:v4 usingBlock:v7];
    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingQuotaChangeNotifications
{
  if (self->_quotaChangeNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_quotaChangeNotificationObserver];

    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = 0;
  }
}

- (void)_startObservingADPStateChangeNotification
{
  if (!self->_ADPStateChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    id v3 = +[NSNotificationCenter defaultCenter];
    id v4 = +[NSOperationQueue currentQueue];
    uint64_t v5 = CDPWalrusStateChangeNotification;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_19F20;
    v8[3] = &unk_75640;
    objc_copyWeak(&v9, &location);
    id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
    id ADPStateChangeNotificationObserver = self->_ADPStateChangeNotificationObserver;
    self->_id ADPStateChangeNotificationObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingADPStateChangeNotification
{
  id v5 = self->_ADPStateChangeNotificationObserver;
  if (v5)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:v5];
  }
  id ADPStateChangeNotificationObserver = self->_ADPStateChangeNotificationObserver;
  self->_id ADPStateChangeNotificationObserver = 0;
}

- (void)_reloadADPStatusAndSpecifierIfNeeded
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_49274();
  }

  objc_initWeak(&location, self);
  id v4 = dispatch_get_global_queue(-32768, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A150;
  v5[3] = &unk_75770;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)_loadCustomDomainSpecifierProvider
{
  id v3 = +[NSBundle aaui_loadBundle:@"MailAccountSettings.bundle" atPath:@"System/Library/PreferenceBundles/AccountSettings"];
  id v4 = NSClassFromString(@"BYODSpecifierProvider");
  if ([(objc_class *)v4 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v5 = [v4 alloc];
    id v6 = [(AAUIDataclassViewController *)self accountManager];
    id v7 = [v5 initWithAccountManager:v6 presenter:self];

    [v7 setDelegate:self];
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_4941C((uint64_t)self, (uint64_t)v3, v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AAUIiCloudViewController *)self specifierForID:@"TIP_GROUP"];
  id v8 = [(AAUIiCloudViewController *)self indexPathForSpecifier:v7];
  if (!v7) {
    goto LABEL_7;
  }
  id v9 = [v7 objectForKeyedSubscript:@"TIP_ORIENTATION"];
  unsigned int v10 = [v9 isEqual:@"UP"];

  if (v10)
  {
    double v11 = 1.0;
    if ([v8 section] == (id)(a4 + 1)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v12 = [v7 objectForKeyedSubscript:@"TIP_ORIENTATION"];
  unsigned int v13 = [v12 isEqual:@"DOWN"];

  if (!v13 || (double v11 = 1.0, [v8 section] != (id)a4))
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)AAUIiCloudViewController;
    [(AAUIiCloudViewController *)&v16 tableView:v6 heightForFooterInSection:a4];
    double v11 = v14;
  }
LABEL_8:

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AAUIiCloudViewController *)self specifierForID:@"TIP_GROUP"];
  id v8 = [(AAUIiCloudViewController *)self indexPathForSpecifier:v7];
  if (!v7) {
    goto LABEL_7;
  }
  id v9 = [v7 objectForKeyedSubscript:@"TIP_ORIENTATION"];
  unsigned int v10 = [v9 isEqual:@"DOWN"];

  if (v10)
  {
    double v11 = 1.0;
    if ([v8 section] == (id)(a4 - 1)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v12 = [v7 objectForKeyedSubscript:@"TIP_ORIENTATION"];
  unsigned int v13 = [v12 isEqual:@"UP"];

  if (!v13 || (double v11 = 1.0, [v8 section] != (id)a4))
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)AAUIiCloudViewController;
    [(AAUIiCloudViewController *)&v16 tableView:v6 heightForHeaderInSection:a4];
    double v11 = v14;
  }
LABEL_8:

  return v11;
}

- (BOOL)_isAccountCleanupUIEnabled
{
  id v2 = objc_alloc_init((Class)CDPWalrusStateController);
  unsigned __int8 v3 = [v2 shouldOpenGate];

  return v3;
}

- (void)setShouldShowiCloudDetails:(BOOL)a3
{
  self->_shouldShowiCloudDetails = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ADPStateChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_iCloudPlusSpecifiers, 0);
  objc_storeStrong((id *)&self->_deviceBackupSpecifiers, 0);
  objc_storeStrong((id *)&self->_recommendationsSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_cdpWebSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_cdpSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_syncWithiCloudTipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_customDomainSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_hmeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_privateRelaySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_footerSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_headerSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_liftUIPresenterDelegate, 0);
  objc_storeStrong(&self->_quotaChangeNotificationObserver, 0);

  objc_storeStrong((id *)&self->_storageSummary, 0);
}

@end