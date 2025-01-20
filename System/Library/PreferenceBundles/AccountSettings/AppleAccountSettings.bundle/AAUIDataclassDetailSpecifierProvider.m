@interface AAUIDataclassDetailSpecifierProvider
- (AAUIDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_shouldShowSyncingToDriveGroupSpecifier;
- (BOOL)isDataclassLDMDisabled;
- (Class)_cloudMessageDetailControllerClass;
- (NSArray)specifiers;
- (NSString)dataclass;
- (id)_fetchNumberOfAppsSyncingToDrive:(id)a3;
- (id)_fetchStorageUsed:(id)a3;
- (id)_headerGroupSpecifiers;
- (id)_iconForDataclass:(id)a3;
- (id)_loadHealthSpecifierProvider;
- (id)_specifierAttributedLink;
- (id)_specifierForHealth;
- (id)_specifierSubTitle;
- (id)_specifierSwitchState:(id)a3;
- (id)_specifierTitle;
- (id)_storageUsedGroupSpecifiers;
- (id)_switchSpecifierWithTitle:(id)a3;
- (id)_syncingToDriveGroupSpecifiers;
- (id)_toggleValue:(id)a3;
- (id)account;
- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)ubiquityProviderGetAccountOperationsHelper;
- (void)_setValue:(id)a3 forSpecifier:(id)a4;
- (void)_setupAppsSyncingToDriveSpecifier:(id)a3;
- (void)_setupStorageUsedSpecifier:(id)a3;
- (void)_storageUsedWasTapped:(id)a3;
- (void)setDataclass:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)ubiquityProviderShowViewController:(id)a3;
@end

@implementation AAUIDataclassDetailSpecifierProvider

- (AAUIDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUIDataclassDetailSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (AAUIDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIDataclassDetailSpecifierProvider;
  v9 = [(AAUIDataclassDetailSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
    *(void *)&v10->_isStorageUsedRequestInProgress = 0xFFFFFFFF00000000;
  }

  return v10;
}

- (void)setDataclass:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_dataclass, a3);
  if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassHealth])
  {
    v5 = [(AAUIDataclassDetailSpecifierProvider *)self _loadHealthSpecifierProvider];
    healthSpecifierProvider = self->_healthSpecifierProvider;
    self->_healthSpecifierProvider = v5;
  }
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (void)setSpecifiers:(id)a3
{
  v4 = (NSArray *)a3;
  appCloudStorage = self->_appCloudStorage;
  self->_appCloudStorage = 0;

  specifiers = self->_specifiers;
  self->_specifiers = v4;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (self->_dataclass)
    {
      id v4 = objc_alloc_init((Class)NSMutableArray);
      v5 = [(AAUIDataclassDetailSpecifierProvider *)self _headerGroupSpecifiers];
      [v4 addObjectsFromArray:v5];

      v6 = [(AAUIDataclassDetailSpecifierProvider *)self _storageUsedGroupSpecifiers];
      [v4 addObjectsFromArray:v6];

      if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassUbiquity])
      {
        id v7 = [(AAUIDataclassDetailSpecifierProvider *)self account];
        unsigned int v8 = [v7 isEnabledForDataclass:self->_dataclass];

        if (v8)
        {
          v9 = [(AAUIDataclassDetailSpecifierProvider *)self _syncingToDriveGroupSpecifiers];
          [v4 addObjectsFromArray:v9];
        }
      }
      v10 = (NSArray *)[v4 copy];
      v11 = self->_specifiers;
      self->_specifiers = v10;

      specifiers = self->_specifiers;
    }
    else
    {
      specifiers = 0;
    }
  }

  return specifiers;
}

- (id)_headerGroupSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier groupSpecifierWithID:@"DATACLASS_HEADER_GROUP"];
  [v3 addObject:v4];

  v5 = [(AAUIDataclassDetailSpecifierProvider *)self _specifierTitle];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v7 = [(AAUIDataclassDetailSpecifierProvider *)self _specifierTitle];
  [v6 setProperty:v7 forKey:PSTitleKey];

  unsigned int v8 = [(AAUIDataclassDetailSpecifierProvider *)self _specifierSubTitle];
  [v6 setProperty:v8 forKey:PSTableCellSubtitleTextKey];

  v9 = [(AAUIDataclassDetailSpecifierProvider *)self _specifierAttributedLink];
  [v6 setProperty:v9 forKey:AAUIDataclassAttributedLink];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"LEARN_MORE_CTA" value:&stru_76890 table:@"Localizable"];
  [v6 setObject:v11 forKeyedSubscript:AAUIDataclassAttributedLinkText];

  [v6 setProperty:&off_79DB8 forKey:PSAlignmentKey];
  objc_super v12 = [(AAUIDataclassDetailSpecifierProvider *)self _iconForDataclass:self->_dataclass];
  [v6 setProperty:v12 forKey:PSIconImageKey];

  [v3 addObject:v6];
  id v13 = objc_alloc_init((Class)AADeviceInfo);
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
  v16 = [v14 localizedStringForKey:v15 value:&stru_76890 table:@"Localizable"];

  if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassUbiquity])
  {
    v17 = [[AAUIUbiquitySpecifierProvider alloc] initWithAccountManager:self->_accountManager];
    ubiquitySpecifierProvider = self->_ubiquitySpecifierProvider;
    self->_ubiquitySpecifierProvider = v17;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setDelegate:WeakRetained];

    [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setUbiquityDelegate:self];
    v20 = [(AAUIUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider ubiquityDataclassSwitchSpecifer];
    if (!v20) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t v21 = ACAccountDataclassHealth;
  if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassHealth])
  {
    v20 = [(AAUIDataclassDetailSpecifierProvider *)self _specifierForHealth];
    [v20 setName:v16];
    if (!v20)
    {
LABEL_6:
      uint64_t v21 = ACAccountDataclassHealth;
      goto LABEL_7;
    }
LABEL_9:
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [v3 addObject:v20];

    goto LABEL_10;
  }
LABEL_7:
  if (![(NSString *)self->_dataclass isEqualToString:v21])
  {
    v20 = [(AAUIDataclassDetailSpecifierProvider *)self _switchSpecifierWithTitle:v16];
    if (v20) {
      goto LABEL_9;
    }
  }
LABEL_10:
  id v22 = [v3 copy];

  return v22;
}

- (id)_switchSpecifierWithTitle:(id)a3
{
  id v4 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:"_setValue:forSpecifier:" get:"_toggleValue:" detail:0 cell:6 edit:0];
  v5 = +[NSNumber numberWithBool:[(AAUIDataclassDetailSpecifierProvider *)self isDataclassLDMDisabled] ^ 1];
  [v4 setObject:v5 forKeyedSubscript:PSEnabledKey];

  [v4 setObject:self->_dataclass forKeyedSubscript:PSIDKey];
  [v4 setObject:self->_dataclass forKeyedSubscript:@"com.apple.accountsui.dataclass"];

  return v4;
}

- (BOOL)isDataclassLDMDisabled
{
  id v3 = +[LockdownModeManager shared];
  unsigned int v4 = [v3 enabled];

  return v4 && [(NSString *)self->_dataclass isEqualToString:kAccountDataclassMessages];
}

- (id)_iconForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ACAccountDataclassHealth;
  if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassHealth]
    && (+[AADataclassManager sharedManager],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 appIsNeitherInstalledOrPlaceholder:v5],
        v6,
        v7))
  {
    unsigned int v8 = +[PKIconImageCache settingsIconCache];
    v9 = [v8 imageForKey:PKHealthDataIconKey];
  }
  else
  {
    unsigned int v8 = +[AADataclassManager sharedManager];
    v10 = [v8 appBundleIdentifierForDataclass:v4];
    v9 = +[UIImage imageForDataclassWithBundleID:v10];
  }
  if (!v9)
  {
    v9 = +[PSSpecifier acui_iconForDataclass:self->_dataclass];
  }

  return v9;
}

- (id)_storageUsedGroupSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"STORAGE_USED" value:&stru_76890 table:@"Localizable"];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"_fetchStorageUsed:" detail:0 cell:-1 edit:0];

  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  [(AAUIDataclassDetailSpecifierProvider *)self _setupStorageUsedSpecifier:v5];
  v6 = +[PSSpecifier groupSpecifierWithID:@"DATACLASS_STORAGE_USED_GROUP"];
  v9[0] = v6;
  v9[1] = v5;
  unsigned int v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (void)_setupStorageUsedSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICQAppCloudStorage *)self->_appCloudStorage storageUsed];

  if (v5)
  {
    v6 = [(ICQAppCloudStorage *)self->_appCloudStorage storageUsed];
    uint64_t v7 = (uint64_t)[v6 longLongValue];
  }
  else
  {
    uint64_t v7 = -1;
  }
  unsigned int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dataclass = self->_dataclass;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = dataclass;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Setting up %@ storage used specifier with storage used %lld", buf, 0x16u);
  }

  if (v7 < 1)
  {
    if (v7)
    {
      [v4 setCellType:2];
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
      objc_super v12 = +[NSNumber numberWithInt:!self->_storageUsedRequestDidError];
      [v4 setObject:v12 forKeyedSubscript:PSControlIsLoadingKey];
    }
    else
    {
      [v4 setCellType:-1];
      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSControlIsLoadingKey];
    }
  }
  else
  {
    [v4 setCellType:2];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
    [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSControlIsLoadingKey];
    if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassHealth])
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2050000000;
      v10 = (void *)qword_90010;
      uint64_t v16 = qword_90010;
      if (!qword_90010)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_2E0DC;
        v18 = &unk_75298;
        v19 = &v13;
        sub_2E0DC((uint64_t)buf);
        v10 = (void *)v14[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v13, 8);
      objc_msgSend(v4, "setDetailControllerClass:", v11, v13);
    }
    else if ([(NSString *)self->_dataclass isEqualToString:ACAccountDataclassMessages])
    {
      objc_msgSend(v4, "setDetailControllerClass:", -[AAUIDataclassDetailSpecifierProvider _cloudMessageDetailControllerClass](self, "_cloudMessageDetailControllerClass"));
    }
    else
    {
      [v4 setControllerLoadAction:"_storageUsedWasTapped:"];
    }
  }
}

- (void)_setupAppsSyncingToDriveSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int numberOfAppsSyncingToDrive = self->_numberOfAppsSyncingToDrive;
    v11[0] = 67109120;
    v11[1] = numberOfAppsSyncingToDrive;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Setting up apps syncing to drive specifier with number of apps syncing: %d", (uint8_t *)v11, 8u);
  }

  int v7 = self->_numberOfAppsSyncingToDrive;
  if (v7 < 1)
  {
    if (v7)
    {
      [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
      [v4 setCellType:2];
      v10 = +[NSNumber numberWithInt:!self->_appsSyncingToDriveRequestDidError];
      [v4 setObject:v10 forKeyedSubscript:PSControlIsLoadingKey];

      goto LABEL_8;
    }
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
    unsigned int v8 = v4;
    uint64_t v9 = -1;
  }
  else
  {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
    unsigned int v8 = v4;
    uint64_t v9 = 2;
  }
  [v8 setCellType:v9];
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSControlIsLoadingKey];
LABEL_8:
}

- (id)_syncingToDriveGroupSpecifiers
{
  if ([(AAUIDataclassDetailSpecifierProvider *)self _shouldShowSyncingToDriveGroupSpecifier])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"APPS_SYNCING_TO_DRIVE_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
    uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"_fetchNumberOfAppsSyncingToDrive:" detail:objc_opt_class() cell:2 edit:0];

    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
    [(AAUIDataclassDetailSpecifierProvider *)self _setupAppsSyncingToDriveSpecifier:v5];
    [v5 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    v6 = +[PSSpecifier groupSpecifierWithID:@"DATACLASS_DRIVE_GROUP"];
    v9[0] = v6;
    v9[1] = v5;
    int v7 = +[NSArray arrayWithObjects:v9 count:2];
  }
  else
  {
    int v7 = &__NSArray0__struct;
  }

  return v7;
}

- (BOOL)_shouldShowSyncingToDriveGroupSpecifier
{
  id v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  uint64_t v5 = +[AADataclassManager sharedManager];
  if ([v5 shouldShowSpecifierForDataclass:self->_dataclass forAccount:v4]) {
    unsigned __int8 v6 = objc_msgSend(v4, "aa_isAccountClass:", AAAccountClassPrimary);
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_toggleValue:(id)a3
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
      v10 = [(AAUIDataclassDetailSpecifierProvider *)self account];
      id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isEnabledForDataclass:self->_dataclass]);

      goto LABEL_8;
    }
  }
  else
  {
    objc_super v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_48480((id *)p_delegate, v12);
    }
  }
  id v11 = &__kCFBooleanFalse;
LABEL_8:

  return v11;
}

- (id)_specifierTitle
{
  v2 = +[AAUIDataclassHelper localizedTitleForDataclass:self->_dataclass];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_76890 table:@"Localizable"];
  }

  return v4;
}

- (id)_specifierSubTitle
{
  id v3 = [(AAUIDataclassDetailSpecifierProvider *)self account];
  id v4 = objc_msgSend(v3, "ams_securityLevel");

  dataclass = self->_dataclass;
  unsigned __int8 v6 = [(AAUIDataclassDetailSpecifierProvider *)self account];
  char v7 = +[AAUIDataclassHelper localizedSubTitleForDataclass:dataclass idmsAccount:v6 securityLevel:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    unsigned __int8 v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v9 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_76890 table:@"Localizable"];
  }

  return v8;
}

- (id)_specifierAttributedLink
{
  v2 = +[AAUIDataclassHelper attributedLinkForDataclass:self->_dataclass];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"UNDEFINED_DATACLASS" value:&stru_76890 table:@"Localizable"];
  }

  return v4;
}

- (id)_fetchNumberOfAppsSyncingToDrive:(id)a3
{
  id v4 = a3;
  if (self->_appsSyncingToDrive)
  {
    uint64_t v5 = +[NSString localizedStringWithFormat:@"%d", self->_numberOfAppsSyncingToDrive];
    goto LABEL_12;
  }
  if (self->_isAppsSyncingToDriveRequestInProgress)
  {
    unsigned __int8 v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v7 = "Apps syncing to drive request is already in progress. Bailing.";
LABEL_9:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    if (!self->_appsSyncingToDriveRequestDidError)
    {
      self->_isAppsSyncingToDriveRequestInProgress = 1;
      id v8 = objc_alloc((Class)ICQCloudStorageDataController);
      unsigned __int8 v9 = [(AAUIDataclassDetailSpecifierProvider *)self account];
      unsigned __int8 v6 = [v8 initWithAccount:v9];

      [v6 setShouldIgnoreCache:1];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_2D250;
      v13[3] = &unk_75F10;
      v13[4] = self;
      id v14 = objc_alloc_init((Class)NSMutableSet);
      id v15 = objc_alloc_init((Class)NSMutableSet);
      id v16 = v4;
      id v10 = v15;
      id v11 = v14;
      [v6 fetchAppsSyncingToiCloudDriveWithCompletion:v13];

      goto LABEL_11;
    }
    unsigned __int8 v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v7 = "Apps syncing to drive request got an error. Bailing.";
      goto LABEL_9;
    }
  }
LABEL_11:

  uint64_t v5 = 0;
LABEL_12:

  return v5;
}

- (id)_fetchStorageUsed:(id)a3
{
  id v4 = a3;
  appCloudStorage = self->_appCloudStorage;
  if (appCloudStorage)
  {
    unsigned __int8 v6 = [(ICQAppCloudStorage *)appCloudStorage storageUsed];
    [v6 longLongValue];

    char v7 = NSLocalizedFileSizeDescription();
    goto LABEL_12;
  }
  if (self->_isStorageUsedRequestInProgress)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v9 = "Storage used request is already in progress. Bailing.";
LABEL_9:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
  }
  else
  {
    if (!self->_storageUsedRequestDidError)
    {
      self->_isStorageUsedRequestInProgress = 1;
      self->_storageUsedRequestDidError = 0;
      id v11 = objc_alloc((Class)ICQCloudStorageDataController);
      objc_super v12 = [(AAUIDataclassDetailSpecifierProvider *)self account];
      id v13 = [v11 initWithAccount:v12];

      [v13 setShouldIgnoreCache:1];
      id v14 = +[AADataclassManager sharedManager];
      id v15 = [v14 appBundleIdentifierForDataclass:self->_dataclass];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_2D72C;
      v16[3] = &unk_75F38;
      v16[4] = self;
      id v17 = v4;
      [v13 fetchStorageByApp:v15 completion:v16];

      goto LABEL_11;
    }
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v9 = "Storage used request got an error. Bailing.";
      goto LABEL_9;
    }
  }

LABEL_11:
  char v7 = 0;
LABEL_12:

  return v7;
}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:PSIDKey];
  unsigned int v9 = [v8 isEqualToString:ACAccountDataclassHealth];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if (v9)
  {
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_2DA10;
      v14[3] = &unk_75108;
      id v15 = v6;
      id v16 = v7;
      [v13 validateDataclassAccessForProvider:self specifier:v16 completion:v14];
    }
  }
  else
  {
    [WeakRetained specifierProvider:self dataclassSwitchStateDidChange:v6 withSpecifier:v7];
  }
}

- (void)_storageUsedWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AADataclassManager sharedManager];
  id v12 = [v5 appBundleIdentifierForDataclass:self->_dataclass];

  id v6 = objc_alloc((Class)ICQUIStorageUsedController);
  id v7 = [(AAUIDataclassDetailSpecifierProvider *)self account];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  unsigned int v9 = [WeakRetained navigationController];
  id v10 = (ICQUIStorageUsedController *)[v6 initWithAppBundleID:v12 account:v7 navigationController:v9];
  storageUsedController = self->_storageUsedController;
  self->_storageUsedController = v10;

  [(ICQUIStorageUsedController *)self->_storageUsedController beginLoadingForSpecifier:v4];
}

- (id)_specifierForHealth
{
  id v3 = [(AAUISpecifierProvider *)self->_healthSpecifierProvider specifiers];
  id v4 = [v3 firstObject];

  objc_msgSend(v4, "aaui_overrideAccessorsWithTarget:getter:setter:", self, "_specifierSwitchState:", "_setValue:forSpecifier:");

  return v4;
}

- (id)_specifierSwitchState:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if ([WeakRetained specifierProvider:self isDataclassAvailableForSpecifier:v4])
    {
      id v6 = objc_msgSend(v4, "aaui_performSuperGetter");
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_4A1FC((uint64_t)WeakRetained, v7);
    }
  }
  id v6 = &__kCFBooleanFalse;
LABEL_8:

  return v6;
}

- (id)_loadHealthSpecifierProvider
{
  id v3 = +[NSBundle aaui_loadBundle:@"HealthDataclassOwnerPlugin.bundle" atPath:@"System/Library/Accounts/DataclassOwners"];
  id v4 = [(AAUIDataclassDetailSpecifierProvider *)self loadSpecifierProviderWithClassName:@"HKHealthDataclassSpecifierProvider" inBundle:v3];

  return v4;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v9 = [[v8 alloc] initWithAccountManager:self->_accountManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 setDelegate:WeakRetained];
  }
  else
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543874;
      id v14 = self;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    id v9 = 0;
  }

  return v9;
}

- (Class)_cloudMessageDetailControllerClass
{
  id v2 = +[NSBundle aaui_loadBundle:@"CKStoragePlugin.bundle" atPath:@"System/Library/PreferenceBundles/StoragePlugins"];

  return NSClassFromString(@"CKCloudMessagesDetailController");
}

- (id)ubiquityProviderGetAccountOperationsHelper
{
  p_presenter = &self->_presenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)p_presenter);
    id v6 = [v5 accountOperationsHelper];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)ubiquityProviderShowViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained specifierProvider:self showViewController:v5];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_healthSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageUsedController, 0);
  objc_storeStrong((id *)&self->_appsSyncingToDrive, 0);
  objc_storeStrong((id *)&self->_appCloudStorage, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end