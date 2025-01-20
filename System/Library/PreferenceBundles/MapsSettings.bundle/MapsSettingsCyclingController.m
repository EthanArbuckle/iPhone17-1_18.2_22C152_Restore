@interface MapsSettingsCyclingController
- (BOOL)wantsUniqueEntityUpdateNotifications;
- (id)_avoidBusyRoads:(id)a3;
- (id)_avoidHills:(id)a3;
- (id)_useEbike:(id)a3;
- (id)specifiers;
- (void)_setAvoidBusyRoads:(id)a3 specifier:(id)a4;
- (void)_setAvoidHills:(id)a3 specifier:(id)a4;
- (void)_setUseEbike:(id)a3 specifier:(id)a4;
@end

@implementation MapsSettingsCyclingController

- (BOOL)wantsUniqueEntityUpdateNotifications
{
  return 1;
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[GEOCountryConfiguration sharedConfiguration];
  v5 = [v4 countryCode];
  unsigned __int8 v6 = [v5 isEqualToString:@"CN"];

  v7 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 localizedStringForKey:@"My Bike Label [Settings]" value:@"localized string not found" table:0];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v3 addObject:v10];
    v11 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v12 = [v11 localizedStringForKey:@"E-Bike Switch Label [Settings]" value:@"localized string not found" table:0];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_setUseEbike:specifier:" get:"_useEbike:" detail:0 cell:6 edit:0];

    [v13 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v13 setProperty:@"MapsDefaultUseEbikeKey" forKey:PSDefaultsKey];
    [v3 addObject:v13];
  }
  else
  {
    v14 = [v7 localizedStringForKey:@"Avoid Group Label [Settings]" value:@"localized string not found" table:0];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v3 addObject:v10];
    v15 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v16 = [v15 localizedStringForKey:@"Avoid Hills Switch Label [Settings]" value:@"localized string not found" table:0];
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"_setAvoidHills:specifier:" get:"_avoidHills:" detail:0 cell:6 edit:0];

    uint64_t v18 = PSEnabledKey;
    [v17 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    uint64_t v19 = PSDefaultsKey;
    [v17 setProperty:@"MapsDefaultAvoidHillsKey" forKey:PSDefaultsKey];
    [v3 addObject:v17];
    v20 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    v21 = [v20 localizedStringForKey:@"Avoid Busy Roads Switch Label [Settings]" value:@"localized string not found" table:0];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"_setAvoidBusyRoads:specifier:" get:"_avoidBusyRoads:" detail:0 cell:6 edit:0];

    [v13 setProperty:&__kCFBooleanTrue forKey:v18];
    [v13 setProperty:@"MapsDefaultAvoidBusyRoadsKey" forKey:v19];
    [v3 addObject:v13];
    v22 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v23 = [v22 localizedStringForKey:@"Cycling" value:@"localized string not found" table:0];
  }
  [(MapsSettingsCyclingController *)self setSpecifiers:v3];

  return v3;
}

- (id)_avoidHills:(id)a3
{
  v3 = +[MapsSettings valueForDefaultsKey:@"MapsDefaultAvoidHillsKey"];
  if (!v3) {
    v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (void)_setAvoidHills:(id)a3 specifier:(id)a4
{
}

- (id)_avoidBusyRoads:(id)a3
{
  v3 = +[MapsSettings valueForDefaultsKey:@"MapsDefaultAvoidBusyRoadsKey"];
  if (!v3) {
    v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (void)_setAvoidBusyRoads:(id)a3 specifier:(id)a4
{
}

- (id)_useEbike:(id)a3
{
  v3 = +[MapsSettings valueForDefaultsKey:@"MapsDefaultUseEbikeKey"];
  if (!v3) {
    v3 = &__kCFBooleanFalse;
  }

  return v3;
}

- (void)_setUseEbike:(id)a3 specifier:(id)a4
{
}

@end