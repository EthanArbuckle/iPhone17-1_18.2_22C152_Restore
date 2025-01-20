@interface CSTimeZoneController
- (BOOL)_timeZoneSupportEnabled;
- (id)calendarTimeZone:(id)a3;
- (id)specifiers;
- (id)timeZoneSupportEnabled:(id)a3;
- (void)loadTimeZoneController:(id)a3;
- (void)setCalendarTimeZone:(id)a3 specifier:(id)a4;
- (void)setTimeZoneSupportEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CSTimeZoneController

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSTimeZoneController;
  [(CSTimeZoneController *)&v16 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/timeZoneOverride"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Time Zone Override" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v17 = v14;
  v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [(CSTimeZoneController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (BOOL)_timeZoneSupportEnabled
{
  v2 = (const void *)CalCopyDefaultTimeZoneSetting();
  v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (void)setTimeZoneSupportEnabled:(id)a3 specifier:(id)a4
{
  unsigned __int8 v5 = [a3 BOOLValue];
  self->_timeZoneSupportEnabled = v5;
  if (v5)
  {
    v6 = PSCityForSpecifier();
    if (v6)
    {
      [(CSTimeZoneController *)self setCalendarTimeZone:v6 specifier:self->_calendarTimeZoneSpecifier];
    }
    else
    {
      v8 = +[NSTimeZone systemTimeZone];
      [(CSTimeZoneController *)self setCalendarTimeZone:v8 specifier:self->_calendarTimeZoneSpecifier];
    }
    calendarTimeZoneSpecifier = self->_calendarTimeZoneSpecifier;
    id v10 = +[NSNumber numberWithBool:1];
    [(PSSpecifier *)calendarTimeZoneSpecifier setProperty:v10 forKey:PSEnabledKey];
  }
  else
  {
    CalSetDefaultTimeZone();
    v7 = self->_calendarTimeZoneSpecifier;
    v6 = +[NSNumber numberWithBool:0];
    [(PSSpecifier *)v7 setProperty:v6 forKey:PSEnabledKey];
  }

  [(CSTimeZoneController *)self reloadSpecifier:self->_calendarTimeZoneSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (id)timeZoneSupportEnabled:(id)a3
{
  BOOL v4 = [(CSTimeZoneController *)self _timeZoneSupportEnabled];
  self->_timeZoneSupportEnabled = v4;

  return +[NSNumber numberWithBool:v4];
}

- (id)calendarTimeZone:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CalCopyDefaultTimeZoneSetting();
  if (v4)
  {
    CFTimeZoneRef v5 = (const __CFTimeZone *)v4;
    v6 = PSCityForSpecifier();
    if (v6 || (PSCityForTimeZone(), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [v6 name];
    }
    else
    {
      CFTimeZoneGetName(v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v5);
  }
  else
  {
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v8 localizedStringForKey:@"Time Zone Region Off" value:@"Off" table:@"MobileCalSettings"];
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = &stru_1CE38;
  }
  id v10 = v9;

  return v10;
}

- (void)setCalendarTimeZone:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_14;
  }
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v12;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_8;
    }
    id v6 = [objc_alloc((Class)ALCity) initWithProperties:v12];
  }
  v7 = v6;
LABEL_8:
  v8 = [v7 timeZone];

  if (v8)
  {
    id v9 = [v7 timeZone];
    CFTimeZoneRef v10 = CFTimeZoneCreateWithName(0, v9, 0);

    if (v10)
    {
      CalSetDefaultTimeZone();
      CFRelease(v10);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CalSetDefaultTimeZone();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [WeakRetained reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];

  id v5 = v12;
LABEL_14:
}

- (void)loadTimeZoneController:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setSpecifier:v4];

  [v6 setParentController:self];
  id v5 = [(CSTimeZoneController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v30 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = +[UIDevice currentDevice];
    unint64_t v7 = (unint64_t)[v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CFStringRef v8 = @"Time Zone Override Cell Title (iPad)";
    }
    else {
      CFStringRef v8 = @"Time Zone Override Cell Title";
    }
    v27 = v5;
    v29 = [v5 localizedStringForKey:v8 value:@"Time Zone Override" table:@"MobileCalSettings"];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:"setTimeZoneSupportEnabled:specifier:" get:"timeZoneSupportEnabled:" detail:0 cell:6 edit:0];
    timeZoneSupportSpecifier = self->_timeZoneSupportSpecifier;
    self->_timeZoneSupportSpecifier = v9;

    uint64_t v28 = PSKeyNameKey;
    -[PSSpecifier setProperty:forKey:](self->_timeZoneSupportSpecifier, "setProperty:forKey:", @"ViewedTimeZoneAutomatic");
    uint64_t v11 = PSDefaultsKey;
    [(PSSpecifier *)self->_timeZoneSupportSpecifier setProperty:@"com.apple.mobilecal" forKey:PSDefaultsKey];
    id v12 = self->_timeZoneSupportSpecifier;
    v13 = +[NSNumber numberWithBool:0];
    [(PSSpecifier *)v12 setProperty:v13 forKey:PSDefaultValueKey];

    [v30 addObject:self->_timeZoneSupportSpecifier];
    id v14 = +[PSSpecifier emptyGroupSpecifier];
    [v30 addObject:v14];
    v15 = +[UIDevice currentDevice];
    unint64_t v16 = (unint64_t)[v15 userInterfaceIdiom];

    if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CFStringRef v17 = @"Calendar Time Zone (iPad)";
    }
    else {
      CFStringRef v17 = @"Calendar Time Zone";
    }
    v18 = [v5 localizedStringForKey:v17 value:@"Time Zone" table:@"MobileCalSettings"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setCalendarTimeZone:specifier:" get:"calendarTimeZone:" detail:objc_opt_class() cell:2 edit:0];
    calendarTimeZoneSpecifier = self->_calendarTimeZoneSpecifier;
    self->_calendarTimeZoneSpecifier = v19;

    [(PSSpecifier *)self->_calendarTimeZoneSpecifier setProperty:kCalTimeZoneCityArrayPrefKey forKey:v28];
    [(PSSpecifier *)self->_calendarTimeZoneSpecifier setProperty:@"com.apple.mobilecal" forKey:v11];
    v21 = self->_calendarTimeZoneSpecifier;
    v22 = +[NSNumber numberWithBool:[(CSTimeZoneController *)self _timeZoneSupportEnabled]];
    [(PSSpecifier *)v21 setProperty:v22 forKey:PSEnabledKey];

    [(PSSpecifier *)self->_calendarTimeZoneSpecifier setControllerLoadAction:"loadTimeZoneController:"];
    [v30 addObject:self->_calendarTimeZoneSpecifier];
    v23 = [v27 localizedStringForKey:@"Time Zone Override Text", @"The Time Zone Override always shows event dates and times in the selected time zone.\n\nWhen off, events will display according to the time zone of your current location.", @"MobileCalSettings" value table];
    [v14 setProperty:v23 forKey:PSFooterTextGroupKey];

    id v24 = [(CSTimeZoneController *)self timeZoneSupportEnabled:self->_timeZoneSupportSpecifier];
    v25 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v30;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneSupportSpecifier, 0);

  objc_storeStrong((id *)&self->_calendarTimeZoneSpecifier, 0);
}

@end