@interface MapsSettingsDrivingController
- (BOOL)wantsUniqueEntityUpdateNotifications;
- (id)_avoidHighways:(id)a3;
- (id)_avoidTolls:(id)a3;
- (id)_showHeading:(id)a3;
- (id)_showSpeedLimit:(id)a3;
- (id)specifiers;
- (void)_setAvoidHighways:(id)a3 specifier:(id)a4;
- (void)_setAvoidTolls:(id)a3 specifier:(id)a4;
- (void)_setShowHeading:(id)a3 specifier:(id)a4;
- (void)_setShowSpeedLimit:(id)a3 specifier:(id)a4;
@end

@implementation MapsSettingsDrivingController

- (BOOL)wantsUniqueEntityUpdateNotifications
{
  return 1;
}

- (id)_avoidTolls:(id)a3
{
  v3 = +[MapsSettings valueForDefaultsKey:@"MapsDefaultAvoidTollsKey"];
  if (!v3) {
    v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (void)_setAvoidTolls:(id)a3 specifier:(id)a4
{
}

- (id)_avoidHighways:(id)a3
{
  v3 = +[MapsSettings valueForDefaultsKey:@"MapsDefaultAvoidHighwaysKey"];
  if (!v3) {
    v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (void)_setAvoidHighways:(id)a3 specifier:(id)a4
{
}

- (id)_showHeading:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", MapsConfig_NavigationShowHeading, off_8AB80);
}

- (void)_setShowHeading:(id)a3 specifier:(id)a4
{
}

- (id)_showSpeedLimit:(id)a3
{
  return +[MapsSettings valueForConfigKey:](MapsSettings, "valueForConfigKey:", MapsConfig_NavigationShowSpeedLimit, off_8AB90);
}

- (void)_setShowSpeedLimit:(id)a3 specifier:(id)a4
{
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v5 = [v4 localizedStringForKey:@"Avoid Group Label [Settings]" value:@"localized string not found" table:0];
  uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  v29 = (void *)v6;
  [v3 addObject:v6];
  v7 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v8 = [v7 localizedStringForKey:@"Avoid Tolls Switch Label [Settings]" value:@"localized string not found" table:0];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setAvoidTolls:specifier:" get:"_avoidTolls:" detail:0 cell:6 edit:0];

  uint64_t v10 = PSEnabledKey;
  [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  uint64_t v11 = PSDefaultsKey;
  [v9 setProperty:@"MapsDefaultAvoidTollsKey" forKey:PSDefaultsKey];
  [v3 addObject:v9];
  v12 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v13 = [v12 localizedStringForKey:@"Avoid Highways Switch Label [Settings]" value:@"localized string not found" table:0];
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"_setAvoidHighways:specifier:" get:"_avoidHighways:" detail:0 cell:6 edit:0];

  [v14 setProperty:&__kCFBooleanTrue forKey:v10];
  [v14 setProperty:@"MapsDefaultAvoidHighwaysKey" forKey:v11];
  [v3 addObject:v14];
  if ([(MapsSettingBaseController *)self supportsNavigation])
  {
    v15 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v16 = [v15 localizedStringForKey:@"Show in Navigation Title [Settings]" value:@"localized string not found" table:0];
    +[PSSpecifier preferenceSpecifierNamed:v16 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v17 = v28 = self;

    v18 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v19 = [v18 localizedStringForKey:@"Default Navigation Footer [Settings]" value:@"localized string not found" table:0];
    [v17 setProperty:v19 forKey:PSFooterTextGroupKey];

    [v3 addObject:v17];
    v20 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v21 = [v20 localizedStringForKey:@"Show Heading Switch Label [Settings]" value:@"localized string not found" table:0];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:v28 set:"_setShowHeading:specifier:" get:"_showHeading:" detail:0 cell:6 edit:0];

    [v22 setProperty:&__kCFBooleanTrue forKey:v10];
    [v22 setProperty:@"NavigationShowHeadingKey" forKey:v11];
    [v22 setProperty:GEODefaultsDomain() forKey:@"MapsSettingsSpecifierBundleID"];
    [v3 addObject:v22];
    v23 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v24 = [v23 localizedStringForKey:@"Show Speed Limit Switch Label [Settings]" value:@"localized string not found" table:0];
    v14 = +[PSSpecifier preferenceSpecifierNamed:v24 target:v28 set:"_setShowSpeedLimit:specifier:" get:"_showSpeedLimit:" detail:0 cell:6 edit:0];

    [v14 setProperty:&__kCFBooleanTrue forKey:v10];
    [v14 setProperty:@"NavigationShowSpeedLimitKey" forKey:v11];
    [v14 setProperty:GEODefaultsDomain() forKey:@"MapsSettingsSpecifierBundleID"];
    [v3 addObject:v14];

    self = v28;
  }
  v25 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  id v26 = [v25 localizedStringForKey:@"Driving" value:@"localized string not found" table:0];

  [(MapsSettingsDrivingController *)self setSpecifiers:v3];

  return v3;
}

@end