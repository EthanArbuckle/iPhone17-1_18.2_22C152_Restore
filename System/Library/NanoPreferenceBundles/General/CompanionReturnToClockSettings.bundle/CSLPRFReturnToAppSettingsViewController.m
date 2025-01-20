@interface CSLPRFReturnToAppSettingsViewController
- (BOOL)isLegacyGizmo;
- (CSLPRFReturnToAppSettingsDelegate)returnToAppSettingsDelegate;
- (CSLPRFReturnToAppSettingsModel)returnToAppSettingsModel;
- (id)_unlocalizedCustomFooter;
- (id)alwaysReturnToAppInSession;
- (id)bundleID;
- (id)returnToAppSettings;
- (id)returnToAppTimeout;
- (id)specifiers;
- (int64_t)defaultAppStickinessDuration;
- (void)customReturnToClockDidChange:(BOOL)a3;
- (void)reloadAll;
- (void)returnToClockSettingDidChange:(int64_t)a3;
- (void)saveReturnToAppSettings:(id)a3;
- (void)setAlwaysReturnToAppInSession:(id)a3;
- (void)setCustomReturnToClock:(id)a3;
- (void)setReturnToAppSettingsDelegate:(id)a3;
- (void)setReturnToAppSettingsModel:(id)a3;
- (void)setReturnToAppTimeout:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSLPRFReturnToAppSettingsViewController

- (void)reloadAll
{
  v3 = (CSLPRFReturnToAppSettingsModel *)objc_alloc_init((Class)CSLPRFReturnToAppSettingsModel);
  strongReturnToAppSettingsModel = self->_strongReturnToAppSettingsModel;
  self->_strongReturnToAppSettingsModel = v3;

  objc_storeWeak((id *)&self->_returnToAppSettingsModel, self->_strongReturnToAppSettingsModel);

  [(CSLPRFReturnToAppSettingsViewController *)self reloadSpecifiers];
}

- (CSLPRFReturnToAppSettingsModel)returnToAppSettingsModel
{
  CSLPRFReturnToAppSettingsModel **p_returnToAppSettingsModel;
  id WeakRetained;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;
  uint64_t vars8;

  p_returnToAppSettingsModel = &self->_returnToAppSettingsModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_returnToAppSettingsModel);

  if (!WeakRetained)
  {
    v5 = [(CSLPRFReturnToAppSettingsViewController *)self specifier];
    v6 = [v5 propertyForKey:@"ReturnToAppSettingsModel"];
    objc_storeWeak((id *)p_returnToAppSettingsModel, v6);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_6EEC, @"CSLSessionsSettingsChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v8 = objc_loadWeakRetained((id *)p_returnToAppSettingsModel);

  return (CSLPRFReturnToAppSettingsModel *)v8;
}

- (CSLPRFReturnToAppSettingsDelegate)returnToAppSettingsDelegate
{
  CSLPRFReturnToAppSettingsDelegate **p_returnToAppSettingsDelegate;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t vars8;

  p_returnToAppSettingsDelegate = &self->_returnToAppSettingsDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_returnToAppSettingsDelegate);

  if (!WeakRetained)
  {
    v5 = [(CSLPRFReturnToAppSettingsViewController *)self specifier];
    v6 = [v5 propertyForKey:@"ReturnToAppSettingsDelegate"];
    objc_storeWeak((id *)p_returnToAppSettingsDelegate, v6);
  }
  v7 = objc_loadWeakRetained((id *)p_returnToAppSettingsDelegate);

  return (CSLPRFReturnToAppSettingsDelegate *)v7;
}

- (id)bundleID
{
  v2 = [(CSLPRFReturnToAppSettingsViewController *)self specifier];
  v3 = [v2 identifier];

  return v3;
}

- (id)returnToAppSettings
{
  v3 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettingsModel];
  v4 = [(CSLPRFReturnToAppSettingsViewController *)self bundleID];
  v5 = [v3 settingsForBundleID:v4];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init((Class)CSLPRFReturnToAppSettings);
  }
  v7 = v6;

  return v7;
}

- (void)saveReturnToAppSettings:(id)a3
{
  id v4 = a3;
  v5 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettingsModel];
  id v6 = [(CSLPRFReturnToAppSettingsViewController *)self bundleID];
  [v5 setSettings:v4 forBundleID:v6];

  v7 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettingsModel];
  [v7 saveAppSettings];

  [(CSLPRFReturnToAppSettingsViewController *)self reloadSpecifiers];
}

- (int64_t)defaultAppStickinessDuration
{
  v2 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettingsDelegate];
  v3 = [v2 currentAppTimeoutSetting];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)_unlocalizedCustomFooter
{
  v2 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppTimeout];
  v3 = (char *)[v2 integerValue];

  id result = @"RETURN_TO_CLOCK_AFTER_2_MINUTES_APP_FOOTER";
  if ((uint64_t)v3 <= 29)
  {
    if (v3 != (char *)-1)
    {
      if (v3 == (unsigned char *)&dword_4 + 1) {
        return result;
      }
      return @"RETURN_TO_CLOCK_ALWAYS_APP_FOOTER";
    }
    return @"RETURN_TO_CLOCK_ON_CROWN_PRESS_APP_FOOTER";
  }
  else
  {
    if (v3 != (unsigned char *)&dword_1C + 2)
    {
      if (v3 == stru_68.segname) {
        return result;
      }
      if (v3 == "PrivateFrameworks/NanoAppRegistry.framework/NanoAppRegistry") {
        return @"RETURN_TO_CLOCK_AFTER_1_HOUR_APP_FOOTER";
      }
      return @"RETURN_TO_CLOCK_ALWAYS_APP_FOOTER";
    }
    return @"RETURN_TO_APP_IN_SESSION_FOOTER";
  }
}

- (id)specifiers
{
  __CFString *returnToClockSettingGroup;
  CSLPRFReturnToClockCustomGroup *v10;
  id *p_returnToClockCustomGroup;
  CSLPRFReturnToClockCustomGroup *returnToClockCustomGroup;
  void *v13;
  CSLPRFReturnToClockSettingGroup *v14;
  double v15;
  CSLPRFReturnToClockSettingGroup *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  v3 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  id v4 = cslprf_sessions_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(CSLPRFReturnToAppSettingsViewController *)self bundleID];
    *(_DWORD *)buf = 138412546;
    v32 = v5;
    v33 = 2112;
    v34 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Building return to app specifiers for %@ %@", buf, 0x16u);
  }
  id v6 = [v3 hasCustomReturnToAppTimeout];
  v7 = +[NSMutableArray array];
  v8 = [CSLPRFReturnToClockCustomGroup alloc];
  if (v6)
  {
    returnToClockSettingGroup = &stru_C5F0;
  }
  else
  {
    returnToClockSettingGroup = [(CSLPRFReturnToAppSettingsViewController *)self _unlocalizedCustomFooter];
  }
  v10 = [(CSLPRFReturnToClockCustomGroup *)v8 initWithDelegate:self custom:v6 header:0 footer:returnToClockSettingGroup];
  p_returnToClockCustomGroup = (id *)&self->_returnToClockCustomGroup;
  returnToClockCustomGroup = self->_returnToClockCustomGroup;
  self->_returnToClockCustomGroup = v10;

  if (v6)
  {
    v13 = [*p_returnToClockCustomGroup specifiers];
    [v7 addObjectsFromArray:v13];

    v14 = [CSLPRFReturnToClockSettingGroup alloc];
    [v3 returnToAppTimeout];
    v16 = [(CSLPRFReturnToClockSettingGroup *)v14 initWithDelegate:self returnToClockSetting:(uint64_t)v15 header:&stru_C5F0 appSpecific:1];
    p_returnToClockCustomGroup = (id *)&self->_returnToClockSettingGroup;
    returnToClockSettingGroup = (__CFString *)self->_returnToClockSettingGroup;
    self->_returnToClockSettingGroup = v16;
  }

  v17 = [*p_returnToClockCustomGroup specifiers];
  [v7 addObjectsFromArray:v17];

  if ([v3 sessionCapable])
  {
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"RETURN_TO_APP_IN_SESSION_LABEL" value:&stru_C5F0 table:@"CompanionWakeSettings"];
    v20 = +[PSSpecifier groupSpecifierWithID:@"RETURN_TO_APP_IN_SESSION_SECTION_ID" name:v19];

    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"RETURN_TO_APP_IN_SESSION_FOOTER" value:&stru_C5F0 table:@"CompanionWakeSettings"];
    [v20 setProperty:v22 forKey:PSFooterTextGroupKey];

    [v7 addObject:v20];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"RETURN_TO_APP_IN_SESSION_TITLE" value:&stru_C5F0 table:@"CompanionWakeSettings"];

    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"setAlwaysReturnToAppInSession:" get:"alwaysReturnToAppInSession" detail:0 cell:6 edit:0];
    [v7 addObject:v25];
  }
  v26 = [v7 copy];
  v27 = OBJC_IVAR___PSListController__specifiers;
  v28 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v26;

  v29 = *(id *)&self->PSListController_opaque[v27];
  return v29;
}

- (void)setCustomReturnToClock:(id)a3
{
  id v4 = a3;
  id v7 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  unsigned int v5 = [v4 BOOLValue];

  double v6 = 0.0;
  if (v5) {
    double v6 = (double)[(CSLPRFReturnToAppSettingsViewController *)self defaultAppStickinessDuration];
  }
  [v7 setReturnToAppTimeout:v6];
  [(CSLPRFReturnToAppSettingsViewController *)self saveReturnToAppSettings:v7];
}

- (id)returnToAppTimeout
{
  v3 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  id v4 = +[NSNumber numberWithInteger:[(CSLPRFReturnToAppSettingsViewController *)self defaultAppStickinessDuration]];
  if ([v3 hasCustomReturnToAppTimeout])
  {
    [v3 returnToAppTimeout];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    id v4 = (void *)v5;
  }

  return v4;
}

- (void)setReturnToAppTimeout:(id)a3
{
  id v4 = a3;
  id v7 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  [v4 floatValue];
  float v6 = v5;

  [v7 setReturnToAppTimeout:v6];
  [(CSLPRFReturnToAppSettingsViewController *)self saveReturnToAppSettings:v7];
}

- (id)alwaysReturnToAppInSession
{
  v3 = cslprf_sessions_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "alwaysReturnToAppInSession", v7, 2u);
  }

  id v4 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  float v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 alwaysReturnToAppInSession]);

  return v5;
}

- (void)setAlwaysReturnToAppInSession:(id)a3
{
  id v4 = a3;
  float v5 = cslprf_sessions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "setAlwaysReturnToAppInSession:%@", (uint8_t *)&v7, 0xCu);
  }

  float v6 = [(CSLPRFReturnToAppSettingsViewController *)self returnToAppSettings];
  objc_msgSend(v6, "setAlwaysReturnToAppInSession:", objc_msgSend(v4, "BOOLValue"));
  [(CSLPRFReturnToAppSettingsViewController *)self saveReturnToAppSettings:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFReturnToAppSettingsViewController;
  [(CSLPRFReturnToAppSettingsViewController *)&v7 viewWillAppear:a3];
  id v4 = [(CSLPRFReturnToAppSettingsViewController *)self specifier];
  float v5 = [v4 name];
  [(CSLPRFReturnToAppSettingsViewController *)self setTitle:v5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_6EEC, @"CSLSessionsSettingsChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFReturnToAppSettingsViewController;
  [(CSLPRFReturnToAppSettingsViewController *)&v5 viewWillDisappear:a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id *p_returnToClockCustomGroup;
  int v9;
  void *v10;

  id v5 = [(CSLPRFReturnToAppSettingsViewController *)self indexForIndexPath:a4];
  float v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v5];
  objc_super v7 = cslprf_sessions_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "didSelect specifier %@", (uint8_t *)&v9, 0xCu);
  }

  p_returnToClockCustomGroup = (id *)&self->_returnToClockCustomGroup;
  if ([(CSLPRFReturnToClockCustomGroup *)self->_returnToClockCustomGroup specifierIsWithinGroup:v6]|| (p_returnToClockCustomGroup = (id *)&self->_returnToClockSettingGroup, [(CSLPRFReturnToClockSettingGroup *)self->_returnToClockSettingGroup specifierIsWithinGroup:v6]))
  {
    [*p_returnToClockCustomGroup specifierSelected:v6];
  }
}

- (void)returnToClockSettingDidChange:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(CSLPRFReturnToAppSettingsViewController *)self setReturnToAppTimeout:v4];
}

- (BOOL)isLegacyGizmo
{
  return 0;
}

- (void)customReturnToClockDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = cslprf_sessions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "customReturnToClock changed to %{BOOL}u", (uint8_t *)v7, 8u);
  }

  float v6 = +[NSNumber numberWithBool:v3];
  [(CSLPRFReturnToAppSettingsViewController *)self setCustomReturnToClock:v6];

  [(CSLPRFReturnToAppSettingsViewController *)self reloadSpecifiers];
}

- (void)setReturnToAppSettingsModel:(id)a3
{
  objc_storeWeak((id *)&self->_returnToAppSettingsModel, a3);
}

- (void)setReturnToAppSettingsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_returnToAppSettingsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_returnToAppSettingsDelegate);
  objc_destroyWeak((id *)&self->_returnToAppSettingsModel);
  objc_storeStrong((id *)&self->_strongReturnToAppSettingsModel, 0);
  objc_storeStrong((id *)&self->_returnToClockSettingGroup, 0);

  objc_storeStrong((id *)&self->_returnToClockCustomGroup, 0);
}

@end