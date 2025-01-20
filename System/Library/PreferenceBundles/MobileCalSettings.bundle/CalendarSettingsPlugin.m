@interface CalendarSettingsPlugin
- (BOOL)_shouldShowDefaultCalendarSpecifier;
- (CalendarSettingsPlugin)init;
- (PSSpecifier)weekStartSpecifier;
- (double)_defaultEventDurationForIdentifier:(id)a3;
- (id)_accountStore;
- (id)_defaultEventDurationIdentifiers;
- (id)_defaultEventDurationLocalizedStrings;
- (id)_eventStore;
- (id)_localeSpecificLocalizedOneMonthSyncTitleWithBundle:(id)a3;
- (id)_localeSpecificLocalizedSixMonthsSyncTitleWithBundle:(id)a3;
- (id)_localeSpecificLocalizedThreeMonthsSyncTitleWithBundle:(id)a3;
- (id)_localeSpecificLocalizedTwoWeeksSyncTitleWithBundle:(id)a3;
- (id)_localizedNoLimitSyncTitleInBundle:(id)a3;
- (id)_localizedOneMonthSyncTitleOverrideInBundle:(id)a3;
- (id)_numbersForWeekdays;
- (id)_titlesForCalendarIdentifiers:(id)a3;
- (id)_titlesForDaysToSync;
- (id)_titlesForWeekDays:(id)a3;
- (id)accountsSupportingDelegation;
- (id)daysToSync:(id)a3;
- (id)defaultCalendarName:(id)a3;
- (id)defaultEventDuration:(id)a3;
- (id)immediateAlarmCreation:(id)a3;
- (id)overlayCalendarID:(id)a3;
- (id)showInviteeDeclinesEnabled:(id)a3;
- (id)showWeekNumbers:(id)a3;
- (id)specifiers;
- (id)suggestEventLocations:(id)a3;
- (id)timeZoneSupportEnabled:(id)a3;
- (id)weekStart:(id)a3;
- (id)weekViewStartsOnToday:(id)a3;
- (id)writableEnabledIdentities;
- (int64_t)_countOfAccountsSyncingCalendars;
- (void)_alternativeCalendarChanged;
- (void)_createAllCommonSpecifiers;
- (void)_defaultEventDurationChanged;
- (void)_eventStoreChanged:(id)a3;
- (void)_freeSpecifiers;
- (void)_localeChanged:(id)a3;
- (void)_locationSuggestionsChanged;
- (void)_showInviteeDeclinesChanged;
- (void)_showWeekNumbersChanged;
- (void)_syncDurationChanged;
- (void)_weekStartChanged;
- (void)_weekViewStartsOnTodayChanged;
- (void)reloadSpecifiers:(id)a3;
- (void)setDaysToSync:(id)a3 specifier:(id)a4;
- (void)setDefaultCalendar:(id)a3 specifier:(id)a4;
- (void)setDefaultEventDuration:(id)a3 specifier:(id)a4;
- (void)setImmediateAlarmCreation:(id)a3 specifier:(id)a4;
- (void)setOverlayCalendarID:(id)a3 specifier:(id)a4;
- (void)setShowInviteeDeclinesEnabled:(id)a3 specifier:(id)a4;
- (void)setShowWeekNumbers:(id)a3 specifier:(id)a4;
- (void)setSuggestEventLocations:(id)a3 specifier:(id)a4;
- (void)setWeekStartSpecifier:(id)a3;
- (void)setWeekViewStartsOnToday:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CalendarSettingsPlugin

- (void)_freeSpecifiers
{
  showInviteeDeclinesSpecifier = self->_showInviteeDeclinesSpecifier;
  self->_showInviteeDeclinesSpecifier = 0;

  syncDaysSpecifier = self->_syncDaysSpecifier;
  self->_syncDaysSpecifier = 0;

  timeZoneSupportSpecifier = self->_timeZoneSupportSpecifier;
  self->_timeZoneSupportSpecifier = 0;

  defaultCalendarSpecifier = self->_defaultCalendarSpecifier;
  self->_defaultCalendarSpecifier = 0;

  identityListSpecifier = self->_identityListSpecifier;
  self->_identityListSpecifier = 0;

  defaultAlarmsSpecifier = self->_defaultAlarmsSpecifier;
  self->_defaultAlarmsSpecifier = 0;

  overlayCalendarSpecifier = self->_overlayCalendarSpecifier;
  self->_overlayCalendarSpecifier = 0;

  showWeekNumbersSpecifier = self->_showWeekNumbersSpecifier;
  self->_showWeekNumbersSpecifier = 0;

  weekViewStartsOnTodaySpecifier = self->_weekViewStartsOnTodaySpecifier;
  self->_weekViewStartsOnTodaySpecifier = 0;

  [(CalendarSettingsPlugin *)self setWeekStartSpecifier:0];
  suggestedLocationsSpecifier = self->_suggestedLocationsSpecifier;
  self->_suggestedLocationsSpecifier = 0;

  showAccountsSupportingDelegationSpecifier = self->_showAccountsSupportingDelegationSpecifier;
  self->_showAccountsSupportingDelegationSpecifier = 0;

  showSingleAccountSupportingDelegationSpecifier = self->_showSingleAccountSupportingDelegationSpecifier;
  self->_showSingleAccountSupportingDelegationSpecifier = 0;

  defaultEventDurationSpecifier = self->_defaultEventDurationSpecifier;
  self->_defaultEventDurationSpecifier = 0;
}

- (void)_createAllCommonSpecifiers
{
  if (!self->_timeZoneSupportSpecifier)
  {
    id v68 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v68 localizedStringForKey:@"Show Invitee Declines" value:&stru_1CE38 table:@"MobileCalSettings"];
    v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setShowInviteeDeclinesEnabled:specifier:" get:"showInviteeDeclinesEnabled:" detail:0 cell:6 edit:0];
    showInviteeDeclinesSpecifier = self->_showInviteeDeclinesSpecifier;
    self->_showInviteeDeclinesSpecifier = v4;

    [(PSSpecifier *)self->_showInviteeDeclinesSpecifier setIdentifier:@"showInviteeDeclines"];
    v6 = +[UIDevice currentDevice];
    unint64_t v7 = (unint64_t)[v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CFStringRef v8 = @"Time Zone Override (iPad)";
    }
    else {
      CFStringRef v8 = @"Time Zone Override";
    }
    v67 = [v68 localizedStringForKey:v8 value:@"Time Zone Override" table:@"MobileCalSettings"];
    v9 = +[PSSpecifier preferenceSpecifierNamed:v67 target:self set:0 get:"timeZoneSupportEnabled:" detail:objc_opt_class() cell:2 edit:0];
    timeZoneSupportSpecifier = self->_timeZoneSupportSpecifier;
    self->_timeZoneSupportSpecifier = v9;

    [(PSSpecifier *)self->_timeZoneSupportSpecifier setProperty:kCalTimeZoneCityArrayPrefKey forKey:PSKeyNameKey];
    [(PSSpecifier *)self->_timeZoneSupportSpecifier setProperty:@"com.apple.mobilecal" forKey:PSDefaultsKey];
    [(PSSpecifier *)self->_timeZoneSupportSpecifier setIdentifier:@"timeZoneOverride"];
    v11 = +[NSLocale currentLocale];
    v12 = [v11 localeIdentifier];
    v13 = +[IntlUtility lunarCalendarsForLocaleID:v12];
    uint64_t v14 = +[P  arrayByAddingObjectsFromArray:v13];

    v15 = [v68 localizedStringForKey:@"Alternate Calendars" value:&stru_1CE38 table:@"MobileCalSettings"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setOverlayCalendarID:specifier:" get:"overlayCalendarID:" detail:objc_opt_class() cell:2 edit:0];
    overlayCalendarSpecifier = self->_overlayCalendarSpecifier;
    self->_overlayCalendarSpecifier = v16;

    [(PSSpecifier *)self->_overlayCalendarSpecifier setIdentifier:@"alternateCalendars"];
    v18 = self->_overlayCalendarSpecifier;
    v66 = (void *)v14;
    v19 = [(CalendarSettingsPlugin *)self _titlesForCalendarIdentifiers:v14];
    [(PSSpecifier *)v18 setValues:v14 titles:v19];

    v20 = [v68 localizedStringForKey:@"Week Numbers" value:&stru_1CE38 table:@"MobileCalSettings"];
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:"setShowWeekNumbers:specifier:" get:"showWeekNumbers:" detail:0 cell:6 edit:0];
    showWeekNumbersSpecifier = self->_showWeekNumbersSpecifier;
    self->_showWeekNumbersSpecifier = v21;

    [(PSSpecifier *)self->_showWeekNumbersSpecifier setIdentifier:@"weekNumbers"];
    v23 = [v68 localizedStringForKey:@"Week View Starts On Today" value:&stru_1CE38 table:@"MobileCalSettings"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"setWeekViewStartsOnToday:specifier:" get:"weekViewStartsOnToday:" detail:0 cell:6 edit:0];
    weekViewStartsOnTodaySpecifier = self->_weekViewStartsOnTodaySpecifier;
    self->_weekViewStartsOnTodaySpecifier = v24;

    [(PSSpecifier *)self->_weekViewStartsOnTodaySpecifier setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [(PSSpecifier *)self->_weekViewStartsOnTodaySpecifier setIdentifier:@"weekViewStartsOnToday"];
    v26 = +[UIDevice currentDevice];
    unint64_t v27 = (unint64_t)[v26 userInterfaceIdiom];

    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CFStringRef v28 = @"Sync Specifier Name (iPad)";
    }
    else {
      CFStringRef v28 = @"Sync Specifier Name";
    }
    v65 = [v68 localizedStringForKey:v28 value:@"Sync" table:@"MobileCalSettings"];
    v29 = +[PSSpecifier preferenceSpecifierNamed:v65 target:self set:"setDaysToSync:specifier:" get:"daysToSync:" detail:objc_opt_class() cell:2 edit:0];
    syncDaysSpecifier = self->_syncDaysSpecifier;
    self->_syncDaysSpecifier = v29;

    v31 = self->_syncDaysSpecifier;
    v32 = +[NSNumber numberWithInt:14];
    v33 = +[NSNumber numberWithInt:31];
    v34 = +[NSNumber numberWithInt:92];
    v35 = +[NSNumber numberWithInt:183];
    v36 = +[NSNumber numberWithInt:0];
    v37 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v32, v33, v34, v35, v36, 0);
    v38 = [(CalendarSettingsPlugin *)self _titlesForDaysToSync];
    [(PSSpecifier *)v31 setValues:v37 titles:v38];

    [(PSSpecifier *)self->_syncDaysSpecifier setProperty:kCFBooleanTrue forKey:PSDeferItemSelectionKey];
    [(PSSpecifier *)self->_syncDaysSpecifier setIdentifier:@"syncDuration"];
    v39 = [v68 localizedStringForKey:@"Default Calendar" value:&stru_1CE38 table:@"MobileCalSettings"];
    uint64_t v40 = objc_opt_class();
    v41 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:"setDefaultCalendar:specifier:" get:"defaultCalendarName:" detail:v40 cell:2 edit:NSClassFromString(@"CSDefaultCalendarPane")];
    defaultCalendarSpecifier = self->_defaultCalendarSpecifier;
    self->_defaultCalendarSpecifier = v41;

    [(PSSpecifier *)self->_defaultCalendarSpecifier setProperty:0 forKey:@"CSSourceKey"];
    [(PSSpecifier *)self->_defaultCalendarSpecifier setIdentifier:@"defaultCalendar"];
    v43 = [v68 localizedStringForKey:@"Start Week On" value:&stru_1CE38 table:@"MobileCalSettings"];
    v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:self set:0 get:"weekStart:" detail:objc_opt_class() cell:2 edit:0];

    v64 = [(CalendarSettingsPlugin *)self _numbersForWeekdays];
    v45 = [(CalendarSettingsPlugin *)self _titlesForWeekDays:v64];
    [v44 setValues:v64 titles:v45];

    [v44 setIdentifier:@"startWeekOn"];
    [(CalendarSettingsPlugin *)self setWeekStartSpecifier:v44];
    v46 = [(CalendarSettingsPlugin *)self _eventStore];
    self->_numTotalCalendars = [v46 readWriteCalendarCountForEntityType:0] != 0;

    v47 = [v68 localizedStringForKey:@"Default Alert Times" value:&stru_1CE38 table:@"MobileCalSettings"];
    v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    defaultAlarmsSpecifier = self->_defaultAlarmsSpecifier;
    self->_defaultAlarmsSpecifier = v48;

    [(PSSpecifier *)self->_defaultAlarmsSpecifier setProperty:self->_eventStore forKey:@"EKEventStore"];
    [(PSSpecifier *)self->_defaultAlarmsSpecifier setIdentifier:@"defaultAlertTimes"];
    v50 = [v68 localizedStringForKey:@"Location Suggestions" value:&stru_1CE38 table:@"MobileCalSettings"];
    v51 = +[PSSpecifier preferenceSpecifierNamed:v50 target:self set:"setSuggestEventLocations:specifier:" get:"suggestEventLocations:" detail:0 cell:6 edit:0];
    suggestedLocationsSpecifier = self->_suggestedLocationsSpecifier;
    self->_suggestedLocationsSpecifier = v51;

    [(PSSpecifier *)self->_suggestedLocationsSpecifier setIdentifier:@"locationSuggestions"];
    v53 = [v68 localizedStringForKey:@"Delegate Calendars" value:&stru_1CE38 table:@"MobileCalSettings"];
    v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    showAccountsSupportingDelegationSpecifier = self->_showAccountsSupportingDelegationSpecifier;
    self->_showAccountsSupportingDelegationSpecifier = v54;

    [(PSSpecifier *)self->_showAccountsSupportingDelegationSpecifier setIdentifier:@"DELEGATE_CALENDARS"];
    v56 = [v68 localizedStringForKey:@"Delegate Calendars" value:&stru_1CE38 table:@"MobileCalSettings"];
    v57 = +[PSSpecifier preferenceSpecifierNamed:v56 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    showSingleAccountSupportingDelegationSpecifier = self->_showSingleAccountSupportingDelegationSpecifier;
    self->_showSingleAccountSupportingDelegationSpecifier = v57;

    [(PSSpecifier *)self->_showSingleAccountSupportingDelegationSpecifier setIdentifier:@"DELEGATE_CALENDARS"];
    v59 = [(CalendarSettingsPlugin *)self _defaultEventDurationIdentifiers];
    v60 = [(CalendarSettingsPlugin *)self _defaultEventDurationLocalizedStrings];
    v61 = [v68 localizedStringForKey:@"Duration for New Events" value:&stru_1CE38 table:@"MobileCalSettings"];
    v62 = +[PSSpecifier preferenceSpecifierNamed:v61 target:self set:"setDefaultEventDuration:specifier:" get:"defaultEventDuration:" detail:objc_opt_class() cell:2 edit:0];
    defaultEventDurationSpecifier = self->_defaultEventDurationSpecifier;
    self->_defaultEventDurationSpecifier = v62;

    [(PSSpecifier *)self->_defaultEventDurationSpecifier setValues:v59 titles:v60];
    [(PSSpecifier *)self->_defaultEventDurationSpecifier setIdentifier:@"durationForNewEvents"];
  }
}

- (void)setWeekStartSpecifier:(id)a3
{
}

- (id)_eventStore
{
  eventStore = self->_eventStore;
  if (!eventStore)
  {
    v4 = (EKEventStore *)[objc_alloc((Class)EKEventStore) initWithEKOptions:128];
    v5 = self->_eventStore;
    self->_eventStore = v4;

    eventStore = self->_eventStore;
  }

  return eventStore;
}

- (CalendarSettingsPlugin)init
{
  v4.receiver = self;
  v4.super_class = (Class)CalendarSettingsPlugin;
  v2 = [(CalendarSettingsPlugin *)&v4 init];
  if (v2) {
    CSLogInitialize();
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CalendarSettingsPlugin;
  [(CalendarSettingsPlugin *)&v4 viewWillAppear:a3];
  if (([(CalendarSettingsPlugin *)self isMovingToParentViewController] & 1) == 0) {
    [(CalendarSettingsPlugin *)self reloadSpecifiers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CalendarSettingsPlugin;
  [(CalendarSettingsPlugin *)&v12 viewDidAppear:a3];
  objc_super v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  unint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  [(CalendarSettingsPlugin *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
  v10 = +[NSNotificationCenter defaultCenter];
  v11 = [(CalendarSettingsPlugin *)self _eventStore];
  [v10 addObserver:self selector:"_eventStoreChanged:" name:EKEventStoreChangedNotification object:v11];

  [v10 addObserver:self selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
  [v10 addObserver:self selector:"_alternativeCalendarChanged" name:CUIKPreferencesNotification_OverlayCalendarID object:0];
  [v10 addObserver:self selector:"_syncDurationChanged" name:CDBPreferences_Notification_kCalPreferredDaysToSyncKey object:0];
  [v10 addObserver:self selector:"_weekStartChanged" name:CUIKPreferencesNotification_WeekStart object:0];
  [v10 addObserver:self selector:"_showWeekNumbersChanged" name:CUIKPreferencesNotification_ShowWeekNumbers object:0];
  [v10 addObserver:self selector:"_weekViewStartsOnTodayChanged" name:CUIKPreferencesNotification_WeekViewStartsOnToday object:0];
  [v10 addObserver:self selector:"_locationSuggestionsChanged" name:CDBPreferences_Notification_suggestEventLocations object:0];
  +[CalDistributedNotificationCenter addObserver:self selector:"_defaultEventDurationChanged" name:CalFoundationPreferencesNotification_DefaultEventDuration];
  +[CalDistributedNotificationCenter addObserver:self selector:"_showInviteeDeclinesChanged" name:kCalAlertPrefChangedNotification];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CalendarSettingsPlugin;
  [(CalendarSettingsPlugin *)&v6 viewDidDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  id v5 = [(CalendarSettingsPlugin *)self _eventStore];
  [v4 removeObserver:self name:EKEventStoreChangedNotification object:v5];

  [v4 removeObserver:self name:CUIKLocaleChangedNotification object:0];
  [v4 removeObserver:self name:CUIKPreferencesNotification_OverlayCalendarID object:0];
  [v4 removeObserver:self name:CDBPreferences_Notification_kCalPreferredDaysToSyncKey object:0];
  [v4 removeObserver:self name:CUIKPreferencesNotification_WeekStart object:0];
  [v4 removeObserver:self name:CUIKPreferencesNotification_ShowWeekNumbers object:0];
  [v4 removeObserver:self name:CUIKPreferencesNotification_WeekViewStartsOnToday object:0];
  [v4 removeObserver:self name:CDBPreferences_Notification_suggestEventLocations object:0];
  +[CalDistributedNotificationCenter removeObserver:self name:CalFoundationPreferencesNotification_DefaultEventDuration];
  +[CalDistributedNotificationCenter removeObserver:self name:kCalAlertPrefChangedNotification];
}

- (id)_numbersForWeekdays
{
  return &off_1E4E0;
}

- (id)_titlesForWeekDays:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue])
        {
          v10 = CUIKStringForDayOfWeek();
          [v4 addObject:v10];
        }
        else
        {
          v10 = +[NSBundle bundleForClass:objc_opt_class()];
          v11 = +[NSCalendar currentCalendar];
          objc_super v12 = [v10 localizedStringForKey:@"System setting week start" value:@"%@ (System Setting)" table:@"MobileCalSettings"];
          [v11 firstWeekday];
          v13 = CUIKStringForDayOfWeek();
          uint64_t v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v13);

          [v4 addObject:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_titlesForCalendarIdentifiers:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8320;
  v9[3] = &unk_1C9A8;
  v9[4] = self;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)_titlesForDaysToSync
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(CalendarSettingsPlugin *)self _localeSpecificLocalizedTwoWeeksSyncTitleWithBundle:v3];
  id v5 = [(CalendarSettingsPlugin *)self _localeSpecificLocalizedOneMonthSyncTitleWithBundle:v3];
  id v6 = [(CalendarSettingsPlugin *)self _localeSpecificLocalizedThreeMonthsSyncTitleWithBundle:v3];
  id v7 = [(CalendarSettingsPlugin *)self _localeSpecificLocalizedSixMonthsSyncTitleWithBundle:v3];
  uint64_t v8 = [(CalendarSettingsPlugin *)self _localizedNoLimitSyncTitleInBundle:v3];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  v11[4] = v8;
  id v9 = +[NSArray arrayWithObjects:v11 count:5];

  return v9;
}

- (id)_localeSpecificLocalizedTwoWeeksSyncTitleWithBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    CFStringRef v6 = @"2 Weeks Sync Title (iPad)";
  }
  else {
    CFStringRef v6 = @"2 Week Sync Title";
  }
  id v7 = [v3 localizedStringForKey:v6 value:@"Events %ld Weeks Back" table:@"MobileCalSettings"];

  uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, 2);

  return v8;
}

- (id)_localeSpecificLocalizedOneMonthSyncTitleWithBundle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CalendarSettingsPlugin *)self _localizedOneMonthSyncTitleOverrideInBundle:v4];
  id v6 = [v5 length];
  id v7 = v5;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v9 = +[UIDevice currentDevice];
    unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CFStringRef v11 = @"1 Month Sync Title (iPad)";
    }
    else {
      CFStringRef v11 = @"1 Month Sync Title";
    }
    objc_super v12 = [v4 localizedStringForKey:v11 value:@"Events %ld Month Back" table:@"MobileCalSettings"];
    uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, 1);
  }

  return v8;
}

- (id)_localizedOneMonthSyncTitleOverrideInBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    CFStringRef v6 = @"Should Override One Month Sync Title (iPad)";
  }
  else {
    CFStringRef v6 = @"Should Override One Month Sync Title";
  }
  id v7 = [v3 localizedStringForKey:v6 value:@"false" table:@"MobileCalSettings"];
  if ([v7 isEqualToString:@"true"])
  {
    uint64_t v8 = +[UIDevice currentDevice];
    unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      CFStringRef v10 = @"1 Month Sync Title Override (iPad)";
      CFStringRef v11 = @"One month sync override title (iPad)";
    }
    else
    {
      CFStringRef v10 = @"1 Month Sync Title Override";
      CFStringRef v11 = @"One month sync override title";
    }
    objc_super v12 = [v3 localizedStringForKey:v10 value:v11 table:@"MobileCalSettings"];
  }
  else
  {
    objc_super v12 = &stru_1CE38;
  }

  return v12;
}

- (id)_localeSpecificLocalizedThreeMonthsSyncTitleWithBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    CFStringRef v6 = @"3 Months Sync Title (iPad)";
  }
  else {
    CFStringRef v6 = @"3 Month Sync Title";
  }
  id v7 = [v3 localizedStringForKey:v6 value:@"Events %ld Months Back" table:@"MobileCalSettings"];

  uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, 3);

  return v8;
}

- (id)_localeSpecificLocalizedSixMonthsSyncTitleWithBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    CFStringRef v6 = @"6 Months Sync Title (iPad)";
  }
  else {
    CFStringRef v6 = @"6 Month Sync Title";
  }
  id v7 = [v3 localizedStringForKey:v6 value:@"Events %ld Months Back" table:@"MobileCalSettings"];

  uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, 6);

  return v8;
}

- (id)_localizedNoLimitSyncTitleInBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    CFStringRef v6 = @"No Limit (iPad)";
  }
  else {
    CFStringRef v6 = @"No Limit";
  }
  id v7 = [v3 localizedStringForKey:v6 value:@"All Events" table:@"MobileCalSettings"];

  return v7;
}

- (id)specifiers
{
  id v3 = +[NSMutableArray array];
  [(CalendarSettingsPlugin *)self _freeSpecifiers];
  [(CalendarSettingsPlugin *)self _createAllCommonSpecifiers];
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    id v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_1CE38 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [v4 setObject:NSClassFromString(@"MobileCalSettings.CSCalendarSettingsPlacardCell") forKeyedSubscript:PSCellClassKey];
    [v4 setIdentifier:@"calendarPlacard"];
    [v3 addObject:v4];
  }
  else
  {
    id v4 = 0;
  }
  if (!self->_appPolicy)
  {
    unint64_t v5 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.mobilecal"];
    appPolicy = self->_appPolicy;
    self->_appPolicy = v5;

    [(PSSystemPolicyForApp *)self->_appPolicy setDelegate:self];
  }
  id v7 = self->_appPolicy;
  if (v4)
  {
    uint64_t v8 = [(PSSystemPolicyForApp *)v7 specifiersForPolicyOptions:41943040 force:0];
    unint64_t v9 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:0x8000000 force:0];
    uint64_t v10 = [v9 specifierForID:@"ACCOUNTS"];
    if (v10)
    {
      CFStringRef v11 = (void *)v10;
      objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"Calendar Accounts" value:&stru_1CE38 table:@"MobileCalSettings"];
      [v11 setName:v13];
    }
    else
    {
      CFStringRef v11 = [v9 specifierForID:@"ADD_ACCOUNT"];
    }
    objc_msgSend(v3, "ps_insertObject:afterObject:", v11, v4);
  }
  else
  {
    uint64_t v8 = [(PSSystemPolicyForApp *)v7 specifiersForPolicyOptions:176160768 force:0];
  }
  [v3 addObjectsFromArray:v8];
  uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:&stru_1CE38 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  [v3 addObject:v14];
  [v3 addObject:self->_timeZoneSupportSpecifier];
  [v3 addObject:self->_overlayCalendarSpecifier];
  [v3 addObject:self->_showWeekNumbersSpecifier];
  v15 = +[UIDevice currentDevice];
  id v16 = [v15 userInterfaceIdiom];

  if ((EKUIUseLargeFormatPhoneUI() & 1) != 0 || v16) {
    [v3 addObject:self->_weekViewStartsOnTodaySpecifier];
  }
  [v3 addObject:self->_showInviteeDeclinesSpecifier];
  if ([(CalendarSettingsPlugin *)self _countOfAccountsSyncingCalendars] >= 1) {
    [v3 addObject:self->_syncDaysSpecifier];
  }
  [v3 addObject:self->_defaultAlarmsSpecifier];
  [v3 addObject:self->_defaultEventDurationSpecifier];
  long long v17 = [(CalendarSettingsPlugin *)self weekStartSpecifier];
  [v3 addObject:v17];

  if ([(CalendarSettingsPlugin *)self _shouldShowDefaultCalendarSpecifier]) {
    [v3 addObject:self->_defaultCalendarSpecifier];
  }
  long long v18 = [(CalendarSettingsPlugin *)self accountsSupportingDelegation];
  long long v19 = (char *)[v18 count];
  if (v19)
  {
    if (v19 == (unsigned char *)&dword_0 + 1)
    {
      p_showSingleAccountSupportingDelegationSpecifier = &self->_showSingleAccountSupportingDelegationSpecifier;
      showSingleAccountSupportingDelegationSpecifier = self->_showSingleAccountSupportingDelegationSpecifier;
      v22 = [v18 firstObject];
      [(PSSpecifier *)showSingleAccountSupportingDelegationSpecifier setProperty:v22 forKey:@"CSSourceKey"];

      [(PSSpecifier *)self->_showSingleAccountSupportingDelegationSpecifier setProperty:&__kCFBooleanFalse forKey:@"CSPresentedFromDisambiguationControllerKey"];
    }
    else
    {
      p_showSingleAccountSupportingDelegationSpecifier = &self->_showAccountsSupportingDelegationSpecifier;
    }
    [v3 addObject:*p_showSingleAccountSupportingDelegationSpecifier];
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = 0;
  }
  self->_delegationSpecifierShowing = v23;
  [v3 addObject:self->_suggestedLocationsSpecifier];
  [(CalendarSettingsPlugin *)self setSpecifiers:v3];

  return v3;
}

- (BOOL)_shouldShowDefaultCalendarSpecifier
{
  v2 = [(CalendarSettingsPlugin *)self _eventStore];
  id v3 = [v2 sources];
  id v4 = +[NSPredicate predicateWithBlock:&stru_1C9E8];
  unint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      objc_super v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "readWriteCalendarsForEntityType:", 0, (void)v15);
      v9 += [v12 count];
      id v13 = [v12 count];

      if ((unint64_t)v13 > 1) {
        break;
      }
      if (v8 == (id)++v11)
      {
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9 > 1;
}

- (void)setShowInviteeDeclinesEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _CalSetAlertInviteeDeclines(v4);
}

- (id)showInviteeDeclinesEnabled:(id)a3
{
  BOOL v3 = CalAlertInviteeDeclines() != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setShowWeekNumbers:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CUIKPreferences sharedPreferences];
  [v5 setShowWeekNumbers:v4];
}

- (id)showWeekNumbers:(id)a3
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 showWeekNumbers];

  return +[NSNumber numberWithBool:v4];
}

- (void)setWeekViewStartsOnToday:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CUIKPreferences sharedPreferences];
  [v5 setWeekViewStartsOnToday:v4];
}

- (id)weekViewStartsOnToday:(id)a3
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 weekViewStartsOnToday];

  return +[NSNumber numberWithBool:v4];
}

- (void)setSuggestEventLocations:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CDBPreferences shared];
  objc_msgSend(v5, "set_suggestEventLocations:", v4);
}

- (id)suggestEventLocations:(id)a3
{
  BOOL v3 = +[CDBPreferences shared];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "get_suggestEventLocations"));

  return v4;
}

- (void)setImmediateAlarmCreation:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CUIKPreferences sharedPreferences];
  [v5 setImmediateAlarmCreation:v4];
}

- (id)immediateAlarmCreation:(id)a3
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 immediateAlarmCreation];

  return +[NSNumber numberWithBool:v4];
}

- (void)setDaysToSync:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = (void *)kCSLogHandle;
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      int v11 = 134217984;
      id v12 = [v5 integerValue];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Set days to sync: [%ld].", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [v5 integerValue];
    uint64_t v10 = +[CDBPreferences shared];
    objc_msgSend(v10, "set_kCalPreferredDaysToSyncKey:", v9);
  }
}

- (id)daysToSync:(id)a3
{
  BOOL v3 = +[CDBPreferences shared];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "get_kCalPreferredDaysToSyncKey"));

  return v4;
}

- (void)setDefaultCalendar:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = [(CalendarSettingsPlugin *)self _eventStore];
    id v8 = [v7 calendarWithID:v6];

    id v9 = [(CalendarSettingsPlugin *)self _eventStore];
    [v9 setDefaultCalendarForNewEvents:v8];
  }
  [(CalendarSettingsPlugin *)self reloadSpecifier:v10];
}

- (id)defaultCalendarName:(id)a3
{
  BOOL v3 = [(CalendarSettingsPlugin *)self _eventStore];
  id v4 = [v3 defaultCalendarForNewEvents];
  id v5 = CUIKDisplayedTitleForCalendar();

  return v5;
}

- (id)weekStart:(id)a3
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 weekStart];

  return v4;
}

- (id)timeZoneSupportEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CalCopyDefaultTimeZoneSetting();
  if (v4)
  {
    CFTimeZoneRef v5 = (const __CFTimeZone *)v4;
    id v6 = PSCityForSpecifier();
    if (v6 || (PSCityForTimeZone(), (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = [v6 name];
    }
    else
    {
      id v7 = CFTimeZoneGetName(v5);
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v8 localizedStringForKey:@"Time Zone Support Off" value:@"Off" table:@"MobileCalSettings"];
  }

  return v7;
}

- (void)setOverlayCalendarID:(id)a3 specifier:(id)a4
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[CUIKPreferences sharedPreferences];
    [v5 setOverlayCalendarID:v4];
  }
}

- (id)overlayCalendarID:(id)a3
{
  id v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 overlayCalendarID];

  return v4;
}

- (void)setDefaultEventDuration:(id)a3 specifier:(id)a4
{
  if (a3)
  {
    -[CalendarSettingsPlugin _defaultEventDurationForIdentifier:](self, "_defaultEventDurationForIdentifier:", a3, a4);
    double v5 = v4;
    id v6 = +[CalFoundationPreferences shared];
    [v6 setDefaultEventDuration:v5];
  }
}

- (id)defaultEventDuration:(id)a3
{
  id v3 = +[CalFoundationPreferences shared];
  [v3 defaultEventDuration];
  double v5 = v4;

  return +[NSNumber numberWithDouble:v5 / 60.0];
}

- (id)accountsSupportingDelegation
{
  v2 = [(CalendarSettingsPlugin *)self _eventStore];
  id v3 = [v2 sources];
  double v4 = +[NSPredicate predicateWithBlock:&stru_1CA08];
  double v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)writableEnabledIdentities
{
  v2 = [(CalendarSettingsPlugin *)self _eventStore];
  id v3 = [v2 delegateSources];
  double v4 = +[NSPredicate predicateWithBlock:&stru_1CA28];
  double v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (void)reloadSpecifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarSettingsPlugin *)self specifiers];
  [(CalendarSettingsPlugin *)self updateSpecifiers:v4 withSpecifiers:v5];
}

- (void)_eventStoreChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:EKEventStoreChangedObjectIDsUserInfoKey];

  if ([v5 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "entityType", (void)v20) == (char *)&dword_4 + 2
            || [v11 entityType] == (char *)&dword_0 + 1)
          {
            int v12 = 1;
            goto LABEL_15;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        int v12 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v12 = 0;
    }
LABEL_15:
  }
  else
  {
    int v12 = 1;
  }
  id v13 = [(CalendarSettingsPlugin *)self _eventStore];
  unsigned int v14 = [v13 readWriteCalendarCountForEntityType:0];
  int numTotalCalendars = self->_numTotalCalendars;

  BOOL delegationSpecifierShowing = self->_delegationSpecifierShowing;
  long long v17 = [(CalendarSettingsPlugin *)self accountsSupportingDelegation];
  id v18 = [v17 count];

  if (v12)
  {
    if (v14 != numTotalCalendars || delegationSpecifierShowing != (v18 != 0)) {
      [(CalendarSettingsPlugin *)self reloadSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers]];
    }
  }
}

- (int64_t)_countOfAccountsSyncingCalendars
{
  v2 = [(CalendarSettingsPlugin *)self _accountStore];
  id v3 = [v2 accountIdentifiersEnabledToSyncDataclass:kAccountDataclassCalendars];

  id v4 = [v3 count];
  return (int64_t)v4;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    id v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)_localeChanged:(id)a3
{
}

- (void)_alternativeCalendarChanged
{
}

- (void)_syncDurationChanged
{
}

- (void)_defaultEventDurationChanged
{
}

- (void)_weekStartChanged
{
}

- (void)_showWeekNumbersChanged
{
}

- (void)_weekViewStartsOnTodayChanged
{
}

- (void)_showInviteeDeclinesChanged
{
}

- (void)_locationSuggestionsChanged
{
}

- (id)_defaultEventDurationIdentifiers
{
  return &off_1E510;
}

- (id)_defaultEventDurationLocalizedStrings
{
  id v3 = [(CalendarSettingsPlugin *)self _defaultEventDurationIdentifiers];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CalendarSettingsPlugin _defaultEventDurationForIdentifier:](self, "_defaultEventDurationForIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        id v10 = CUIKDurationStringForTimeInterval();
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v11 = [v4 count];
  if (v11 == [v5 count]) {
    id v12 = v4;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (double)_defaultEventDurationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarSettingsPlugin *)self _defaultEventDurationIdentifiers];
  if ([v5 containsObject:v4])
  {
    [v4 doubleValue];
    double v7 = v6 * 60.0;
  }
  else
  {
    double v7 = 3600.0;
  }

  return v7;
}

- (PSSpecifier)weekStartSpecifier
{
  return self->_weekStartSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekStartSpecifier, 0);
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_defaultEventDurationSpecifier, 0);
  objc_storeStrong((id *)&self->_showSingleAccountSupportingDelegationSpecifier, 0);
  objc_storeStrong((id *)&self->_showAccountsSupportingDelegationSpecifier, 0);
  objc_storeStrong((id *)&self->_suggestedLocationsSpecifier, 0);
  objc_storeStrong((id *)&self->_weekViewStartsOnTodaySpecifier, 0);
  objc_storeStrong((id *)&self->_showWeekNumbersSpecifier, 0);
  objc_storeStrong((id *)&self->_overlayCalendarSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultAlarmsSpecifier, 0);
  objc_storeStrong((id *)&self->_birthdayCalendarSpecifier, 0);
  objc_storeStrong((id *)&self->_identityListSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultCalendarSpecifier, 0);
  objc_storeStrong((id *)&self->_timeZoneSupportSpecifier, 0);
  objc_storeStrong((id *)&self->_syncDaysSpecifier, 0);

  objc_storeStrong((id *)&self->_showInviteeDeclinesSpecifier, 0);
}

@end