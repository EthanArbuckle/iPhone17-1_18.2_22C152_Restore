@interface BridgeSettingsCityChooserController
- (WeatherPrefsMonitor)weatherPrefsMonitor;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)setWeatherPrefsMonitor:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation BridgeSettingsCityChooserController

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"DEFAULT_CITY" value:&stru_8410 table:@"WeatherBridgeSettings"];

  return v3;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = self;
    v6 = [(BridgeSettingsCityChooserController *)self weatherPrefsMonitor];
    v7 = [v6 cities];

    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    if ([v7 count])
    {
      uint64_t v30 = v2;
      v9 = v8;
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"DEFAULT_CITY" value:&stru_8410 table:@"WeatherBridgeSettings"];
      v12 = +[PSSpecifier groupSpecifierWithName:v11];

      [v12 setCellType:0];
      v13 = +[NSBundle bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"DEFAULT_CITY_HELP_COMPLICATION" value:&stru_8410 table:@"WeatherBridgeSettings"];
      [v12 setObject:v14 forKeyedSubscript:PSFooterTextGroupKey];

      [v12 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
      v32 = v12;
      [v8 addObject:v12];
      v31 = v5;
      v15 = [(BridgeSettingsCityChooserController *)v5 weatherPrefsMonitor];
      v16 = [v15 selectedCity];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v29 = v7;
      id obj = v7;
      id v17 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        uint64_t v20 = PSValueKey;
        uint64_t v21 = PSRadioGroupCheckedSpecifierKey;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v24 = [v23 name];
            v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v25 setProperty:v23 forKey:v20];
            if ([v16 isEqual:v23]) {
              [v32 setProperty:v25 forKey:v21];
            }
            v8 = v9;
            [v9 addObject:v25];
          }
          id v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v18);
      }

      uint64_t v2 = v30;
      v5 = v31;
      v7 = v29;
    }
    uint64_t v26 = +[NSArray arrayWithArray:v8];
    v27 = *(void **)&v5->PSListController_opaque[v2];
    *(void *)&v5->PSListController_opaque[v2] = v26;

    id v4 = *(id *)&v5->PSListController_opaque[v2];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BridgeSettingsCityChooserController;
  id v6 = a4;
  [(BridgeSettingsCityChooserController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v15.receiver, v15.super_class);

  v8 = [(BridgeSettingsCityChooserController *)self specifierAtIndex:[(BridgeSettingsCityChooserController *)self indexOfGroup:v7]];
  v9 = [v8 propertyForKey:PSIsRadioGroupKey];
  LODWORD(v6) = [v9 BOOLValue];

  if (v6)
  {
    v10 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    v11 = [v10 propertyForKey:PSValueKey];
    v12 = [(BridgeSettingsCityChooserController *)self weatherPrefsMonitor];
    v13 = [v12 selectedCity];

    v14 = [(BridgeSettingsCityChooserController *)self weatherPrefsMonitor];
    [v14 setSelectedCity:v11];

    if (([v11 isEqual:v13] & 1) == 0) {
      [(BridgeSettingsCityChooserController *)self setPreferenceValue:v11 specifier:v10];
    }
  }
  [(BridgeSettingsCityChooserController *)self reloadSpecifiers];
}

- (WeatherPrefsMonitor)weatherPrefsMonitor
{
  weatherPrefsMonitor = self->_weatherPrefsMonitor;
  if (!weatherPrefsMonitor)
  {
    id v4 = [[WeatherPrefsMonitor alloc] initWithDelegate:self];
    v5 = self->_weatherPrefsMonitor;
    self->_weatherPrefsMonitor = v4;

    weatherPrefsMonitor = self->_weatherPrefsMonitor;
  }

  return weatherPrefsMonitor;
}

- (void)setWeatherPrefsMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end