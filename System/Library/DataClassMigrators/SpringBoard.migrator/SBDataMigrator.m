@interface SBDataMigrator
- (BOOL)_needsTigrisDataStoreMigration;
- (BOOL)isEphemeralMultiUser;
- (BOOL)performMigration;
- (SBDataMigrator)init;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
- (void)_saveNewLastBuildVersion;
- (void)informPaperBoardOfMigration;
- (void)performALSMigration;
- (void)performBadgingDisabledMigration;
- (void)performBatteryPercentageSettingMigrationIfNecessary;
- (void)performCalendarWidgetIconMigrationIfNecessary;
- (void)performDynamicVolumeButtonsMigrationIfNecessary;
- (void)performIconSizeMigrationIfNecessary;
- (void)performLiftToWakeDefaultsResetIfNecessary;
- (void)performNewsWidgetIconMigrationIfNecessary;
- (void)performPinnedWidgetsDefaultsResetIfNecessary;
- (void)performPosterBoardMigration;
- (void)performShortcutStoreMigrationIfNecessary;
- (void)performSplashBoardLaunchImagesMigration;
- (void)performSplashBoardSystemLaunchImagesMigrationRecreating:(id)a3;
- (void)performTigrisDataStoreMigrationIfNecessary;
- (void)warmUpIcons;
@end

@implementation SBDataMigrator

- (SBDataMigrator)init
{
  v23.receiver = self;
  v23.super_class = (Class)SBDataMigrator;
  v2 = [(SBDataMigrator *)&v23 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    allInstalledApps = v2->_allInstalledApps;
    v2->_allInstalledApps = (NSMutableArray *)v3;

    if (![(SBDataMigrator *)v2 isEphemeralMultiUser])
    {
      v5 = +[LSApplicationRecord enumeratorWithOptions:0];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          v9 = 0;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            [(NSMutableArray *)v2->_allInstalledApps addObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }
    }
    v10 = objc_alloc_init(SBSplashBoardMigrationController);
    xbController = v2->_xbController;
    v2->_xbController = v10;

    v12 = objc_alloc_init(SBDataMigratorDefaults);
    migratorDefaults = v2->_migratorDefaults;
    v2->_migratorDefaults = v12;

    id v14 = objc_alloc((Class)SBFBuildVersion);
    v15 = [(SBDataMigratorDefaults *)v2->_migratorDefaults lastSystemBuildVersion];
    v16 = (SBFBuildVersion *)[v14 initWithString:v15];
    lastBuildVersion = v2->_lastBuildVersion;
    v2->_lastBuildVersion = v16;
  }
  return v2;
}

- (id)dataClassName
{
  return @"springboard";
}

- (float)estimatedDuration
{
  float v3 = (double)(unint64_t)[(NSMutableArray *)self->_allInstalledApps count] * 0.1 + 0.5;
  v4 = [(SBSplashBoardMigrationController *)self->_xbController allSplashBoardApplications];
  float v5 = v3 + (double)(unint64_t)[v4 count] * 0.2;

  if ([(SBDataMigrator *)self _needsTigrisDataStoreMigration])
  {
    id v6 = +[FBSApplicationDataStore applicationsWithAvailableStores];
    float v5 = v5 + (double)(unint64_t)[v6 count] * 0.02;
  }
  return v5;
}

- (float)migrationProgress
{
  float result = 0.0;
  if (!self->_done) {
    return 1.0;
  }
  return result;
}

- (BOOL)performMigration
{
  [(SBDataMigrator *)self warmUpIcons];
  float v3 = [(SBSplashBoardMigrationController *)self->_xbController systemAppsNeedingMigrationLaunchImages];
  [(SBDataMigrator *)self performSplashBoardLaunchImagesMigration];
  [(SBDataMigrator *)self performSplashBoardSystemLaunchImagesMigrationRecreating:v3];
  [(SBDataMigrator *)self performALSMigration];
  [(SBDataMigrator *)self performBadgingDisabledMigration];
  [(SBDataMigrator *)self performTigrisDataStoreMigrationIfNecessary];
  [(SBDataMigrator *)self performShortcutStoreMigrationIfNecessary];
  [(SBDataMigrator *)self performLiftToWakeDefaultsResetIfNecessary];
  [(SBDataMigrator *)self performPinnedWidgetsDefaultsResetIfNecessary];
  [(SBDataMigrator *)self performNewsWidgetIconMigrationIfNecessary];
  [(SBDataMigrator *)self performCalendarWidgetIconMigrationIfNecessary];
  [(SBDataMigrator *)self performIconSizeMigrationIfNecessary];
  [(SBDataMigrator *)self performDynamicVolumeButtonsMigrationIfNecessary];
  [(SBDataMigrator *)self performPosterBoardMigration];
  [(SBDataMigrator *)self performBatteryPercentageSettingMigrationIfNecessary];
  +[FBSApplicationDataStore synchronize];
  [(SBDataMigrator *)self _saveNewLastBuildVersion];
  self->_done = 1;

  return 1;
}

- (void)_saveNewLastBuildVersion
{
  float v3 = (void *)_CFCopySystemVersionDictionary();
  id v4 = objc_alloc((Class)SBFBuildVersion);
  float v5 = [v3 objectForKey:_kCFSystemVersionBuildVersionKey];
  id v6 = [v4 initWithString:v5];

  id v7 = [v6 stringRepresentation];
  uint64_t v8 = SBLogCommon();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Saving new migrator last build version: %@", (uint8_t *)&v10, 0xCu);
    }

    [(SBDataMigratorDefaults *)self->_migratorDefaults setLastSystemBuildVersion:v7];
    [(SBDataMigratorDefaults *)self->_migratorDefaults synchronizeDefaults];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_107F8();
    }
  }
}

- (BOOL)isEphemeralMultiUser
{
  v2 = +[UMUserManager sharedManager];
  if ([v2 isMultiUser])
  {
    float v3 = [v2 currentUser];
    BOOL v4 = [v3 userType] == (char *)&dword_0 + 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)warmUpIcons
{
  if (![(SBDataMigrator *)self isEphemeralMultiUser])
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0x4000000000000000;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_B9D4;
    long long v19 = &unk_196D8;
    long long v21 = v22;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    BSDispatchMain();
    dispatch_semaphore_t v11 = v20;
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    float v3 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorHomeScreen];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = self->_allInstalledApps;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) bundleIdentifier];
          if (v8)
          {
            id v9 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v8];
            objc_super v23 = v3;
            int v10 = +[NSArray arrayWithObjects:&v23 count:1];
            [v9 prepareImagesForImageDescriptors:v10];
          }
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v24 count:16];
      }
      while (v5);
    }

    _Block_object_dispose(v22, 8);
  }
}

- (void)performALSMigration
{
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.backboardd"];
  float v3 = [v7 dictionaryRepresentation];
  BOOL v4 = [v3 allKeys];
  unsigned int v5 = [v4 containsObject:@"SBEnableALS"];

  if (v5)
  {
    id v6 = [v7 BOOLForKey:@"SBEnableALS"];
    [v7 removeObjectForKey:@"SBEnableALS"];
    [v2 setBool:v6 forKey:@"BKEnableALS"];
  }
}

- (void)performBadgingDisabledMigration
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  id v2 = [v3 objectForKey:@"SBDisplayIDsWithBadgingDisabled"];
  if (v2) {
    [v3 removeObjectForKey:@"SBDisplayIDsWithBadgingDisabled"];
  }
}

- (void)performSplashBoardLaunchImagesMigration
{
  if ([(SBDataMigrator *)self didMigrateBackupFromDifferentDevice])
  {
    xbController = self->_xbController;
    [(SBSplashBoardMigrationController *)xbController performCleanupAfterDifferentDeviceMigration];
  }
}

- (void)performSplashBoardSystemLaunchImagesMigrationRecreating:(id)a3
{
  id v4 = a3;
  if (![(SBDataMigrator *)self isEphemeralMultiUser]) {
    [(SBSplashBoardMigrationController *)self->_xbController performSystemAppMigrationRecreating:v4];
  }
}

- (BOOL)_needsTigrisDataStoreMigration
{
  id v3 = [(SBDataMigratorDefaults *)self->_migratorDefaults _store];
  unsigned __int8 v4 = objc_msgSend(v3, "bs_defaultExists:", @"lastBuildVersion");

  lastBuildVersion = self->_lastBuildVersion;
  if (!lastBuildVersion) {
    goto LABEL_6;
  }
  if ((uint64_t)[(SBFBuildVersion *)lastBuildVersion majorBuildNumber] >= 15)
  {
    if ([(SBFBuildVersion *)self->_lastBuildVersion majorBuildNumber] == (char *)&dword_C + 3)
    {
      BOOL v6 = (uint64_t)[(SBFBuildVersion *)self->_lastBuildVersion minorBuildNumber] < 218;
      return v4 ^ 1 | v6;
    }
LABEL_6:
    BOOL v6 = 0;
    return v4 ^ 1 | v6;
  }
  BOOL v6 = 1;
  return v4 ^ 1 | v6;
}

- (void)performTigrisDataStoreMigrationIfNecessary
{
  if ([(SBDataMigrator *)self _needsTigrisDataStoreMigration])
  {
    id v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Migrating data store data for iOS 11", buf, 2u);
    }

    +[FBSApplicationDataStore applicationsWithAvailableStores];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [obj countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        BOOL v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = +[FBSApplicationDataStore storeForApplication:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6)];
          [v7 removeObjectForKey:@"SBDefaultStatusBarStyleKey"];
          [v7 removeObjectForKey:@"SBDefaultStatusBarHiddenKey"];
          [v7 removeObjectForKey:@"SBDefaultPNGNameKey"];
          [v7 removeObjectForKey:@"kSBDefaultPNGExpirationAbsoluteTimeKey"];
          [v7 removeObjectForKey:@"SBClassicAppZoomedInKey"];
          [v7 removeObjectForKey:@"SBApplication32DeprecationAcknowledgementDateKey"];
          [v7 removeObjectForKey:@"uninstallAllowed"];

          BOOL v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [obj countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v4);
    }
  }
}

- (void)performShortcutStoreMigrationIfNecessary
{
  id v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Library/SpringBoard"];

  id v4 = +[NSURL fileURLWithPath:v3];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"ApplicationShortcuts"];

  BOOL v6 = +[NSFileManager defaultManager];
  id v7 = [v6 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:4 error:0];
  [v7 enumerateObjectsUsingBlock:&stru_19718];
  [v6 removeItemAtURL:v5 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = +[FBSApplicationDataStore applicationsWithAvailableStores];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [[SBApplicationShortcutStore alloc] initWithBundleIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [(SBApplicationShortcutStore *)v12 truncateIfNecessary];
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)performLiftToWakeDefaultsResetIfNecessary
{
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  id v3 = +[BSPlatform sharedInstance];
  id v4 = (char *)[v3 homeButtonType];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    if (-[SBDataMigrator didMigrateBackupFromDifferentDevice](self, "didMigrateBackupFromDifferentDevice")&& ([v5 BOOLForKey:@"SBDidCheckLiftToWakeForDeviceWithoutHomeButton"] & 1) == 0)
    {
      [v5 setBool:1 forKey:@"SBSupportLiftToWake"];
    }
    [v5 setBool:1 forKey:@"SBDidCheckLiftToWakeForDeviceWithoutHomeButton"];
  }
}

- (void)performPinnedWidgetsDefaultsResetIfNecessary
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  [v2 removeObjectForKey:@"SBHomeSidebarPinned"];
  [v2 removeObjectForKey:@"SBWidgetsShouldShowTeachingView"];
}

- (void)performNewsWidgetIconMigrationIfNecessary
{
  id v3 = objc_alloc_init(SBNewsIconStateMigrator);
  [(SBNewsIconStateMigrator *)v3 migrateGridSizeClassIfNecessaryFromBuildVersion:self->_lastBuildVersion isInternalInstall:MGGetBoolAnswer()];
  [(SBNewsIconStateMigrator *)v3 restoreNewsWidgetInTodayListFromBuildVersion:self->_lastBuildVersion];
}

- (void)performCalendarWidgetIconMigrationIfNecessary
{
  id v2 = objc_alloc_init(SBCalendarWidgetMigrator);
  [(SBCalendarWidgetMigrator *)v2 migrateIfNecessary];
}

- (void)performIconSizeMigrationIfNecessary
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  if ([v2 BOOLForKey:@"SBHomeLayoutLowDensity"])
  {
    [v2 removeObjectForKey:@"SBHomeLayoutLowDensity"];
    [v2 setBool:1 forKey:@"SBHomeLargeIcons"];
  }
}

- (void)performDynamicVolumeButtonsMigrationIfNecessary
{
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    id v2 = +[BSPlatform sharedInstance];
    unsigned int v3 = [v2 deviceClass];

    if (v3 == 2)
    {
      id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
      id v4 = [v5 objectForKey:@"SBDisableNaturalVolumeButtonArrangement"];

      if (!v4) {
        [v5 setBool:1 forKey:@"SBDisableNaturalVolumeButtonArrangement"];
      }
    }
  }
}

- (void)informPaperBoardOfMigration
{
  unsigned int v3 = [(SBDataMigrator *)self restoredBackupBuildVersion];
  id v4 = +[BSPlatform sharedInstance];
  unsigned int v5 = [v4 deviceClass];

  if (v3)
  {
    BOOL v6 = [(SBDataMigrator *)self restoredBackupBuildVersion];
    id v7 = +[BSBuildVersion fromString:v6];

    if (v5 == 2 && (uint64_t)[v7 majorBuildNumber] < 21)
    {
      BOOL v8 = 1;
      goto LABEL_9;
    }
    if (v7)
    {
      BOOL v8 = (uint64_t)[v7 majorBuildNumber] < 20;
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = 0;
  }
  BOOL v8 = 0;
LABEL_9:
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_109C8(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  long long v16 = SBLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10960();
  }

  long long v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_108F0(v5 == 2, v17, v18, v19, v20, v21, v22, v23);
  }

  id v24 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  v25 = v24;
  if (v8)
  {
    v26 = +[NSNumber numberWithBool:1];
    [v25 setObject:v26 forKey:@"SBLegacyWallpaperMigrationNeeded"];
  }
  else
  {
    [v24 removeObjectForKey:@"SBLegacyWallpaperMigrationNeeded"];
  }
}

- (void)performPosterBoardMigration
{
  if ([(SBDataMigrator *)self isEphemeralMultiUser])
  {
    unsigned int v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10A38();
    }
    goto LABEL_46;
  }
  [(SBDataMigrator *)self informPaperBoardOfMigration];
  unsigned int v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
  unsigned __int8 v4 = [v3 BOOLForKey:@"SBMigratedHomeScreenDefaultsTintToPosterBoard"];
  unsigned int v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10D5C();
  }

  if (v4)
  {
    BOOL v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10B3C();
    }
    id v7 = 0;
    goto LABEL_35;
  }
  BOOL v6 = objc_opt_new();
  BOOL v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10D28();
  }

  id v9 = [v3 stringForKey:@"SBHomeIconUserInterfaceStyle"];
  BOOL v10 = v9 != 0;
  if (v9)
  {
    [v6 setHomeScreenIconStyle:v9];
    uint64_t v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10CC0();
    }
  }
  uint64_t v12 = [v3 dataForKey:@"SBHomeIconTintColor"];
  if ([v12 length])
  {
    uint64_t v13 = self;
    uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v13 fromData:v12 error:0];

    if (v14)
    {
      uint64_t v15 = [v14 BSColor];
      long long v16 = SBLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10C58();
      }

      [v6 setHomeScreenTintColor:v15];
      BOOL v10 = 1;
    }
  }
  if ([v3 BOOLForKey:@"SBEnableHomeScreenWallpaperDimming"])
  {
    long long v17 = +[NSNumber numberWithBool:1];
    [v6 setHomeScreenDim:v17];

    uint64_t v18 = SBLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10BE4(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    if (![v3 BOOLForKey:@"SBHomeHideLabels"]) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  if ([v3 BOOLForKey:@"SBHomeHideLabels"])
  {
LABEL_28:
    [v6 setHomeScreenIconSize:@"LARGE"];
    v26 = SBLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10B70(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    goto LABEL_31;
  }
  if (v10)
  {
LABEL_31:
    if (!v9) {
      [v6 setHomeScreenIconStyle:SBIconUserInterfaceStyleDefault];
    }
    id v7 = [v6 copy];
    goto LABEL_34;
  }
  id v7 = 0;
LABEL_34:

LABEL_35:
  id v34 = objc_alloc_init((Class)PRSService);
  v35 = dispatch_group_create();
  dispatch_group_enter(v35);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_CE80;
  v53 = sub_CE90;
  id v54 = 0;
  v36 = SBLogCommon();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_10B08();
  }

  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_CE98;
  v46 = &unk_19740;
  v48 = &v49;
  v37 = v35;
  v47 = v37;
  v38 = objc_retainBlock(&v43);
  objc_msgSend(v34, "runMigration:migrationDescriptor:completion:", 1, v7, v38, v43, v44, v45, v46);
  dispatch_time_t v39 = dispatch_time(0, 120000000000);
  dispatch_group_wait(v37, v39);

  if (v4)
  {
    v40 = SBLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10A6C();
    }
  }
  else if (v50[5])
  {
    v40 = SBLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10AD4();
    }
  }
  else
  {
    [v3 setBool:1 forKey:@"SBMigratedHomeScreenDefaultsTintToPosterBoard"];
    v40 = SBLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10AA0();
    }
  }

  id v41 = objc_alloc_init((Class)PBUIWallpaperConfigurationManager);
  v42 = [v41 dataStores];
  [v42 enumerateObjectsUsingBlock:&stru_19780];

  _Block_object_dispose(&v49, 8);
LABEL_46:
}

- (void)performBatteryPercentageSettingMigrationIfNecessary
{
  unsigned int v3 = +[BSPlatform sharedInstance];
  unsigned int v4 = [v3 deviceClass];

  if (!v4)
  {
    unsigned int v5 = +[BSPlatform sharedInstance];
    BOOL v6 = (char *)[v5 homeButtonType];

    if (v6 == (unsigned char *)&dword_0 + 2
      && (uint64_t)[(SBFBuildVersion *)self->_lastBuildVersion majorBuildNumber] <= 19)
    {
      id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.springboard"];
      [v7 setBool:0 forKey:SBDefaultKeyShowBatteryPercentage];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBuildVersion, 0);
  objc_storeStrong((id *)&self->_migratorDefaults, 0);
  objc_storeStrong((id *)&self->_xbController, 0);

  objc_storeStrong((id *)&self->_allInstalledApps, 0);
}

@end