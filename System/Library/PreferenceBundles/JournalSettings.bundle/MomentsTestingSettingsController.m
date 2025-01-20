@interface MomentsTestingSettingsController
- (BOOL)alwaysUseMomentDate;
- (BOOL)saveToPhotos;
- (BOOL)skipSuggestionSheet;
- (PSSystemPolicyForApp)appPolicy;
- (_TtC15JournalSettings30NotificationSettingsController)notificationSettingsController;
- (id)getValueForSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)showEntryTitle;
- (void)didTapJournalHealthSettings:(id)a3;
- (void)handleAuthenticationWithReason:(id)a3 completion:(id)a4;
- (void)onControllerContentWillAppear;
- (void)onSpecifierButtonSelected:(id)a3;
- (void)setAlwaysUseMomentDate:(BOOL)a3;
- (void)setAppPolicy:(id)a3;
- (void)setNotificationSettingsController:(id)a3;
- (void)setSaveToPhotos:(BOOL)a3;
- (void)setShowEntryTitle:(int64_t)a3;
- (void)setSkipSuggestionSheet:(BOOL)a3;
- (void)setValue:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MomentsTestingSettingsController

- (BOOL)skipSuggestionSheet
{
  v2 = +[SettingsUtilities settingsDefaults];
  v3 = [v2 objectForKey:@"SKIP_JOURNALING_SUGGESTIONS"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setSkipSuggestionSheet:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SettingsUtilities settingsDefaults];
  [v4 setBool:v3 forKey:@"SKIP_JOURNALING_SUGGESTIONS"];
}

- (BOOL)alwaysUseMomentDate
{
  v2 = +[SettingsUtilities settingsDefaults];
  BOOL v3 = [v2 objectForKey:@"ALWAYS_USE_MOMENT_DATE"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setAlwaysUseMomentDate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SettingsUtilities settingsDefaults];
  [v4 setBool:v3 forKey:@"ALWAYS_USE_MOMENT_DATE"];
}

- (int64_t)showEntryTitle
{
  v2 = +[SettingsUtilities settingsDefaults];
  uint64_t v3 = (uint64_t)[v2 integerForKey:@"ADD_ENTRY_TITLE"];
  int64_t v4 = v3 & ~(v3 >> 63);

  return v4;
}

- (void)setShowEntryTitle:(int64_t)a3
{
  id v4 = +[SettingsUtilities settingsDefaults];
  [v4 setInteger:a3 forKey:@"ADD_ENTRY_TITLE"];
}

- (BOOL)saveToPhotos
{
  v2 = +[SettingsUtilities settingsDefaults];
  uint64_t v3 = [v2 objectForKey:@"SAVE_TO_PHOTOS"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setSaveToPhotos:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SettingsUtilities settingsDefaults];
  [v4 setBool:v3 forKey:@"SAVE_TO_PHOTOS"];
}

- (_TtC15JournalSettings30NotificationSettingsController)notificationSettingsController
{
  notificationSettingsController = self->_notificationSettingsController;
  if (!notificationSettingsController)
  {
    id v4 = (_TtC15JournalSettings30NotificationSettingsController *)objc_opt_new();
    v5 = self->_notificationSettingsController;
    self->_notificationSettingsController = v4;

    notificationSettingsController = self->_notificationSettingsController;
  }

  return notificationSettingsController;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MomentsTestingSettingsController;
  [(MomentsTestingSettingsController *)&v5 viewWillAppear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"onControllerContentWillAppear" name:UIApplicationWillEnterForegroundNotification object:0];

  [(MomentsTestingSettingsController *)self onControllerContentWillAppear];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MomentsTestingSettingsController;
  [(MomentsTestingSettingsController *)&v12 viewDidAppear:a3];
  id v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"Journal" value:&stru_18AEB8 table:@"Settings"];

  v6 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.journal"];
  id v7 = objc_alloc((Class)_NSLocalizedStringResource);
  v8 = +[NSLocale currentLocale];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 bundleURL];
  id v11 = [v7 initWithKey:@"Journal" table:@"Settings" locale:v8 bundleURL:v10];

  [(MomentsTestingSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.journal" title:v11 localizedNavigationComponents:&__NSArray0__struct deepLink:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MomentsTestingSettingsController;
  [(MomentsTestingSettingsController *)&v5 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    location = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    v6 = [(MomentsTestingSettingsController *)self appPolicy];

    if (!v6)
    {
      id v7 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.journal"];
      [(MomentsTestingSettingsController *)self setAppPolicy:v7];

      v8 = [(MomentsTestingSettingsController *)self appPolicy];
      [v8 setDelegate:self];
    }
    v9 = [(MomentsTestingSettingsController *)self appPolicy];
    v10 = [v9 specifiers];
    [v3 addObjectsFromArray:v10];

    id v11 = +[PSSpecifier emptyGroupSpecifier];
    objc_super v12 = +[SettingsUtilities settingsBundle];
    v13 = [v12 localizedStringForKey:@"New Entry" value:@"NEW ENTRY" table:@"Settings"];
    [v11 setName:v13];

    v14 = +[SettingsUtilities settingsBundle];
    v15 = [v14 localizedStringForKey:@"createNewEntries" value:@"Create new entries without viewing suggestions first." table:@"Settings"];
    uint64_t v16 = PSFooterTextGroupKey;
    [v11 setObject:v15 forKeyedSubscript:PSFooterTextGroupKey];

    v74 = v11;
    [v3 addObject:v11];
    v17 = +[SettingsUtilities settingsBundle];
    v18 = [v17 localizedStringForKey:@"newEntries" value:@"Skip Journaling Suggestions" table:@"Settings"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0);

    [v19 setIdentifier:@"skipSuggestions"];
    uint64_t v20 = PSAllowMultilineTitleKey;
    [v19 setObject:&off_18B780 forKeyedSubscript:PSAllowMultilineTitleKey];
    v72 = v19;
    [v3 addObject:v19];
    uint64_t v75 = v20;
    uint64_t v71 = v16;
    if (_os_feature_enabled_impl())
    {
      v21 = +[SettingsUtilities settingsBundle];
      v22 = [v21 localizedStringForKey:@"addEntryTitle" value:@"Add Entry Title" table:@"Settings"];
      v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"setValue:forSpecifier:" get:"getValueForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

      [v23 setIdentifier:@"addEntryTitle"];
      [v23 setObject:&off_18B780 forKeyedSubscript:v20];
      [v23 setValues:&off_18B828];
      v78[0] = &off_18B798;
      v24 = +[SettingsUtilities settingsBundle];
      v25 = [v24 localizedStringForKey:@"alwaysShowEntryTitle" value:@"Always" table:@"Settings"];
      v79[0] = v25;
      v78[1] = &off_18B7B0;
      v26 = +[SettingsUtilities settingsBundle];
      v27 = [v26 localizedStringForKey:@"onlyShowMomentEntry" value:@"Only for Moments" table:@"Settings"];
      v79[1] = v27;
      v78[2] = &off_18B7C8;
      v28 = +[SettingsUtilities settingsBundle];
      v29 = [v28 localizedStringForKey:@"neverShowEntryTitle" value:@"Never" table:@"Settings"];
      v79[2] = v29;
      v30 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
      [v23 setTitleDictionary:v30];

      uint64_t v20 = v75;
      uint64_t v16 = v71;
      [v23 setObject:&off_18B780 forKeyedSubscript:v75];
      [v3 addObject:v23];
    }
    if (_os_feature_enabled_impl())
    {
      v31 = +[SettingsUtilities settingsBundle];
      v32 = [v31 localizedStringForKey:@"sortByMomentDateFooter", @"When adding a suggestion to a new entry, always use the date from the moment as the entry date.", @"Settings" value table];
      [v74 setObject:v32 forKeyedSubscript:v16];

      v33 = +[SettingsUtilities settingsBundle];
      v34 = [v33 localizedStringForKey:@"alwaysUseMomentDate" value:@"Always Use Moment Date" table:@"Settings"];
      v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:"setValue:forSpecifier:" get:"getValueForSpecifier:" detail:0 cell:6 edit:0];

      [v35 setIdentifier:@"sortByMomentDate"];
      [v35 setObject:&off_18B780 forKeyedSubscript:v20];
      [v3 addObject:v35];
    }
    v36 = +[SettingsUtilities settingsBundle];
    v37 = [v36 localizedStringForKey:@"General" value:&stru_18AEB8 table:@"Settings"];
    +[PSSpecifier groupSpecifierWithID:@"general" name:v37];
    v39 = v38 = self;

    v40 = +[SettingsUtilities settingsBundle];
    v41 = [v40 localizedStringForKey:@"saveToPhotosFooter" value:@"Save photos and videos taken in Journal to the Photos app." table:@"Settings"];
    [v39 setObject:v41 forKeyedSubscript:v16];

    v70 = v39;
    v42 = v38;
    [v3 addObject:v39];
    v43 = +[SettingsUtilities settingsBundle];
    v44 = [v43 localizedStringForKey:@"Notifications" value:&stru_18AEB8 table:@"Settings"];
    v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:v42 set:0 get:"getValueForSpecifier:" detail:0 cell:2 edit:0];

    [v45 setIdentifier:@"journalingSchedule"];
    [v45 setObject:&off_18B780 forKeyedSubscript:v75];
    [v45 setControllerLoadAction:"onSpecifierButtonSelected:"];
    [v45 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    v69 = v45;
    [v3 addObject:v45];
    v46 = +[LockJournalSettings navigationTitle];
    v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:v42 set:0 get:0 detail:0 cell:2 edit:0];

    [v47 setIdentifier:@"lockJournal"];
    [v47 setControllerLoadAction:"onSpecifierButtonSelected:"];
    [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:v75];
    [v3 addObject:v47];
    if (_os_feature_enabled_impl())
    {
      v48 = +[SettingsUtilities settingsBundle];
      v49 = [v48 localizedStringForKey:@"Show Insights Summary" value:&stru_18AEB8 table:@"Settings"];
      v50 = +[PSSpecifier preferenceSpecifierNamed:v49 target:v42 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

      v76[0] = PSIDKey;
      v76[1] = PSKeyNameKey;
      v77[0] = @"showSummaryInTimeline";
      v77[1] = @"showSummaryInTimeline";
      v76[2] = PSDefaultValueKey;
      v76[3] = PSDefaultsKey;
      v77[2] = &__kCFBooleanTrue;
      v77[3] = @"com.apple.journal";
      v76[4] = PSAppGroupBundleIDKey;
      v76[5] = PSContainerBundleIDKey;
      v77[4] = @"group.com.apple.Journal";
      v77[5] = @"group.com.apple.Journal";
      v76[6] = v75;
      v77[6] = &__kCFBooleanTrue;
      v51 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:7];
      [v50 setProperties:v51];

      [v3 addObject:v50];
    }
    v52 = +[SettingsUtilities settingsBundle];
    v53 = [v52 localizedStringForKey:@"saveToPhotos" value:@"Save to Photos" table:@"Settings"];
    v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v42 set:"setValue:forSpecifier:" get:"getValueForSpecifier:" detail:0 cell:6 edit:0];

    [v54 setIdentifier:@"saveToPhotos"];
    [v54 setObject:&off_18B780 forKeyedSubscript:v75];
    [v3 addObject:v54];
    if (_os_feature_enabled_impl())
    {
      v55 = +[SettingsExportManager shared];
      unsigned int v56 = [v55 exportButtonShouldBeEnabled];

      if (v56)
      {
        v57 = +[PSSpecifier groupSpecifierWithID:0];
        [v3 addObject:v57];
        v58 = +[SettingsUtilities settingsBundle];
        v59 = [v58 localizedStringForKey:@"exportAllJournalEntriesButtonTitle" value:@"Export All Journal Entries" table:@"Settings"];
        v60 = +[PSSpecifier preferenceSpecifierNamed:v59 target:v42 set:0 get:0 detail:0 cell:13 edit:0];

        [v60 setIdentifier:@"exportJournal"];
        [v60 setObject:&off_18B780 forKeyedSubscript:v75];
        [v60 setButtonAction:"onSpecifierButtonSelected:"];
        [v3 addObject:v60];
      }
    }
    if (_os_feature_enabled_impl())
    {
      v61 = +[PSSpecifier emptyGroupSpecifier];
      v62 = +[SettingsUtilities settingsBundle];
      v63 = [v62 localizedStringForKey:@"journalHealthFooter" value:@"Allow Journal to add your state of mind and mindful minutes to Health." table:@"Settings"];
      [v61 setObject:v63 forKeyedSubscript:v71];

      [v3 addObject:v61];
      v64 = +[SettingsUtilities settingsBundle];
      v65 = [v64 localizedStringForKey:@"journalHealth" value:@"Health Access" table:@"Settings"];
      v66 = +[PSSpecifier preferenceSpecifierNamed:v65 target:v42 set:0 get:0 detail:0 cell:13 edit:0];

      [v66 setIdentifier:@"journalHealth"];
      [v66 setProperty:&__kCFBooleanTrue forKey:v75];
      [v66 setButtonAction:"didTapJournalHealthSettings:"];
      [v3 addObject:v66];
    }
    v67 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v67];
    objc_storeStrong(location, v3);
    id v5 = *location;
  }

  return v5;
}

- (void)onControllerContentWillAppear
{
  notificationSettingsController = self->_notificationSettingsController;
  self->_notificationSettingsController = 0;

  if (*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    [(MomentsTestingSettingsController *)self reloadSpecifiers];
  }
}

- (id)getValueForSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"skipSuggestions"])
  {
    BOOL v5 = [(MomentsTestingSettingsController *)self skipSuggestionSheet];
LABEL_9:
    uint64_t v6 = +[NSNumber numberWithBool:v5];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"sortByMomentDate"])
  {
    BOOL v5 = [(MomentsTestingSettingsController *)self alwaysUseMomentDate];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"addEntryTitle"])
  {
    uint64_t v6 = +[NSNumber numberWithInteger:[(MomentsTestingSettingsController *)self showEntryTitle]];
LABEL_10:
    id v7 = (_UNKNOWN **)v6;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"saveToPhotos"])
  {
    BOOL v5 = [(MomentsTestingSettingsController *)self saveToPhotos];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"journalingSchedule"])
  {
    v9 = [(MomentsTestingSettingsController *)self notificationSettingsController];
    id v7 = [v9 formattedValue];
  }
  else
  {
    id v7 = &off_18B7E0;
  }
LABEL_11:

  return v7;
}

- (void)setValue:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  uint64_t v6 = [a4 identifier];
  if ([v6 isEqualToString:@"skipSuggestions"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MomentsTestingSettingsController setSkipSuggestionSheet:](self, "setSkipSuggestionSheet:", [v7 BOOLValue]);
  }
  else if ([v6 isEqualToString:@"saveToPhotos"] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    -[MomentsTestingSettingsController setSaveToPhotos:](self, "setSaveToPhotos:", [v7 BOOLValue]);
  }
  else if ([v6 isEqualToString:@"sortByMomentDate"] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    -[MomentsTestingSettingsController setAlwaysUseMomentDate:](self, "setAlwaysUseMomentDate:", [v7 BOOLValue]);
  }
  else if ([v6 isEqualToString:@"addEntryTitle"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MomentsTestingSettingsController setShowEntryTitle:](self, "setShowEntryTitle:", [v7 integerValue]);
    }
  }
}

- (void)onSpecifierButtonSelected:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"journalingSchedule"])
  {
    uint64_t v5 = [(MomentsTestingSettingsController *)self notificationSettingsController];
    [(MomentsTestingSettingsController *)self showController:v5];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"lockJournal"])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_78E0;
    v15[3] = &unk_183CF8;
    v15[4] = self;
    uint64_t v5 = objc_retainBlock(v15);
    if (+[LockJournalSettings canAppFeatureLockJournalBeEnabled])
    {
      uint64_t v6 = +[SettingsUtilities settingsBundle];
      id v7 = v6;
      CFStringRef v8 = @"MomentsTestingSettingsController.AuthReason.LockJournal";
      CFStringRef v9 = @"Access Lock Journal settings.";
LABEL_10:
      v10 = [v6 localizedStringForKey:v8 value:v9 table:@"Settings"];
      [(MomentsTestingSettingsController *)self handleAuthenticationWithReason:v10 completion:v5];

      goto LABEL_12;
    }
  }
  else
  {
    if (![v4 isEqualToString:@"exportJournal"]) {
      goto LABEL_14;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_7944;
    v14[3] = &unk_183CF8;
    v14[4] = self;
    uint64_t v5 = objc_retainBlock(v14);
    if (+[LockJournalSettings isOSFeatureAppProtectionEnabled](_TtC15JournalSettings19LockJournalSettings, "isOSFeatureAppProtectionEnabled")|| +[LockJournalSettings isAppFeatureLockJournalEnabled])
    {
      uint64_t v6 = +[SettingsUtilities settingsBundle];
      id v7 = v6;
      CFStringRef v8 = @"MomentsTestingSettingsController.AuthReason.Export";
      CFStringRef v9 = @"Export Journal Data";
      goto LABEL_10;
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
LABEL_12:

  id v11 = +[UIApplication sharedApplication];
  unsigned int v12 = [v11 canOpenURL:0];

  if (v12)
  {
    v13 = +[UIApplication sharedApplication];
    [v13 openURL:0 options:&__NSDictionary0__struct completionHandler:0];
  }
LABEL_14:
}

- (void)handleAuthenticationWithReason:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)LAContext);
  unsigned __int8 v8 = [v7 canEvaluatePolicy:2 error:0];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)LAContext);
    v15[0] = &off_18B7F8;
    v10 = +[SettingsUtilities settingsBundle];
    id v11 = [v10 localizedStringForKey:@"appName" value:@"Journal" table:@"Settings"];
    v15[1] = &off_18B7C8;
    v16[0] = v11;
    v16[1] = v5;
    unsigned int v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_7B58;
    v13[3] = &unk_183D48;
    id v14 = v6;
    [v9 evaluatePolicy:1007 options:v12 reply:v13];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)didTapJournalHealthSettings:(id)a3
{
  id v6 = +[SettingsUtilities settingsDefaults];
  if ([v6 hasSeenBothHealthTCCs])
  {
    id v3 = objc_alloc_init((Class)HealthAppAuthorizationManagementLinkBuilder);
    id v4 = [v3 URLForAuthorizationManagementFromLocation:2 bundleIdentifier:@"com.apple.journal"];
    id v5 = objc_alloc_init(_TtC15JournalSettings30SettingsOpenSensitiveURLAction);
    [(SettingsOpenSensitiveURLAction *)v5 callAsFunction:v4];
  }
  else
  {
    id v3 = +[SettingsAppLaunchItem healthAccessURL];
    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    [v4 openSensitiveURL:v3 withOptions:0];
  }
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (void)setNotificationSettingsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsController, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end