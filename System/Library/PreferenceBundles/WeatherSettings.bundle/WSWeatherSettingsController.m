@interface WSWeatherSettingsController
- (BOOL)locationPermissionsSupportHomeAndWork;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CLLocationManager)locationManager;
- (NSString)celsiusValue;
- (NSString)fahrenheitValue;
- (NSString)mirrorSystemValue;
- (PSSpecifier)celsius;
- (PSSpecifier)fahrenheit;
- (PSSpecifier)mirrorSystem;
- (PSSpecifier)resetIdentifier;
- (PSSpecifier)showHomeAndWorkLabels;
- (PSSpecifier)temperatureUnitGroup;
- (PSSystemPolicyForApp)appPolicy;
- (WSWeatherSettingsController)init;
- (id)privacyButtonTitle;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (void)applicationWillEnterForeground;
- (void)openContacts;
- (void)preferencesDidUpdate:(id)a3;
- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5;
- (void)reloadWidget;
- (void)selectUnit:(id)a3;
- (void)setAppPolicy:(id)a3;
- (void)setCelsius:(id)a3;
- (void)setCelsiusValue:(id)a3;
- (void)setFahrenheit:(id)a3;
- (void)setFahrenheitValue:(id)a3;
- (void)setHomeAndWorkEnabled:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setMirrorSystem:(id)a3;
- (void)setMirrorSystemValue:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setResetIdentifier:(id)a3;
- (void)setShowHomeAndWorkLabels:(id)a3;
- (void)setTemperatureUnitGroup:(id)a3;
- (void)showPrivacyPane;
- (void)updateHomeAndWorkSwitch;
- (void)updateSelectedUnit;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WSWeatherSettingsController

- (WSWeatherSettingsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)WSWeatherSettingsController;
  v2 = [(WSWeatherSettingsController *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"localeDidChange" name:NSCurrentLocaleDidChangeNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"preferencesDidUpdate:" name:@"WSWeatherSettingsStateDidUpdateNotification" object:0 suspensionBehavior:2];

    id v6 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundleIdentifier:@"com.apple.weather" delegate:v2 onQueue:&_dispatch_main_q];
    [(WSWeatherSettingsController *)v2 setLocationManager:v6];

    v7 = [(WSWeatherSettingsController *)v2 locationManager];
    [v7 setDelegate:v2];

    [(WSWeatherSettingsController *)v2 setCelsiusValue:NSLocaleTemperatureUnitCelsius];
    [(WSWeatherSettingsController *)v2 setFahrenheitValue:NSLocaleTemperatureUnitFahrenheit];
    [(WSWeatherSettingsController *)v2 setMirrorSystemValue:@"mirrorSystem"];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WSWeatherSettingsController;
  [(WSWeatherSettingsController *)&v11 viewDidAppear:a3];
  v4 = +[WeatherSettingsConstants RootNavigationUrl];
  v5 = +[NSURL URLWithString:v4];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  v8 = WSBundle();
  objc_super v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:@"weather-settings-title" table:@"Localizable" locale:v7 bundleURL:v9];

  [(WSWeatherSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.weather" title:v10 localizedNavigationComponents:&__NSArray0__struct deepLink:v5];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_5DB8;
    v80[3] = &unk_C408;
    v80[4] = self;
    v5 = objc_retainBlock(v80);
    id v6 = WSBundle();
    v7 = [v6 localizedStringForKey:@"weather-settings-title" value:&stru_C7E0 table:@"Localizable"];
    [(WSWeatherSettingsController *)self setTitle:v7];

    id v8 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.weather"];
    [(WSWeatherSettingsController *)self setAppPolicy:v8];

    objc_super v9 = [(WSWeatherSettingsController *)self appPolicy];
    id v10 = [v9 specifiers];
    id v11 = [v10 mutableCopy];

    v12 = WSBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"preferred-metric-group-title" value:&stru_C7E0 table:@"Localizable"];

    v77 = (void *)v13;
    v14 = +[PSSpecifier groupSpecifierWithID:@"TEMPERATURE_UNIT" name:v13];
    [(WSWeatherSettingsController *)self setTemperatureUnitGroup:v14];

    v15 = [(WSWeatherSettingsController *)self temperatureUnitGroup];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:PSIsRadioGroupKey];

    v16 = WSBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"preferred-metric-celsius" value:&stru_C7E0 table:@"Localizable"];

    v76 = (void *)v17;
    v18 = ((void (*)(void *, const __CFString *, uint64_t, uint64_t, void, void))v5[2])(v5, @"WSTemperatureUnitC", v17, 3, 0, 0);
    [(WSWeatherSettingsController *)self setCelsius:v18];

    v19 = [(WSWeatherSettingsController *)self celsius];
    [v19 setButtonAction:"selectUnit:"];

    v20 = WSBundle();
    uint64_t v21 = [v20 localizedStringForKey:@"preferred-metric-fahrenheit" value:&stru_C7E0 table:@"Localizable"];

    v75 = (void *)v21;
    v22 = ((void (*)(void *, const __CFString *, uint64_t, uint64_t, void, void))v5[2])(v5, @"WSTemperatureUnitF", v21, 3, 0, 0);
    [(WSWeatherSettingsController *)self setFahrenheit:v22];

    v23 = [(WSWeatherSettingsController *)self fahrenheit];
    [v23 setButtonAction:"selectUnit:"];

    v24 = WSBundle();
    uint64_t v25 = [v24 localizedStringForKey:@"preferred-metric-use-system" value:&stru_C7E0 table:@"Localizable"];

    v26 = ((void (*)(void *, const __CFString *, uint64_t, uint64_t, void, void))v5[2])(v5, @"WSTemperatureUnitMirrorSystem", v25, 3, 0, 0);
    [(WSWeatherSettingsController *)self setMirrorSystem:v26];

    v27 = [(WSWeatherSettingsController *)self mirrorSystem];
    [v27 setButtonAction:"selectUnit:"];

    v28 = WSBundle();
    uint64_t v29 = [v28 localizedStringForKey:@"preferred-metric-footer-title" value:&stru_C7E0 table:@"Localizable"];

    v30 = [(WSWeatherSettingsController *)self temperatureUnitGroup];
    v73 = (void *)v29;
    uint64_t v79 = PSFooterTextGroupKey;
    objc_msgSend(v30, "setProperty:forKey:", v29);

    v31 = [(WSWeatherSettingsController *)self temperatureUnitGroup];
    [v11 addObject:v31];

    v32 = [(WSWeatherSettingsController *)self celsius];
    [v11 addObject:v32];

    v33 = [(WSWeatherSettingsController *)self fahrenheit];
    [v11 addObject:v33];

    v34 = [(WSWeatherSettingsController *)self mirrorSystem];
    [v11 addObject:v34];

    v35 = WSBundle();
    uint64_t v36 = [v35 localizedStringForKey:@"locations-group-title" value:&stru_C7E0 table:@"Localizable"];

    v72 = (void *)v36;
    v37 = +[PSSpecifier groupSpecifierWithID:@"WSHomeWorkGroup" name:v36];
    v38 = WSBundle();
    v39 = [v38 localizedStringForKey:@"locations-footer-title-with-link" value:&stru_C7E0 table:@"Localizable"];

    v40 = v39;
    NSUInteger v41 = (NSUInteger)[v39 rangeOfString:@"["];
    id v42 = [v40 rangeOfString:@"]"];
    uint64_t v78 = v3;
    v74 = (void *)v25;
    v71 = v40;
    if (v41 == 0x7FFFFFFFFFFFFFFFLL || (NSUInteger v43 = (NSUInteger)v42, v42 == (id)0x7FFFFFFFFFFFFFFFLL))
    {
      [v37 setProperty:v40 forKey:v79];
    }
    else
    {
      v44 = [v40 stringByReplacingOccurrencesOfString:@"[" withString:&stru_C7E0];
      v45 = [v44 stringByReplacingOccurrencesOfString:@"]" withString:&stru_C7E0];

      NSUInteger v46 = v41 + ~v43;
      if (v43 > v41)
      {
        NSUInteger v47 = v43 + ~v41;
      }
      else
      {
        NSUInteger v41 = v43;
        NSUInteger v47 = v46;
      }
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      [v37 setProperty:v49 forKey:PSFooterCellClassGroupKey];

      v82.location = v41;
      v82.length = v47;
      v50 = NSStringFromRange(v82);
      [v37 setProperty:v50 forKey:PSFooterHyperlinkViewLinkRangeKey];

      v51 = +[NSValue valueWithNonretainedObject:self];
      [v37 setProperty:v51 forKey:PSFooterHyperlinkViewTargetKey];

      v52 = NSStringFromSelector("openContacts");
      [v37 setProperty:v52 forKey:PSFooterHyperlinkViewActionKey];

      [v37 setProperty:v45 forKey:PSFooterHyperlinkViewTitleKey];
    }
    v53 = WSBundle();
    v70 = [v53 localizedStringForKey:@"home-and-work" value:&stru_C7E0 table:@"Localizable"];

    v54 = ((void (*)(void *, const __CFString *, void *, uint64_t, void, void *))v5[2])(v5, @"HOME_WORK_SHOW_LABELS", v70, 6, 0, &__kCFBooleanTrue);
    [(WSWeatherSettingsController *)self setShowHomeAndWorkLabels:v54];

    [v11 addObject:v37];
    v55 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
    [v11 addObject:v55];

    v56 = WSBundle();
    v69 = [v56 localizedStringForKey:@"privacy-settings-group-title" value:&stru_C7E0 table:@"Localizable"];

    +[PSSpecifier groupSpecifierWithID:@"WSPrivacyGroup" name:v69];
    v58 = v57 = (void (**)(void, void, void, void, void, void))v5;
    v59 = [(WSWeatherSettingsController *)self privacyButtonTitle];
    v60 = +[PSSpecifier preferenceSpecifierNamed:v59 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v60 setButtonAction:"showPrivacyPane"];
    [v60 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v61 = WSBundle();
    v62 = [v61 localizedStringForKey:@"reset-identifier-title" value:&stru_C7E0 table:@"Localizable"];

    v63 = ((void (**)(void, const __CFString *, void *, uint64_t, void, void *))v57)[2](v57, @"PRIVACY_RESET", v62, 6, 0, &__kCFBooleanFalse);
    [(WSWeatherSettingsController *)self setResetIdentifier:v63];

    v64 = WSBundle();
    v65 = [v64 localizedStringForKey:@"privacy-settings-footer-title" value:&stru_C7E0 table:@"Localizable"];

    [v58 setProperty:v65 forKey:v79];
    [v11 addObject:v58];
    [v11 addObject:v60];
    v66 = [(WSWeatherSettingsController *)self resetIdentifier];
    [v11 addObject:v66];

    v67 = *(void **)&self->PSListController_opaque[v78];
    *(void *)&self->PSListController_opaque[v78] = v11;

    [(WSWeatherSettingsController *)self updateSelectedUnit];
    [(WSWeatherSettingsController *)self updateHomeAndWorkSwitch];

    v4 = *(void **)&self->PSListController_opaque[v78];
  }

  return v4;
}

- (void)selectUnit:(id)a3
{
  id v4 = a3;
  v5 = +[WeatherSettingsState defaultState];
  id v6 = [v5 units];
  v7 = [v6 preferredTemperatureUnit];

  id v8 = +[WeatherSettingsConstants TemperatureNavigationUrl];
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_60FC;
  v20 = &unk_C430;
  id v9 = v7;
  id v21 = v9;
  v22 = self;
  [(WSWeatherSettingsController *)self registerUndoActionWithKey:@"undo-temperature-unit" urlString:v8 undoAction:&v17];

  id v10 = [(WSWeatherSettingsController *)self celsius];

  if (v10 == v4)
  {
    v12 = +[WeatherSettingsState defaultState];
    v14 = [v12 units];
    uint64_t v15 = +[NSUnitTemperature celsius];
LABEL_6:
    v16 = (void *)v15;
    [v14 setPreferredTemperatureUnit:v15];

    goto LABEL_7;
  }
  id v11 = [(WSWeatherSettingsController *)self fahrenheit];

  v12 = +[WeatherSettingsState defaultState];
  uint64_t v13 = [v12 units];
  v14 = v13;
  if (v11 == v4)
  {
    uint64_t v15 = +[NSUnitTemperature fahrenheit];
    goto LABEL_6;
  }
  [v13 setPreferredTemperatureUnit:0];
LABEL_7:

  [(WSWeatherSettingsController *)self reloadWidget];
  [(WSWeatherSettingsController *)self updateSelectedUnit];
}

- (void)reloadWidget
{
  id v3 = [objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:@"com.apple.weather.widget" kind:@"com.apple.weather"];
  id v2 = [v3 reloadTimeline];
}

- (void)updateSelectedUnit
{
  id v3 = +[WeatherSettingsState defaultState];
  id v4 = [v3 units];
  id v20 = [v4 preferredTemperatureUnit];

  id v5 = +[NSUnitTemperature celsius];

  if (v20 == v5)
  {
    uint64_t v7 = [(WSWeatherSettingsController *)self celsius];
  }
  else
  {
    id v6 = +[NSUnitTemperature fahrenheit];

    if (v20 == v6) {
      [(WSWeatherSettingsController *)self fahrenheit];
    }
    else {
    uint64_t v7 = [(WSWeatherSettingsController *)self mirrorSystem];
    }
  }
  id v8 = (void *)v7;
  id v9 = [(WSWeatherSettingsController *)self temperatureUnitGroup];
  [v9 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];

  id v10 = [(WSWeatherSettingsController *)self celsius];
  uint64_t v11 = PSTableCellKey;
  v12 = [v10 propertyForKey:PSTableCellKey];
  uint64_t v13 = [(WSWeatherSettingsController *)self celsius];
  [v12 setChecked:v13 == v8];

  v14 = [(WSWeatherSettingsController *)self fahrenheit];
  uint64_t v15 = [v14 propertyForKey:v11];
  v16 = [(WSWeatherSettingsController *)self fahrenheit];
  [v15 setChecked:v16 == v8];

  uint64_t v17 = [(WSWeatherSettingsController *)self mirrorSystem];
  uint64_t v18 = [v17 propertyForKey:v11];
  v19 = [(WSWeatherSettingsController *)self mirrorSystem];
  [v18 setChecked:v19 == v8];
}

- (void)updateHomeAndWorkSwitch
{
  BOOL v3 = [(WSWeatherSettingsController *)self locationPermissionsSupportHomeAndWork];

  [(WSWeatherSettingsController *)self setHomeAndWorkEnabled:v3];
}

- (void)setHomeAndWorkEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
  id v6 = +[NSNumber numberWithBool:v3];
  [v5 setProperty:v6 forKey:PSEnabledKey];

  uint64_t v7 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
  id v8 = [(WSWeatherSettingsController *)self readPreferenceValue:v7];
  BOOL v9 = v8 != 0;

  id v10 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
  uint64_t v11 = +[NSNumber numberWithBool:v9];
  [v10 setProperty:v11 forKey:PSValueKey];

  id v14 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
  v12 = [v14 propertyForKey:PSTableCellKey];
  uint64_t v13 = [(WSWeatherSettingsController *)self showHomeAndWorkLabels];
  [v12 reloadWithSpecifier:v13 animated:1];
}

- (BOOL)locationPermissionsSupportHomeAndWork
{
  id v2 = [(WSWeatherSettingsController *)self locationManager];
  unsigned int v3 = [v2 authorizationStatus];

  return v3 - 3 < 2;
}

- (void)openContacts
{
  +[NSURL URLWithString:@"contact://show?ref=me"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)applicationWillEnterForeground
{
  id v3 = +[WeatherSettingsState defaultState];
  id v4 = [v3 units];
  [v4 refreshUnits];

  [(WSWeatherSettingsController *)self updateSelectedUnit];
}

- (void)preferencesDidUpdate:(id)a3
{
  id v4 = +[WeatherSettingsState defaultState];
  id v5 = [v4 units];
  [v5 refreshUnits];

  [(WSWeatherSettingsController *)self updateSelectedUnit];

  [(WSWeatherSettingsController *)self reload];
}

- (void)showPrivacyPane
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.weather"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (id)privacyButtonTitle
{
  id v2 = +[OBBundle bundleWithIdentifier:@"com.apple.onboarding.weather"];
  id v3 = [v2 privacyFlow];
  id v4 = [v3 localizedButtonTitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = WSBundle();
    id v5 = [v6 localizedStringForKey:@"privacy-about-privacy-title" value:&stru_C7E0 table:@"Localizable"];
  }

  return v5;
}

- (id)readPreferenceValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"PRIVACY_RESET"];

  if (v6)
  {
    uint64_t v7 = +[WeatherSettingsState defaultState];
    id v8 = [v7 resetIdentifier];

LABEL_3:
    id v9 = v8;
    goto LABEL_4;
  }
  v12 = [v4 identifier];
  int v13 = [v12 isEqualToString:@"HOME_WORK_SHOW_LABELS"];

  if ((v13 & 1) == 0)
  {
    uint64_t v11 = PSValueKey;
    goto LABEL_10;
  }
  id v14 = +[WeatherSettingsState defaultState];
  id v8 = [v14 showHomeWorkLabels];

  if ([(WSWeatherSettingsController *)self locationPermissionsSupportHomeAndWork])
  {
    goto LABEL_3;
  }
  id v9 = 0;
LABEL_4:
  id v10 = +[NSNumber numberWithBool:v9];
  uint64_t v11 = PSValueKey;
  if (v10)
  {
    [v4 setProperty:v10 forKey:PSValueKey];
  }
LABEL_10:
  uint64_t v15 = [v4 propertyForKey:v11];

  return v15;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  unsigned int v9 = [v8 isEqualToString:@"PRIVACY_RESET"];

  if (v9)
  {
    id v10 = +[WeatherSettingsConstants PrivacyResetNavigationUrl];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_6B80;
    v25[3] = &unk_C430;
    uint64_t v11 = (id *)v26;
    id v12 = v6;
    v26[0] = v12;
    v26[1] = self;
    [(WSWeatherSettingsController *)self registerUndoActionWithKey:@"undo-reset-identifier" urlString:v10 undoAction:v25];

    id v13 = [v12 BOOLValue];
    id v14 = +[WeatherSettingsState defaultState];
    [v14 setResetIdentifier:v13];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v15 = [v7 identifier];
  unsigned int v16 = [v15 isEqualToString:@"HOME_WORK_SHOW_LABELS"];

  if (v16)
  {
    uint64_t v17 = +[WeatherSettingsConstants PrivacyHomeWorkShowLabelsNavigationUrl];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_6BE8;
    v23 = &unk_C430;
    uint64_t v11 = (id *)v24;
    id v18 = v6;
    v24[0] = v18;
    v24[1] = self;
    [(WSWeatherSettingsController *)self registerUndoActionWithKey:@"undo-show-home-work-labels" urlString:v17 undoAction:&v20];

    id v19 = objc_msgSend(v18, "BOOLValue", v20, v21, v22, v23);
    id v14 = +[WeatherSettingsState defaultState];
    [v14 setShowHomeWorkLabels:v19];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)_NSLocalizedStringResource);
  id v12 = +[NSLocale currentLocale];
  id v13 = WSBundle();
  id v14 = [v13 bundleURL];
  id v16 = [v11 initWithKey:v10 table:@"Localizable" locale:v12 bundleURL:v14];

  uint64_t v15 = +[NSURL URLWithString:v9];

  [(WSWeatherSettingsController *)self pe_registerUndoActionName:v16 associatedDeepLink:v15 undoAction:v8];
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (PSSpecifier)temperatureUnitGroup
{
  return self->_temperatureUnitGroup;
}

- (void)setTemperatureUnitGroup:(id)a3
{
}

- (PSSpecifier)celsius
{
  return self->_celsius;
}

- (void)setCelsius:(id)a3
{
}

- (PSSpecifier)fahrenheit
{
  return self->_fahrenheit;
}

- (void)setFahrenheit:(id)a3
{
}

- (PSSpecifier)mirrorSystem
{
  return self->_mirrorSystem;
}

- (void)setMirrorSystem:(id)a3
{
}

- (PSSpecifier)showHomeAndWorkLabels
{
  return self->_showHomeAndWorkLabels;
}

- (void)setShowHomeAndWorkLabels:(id)a3
{
}

- (PSSpecifier)resetIdentifier
{
  return self->_resetIdentifier;
}

- (void)setResetIdentifier:(id)a3
{
}

- (NSString)celsiusValue
{
  return self->_celsiusValue;
}

- (void)setCelsiusValue:(id)a3
{
}

- (NSString)fahrenheitValue
{
  return self->_fahrenheitValue;
}

- (void)setFahrenheitValue:(id)a3
{
}

- (NSString)mirrorSystemValue
{
  return self->_mirrorSystemValue;
}

- (void)setMirrorSystemValue:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_mirrorSystemValue, 0);
  objc_storeStrong((id *)&self->_fahrenheitValue, 0);
  objc_storeStrong((id *)&self->_celsiusValue, 0);
  objc_storeStrong((id *)&self->_resetIdentifier, 0);
  objc_storeStrong((id *)&self->_showHomeAndWorkLabels, 0);
  objc_storeStrong((id *)&self->_mirrorSystem, 0);
  objc_storeStrong((id *)&self->_fahrenheit, 0);
  objc_storeStrong((id *)&self->_celsius, 0);
  objc_storeStrong((id *)&self->_temperatureUnitGroup, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end