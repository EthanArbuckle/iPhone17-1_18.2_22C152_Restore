@interface BKSettingsController
- (BKSettingsController)init;
- (BOOL)_currentLocalAutomaticDownloadForPurchasesFromOtherDevicesEnabled;
- (BOOL)_isGlobalICloudDriveEnabled;
- (BOOL)_isLiverpoolTCCEnabled;
- (BOOL)_isOutdatedDevicesCellInstalled;
- (BOOL)_isSignedInToICloud;
- (BOOL)_isSignedInToITunes;
- (BOOL)_isSyncSectionEnabled;
- (BOOL)_isSyncSectionForCloudKitEnabled;
- (BOOL)_isSyncSectionForICloudDriveEnabled;
- (BOOL)_isUbiquityTCCEnabled;
- (BOOL)_shouldShowCellularDataSwitch;
- (BOOL)downloadQueue:(id)a3 shouldShowAuthenticateForRequest:(id)a4;
- (BOOL)downloadQueue:(id)a3 shouldShowDialogForRequest:(id)a4;
- (BOOL)downloadQueue:(id)a3 shouldShowEngagementForRequest:(id)a4;
- (NSString)presentingSceneIdentifier;
- (PSSpecifier)externalControlGroup;
- (id)_allowAutomaticDownloadsForPurchasesFromOtherDevices:(id)a3;
- (id)_audioBookSkipSettingsDurationNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5;
- (id)_cellularAllowAutomaticDownloads:(id)a3;
- (id)_cellularDataSettingForSpecifier:(id)a3;
- (id)_cellularSettings;
- (id)_customSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5 get:(SEL)a6 set:(SEL)a7;
- (id)_customSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5 get:(SEL)a6 set:(SEL)a7 inAppGroup:(BOOL)a8;
- (id)_formattedNetworkLimitAndReloadIfNeeded;
- (id)_getICloudDriveEnabled:(id)a3;
- (id)_groupSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5;
- (id)_numberOfOutdatedDevices:(id)a3;
- (id)_pageTurnStyleOptionNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5;
- (id)_specifierWithTitle:(id)a3 customCell:(id)a4 set:(SEL)a5 get:(SEL)a6;
- (id)_standardButtonSpecifierNamed:(id)a3 selector:(SEL)a4;
- (id)_standardSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5;
- (id)_subtitleSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5;
- (id)downloadQueue:(id)a3 viewControllerToPresentAuthenticateUIForRequest:(id)a4;
- (id)downloadQueue:(id)a3 viewControllerToPresentDialogUIForRequest:(id)a4;
- (id)downloadQueue:(id)a3 viewControllerToPresentEngagementUIForRequest:(id)a4;
- (id)readSyncSectionForCloudKitPreferenceValue:(id)a3;
- (id)readSyncSectionForICloudDrivePreferenceValue:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_isServiceEnabled:(__CFString *)a3;
- (void)_addAcknowledgementsSectionSpecifiersToArray:(id)a3;
- (void)_addAudiobooksExternalControlsSpecifiersToArray:(id)a3;
- (void)_addAudiobooksSectionSpecifiersToArray:(id)a3;
- (void)_addAutomaticDownloadsSectionSpecifiersToArray:(id)a3;
- (void)_addCellularSectionSpecifiersToArray:(id)a3;
- (void)_addClearReadingGoalsDataSpecifiersToArray:(id)a3;
- (void)_addPrivacySection:(id)a3;
- (void)_addReadingGoalsSectionSpecifiersToArray:(id)a3;
- (void)_addReadingInIBooksSectionSpecifiersToArray:(id)a3;
- (void)_addReadingMenuSectionSpecifiersToArray:(id)a3;
- (void)_addSearchingSection:(id)a3;
- (void)_addSyncingSectionSpecifiersToArray:(id)a3;
- (void)_clearReadingGoalsData:(id)a3;
- (void)_customizeCell:(id)a3 forKey:(id)a4;
- (void)_donateSettingsNavigationEvent;
- (void)_iCloudAccountAvailabilityChangedNotification:(id)a3;
- (void)_insertOutdatedDevicesCell;
- (void)_loadNetworkLimitAndReloadIfNeeded;
- (void)_loadSizeLimitsIfNeeded;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_makeOutdatedDevicesControllerIfNeeded;
- (void)_makeOutdatedDevicesSpecifierIfNeeded;
- (void)_networkChangedNotification:(id)a3;
- (void)_pushOutdatedDevicesController:(id)a3;
- (void)_refreshOutdatedDevicesCell;
- (void)_reloadAutomaticDownloadsSection;
- (void)_reloadCellularDataSection;
- (void)_reloadForLowPowerModeChange;
- (void)_removeOutdatedDevicesCell;
- (void)_resetAllowedOnlineContent:(id)a3;
- (void)_resetAnalyticsUserID:(id)a3;
- (void)_setAllowAutomaticDownloadsForPurchasesFromOtherDevices:(id)a3 specifier:(id)a4;
- (void)_setCellularAllowAutomaticDownloads:(id)a3 specifier:(id)a4;
- (void)_setICloudDriveEnabled:(id)a3 specifier:(id)a4;
- (void)_setIsAppGroupSpecifier:(id)a3;
- (void)_setReadingNowEnabled:(id)a3 specifier:(id)a4;
- (void)_setService:(__CFString *)a3 enabled:(BOOL)a4;
- (void)_toggleReadingGoals:(id)a3 specifier:(id)a4;
- (void)_updateAutomaticDownloadsSection;
- (void)_updateCellularDataGroupSpecifierFooterText:(id)a3;
- (void)_updateSyncingSectionSpecifiers;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)devicesControllerDidLoadDevices:(id)a3;
- (void)selectExternalControlPreference:(id)a3;
- (void)setExternalControlGroup:(id)a3;
- (void)showPrivacyExplanationSheet:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKSettingsController

- (BKSettingsController)init
{
  v32.receiver = self;
  v32.super_class = (Class)BKSettingsController;
  v2 = [(BKSettingsController *)&v32 init];
  if (v2)
  {
    v3 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.iBooks"];
    appPolicy = v2->_appPolicy;
    v2->_appPolicy = v3;

    v5 = +[BUAccountsProvider sharedProvider];
    [v5 addObserver:v2 accountTypes:1];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_iCloudAccountAvailabilityChangedNotification:" name:NSUbiquityIdentityDidChangeNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_networkChangedNotification:" name:BUNetworkMonitorInterfaceDidChangeNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_lowPowerModeChangedNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    id v9 = objc_alloc((Class)BUNetworkMonitor);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("BKSettingsController.networkMonitorQueue", v10);
    v12 = (BUNetworkMonitor *)[v9 initWithQueue:v11];
    networkMonitor = v2->_networkMonitor;
    v2->_networkMonitor = v12;

    v2->_isNetworkConnected = 0;
    [(BUNetworkMonitor *)v2->_networkMonitor start];
    v14 = +[NSProcessInfo processInfo];
    v2->_isLowPowerMode = [v14 isLowPowerModeEnabled];

    v15 = (CHSTimelineController *)[objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:@"com.apple.iBooks.BooksWidget" kind:@"BooksWidget"];
    timelineController = v2->_timelineController;
    v2->_timelineController = v15;

    v17 = +[BUAppGroup books];
    v18 = [v17 userDefaults];
    v19 = [v18 objectForKey:@"BKReadingGoalsUserDefaultsKey"];

    if (!v19)
    {
      v20 = +[NSUserDefaults standardUserDefaults];
      v21 = [v20 objectForKey:@"BKReadingGoalsUserDefaultsKey"];

      v22 = +[BUAppGroup books];
      v23 = [v22 userDefaults];
      [v23 setObject:v21 forKey:@"BKReadingGoalsUserDefaultsKey"];

      v24 = +[NSUserDefaults standardUserDefaults];
      [v24 removeObjectForKey:@"BKReadingGoalsUserDefaultsKey"];
    }
    v25 = [(BKSettingsController *)v2 _standardSwitchSpecifierNamed:@"New Specifier" keyName:@"BKIncludeBookStoreResultsInSearch" defaultValue:0];
    v31.receiver = v2;
    v31.super_class = (Class)BKSettingsController;
    v26 = [(BKSettingsController *)&v31 readPreferenceValue:v25];
    if (!v26 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v27 = [(BKSettingsController *)v2 _standardSwitchSpecifierNamed:@"Old Specifier" keyName:@"BKExcludeBookStoreResultsInSearch" defaultValue:0];
      v28 = [(BKSettingsController *)v2 readPreferenceValue:v27];
      if (objc_opt_respondsToSelector())
      {
        v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 BOOLValue] ^ 1);
      }
      else
      {
        v29 = &__kCFBooleanTrue;
      }
      [(BKSettingsController *)v2 setPreferenceValue:v29 specifier:v25];
      [(BKSettingsController *)v2 setPreferenceValue:0 specifier:v27];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[BUAccountsProvider sharedProvider];
  [v4 removeObserver:self accountTypes:1];

  v5.receiver = self;
  v5.super_class = (Class)BKSettingsController;
  [(BKSettingsController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKSettingsController *)self _loadSizeLimitsIfNeeded];
  [(BKSettingsController *)self _reloadCellularDataSection];
  v5.receiver = self;
  v5.super_class = (Class)BKSettingsController;
  [(BKSettingsController *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKSettingsController;
  [(BKSettingsController *)&v4 viewDidAppear:a3];
  [(BKSettingsController *)self _donateSettingsNavigationEvent];
}

- (void)_reloadForLowPowerModeChange
{
  BOOL v3 = +[NSProcessInfo processInfo];
  self->_isLowPowerMode = [v3 isLowPowerModeEnabled];

  [(BKSettingsController *)self _reloadAutomaticDownloadsSection];
}

- (void)_reloadAutomaticDownloadsSection
{
  [(BKSettingsController *)self _updateAutomaticDownloadsSection];
  if (self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier)
  {
    -[BKSettingsController reloadSpecifier:](self, "reloadSpecifier:");
  }
}

- (void)_reloadCellularDataSection
{
  if (self->_cellularDataGroupSpecifier)
  {
    -[BKSettingsController _updateCellularDataGroupSpecifierFooterText:](self, "_updateCellularDataGroupSpecifierFooterText:");
    [(BKSettingsController *)self reloadSpecifier:self->_cellularDataGroupSpecifier];
  }
  if (self->_cellularDownloadsSpecifier)
  {
    -[BKSettingsController reloadSpecifier:](self, "reloadSpecifier:");
  }
}

- (void)_loadSizeLimitsIfNeeded
{
}

- (void)_networkChangedNotification:(id)a3
{
  unsigned int v4 = [(BUNetworkMonitor *)self->_networkMonitor isConnected];
  BOOL v5 = v4;
  if (v4 && !self->_isNetworkConnected) {
    [(BKSettingsController *)self _loadSizeLimitsIfNeeded];
  }
  self->_isNetworkConnected = v5;
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8D80;
  block[3] = &unk_18810;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_standardButtonSpecifierNamed:(id)a3 selector:(SEL)a4
{
  return +[BKSettingsUtilities standardButtonSpecifierNamed:a3 target:self selector:a4];
}

- (id)_standardSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5
{
  return +[BKSettingsUtilities standardSwitchSpecifierNamed:a3 target:self keyName:a4 defaultValue:a5];
}

- (id)_groupSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5
{
  LOWORD(v6) = 1;
  return +[BKSettingsUtilities standardPreferenceSpecifierNamed:target:cell:detail:keyName:defaultValue:readFromAppGroupContainer:syncToWatch:](BKSettingsUtilities, "standardPreferenceSpecifierNamed:target:cell:detail:keyName:defaultValue:readFromAppGroupContainer:syncToWatch:", a3, self, 6, 0, a4, a5, v6);
}

- (id)_subtitleSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5
{
  return +[BKSettingsUtilities subtitleSwitchSpecifierNamed:a3 target:self keyName:a4 defaultValue:a5];
}

- (id)_customSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5 get:(SEL)a6 set:(SEL)a7
{
  return [(BKSettingsController *)self _customSwitchSpecifierNamed:a3 keyName:a4 defaultValue:a5 get:a6 set:a7 inAppGroup:0];
}

- (id)_customSwitchSpecifierNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5 get:(SEL)a6 set:(SEL)a7 inAppGroup:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a5;
  id v15 = a4;
  v16 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:a7 get:a6 detail:0 cell:6 edit:0];
  [v16 setObject:v15 forKeyedSubscript:PSKeyNameKey];

  [v16 setObject:v14 forKeyedSubscript:PSDefaultValueKey];
  [v16 setObject:@"com.apple.iBooks" forKeyedSubscript:PSDefaultsKey];
  [v16 setObject:@"com.apple.iBooks" forKeyedSubscript:PSContainerBundleIDKey];
  if (v8) {
    [(BKSettingsController *)self _setIsAppGroupSpecifier:v16];
  }

  return v16;
}

- (void)_setIsAppGroupSpecifier:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[BUAppGroup books];
  BOOL v5 = [v4 identifier];
  [v3 setObject:v5 forKeyedSubscript:PSAppGroupBundleIDKey];

  id v7 = +[BUAppGroup books];
  uint64_t v6 = [v7 identifier];
  [v3 setObject:v6 forKeyedSubscript:PSContainerBundleIDKey];
}

- (id)_audioBookSkipSettingsDurationNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5
{
  id v23 = a5;
  id v22 = a4;
  id v21 = a3;
  v20 = BKSettingsBundle();
  id v7 = [v20 localizedStringForKey:@"10 seconds" value:&stru_18CA0 table:@"Settings"];
  v25[0] = v7;
  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"15 seconds" value:&stru_18CA0 table:@"Settings"];
  v25[1] = v9;
  v10 = BKSettingsBundle();
  dispatch_queue_t v11 = [v10 localizedStringForKey:@"30 seconds" value:&stru_18CA0 table:@"Settings"];
  v25[2] = v11;
  v12 = BKSettingsBundle();
  v13 = [v12 localizedStringForKey:@"45 seconds" value:&stru_18CA0 table:@"Settings"];
  v25[3] = v13;
  id v14 = BKSettingsBundle();
  id v15 = [v14 localizedStringForKey:@"60 seconds" value:&stru_18CA0 table:@"Settings"];
  v25[4] = v15;
  v16 = +[NSArray arrayWithObjects:v25 count:5];

  LOBYTE(v19) = 1;
  v17 = +[BKSettingsUtilities linkListPreferenceSpecifierNamed:v21 target:self keyName:v22 defaultValue:v23 titles:v16 values:&off_1A0E0 syncToWatch:v19];

  return v17;
}

- (id)_pageTurnStyleOptionNamed:(id)a3 keyName:(id)a4 defaultValue:(id)a5
{
  id v21 = a5;
  id v20 = a4;
  id v7 = a3;
  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Slide" value:&stru_18CA0 table:@"Settings"];
  v23[0] = v9;
  v10 = BKSettingsBundle();
  dispatch_queue_t v11 = [v10 localizedStringForKey:@"Curl" value:&stru_18CA0 table:@"Settings"];
  v23[1] = v11;
  v12 = BKSettingsBundle();
  v13 = [v12 localizedStringForKey:@"Fast Fade" value:&stru_18CA0 table:@"Settings"];
  v23[2] = v13;
  id v14 = BKSettingsBundle();
  id v15 = [v14 localizedStringForKey:@"Scroll" value:&stru_18CA0 table:@"Settings"];
  v23[3] = v15;
  v16 = +[NSArray arrayWithObjects:v23 count:4];

  LOBYTE(v19) = 0;
  v17 = +[BKSettingsUtilities linkListPreferenceSpecifierNamed:v7 target:self keyName:v20 defaultValue:v21 titles:v16 values:&off_1A0F8 syncToWatch:v19];

  return v17;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    unsigned int v4 = objc_opt_new();
    [(BKSettingsController *)self _makeOutdatedDevicesControllerIfNeeded];
    BOOL v5 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:-134348801 force:0];
    [v4 addObjectsFromArray:v5];
    [(BKSettingsController *)self _addAutomaticDownloadsSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addCellularSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addSyncingSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addReadingMenuSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addReadingInIBooksSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addReadingGoalsSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addClearReadingGoalsDataSpecifiersToArray:v4];
    [(BKSettingsController *)self _addSearchingSection:v4];
    [(BKSettingsController *)self _addAudiobooksSectionSpecifiersToArray:v4];
    [(BKSettingsController *)self _addAudiobooksExternalControlsSpecifiersToArray:v4];
    [(BKSettingsController *)self _addPrivacySection:v4];
    [(BKSettingsController *)self _addAcknowledgementsSectionSpecifiersToArray:v4];
    id v6 = [v4 copy];
    id v7 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;
  }
  [(BKSettingsController *)self _updateSyncingSectionSpecifiers];
  BOOL v8 = *(void **)&self->PSListController_opaque[v3];

  return v8;
}

- (void)_makeOutdatedDevicesControllerIfNeeded
{
  if (!self->_outdatedDevicesController)
  {
    uint64_t v3 = [[BKSettingsOutdatedDevicesController alloc] initWithDelegate:self iOSRequiredVersion:@"12.0" macOSRequiredVersion:@"10.14"];
    outdatedDevicesController = self->_outdatedDevicesController;
    self->_outdatedDevicesController = v3;

    [(BKSettingsOutdatedDevicesController *)self->_outdatedDevicesController setParentController:self];
    BOOL v5 = self->_outdatedDevicesController;
    id v6 = [(BKSettingsController *)self rootController];
    [(BKSettingsOutdatedDevicesController *)v5 setRootController:v6];

    BKSettingsBundle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v9 localizedStringForKey:@"Update Other Devices" value:&stru_18CA0 table:@"Settings"];
    BOOL v8 = [(BKSettingsOutdatedDevicesController *)self->_outdatedDevicesController navigationItem];
    [v8 setTitle:v7];
  }
}

- (void)_makeOutdatedDevicesSpecifierIfNeeded
{
  if (!self->_outdatedDevicesSpecifier)
  {
    uint64_t v3 = BKSettingsBundle();
    id v6 = [v3 localizedStringForKey:@"Update Other Devices" value:&stru_18CA0 table:@"Settings"];

    unsigned int v4 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v6 target:self cell:2 detail:0 keyName:@"BKOutdatedDevices" defaultValue:0 set:0 get:"_numberOfOutdatedDevices:"];
    outdatedDevicesSpecifier = self->_outdatedDevicesSpecifier;
    self->_outdatedDevicesSpecifier = v4;

    [(PSSpecifier *)self->_outdatedDevicesSpecifier setIdentifier:@"UPDATE_OTHER_DEVICES"];
    [(PSSpecifier *)self->_outdatedDevicesSpecifier setControllerLoadAction:"_pushOutdatedDevicesController:"];
  }
}

- (void)_pushOutdatedDevicesController:(id)a3
{
  id v4 = [(BKSettingsController *)self navigationController];
  [v4 pushViewController:self->_outdatedDevicesController animated:1];
}

- (id)_numberOfOutdatedDevices:(id)a3
{
  return +[NSString stringWithFormat:@"%ld", [(BKSettingsOutdatedDevicesController *)self->_outdatedDevicesController numberOfDevices]];
}

- (BOOL)_isOutdatedDevicesCellInstalled
{
  return self->_outdatedDevicesSpecifier
      && objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "indexOfObjectIdenticalTo:") != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (void)_insertOutdatedDevicesCell
{
  if (![(BKSettingsController *)self _isOutdatedDevicesCellInstalled])
  {
    [(BKSettingsController *)self _makeOutdatedDevicesSpecifierIfNeeded];
    outdatedDevicesSpecifier = self->_outdatedDevicesSpecifier;
    syncGroupSpecifier = self->_syncGroupSpecifier;
    [(BKSettingsController *)self insertSpecifier:outdatedDevicesSpecifier afterSpecifier:syncGroupSpecifier animated:1];
  }
}

- (void)_removeOutdatedDevicesCell
{
  if ([(BKSettingsController *)self _isOutdatedDevicesCellInstalled])
  {
    uint64_t v3 = [(BKSettingsController *)self navigationController];
    id v4 = [v3 topViewController];
    outdatedDevicesController = self->_outdatedDevicesController;

    if (v4 == outdatedDevicesController)
    {
      id v6 = [(BKSettingsController *)self navigationController];
      id v7 = [v6 popViewControllerAnimated:1];
    }
    outdatedDevicesSpecifier = self->_outdatedDevicesSpecifier;
    [(BKSettingsController *)self removeSpecifier:outdatedDevicesSpecifier animated:1];
  }
}

- (void)_refreshOutdatedDevicesCell
{
  if ([(BKSettingsController *)self _isOutdatedDevicesCellInstalled])
  {
    id v5 = [(PSSpecifier *)self->_outdatedDevicesSpecifier propertyForKey:PSTableCellKey];
    objc_opt_class();
    BOOL v3 = (objc_opt_isKindOfClass() & 1) == 0;
    id v4 = v5;
    if (v3) {
      id v4 = 0;
    }
    [v4 refreshCellContentsWithSpecifier:self->_outdatedDevicesSpecifier];
  }
}

- (void)_addSyncingSectionSpecifiersToArray:(id)a3
{
  id v26 = a3;
  id v4 = BKSettingsBundle();
  id v5 = [v4 localizedStringForKey:@"Syncing" value:&stru_18CA0 table:@"Settings"];
  id v6 = +[PSSpecifier groupSpecifierWithName:v5];

  [v6 setIdentifier:@"SYNCING"];
  objc_storeStrong((id *)&self->_syncGroupSpecifier, v6);
  [v26 addObject:v6];
  v25 = +[NSMutableArray arrayWithCapacity:1];
  id v7 = +[NSMutableArray arrayWithCapacity:1];
  BOOL v8 = [(BKSettingsController *)self _standardSwitchSpecifierNamed:@"Fake Specifier" keyName:@"BKSettingsForceOutdatedDevices" defaultValue:&__kCFBooleanFalse];
  id v9 = [v8 target];
  v10 = [v9 readPreferenceValue:v8];

  if ([(BKSettingsController *)self _isSyncSectionEnabled]
    && (([v10 BOOLValue] & 1) != 0
     || [(BKSettingsOutdatedDevicesController *)self->_outdatedDevicesController numberOfDevices]))
  {
    dispatch_queue_t v11 = [v8 target];
    [v11 setPreferenceValue:&__kCFBooleanFalse specifier:v8];

    [(BKSettingsController *)self _makeOutdatedDevicesSpecifierIfNeeded];
    [v26 addObject:self->_outdatedDevicesSpecifier];
  }
  v12 = BKSettingsBundle();
  v13 = [v12 localizedStringForKey:@"Home" value:&stru_18CA0 table:@"Settings"];

  id v14 = [(BKSettingsController *)self _customSwitchSpecifierNamed:v13 keyName:@"BKLibrary.ReadingNow" defaultValue:&__kCFBooleanTrue get:"readSyncSectionForCloudKitPreferenceValue:" set:"_setReadingNowEnabled:specifier:"];
  v24 = v10;
  syncReadingNowSpecifier = self->_syncReadingNowSpecifier;
  self->_syncReadingNowSpecifier = v14;

  [v25 addObject:self->_syncReadingNowSpecifier];
  v16 = BKSettingsBundle();
  v17 = [v16 localizedStringForKey:@"iCloud Drive" value:&stru_18CA0 table:@"Settings"];
  v18 = [(BKSettingsController *)self _customSwitchSpecifierNamed:v17 keyName:@"BCSyncICloudDrive" defaultValue:&__kCFBooleanTrue get:"_getICloudDriveEnabled:" set:"_setICloudDriveEnabled:specifier:"];
  syncICloudDriveSpecifier = self->_syncICloudDriveSpecifier;
  self->_syncICloudDriveSpecifier = v18;

  [v7 addObject:self->_syncICloudDriveSpecifier];
  id v20 = (NSArray *)[v25 copy];
  syncingForCloudKitSpecifiers = self->_syncingForCloudKitSpecifiers;
  self->_syncingForCloudKitSpecifiers = v20;

  id v22 = (NSArray *)[v7 copy];
  syncingForICloudDriveSpecifiers = self->_syncingForICloudDriveSpecifiers;
  self->_syncingForICloudDriveSpecifiers = v22;

  [v26 addObjectsFromArray:self->_syncingForCloudKitSpecifiers];
  [v26 addObjectsFromArray:self->_syncingForICloudDriveSpecifiers];
}

- (id)_specifierWithTitle:(id)a3 customCell:(id)a4 set:(SEL)a5 get:(SEL)a6
{
  id v10 = a4;
  dispatch_queue_t v11 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:a5 get:a6 detail:0 cell:4 edit:0];
  [v11 setProperty:v10 forKey:PSCellClassKey];

  return v11;
}

- (void)_addReadingMenuSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  if (!self->_readingMenuPositionSpecifier)
  {
    id v5 = BKSettingsBundle();
    id v6 = [v5 localizedStringForKey:@"Reading Menu Position Options" value:&stru_18CA0 table:@"Settings"];
    id v7 = [(BKSettingsController *)self _specifierWithTitle:v6 customCell:objc_opt_class() set:"setPreferenceValue:specifier:" get:"readPreferenceValue:"];

    [v7 setObject:@"com.apple.iBooks" forKeyedSubscript:PSDefaultsKey];
    [v7 setObject:@"com.apple.iBooks" forKeyedSubscript:PSContainerBundleIDKey];
    readingMenuPositionSpecifier = self->_readingMenuPositionSpecifier;
    self->_readingMenuPositionSpecifier = (PSSpecifier *)v7;
  }
  id v9 = BKSettingsBundle();
  id v10 = [v9 localizedStringForKey:@"Reading Menu Position" value:&stru_18CA0 table:@"Settings"];
  dispatch_queue_t v11 = +[PSSpecifier groupSpecifierWithName:v10];

  [v11 setIdentifier:@"MENU_ON_LEFT"];
  v12 = self->_readingMenuPositionSpecifier;
  v14[0] = v11;
  v14[1] = v12;
  v13 = +[NSArray arrayWithObjects:v14 count:2];
  [v4 addObjectsFromArray:v13];
}

- (void)_addReadingInIBooksSectionSpecifiersToArray:(id)a3
{
  id v38 = a3;
  id v4 = BKSettingsBundle();
  id v5 = [v4 localizedStringForKey:@"Reading" value:&stru_18CA0 table:@"Settings"];
  v37 = +[PSSpecifier groupSpecifierWithName:v5];

  id v6 = BKSettingsBundle();
  id v7 = [v6 localizedStringForKey:@"Auto-hyphenation" value:&stru_18CA0 table:@"Settings"];
  v36 = [(BKSettingsController *)self _standardSwitchSpecifierNamed:v7 keyName:@"BKAutoHyphenation" defaultValue:&__kCFBooleanTrue];

  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Both Margins Advance" value:&stru_18CA0 table:@"Settings"];
  id v10 = [(BKSettingsController *)self _subtitleSwitchSpecifierNamed:v9 keyName:@"BKLeftTapTurnToNext" defaultValue:&__kCFBooleanFalse];

  dispatch_queue_t v11 = BKSettingsBundle();
  v12 = [v11 localizedStringForKey:@"Allow tapping either margin to advance the page, or to move the line guide forward when enabled in the reading menu.", &stru_18CA0, @"Settings" value table];
  uint64_t v13 = PSTableCellSubtitleTextKey;
  id v14 = v10;
  v35 = v10;
  [v10 setObject:v12 forKeyedSubscript:PSTableCellSubtitleTextKey];

  id v15 = BKSettingsBundle();
  v16 = [v15 localizedStringForKey:@"Automatically Invert Images" value:&stru_18CA0 table:@"Settings"];
  v17 = +[BooksSettings shared];
  v18 = [v17 filterBrightImagesKey];
  uint64_t v19 = [(BKSettingsController *)self _subtitleSwitchSpecifierNamed:v16 keyName:v18 defaultValue:&__kCFBooleanTrue];

  [v19 setIdentifier:@"IMAGE_FILTER"];
  [(BKSettingsController *)self _setIsAppGroupSpecifier:v19];
  id v20 = BKSettingsBundle();
  id v21 = [v20 localizedStringForKey:@"In darker themes, adjust black and white images to improve contrast.", &stru_18CA0, @"Settings" value table];
  [v19 setObject:v21 forKeyedSubscript:v13];

  v39[0] = v37;
  v39[1] = v36;
  v39[2] = v14;
  v39[3] = v19;
  id v22 = +[NSArray arrayWithObjects:v39 count:4];
  [v38 addObjectsFromArray:v22];

  id v23 = BKSettingsBundle();
  v24 = [v23 localizedStringForKey:@"Show Status Bar" value:&stru_18CA0 table:@"Settings"];
  v25 = [(BKSettingsController *)self _subtitleSwitchSpecifierNamed:v24 keyName:@"BKReaderShowStatusBar" defaultValue:&__kCFBooleanFalse];

  id v26 = +[UIDevice currentDevice];
  id v27 = [v26 userInterfaceIdiom];

  v28 = BKSettingsBundle();
  v29 = v28;
  if (v27) {
    CFStringRef v30 = @"Always display current time, battery level, and other iPad status info while reading.";
  }
  else {
    CFStringRef v30 = @"Always display current time, battery level, and other iPhone status info while reading.";
  }
  objc_super v31 = [v28 localizedStringForKey:v30 value:&stru_18CA0 table:@"Settings"];
  [v25 setObject:v31 forKeyedSubscript:v13];

  [v38 addObject:v25];
  objc_super v32 = BKSettingsBundle();
  v33 = [v32 localizedStringForKey:@"Page Navigation" value:&stru_18CA0 table:@"Settings"];
  v34 = [(BKSettingsController *)self _pageTurnStyleOptionNamed:v33 keyName:@"BKPageTurnStyle" defaultValue:@"slide"];

  [v38 addObject:v34];
}

- (void)_addReadingGoalsSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  id v6 = [v5 localizedStringForKey:@"Reading Goals" value:&stru_18CA0 table:@"Settings"];
  id v7 = +[PSSpecifier groupSpecifierWithName:v6];

  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Reading Goals" value:&stru_18CA0 table:@"Settings"];
  id v10 = [(BKSettingsController *)self _customSwitchSpecifierNamed:v9 keyName:@"BKReadingGoalsUserDefaultsKey" defaultValue:&__kCFBooleanTrue get:"readPreferenceValue:" set:"_toggleReadingGoals:specifier:" inAppGroup:1];

  dispatch_queue_t v11 = BKSettingsBundle();
  v12 = [v11 localizedStringForKey:@"Include PDFs" value:&stru_18CA0 table:@"Settings"];
  uint64_t v13 = [(BKSettingsController *)self _standardSwitchSpecifierNamed:v12 keyName:@"BKReadingGoalsIncludePDFsUserDefaultsKey" defaultValue:&__kCFBooleanFalse];

  [v10 setIdentifier:@"READING_GOALS"];
  id v14 = [v10 target];
  id v15 = [v14 readPreferenceValue:v10];

  if ([v15 BOOLValue])
  {
    v22[0] = v7;
    v22[1] = v10;
    v22[2] = v13;
    v16 = +[NSArray arrayWithObjects:v22 count:3];
    v17 = BKSettingsBundle();
    v18 = v17;
    CFStringRef v19 = @"Show time spent reading and other achievements in Apple Books. Include time spent reading PDFs";
  }
  else
  {
    v21[0] = v7;
    v21[1] = v10;
    v16 = +[NSArray arrayWithObjects:v21 count:2];
    v17 = BKSettingsBundle();
    v18 = v17;
    CFStringRef v19 = @"Show time spent reading and other achievements in Apple Books.";
  }
  id v20 = [v17 localizedStringForKey:v19 value:&stru_18CA0 table:@"Settings"];

  [v7 setObject:v20 forKeyedSubscript:PSFooterTextGroupKey];
  [v4 addObjectsFromArray:v16];
}

- (void)_toggleReadingGoals:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 target];
  [v8 setPreferenceValue:v6 specifier:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_A7B8;
  v10[3] = &unk_18838;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_addClearReadingGoalsDataSpecifiersToArray:(id)a3
{
  id v4 = a3;
  id v5 = +[PSSpecifier groupSpecifierWithName:&stru_18CA0];
  id v6 = BKSettingsBundle();
  id v7 = [v6 localizedStringForKey:@"Time spent reading and reading streak data will be cleared the next time you open Apple Books." value:&stru_18CA0 table:@"Settings"];
  [v5 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Clear Reading Goals Data" value:&stru_18CA0 table:@"Settings"];

  LOBYTE(v12) = 0;
  id v10 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v9 target:self cell:13 detail:0 keyName:@"BKReadingGoalsShouldClearDataKey" defaultValue:&__kCFBooleanFalse syncToWatch:v12];
  [v10 setButtonAction:"_clearReadingGoalsData:"];
  v13[0] = v5;
  v13[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:2];
  [v4 addObjectsFromArray:v11];
}

- (void)_addSearchingSection:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  id v6 = [v5 localizedStringForKey:@"Searching" value:&stru_18CA0 table:@"Settings"];
  id v7 = +[PSSpecifier groupSpecifierWithName:v6];

  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Include Book Store results when searching." value:&stru_18CA0 table:@"Settings"];
  [v7 setObject:v9 forKeyedSubscript:PSFooterTextGroupKey];

  id v10 = BKSettingsBundle();
  id v11 = [v10 localizedStringForKey:@"Book Store" value:&stru_18CA0 table:@"Settings"];
  uint64_t v12 = [(BKSettingsController *)self _standardSwitchSpecifierNamed:v11 keyName:@"BKIncludeBookStoreResultsInSearch" defaultValue:&__kCFBooleanTrue];

  v14[0] = v7;
  v14[1] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v14 count:2];
  [v4 addObjectsFromArray:v13];
}

- (void)_addAudiobooksSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  id v6 = [v5 localizedStringForKey:@"Audiobooks" value:&stru_18CA0 table:@"Settings"];
  id v7 = +[PSSpecifier groupSpecifierWithName:v6];

  BOOL v8 = BKSettingsBundle();
  id v9 = [v8 localizedStringForKey:@"Set the number of seconds to skip when you swipe the cover or tap the skip button." value:&stru_18CA0 table:@"Settings"];
  [v7 setObject:v9 forKeyedSubscript:PSFooterTextGroupKey];

  id v10 = BKSettingsBundle();
  id v11 = [v10 localizedStringForKey:@"Skip Forward" value:&stru_18CA0 table:@"Settings"];
  uint64_t v12 = [(BKSettingsController *)self _audioBookSkipSettingsDurationNamed:v11 keyName:@"BKAudioBookSkipForward" defaultValue:&off_1A010];

  uint64_t v13 = BKSettingsBundle();
  id v14 = [v13 localizedStringForKey:@"Skip Back" value:&stru_18CA0 table:@"Settings"];
  id v15 = [(BKSettingsController *)self _audioBookSkipSettingsDurationNamed:v14 keyName:@"BKAudioBookSkipBackward" defaultValue:&off_1A010];

  v17[0] = v7;
  v17[1] = v12;
  v17[2] = v15;
  v16 = +[NSArray arrayWithObjects:v17 count:3];
  [v4 addObjectsFromArray:v16];
}

- (void)selectExternalControlPreference:(id)a3
{
  uint64_t v4 = PSValueKey;
  id v5 = a3;
  id v9 = [v5 objectForKeyedSubscript:v4];
  id v6 = [(BKSettingsController *)self externalControlGroup];
  [(BKSettingsController *)self setPreferenceValue:v9 specifier:v6];

  id v7 = [(BKSettingsController *)self externalControlGroup];
  [v7 setProperty:v5 forKey:PSRadioGroupCheckedSpecifierKey];

  BOOL v8 = [(BKSettingsController *)self externalControlGroup];
  [(BKSettingsController *)self reloadSpecifier:v8];
}

- (void)_addAudiobooksExternalControlsSpecifiersToArray:(id)a3
{
  id v22 = a3;
  uint64_t v4 = BKSettingsBundle();
  id v5 = objc_msgSend(v4, "localizedStringForKey:value:table:", @"External Controls", &stru_18CA0);
  id v6 = +[PSSpecifier groupSpecifierWithName:v5];

  [v6 setObject:@"BKRemoteSkipInsteadOfNextTrackDefaultKey" forKeyedSubscript:PSKeyNameKey];
  [v6 setObject:@"com.apple.iBooks" forKeyedSubscript:PSDefaultsKey];
  [v6 setObject:@"com.apple.iBooks" forKeyedSubscript:PSContainerBundleIDKey];
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSIsRadioGroupKey];
  id v7 = BKSettingsBundle();
  BOOL v8 = [v7 localizedStringForKey:@"Headphones and car controls can be used to play the next/previous chapter, or skip forward/back within the audiobook.", &stru_18CA0, @"Settings" value table];
  [v6 setObject:v8 forKeyedSubscript:PSFooterTextGroupKey];

  [(BKSettingsController *)self setExternalControlGroup:v6];
  id v9 = BKSettingsBundle();
  id v10 = [v9 localizedStringForKey:@"Next/Previous" value:&stru_18CA0 table:@"Settings"];
  id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:3 edit:0];

  uint64_t v12 = PSValueKey;
  [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:PSValueKey];
  [v11 setButtonAction:"selectExternalControlPreference:"];
  uint64_t v13 = BKSettingsBundle();
  id v14 = [v13 localizedStringForKey:@"Skip Forward/Back" value:&stru_18CA0 table:@"Settings"];
  id v15 = self;
  v16 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:3 edit:0];

  [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:v12];
  [v16 setButtonAction:"selectExternalControlPreference:"];
  v17 = [(BKSettingsController *)v15 readPreferenceValue:v6];
  v18 = v17;
  if (!v17 || (unsigned int v19 = [v17 BOOLValue], v20 = v11, v19)) {
    id v20 = v16;
  }
  [v6 setObject:v20 forKeyedSubscript:PSRadioGroupCheckedSpecifierKey];
  v23[0] = v6;
  v23[1] = v11;
  v23[2] = v16;
  id v21 = +[NSArray arrayWithObjects:v23 count:3];
  [v22 addObjectsFromArray:v21];
}

- (BOOL)_currentLocalAutomaticDownloadForPurchasesFromOtherDevicesEnabled
{
  v2 = +[BUAccountsProvider sharedProvider];
  BOOL v3 = [v2 activeStoreAccount];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"automaticDownloadKinds"];
  id v5 = (void *)v4;
  id v6 = &__NSArray0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [objc_alloc((Class)NSSet) initWithArray:v7];
  id v9 = [objc_alloc((Class)NSSet) initWithArray:&off_1A110];
  unsigned __int8 v10 = [v9 isSubsetOfSet:v8];

  return v10;
}

- (id)_allowAutomaticDownloadsForPurchasesFromOtherDevices:(id)a3
{
  id v4 = a3;
  if (self->_isLowPowerMode)
  {
    id v5 = (NSNumber *)&__kCFBooleanFalse;
  }
  else
  {
    pendingAllowAutomaticDownloadsNumber = self->_pendingAllowAutomaticDownloadsNumber;
    if (pendingAllowAutomaticDownloadsNumber)
    {
      id v7 = pendingAllowAutomaticDownloadsNumber;
    }
    else
    {
      id v7 = +[NSNumber numberWithBool:[(BKSettingsController *)self _currentLocalAutomaticDownloadForPurchasesFromOtherDevicesEnabled]];
    }
    id v5 = v7;
  }

  return v5;
}

- (void)_setAllowAutomaticDownloadsForPurchasesFromOtherDevices:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  id v9 = +[NSNumber numberWithBool:v8];
  pendingAllowAutomaticDownloadsNumber = self->_pendingAllowAutomaticDownloadsNumber;
  self->_pendingAllowAutomaticDownloadsNumber = v9;

  objc_initWeak(&location, self);
  id v11 = +[BLDownloadQueue sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_B4D4;
  v12[3] = &unk_18888;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  [v11 setAutomaticDownloadEnabled:v8 uiManager:self withCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateAutomaticDownloadsSection
{
  automaticDownloadsForPurchasesFromOtherDevicesSpecifier = self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier;
  if (automaticDownloadsForPurchasesFromOtherDevicesSpecifier)
  {
    if (self->_isLowPowerMode)
    {
      id v4 = 0;
    }
    else
    {
      id v5 = +[MCProfileConnection sharedConnection];
      id v4 = [v5 isBookstoreAllowed];

      automaticDownloadsForPurchasesFromOtherDevicesSpecifier = self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier;
    }
    id v6 = +[NSNumber numberWithBool:v4];
    [(PSSpecifier *)automaticDownloadsForPurchasesFromOtherDevicesSpecifier setProperty:v6 forKey:PSEnabledKey];
  }
  if (self->_automaticDownloadsGroupSpecifier)
  {
    id v7 = BKSettingsBundle();
    id v11 = [v7 localizedStringForKey:@"Automatically download new purchases (including free) made on other devices." value:&stru_18CA0 table:@"Settings"];

    if (self->_isLowPowerMode)
    {
      id v8 = BKSettingsBundle();
      uint64_t v9 = [v8 localizedStringForKey:@"Automatic Downloads are not available while in Low Power Mode." value:&stru_18CA0 table:@"Settings"];

      id v10 = (id)v9;
    }
    else
    {
      id v10 = v11;
    }
    id v12 = v10;
    [(PSSpecifier *)self->_automaticDownloadsGroupSpecifier setProperty:v10 forKey:PSFooterTextGroupKey];
  }
}

- (void)_addAutomaticDownloadsSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  id v5 = +[BUAccountsProvider sharedProvider];
  unsigned int v6 = [v5 isUserSignedInToiTunes];

  if (v6)
  {
    id v7 = BKSettingsBundle();
    id v8 = [v7 localizedStringForKey:@"Automatic Downloads" value:&stru_18CA0 table:@"Settings"];
    uint64_t v9 = +[PSSpecifier groupSpecifierWithName:v8];
    automaticDownloadsGroupSpecifier = self->_automaticDownloadsGroupSpecifier;
    self->_automaticDownloadsGroupSpecifier = v9;

    id v11 = BKSettingsBundle();
    id v12 = [v11 localizedStringForKey:@"Purchases from Other Devices" value:&stru_18CA0 table:@"Settings"];
    id v13 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v12 target:self cell:6 detail:0 keyName:@"AllowAutoDownloadsForPurchasesFromOtherDevices" defaultValue:&__kCFBooleanFalse set:"_setAllowAutomaticDownloadsForPurchasesFromOtherDevices:specifier:" get:"_allowAutomaticDownloadsForPurchasesFromOtherDevices:"];
    automaticDownloadsForPurchasesFromOtherDevicesSpecifier = self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier;
    self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier = v13;

    [(PSSpecifier *)self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [(BKSettingsController *)self _updateAutomaticDownloadsSection];
    id v15 = self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier;
    v17[0] = self->_automaticDownloadsGroupSpecifier;
    v17[1] = v15;
    v16 = +[NSArray arrayWithObjects:v17 count:2];
    [v4 addObjectsFromArray:v16];
  }
}

- (BOOL)_shouldShowCellularDataSwitch
{
  if (!MGGetBoolAnswer() || !MGGetBoolAnswer()) {
    return 0;
  }

  return +[BUCellularSettings shouldShowCellularAutomaticDownloadsSwitch];
}

- (id)_cellularSettings
{
  cellularSettings = self->_cellularSettings;
  if (!cellularSettings)
  {
    id v4 = +[BKCellularSettingsUtilities cellularSettingsForCurrentIdentity];
    id v5 = self->_cellularSettings;
    self->_cellularSettings = v4;

    cellularSettings = self->_cellularSettings;
  }

  return cellularSettings;
}

- (void)_loadNetworkLimitAndReloadIfNeeded
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_BAD4;
  v2[3] = &unk_18860;
  objc_copyWeak(&v3, &location);
  +[BKCellularSettingsUtilities loadNetworkLimitForDownloadKind:@"book" runBlockIfNeedsUpdate:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)_formattedNetworkLimitAndReloadIfNeeded
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_BC8C;
  v4[3] = &unk_18860;
  objc_copyWeak(&v5, &location);
  v2 = +[BKCellularSettingsUtilities formattedNetworkLimitForDownloadKind:@"book" runBlockIfNeedsUpdate:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)_updateCellularDataGroupSpecifierFooterText:(id)a3
{
  id v3 = a3;
  id v4 = BKSettingsBundle();
  id v5 = [v4 localizedStringForKey:@"Choose whether books and audiobooks can automatically download over a cellular network." value:&stru_18CA0 table:@"Settings"];

  [v3 setProperty:v5 forKey:PSFooterTextGroupKey];
}

- (id)_cellularAllowAutomaticDownloads:(id)a3
{
  id v3 = [(BKSettingsController *)self _cellularSettings];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowAutomaticDownloads]);

  return v4;
}

- (void)_setCellularAllowAutomaticDownloads:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(BKSettingsController *)self _cellularSettings];
  id v6 = [v5 BOOLValue];

  [v7 setAllowAutomaticDownloads:v6];
}

- (id)_cellularDataSettingForSpecifier:(id)a3
{
  id v4 = [(BKSettingsController *)self _cellularSettings];
  id v5 = (char *)[v4 cellularDataPrompt];
  if (!v5)
  {
    id v7 = BKSettingsBundle();
    uint64_t v9 = [v7 localizedStringForKey:@"Ask If Over %@" value:&stru_18CA0 table:@"Settings"];
    id v10 = [(BKSettingsController *)self _formattedNetworkLimitAndReloadIfNeeded];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

LABEL_8:
    goto LABEL_10;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = BKSettingsBundle();
    id v7 = v6;
    CFStringRef v8 = @"Always Ask";
    goto LABEL_7;
  }
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    id v6 = BKSettingsBundle();
    id v7 = v6;
    CFStringRef v8 = @"Always Allow";
LABEL_7:
    id v11 = [v6 localizedStringForKey:v8 value:&stru_18CA0 table:@"Settings"];
    goto LABEL_8;
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

- (void)_addCellularSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  if ([(BKSettingsController *)self _shouldShowCellularDataSwitch])
  {
    id v5 = BKSettingsBundle();
    id v6 = [v5 localizedStringForKey:@"Cellular Data" value:&stru_18CA0 table:@"Settings"];
    id v7 = +[PSSpecifier groupSpecifierWithName:v6];
    cellularDataGroupSpecifier = self->_cellularDataGroupSpecifier;
    self->_cellularDataGroupSpecifier = v7;

    [(BKSettingsController *)self _updateCellularDataGroupSpecifierFooterText:self->_cellularDataGroupSpecifier];
    uint64_t v9 = BKSettingsBundle();
    id v10 = [v9 localizedStringForKey:@"Automatic Downloads" value:&stru_18CA0 table:@"Settings"];
    id v11 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v10 target:self cell:6 detail:0 keyName:@"AllowAutoDownloadOnCellular" defaultValue:&__kCFBooleanFalse set:"_setCellularAllowAutomaticDownloads:specifier:" get:"_cellularAllowAutomaticDownloads:"];

    id v12 = BKSettingsBundle();
    id v13 = [v12 localizedStringForKey:@"Downloads" value:&stru_18CA0 table:@"Settings"];
    id v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_cellularDataSettingForSpecifier:" detail:objc_opt_class() cell:2 edit:0];
    cellularDownloadsSpecifier = self->_cellularDownloadsSpecifier;
    self->_cellularDownloadsSpecifier = v14;

    v17[0] = self->_cellularDataGroupSpecifier;
    v17[1] = v11;
    void v17[2] = self->_cellularDownloadsSpecifier;
    v16 = +[NSArray arrayWithObjects:v17 count:3];
    [v4 addObjectsFromArray:v16];
  }
}

- (void)_addPrivacySection:(id)a3
{
  id v4 = a3;
  id v5 = BUOnboardingBooksBundleID();
  v34 = +[OBBundle bundleWithIdentifier:v5];

  id v6 = BKSettingsBundle();
  id v7 = [v6 localizedStringForKey:@"Online Content & Privacy" value:&stru_18CA0 table:@"Settings"];
  CFStringRef v8 = +[PSSpecifier groupSpecifierWithName:v7];

  uint64_t v9 = BKSettingsBundle();
  id v10 = [v9 localizedStringForKey:@"Clear permission for books to access publisher\\U2019s content from the Internet." value:&stru_18CA0 table:@"Settings"];
  uint64_t v11 = PSFooterTextGroupKey;
  v33 = v8;
  [v8 setObject:v10 forKeyedSubscript:PSFooterTextGroupKey];

  id v12 = BKSettingsBundle();
  v35 = [v12 localizedStringForKey:@"Reset Access to Online Content" value:&stru_18CA0 table:@"Settings"];

  LOBYTE(v31) = 0;
  id v13 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v35 target:self cell:13 detail:0 keyName:@"_BCWWebRepExternalLoadApprovalCacheClear" defaultValue:&__kCFBooleanFalse syncToWatch:v31];
  [v13 setIdentifier:@"ALLOW_ONLINE_CONTENT"];
  [v13 setButtonAction:"_resetAllowedOnlineContent:"];
  v37[0] = v8;
  v37[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v37 count:2];
  id v15 = v4;
  [v4 addObjectsFromArray:v14];

  v16 = +[PSSpecifier groupSpecifierWithName:0];
  v17 = BKSettingsBundle();
  v18 = [v17 localizedStringForKey:@"Reset the identifier used to report aggregate app usage statistics to Apple." value:&stru_18CA0 table:@"Settings"];

  unsigned int v19 = [v34 privacyFlow];
  id v20 = [v19 localizedButtonTitle];

  id v21 = +[NSString stringWithFormat:@"%@ %@", v18, v20];
  [v16 setObject:v21 forKeyedSubscript:v11];
  id v22 = (objc_class *)objc_opt_class();
  id v23 = NSStringFromClass(v22);
  [v16 setProperty:v23 forKey:PSFooterCellClassGroupKey];

  v24 = (char *)[v18 length] + 1;
  v38.length = (NSUInteger)[v20 length];
  v38.id location = (NSUInteger)v24;
  v25 = NSStringFromRange(v38);
  [v16 setProperty:v25 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v26 = +[NSValue valueWithNonretainedObject:self];
  [v16 setProperty:v26 forKey:PSFooterHyperlinkViewTargetKey];

  [v16 setProperty:@"showPrivacyExplanationSheet:" forKey:PSFooterHyperlinkViewActionKey];
  id v27 = BKSettingsBundle();
  v28 = [v27 localizedStringForKey:@"Reset Identifier" value:&stru_18CA0 table:@"Settings"];

  LOBYTE(v32) = 0;
  v29 = +[BKSettingsUtilities standardPreferenceSpecifierNamed:v28 target:self cell:13 detail:0 keyName:@"BAResetAnalyticsUserID" defaultValue:&__kCFBooleanFalse syncToWatch:v32];
  [v29 setButtonAction:"_resetAnalyticsUserID:"];
  v36[0] = v16;
  v36[1] = v29;
  CFStringRef v30 = +[NSArray arrayWithObjects:v36 count:2];
  [v15 addObjectsFromArray:v30];
}

- (void)_resetAllowedOnlineContent:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Clear permission for books to access publisher\\U2019s content from the Internet." value:&stru_18CA0 table:@"Settings"];

  v18 = (void *)v6;
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:v6 preferredStyle:0];
  CFStringRef v8 = BKSettingsBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Reset Access to Online Content" value:&stru_18CA0 table:@"Settings"];

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_C934;
  v19[3] = &unk_188B0;
  objc_copyWeak(&v22, &location);
  id v10 = v4;
  id v20 = v10;
  id v21 = self;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v19];
  [v7 addAction:v11];
  id v12 = BKSettingsBundle();
  id v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_18CA0 table:@"Settings"];

  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];
  id v15 = [v7 popoverPresentationController];
  uint64_t v16 = [v10 objectForKeyedSubscript:PSTableCellKey];
  v17 = (void *)v16;
  if (v15 && v16)
  {
    [v15 setSourceView:v16];
    [v17 bounds];
    objc_msgSend(v15, "setSourceRect:");
    [v15 setPermittedArrowDirections:3];
  }
  [(BKSettingsController *)self presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_resetAnalyticsUserID:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Reset Identifier" value:&stru_18CA0 table:@"Settings"];

  v18 = (void *)v6;
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:v6 preferredStyle:0];
  CFStringRef v8 = BKSettingsBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Reset Identifier" value:&stru_18CA0 table:@"Settings"];

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_CC68;
  v19[3] = &unk_188B0;
  objc_copyWeak(&v22, &location);
  id v10 = v4;
  id v20 = v10;
  id v21 = self;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v19];
  [v7 addAction:v11];
  id v12 = BKSettingsBundle();
  id v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_18CA0 table:@"Settings"];

  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];
  id v15 = [v7 popoverPresentationController];
  uint64_t v16 = [v10 objectForKeyedSubscript:PSTableCellKey];
  v17 = (void *)v16;
  if (v15 && v16)
  {
    [v15 setSourceView:v16];
    [v17 bounds];
    objc_msgSend(v15, "setSourceRect:");
    [v15 setPermittedArrowDirections:3];
  }
  [(BKSettingsController *)self presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)showPrivacyExplanationSheet:(id)a3
{
  id v4 = BUOnboardingAllBundleIDs();
  id v5 = BKSettingsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "showPrivacyExplanationSheet: bundleIdentifiers: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ([v4 count] == (char *)&dword_0 + 1)
  {
    uint64_t v6 = [v4 firstObject];
    id v7 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:v6];
  }
  else
  {
    id v7 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:v4];
  }
  [v7 setPresentingViewController:self];
  [v7 present];
}

- (void)_addAcknowledgementsSectionSpecifiersToArray:(id)a3
{
  id v4 = a3;
  id v5 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v6 = BKSettingsBundle();
  id v7 = [v6 localizedStringForKey:@"Acknowledgements" value:&stru_18CA0 table:@"Settings"];
  int v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v8 setIdentifier:@"Acknowledgements"];
  v10[0] = v5;
  v10[1] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v4 addObjectsFromArray:v9];
}

- (void)_updateSyncingSectionSpecifiers
{
  unsigned int v3 = [(BKSettingsController *)self _isSyncSectionForCloudKitEnabled];
  unsigned int v4 = [(BKSettingsController *)self _isSyncSectionForICloudDriveEnabled];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = self->_syncingForCloudKitSpecifiers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    if (v3) {
      uint64_t v9 = &__kCFBooleanTrue;
    }
    else {
      uint64_t v9 = &__kCFBooleanFalse;
    }
    uint64_t v10 = PSEnabledKey;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) setObject:v9 forKeyedSubscript:v10];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }
  char v12 = v3 | v4;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = self->_syncingForICloudDriveSpecifiers;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    if (v4) {
      v17 = &__kCFBooleanTrue;
    }
    else {
      v17 = &__kCFBooleanFalse;
    }
    uint64_t v18 = PSEnabledKey;
    do
    {
      unsigned int v19 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v19), "setObject:forKeyedSubscript:", v17, v18, (void)v27);
        unsigned int v19 = (char *)v19 + 1;
      }
      while (v15 != v19);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v15);
  }

  if (v12)
  {
    [(BKSettingsOutdatedDevicesController *)self->_outdatedDevicesController refresh];
    id v20 = [(BKSettingsController *)self readSyncSectionForCloudKitPreferenceValue:self->_syncReadingNowSpecifier];
    if ([v20 BOOLValue])
    {

LABEL_27:
      id v21 = BKSettingsBundle();
      id v22 = v21;
      CFStringRef v23 = @"The Continue and Previous lists in Home sync using your iCloud account. Use iCloud Drive to sync PDFs you’ve added to your library.";
      goto LABEL_28;
    }
    v24 = [(BKSettingsController *)self readSyncSectionForICloudDrivePreferenceValue:self->_syncICloudDriveSpecifier];
    unsigned int v25 = [v24 BOOLValue];

    if (!v25) {
      goto LABEL_27;
    }
    id v21 = BKSettingsBundle();
    id v22 = v21;
    CFStringRef v23 = @"When Home is enabled, your Continue and Previous lists will start syncing to iCloud the next time you open a book.";
  }
  else
  {
    [(BKSettingsController *)self _removeOutdatedDevicesCell];
    id v21 = BKSettingsBundle();
    id v22 = v21;
    CFStringRef v23 = @"To enable syncing across devices, sign in to iCloud and turn on iCloud Drive in Settings.";
  }
LABEL_28:
  id v26 = objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_18CA0, @"Settings", (void)v27);
  [(PSSpecifier *)self->_syncGroupSpecifier setObject:v26 forKeyedSubscript:PSFooterTextGroupKey];
}

- (void)_clearReadingGoalsData:(id)a3
{
  id v4 = a3;
  id v5 = BKSettingsBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Do you want to clear reading goals data from all of your devices using this iCloud account?" value:&stru_18CA0 table:@"Settings"];

  uint64_t v18 = (void *)v6;
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:v6 preferredStyle:0];
  uint64_t v8 = BKSettingsBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"Clear Reading Goals Data" value:&stru_18CA0 table:@"Settings"];

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_D518;
  v19[3] = &unk_188D8;
  objc_copyWeak(&v21, &location);
  id v10 = v4;
  id v20 = v10;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v19];
  [v7 addAction:v11];
  char v12 = BKSettingsBundle();
  id v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_18CA0 table:@"Settings"];

  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v7 addAction:v14];
  id v15 = [v7 popoverPresentationController];
  uint64_t v16 = [v10 objectForKeyedSubscript:PSTableCellKey];
  v17 = (void *)v16;
  if (v15 && v16)
  {
    [v15 setSourceView:v16];
    [v17 bounds];
    objc_msgSend(v15, "setSourceRect:");
    [v15 setPermittedArrowDirections:3];
  }
  [(BKSettingsController *)self presentViewController:v7 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (BOOL)_isSyncSectionEnabled
{
  if ([(BKSettingsController *)self _isSyncSectionForCloudKitEnabled]) {
    return 1;
  }

  return [(BKSettingsController *)self _isSyncSectionForICloudDriveEnabled];
}

- (BOOL)_isSyncSectionForCloudKitEnabled
{
  BOOL v3 = [(BKSettingsController *)self _isSignedInToICloud];
  if (v3)
  {
    LOBYTE(v3) = [(BKSettingsController *)self _isLiverpoolTCCEnabled];
  }
  return v3;
}

- (BOOL)_isSyncSectionForICloudDriveEnabled
{
  if (![(BKSettingsController *)self _isSignedInToICloud]
    || ![(BKSettingsController *)self _isGlobalICloudDriveEnabled])
  {
    return 0;
  }

  return [(BKSettingsController *)self _isLiverpoolTCCEnabled];
}

- (BOOL)_isSignedInToICloud
{
  v2 = +[BUAccountsProvider sharedProvider];
  BOOL v3 = [v2 primaryAppleAccount];

  id v4 = [v3 accountType];
  id v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:ACAccountTypeIdentifierAppleAccount];

  return v6;
}

- (BOOL)_isGlobalICloudDriveEnabled
{
  v2 = +[ACAccountStore bu_sharedAccountStore];
  BOOL v3 = objc_msgSend(v2, "ams_activeiCloudAccount");

  if ([v3 isEnabledForDataclass:kAccountDataclassUbiquity]) {
    unsigned __int8 v4 = objc_msgSend(v3, "aa_isUsingCloudDocs");
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_isLiverpoolTCCEnabled
{
  int64_t v3 = [(BKSettingsController *)self _isServiceEnabled:kTCCServiceLiverpool];
  unsigned __int8 v4 = BKSettingsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = kTCCServiceLiverpool;
    unsigned __int8 v6 = @"unknown";
    if (v3 == 2) {
      unsigned __int8 v6 = @"enabled";
    }
    if (v3 == 1) {
      unsigned __int8 v6 = @"disabled";
    }
    id v7 = v6;
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "iBooksSettings: %{public}@ is %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (v3 == 2)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    if (v3 == 1)
    {
      if (![(BKSettingsController *)self _isUbiquityTCCEnabled])
      {
        LOBYTE(v9) = 0;
        return v9;
      }
      uint64_t v8 = BKSettingsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_isLiverpoolTCCEnabled - liverpool OFF, ubiquity ON --> forcing liverpool ON", (uint8_t *)&v11, 2u);
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = [(BKSettingsController *)self _isUbiquityTCCEnabled];
      uint64_t v8 = BKSettingsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        LODWORD(v12) = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_isLiverpoolTCCEnabled - Setting unknown liverpool value to %{BOOL}d", (uint8_t *)&v11, 8u);
      }
    }

    [(BKSettingsController *)self _setService:kTCCServiceLiverpool enabled:v9];
  }
  return v9;
}

- (BOOL)_isUbiquityTCCEnabled
{
  int64_t v2 = [(BKSettingsController *)self _isServiceEnabled:kTCCServiceUbiquity];
  int64_t v3 = BKSettingsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = kTCCServiceUbiquity;
    uint64_t v5 = @"unknown";
    if (v2 == 2) {
      uint64_t v5 = @"enabled";
    }
    if (v2 == 1) {
      uint64_t v5 = @"disabled";
    }
    unsigned __int8 v6 = v5;
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    int v11 = v6;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "iBooksSettings: %{public}@ is %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v2 == 2;
}

- (BOOL)_isSignedInToITunes
{
  int64_t v2 = +[BUAccountsProvider sharedProvider];
  int64_t v3 = [v2 activeStoreAccount];

  uint64_t v4 = objc_msgSend(v3, "ams_DSID");
  if (v4)
  {
    uint64_t v5 = [v3 username];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_isServiceEnabled:(__CFString *)a3
{
  CFBundleGetBundleWithIdentifier(@"com.apple.iBooks");
  CFArrayRef v4 = (const __CFArray *)TCCAccessCopyInformationForBundle();
  CFIndex Count = CFArrayGetCount(v4);
  if (Count)
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, kTCCInfoService);
        if (CFEqual(Value, a3)) {
          break;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
    CFBooleanRef v12 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, kTCCInfoGranted);
    if (CFBooleanGetValue(v12)) {
      int64_t v11 = 2;
    }
    else {
      int64_t v11 = 1;
    }
  }
  else
  {
LABEL_6:
    int64_t v11 = 0;
  }
  CFRelease(v4);
  return v11;
}

- (void)_setService:(__CFString *)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  CFIndex v6 = BKSettingsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v15 = 138412546;
    uint64_t v16 = a3;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting %@ to %@.", (uint8_t *)&v15, 0x16u);
  }

  int v8 = TCCAccessSetForBundleId();
  CFTypeID v9 = BKSettingsLog();
  __int16 v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"off";
      if (v4) {
        CFStringRef v11 = @"on";
      }
      int v15 = 138543618;
      uint64_t v16 = a3;
      __int16 v17 = 2114;
      CFStringRef v18 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "iBooksSettings: Successfully set %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_F670((uint64_t)a3, v4, v10);
  }

  uint32_t v12 = notify_post((const char *)[@"com.apple.librarian.account-token-changed" UTF8String]);
  __int16 v13 = BKSettingsLog();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_F5E4(v12, v14);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    uint64_t v16 = @"com.apple.librarian.account-token-changed";
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "iBooksSettings: Successfully notify_post(%{public}@)", (uint8_t *)&v15, 0xCu);
  }
}

- (id)readSyncSectionForCloudKitPreferenceValue:(id)a3
{
  id v4 = a3;
  if ([(BKSettingsController *)self _isSyncSectionForCloudKitEnabled])
  {
    uint64_t v5 = [v4 target];
    CFIndex v6 = [v5 readPreferenceValue:v4];
  }
  else
  {
    CFIndex v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (id)readSyncSectionForICloudDrivePreferenceValue:(id)a3
{
  id v4 = a3;
  if ([(BKSettingsController *)self _isSyncSectionForICloudDriveEnabled])
  {
    uint64_t v5 = [v4 target];
    CFIndex v6 = [v5 readPreferenceValue:v4];
  }
  else
  {
    CFIndex v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (void)_setReadingNowEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 target];
  objc_msgSend(v8, "bk_setAndSyncPreferenceToWatch:specifier:", v7, v6);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DFC4;
  block[3] = &unk_18810;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_getICloudDriveEnabled:(id)a3
{
  id v4 = [(BKSettingsController *)self readSyncSectionForICloudDrivePreferenceValue:a3];
  uint64_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 BOOLValue] & -[BKSettingsController _isUbiquityTCCEnabled](self, "_isUbiquityTCCEnabled"));

  return v5;
}

- (void)_setICloudDriveEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 isEqual:&__kCFBooleanTrue];
  [(BKSettingsController *)self _setService:kTCCServiceUbiquity enabled:v7];
  int v8 = [v6 target];
  CFTypeID v9 = +[NSNumber numberWithBool:v7];
  [v8 setPreferenceValue:v9 specifier:v6];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E14C;
  block[3] = &unk_18810;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_iCloudAccountAvailabilityChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E1C8;
  block[3] = &unk_18810;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)devicesControllerDidLoadDevices:(id)a3
{
  id v4 = a3;
  if ([(BKSettingsController *)self _isSyncSectionEnabled]
    && [v4 numberOfDevices])
  {
    if ([(BKSettingsController *)self _isOutdatedDevicesCellInstalled]) {
      [(BKSettingsController *)self _refreshOutdatedDevicesCell];
    }
    else {
      [(BKSettingsController *)self _insertOutdatedDevicesCell];
    }
  }
  else
  {
    [(BKSettingsController *)self _removeOutdatedDevicesCell];
  }
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E2D4;
    block[3] = &unk_18810;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21[0] = @"_BCWWebRepExternalLoadApprovalCacheClear";
  v21[1] = @"BKLeftTapTurnToNext";
  id v6 = a4;
  id v7 = a3;
  int v8 = +[BooksSettings shared];
  CFTypeID v9 = [v8 filterBrightImagesKey];
  void v21[2] = v9;
  v21[3] = @"BKReaderShowStatusBar";
  __int16 v10 = +[NSArray arrayWithObjects:v21 count:4];

  v20.receiver = self;
  v20.super_class = (Class)BKSettingsController;
  CFStringRef v11 = [(BKSettingsController *)&v20 tableView:v7 cellForRowAtIndexPath:v6];

  objc_opt_class();
  uint32_t v12 = BUDynamicCast();
  __int16 v13 = v12;
  if (v12)
  {
    id v14 = [v12 specifier];
    int v15 = [v14 identifier];
    unsigned int v16 = [v10 containsObject:v15];

    if (v16)
    {
      __int16 v17 = [v13 specifier];
      CFStringRef v18 = [v17 identifier];
      [(BKSettingsController *)self _customizeCell:v13 forKey:v18];
    }
  }

  return v11;
}

- (void)_customizeCell:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"_BCWWebRepExternalLoadApprovalCacheClear"])
  {
    id v6 = [v5 titleLabel];
    [v6 setNumberOfLines:0];

    [v5 titleLabel];
  }
  else
  {
    id v7 = [v5 detailTextLabel];
    [v7 setNumberOfLines:0];

    [v5 detailTextLabel];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setLineBreakMode:0];
}

- (NSString)presentingSceneIdentifier
{
  return 0;
}

- (BOOL)downloadQueue:(id)a3 shouldShowAuthenticateForRequest:(id)a4
{
  return 1;
}

- (BOOL)downloadQueue:(id)a3 shouldShowDialogForRequest:(id)a4
{
  return 1;
}

- (BOOL)downloadQueue:(id)a3 shouldShowEngagementForRequest:(id)a4
{
  return 1;
}

- (id)downloadQueue:(id)a3 viewControllerToPresentAuthenticateUIForRequest:(id)a4
{
  return [(BKSettingsController *)self _viewControllerToPresentDialog];
}

- (id)downloadQueue:(id)a3 viewControllerToPresentDialogUIForRequest:(id)a4
{
  return [(BKSettingsController *)self _viewControllerToPresentDialog];
}

- (id)downloadQueue:(id)a3 viewControllerToPresentEngagementUIForRequest:(id)a4
{
  return [(BKSettingsController *)self _viewControllerToPresentDialog];
}

- (PSSpecifier)externalControlGroup
{
  return self->_externalControlGroup;
}

- (void)setExternalControlGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalControlGroup, 0);
  objc_storeStrong((id *)&self->_timelineController, 0);
  objc_storeStrong((id *)&self->_pendingAllowAutomaticDownloadsNumber, 0);
  objc_storeStrong((id *)&self->_outdatedDevicesController, 0);
  objc_storeStrong((id *)&self->_readingMenuPositionSpecifier, 0);
  objc_storeStrong((id *)&self->_cellularDownloadsSpecifier, 0);
  objc_storeStrong((id *)&self->_cellularDataGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticDownloadsForPurchasesFromOtherDevicesSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticDownloadsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_outdatedDevicesSpecifier, 0);
  objc_storeStrong((id *)&self->_syncICloudDriveSpecifier, 0);
  objc_storeStrong((id *)&self->_syncReadingNowSpecifier, 0);
  objc_storeStrong((id *)&self->_syncingForICloudDriveSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncingForCloudKitSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_cellularSettings, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

- (void)_donateSettingsNavigationEvent
{
  sub_F7F0();
  sub_F7E0();
  sub_F7D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int64_t v3 = self;
  BKSettingsController._donateSettingsNavigationEvent()();
  swift_release();
}

@end