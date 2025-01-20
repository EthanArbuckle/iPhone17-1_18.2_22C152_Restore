@interface CSDefaultAlarmsController
- (BOOL)ttlAlertsEffectivelyDisabledDueToLocationAuthorization;
- (CSDefaultAlarmsController)init;
- (id)_alarmTitlesForAllDay:(BOOL)a3 shortened:(BOOL)a4;
- (id)_alarmValuesForAllDay:(BOOL)a3;
- (id)_enableTravelAdvisoriesForAutomaticBehavior:(id)a3;
- (id)defaultAlarmOffsetForSpecifier:(id)a3;
- (id)specifiers;
- (void)_defaultAlarmChanged;
- (void)_defaultBirthdaysAlarmChanged;
- (void)_setEnableTravelAdvisoriesForAutomaticBehavior:(id)a3 specifier:(id)a4;
- (void)_travelAdvisoriesEnabledChanged;
- (void)configureTTL;
- (void)locationAuthorizationChanged:(id)a3;
- (void)setDefaultAlarmOffset:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSDefaultAlarmsController

- (CSDefaultAlarmsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSDefaultAlarmsController;
  v2 = [(CSDefaultAlarmsController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"locationAuthorizationChanged:" name:CalLocationAuthorizationChangedNotification object:0];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CSDefaultAlarmsController;
  [(CSDefaultAlarmsController *)&v18 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/defaultAlertTimes"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Default Alert Times" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v19 = v14;
  v15 = +[NSArray arrayWithObjects:&v19 count:1];
  [(CSDefaultAlarmsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];

  +[CalDistributedNotificationCenter addObserver:self selector:"_defaultAlarmChanged" name:kCalDefaultAlarmChangedNote];
  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_defaultBirthdaysAlarmChanged" name:EKEventStoreChangedNotification object:0];

  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"_travelAdvisoriesEnabledChanged" name:CDBPreferences_Notification_enableTravelAdvisoriesForAutomaticBehavior object:0];

  self->_hasEverAppeared = 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDefaultAlarmsController;
  [(CSDefaultAlarmsController *)&v4 viewWillAppear:a3];
  if (self->_hasEverAppeared)
  {
    [(CSDefaultAlarmsController *)self _defaultAlarmChanged];
    [(CSDefaultAlarmsController *)self _defaultBirthdaysAlarmChanged];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDefaultAlarmsController;
  [(CSDefaultAlarmsController *)&v6 viewWillDisappear:a3];
  +[CalDistributedNotificationCenter removeObserver:self name:kCalDefaultAlarmChangedNote];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:EKEventStoreChangedNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:CDBPreferences_Notification_enableTravelAdvisoriesForAutomaticBehavior object:0];
}

- (void)_defaultAlarmChanged
{
  [(CSDefaultAlarmsController *)self reloadSpecifier:self->_timedEventsAlertSpecifier];
  allDayEventsAlertSpecifier = self->_allDayEventsAlertSpecifier;

  [(CSDefaultAlarmsController *)self reloadSpecifier:allDayEventsAlertSpecifier];
}

- (void)_defaultBirthdaysAlarmChanged
{
}

- (void)_travelAdvisoriesEnabledChanged
{
  [(CSDefaultAlarmsController *)self configureTTL];
  [(CSDefaultAlarmsController *)self reloadSpecifier:self->_timeToLeaveGroupSpecifier];
  timeToLeaveAlertsSpecifier = self->_timeToLeaveAlertsSpecifier;

  [(CSDefaultAlarmsController *)self reloadSpecifier:timeToLeaveAlertsSpecifier];
}

- (id)_alarmTitlesForAllDay:(BOOL)a3 shortened:(BOOL)a4
{
  BOOL v4 = a3;
  id v5 = objc_alloc_init((Class)CalendarEventAlarmTable);
  [v5 setUseAllDayAlarms:v4];
  objc_super v6 = (char *)[v5 countOfPresets];
  v7 = +[NSMutableArray arrayWithCapacity:v6 + 1];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"None Alert" value:@"None" table:@"MobileCalSettings"];
  [v7 addObject:v9];

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      [v5 intervalForPresetIdentifier:i];
      v11 = CalStringForRelativeOffset();
      [v7 addObject:v11];
    }
  }

  return v7;
}

- (id)_alarmValuesForAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)CalendarEventAlarmTable);
  [v4 setUseAllDayAlarms:v3];
  id v5 = (char *)[v4 countOfPresets];
  objc_super v6 = +[NSMutableArray arrayWithCapacity:v5 + 1];
  v7 = +[NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
  [v6 addObject:v7];

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intervalForPresetIdentifier:i]);
      [v6 addObject:v9];
    }
  }

  return v6;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v36 = objc_alloc_init((Class)NSMutableArray);
    objc_super v6 = [v5 localizedStringForKey:@"Birthday Calendar" value:@"Birthdays" table:@"MobileCalSettings"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setDefaultAlarmOffset:specifier:" get:"defaultAlarmOffsetForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    birthdaysAlertSpecifier = self->_birthdaysAlertSpecifier;
    self->_birthdaysAlertSpecifier = v7;
    id v9 = v7;

    id v10 = [(CSDefaultAlarmsController *)self _alarmValuesForAllDay:1];
    v11 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:1 shortened:0];
    v12 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:1 shortened:1];
    [(PSSpecifier *)v9 setValues:v10 titles:v11 shortTitles:v12];

    v13 = +[NSNumber numberWithInt:2];
    [(PSSpecifier *)v9 setProperty:v13 forKey:@"DefaultAlarmType"];

    [(PSSpecifier *)v9 setIdentifier:@"birthdaysDefaultAlertTimes"];
    [v36 addObject:v9];
    id v14 = [v5 localizedStringForKey:@"Timed Event" value:@"Events" table:@"MobileCalSettings"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setDefaultAlarmOffset:specifier:" get:"defaultAlarmOffsetForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    timedEventsAlertSpecifier = self->_timedEventsAlertSpecifier;
    self->_timedEventsAlertSpecifier = v15;
    v17 = v15;

    objc_super v18 = [(CSDefaultAlarmsController *)self _alarmValuesForAllDay:0];
    id v19 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:0 shortened:0];
    v20 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:0 shortened:1];
    [(PSSpecifier *)v17 setValues:v18 titles:v19 shortTitles:v20];

    v21 = v5;
    v22 = +[NSNumber numberWithInt:0];
    [(PSSpecifier *)v17 setProperty:v22 forKey:@"DefaultAlarmType"];

    [(PSSpecifier *)v17 setIdentifier:@"timedEventsDefaultAlertTimes"];
    [v36 addObject:v17];
    v23 = [v5 localizedStringForKey:@"All-Day Events" value:&stru_1CE38 table:@"MobileCalSettings"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"setDefaultAlarmOffset:specifier:" get:"defaultAlarmOffsetForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    objc_storeStrong((id *)&self->_allDayEventsAlertSpecifier, v24);
    v25 = [(CSDefaultAlarmsController *)self _alarmValuesForAllDay:1];
    v26 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:1 shortened:0];
    v27 = [(CSDefaultAlarmsController *)self _alarmTitlesForAllDay:1 shortened:1];
    [v24 setValues:v25 titles:v26 shortTitles:v27];

    v28 = +[NSNumber numberWithInt:1];
    [v24 setProperty:v28 forKey:@"DefaultAlarmType"];

    [v24 setIdentifier:@"allDayEventsDefaultAlertTimes"];
    [v36 addObject:v24];
    if (+[EKFeatureSet isTravelAdvisorySupported])
    {
      v29 = +[PSSpecifier groupSpecifierWithName:0];
      timeToLeaveGroupSpecifier = self->_timeToLeaveGroupSpecifier;
      self->_timeToLeaveGroupSpecifier = v29;

      v31 = [v21 localizedStringForKey:@"Time to Leave" value:&stru_1CE38 table:@"MobileCalSettings"];
      v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:"_setEnableTravelAdvisoriesForAutomaticBehavior:specifier:" get:"_enableTravelAdvisoriesForAutomaticBehavior:" detail:0 cell:6 edit:0];
      timeToLeaveAlertsSpecifier = self->_timeToLeaveAlertsSpecifier;
      self->_timeToLeaveAlertsSpecifier = v32;

      self->currentTTLStatus = (unint64_t)+[CalLocationAuthorization ttlLocationStatus];
      [(CSDefaultAlarmsController *)self configureTTL];
      [v36 addObject:self->_timeToLeaveGroupSpecifier];
      [v36 addObject:self->_timeToLeaveAlertsSpecifier];
    }
    v34 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v36;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (BOOL)ttlAlertsEffectivelyDisabledDueToLocationAuthorization
{
  return (self->currentTTLStatus & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (void)configureTTL
{
  id v6 = +[CUIKTimeToLeaveDescriptionGenerator explanatoryTextForTTLStatus:self->currentTTLStatus];
  [(PSSpecifier *)self->_timeToLeaveGroupSpecifier setProperty:v6 forKey:PSFooterTextGroupKey];
  unsigned int v3 = [(CSDefaultAlarmsController *)self ttlAlertsEffectivelyDisabledDueToLocationAuthorization];
  timeToLeaveAlertsSpecifier = self->_timeToLeaveAlertsSpecifier;
  id v5 = +[NSNumber numberWithBool:v3 ^ 1];
  [(PSSpecifier *)timeToLeaveAlertsSpecifier setProperty:v5 forKey:PSEnabledKey];

  [(PSSpecifier *)self->_timeToLeaveAlertsSpecifier setIdentifier:@"timeToLeaveAlerts"];
}

- (void)locationAuthorizationChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6B54;
  block[3] = &unk_1C8D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setEnableTravelAdvisoriesForAutomaticBehavior:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  unsigned int v6 = [(CSDefaultAlarmsController *)self ttlAlertsEffectivelyDisabledDueToLocationAuthorization];
  v7 = kCSLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_INFO))
    {
      CFStringRef v8 = @"NO";
      if (v5) {
        CFStringRef v8 = @"YES";
      }
      int v15 = 138412290;
      CFStringRef v16 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Refusing to set 'enableTravelAdvisoriesForAutomaticBehavior' to [%@] because we don't have location access", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
    {
      if (v5) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      int v15 = 138412290;
      CFStringRef v16 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "Setting 'enableTravelAdvisoriesForAutomaticBehavior' to [%@]", (uint8_t *)&v15, 0xCu);
    }
    id v10 = +[CDBPreferences shared];
    objc_msgSend(v10, "set_enableTravelAdvisoriesForAutomaticBehavior:", v5);

    v11 = (void *)kCSLogHandle;
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      v13 = +[CDBPreferences shared];
      if (objc_msgSend(v13, "get_enableTravelAdvisoriesForAutomaticBehavior")) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      int v15 = 138412290;
      CFStringRef v16 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "'enableTravelAdvisoriesForAutomaticBehavior' is now set to [%@]", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)_enableTravelAdvisoriesForAutomaticBehavior:(id)a3
{
  if ([(CSDefaultAlarmsController *)self ttlAlertsEffectivelyDisabledDueToLocationAuthorization])
  {
    unsigned int v3 = &__kCFBooleanFalse;
  }
  else
  {
    id v4 = +[CDBPreferences shared];
    id v5 = objc_msgSend(v4, "get_enableTravelAdvisoriesForAutomaticBehavior");

    unsigned int v6 = kCSLogHandle;
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v7 = @"NO";
      if (v5) {
        CFStringRef v7 = @"YES";
      }
      int v9 = 138412290;
      CFStringRef v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "The value of 'enableTravelAdvisoriesForAutomaticBehavior' is: [%@]", (uint8_t *)&v9, 0xCu);
    }
    unsigned int v3 = +[NSNumber numberWithBool:v5];
  }

  return v3;
}

- (id)defaultAlarmOffsetForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"DefaultAlarmType"];
  id v5 = [v4 intValue];

  unsigned int v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"EKEventStore"];
  CFStringRef v7 = +[CUIKDefaultAlarmPreferences defaultAlarmOffsetForAlarmType:v5 eventStore:v6];

  return v7;
}

- (void)setDefaultAlarmOffset:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = [a4 propertyForKey:@"DefaultAlarmType"];
  id v8 = [v7 intValue];

  id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"EKEventStore"];
  +[CUIKDefaultAlarmPreferences setDefaultAlarmOffset:v6 forAlarmType:v8 eventStore:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDayEventsAlertSpecifier, 0);
  objc_storeStrong((id *)&self->_timedEventsAlertSpecifier, 0);
  objc_storeStrong((id *)&self->_birthdaysAlertSpecifier, 0);
  objc_storeStrong((id *)&self->_timeToLeaveAlertsSpecifier, 0);
  objc_storeStrong((id *)&self->_timeToLeaveGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarmOffset, 0);

  objc_storeStrong((id *)&self->_defaultAllDayAlarmOffset, 0);
}

@end