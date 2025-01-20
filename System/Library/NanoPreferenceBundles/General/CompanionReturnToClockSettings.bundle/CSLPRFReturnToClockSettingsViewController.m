@interface CSLPRFReturnToClockSettingsViewController
- (BOOL)_isSessionCapable:(id)a3;
- (BOOL)hasAutoLaunchCapability;
- (BOOL)hasBacklightExtendCapability;
- (BOOL)hasPerAppStickinessCapability;
- (BOOL)hasRotateToWakeCapability;
- (BOOL)hasStickinessCapability;
- (BOOL)hasStickinessSelectionCapability;
- (BOOL)isLegacyGizmo;
- (CSLPRFDefaultAppDataProvider)appLibrary;
- (CSLPRFReturnToAppSettingsModel)returnToAppSettingsModel;
- (CSLPRFReturnToClockSettingGroup)returnToClockGroup;
- (CSLPRFReturnToClockSettingsViewController)init;
- (NPSDomainAccessor)carouselDomainAccessor;
- (NPSDomainAccessor)nanoDomainAccessor;
- (NPSManager)syncManager;
- (NSArray)sortedApps;
- (id)_appSpecifiers;
- (id)appStickinessIDForState:(int64_t)a3;
- (id)currentAppTimeoutSetting;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)appStickinessDuration;
- (void)_loadApps;
- (void)_setApps:(id)a3;
- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)handleDidUnpair;
- (void)reloadAll;
- (void)reloadReturnToAppSettingsModel;
- (void)setAppLibrary:(id)a3;
- (void)setAppStickiness:(int64_t)a3;
- (void)setCarouselDomainAccessor:(id)a3;
- (void)setHasAutoLaunchCapability:(BOOL)a3;
- (void)setHasBacklightExtendCapability:(BOOL)a3;
- (void)setHasPerAppStickinessCapability:(BOOL)a3;
- (void)setHasRotateToWakeCapability:(BOOL)a3;
- (void)setHasStickinessCapability:(BOOL)a3;
- (void)setHasStickinessSelectionCapability:(BOOL)a3;
- (void)setNanoDomainAccessor:(id)a3;
- (void)setReturnToAppSettingsModel:(id)a3;
- (void)setReturnToClockGroup:(id)a3;
- (void)setSortedApps:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)settingsChanged:(id)a3 forBundleID:(id)a4;
- (void)startObservingNotifications;
- (void)stopObservingNotifications;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSLPRFReturnToClockSettingsViewController

- (CSLPRFReturnToClockSettingsViewController)init
{
  v28.receiver = self;
  v28.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  v2 = [(CSLPRFReturnToClockSettingsViewController *)&v28 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = [v5 getActivePairedDevice];

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"62AA8EC5-64FC-43D1-B856-D28D6520FA30"];
    v2->_hasBacklightExtendCapability = [v6 supportsCapability:v7];

    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B81E9BEF-B19B-4468-8887-44BE181472C0"];
    v2->_hasRotateToWakeCapability = [v6 supportsCapability:v8];

    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"ED96B2DC-49DD-470D-BFE6-1F112AF20308"];
    v2->_BOOL hasStickinessCapability = [v6 supportsCapability:v9];

    v10 = cslprf_sessions_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL hasStickinessCapability = v2->_hasStickinessCapability;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = hasStickinessCapability;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "BOOL hasStickinessCapability = %{BOOL}u", buf, 8u);
    }

    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"410B4A76-885F-4715-83AF-E23513740668"];
    v2->_BOOL hasAutoLaunchCapability = [v6 supportsCapability:v12];

    v13 = cslprf_sessions_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL hasAutoLaunchCapability = v2->_hasAutoLaunchCapability;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = hasAutoLaunchCapability;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BOOL hasAutoLaunchCapability = %{BOOL}u", buf, 8u);
    }

    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5A9640F0-1FE3-4019-8157-075CBFC8DBA1"];
    v2->_BOOL hasStickinessSelectionCapability = [v6 supportsCapability:v15];

    v16 = cslprf_sessions_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL hasStickinessSelectionCapability = v2->_hasStickinessSelectionCapability;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = hasStickinessSelectionCapability;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "BOOL hasStickinessSelectionCapability = %{BOOL}u", buf, 8u);
    }

    v18 = [(CSLPRFReturnToClockSettingsViewController *)v2 carouselDomainAccessor];
    v19 = [v18 objectForKey:@"ReturnToAppSettings"];

    v20 = cslprf_sessions_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v30 = @"ReturnToAppSettings";
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%@ = %@", buf, 0x16u);
    }

    v2->_BOOL hasPerAppStickinessCapability = v19 != 0;
    v21 = cslprf_sessions_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      BOOL hasPerAppStickinessCapability = v2->_hasPerAppStickinessCapability;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = hasPerAppStickinessCapability;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "BOOL hasPerAppStickinessCapability = %{BOOL}u", buf, 8u);
    }

    if (v2->_hasPerAppStickinessCapability)
    {
      [(CSLPRFReturnToClockSettingsViewController *)v2 reloadReturnToAppSettingsModel];
      v23 = (CSLPRFDefaultAppDataProvider *)objc_alloc_init((Class)CSLPRFDefaultAppDataProvider);
      appLibrary = v2->_appLibrary;
      v2->_appLibrary = v23;

      [(CSLPRFDefaultAppDataProvider *)v2->_appLibrary setDelegate:v2];
      [(CSLPRFReturnToClockSettingsViewController *)v2 _loadApps];
    }
    v25 = [(CSLPRFReturnToClockSettingsViewController *)v2 carouselDomainAccessor];
    [(CSLPRFReturnToClockSettingsViewController *)v2 _synchronizeDomainWithAccessor:v25 keys:0 withCompletion:0];

    v26 = [(CSLPRFReturnToClockSettingsViewController *)v2 nanoDomainAccessor];
    [(CSLPRFReturnToClockSettingsViewController *)v2 _synchronizeDomainWithAccessor:v26 keys:0 withCompletion:0];
  }
  return v2;
}

- (void)startObservingNotifications
{
}

- (void)stopObservingNotifications
{
}

- (void)reloadAll
{
  uint64_t v3 = [(CSLPRFReturnToClockSettingsViewController *)self carouselDomainAccessor];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_47A0;
  v4[3] = &unk_C360;
  v4[4] = self;
  [(CSLPRFReturnToClockSettingsViewController *)self _synchronizeDomainWithAccessor:v3 keys:0 withCompletion:v4];
}

- (void)reloadReturnToAppSettingsModel
{
  CSLPRFReturnToAppSettingsModel *returnToAppSettingsModel;
  CSLPRFReturnToAppSettingsModel *v5;
  uint64_t vars8;

  [(CSLPRFReturnToAppSettingsModel *)self->_returnToAppSettingsModel removeObserver:self];
  uint64_t v3 = (CSLPRFReturnToAppSettingsModel *)objc_alloc_init((Class)CSLPRFReturnToAppSettingsModel);
  returnToAppSettingsModel = self->_returnToAppSettingsModel;
  self->_returnToAppSettingsModel = v3;

  v5 = self->_returnToAppSettingsModel;

  [(CSLPRFReturnToAppSettingsModel *)v5 addObserver:self];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSLPRFReturnToClockSettingsViewController *)self indexForIndexPath:v7];
  id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  if (![(CSLPRFReturnToClockSettingGroup *)self->_returnToClockGroup specifierIsWithinGroup:v9])
  {
    v10 = [v9 identifier];
    unsigned int v11 = [v10 isEqualToString:@"APP_STICKS_IN_SESSION_ID"];

    if (v11)
    {
      id v12 = self;
      uint64_t v13 = 30;
    }
    else
    {
      v14 = [v9 identifier];
      unsigned int v15 = [v14 isEqualToString:@"TINY_WINDOW_ID"];

      if (v15)
      {
        id v12 = self;
        uint64_t v13 = 5;
      }
      else
      {
        v16 = [v9 identifier];
        unsigned int v17 = [v16 isEqualToString:@"TWO_MINUTE_WINDOW_ID"];

        if (v17)
        {
          id v12 = self;
          uint64_t v13 = 120;
        }
        else
        {
          v18 = [v9 identifier];
          unsigned int v19 = [v18 isEqualToString:@"ONE_HOUR_WINDOW_ID"];

          if (v19)
          {
            id v12 = self;
            uint64_t v13 = 3600;
          }
          else
          {
            v20 = [v9 identifier];
            unsigned int v21 = [v20 isEqualToString:@"ALWAYS_SHOW_WATCH_FACE_NO_STICKINESS_ID"];

            if (!v21) {
              goto LABEL_14;
            }
            id v12 = self;
            uint64_t v13 = -1;
          }
        }
      }
    }
    [(CSLPRFReturnToClockSettingsViewController *)v12 setAppStickiness:v13];
    goto LABEL_14;
  }
  [(CSLPRFReturnToClockSettingGroup *)self->_returnToClockGroup specifierSelected:v9];
LABEL_14:
  v22.receiver = self;
  v22.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  [(CSLPRFReturnToClockSettingsViewController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  id v7 = [(CSLPRFReturnToClockSettingsViewController *)&v17 tableView:a3 cellForRowAtIndexPath:v6];
  if (self->_hasPerAppStickinessCapability)
  {
    id v8 = [(CSLPRFReturnToClockSettingsViewController *)self indexForIndexPath:v6];
    id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
    v10 = [v9 propertyForKey:@"ReturnToAppAppSpecifier"];
    if ([v10 BOOLValue])
    {
      unsigned int v11 = [v9 identifier];
      id v12 = [(CSLPRFReturnToAppSettingsModel *)self->_returnToAppSettingsModel settingsForBundleID:v11];
      if ([v12 hasCustomReturnToAppTimeout])
      {
        uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
        v14 = [v13 localizedStringForKey:@"RETURN_TO_CLOCK_CUSTOM" value:&stru_C5F0 table:@"CompanionReturnToClockSettings"];
        unsigned int v15 = [v7 detailTextLabel];
        [v15 setText:v14];
      }
    }
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_hasAppeared) {
    [(CSLPRFReturnToClockSettingsViewController *)self reloadAll];
  }
  else {
    self->_hasAppeared = 1;
  }
  [(CSLPRFReturnToClockSettingsViewController *)self startObservingNotifications];
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  [(CSLPRFReturnToClockSettingsViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CSLPRFReturnToClockSettingsViewController *)self stopObservingNotifications];
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  [(CSLPRFReturnToClockSettingsViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  if (self->_isObservingNotifications) {
    [(CSLPRFReturnToClockSettingsViewController *)self stopObservingNotifications];
  }
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFReturnToClockSettingsViewController;
  [(CSLPRFReturnToClockSettingsViewController *)&v3 dealloc];
}

- (void)handleDidUnpair
{
  nanoDomainAccessor = self->_nanoDomainAccessor;
  self->_nanoDomainAccessor = 0;

  carouselDomainAccessor = self->_carouselDomainAccessor;
  self->_carouselDomainAccessor = 0;
}

- (NPSDomainAccessor)nanoDomainAccessor
{
  nanoDomainAccessor = self->_nanoDomainAccessor;
  if (!nanoDomainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano"];
    objc_super v5 = self->_nanoDomainAccessor;
    self->_nanoDomainAccessor = v4;

    nanoDomainAccessor = self->_nanoDomainAccessor;
  }

  return nanoDomainAccessor;
}

- (NPSDomainAccessor)carouselDomainAccessor
{
  carouselDomainAccessor = self->_carouselDomainAccessor;
  if (!carouselDomainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
    objc_super v5 = self->_carouselDomainAccessor;
    self->_carouselDomainAccessor = v4;

    carouselDomainAccessor = self->_carouselDomainAccessor;
  }

  return carouselDomainAccessor;
}

- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = cslprf_sessions_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 domain];
    *(_DWORD *)buf = 138412546;
    objc_super v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "synchronizing %@ %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5100;
  v16[3] = &unk_C2D0;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [v13 synchronizeWithCompletionHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (id)specifiers
{
  CSLPRFReturnToClockSettingGroup *returnToClockGroup;
  CSLPRFReturnToClockSettingGroup *v5;
  int64_t v6;
  void *v7;
  void *v8;
  CSLPRFReturnToClockSettingGroup *v9;
  CSLPRFReturnToClockSettingGroup *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t vars8;

  objc_super v3 = +[NSMutableArray array];
  returnToClockGroup = self->_returnToClockGroup;
  if (!returnToClockGroup)
  {
    objc_super v5 = [CSLPRFReturnToClockSettingGroup alloc];
    id v6 = [(CSLPRFReturnToClockSettingsViewController *)self appStickinessDuration];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"RETURN_TO_CLOCK_HEADER" value:&stru_C5F0 table:@"CompanionReturnToClockSettings"];
    id v9 = [(CSLPRFReturnToClockSettingGroup *)v5 initWithDelegate:self returnToClockSetting:v6 header:v8 appSpecific:0];
    id v10 = self->_returnToClockGroup;
    self->_returnToClockGroup = v9;

    returnToClockGroup = self->_returnToClockGroup;
  }
  unsigned int v11 = [(CSLPRFReturnToClockSettingGroup *)returnToClockGroup specifiers];
  [v3 addObjectsFromArray:v11];

  if (self->_hasPerAppStickinessCapability)
  {
    id v12 = [(CSLPRFReturnToClockSettingsViewController *)self _appSpecifiers];
    [v3 addObjectsFromArray:v12];
  }
  id v13 = [v3 copy];
  id v14 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v13;

  return v3;
}

- (id)currentAppTimeoutSetting
{
  int64_t v2 = [(CSLPRFReturnToClockSettingsViewController *)self appStickinessDuration];

  return +[NSNumber numberWithInteger:v2];
}

- (BOOL)_isSessionCapable:(id)a3
{
  objc_super v3 = [(CSLPRFReturnToAppSettingsModel *)self->_returnToAppSettingsModel settingsForBundleID:a3];
  unsigned __int8 v4 = [v3 sessionCapable];

  return v4;
}

- (id)_appSpecifiers
{
  objc_super v3 = +[NSMutableArray arrayWithCapacity:(char *)[(NSArray *)self->_sortedApps count] + 1];
  unsigned __int8 v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"CUSTOMIZE_APPS_HEADER" value:&stru_C5F0 table:@"CompanionReturnToClockSettings"];
  id v6 = +[PSSpecifier groupSpecifierWithID:@"APP_GROUP_ID" name:v5];

  [v3 addObject:v6];
  objc_initWeak(&location, self);
  sortedApps = self->_sortedApps;
  unsigned int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_570C;
  id v14 = &unk_C388;
  objc_copyWeak(&v17, &location);
  id v15 = self;
  id v8 = v3;
  id v16 = v8;
  [(NSArray *)sortedApps enumerateObjectsUsingBlock:&v11];
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_loadApps
{
  objc_initWeak(&location, self);
  appLibrary = self->_appLibrary;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5988;
  v4[3] = &unk_C3B0;
  objc_copyWeak(&v5, &location);
  [(CSLPRFDefaultAppDataProvider *)appLibrary loadAppsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setApps:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [v4 sortedArrayUsingComparator:&stru_C3F0];

  sortedApps = self->_sortedApps;
  self->_sortedApps = v5;

  [(CSLPRFReturnToClockSettingsViewController *)self reloadSpecifiers];
}

- (void)setAppStickiness:(int64_t)a3
{
  id v5 = [(CSLPRFReturnToClockSettingsViewController *)self specifierForID:@"APP_STICKINESS_GROUP_ID"];
  id v6 = [(CSLPRFReturnToClockSettingsViewController *)self appStickinessIDForState:a3];
  id v7 = [(CSLPRFReturnToClockSettingsViewController *)self specifierForID:v6];

  [v5 setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
  id v8 = 0;
  if (a3 <= 29)
  {
    if (a3 == -1)
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = v9;
      CFStringRef v11 = @"ALWAYS_FOOTER";
    }
    else
    {
      if (a3 != 5) {
        goto LABEL_13;
      }
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = v9;
      CFStringRef v11 = @"TINY_WINDOW_FOOTER";
    }
  }
  else
  {
    switch(a3)
    {
      case 3600:
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = v9;
        CFStringRef v11 = @"WITHIN_1_HOUR_WINDOW_FOOTER";
        break;
      case 120:
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = v9;
        CFStringRef v11 = @"WITHIN_2_MINUTE_WINDOW_FOOTER";
        break;
      case 30:
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = v9;
        CFStringRef v11 = @"WHILE_IN_SESSION_FOOTER";
        break;
      default:
        goto LABEL_13;
    }
  }
  id v8 = [v9 localizedStringForKey:v11 value:&stru_C5F0 table:@"CompanionReturnToClockSettings"];

LABEL_13:
  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:v8 value:&stru_C5F0 table:@"CompanionReturnToClockSettings"];
  [v5 setProperty:v13 forKey:PSFooterTextGroupKey];

  [(CSLPRFReturnToClockSettingsViewController *)self reloadSpecifier:v5 animated:0];
  id v14 = [(CSLPRFReturnToClockSettingsViewController *)self nanoDomainAccessor];
  [v14 setInteger:a3 forKey:@"OnWakeTimeoutSeconds"];

  id v15 = cslprf_sessions_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412546;
    CFStringRef v19 = @"OnWakeTimeoutSeconds";
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "setAppStickiness key %@ = %d", (uint8_t *)&v18, 0x12u);
  }

  id v16 = [(CSLPRFReturnToClockSettingsViewController *)self nanoDomainAccessor];
  id v17 = +[NSSet setWithObject:@"OnWakeTimeoutSeconds"];
  [(CSLPRFReturnToClockSettingsViewController *)self _synchronizeDomainWithAccessor:v16 keys:v17 withCompletion:0];
}

- (BOOL)isLegacyGizmo
{
  return !self->_hasPerAppStickinessCapability;
}

- (id)appStickinessIDForState:(int64_t)a3
{
  if (a3 > 29)
  {
    if (a3 == 3600)
    {
      return @"ONE_HOUR_WINDOW_ID";
    }
    else
    {
      if (a3 != 30) {
        return @"TWO_MINUTE_WINDOW_ID";
      }
      if (self->_hasStickinessSelectionCapability) {
        return @"TWO_MINUTE_WINDOW_ID";
      }
      else {
        return @"APP_STICKS_IN_SESSION_ID";
      }
    }
  }
  else
  {
    if (a3 != -1)
    {
      if (a3 == 5) {
        return @"TINY_WINDOW_ID";
      }
      return @"TWO_MINUTE_WINDOW_ID";
    }
    if (CSLSAllowReturnToAppUntilCrownPress()) {
      return @"ALWAYS_SHOW_WATCH_FACE_NO_STICKINESS_ID";
    }
    else {
      return @"ONE_HOUR_WINDOW_ID";
    }
  }
}

- (int64_t)appStickinessDuration
{
  int64_t v2 = [(CSLPRFReturnToClockSettingsViewController *)self nanoDomainAccessor];
  int64_t v3 = (int64_t)[v2 integerForKey:@"OnWakeTimeoutSeconds"];

  if (v3 == -1)
  {
    if (CSLSAllowReturnToAppUntilCrownPress()) {
      int64_t v3 = -1;
    }
    else {
      int64_t v3 = 3600;
    }
  }
  id v4 = cslprf_sessions_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    CFStringRef v7 = @"OnWakeTimeoutSeconds";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "appStickinessDuration %@ = %d", (uint8_t *)&v6, 0x12u);
  }

  if (v3) {
    return v3;
  }
  else {
    return 120;
  }
}

- (void)settingsChanged:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if (self->_hasPerAppStickinessCapability)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_6034;
    v7[3] = &unk_C440;
    v7[4] = self;
    id v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (CSLPRFReturnToAppSettingsModel)returnToAppSettingsModel
{
  return self->_returnToAppSettingsModel;
}

- (void)setReturnToAppSettingsModel:(id)a3
{
  objc_storeStrong((id *)&self->_returnToAppSettingsModel, a3);
}

- (void)setNanoDomainAccessor:(id)a3
{
}

- (void)setCarouselDomainAccessor:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (CSLPRFDefaultAppDataProvider)appLibrary
{
  return self->_appLibrary;
}

- (void)setAppLibrary:(id)a3
{
}

- (NSArray)sortedApps
{
  return self->_sortedApps;
}

- (void)setSortedApps:(id)a3
{
}

- (CSLPRFReturnToClockSettingGroup)returnToClockGroup
{
  return self->_returnToClockGroup;
}

- (void)setReturnToClockGroup:(id)a3
{
  objc_storeStrong((id *)&self->_returnToClockGroup, a3);
}

- (BOOL)hasBacklightExtendCapability
{
  return self->_hasBacklightExtendCapability;
}

- (void)setHasBacklightExtendCapability:(BOOL)a3
{
  self->_hasBacklightExtendCapability = a3;
}

- (BOOL)hasRotateToWakeCapability
{
  return self->_hasRotateToWakeCapability;
}

- (void)setHasRotateToWakeCapability:(BOOL)a3
{
  self->_hasRotateToWakeCapability = a3;
}

- (BOOL)hasAutoLaunchCapability
{
  return self->_hasAutoLaunchCapability;
}

- (void)setHasAutoLaunchCapability:(BOOL)a3
{
  self->_BOOL hasAutoLaunchCapability = a3;
}

- (BOOL)hasStickinessCapability
{
  return self->_hasStickinessCapability;
}

- (void)setHasStickinessCapability:(BOOL)a3
{
  self->_BOOL hasStickinessCapability = a3;
}

- (BOOL)hasStickinessSelectionCapability
{
  return self->_hasStickinessSelectionCapability;
}

- (void)setHasStickinessSelectionCapability:(BOOL)a3
{
  self->_BOOL hasStickinessSelectionCapability = a3;
}

- (BOOL)hasPerAppStickinessCapability
{
  return self->_hasPerAppStickinessCapability;
}

- (void)setHasPerAppStickinessCapability:(BOOL)a3
{
  self->_BOOL hasPerAppStickinessCapability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnToClockGroup, 0);
  objc_storeStrong((id *)&self->_sortedApps, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_carouselDomainAccessor, 0);
  objc_storeStrong((id *)&self->_nanoDomainAccessor, 0);

  objc_storeStrong((id *)&self->_returnToAppSettingsModel, 0);
}

@end