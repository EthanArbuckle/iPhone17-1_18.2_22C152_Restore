@interface StoreSettingsController
- (BOOL)_isSignedIn;
- (BOOL)_shouldShowCellularDataSwitch;
- (BOOL)_shouldShowSpecifierForAutomaticDownloadKinds:(id)a3;
- (BOOL)client:(id)a3 openInternalURL:(id)a4;
- (BOOL)client:(id)a3 presentAccountViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)client:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)isAutoPlayVideoProhibited;
- (PSSystemPolicyForApp)systemPolicy;
- (StoreSettingsController)init;
- (id)_appStoreCellularDataSettingForSpecifier:(id)a3;
- (id)_automaticDownloadConfigurations;
- (id)_automaticDownloadsEnabled:(id)a3;
- (id)_automaticUpdatesEnabled:(id)a3;
- (id)_backgroundAssetDownloadsEnabled:(id)a3;
- (id)_bagContext;
- (id)_cellularNetworkEnabled:(id)a3;
- (id)_cellularSettings;
- (id)_copyAutomaticDownloadSpecifiers;
- (id)_copyCopyCellularDownloadSpecifiers;
- (id)_copyPrivacyGroupSpecifiersSignedIn:(BOOL)a3;
- (id)_copySignedInSpecifiers;
- (id)_copySignedOutSpecifiers;
- (id)_copySystemPolicySpecifiers;
- (id)_enabledAutomaticDownloadKinds;
- (id)_formattedNetworkLimit;
- (id)_inAppReviewEnabled:(id)a3;
- (id)_newAppStoreVideoGroupSpecifier;
- (id)_newAppStoreVideoSpecifier;
- (id)_newAutomaticDownloadSpecifierWithConfiguration:(id)a3;
- (id)_newAutomaticUpdatesSpecifier;
- (id)_newBackgroundAssetDownloadsSpecifier;
- (id)_newCellularDataGroupSpecifier;
- (id)_newCellularDataSwitchSpecifier;
- (id)_newInAppReviewGroupSpecifier;
- (id)_newInAppReviewSwitchSpecifier;
- (id)_newLinkSpecifierWithName:(id)a3 detailControllerClass:(Class)a4;
- (id)_newOffloadUnusedAppsGroupSpecifier;
- (id)_newOffloadUnusedAppsSwitchSpecifier;
- (id)_newSwitchSpecifierWithName:(id)a3;
- (id)_offloadUnusedAppsEnabled:(id)a3;
- (id)_settingsBag;
- (id)_showInstallConfirmationEnabled:(id)a3;
- (id)_showInstallConfirmationsGroupSpecifier;
- (id)_showInstallConfirmationsSpecifier;
- (id)appStoreVideoSettingForSpecifier:(id)a3;
- (id)autoPlayVideoSetting;
- (id)specifiers;
- (id)storeFrontDefaultAutoPlayVideoSetting;
- (id)topViewControllerForClient:(id)a3;
- (void)_accountsChangedNotification:(id)a3;
- (void)_appDistributorsOrTrustedDevelopersChangedNotification:(id)a3;
- (void)_automaticDownloadKindsChangedNotification:(id)a3;
- (void)_buttonActionRecommendations:(id)a3;
- (void)_carrierSettingsChangedNotification:(id)a3;
- (void)_fetchInitialAutomaticSoftwareDownloadValue;
- (void)_getAutomaticSoftwareDownloadValueWithCompletion:(id)a3;
- (void)_loadUserSpecificURLBag;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_reloadAutomaticDownloadConfigurations;
- (void)_reloadForAutomaticDownloadKindsChange;
- (void)_reloadForLowPowerModeChange;
- (void)_reloadMarketplaceVariables;
- (void)_reloadUI;
- (void)_setAutomaticDownloadsEnabled:(BOOL)a3 forKind:(id)a4 withCompletion:(id)a5;
- (void)_setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4;
- (void)_setAutomaticUpdatesEnabled:(id)a3 specifier:(id)a4;
- (void)_setBackgroundAssetDownloadsEnabled:(id)a3 specifier:(id)a4;
- (void)_setCellularNetworkingEnabled:(id)a3 specifier:(id)a4;
- (void)_setCellularPolicyEnabled:(id)a3;
- (void)_setInAppReviewEnabled:(id)a3 specifier:(id)a4;
- (void)_setOffloadUnusedApps:(id)a3 specifier:(id)a4;
- (void)_setShowInstallConfirmationEnabled:(id)a3 specifier:(id)a4;
- (void)_showAccountSheetWithViewController:(id)a3 animated:(BOOL)a4;
- (void)_showPrivacySheet:(id)a3;
- (void)_updateCellularPolicy;
- (void)_urlBagDidLoadNotification:(id)a3;
- (void)appDataUsagePolicyChange:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)loadView;
- (void)setSystemPolicy:(id)a3;
- (void)updateAutoPlayVideoDefaultSettingsIfNecessary;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation StoreSettingsController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[SUClient sharedClient];
  [v5 setDelegate:self];
  [(StoreSettingsController *)self _loadUserSpecificURLBag];
  [(StoreSettingsController *)self _reloadUI];
  v6.receiver = self;
  v6.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v6 viewWillAppear:v3];
}

- (void)_loadUserSpecificURLBag
{
  id v6 = [(StoreSettingsController *)self _bagContext];
  v2 = [v6 userIdentifier];

  if (v2)
  {
    id v3 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v6];
    v4 = +[ISOperationQueue mainQueue];
    [v4 addOperation:v3];

    v5 = +[SSDevice currentDevice];
    [v5 synchronizeAutomaticDownloadKinds];
  }
}

- (id)_bagContext
{
  v2 = +[SSURLBagContext contextWithBagType:0];
  id v3 = +[SSAccountStore defaultStore];
  v4 = [v3 activeAccount];

  v5 = +[SSDevice currentDevice];
  id v6 = [v5 userAgent];
  [v2 setValue:v6 forHTTPHeaderField:SSHTTPHeaderUserAgent];

  v7 = SSVStoreFrontIdentifierForAccount();
  [v2 setValue:v7 forHTTPHeaderField:SSHTTPHeaderXAppleStoreFront];

  v8 = [v4 uniqueIdentifier];
  [v2 setUserIdentifier:v8];

  return v2;
}

- (id)_copyCopyCellularDownloadSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(StoreSettingsController *)self _shouldShowCellularDataSwitch]
    && !self->_hasMultipleMarketplaces)
  {
    id v4 = [(StoreSettingsController *)self _newCellularDataGroupSpecifier];
    [v3 addObject:v4];
    id v5 = [(StoreSettingsController *)self _newCellularDataSwitchSpecifier];

    [v3 addObject:v5];
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"AUTO_DOWNLOAD_APPS" value:&stru_14C40 table:@"StoreSettings"];
    v8 = [(StoreSettingsController *)self _newLinkSpecifierWithName:v7 detailControllerClass:objc_opt_class()];

    [v8 setCellType:2];
    *(void *)&v8[OBJC_IVAR___PSSpecifier_getter] = "_appStoreCellularDataSettingForSpecifier:";
    if (!self->_isCellularPolicyEnabled) {
      [v8 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
    [v3 addObject:v8];
  }
  return v3;
}

- (id)_newCellularDataSwitchSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"AUTO_DOWNLOAD_ON_CELL" value:&stru_14C40 table:@"StoreSettings"];
  id v5 = [(StoreSettingsController *)self _newSwitchSpecifierWithName:v4];

  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "_cellularNetworkEnabled:";
  *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "_setCellularNetworkingEnabled:specifier:";
  [v5 setTarget:self];
  if (!self->_isCellularPolicyEnabled) {
    [v5 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  return v5;
}

- (id)_newSwitchSpecifierWithName:(id)a3
{
  id v4 = a3;
  id v5 = (char *)objc_alloc_init((Class)PSSpecifier);
  *(void *)&v5[OBJC_IVAR___PSSpecifier_cellType] = 6;
  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "readPreferenceValue:";
  *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "setPreferenceValue:specifier:";
  [v5 setTarget:self];
  [v5 setName:v4];

  return v5;
}

- (id)_newLinkSpecifierWithName:(id)a3 detailControllerClass:(Class)a4
{
  id v6 = a3;
  v7 = (char *)objc_alloc_init((Class)PSSpecifier);
  *(void *)&v7[OBJC_IVAR___PSSpecifier_cellType] = 1;
  *(void *)&v7[OBJC_IVAR___PSSpecifier_detailControllerClass] = a4;
  [v7 setTarget:self];
  [v7 setName:v6];

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    if ([(StoreSettingsController *)self _isSignedIn]) {
      id v5 = [(StoreSettingsController *)self _copySignedInSpecifiers];
    }
    else {
      id v5 = [(StoreSettingsController *)self _copySignedOutSpecifiers];
    }
    id v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (BOOL)_isSignedIn
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = objc_msgSend(v3, "ams_DSID");
  if (v4)
  {
    id v5 = [v3 username];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_copySignedInSpecifiers
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(StoreSettingsController *)self _copySystemPolicySpecifiers];
  id v5 = [v3 initWithArray:v4];

  id v6 = [(StoreSettingsController *)self _copyAutomaticDownloadSpecifiers];
  if ([v6 count])
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"AUTO_DOWNLOADS_HEADER" value:&stru_14C40 table:@"StoreSettings"];
    v9 = +[PSSpecifier groupSpecifierWithName:v8];

    if (self->_isLowPowerMode)
    {
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"AUTO_DOWNLOADS_LPM" value:&stru_14C40 table:@"StoreSettings"];
    }
    else
    {
      v11 = 0;
    }
    [v9 setProperty:v11 forKey:PSFooterTextGroupKey];
    [v5 addObject:v9];
    [v5 addObjectsFromArray:v6];
  }
  id v12 = [(StoreSettingsController *)self _copyCopyCellularDownloadSpecifiers];
  if ([v12 count]) {
    [v5 addObjectsFromArray:v12];
  }
  if (![(StoreSettingsController *)self isAutoPlayVideoProhibited])
  {
    id v13 = [(StoreSettingsController *)self _newAppStoreVideoGroupSpecifier];
    [v5 addObject:v13];
    id v14 = [(StoreSettingsController *)self _newAppStoreVideoSpecifier];

    [v5 addObject:v14];
  }
  id v15 = [(StoreSettingsController *)self _newInAppReviewGroupSpecifier];
  [v5 addObject:v15];
  id v16 = [(StoreSettingsController *)self _newInAppReviewSwitchSpecifier];

  [v5 addObject:v16];
  if (!self->_hasMultipleMarketplaces)
  {
    id v17 = [(StoreSettingsController *)self _newOffloadUnusedAppsGroupSpecifier];

    [v5 addObject:v17];
    id v16 = [(StoreSettingsController *)self _newOffloadUnusedAppsSwitchSpecifier];

    [v5 addObject:v16];
  }
  if (self->_hasEverHadMultipleMarketplaces)
  {
    v18 = [(StoreSettingsController *)self _showInstallConfirmationsGroupSpecifier];

    [v5 addObject:v18];
    id v16 = [(StoreSettingsController *)self _showInstallConfirmationsSpecifier];

    [v5 addObject:v16];
  }
  id v19 = [(StoreSettingsController *)self _copyPrivacyGroupSpecifiersSignedIn:1];
  [v5 addObjectsFromArray:v19];

  return v5;
}

- (id)_newInAppReviewSwitchSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"IN_APP_REVIEW_ON_CELL" value:&stru_14C40 table:@"StoreSettings"];
  id v5 = [(StoreSettingsController *)self _newSwitchSpecifierWithName:v4];

  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "_inAppReviewEnabled:";
  *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "_setInAppReviewEnabled:specifier:";
  [v5 setTarget:self];
  return v5;
}

- (BOOL)isAutoPlayVideoProhibited
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [&off_15868 containsObject:v2];

  return v3;
}

- (id)_newOffloadUnusedAppsGroupSpecifier
{
  v2 = +[PSSpecifier emptyGroupSpecifier];
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"OFFLOAD_UNUSED_APPS_ON_CELL_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  return v2;
}

- (id)_newInAppReviewGroupSpecifier
{
  v2 = +[PSSpecifier emptyGroupSpecifier];
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"IN_APP_REVIEW_ON_CELL_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  return v2;
}

- (id)_newCellularDataGroupSpecifier
{
  unsigned __int8 v3 = +[PSSpecifier groupSpecifierWithID:@"CELLULAR_GROUP_ID"];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CELLULAR_DATA_HEADER" value:&stru_14C40 table:@"StoreSettings"];
  [v3 setName:v5];

  id v6 = [(StoreSettingsController *)self _cellularSettings];
  v7 = [(StoreSettingsController *)self _formattedNetworkLimit];
  if ([v6 cellularDataPrompt] == (char *)&dword_0 + 2)
  {
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = v8;
    CFStringRef v10 = @"ALWAYS_ALLOW_EXPLANATION";
LABEL_7:
    v11 = [v8 localizedStringForKey:v10 value:&stru_14C40 table:@"StoreSettings"];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);
    [v3 setProperty:v12 forKey:PSFooterTextGroupKey];

    goto LABEL_8;
  }
  if (![v6 cellularDataPrompt])
  {
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = v8;
    CFStringRef v10 = @"UNDER_XXX_MB_EXPLANATION_%@";
    goto LABEL_7;
  }
  if ([v6 cellularDataPrompt] == (char *)&dword_0 + 1)
  {
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v9 localizedStringForKey:@"ASK_FIRST_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
    [v3 setProperty:v11 forKey:PSFooterTextGroupKey];
LABEL_8:
  }
  return v3;
}

- (id)_formattedNetworkLimit
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LastNetworkLimit", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  id v4 = (id)AppIntegerValue;
  if (keyExistsAndHasValidFormat) {
    uint64_t v5 = AppIntegerValue;
  }
  else {
    uint64_t v5 = 200000000;
  }
  id v6 = [(StoreSettingsController *)self _bagContext];
  v7 = +[ISURLBagCache sharedCache];
  v8 = [v7 URLBagForContext:v6];

  v9 = [v8 networkConstraintsForDownloadKind:@"software"];
  id v10 = [v9 sizeLimitForNetworkType:3];
  if (v10 != v4 && v10 != 0)
  {
    uint64_t v12 = (uint64_t)v10;
    CFPreferencesSetAppValue(@"LastNetworkLimit", +[NSNumber numberWithUnsignedLongLong:v10], @"com.apple.appstored");
    uint64_t v5 = v12;
  }
  id v13 = +[NSByteCountFormatter stringFromByteCount:v5 countStyle:2];

  return v13;
}

- (StoreSettingsController)init
{
  v20.receiver = self;
  v20.super_class = (Class)StoreSettingsController;
  v2 = [(StoreSettingsController *)&v20 init];
  if (v2)
  {
    unsigned __int8 v3 = +[SUClient sharedClient];

    if (!v3)
    {
      id v4 = objc_alloc_init((Class)SUClient);
      uint64_t v5 = objc_alloc_init(SUSettingsViewControllerFactory);
      [v4 setViewControllerFactory:v5];
      +[SUClient setSharedClient:v4];
    }
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_carrierSettingsChangedNotification:" name:ISCarrierSettingsDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_networkTypeChangedNotification:" name:ISNetworkTypeChangedNotification object:0];
    [v6 addObserver:v2 selector:"_urlBagDidLoadNotification:" name:ISURLBagDidLoadNotification object:0];
    [v6 addObserver:v2 selector:"_accountsChangedNotification:" name:ACDAccountStoreDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_automaticDownloadKindsChangedNotification:" name:SSDeviceAutomaticDownloadKindsChangedNotification object:0];
    [v6 addObserver:v2 selector:"_lowPowerModeChangedNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];
    v7 = +[MarketplaceKitWrapper AppDistributorsOrTrustedDevelopersChangedNotification];
    [v6 addObserver:v2 selector:"_appDistributorsOrTrustedDevelopersChangedNotification:" name:v7 object:0];

    if ([(StoreSettingsController *)v2 _shouldShowCellularDataSwitch])
    {
      v8 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
      telephonyClient = v2->_telephonyClient;
      v2->_telephonyClient = v8;

      [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
      [(StoreSettingsController *)v2 _updateCellularPolicy];
    }
    v2->_cellularNetworkingAllowed = -1;
    [(StoreSettingsController *)v2 _reloadAutomaticDownloadConfigurations];
    id v10 = +[SSAccountStore defaultStore];
    v11 = +[NSProcessInfo processInfo];
    v2->_isLowPowerMode = [v11 isLowPowerModeEnabled];

    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.appstored.StoreSettingsManager.dispatch", v12);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v13;

    [(StoreSettingsController *)v2 _reloadMarketplaceVariables];
    [(StoreSettingsController *)v2 _fetchInitialAutomaticSoftwareDownloadValue];
    id v15 = +[ACAccountStore ams_sharedAccountStore];
    id v16 = objc_msgSend(v15, "ams_activeiTunesAccount");
    uint64_t v17 = objc_msgSend(v16, "ams_DSID");
    currentAccountDSID = v2->_currentAccountDSID;
    v2->_currentAccountDSID = (NSNumber *)v17;
  }
  return v2;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ISCarrierSettingsDidChangeNotification object:0];
  [v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  [v3 removeObserver:self name:ISURLBagDidLoadNotification object:0];
  [v3 removeObserver:self name:SSAccountStoreChangedNotification object:0];
  [v3 removeObserver:self name:SSDeviceAutomaticDownloadKindsChangedNotification object:0];
  [v3 removeObserver:self name:NSProcessInfoPowerStateDidChangeNotification object:0];
  id v4 = +[MarketplaceKitWrapper AppDistributorsOrTrustedDevelopersChangedNotification];
  [v3 removeObserver:self name:v4 object:0];

  uint64_t v5 = +[SUClient sharedClient];
  id v6 = [v5 delegate];

  if (v6 == self) {
    [v5 setDelegate:0];
  }

  v7.receiver = self;
  v7.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v7 dealloc];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  v8 = [v6 objectForKeyedSubscript:@"path"];
  v9 = [v6 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v8 isEqualToString:@"finance"]
      && [v9 length])
    {
      id v10 = +[NSURL URLWithString:v9];
      if (v10)
      {
        id v11 = objc_alloc_init((Class)SUAccountViewController);
        uint64_t v12 = +[SUClient sharedClient];
        dispatch_queue_t v13 = [v12 clientInterface];
        [v11 setClientInterface:v13];

        [v11 setStyle:0];
        id v14 = [objc_alloc((Class)SSURLRequestProperties) initWithURL:v10];
        [v11 setURLRequestProperties:v14];
        [(StoreSettingsController *)self _showAccountSheetWithViewController:v11 animated:1];
        v7[2](v7);

LABEL_21:
        goto LABEL_8;
      }
      id v15 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v15)
      {
        id v15 = +[SSLogConfig sharedConfig];
      }
      unsigned int v16 = [v15 shouldLog];
      if ([v15 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      v18 = [v15 OSLogObject];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        v17 &= 2u;
      }
      if (v17)
      {
        int v23 = 138543618;
        id v24 = (id)objc_opt_class();
        __int16 v25 = 2114;
        v26 = v9;
        id v21 = v24;
        LODWORD(v20) = 22;
        id v19 = (void *)_os_log_send_and_compose_impl();

        if (!v19)
        {
LABEL_20:

          v7[2](v7);
          goto LABEL_21;
        }
        v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v23, v20);
        free(v19);
        SSFileLog();
      }

      goto LABEL_20;
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v22 handleURL:v6 withCompletion:v7];
LABEL_8:
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v5 loadView];
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"STORE_SETTINGS_TITLE" value:&stru_14C40 table:@"StoreSettings"];
  [(StoreSettingsController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIApplication sharedApplication];
  [v5 showNetworkPromptsIfNecessary:0];

  v12.receiver = self;
  v12.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v12 viewDidAppear:v3];
  id v6 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.AppStore"];
  id v7 = objc_alloc((Class)_NSLocalizedStringResource);
  v8 = +[NSLocale currentLocale];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 bundleURL];
  id v11 = [v7 initWithKey:@"App Store" table:0 locale:v8 bundleURL:v10];

  [(StoreSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.AppStore" title:v11 localizedNavigationComponents:&__NSArray0__struct deepLink:v6];
}

- (void)willBecomeActive
{
  self->_cellularNetworkingAllowed = -1;
  v2.receiver = self;
  v2.super_class = (Class)StoreSettingsController;
  [(StoreSettingsController *)&v2 willBecomeActive];
}

- (id)_automaticDownloadsEnabled:(id)a3
{
  if (self->_isLowPowerMode)
  {
    BOOL v3 = &__kCFBooleanFalse;
  }
  else
  {
    BOOL v3 = +[NSNumber numberWithBool:self->_autoDownloadsEnabled];
  }

  return v3;
}

- (void)_setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  self->_autoDownloadsEnabled = [v5 BOOLValue];
  ++self->_autoDownloadTogglesQueued;
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9124;
  v9[3] = &unk_14958;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v6, dispatchQueue, v9);
}

- (void)_setAutomaticDownloadsEnabled:(BOOL)a3 forKind:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  id v10 = +[ACAccountStore ams_sharedAccountStore];
  id v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

  id v12 = objc_alloc((Class)AMSAutomaticDownloadKindsFetchTask);
  dispatch_queue_t v13 = [(StoreSettingsController *)self _settingsBag];
  id v14 = [v12 initWithAccount:v11 bag:v13];

  v34 = v14;
  id v15 = [v14 perform];
  id v36 = 0;
  unsigned int v16 = [v15 resultWithError:&v36];
  id v17 = v36;

  if (v17)
  {
    v18 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v32;
      __int16 v39 = 2114;
      id v40 = v17;
      _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Error getting automatic downloads settings: %{public}@", buf, 0x16u);
    }
  }
  id v19 = [v16 enabledMediaKinds];
  id v20 = [v19 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_opt_new();
  }
  int v23 = v22;

  unsigned int v24 = [v23 containsObject:v8];
  if (v6)
  {
    if ((v24 & 1) == 0) {
      [v23 addObject:v8];
    }
  }
  else if (v24)
  {
    [v23 removeObject:v8];
  }
  id v25 = objc_alloc((Class)AMSAutomaticDownloadKindsSetTask);
  v26 = [(StoreSettingsController *)self _settingsBag];
  id v27 = [v25 initWithEnabledMediaKinds:v23 account:v11 bag:v26];

  v28 = [v27 perform];
  id v35 = v17;
  id v29 = [v28 resultWithError:&v35];
  id v30 = v35;

  if (v30)
  {
    v31 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v33;
      __int16 v39 = 2114;
      id v40 = v8;
      __int16 v41 = 2114;
      id v42 = v30;
      _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "[%{public}@]: Error saving automatic downloads setting for key %{public}@: %{public}@", buf, 0x20u);
    }
  }
  if (v9) {
    v9[2](v9, v30);
  }
}

- (id)_automaticUpdatesEnabled:(id)a3
{
  if (self->_isLowPowerMode)
  {
    BOOL v3 = &off_15838;
  }
  else
  {
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyAutoUpdatesEnabled, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat))
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v4 = keyExistsAndHasValidFormat == 0;
    }
    uint64_t v5 = v4;
    BOOL v3 = +[NSNumber numberWithBool:v5];
  }

  return v3;
}

- (id)_backgroundAssetDownloadsEnabled:(id)a3
{
  id v4 = a3;
  if (self->_isLowPowerMode
    || (Boolean keyExistsAndHasValidFormat = 0,
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"BackgroundAssetDownloadsEnabled", @"com.apple.appstored", &keyExistsAndHasValidFormat), !keyExistsAndHasValidFormat))
  {
    uint64_t v5 = &__kCFBooleanTrue;
  }
  else
  {
    uint64_t v5 = +[NSNumber numberWithBool:AppBooleanValue != 0];
  }

  return v5;
}

- (id)_cellularNetworkEnabled:(id)a3
{
  int cellularNetworkingAllowed = self->_cellularNetworkingAllowed;
  if (cellularNetworkingAllowed == 255)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    BOOL v6 = +[SSDevice currentDevice];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_9970;
    dispatch_queue_t v13 = &unk_14A78;
    id v14 = self;
    dispatch_semaphore_t v15 = v5;
    id v7 = v5;
    [v6 getCellularNetworkingAllowedWithBlock:&v10];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    int cellularNetworkingAllowed = self->_cellularNetworkingAllowed;
  }
  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", cellularNetworkingAllowed != 0, v10, v11, v12, v13, v14);

  return v8;
}

- (id)_inAppReviewEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyInAppReviewEnabled, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v4 = v3;
  dispatch_semaphore_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)_offloadUnusedAppsEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"OffloadUnusedApps", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  BOOL v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)_setAutomaticUpdatesEnabled:(id)a3 specifier:(id)a4
{
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsKeyAutoUpdatesEnabled;
  id v5 = a3;
  unsigned int v6 = [v5 BOOLValue];
  id v7 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v6) {
    id v7 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFStringRef v8 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(v4, *v7, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v8);
  id v10 = (id)objc_opt_new();
  [v10 hideApplicationBadgeForPendingUpdates];
  unsigned int v9 = [v5 BOOLValue];

  if (v9) {
    [v10 reloadFromServerInBackgroundWithCompletionBlock:&stru_14A98];
  }
}

- (void)_setBackgroundAssetDownloadsEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    id v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"BackgroundAssetDownloadsEnabled", *v5, @"com.apple.appstored");

  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

- (void)_setCellularNetworkingEnabled:(id)a3 specifier:(id)a4
{
  self->_int cellularNetworkingAllowed = [a3 BOOLValue];
  id v5 = +[SSDevice currentDevice];
  [v5 setCellularNetworkingAllowed:self->_cellularNetworkingAllowed != 0];
}

- (void)_setInAppReviewEnabled:(id)a3 specifier:(id)a4
{
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsKeyInAppReviewEnabled;
  unsigned int v5 = [a3 BOOLValue];
  unsigned int v6 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v5) {
    unsigned int v6 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFStringRef v7 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(v4, *v6, kSSUserDefaultsIdentifier);

  CFPreferencesAppSynchronize(v7);
}

- (void)_setOffloadUnusedApps:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  unsigned int v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    unsigned int v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"OffloadUnusedApps", *v5, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
  id v6 = (id)objc_opt_new();
  [v6 startWithCompletionHandler:&stru_14AD8];
}

- (id)_showInstallConfirmationEnabled:(id)a3
{
  return +[NSNumber numberWithBool:self->_shouldShowInstallConfirmations];
}

- (void)_setShowInstallConfirmationEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  self->_shouldShowInstallConfirmations = [v5 BOOLValue];
  unsigned int v6 = [v5 BOOLValue];
  CFStringRef v7 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v6) {
    CFStringRef v7 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ShowInstallConfirmations", *v7, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
  id v8 = [v5 BOOLValue];

  +[MarketplaceKitWrapper setShouldShowInstallConfirmationsFor:@"com.apple.AppStore" shouldShow:v8 completionHandler:&stru_14B18];
}

- (void)_buttonActionRecommendations:(id)a3
{
  BOOL v3 = +[ACAccountStore ams_sharedAccountStore];
  objc_msgSend(v3, "ams_activeiTunesAccount");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  CFStringRef v4 = @"false";
  if (v9)
  {
    id v5 = objc_msgSend(v9, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagPersonalization);

    if (v5) {
      CFStringRef v4 = @"true";
    }
  }
  unsigned int v6 = [@"itms-apps:///personalizationTransparency?enabled=" stringByAppendingString:v4];
  id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
  id v8 = +[LSApplicationWorkspace defaultWorkspace];
  [v8 openSensitiveURL:v7 withOptions:0];
}

- (void)appDataUsagePolicyChange:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  CFStringRef v4 = objc_msgSend(a3, "policies", 0);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      id v10 = [v9 bundleId];
      unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.AppStore"];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v12 = v9;

    if (!v12) {
      return;
    }
    [(StoreSettingsController *)self _setCellularPolicyEnabled:v12];
    [(StoreSettingsController *)self _reloadUI];
    CFStringRef v4 = v12;
  }
LABEL_12:
}

- (BOOL)client:(id)a3 openInternalURL:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)SUAccountViewController);
  uint64_t v7 = +[SUClient sharedClient];
  uint64_t v8 = [v7 clientInterface];
  [v6 setClientInterface:v8];

  id v9 = [objc_alloc((Class)SSURLRequestProperties) initWithURL:v5];
  [v6 setURLRequestProperties:v9];
  id v10 = [(StoreSettingsController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, 0);
    [v10 setViewControllers:v11 animated:0];
  }
  else
  {
    [(StoreSettingsController *)self _showAccountSheetWithViewController:v6 animated:1];
  }

  return 1;
}

- (BOOL)client:(id)a3 presentAccountViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [(StoreSettingsController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, 0);

    [v8 setViewControllers:v9 animated:0];
    id v7 = (id)v9;
  }
  else
  {
    [(StoreSettingsController *)self _showAccountSheetWithViewController:v7 animated:v5];
  }

  return 1;
}

- (BOOL)client:(id)a3 presentModalViewController:(id)a4 animated:(BOOL)a5
{
  return 1;
}

- (id)topViewControllerForClient:(id)a3
{
  BOOL v3 = [(StoreSettingsController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)_accountsChangedNotification:(id)a3
{
  CFStringRef v4 = +[ACAccountStore ams_sharedAccountStore];
  id v5 = objc_msgSend(v4, "ams_activeiTunesAccount");
  id v6 = objc_msgSend(v5, "ams_DSID");
  id v7 = [v6 integerValue];
  NSInteger v8 = [(NSNumber *)self->_currentAccountDSID integerValue];

  if (v7 != (id)v8)
  {
    uint64_t v9 = +[ACAccountStore ams_sharedAccountStore];
    id v10 = objc_msgSend(v9, "ams_activeiTunesAccount");
    objc_msgSend(v10, "ams_DSID");
    unsigned __int8 v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    currentAccountDSID = self->_currentAccountDSID;
    self->_currentAccountDSID = v11;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A3FC;
    block[3] = &unk_14A28;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_automaticDownloadKindsChangedNotification:(id)a3
{
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A4B0;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_appDistributorsOrTrustedDevelopersChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A52C;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_carrierSettingsChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A5A8;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  CFStringRef v4 = +[ISNetworkObserver sharedInstance];
  id v5 = [v4 networkType];

  if (v5)
  {
    id v6 = +[ISURLBagCache sharedCache];
    id v7 = [(StoreSettingsController *)self _bagContext];
    id v9 = [v6 URLBagForContext:v7];

    NSInteger v8 = v9;
    if (!v9)
    {
      [(StoreSettingsController *)self _loadUserSpecificURLBag];
      NSInteger v8 = 0;
    }
  }
}

- (void)_urlBagDidLoadNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A6F0;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_reloadMarketplaceVariables
{
  self->_hasEverHadMultipleMarketplaces = CFPreferencesGetAppBooleanValue(@"HasEverHadMultipleMarketplaces", @"com.apple.appstored", 0) != 0;
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  Boolean AppBooleanValue = 0;
  Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"HasMultipleMarketplaces", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_hasMultipleMarketplaces = *((unsigned char *)v13 + 24) != 0;
  }
  else {
    self->_hasMultipleMarketplaces = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A938;
  block[3] = &unk_14B90;
  block[4] = self;
  void block[5] = &v12;
  dispatch_async(dispatchQueue, block);
  Boolean v10 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  Boolean v9 = 0;
  Boolean v9 = CFPreferencesGetAppBooleanValue(@"ShowInstallConfirmations", @"com.apple.appstored", &v10);
  if (v10) {
    self->_shouldShowInstallConfirmations = *((unsigned char *)v7 + 24) != 0;
  }
  else {
    self->_shouldShowInstallConfirmations = 0;
  }
  CFStringRef v4 = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AB60;
  v5[3] = &unk_14B90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async(v4, v5);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)_fetchInitialAutomaticSoftwareDownloadValue
{
  BOOL v3 = +[ACAccountStore ams_sharedAccountStore];
  CFStringRef v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  id v5 = [v4 objectForKeyedSubscript:@"automaticDownloadKinds"];
  self->_autoDownloadsEnabled = [v5 containsObject:@"software"];
  [(StoreSettingsController *)self _reloadUI];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AE70;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_getAutomaticSoftwareDownloadValueWithCompletion:(id)a3
{
  CFStringRef v4 = (void (**)(id, id, id))a3;
  id v5 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

  id v7 = objc_alloc((Class)AMSAutomaticDownloadKindsFetchTask);
  uint64_t v8 = [(StoreSettingsController *)self _settingsBag];
  id v9 = [v7 initWithAccount:v6 bag:v8];

  Boolean v10 = [v9 perform];
  id v20 = 0;
  unsigned __int8 v11 = [v10 resultWithError:&v20];
  id v12 = v20;

  if (v12)
  {
    long long v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Error getting automatic downloads settings: %{public}@", buf, 0x16u);
    }
  }
  if (v4)
  {
    uint64_t v14 = [v11 enabledMediaKinds];
    id v15 = [v14 mutableCopy];
    long long v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = (id)objc_opt_new();
    }
    v18 = v17;

    v4[2](v4, [v18 containsObject:@"software"], v12);
  }
}

- (id)_settingsBag
{
  bag = self->_bag;
  if (!bag)
  {
    CFStringRef v4 = +[AMSBag bagForProfile:@"appstored" profileVersion:@"1"];
    id v5 = self->_bag;
    self->_bag = v4;

    bag = self->_bag;
  }

  return bag;
}

- (id)_automaticDownloadConfigurations
{
  automaticDownloadConfigurations = self->_automaticDownloadConfigurations;
  if (!automaticDownloadConfigurations)
  {
    [(StoreSettingsController *)self _reloadAutomaticDownloadConfigurations];
    automaticDownloadConfigurations = self->_automaticDownloadConfigurations;
  }

  return automaticDownloadConfigurations;
}

- (id)_copyAutomaticDownloadSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v4 = [(StoreSettingsController *)self _automaticDownloadConfigurations];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(StoreSettingsController *)self _newAutomaticDownloadSpecifierWithConfiguration:*(void *)(*((void *)&v15 + 1) + 8 * (void)v8)];
        if (v9) {
          [v3 addObject:v9];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }
  if (!self->_hasMultipleMarketplaces)
  {
    uint64_t v19 = SSDownloadKindSoftwareApplication;
    Boolean v10 = +[NSArray arrayWithObjects:&v19 count:1];
    unsigned int v11 = [(StoreSettingsController *)self _shouldShowSpecifierForAutomaticDownloadKinds:v10];

    if (v11)
    {
      id v12 = [(StoreSettingsController *)self _newAutomaticUpdatesSpecifier];
      [v3 addObject:v12];
    }
    id v13 = [(StoreSettingsController *)self _newBackgroundAssetDownloadsSpecifier];
    [v3 addObject:v13];
  }
  return v3;
}

- (id)_copyPrivacyGroupSpecifiersSignedIn:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"PRIVACY_HEADER" value:&stru_14C40 table:@"StoreSettings"];
  uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"PRIVACY_GROUP" name:v6];

  uint64_t v8 = (char *)objc_alloc_init((Class)PSSpecifier);
  *(void *)&v8[OBJC_IVAR___PSSpecifier_cellType] = 13;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  Boolean v10 = [v9 localizedStringForKey:@"PRIVACY_APP_STORE_ARCADE_CELL" value:&stru_14C40 table:@"StoreSettings"];
  [v8 setName:v10];

  [v8 setTarget:self];
  [v8 setButtonAction:"_showPrivacySheet:"];
  [v8 setProperty:@"YES" forKey:PSAllowMultilineTitleKey];
  if (v3)
  {
    unsigned int v11 = (char *)objc_alloc_init((Class)PSSpecifier);
    *(void *)&v11[OBJC_IVAR___PSSpecifier_cellType] = 13;
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"PRIVACY_PERSONALIZED_RECOMMENDATIONS_CELL" value:&stru_14C40 table:@"StoreSettings"];
    [v11 setName:v13];

    [v11 setTarget:self];
    [v11 setButtonAction:"_buttonActionRecommendations:"];
    v17[0] = v7;
    v17[1] = v8;
    v17[2] = v11;
    uint64_t v14 = +[NSArray arrayWithObjects:v17 count:3];
  }
  else
  {
    v16[0] = v7;
    v16[1] = v8;
    uint64_t v14 = +[NSArray arrayWithObjects:v16 count:2];
  }

  return v14;
}

- (PSSystemPolicyForApp)systemPolicy
{
  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    CFStringRef v4 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.AppStore"];
    id v5 = self->_systemPolicy;
    self->_systemPolicy = v4;

    [(PSSystemPolicyForApp *)self->_systemPolicy setDelegate:self];
    systemPolicy = self->_systemPolicy;
  }

  return systemPolicy;
}

- (id)_copySystemPolicySpecifiers
{
  objc_super v2 = [(StoreSettingsController *)self systemPolicy];
  BOOL v3 = [v2 specifiersForPolicyOptions:-134348801 force:0];

  return v3;
}

- (id)_copySignedOutSpecifiers
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = [(StoreSettingsController *)self _copySystemPolicySpecifiers];
  id v5 = [v3 initWithArray:v4];

  if (self->_hasMultipleMarketplaces)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"AUTO_DOWNLOADS_HEADER" value:&stru_14C40 table:@"StoreSettings"];
    id v9 = +[PSSpecifier groupSpecifierWithName:v8];

    if (self->_isLowPowerMode)
    {
      Boolean v10 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v11 = [v10 localizedStringForKey:@"AUTO_DOWNLOADS_LPM" value:&stru_14C40 table:@"StoreSettings"];
      [v9 setProperty:v11 forKey:PSFooterTextGroupKey];
    }
    else
    {
      [v9 removePropertyForKey:PSFooterTextGroupKey];
    }
    [v5 addObject:v9];
    id v6 = [(StoreSettingsController *)self _newAutomaticUpdatesSpecifier];

    if (self->_isLowPowerMode) {
      [v6 setProperty:&off_15838 forKey:PSEnabledKey];
    }
    [v5 addObject:v6];
    id v12 = [(StoreSettingsController *)self _newBackgroundAssetDownloadsSpecifier];
    [v5 addObject:v12];
  }
  id v13 = [(StoreSettingsController *)self _copyCopyCellularDownloadSpecifiers];
  if ([v13 count]) {
    [v5 addObjectsFromArray:v13];
  }
  if (![(StoreSettingsController *)self isAutoPlayVideoProhibited])
  {
    id v14 = [(StoreSettingsController *)self _newAppStoreVideoGroupSpecifier];

    [v5 addObject:v14];
    id v6 = [(StoreSettingsController *)self _newAppStoreVideoSpecifier];

    [v5 addObject:v6];
  }
  id v15 = [(StoreSettingsController *)self _newInAppReviewGroupSpecifier];

  [v5 addObject:v15];
  id v16 = [(StoreSettingsController *)self _newInAppReviewSwitchSpecifier];

  [v5 addObject:v16];
  if (self->_hasEverHadMultipleMarketplaces)
  {
    long long v17 = [(StoreSettingsController *)self _showInstallConfirmationsGroupSpecifier];

    [v5 addObject:v17];
    id v16 = [(StoreSettingsController *)self _showInstallConfirmationsSpecifier];

    [v5 addObject:v16];
  }
  id v18 = [(StoreSettingsController *)self _copyPrivacyGroupSpecifiersSignedIn:0];
  [v5 addObjectsFromArray:v18];

  return v5;
}

- (id)_appStoreCellularDataSettingForSpecifier:(id)a3
{
  id v4 = [(StoreSettingsController *)self _cellularSettings];
  id v5 = [(StoreSettingsController *)self _formattedNetworkLimit];
  if ([v4 cellularDataPrompt] == (char *)&dword_0 + 2)
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    CFStringRef v8 = @"ALWAYS_ALLOW";
LABEL_6:
    id v9 = [v6 localizedStringForKey:v8 value:&stru_14C40 table:@"StoreSettings"];
LABEL_8:

    goto LABEL_9;
  }
  if (![v4 cellularDataPrompt])
  {
    uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
    Boolean v10 = [v7 localizedStringForKey:@"UNDER_XXX_MB_%@" value:&stru_14C40 table:@"StoreSettings"];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v5);

    goto LABEL_8;
  }
  if ([v4 cellularDataPrompt] == (char *)&dword_0 + 1)
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    CFStringRef v8 = @"ASK_FIRST";
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)_cellularSettings
{
  cellularSettings = self->_cellularSettings;
  if (!cellularSettings)
  {
    telephonyClient = self->_telephonyClient;
    id v14 = 0;
    id v5 = [(CoreTelephonyClient *)telephonyClient getCurrentDataSubscriptionContextSync:&v14];
    id v6 = v14;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No subscription context available: %{public}@", buf, 0xCu);
    }
    uint64_t v7 = self->_telephonyClient;
    id v13 = v6;
    CFStringRef v8 = +[ASDCellularIdentity identityForSubscription:v5 usingClient:v7 error:&v13];
    id v9 = v13;

    if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v9;
      _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No cellular identity available: %{public}@", buf, 0xCu);
    }
    Boolean v10 = +[ASDCellularSettings settingsForIdentity:v8];
    unsigned int v11 = self->_cellularSettings;
    self->_cellularSettings = v10;

    cellularSettings = self->_cellularSettings;
  }

  return cellularSettings;
}

- (id)_enabledAutomaticDownloadKinds
{
  enabledAutomaticDownloadKinds = self->_enabledAutomaticDownloadKinds;
  if (!enabledAutomaticDownloadKinds)
  {
    id v4 = +[SSDevice currentDevice];
    id v5 = [v4 automaticDownloadKinds];
    id v6 = (NSMutableSet *)[v5 mutableCopy];
    uint64_t v7 = self->_enabledAutomaticDownloadKinds;
    self->_enabledAutomaticDownloadKinds = v6;

    enabledAutomaticDownloadKinds = self->_enabledAutomaticDownloadKinds;
  }

  return enabledAutomaticDownloadKinds;
}

- (id)_newAutomaticDownloadSpecifierWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"canonical-name"];
  id v6 = [v4 objectForKey:@"media-types"];

  if (v5
    && [(StoreSettingsController *)self _shouldShowSpecifierForAutomaticDownloadKinds:v6])
  {
    uint64_t v7 = (char *)objc_alloc_init((Class)PSSpecifier);
    *(void *)&v7[OBJC_IVAR___PSSpecifier_cellType] = 6;
    *(void *)&v7[OBJC_IVAR___PSSpecifier_getter] = "_automaticDownloadsEnabled:";
    *(void *)&v7[OBJC_IVAR___PSSpecifier_setter] = "_setAutomaticDownloadsEnabled:specifier:";
    [v7 setTarget:self];
    if (self->_isLowPowerMode) {
      [v7 setProperty:&off_15838 forKey:PSEnabledKey];
    }
    CFStringRef v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:v5 value:&stru_14C40 table:@"StoreSettings"];
    [v7 setName:v9];

    [v7 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    Boolean v10 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v11 = [v10 localizedStringForKey:@"AUTO_DOWNLOADS_APPS_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
    [v7 setObject:v11 forKeyedSubscript:PSTableCellSubtitleTextKey];

    id v12 = +[NSSet setWithArray:v6];
    [v7 setProperty:v12 forKey:@"SSDownloadKinds"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_newAutomaticUpdatesSpecifier
{
  if (+[ASDUpdatesService isAutomaticUpdateAuthorizationEnabled])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES" value:&stru_14C40 table:@"StoreSettings"];
    id v5 = [(StoreSettingsController *)self _newLinkSpecifierWithName:v4 detailControllerClass:objc_opt_class()];

    [v5 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES_EXPLANATION_CH_SKU" value:&stru_14C40 table:@"StoreSettings"];
    [v5 setObject:v7 forKeyedSubscript:PSTableCellSubtitleTextKey];
  }
  else
  {
    id v5 = (char *)objc_alloc_init((Class)PSSpecifier);
    *(void *)&v5[OBJC_IVAR___PSSpecifier_cellType] = 6;
    *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "_automaticUpdatesEnabled:";
    *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "_setAutomaticUpdatesEnabled:specifier:";
    [v5 setTarget:self];
    [v5 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    CFStringRef v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
    [v5 setObject:v9 forKeyedSubscript:PSTableCellSubtitleTextKey];

    if (self->_isLowPowerMode) {
      [v5 setProperty:&off_15838 forKey:PSEnabledKey];
    }
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"AUTO_DOWNLOAD_UPDATES" value:&stru_14C40 table:@"StoreSettings"];
    [v5 setName:v7];
  }

  return v5;
}

- (id)_newBackgroundAssetDownloadsSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"AUTO_DOWNLOAD_BACKGROUND_ASSETS" value:&stru_14C40 table:@"StoreSettings"];

  id v5 = [objc_alloc((Class)PSSpecifier) initWithName:v4 target:self set:"_setBackgroundAssetDownloadsEnabled:specifier:" get:"_backgroundAssetDownloadsEnabled:" detail:0 cell:6 edit:0];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:PSDefaultValueKey];
  [v5 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"AUTO_DOWNLOAD_BACKGROUND_ASSETS_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
  [v5 setObject:v7 forKeyedSubscript:PSTableCellSubtitleTextKey];

  if (self->_isLowPowerMode) {
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  }

  return v5;
}

- (void)_setCellularPolicyEnabled:(id)a3
{
  self->_isCellularPolicyEnabled = [a3 cellular] == (char *)&dword_0 + 1;
}

- (void)_showPrivacySheet:(id)a3
{
  v6[0] = OBPrivacyAppStoreIdentifier;
  v6[1] = OBPrivacyAppleArcadeIdentifier;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];
  id v5 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:v4];

  [v5 setPresentingViewController:self];
  [v5 present];
}

- (void)_updateCellularPolicy
{
  id v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Fetching cellular policy", buf, 2u);
  }

  uint64_t v9 = 0;
  telephonyClient = self->_telephonyClient;
  id v5 = +[NSSet setWithObject:@"com.apple.AppStore"];
  id v6 = [(CoreTelephonyClient *)telephonyClient getLocalPolicies:v5 error:&v9];

  uint64_t v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Finished fetching cellular policy", buf, 2u);
  }

  if (v6 && [v6 count] == (char *)&dword_0 + 1)
  {
    CFStringRef v8 = [v6 anyObject];
    [(StoreSettingsController *)self _setCellularPolicyEnabled:v8];
  }
  else
  {
    CFStringRef v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v9;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Unable to fetch per-app cellular policy: %{public}@", buf, 0xCu);
    }
  }
}

- (id)_showInstallConfirmationsGroupSpecifier
{
  objc_super v2 = +[PSSpecifier emptyGroupSpecifier];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SHOW_INSTALL_CONFIRMATIONS_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
  [v2 setProperty:v4 forKey:PSFooterTextGroupKey];

  return v2;
}

- (id)_showInstallConfirmationsSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SHOW_INSTALL_CONFIRMATIONS" value:&stru_14C40 table:@"StoreSettings"];
  id v5 = [(StoreSettingsController *)self _newSwitchSpecifierWithName:v4];

  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "_showInstallConfirmationEnabled:";
  *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "_setShowInstallConfirmationEnabled:specifier:";
  [v5 setProperty:@"YES" forKey:PSAllowMultilineTitleKey];
  [v5 setTarget:self];

  return v5;
}

- (id)_newAppStoreVideoGroupSpecifier
{
  objc_super v2 = +[PSSpecifier emptyGroupSpecifier];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"AUTO_PLAY_VIDEO_SETTINGS_DESCRIPTION" value:&stru_14C40 table:@"StoreSettings"];
  uint64_t v34 = PSFooterTextGroupKey;
  objc_msgSend(v2, "setProperty:forKey:", v4);

  CFStringRef v5 = (const __CFString *)kSSAppStoreUserDefaultsIdentifier;
  CFStringRef key = (const __CFString *)kSSUserDefaultsKeyUserSetAutoPlayVideoSetting;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyUserSetAutoPlayVideoSetting, kSSAppStoreUserDefaultsIdentifier, 0);
  uint64_t v7 = (void *)CFPreferencesCopyAppValue(kSSUserDefaultsKeyLastUserSetAutoPlayVideoValue, v5);
  int IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v9 = (const __CFString *)kSSUserDefaultsKeyLastMotionAutoPlayVideoValue;
  if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyLastMotionAutoPlayVideoValue, v5, &keyExistsAndHasValidFormat) == IsVideoAutoplayEnabled)
  {
    if (keyExistsAndHasValidFormat) {
      char v10 = 0;
    }
    else {
      char v10 = IsVideoAutoplayEnabled ^ 1;
    }
  }
  else
  {
    char v10 = 1;
  }
  uint64_t v11 = +[NSProcessInfo processInfo];
  unsigned int v12 = [v11 isLowPowerModeEnabled];

  Boolean v36 = 0;
  CFStringRef v13 = (const __CFString *)kSSUserDefaultsKeyLastLowPowerModeValue;
  if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyLastLowPowerModeValue, v5, &v36) != v12
    || (!v36 ? (unsigned int v14 = v12) : (unsigned int v14 = 0), !AppBooleanValue ? (v15 = 1) : (v15 = v10), (v15 & 1) != 0 || v14))
  {
    if (v12)
    {
      uint64_t v32 = v7;
      CFStringRef v33 = v13;
      CFStringRef v31 = v9;
      id v16 = (const void *)SSAutoPlayVideoSettingOff;
      CFStringRef v30 = (const __CFString *)kSSUserDefaultsKeyAutoPlayVideoSetting;
      CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, SSAutoPlayVideoSettingOff, v5);
      CFBooleanRef v17 = kCFBooleanTrue;
      CFPreferencesSetAppValue(kSSUserDefaultsKeyLowPowerModeSetLastAutoPlayVideoValue, kCFBooleanTrue, v5);
      CFBooleanRef v18 = kCFBooleanFalse;
      CFPreferencesSetAppValue(key, kCFBooleanFalse, v5);
      uint64_t v19 = v2;
      id v20 = +[NSBundle bundleForClass:objc_opt_class()];
      id v21 = [v20 localizedStringForKey:@"AUTO_PLAY_VIDEO_SETTINGS_LOW_POWER_MODE_DESCRIPTION" value:&stru_14C40 table:@"StoreSettings"];
      [v19 setProperty:v21 forKey:v34];

      if (IsVideoAutoplayEnabled)
      {
        CFPreferencesSetAppValue(kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue, kCFBooleanFalse, v5);
        objc_super v2 = v19;
        CFStringRef v9 = v31;
        uint64_t v7 = v32;
LABEL_24:
        CFStringRef v13 = v33;
        goto LABEL_25;
      }
      objc_super v2 = v19;
      CFStringRef v9 = v31;
      uint64_t v7 = v32;
      CFStringRef v24 = v30;
    }
    else
    {
      CFStringRef v22 = (const __CFString *)kSSUserDefaultsKeyLowPowerModeSetLastAutoPlayVideoValue;
      CFBooleanRef v18 = kCFBooleanFalse;
      CFPreferencesSetAppValue(kSSUserDefaultsKeyLowPowerModeSetLastAutoPlayVideoValue, kCFBooleanFalse, v5);
      if (IsVideoAutoplayEnabled)
      {
        CFStringRef v23 = (const __CFString *)kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue;
        CFPreferencesSetAppValue(kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue, kCFBooleanFalse, v5);
        CFPreferencesSetAppValue(v23, kCFBooleanFalse, v5);
        CFPreferencesSetAppValue(v22, kCFBooleanFalse, v5);
        if (v7)
        {
          CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, v7, v5);
          CFBooleanRef v17 = kCFBooleanTrue;
          CFPreferencesSetAppValue(key, kCFBooleanTrue, v5);
        }
        else
        {
          CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, 0, v5);
          CFPreferencesSetAppValue(key, kCFBooleanFalse, v5);
          CFBooleanRef v17 = kCFBooleanTrue;
        }
LABEL_25:
        if (IsVideoAutoplayEnabled) {
          CFBooleanRef v27 = v17;
        }
        else {
          CFBooleanRef v27 = v18;
        }
        CFPreferencesSetAppValue(v9, v27, v5);
        if (v12) {
          CFBooleanRef v28 = v17;
        }
        else {
          CFBooleanRef v28 = v18;
        }
        CFPreferencesSetAppValue(v13, v28, v5);
        CFPreferencesAppSynchronize(v5);
        goto LABEL_32;
      }
      CFStringRef v33 = v13;
      CFStringRef v24 = (const __CFString *)kSSUserDefaultsKeyAutoPlayVideoSetting;
      id v16 = (const void *)SSAutoPlayVideoSettingOff;
      CFBooleanRef v17 = kCFBooleanTrue;
    }
    CFPreferencesSetAppValue(v24, v16, v5);
    CFPreferencesSetAppValue(kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue, v17, v5);
    CFPreferencesSetAppValue(key, v18, v5);
    id v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"AUTO_PLAY_VIDEO_SETTINGS_MOTION_AUTOPLAY_VIDEO_DESCRIPTION" value:&stru_14C40 table:@"StoreSettings"];
    [v2 setProperty:v26 forKey:v34];

    goto LABEL_24;
  }
LABEL_32:

  return v2;
}

- (id)_newAppStoreVideoSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"AUTO_PLAY_VIDEO_SETTINGS_TITLE" value:&stru_14C40 table:@"StoreSettings"];
  CFStringRef v5 = [(StoreSettingsController *)self _newLinkSpecifierWithName:v4 detailControllerClass:objc_opt_class()];

  [v5 setCellType:2];
  [v5 setProperty:@"YES" forKey:PSAllowMultilineTitleKey];
  if (self->_isLowPowerMode) {
    [v5 setProperty:&off_15838 forKey:PSEnabledKey];
  }
  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "appStoreVideoSettingForSpecifier:";
  return v5;
}

- (id)appStoreVideoSettingForSpecifier:(id)a3
{
  id v3 = [(StoreSettingsController *)self autoPlayVideoSetting];
  if ([v3 isEqualToString:SSAutoPlayVideoSettingOn])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v5 = v4;
    CFStringRef v6 = @"AUTO_PLAY_VIDEO_MODE_ON";
LABEL_9:
    CFStringRef v8 = [v4 localizedStringForKey:v6 value:&stru_14C40 table:@"StoreSettings"];

    goto LABEL_10;
  }
  if ([v3 isEqualToString:SSAutoPlayVideoSettingWIFIOnly])
  {
    int v7 = MGGetBoolAnswer();
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v5 = v4;
    if (v7) {
      CFStringRef v6 = @"AUTO_PLAY_VIDEO_MODE_WLAN_ONLY";
    }
    else {
      CFStringRef v6 = @"AUTO_PLAY_VIDEO_MODE_WIFI_ONLY";
    }
    goto LABEL_9;
  }
  if ([v3 isEqualToString:SSAutoPlayVideoSettingOff])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v5 = v4;
    CFStringRef v6 = @"AUTO_PLAY_VIDEO_MODE_OFF";
    goto LABEL_9;
  }
  CFStringRef v8 = 0;
LABEL_10:

  return v8;
}

- (id)autoPlayVideoSetting
{
  [(StoreSettingsController *)self updateAutoPlayVideoDefaultSettingsIfNecessary];
  CFStringRef v2 = (const __CFString *)kSSUserDefaultsKeyAutoPlayVideoSetting;
  CFStringRef v3 = (const __CFString *)kSSAppStoreUserDefaultsIdentifier;
  id v4 = (void *)CFPreferencesCopyAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, kSSAppStoreUserDefaultsIdentifier);
  CFStringRef v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    CFPreferencesSetAppValue(v2, 0, v3);
    CFPreferencesAppSynchronize(v3);
  }

  return v5;
}

- (void)updateAutoPlayVideoDefaultSettingsIfNecessary
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v3 = (const __CFString *)kSSAppStoreUserDefaultsIdentifier;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyUserSetAutoPlayVideoSetting, kSSAppStoreUserDefaultsIdentifier, &keyExistsAndHasValidFormat);
  int v5 = keyExistsAndHasValidFormat;
  Boolean v14 = 0;
  if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyMotionAutoPlayVideoSetLastAutoPlayVideoValue, @"com.apple.AppStore", &v14))
  {
    BOOL v6 = v14 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  char v7 = !v6;
  Boolean v13 = 0;
  if (CFPreferencesGetAppBooleanValue(kSSUserDefaultsKeyLowPowerModeSetLastAutoPlayVideoValue, @"com.apple.AppStore", &v13))
  {
    BOOL v8 = v13 == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  char v9 = !v8;
  if (AppBooleanValue) {
    BOOL v10 = v5 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 && (v7 & 1) == 0 && (v9 & 1) == 0)
  {
    uint64_t v11 = [(StoreSettingsController *)self storeFrontDefaultAutoPlayVideoSetting];
    if (v11) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = (const void *)SSAutoPlayVideoSettingOn;
    }
    CFPreferencesSetAppValue(kSSUserDefaultsKeyAutoPlayVideoSetting, v12, v3);
    CFPreferencesAppSynchronize(v3);
  }
}

- (id)storeFrontDefaultAutoPlayVideoSetting
{
  CFStringRef v2 = [(StoreSettingsController *)self _bagContext];
  CFStringRef v3 = +[ISURLBagCache sharedCache];
  id v4 = [v3 URLBagForContext:v2];

  if (!v4)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  int v5 = [v4 valueForKey:@"autoPlayVideoDefaultSetting"];
  if ([v5 isEqualToString:@"wifiOnly"])
  {
    BOOL v6 = (id *)&SSAutoPlayVideoSettingWIFIOnly;
  }
  else if ([v5 isEqualToString:@"on"])
  {
    BOOL v6 = (id *)&SSAutoPlayVideoSettingOn;
  }
  else
  {
    if (![v5 isEqualToString:@"off"])
    {
      id v7 = 0;
      goto LABEL_10;
    }
    BOOL v6 = (id *)&SSAutoPlayVideoSettingOff;
  }
  id v7 = *v6;
LABEL_10:

LABEL_11:

  return v7;
}

- (id)_newOffloadUnusedAppsSwitchSpecifier
{
  CFStringRef v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"OFFLOAD_UNUSED_APPS_ON_CELL" value:&stru_14C40 table:@"StoreSettings"];
  int v5 = [(StoreSettingsController *)self _newSwitchSpecifierWithName:v4];

  *(void *)&v5[OBJC_IVAR___PSSpecifier_getter] = "_offloadUnusedAppsEnabled:";
  *(void *)&v5[OBJC_IVAR___PSSpecifier_setter] = "_setOffloadUnusedApps:specifier:";
  [v5 setTarget:self];
  return v5;
}

- (void)_reloadAutomaticDownloadConfigurations
{
  id v9 = [(StoreSettingsController *)self _bagContext];
  CFStringRef v3 = +[ISURLBagCache sharedCache];
  id v4 = [v3 URLBagForContext:v9];

  if (v4)
  {
    int v5 = [v4 valueForKey:@"automatic-downloads2"];
    if (!v5)
    {
      int v5 = [v4 valueForKey:@"automatic-downloads"];
    }
    BOOL v6 = [v5 objectForKey:@"configurations"];
    automaticDownloadConfigurations = self->_automaticDownloadConfigurations;
    self->_automaticDownloadConfigurations = v6;

    CFPreferencesSetAppValue(@"auto-download-configurations", self->_automaticDownloadConfigurations, @"com.apple.mobilestoresettings");
    CFPreferencesAppSynchronize(@"com.apple.mobilestoresettings");
  }
  else
  {
    BOOL v8 = (NSArray *)CFPreferencesCopyAppValue(@"auto-download-configurations", @"com.apple.mobilestoresettings");
    int v5 = self->_automaticDownloadConfigurations;
    self->_automaticDownloadConfigurations = v8;
  }
}

- (void)_reloadForAutomaticDownloadKindsChange
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D584;
  block[3] = &unk_14A28;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_reloadForLowPowerModeChange
{
  CFStringRef v3 = +[NSProcessInfo processInfo];
  self->_isLowPowerMode = [v3 isLowPowerModeEnabled];

  [(StoreSettingsController *)self _reloadUI];
}

- (void)_reloadUI
{
  if ([(StoreSettingsController *)self _isSignedIn]) {
    id v3 = [(StoreSettingsController *)self _copySignedInSpecifiers];
  }
  else {
    id v3 = [(StoreSettingsController *)self _copySignedOutSpecifiers];
  }
  id v6 = v3;
  [(StoreSettingsController *)self setSpecifiers:v3];
  id v4 = [(StoreSettingsController *)self table];
  int v5 = [v4 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v5 animated:0];
}

- (BOOL)_shouldShowCellularDataSwitch
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  CFStringRef v2 = +[SSDevice currentDevice];
  if ([v2 supportsDeviceCapability:0])
  {
    id v3 = +[ISNetworkObserver sharedInstance];
    unsigned __int8 v4 = [v3 shouldShowCellularAutomaticDownloadsSwitch];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldShowSpecifierForAutomaticDownloadKinds:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (char *)[v3 count];
  unsigned __int8 v5 = v4 != 0;
  if (v4 == (unsigned char *)&dword_0 + 2) {
    goto LABEL_16;
  }
  if (v4 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_13;
  }
  if (![v3 containsObject:SSDownloadKindSoftwareApplication])
  {
LABEL_16:
    if (([v3 containsObject:SSDownloadKindEBook] & 1) != 0
      || ([v3 containsObject:SSDownloadKindAudiobook] & 1) != 0
      || ([v3 containsObject:SSDownloadKindMusic] & 1) != 0
      || [v3 containsObject:SSDownloadKindMusicVideo])
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    id v6 = +[MCProfileConnection sharedConnection];
    if ([v6 isAppInstallationAllowed]) {
      unsigned __int8 v5 = [v6 isAutomaticAppDownloadsAllowed];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
LABEL_13:

  return v5;
}

- (void)_showAccountSheetWithViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v8 = [objc_alloc((Class)SUNavigationController) initWithRootViewController:v5];

  id v6 = +[SUClient sharedClient];
  id v7 = [v6 clientInterface];
  [v8 setClientInterface:v7];

  [v8 setModalPresentationStyle:2];
  [(StoreSettingsController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)setSystemPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPolicy, 0);
  objc_storeStrong((id *)&self->_pendingAutomaticDownloadKinds, 0);
  objc_storeStrong((id *)&self->_enabledAutomaticDownloadKinds, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentAccountDSID, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_cellularSettings, 0);
  objc_storeStrong((id *)&self->_bag, 0);

  objc_storeStrong((id *)&self->_automaticDownloadConfigurations, 0);
}

@end