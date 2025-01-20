@interface CSLPRFAppBacklightPrivacySettingsViewController
- (CSLPRFAppBacklightPrivacySettingsViewController)init;
- (id)_phoneAppSpecifiers;
- (id)_watchAppSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_cachePrivacyType;
- (void)_loadSettings;
- (void)settingsModel:(id)a3 didAddSettings:(id)a4;
- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4;
- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4;
- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation CSLPRFAppBacklightPrivacySettingsViewController

- (CSLPRFAppBacklightPrivacySettingsViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)CSLPRFAppBacklightPrivacySettingsViewController;
  v2 = [(CSLPRFAppBacklightPrivacySettingsViewController *)&v19 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = [v3 getActivePairedDevice];

    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6AABB66B-8E1B-4CAB-8FC4-AC577BA0AFB0"];
    v2->_BOOL hasAOTCapability = [v4 supportsCapability:v5];

    v6 = cslprf_settings_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL hasAOTCapability = v2->_hasAOTCapability;
      *(_DWORD *)buf = 67109120;
      BOOL v21 = hasAOTCapability;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BOOL hasAOTCapability = %{BOOL}u", buf, 8u);
    }

    if (v2->_hasAOTCapability)
    {
      sortedWatchSettings = v2->_sortedWatchSettings;
      v2->_sortedWatchSettings = (NSArray *)&__NSArray0__struct;

      sortedPhoneNotificationSettings = v2->_sortedPhoneNotificationSettings;
      v2->_sortedPhoneNotificationSettings = (NSArray *)&__NSArray0__struct;

      v10 = (CSLPRFPerApplicationSettingsPSSpecifierFactory *)objc_alloc_init((Class)CSLPRFPerApplicationSettingsPSSpecifierFactory);
      specifierFactory = v2->_specifierFactory;
      v2->_specifierFactory = v10;

      id v12 = objc_alloc((Class)CSLPRFPerApplicationSettingsModel);
      v13 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:2];
      v14 = (CSLPRFPerApplicationSettingsModel *)[v12 initWithApplicationLibrary:v13 perApplicationSettingsClass:objc_opt_class()];
      settingsModel = v2->_settingsModel;
      v2->_settingsModel = v14;

      uint64_t v16 = [(CSLPRFPerApplicationSettingsModel *)v2->_settingsModel globalSettings];
      globalSettings = v2->_globalSettings;
      v2->_globalSettings = (CSLPRFAppBacklightPrivacySettings *)v16;

      [(CSLPRFPerApplicationSettingsModel *)v2->_settingsModel addObserver:v2];
    }
  }
  return v2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFAppBacklightPrivacySettingsViewController;
  v4 = [(CSLPRFAppBacklightPrivacySettingsViewController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];

  return v4;
}

- (void)settingsModel:(id)a3 didAddSettings:(id)a4
{
}

- (void)settingsModel:(id)a3 didUpdateSettings:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

- (void)settingsModel:(id)a3 didRemoveSettings:(id)a4
{
}

- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4
{
}

- (void)_cachePrivacyType
{
  id v4 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"CSLPRFAppBacklightPrivacyType"];
  if ([v4 isEqualToString:@"apps"])
  {
    unint64_t v3 = 1;
LABEL_7:
    self->_privacyType = v3;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"notifications"])
  {
    unint64_t v3 = 2;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"activities"])
  {
    unint64_t v3 = 3;
    goto LABEL_7;
  }
  self->_privacyType = 0;
LABEL_8:
}

- (void)_loadSettings
{
  v2 = self;
  [(CSLPRFAppBacklightPrivacySettingsViewController *)self _cachePrivacyType];
  unint64_t v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  uint64_t v5 = 224;
  if (v2->_privacyType != 3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    objc_super v6 = [(CSLPRFPerApplicationSettingsModel *)v2->_settingsModel allApplicationSettings];
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v25 = *(void *)v27;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = (char *)[v11 category];
        if (v12 == (unsigned char *)&dword_0 + 1)
        {
          v13 = v4;
          if (*(void *)&v2->PSListController_opaque[v5] != 2) {
            continue;
          }
LABEL_13:
          [v13 addObject:v11];
          continue;
        }
        if (!v12)
        {
          v13 = v3;
          if (*(void *)&v2->PSListController_opaque[v5] == 2) {
            goto LABEL_13;
          }
          [v11 application];
          uint64_t v14 = v5;
          v15 = v6;
          uint64_t v16 = v2;
          v17 = v3;
          objc_super v19 = v18 = v4;
          unsigned __int8 v20 = [v19 supportsAlwaysOnDisplay];

          id v4 = v18;
          unint64_t v3 = v17;
          v2 = v16;
          objc_super v6 = v15;
          uint64_t v5 = v14;
          uint64_t v9 = v25;
          v13 = v3;
          if (v20) {
            goto LABEL_13;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v8)
      {
LABEL_16:

        [v3 sortUsingComparator:&stru_4248];
        [v4 sortUsingComparator:&stru_4248];
        break;
      }
    }
  }
  BOOL v21 = (NSArray *)[v3 copy];
  sortedWatchSettings = v2->_sortedWatchSettings;
  v2->_sortedWatchSettings = v21;

  v23 = (NSArray *)[v4 copy];
  sortedPhoneNotificationSettings = v2->_sortedPhoneNotificationSettings;
  v2->_sortedPhoneNotificationSettings = v23;
}

- (id)_watchAppSpecifiers
{
  [(CSLPRFAppBacklightPrivacySettingsViewController *)self _cachePrivacyType];
  unint64_t v3 = +[NSMutableArray arrayWithCapacity:(char *)[(NSArray *)self->_sortedWatchSettings count] + 1];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (self->_privacyType == 1) {
    CFStringRef v6 = @"APPS_WATCH_APPS_HEADER";
  }
  else {
    CFStringRef v6 = @"NOTIFICATIONS_WATCH_APPS_HEADER";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_43A8 table:@"CompanionAppBacklightPrivacySettings"];
  id v8 = +[PSSpecifier groupSpecifierWithID:@"APP_GROUP_ID" name:v7];

  [v3 addObject:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_sortedWatchSettings;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = &selRef_setPrivacyDuringAlwaysOnForApp_withIgnoredSpecifier_;
        if (self->_privacyType != 1) {
          v13 = &selRef_setPrivacyDuringAlwaysOnForNotification_withIgnoredSpecifier_;
        }
        uint64_t v14 = *v13;
        if (self->_privacyType == 1) {
          v15 = &selRef_privacyDuringAlwaysOnForAppWithIgnoredSpecifier_;
        }
        else {
          v15 = &selRef_privacyDuringAlwaysOnForNotificationWithIgnoredSpecifier_;
        }
        uint64_t v16 = [(CSLPRFPerApplicationSettingsPSSpecifierFactory *)self->_specifierFactory specifierForSettings:*(void *)(*((void *)&v20 + 1) + 8 * i) set:v14 get:*v15];
        [v3 addObject:v16];
      }
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  id v17 = [v3 copy];

  return v17;
}

- (id)_phoneAppSpecifiers
{
  [(CSLPRFAppBacklightPrivacySettingsViewController *)self _cachePrivacyType];
  NSUInteger v3 = [(NSArray *)self->_sortedPhoneNotificationSettings count];
  if (v3 && self->_privacyType == 2)
  {
    id v4 = +[NSMutableArray arrayWithCapacity:v3 + 1];
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v6 = [v5 localizedStringForKey:@"NOTIFICATIONS_IPHONE_APPS_HEADER" value:&stru_43A8 table:@"CompanionAppBacklightPrivacySettings"];
    uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"APP_GROUP_ID" name:v6];

    uint64_t v16 = (void *)v7;
    [v4 addObject:v7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = self->_sortedPhoneNotificationSettings;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(CSLPRFPerApplicationSettingsPSSpecifierFactory *)self->_specifierFactory specifierForSettings:*(void *)(*((void *)&v17 + 1) + 8 * i) set:"setPrivacyDuringAlwaysOnForNotification:withIgnoredSpecifier:" get:"privacyDuringAlwaysOnForNotificationWithIgnoredSpecifier:"];
          [v4 addObject:v13];
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v14 = [v4 copy];
  }
  else
  {
    id v14 = &__NSArray0__struct;
  }

  return v14;
}

- (id)specifiers
{
  [(CSLPRFAppBacklightPrivacySettingsViewController *)self _cachePrivacyType];
  if (self->_privacyType)
  {
    [(CSLPRFAppBacklightPrivacySettingsViewController *)self _loadSettings];
    NSUInteger v3 = +[NSMutableArray array];
    unint64_t privacyType = self->_privacyType;
    uint64_t v5 = +[PSSpecifier groupSpecifierWithID:@"ALL_APPS" name:&stru_43A8];
    CFStringRef v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    CFStringRef v8 = @"APP_BACKLIGHT_PRIVACY_NOTIFICATION_PRIVACY_FOOTER";
    if (privacyType == 1) {
      CFStringRef v8 = @"APP_BACKLIGHT_PRIVACY_APP_PRIVACY_FOOTER";
    }
    id v9 = &selRef_setPrivacyDuringAlwaysOnForApp_withIgnoredSpecifier_;
    if (privacyType != 1) {
      id v9 = &selRef_setPrivacyDuringAlwaysOnForNotification_withIgnoredSpecifier_;
    }
    id v10 = &selRef_privacyDuringAlwaysOnForAppWithIgnoredSpecifier_;
    if (privacyType != 1) {
      id v10 = &selRef_privacyDuringAlwaysOnForNotificationWithIgnoredSpecifier_;
    }
    CFStringRef v11 = @"APP_BACKLIGHT_PRIVACY_APP_PRIVACY";
    if (privacyType != 1) {
      CFStringRef v11 = @"APP_BACKLIGHT_PRIVACY_NOTIFICATION_PRIVACY";
    }
    unint64_t v33 = privacyType;
    if (privacyType == 3) {
      CFStringRef v12 = &stru_43A8;
    }
    else {
      CFStringRef v12 = v8;
    }
    if (privacyType == 3) {
      v13 = &selRef_setPrivacyDuringAlwaysOnForLiveActivities_withIgnoredSpecifier_;
    }
    else {
      v13 = v9;
    }
    if (privacyType == 3) {
      id v14 = &selRef_privacyDuringAlwaysOnForLiveActivitiesWithIgnoredSpecifier_;
    }
    else {
      id v14 = v10;
    }
    if (privacyType == 3) {
      CFStringRef v15 = @"APP_BACKLIGHT_PRIVACY_LIVE_ACTIVITIES_PRIVACY";
    }
    else {
      CFStringRef v15 = v11;
    }
    uint64_t v16 = [v6 localizedStringForKey:v12 value:&stru_43A8 table:@"CompanionAppBacklightPrivacySettings"];
    [v5 setProperty:v16 forKey:PSFooterTextGroupKey];

    v34 = v5;
    [v3 addObject:v5];
    long long v17 = *v13;
    long long v18 = *v14;
    long long v19 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v20 = [v19 localizedStringForKey:v15 value:&stru_43A8 table:@"CompanionAppBacklightPrivacySettings"];
    long long v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self->_globalSettings set:v17 get:v18 detail:0 cell:6 edit:0];

    [v21 setProperty:@"APP_BACKLIGHT_PRIVACY_GLOBAL_APP" forKey:PSIDKey];
    [v3 addObject:v21];
    globalSettings = self->_globalSettings;
    if (self->_privacyType == 1) {
      unsigned __int8 v23 = [(CSLPRFAppBacklightPrivacySettings *)globalSettings privacyDuringAlwaysOnForApp];
    }
    else {
      unsigned __int8 v23 = [(CSLPRFAppBacklightPrivacySettings *)globalSettings privacyDuringAlwaysOnForNotification];
    }
    if (v33 != 3 && (v23 & 1) == 0)
    {
      uint64_t v25 = [(CSLPRFAppBacklightPrivacySettingsViewController *)self _watchAppSpecifiers];
      [v3 addObjectsFromArray:v25];
      if (self->_privacyType == 2)
      {
        uint64_t v26 = [(CSLPRFAppBacklightPrivacySettingsViewController *)self _phoneAppSpecifiers];

        [v3 addObjectsFromArray:v26];
        uint64_t v25 = (void *)v26;
      }
    }
    id v27 = [v3 copy];
    uint64_t v28 = OBJC_IVAR___PSListController__specifiers;
    long long v29 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v27;

    v30 = cslprf_settings_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = [*(id *)&self->PSListController_opaque[v28] count];
      *(_DWORD *)buf = 134217984;
      id v36 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Returning %lu specifiers", buf, 0xCu);
    }

    id v24 = *(id *)&self->PSListController_opaque[v28];
  }
  else
  {
    NSUInteger v3 = cslprf_settings_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_28D0((uint64_t)self, v3);
    }
    id v24 = &__NSArray0__struct;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_sortedPhoneNotificationSettings, 0);
  objc_storeStrong((id *)&self->_sortedWatchSettings, 0);
  objc_storeStrong((id *)&self->_specifierFactory, 0);

  objc_storeStrong((id *)&self->_settingsModel, 0);
}

@end