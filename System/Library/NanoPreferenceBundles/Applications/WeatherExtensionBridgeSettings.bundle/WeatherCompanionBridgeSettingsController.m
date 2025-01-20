@interface WeatherCompanionBridgeSettingsController
+ (void)initialize;
- (BOOL)needsRefresh;
- (WeatherCompanionBridgeSettingsController)init;
- (WeatherPrefsMonitor)weatherPrefsMonitor;
- (id)applicationBundleIdentifier;
- (id)defaultCity:(id)a3;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)monitorObservedReload:(id)a3;
- (void)setWeatherPrefsMonitor:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WeatherCompanionBridgeSettingsController

+ (void)initialize
{
  if (qword_CC28 != -1) {
    dispatch_once(&qword_CC28, &stru_82F0);
  }
}

- (WeatherCompanionBridgeSettingsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WeatherCompanionBridgeSettingsController;
  result = [(WeatherCompanionBridgeSettingsController *)&v3 init];
  if (result) {
    result->_needsRefresh = 0;
  }
  return result;
}

- (id)defaultCity:(id)a3
{
  objc_super v3 = [(WeatherCompanionBridgeSettingsController *)self weatherPrefsMonitor];
  v4 = [v3 selectedCity];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 name];
  }
  else if ([v3 areLocationServicesResolved])
  {
    v7 = [v3 cities];
    v8 = [v7 firstObject];
    v6 = [v8 name];
  }
  else
  {
    v6 = &stru_8410;
  }

  return v6;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"APP_PANE_TITLE" value:&stru_8410 table:@"WeatherBridgeSettings"];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.weather";
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WeatherCompanionBridgeSettingsController *)self reload];
  v5.receiver = self;
  v5.super_class = (Class)WeatherCompanionBridgeSettingsController;
  [(WeatherCompanionBridgeSettingsController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_needsRefresh = 1;
  v3.receiver = self;
  v3.super_class = (Class)WeatherCompanionBridgeSettingsController;
  [(WeatherCompanionBridgeSettingsController *)&v3 viewWillDisappear:a3];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v27 = objc_opt_new();
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"WEATHER_LIMIT_TEXT" value:&stru_8410 table:@"WeatherBridgeSettings"];
    uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, 20);

    v8 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v9 = PSFooterTextGroupKey;
    v28 = (void *)v7;
    [v8 setProperty:v7 forKey:PSFooterTextGroupKey];
    v10 = +[PSSpecifier emptyGroupSpecifier];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"DEFAULT_CITY_NOTE_COMPLICATION" value:&stru_8410 table:@"WeatherBridgeSettings"];
    [v10 setProperty:v12 forKey:v9];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = v10;
    v15 = [v13 localizedStringForKey:@"DEFAULT_CITY" value:&stru_8410 table:@"WeatherBridgeSettings"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"defaultCity:" detail:objc_opt_class() cell:2 edit:0];

    v30[0] = v8;
    v30[1] = v14;
    v30[2] = v16;
    v17 = +[NSArray arrayWithObjects:v30 count:3];
    [v27 addObjectsFromArray:v17];

    v29.receiver = self;
    v29.super_class = (Class)WeatherCompanionBridgeSettingsController;
    v18 = [(WeatherCompanionBridgeSettingsController *)&v29 specifiers];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = +[NSArray array];
    }
    v21 = v20;

    v22 = [v21 specifierForID:BPSMirrorGroupID];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"WEATHER_NOTIFICITON_SETTINGS" value:&stru_8410 table:@"WeatherBridgeSettings"];
    [v22 setName:v24];

    [v27 addObjectsFromArray:v21];
    v25 = *(void **)&self->BPSNotificationAppController_opaque[v3];
    *(void *)&self->BPSNotificationAppController_opaque[v3] = v27;

    v4 = *(void **)&self->BPSNotificationAppController_opaque[v3];
  }

  return v4;
}

- (void)monitorObservedReload:(id)a3
{
  v4 = qword_CC30;
  if (os_log_type_enabled((os_log_t)qword_CC30, OS_LOG_TYPE_DEBUG)) {
    sub_61EC(v4);
  }
  [(WeatherCompanionBridgeSettingsController *)self setSpecifiers:0];
  [(WeatherCompanionBridgeSettingsController *)self reloadSpecifiers];
}

- (WeatherPrefsMonitor)weatherPrefsMonitor
{
  weatherPrefsMonitor = self->_weatherPrefsMonitor;
  if (!weatherPrefsMonitor)
  {
    v4 = [[WeatherPrefsMonitor alloc] initWithDelegate:self];
    objc_super v5 = self->_weatherPrefsMonitor;
    self->_weatherPrefsMonitor = v4;

    weatherPrefsMonitor = self->_weatherPrefsMonitor;
  }

  return weatherPrefsMonitor;
}

- (void)setWeatherPrefsMonitor:(id)a3
{
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void).cxx_destruct
{
}

@end