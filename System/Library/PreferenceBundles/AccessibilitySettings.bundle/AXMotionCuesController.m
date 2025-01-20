@interface AXMotionCuesController
- (AXMotionCuesController)init;
- (id)motionCuesEnabled:(id)a3;
- (id)motionCuesInCar:(id)a3;
- (id)specifiers;
- (void)setMotionCuesEnabled:(id)a3 specifier:(id)a4;
- (void)setMotionCuesInCarEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXMotionCuesController

- (AXMotionCuesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXMotionCuesController;
  v2 = [(AccessibilitySettingsBaseController *)&v5 init];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilitySettingsChanged, kAXSMotionCuesPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v7 = AXInBuddySetupKey;
    [v6 setProperty:&__kCFBooleanFalse forKey:AXInBuddySetupKey];
    v8 = AXLocStringKeyForModel();
    v9 = settingsLocString(v8, @"Accessibility-MotionCues");
    [v6 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    if (AXDeviceIsPad())
    {
      v10 = settingsLocString(@"MotionCuesTitle", @"Accessibility-MotionCues");
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setMotionCuesEnabled:specifier:" get:"motionCuesEnabled:" detail:0 cell:6 edit:0];

      [v11 setProperty:&__kCFBooleanTrue forKey:v7];
      uint64_t v12 = PSIDKey;
      CFStringRef v13 = @"MotionCues";
      v14 = v11;
    }
    else
    {
      v15 = settingsLocString(@"ON", @"Accessibility");
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v16 setProperty:&off_229450 forKey:@"MotionCueKey"];
      uint64_t v17 = PSIDKey;
      [v16 setProperty:@"MotionCuesOn" forKey:PSIDKey];
      [v5 addObject:v16];
      v18 = settingsLocString(@"AUTOMATIC", @"Accessibility");
      v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v19 setProperty:&off_229468 forKey:@"MotionCueKey"];
      [v19 setProperty:@"MotionCuesOnInCar" forKey:v17];
      [v5 addObject:v19];
      v20 = settingsLocString(@"OFF", @"Accessibility");
      v11 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v11 setProperty:&off_229480 forKey:@"MotionCueKey"];
      CFStringRef v13 = @"MotionCuesOff";
      v14 = v11;
      uint64_t v12 = v17;
    }
    [v14 setProperty:v13 forKey:v12];
    [v5 addObject:v11];
    v21 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (id)motionCuesInCar:(id)a3
{
  BOOL v3 = _AXSMotionCuesMode() == 0;

  return +[NSNumber numberWithInt:v3];
}

- (void)setMotionCuesInCarEnabled:(id)a3 specifier:(id)a4
{
  if (([a3 BOOLValue] & 1) == 0) {
    _AXSMotionCuesEnabled();
  }

  _AXSSetMotionCuesMode();
}

- (id)motionCuesEnabled:(id)a3
{
  uint64_t v3 = _AXSMotionCuesEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  int v6 = _AXSMotionCuesMode();
  id v10 = v5;
  uint64_t v7 = [v10 specifier];
  v8 = [v7 propertyForKey:@"MotionCueKey"];
  BOOL v9 = [v8 intValue] == v6;

  [v10 setChecked:v9];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXMotionCuesController;
  id v6 = a4;
  [(AXMotionCuesController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[AXMotionCuesController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v9.receiver, v9.super_class);
  v8 = [v7 propertyForKey:@"MotionCueKey"];
  [v8 intValue];

  _AXSSetMotionCuesMode();
  [(AXMotionCuesController *)self updateTableCheckedSelection:v6];
}

- (void)setMotionCuesEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id v6 = AXLogMotionCues();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = (int)v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Settings user change: enabled=%{BOOL}d", buf, 8u);
  }

  _AXSSetMotionCuesEnabled();
  if (v5)
  {
    AXDeviceIsPad();
    _AXSSetMotionCuesMode();
    [(AccessibilitySettingsBaseController *)self reloadSpecifierFromID:@"MotionCuesInCar"];
  }
  uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5, AXMotionCuesAnalyticsEnableKey);
  v11 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  AnalyticsSendEvent();

  if (v5)
  {
    objc_super v9 = AXLogMotionCues();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Checking if control center module already exists", buf, 2u);
    }
  }
}

@end