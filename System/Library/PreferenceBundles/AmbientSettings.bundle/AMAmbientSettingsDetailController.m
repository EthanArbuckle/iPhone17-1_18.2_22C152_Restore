@interface AMAmbientSettingsDetailController
- (BOOL)_supportsAlwaysOn;
- (id)_alwaysOnDisplayLinkSpecifier;
- (id)_ambientFeatureName;
- (id)_ambientModeGroupSpecifier;
- (id)_ambientModeSpecifier;
- (id)_nightModeSwitchSpecifier;
- (id)_notificationsPreviewSpecifier;
- (id)_notificationsSpecifier;
- (id)_primaryDisplayGroupSpecifier;
- (id)_primaryNotificationsGroupSpecifier;
- (id)_secondaryDisplayGroupSpecifier;
- (id)_secondaryNotificationsGroupSpecifier;
- (id)_updatesForSpecifiers:(id)a3 ambientModeEnabled:(BOOL)a4 animated:(BOOL)a5;
- (id)specifiers;
- (void)_setAmbientModeEnabled:(id)a3 specifier:(id)a4;
- (void)_setNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)emitNavigationEvent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AMAmbientSettingsDetailController

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = [(AMAmbientSettingsDetailController *)self _ambientModeGroupSpecifier];
  [v3 addObject:v4];
  v5 = [(AMAmbientSettingsDetailController *)self _ambientModeSpecifier];
  [v3 addObject:v5];
  v6 = [v5 performGetter];
  id v7 = [v6 BOOLValue];

  v8 = [(AMAmbientSettingsDetailController *)self _updatesForSpecifiers:v3 ambientModeEnabled:v7 animated:0];
  v9 = [v8 currentSpecifiers];
  [v3 setArray:v9];

  uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
  v11 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v12 = v3;

  id v13 = *(id *)&self->PSListController_opaque[v10];
  return v13;
}

- (id)_ambientModeGroupSpecifier
{
  v3 = +[PSSpecifier groupSpecifierWithName:&stru_8320];
  [v3 setProperty:@"AMBIENT_MODE_ENABLED_GROUP" forKey:PSIDKey];
  v4 = AMAmbientSettingsBundle();
  v5 = [v4 localizedStringForKey:@"AMBIENT_MODE_ENABLED_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
  v6 = [(AMAmbientSettingsDetailController *)self _ambientFeatureName];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
  [v3 setProperty:v7 forKey:PSFooterTextGroupKey];

  return v3;
}

- (id)_primaryDisplayGroupSpecifier
{
  v3 = +[PSSpecifier groupSpecifierWithID:@"PRIMARY_DISPLAY_GROUP"];
  if (![(AMAmbientSettingsDetailController *)self _supportsAlwaysOn])
  {
    v4 = AMAmbientSettingsBundle();
    v5 = [v4 localizedStringForKey:@"DISPLAY_SETTINGS_GROUP_HEADER" value:&stru_8320 table:@"AmbientSettings"];
    [v3 setName:v5];

    v6 = AMAmbientSettingsBundle();
    id v7 = [v6 localizedStringForKey:@"NIGHT_MODE_ENABLED_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
    v8 = [(AMAmbientSettingsDetailController *)self _ambientFeatureName];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
    [v3 setProperty:v9 forKey:PSFooterTextGroupKey];
  }

  return v3;
}

- (id)_secondaryDisplayGroupSpecifier
{
  v2 = +[PSSpecifier groupSpecifierWithName:&stru_8320];
  [v2 setProperty:@"SECONDARY_DISPLAY_GROUP" forKey:PSIDKey];

  return v2;
}

- (id)_ambientModeSpecifier
{
  v3 = [(AMAmbientSettingsDetailController *)self _ambientFeatureName];
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"_setAmbientModeEnabled:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v4 setProperty:@"AMBIENT_MODE_ENABLED" forKey:PSIDKey];
  [v4 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
  [v4 setProperty:@"AMEnableAmbientMode" forKey:PSKeyNameKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];

  return v4;
}

- (id)_alwaysOnDisplayLinkSpecifier
{
  v2 = AMAmbientSettingsBundle();
  v3 = [v2 localizedStringForKey:@"ALWAYS_ON_DISPLAY_OPTIONS" value:&stru_8320 table:@"AmbientSettings"];
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];
  [v4 setProperty:@"ALWAYS_ON_DISPLAY_OPTIONS" forKey:PSIDKey];

  return v4;
}

- (id)_nightModeSwitchSpecifier
{
  v3 = AMAmbientSettingsBundle();
  v4 = [v3 localizedStringForKey:@"NIGHT_MODE_ENABLED" value:&stru_8320 table:@"AmbientSettings"];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v5 setProperty:@"BUMP_TO_WAKE_ENABLED" forKey:PSIDKey];
  [v5 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
  [v5 setProperty:@"AMNightModeEnabled" forKey:PSKeyNameKey];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];

  return v5;
}

- (id)_primaryNotificationsGroupSpecifier
{
  v3 = AMAmbientSettingsBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATIONS_ENABLED_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
  v5 = [(AMAmbientSettingsDetailController *)self _ambientFeatureName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  id v7 = AMAmbientSettingsBundle();
  v8 = [v7 localizedStringForKey:@"NOTIFICATIONS_GROUP_HEADER" value:&stru_8320 table:@"AmbientSettings"];
  v9 = +[PSSpecifier groupSpecifierWithName:v8];

  [v9 setProperty:@"PRIMARY_NOTIFICATION_GROUP" forKey:PSIDKey];
  [v9 setProperty:v6 forKey:PSFooterTextGroupKey];

  return v9;
}

- (id)_secondaryNotificationsGroupSpecifier
{
  v3 = AMAmbientSettingsBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATIONS_PREVIEW_FOOTER" value:&stru_8320 table:@"AmbientSettings"];
  v5 = [(AMAmbientSettingsDetailController *)self _ambientFeatureName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  id v7 = +[PSSpecifier groupSpecifierWithName:&stru_8320];
  [v7 setProperty:@"SECONDARY_NOTIFICATIONS_GROUP" forKey:PSIDKey];
  [v7 setProperty:v6 forKey:PSFooterTextGroupKey];

  return v7;
}

- (id)_notificationsSpecifier
{
  v3 = AMAmbientSettingsBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATIONS_ENABLED" value:&stru_8320 table:@"AmbientSettings"];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"_setNotificationsEnabled:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v5 setProperty:@"NOTIFICATIONS_ENABLED" forKey:PSIDKey];
  [v5 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
  [v5 setProperty:@"AMNotificationsEnabled" forKey:PSKeyNameKey];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSDefaultValueKey];

  return v5;
}

- (id)_notificationsPreviewSpecifier
{
  v3 = AMAmbientSettingsBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATIONS_PREVIEW" value:&stru_8320 table:@"AmbientSettings"];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v5 setProperty:@"NOTIFICATIONS_PREVIEW" forKey:PSIDKey];
  [v5 setProperty:@"com.apple.ambient" forKey:PSDefaultsKey];
  [v5 setProperty:@"AMNotificationsPreviewOnTapOnlyEnabled" forKey:PSKeyNameKey];
  [v5 setProperty:&__kCFBooleanFalse forKey:PSDefaultValueKey];

  return v5;
}

- (id)_updatesForSpecifiers:(id)a3 ambientModeEnabled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[PSSpecifierUpdates updatesWithSpecifiers:v8];
  unsigned int v10 = [(AMAmbientSettingsDetailController *)self _supportsAlwaysOn];
  if (v6)
  {
    unsigned int v11 = v10;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v13 = [(AMAmbientSettingsDetailController *)self _primaryDisplayGroupSpecifier];
    [v12 addObject:v13];

    if (v11)
    {
      [(AMAmbientSettingsDetailController *)self _alwaysOnDisplayLinkSpecifier];
    }
    else
    {
      v14 = [(AMAmbientSettingsDetailController *)self _nightModeSwitchSpecifier];
      [v12 addObject:v14];

      [(AMAmbientSettingsDetailController *)self _secondaryDisplayGroupSpecifier];
    v15 = };
    [v12 addObject:v15];

    v16 = [(AMAmbientSettingsDetailController *)self _primaryNotificationsGroupSpecifier];
    [v12 addObject:v16];

    v17 = [(AMAmbientSettingsDetailController *)self _notificationsSpecifier];
    [v12 addObject:v17];
    v18 = [v17 performGetter];
    unsigned int v19 = [v18 BOOLValue];

    if (v19)
    {
      v20 = [(AMAmbientSettingsDetailController *)self _secondaryNotificationsGroupSpecifier];
      [v12 addObject:v20];

      v21 = [(AMAmbientSettingsDetailController *)self _notificationsPreviewSpecifier];
      [v12 addObject:v21];
    }
    [v9 insertContiguousSpecifiers:v12 afterSpecifierWithID:@"AMBIENT_MODE_ENABLED"];
  }
  else
  {
    objc_msgSend(v9, "removeSpecifiersInRange:", objc_msgSend(v8, "indexOfSpecifierWithID:", @"PRIMARY_DISPLAY_GROUP"), (char *)objc_msgSend(v8, "count") - 2);
  }
  v22 = [v9 context];
  [v22 setAnimated:v5];

  return v9;
}

- (void)_setAmbientModeEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  CFPreferencesSetAppValue(@"AMEnableAmbientMode", v5, @"com.apple.ambient");
  uint64_t v6 = *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v7 = [v5 BOOLValue];

  id v8 = [(AMAmbientSettingsDetailController *)self _updatesForSpecifiers:v6 ambientModeEnabled:v7 animated:1];
  [(AMAmbientSettingsDetailController *)self performSpecifierUpdates:v8];
}

- (void)_setNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  CFPreferencesSetAppValue(@"AMNotificationsEnabled", v5, @"com.apple.ambient");
  uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
  id v12 = +[PSSpecifierUpdates updatesWithSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers]];
  unsigned int v7 = [v5 BOOLValue];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = [(AMAmbientSettingsDetailController *)self _secondaryNotificationsGroupSpecifier];
    [v8 addObject:v9];

    unsigned int v10 = [(AMAmbientSettingsDetailController *)self _notificationsPreviewSpecifier];
    [v8 addObject:v10];

    [v12 insertContiguousSpecifiers:v8 afterSpecifierWithID:@"NOTIFICATIONS_ENABLED"];
  }
  else
  {
    objc_msgSend(v12, "removeSpecifiersInRange:", objc_msgSend(*(id *)&self->PSListController_opaque[v6], "indexOfSpecifierWithID:", @"SECONDARY_NOTIFICATIONS_GROUP"), 2);
  }
  unsigned int v11 = [v12 context];
  [v11 setAnimated:1];

  [(AMAmbientSettingsDetailController *)self performSpecifierUpdates:v12];
}

- (BOOL)_supportsAlwaysOn
{
  return _MGGetBoolAnswer(@"j8/Omm6s1lsmTDFsXjsBfA", a2);
}

- (id)_ambientFeatureName
{
  v2 = AMAmbientSettingsBundle();
  v3 = [v2 localizedStringForKey:@"AMBIENT_FEATURE_NAME" value:&stru_8320 table:@"AmbientSettings"];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMAmbientSettingsDetailController;
  [(AMAmbientSettingsDetailController *)&v4 viewWillAppear:a3];
  [(AMAmbientSettingsDetailController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  id v8 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.StandBy"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"StandBy" table:0 locale:v4 bundleURL:v6];

  [(AMAmbientSettingsDetailController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.standby" title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v8];
}

@end