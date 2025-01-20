@interface REMSettingsController
- (BOOL)initialShouldIncludeRemindersDueTodayInBadgeCount;
- (BOOL)saveAppBadgeCountCriteriaIfNeeded;
- (BOOL)saveTodayNotificationFireTimeIfNeeded;
- (BOOL)shouldHideGrocerySectionIfNeeded;
- (BOOL)todayNotificationTimePickerVisible;
- (NSDateComponents)unsavedTodayNotificationFireTime;
- (PSSpecifier)defaultListSpecifier;
- (PSSpecifier)disableAssignmentNotifications;
- (PSSpecifier)enableAutoCompleteReminders;
- (PSSpecifier)includeRemindersDueTodayInBadgeCount;
- (PSSpecifier)showAsOverdue;
- (PSSpecifier)todayNotificationEnabledSwitch;
- (PSSpecifier)todayNotificationGroup;
- (PSSpecifier)todayNotificationTimeButton;
- (PSSpecifier)todayNotificationTimePicker;
- (PSSystemPolicyForApp)appPolicy;
- (REMDaemonUserDefaults)daemonUserDefaults;
- (REMSettingsController)init;
- (REMUserDefaultsObserveToken)daemonUserDefaultsDefaultListObserver;
- (REMUserDefaultsObserveToken)daemonUserDefaultsIncludeDueTodayObserver;
- (REMUserDefaultsObserveToken)daemonUserDefaultsMuteNotificationsObserver;
- (REMUserDefaultsObserveToken)daemonUserDefaultsShowReminderAsOverdueObserver;
- (REMUserDefaultsObserveToken)daemonUserDefaultsShowSuggestionsObserver;
- (REMUserDefaultsObserveToken)daemonUserDefaultsTodayNotificationObserver;
- (id)_accountSpecifiers;
- (id)_appPolicySpecifiersShouldIncludeAccountSpecifier:(BOOL)a3;
- (id)_heroPlacardSpecifiers;
- (id)clearCategorizationDetailText;
- (id)datePickerForSpecifier:(id)a3;
- (id)defaultListName:(id)a3;
- (id)disableAssignmentNotifications:(id)a3;
- (id)enableAutoCompleteReminders:(id)a3;
- (id)shouldIncludeRemindersDueTodayInBadgeCount:(id)a3;
- (id)showRemindersAsOverdue:(id)a3;
- (id)specifiers;
- (id)todayNotificationFooterText;
- (id)todayNotificationTimeSet:(id)a3;
- (id)todayNotificationTimeString;
- (void)applicationWillEnterForeground:(id)a3;
- (void)clearCategorizationButtonDidTapped:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)datePickerEditingDidEnd:(id)a3;
- (void)decreaseMinuteIntervalIfNeededForDatePicker:(id)a3;
- (void)didTapTodayNotificationTimeButton:(id)a3;
- (void)performClearAction;
- (void)refreshExternallyModifiableSpecifiers;
- (void)reloadTodayNotificationSpecifiers:(BOOL)a3;
- (void)saveAndWakeDaemon;
- (void)setAppPolicy:(id)a3;
- (void)setDaemonUserDefaults:(id)a3;
- (void)setDaemonUserDefaultsDefaultListObserver:(id)a3;
- (void)setDaemonUserDefaultsIncludeDueTodayObserver:(id)a3;
- (void)setDaemonUserDefaultsMuteNotificationsObserver:(id)a3;
- (void)setDaemonUserDefaultsShowReminderAsOverdueObserver:(id)a3;
- (void)setDaemonUserDefaultsShowSuggestionsObserver:(id)a3;
- (void)setDaemonUserDefaultsTodayNotificationObserver:(id)a3;
- (void)setDefaultListSpecifier:(id)a3;
- (void)setDisableAssignmentNotifications:(id)a3;
- (void)setDisableAssignmentNotifications:(id)a3 specifier:(id)a4;
- (void)setEnableAutoCompleteReminders:(id)a3;
- (void)setEnableAutoCompleteReminders:(id)a3 specifier:(id)a4;
- (void)setIncludeRemindersDueTodayInBadgeCount:(id)a3;
- (void)setInitialShouldIncludeRemindersDueTodayInBadgeCount:(BOOL)a3;
- (void)setShouldIncludeRemindersDueTodayInBadgeCount:(id)a3 specifier:(id)a4;
- (void)setShowAsOverdue:(id)a3;
- (void)setShowRemindersAsOverdue:(id)a3 specifier:(id)a4;
- (void)setTodayNotificationEnabledSwitch:(id)a3;
- (void)setTodayNotificationGroup:(id)a3;
- (void)setTodayNotificationTimeButton:(id)a3;
- (void)setTodayNotificationTimePicker:(id)a3;
- (void)setTodayNotificationTimePickerVisible:(BOOL)a3;
- (void)setTodayNotificationTimeSet:(id)a3 specifier:(id)a4;
- (void)setUnsavedTodayNotificationFireTime:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation REMSettingsController

- (REMSettingsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)REMSettingsController;
  v2 = [(REMSettingsController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)PSSystemPolicyForApp);
    v4 = (PSSystemPolicyForApp *)[v3 initWithBundleIdentifier:REMAppBundleIdentifier];
    appPolicy = v2->_appPolicy;
    v2->_appPolicy = v4;

    if (objc_opt_respondsToSelector()) {
      [(PSSystemPolicyForApp *)v2->_appPolicy setDelegate:v2];
    }
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v35.receiver = self;
  v35.super_class = (Class)REMSettingsController;
  [(REMSettingsController *)&v35 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:REMSettingsNavigationDeepLinkGeneralPath];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Reminders" table:0 locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Apps" table:0 locale:v11 bundleURL:v13];

  uint64_t v15 = REMAppBundleIdentifier;
  id v36 = v14;
  v16 = +[NSArray arrayWithObjects:&v36 count:1];
  [(REMSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v15 title:v9 localizedNavigationComponents:v16 deepLink:v4];

  v17 = [(REMSettingsController *)self daemonUserDefaults];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_68E0;
  v34[3] = &unk_1CD00;
  v34[4] = self;
  v18 = [v17 observePreferredDefaultListIDWithBlock:v34];
  [(REMSettingsController *)self setDaemonUserDefaultsDefaultListObserver:v18];

  v19 = [(REMSettingsController *)self daemonUserDefaults];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_6938;
  v33[3] = &unk_1CD28;
  v33[4] = self;
  v20 = [v19 observeTodayNotificationFireTimeWithBlock:v33];
  [(REMSettingsController *)self setDaemonUserDefaultsTodayNotificationObserver:v20];

  v21 = [(REMSettingsController *)self daemonUserDefaults];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_69A8;
  v32[3] = &unk_1CD50;
  v32[4] = self;
  v22 = [v21 observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock:v32];
  [(REMSettingsController *)self setDaemonUserDefaultsIncludeDueTodayObserver:v22];

  v23 = [(REMSettingsController *)self daemonUserDefaults];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_6A00;
  v31[3] = &unk_1CD50;
  v31[4] = self;
  v24 = [v23 observeShowRemindersAsOverdueWithBlock:v31];
  [(REMSettingsController *)self setDaemonUserDefaultsShowReminderAsOverdueObserver:v24];

  v25 = [(REMSettingsController *)self daemonUserDefaults];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_6A58;
  v30[3] = &unk_1CD50;
  v30[4] = self;
  v26 = [v25 observeEnableAssignmentNotificationsWithBlock:v30];
  [(REMSettingsController *)self setDaemonUserDefaultsMuteNotificationsObserver:v26];

  v27 = [(REMSettingsController *)self daemonUserDefaults];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_6AB0;
  v29[3] = &unk_1CD50;
  v29[4] = self;
  v28 = [v27 observeEnableAutoCompleteRemindersWithBlock:v29];
  [(REMSettingsController *)self setDaemonUserDefaultsShowSuggestionsObserver:v28];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REMSettingsController;
  [(REMSettingsController *)&v4 viewWillDisappear:a3];
  [(REMSettingsController *)self saveAndWakeDaemon];
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v112 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = +[REMUserDefaults daemonUserDefaults];
    [(REMSettingsController *)self setDaemonUserDefaults:v4];

    id v5 = [(REMSettingsController *)self daemonUserDefaults];
    v6 = [v5 todayNotificationFireTime];
    [(REMSettingsController *)self setUnsavedTodayNotificationFireTime:v6];

    v7 = [(REMSettingsController *)self daemonUserDefaults];
    -[REMSettingsController setInitialShouldIncludeRemindersDueTodayInBadgeCount:](self, "setInitialShouldIncludeRemindersDueTodayInBadgeCount:", [v7 shouldIncludeRemindersDueTodayInBadgeCount]);

    [(REMSettingsController *)self setTitle:0];
    v8 = objc_opt_new();
    if (rem_feature_enabled())
    {
      id v9 = [(REMSettingsController *)self _accountSpecifiers];
      uint64_t v10 = [v9 specifierForID:@"ACCOUNTS"];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = REMSettingsBundleGet();
        v13 = [v12 localizedStringForKey:@"Reminders Accounts" value:&stru_1D2B8 table:0];
        [v11 setName:v13];
      }
      else
      {
        v11 = [v9 specifierForID:@"ADD_ACCOUNT"];
      }
      id v14 = [(REMSettingsController *)self _heroPlacardSpecifiers];
      v121[0] = v14;
      v121[1] = v11;
      uint64_t v15 = +[NSArray arrayWithObjects:v121 count:2];
      [v8 addObjectsFromArray:v15];

      v16 = [(REMSettingsController *)self _appPolicySpecifiersShouldIncludeAccountSpecifier:0];
      if ([v16 count]) {
        [v8 addObjectsFromArray:v16];
      }
    }
    else
    {
      id v9 = [(REMSettingsController *)self _appPolicySpecifiersShouldIncludeAccountSpecifier:1];
      if ([v9 count]) {
        [v8 addObjectsFromArray:v9];
      }
    }

    v17 = REMSettingsBundleGet();
    v18 = [v17 localizedStringForKey:@"Reminders created outside of a specific list are placed in this list." value:&stru_1D2B8 table:0];
    v19 = +[REMSettingsUtilities groupSpecifierWithHeader:0 footer:v18];

    v20 = REMSettingsBundleGet();
    v21 = [v20 localizedStringForKey:@"Default List" value:&stru_1D2B8 table:0];

    v22 = +[REMSettingsUtilities linkListPreferenceSpecifierNamed:v21 target:self keyName:@"preferredDefaultListID" detail:objc_opt_class() scope:0 get:"defaultListName:"];
    [v22 setIdentifier:REMSettingsDefaultListIdentifier];
    [(REMSettingsController *)self setDefaultListSpecifier:v22];
    v120[0] = v19;
    v120[1] = v22;
    v23 = +[NSArray arrayWithObjects:v120 count:2];
    [v8 addObjectsFromArray:v23];

    v24 = REMSettingsBundleGet();
    v25 = [v24 localizedStringForKey:@"All-Day Reminders" value:&stru_1D2B8 table:0];
    v26 = [(REMSettingsController *)self todayNotificationFooterText];
    v27 = +[REMSettingsUtilities groupSpecifierWithHeader:v25 footer:v26];
    [(REMSettingsController *)self setTodayNotificationGroup:v27];

    v28 = REMSettingsBundleGet();
    v29 = [v28 localizedStringForKey:@"Today Notification" value:&stru_1D2B8 table:0];
    v30 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v29 target:self cell:6 detail:0 keyName:@"todayNotificationFireTime" defaultValue:&__kCFBooleanTrue scope:0 set:"setTodayNotificationTimeSet:specifier:" get:"todayNotificationTimeSet:"];
    [(REMSettingsController *)self setTodayNotificationEnabledSwitch:v30];

    uint64_t v31 = REMSettingsTodayNotificationIdentifier;
    v32 = [(REMSettingsController *)self todayNotificationEnabledSwitch];
    [v32 setIdentifier:v31];

    v33 = REMSettingsBundleGet();
    v34 = [v33 localizedStringForKey:@"Time" value:&stru_1D2B8 table:0];
    objc_super v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:"todayNotificationTimeString" detail:0 cell:4 edit:0];
    [(REMSettingsController *)self setTodayNotificationTimeButton:v35];

    id v36 = [(REMSettingsController *)self todayNotificationTimeButton];
    [v36 setButtonAction:"didTapTodayNotificationTimeButton:"];

    uint64_t v37 = objc_opt_class();
    v38 = [(REMSettingsController *)self todayNotificationTimeButton];
    uint64_t v39 = PSCellClassKey;
    [v38 setObject:v37 forKeyedSubscript:PSCellClassKey];

    v40 = +[PSSpecifier preferenceSpecifierNamed:&stru_1D2B8 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:4 edit:0];
    [(REMSettingsController *)self setTodayNotificationTimePicker:v40];

    uint64_t v41 = objc_opt_class();
    v42 = [(REMSettingsController *)self todayNotificationTimePicker];
    uint64_t v111 = v39;
    [v42 setObject:v41 forKeyedSubscript:v39];

    +[PSDateTimePickerCell preferredHeight];
    v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v44 = [(REMSettingsController *)self todayNotificationTimePicker];
    [v44 setObject:v43 forKeyedSubscript:PSTableCellHeightKey];

    v45 = [(REMSettingsController *)self todayNotificationTimePicker];
    [v45 setTarget:self];

    v46 = [(REMSettingsController *)self todayNotificationGroup];
    v119[0] = v46;
    v47 = [(REMSettingsController *)self todayNotificationEnabledSwitch];
    v119[1] = v47;
    v48 = +[NSArray arrayWithObjects:v119 count:2];
    [v8 addObjectsFromArray:v48];

    v49 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
    if (v49)
    {
      v50 = [(REMSettingsController *)self todayNotificationTimeButton];
      [v8 addObject:v50];
    }
    if ([(REMSettingsController *)self todayNotificationTimePickerVisible])
    {
      v51 = [(REMSettingsController *)self todayNotificationTimePicker];
      [v8 addObject:v51];
    }
    v52 = REMSettingsBundleGet();
    v53 = [v52 localizedStringForKey:@"Show all-day reminders as overdue starting on the next day." value:&stru_1D2B8 table:0];
    v54 = +[REMSettingsUtilities groupSpecifierWithHeader:0 footer:v53];

    v55 = REMSettingsBundleGet();
    v56 = [v55 localizedStringForKey:@"Show as Overdue" value:&stru_1D2B8 table:0];
    v57 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v56 target:self cell:6 detail:0 keyName:@"showRemindersAsOverdue" defaultValue:&__kCFBooleanTrue scope:0 set:"setShowRemindersAsOverdue:specifier:" get:"showRemindersAsOverdue:"];

    [v57 setIdentifier:REMSettingsShowAsOverdueIdentifier];
    [(REMSettingsController *)self setShowAsOverdue:v57];
    v118[0] = v54;
    v118[1] = v57;
    v58 = +[NSArray arrayWithObjects:v118 count:2];
    [v8 addObjectsFromArray:v58];

    v59 = REMSettingsBundleGet();
    v60 = [v59 localizedStringForKey:@"Badge Count" value:&stru_1D2B8 table:0];
    v61 = REMSettingsBundleGet();
    v62 = [v61 localizedStringForKey:@"Include both overdue and due today items in badge count." value:&stru_1D2B8 table:0];
    v63 = +[REMSettingsUtilities groupSpecifierWithHeader:v60 footer:v62];

    v64 = REMSettingsBundleGet();
    v65 = [v64 localizedStringForKey:@"Include Due Today" value:&stru_1D2B8 table:0];
    v66 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v65 target:self cell:6 detail:0 keyName:@"shouldIncludeRemindersDueTodayInBadgeCount" defaultValue:&__kCFBooleanFalse scope:0 set:"setShouldIncludeRemindersDueTodayInBadgeCount:specifier:" get:"shouldIncludeRemindersDueTodayInBadgeCount:"];

    uint64_t v110 = PSAllowMultilineTitleKey;
    objc_msgSend(v66, "setProperty:forKey:", &__kCFBooleanTrue);
    [v66 setIdentifier:REMSettingsIncludeDueTodayIdentifier];
    [(REMSettingsController *)self setIncludeRemindersDueTodayInBadgeCount:v66];
    v117[0] = v63;
    v117[1] = v66;
    v67 = +[NSArray arrayWithObjects:v117 count:2];
    [v8 addObjectsFromArray:v67];

    v68 = REMSettingsBundleGet();
    v69 = [v68 localizedStringForKey:@"Assigned Reminders" value:&stru_1D2B8 table:0];
    v70 = +[REMSettingsUtilities groupSpecifierWithHeader:v69 footer:0];

    v71 = REMSettingsBundleGet();
    v72 = [v71 localizedStringForKey:@"Mute Notifications" value:&stru_1D2B8 table:0];
    v73 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v72 target:self cell:6 detail:0 keyName:@"disableAssignmentNotifications:" defaultValue:&__kCFBooleanFalse scope:0 set:"setDisableAssignmentNotifications:specifier:" get:"disableAssignmentNotifications:"];

    [v73 setIdentifier:REMSettingsMuteNotificationsIdentifier];
    [(REMSettingsController *)self setDisableAssignmentNotifications:v73];
    v116[0] = v70;
    v116[1] = v73;
    v74 = +[NSArray arrayWithObjects:v116 count:2];
    [v8 addObjectsFromArray:v74];

    v75 = REMSettingsBundleGet();
    v76 = [v75 localizedStringForKey:@"When Adding Reminders" value:&stru_1D2B8 table:0];

    v77 = +[REMSettingsUtilities groupSpecifierWithHeader:v76 footer:0];
    v78 = REMSettingsBundleGet();
    v79 = [v78 localizedStringForKey:@"Show Suggestions" value:&stru_1D2B8 table:0];
    v80 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v79 target:self cell:6 detail:0 keyName:@"enableAutoCompleteReminders:" defaultValue:&__kCFBooleanTrue scope:0 set:"setEnableAutoCompleteReminders:specifier:" get:"enableAutoCompleteReminders:"];

    [v80 setIdentifier:REMSettingsShowSuggestionsIdentifier];
    [(REMSettingsController *)self setEnableAutoCompleteReminders:v80];
    v115[0] = v77;
    v115[1] = v80;
    v81 = +[NSArray arrayWithObjects:v115 count:2];
    [v8 addObjectsFromArray:v81];

    if (![(REMSettingsController *)self shouldHideGrocerySectionIfNeeded])
    {
      int v82 = rem_feature_enabled();
      v83 = REMSettingsBundleGet();
      v84 = v83;
      if (v82)
      {
        v85 = [v83 localizedStringForKey:@"Grocery Categorization" value:&stru_1D2B8 table:0];
        v86 = REMSettingsBundleGet();
        v87 = [v86 localizedStringForKey:@"Add an additional language to automatically place grocery items into categories." value:&stru_1D2B8 table:0];
        v88 = +[REMSettingsUtilities groupSpecifierWithHeader:v85 footer:v87];

        v89 = v8;
        [v8 addObject:v88];
        Class v90 = NSClassFromString(@"RemindersSettings.TTRIGroceryAddLanguageController");
        if (v90)
        {
          Class v91 = v90;
          v92 = REMSettingsBundleGet();
          v93 = [v92 localizedStringForKey:@"Add Language" value:&stru_1D2B8 table:0];
          v94 = +[PSSpecifier preferenceSpecifierNamed:v93 target:self set:0 get:0 detail:v91 cell:2 edit:v91];

          v89 = v8;
          v95 = REMSettingsBundleGet();
          v96 = [v95 localizedStringForKey:@"Add an additional language to automatically place grocery items into categories." value:&stru_1D2B8 table:0];
          [v94 setProperty:v96 forKey:PSFooterCellClassGroupKey];

          [v94 setProperty:&__kCFBooleanTrue forKey:v110];
          [v94 setIdentifier:REMSettingsGroceryAddLanguageIdentifier];
          [v8 addObject:v94];
        }
        v97 = +[REMSettingsUtilities groupSpecifierWithHeader:0];
        v98 = REMSettingsBundleGet();
        v99 = [v98 localizedStringForKey:@"Clear Categorization History" value:&stru_1D2B8 table:0];
        v100 = +[REMSettingsUtilities standardButtonSpecifierNamed:v99 target:self selector:"clearCategorizationButtonDidTapped:"];

        [v100 setObject:NSClassFromString(@"RemindersSettings.TTRIClearCategorizationHistoryCell") forKeyedSubscript:v111];
        [v100 setIdentifier:REMSettingsGroceryResetCategoriesIdentifier];
        v114[0] = v97;
        v114[1] = v100;
        v101 = +[NSArray arrayWithObjects:v114 count:2];
        [v89 addObjectsFromArray:v101];
      }
      else
      {
        v102 = [v83 localizedStringForKey:@"Grocery Lists" value:&stru_1D2B8 table:0];
        v103 = REMSettingsBundleGet();
        v104 = [v103 localizedStringForKey:@"Clear categorization learned as you manually moved items in grocery lists. Existing items are not affected. " value:&stru_1D2B8 table:0];
        v88 = +[REMSettingsUtilities groupSpecifierWithHeader:v102 footer:v104];

        v105 = REMSettingsBundleGet();
        v106 = [v105 localizedStringForKey:@"Reset Categories" value:&stru_1D2B8 table:0];
        v97 = +[REMSettingsUtilities standardButtonSpecifierNamed:v106 target:self selector:"clearCategorizationButtonDidTapped:"];

        [v97 setIdentifier:REMSettingsGroceryResetCategoriesIdentifier];
        v113[0] = v88;
        v113[1] = v97;
        v100 = +[NSArray arrayWithObjects:v113 count:2];
        [v8 addObjectsFromArray:v100];
      }
    }
    id v107 = [v8 copy];
    v108 = *(void **)&self->PSListController_opaque[v112];
    *(void *)&self->PSListController_opaque[v112] = v107;

    id v3 = *(void **)&self->PSListController_opaque[v112];
  }

  return v3;
}

- (id)_heroPlacardSpecifiers
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:&stru_1D2B8 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v2 setObject:NSClassFromString(@"RemindersSettings.RemindersSettingsPlacardCell") forKeyedSubscript:PSCellClassKey];
  [v2 setIdentifier:@"REMINDERS_PLACARD"];

  return v2;
}

- (id)_appPolicySpecifiersShouldIncludeAccountSpecifier:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 176226305;
  }
  else {
    uint64_t v3 = 42008577;
  }
  objc_super v4 = [(REMSettingsController *)self appPolicy];
  id v5 = [v4 specifiersForPolicyOptions:v3 force:0];

  return v5;
}

- (id)_accountSpecifiers
{
  v2 = [(REMSettingsController *)self appPolicy];
  uint64_t v3 = [v2 specifiersForPolicyOptions:0x8000000 force:0];

  return v3;
}

- (void)saveAndWakeDaemon
{
  unsigned __int8 v3 = [(REMSettingsController *)self saveTodayNotificationFireTimeIfNeeded];
  unsigned int v4 = [(REMSettingsController *)self saveAppBadgeCountCriteriaIfNeeded];
  if ((v3 & 1) != 0 || v4)
  {
    id v6 = objc_alloc_init((Class)REMStore);
    id v5 = [v6 fetchDefaultListWithError:0];
  }
}

- (id)defaultListName:(id)a3
{
  id v3 = objc_alloc_init((Class)REMStore);
  uint64_t v9 = 0;
  unsigned int v4 = [v3 fetchDefaultListWithError:&v9];
  id v5 = [v4 displayName];
  id v6 = v5;
  if (!v5) {
    id v5 = &stru_1D2B8;
  }
  v7 = v5;

  return v7;
}

- (id)todayNotificationTimeSet:(id)a3
{
  id v3 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  BOOL v4 = v3 != 0;

  return +[NSNumber numberWithBool:v4];
}

- (void)setTodayNotificationTimeSet:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  uint64_t v9 = +[NSString stringWithFormat:@"%@#TODAY_NOTIFICATIONS", REMSettingsNavigationDeepLinkGeneralPath];
  uint64_t v10 = +[NSURL URLWithString:v9];

  id v11 = objc_alloc((Class)_NSLocalizedStringResource);
  v12 = +[NSLocale currentLocale];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 bundleURL];
  id v15 = [v11 initWithKey:@"Toggle Today Notifications Settings" table:0 locale:v12 bundleURL:v14];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8004;
  v20[3] = &unk_1CD78;
  v20[4] = self;
  id v16 = v8;
  id v21 = v16;
  id v17 = v6;
  id v22 = v17;
  v18 = objc_retainBlock(v20);
  [(REMSettingsController *)self pe_registerUndoActionName:v15 associatedDeepLink:v10 undoAction:v18];
  LODWORD(v13) = [v7 BOOLValue];

  v19 = 0;
  if (v13)
  {
    v19 = +[REMDaemonUserDefaults todayNotificationFireTimeFromStorageNumber:0];
  }
  [(REMSettingsController *)self setUnsavedTodayNotificationFireTime:v19];
  [(REMSettingsController *)self setTodayNotificationTimePickerVisible:0];
  [(REMSettingsController *)self reloadTodayNotificationSpecifiers:1];
}

- (void)didTapTodayNotificationTimeButton:(id)a3
{
  [(REMSettingsController *)self setTodayNotificationTimePickerVisible:[(REMSettingsController *)self todayNotificationTimePickerVisible] ^ 1];

  [(REMSettingsController *)self reloadTodayNotificationSpecifiers:1];
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = objc_alloc_init((Class)UIDatePicker);
  [v4 setDatePickerMode:0];
  [v4 setMinuteInterval:5];
  [v4 setPreferredDatePickerStyle:1];
  [v4 _setRoundsToMinuteInterval:0];
  id v5 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  if (v5)
  {
    id v6 = +[NSCalendar currentCalendar];
    id v7 = [v6 dateFromComponents:v5];

    if (v7)
    {
      [v4 setDate:v7];
      [(REMSettingsController *)self decreaseMinuteIntervalIfNeededForDatePicker:v4];
    }
  }
  [v4 addTarget:self action:"datePickerEditingDidEnd:" forControlEvents:0x40000];

  return v4;
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  REMCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v8 date];
  id v6 = +[NSCalendar currentCalendar];
  id v7 = [v6 components:96 fromDate:v5];

  [(REMSettingsController *)self setUnsavedTodayNotificationFireTime:v7];
  [(REMSettingsController *)self reloadTodayNotificationSpecifiers:0];
}

- (void)datePickerEditingDidEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  REMCheckedDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(REMSettingsController *)self decreaseMinuteIntervalIfNeededForDatePicker:v5];
}

- (void)decreaseMinuteIntervalIfNeededForDatePicker:(id)a3
{
  id v6 = a3;
  if ([v6 minuteInterval] != (char *)&dword_0 + 1)
  {
    id v3 = [v6 date];
    id v4 = +[NSCalendar currentCalendar];
    uint64_t v5 = (uint64_t)[v4 component:64 fromDate:v3];

    if (v5 % (uint64_t)[v6 minuteInterval]) {
      [v6 setMinuteInterval:1];
    }
  }
}

- (BOOL)saveTodayNotificationFireTimeIfNeeded
{
  id v3 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  id v4 = [(REMSettingsController *)self daemonUserDefaults];
  uint64_t v5 = [v4 todayNotificationFireTime];

  if (v3 != v5)
  {
    id v6 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
    id v7 = [(REMSettingsController *)self daemonUserDefaults];
    [v7 setTodayNotificationFireTime:v6];
  }
  return v3 != v5;
}

- (id)todayNotificationTimeString
{
  v2 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    [v3 setTimeStyle:1];
    [v3 setDateStyle:0];
    id v4 = +[NSCalendar currentCalendar];
    uint64_t v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:0.0];
    id v6 = objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v2, "hour"), objc_msgSend(v2, "minute"), 0, v5, 0);
    id v7 = [v3 stringFromDate:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)todayNotificationFooterText
{
  v2 = REMSettingsBundleGet();
  id v3 = [v2 localizedStringForKey:@"Set a time to show a notification when there are all-day reminders (with no specified time)." value:&stru_1D2B8 table:0];

  return v3;
}

- (void)reloadTodayNotificationSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [(REMSettingsController *)self unsavedTodayNotificationFireTime];
  uint64_t v5 = [(REMSettingsController *)self todayNotificationTimeButton];
  unsigned int v6 = [(REMSettingsController *)self containsSpecifier:v5];

  if (v17)
  {
    if (v6)
    {
      objc_opt_class();
      id v7 = [(REMSettingsController *)self todayNotificationTimeButton];
      id v8 = [(REMSettingsController *)self cachedCellForSpecifier:v7];
      uint64_t v9 = REMCheckedDynamicCast();

      if (v9)
      {
        uint64_t v10 = [(REMSettingsController *)self todayNotificationTimeString];
        id v11 = [v9 detailTextLabel];
        [v11 setText:v10];
      }
      else
      {
        uint64_t v10 = [(REMSettingsController *)self todayNotificationTimeButton];
        [(REMSettingsController *)self reloadSpecifier:v10 animated:v3];
      }
    }
    else
    {
      uint64_t v9 = [(REMSettingsController *)self todayNotificationTimeButton];
      uint64_t v10 = [(REMSettingsController *)self todayNotificationEnabledSwitch];
      [(REMSettingsController *)self insertSpecifier:v9 afterSpecifier:v10 animated:v3];
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    uint64_t v9 = [(REMSettingsController *)self todayNotificationTimeButton];
    [(REMSettingsController *)self removeSpecifier:v9 animated:v3];
  }

LABEL_11:
  unsigned int v12 = [(REMSettingsController *)self todayNotificationTimePickerVisible];
  v13 = [(REMSettingsController *)self todayNotificationTimePicker];
  unsigned int v14 = [(REMSettingsController *)self containsSpecifier:v13];

  if (v12)
  {
    if (v14) {
      goto LABEL_17;
    }
    id v15 = [(REMSettingsController *)self todayNotificationTimePicker];
    id v16 = [(REMSettingsController *)self todayNotificationTimeButton];
    [(REMSettingsController *)self insertSpecifier:v15 afterSpecifier:v16 animated:v3];
  }
  else
  {
    if (!v14) {
      goto LABEL_17;
    }
    id v15 = [(REMSettingsController *)self todayNotificationTimePicker];
    [(REMSettingsController *)self removeSpecifier:v15 animated:v3];
  }

LABEL_17:
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (void)refreshExternallyModifiableSpecifiers
{
  if (*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v3 = [(REMSettingsController *)self defaultListSpecifier];
    [(REMSettingsController *)self reloadSpecifier:v3];
  }
}

- (id)disableAssignmentNotifications:(id)a3
{
  id v3 = [(REMSettingsController *)self daemonUserDefaults];
  id v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 enableAssignmentNotifications] ^ 1);

  return v4;
}

- (void)setDisableAssignmentNotifications:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(REMSettingsController *)self daemonUserDefaults];
  unsigned __int8 v7 = [v6 enableAssignmentNotifications];

  id v8 = +[NSString stringWithFormat:@"%@#MUTE_NOTIFICATIONS", REMSettingsNavigationDeepLinkGeneralPath];
  uint64_t v9 = +[NSURL URLWithString:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  id v11 = +[NSLocale currentLocale];
  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Toggle Mute Notifications Settings" table:0 locale:v11 bundleURL:v13];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8A74;
  v17[3] = &unk_1CDA0;
  v17[4] = self;
  unsigned __int8 v18 = v7;
  id v15 = objc_retainBlock(v17);
  [(REMSettingsController *)self pe_registerUndoActionName:v14 associatedDeepLink:v9 undoAction:v15];
  LODWORD(v11) = [v5 BOOLValue];

  id v16 = [(REMSettingsController *)self daemonUserDefaults];
  [v16 setEnableAssignmentNotifications:v11 ^ 1];
}

- (id)clearCategorizationDetailText
{
  v2 = REMSettingsBundleGet();
  id v3 = [v2 localizedStringForKey:@"Clearing manual categorization for your grocery lists applies to all of your devices and grocery lists you’ve shared. Lists shared with you will not be affected" value:&stru_1D2B8 table:0];

  return v3;
}

- (void)clearCategorizationButtonDidTapped:(id)a3
{
  id v4 = [(REMSettingsController *)self clearCategorizationDetailText];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:0];

  unsigned int v6 = REMSettingsBundleGet();
  unsigned __int8 v7 = [v6 localizedStringForKey:@"Reset Categories" value:&stru_1D2B8 table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8CCC;
  v12[3] = &unk_1CDC8;
  v12[4] = self;
  id v8 = +[UIAlertAction actionWithTitle:v7 style:2 handler:v12];
  [v5 addAction:v8];

  uint64_t v9 = REMSettingsBundleGet();
  id v10 = [v9 localizedStringForKey:@"Cancel" value:&stru_1D2B8 table:0];
  id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&stru_1CE08];
  [v5 addAction:v11];

  [(REMSettingsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)performClearAction
{
  id v2 = objc_alloc_init((Class)REMStore);
  [v2 clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletionHandler:&stru_1CE48];
}

- (id)showRemindersAsOverdue:(id)a3
{
  id v3 = [(REMSettingsController *)self daemonUserDefaults];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showRemindersAsOverdue]);

  return v4;
}

- (void)setShowRemindersAsOverdue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(REMSettingsController *)self daemonUserDefaults];
  unsigned __int8 v7 = [v6 showRemindersAsOverdue];

  id v8 = +[NSString stringWithFormat:@"%@#SHOW_AS_OVERDUE", REMSettingsNavigationDeepLinkGeneralPath];
  uint64_t v9 = +[NSURL URLWithString:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  id v11 = +[NSLocale currentLocale];
  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Toggle Show As Overdue Settings" table:0 locale:v11 bundleURL:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_8FF4;
  v18[3] = &unk_1CDA0;
  v18[4] = self;
  unsigned __int8 v19 = v7;
  id v15 = objc_retainBlock(v18);
  [(REMSettingsController *)self pe_registerUndoActionName:v14 associatedDeepLink:v9 undoAction:v15];
  id v16 = [v5 BOOLValue];

  id v17 = [(REMSettingsController *)self daemonUserDefaults];
  [v17 setShowRemindersAsOverdue:v16];
}

- (id)enableAutoCompleteReminders:(id)a3
{
  id v3 = [(REMSettingsController *)self daemonUserDefaults];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 enableAutoCompleteReminders]);

  return v4;
}

- (void)setEnableAutoCompleteReminders:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(REMSettingsController *)self daemonUserDefaults];
  unsigned __int8 v7 = [v6 enableAutoCompleteReminders];

  id v8 = +[NSString stringWithFormat:@"%@#SHOW_SUGGESTIONS", REMSettingsNavigationDeepLinkGeneralPath];
  uint64_t v9 = +[NSURL URLWithString:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  id v11 = +[NSLocale currentLocale];
  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Toggle Show Suggestions Settings" table:0 locale:v11 bundleURL:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_927C;
  v18[3] = &unk_1CDA0;
  v18[4] = self;
  unsigned __int8 v19 = v7;
  id v15 = objc_retainBlock(v18);
  [(REMSettingsController *)self pe_registerUndoActionName:v14 associatedDeepLink:v9 undoAction:v15];
  id v16 = [v5 BOOLValue];

  id v17 = [(REMSettingsController *)self daemonUserDefaults];
  [v17 setEnableAutoCompleteReminders:v16];
}

- (BOOL)saveAppBadgeCountCriteriaIfNeeded
{
  unsigned __int8 v3 = [(REMSettingsController *)self initialShouldIncludeRemindersDueTodayInBadgeCount];
  id v4 = [(REMSettingsController *)self daemonUserDefaults];
  char v5 = v3 ^ [v4 shouldIncludeRemindersDueTodayInBadgeCount];

  return v5;
}

- (id)shouldIncludeRemindersDueTodayInBadgeCount:(id)a3
{
  unsigned __int8 v3 = [(REMSettingsController *)self daemonUserDefaults];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 shouldIncludeRemindersDueTodayInBadgeCount]);

  return v4;
}

- (void)setShouldIncludeRemindersDueTodayInBadgeCount:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(REMSettingsController *)self daemonUserDefaults];
  unsigned __int8 v7 = [v6 shouldIncludeRemindersDueTodayInBadgeCount];

  id v8 = +[NSString stringWithFormat:@"%@#INCLUDE_DUE_TODAY", REMSettingsNavigationDeepLinkGeneralPath];
  uint64_t v9 = +[NSURL URLWithString:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  id v11 = +[NSLocale currentLocale];
  unsigned int v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Toggle Include Due Today Settings" table:0 locale:v11 bundleURL:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_954C;
  v18[3] = &unk_1CDA0;
  v18[4] = self;
  unsigned __int8 v19 = v7;
  id v15 = objc_retainBlock(v18);
  [(REMSettingsController *)self pe_registerUndoActionName:v14 associatedDeepLink:v9 undoAction:v15];
  id v16 = [v5 BOOLValue];

  id v17 = [(REMSettingsController *)self daemonUserDefaults];
  [v17 setShouldIncludeRemindersDueTodayInBadgeCount:v16];
}

- (BOOL)shouldHideGrocerySectionIfNeeded
{
  id v2 = objc_alloc_init((Class)REMStore);
  id v15 = 0;
  unsigned __int8 v3 = [v2 fetchAccountsWithError:&v15];
  id v4 = v15;
  if (v4)
  {
    id v5 = +[REMLog utility];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_13DA8(v4, v5);
    }
    goto LABEL_4;
  }
  unsigned __int8 v7 = +[NSPredicate predicateWithBlock:&stru_1CE88];
  id v5 = [v3 filteredArrayUsingPredicate:v7];

  if (![v5 count])
  {
LABEL_4:
    LOBYTE(v6) = 1;
    goto LABEL_10;
  }
  id v8 = +[REMUserDefaults daemonUserDefaults];
  uint64_t v9 = [v8 preferredLocalizations];
  id v10 = [v9 firstObject];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = +[NSLocale currentLocale];
    id v12 = [v13 localeIdentifier];
  }
  unsigned int v6 = +[REMGroceryDummyModel isGrocerySupportedForLocaleWithIdentifier:v12] ^ 1;

LABEL_10:
  return v6;
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (REMDaemonUserDefaults)daemonUserDefaults
{
  return self->_daemonUserDefaults;
}

- (void)setDaemonUserDefaults:(id)a3
{
}

- (PSSpecifier)todayNotificationGroup
{
  return self->_todayNotificationGroup;
}

- (void)setTodayNotificationGroup:(id)a3
{
}

- (PSSpecifier)todayNotificationEnabledSwitch
{
  return self->_todayNotificationEnabledSwitch;
}

- (void)setTodayNotificationEnabledSwitch:(id)a3
{
}

- (PSSpecifier)todayNotificationTimeButton
{
  return self->_todayNotificationTimeButton;
}

- (void)setTodayNotificationTimeButton:(id)a3
{
}

- (PSSpecifier)todayNotificationTimePicker
{
  return self->_todayNotificationTimePicker;
}

- (void)setTodayNotificationTimePicker:(id)a3
{
}

- (BOOL)todayNotificationTimePickerVisible
{
  return self->_todayNotificationTimePickerVisible;
}

- (void)setTodayNotificationTimePickerVisible:(BOOL)a3
{
  self->_todayNotificationTimePickerVisible = a3;
}

- (PSSpecifier)defaultListSpecifier
{
  return self->_defaultListSpecifier;
}

- (void)setDefaultListSpecifier:(id)a3
{
}

- (NSDateComponents)unsavedTodayNotificationFireTime
{
  return self->_unsavedTodayNotificationFireTime;
}

- (void)setUnsavedTodayNotificationFireTime:(id)a3
{
}

- (BOOL)initialShouldIncludeRemindersDueTodayInBadgeCount
{
  return self->_initialShouldIncludeRemindersDueTodayInBadgeCount;
}

- (void)setInitialShouldIncludeRemindersDueTodayInBadgeCount:(BOOL)a3
{
  self->_initialShouldIncludeRemindersDueTodayInBadgeCount = a3;
}

- (PSSpecifier)showAsOverdue
{
  return self->_showAsOverdue;
}

- (void)setShowAsOverdue:(id)a3
{
}

- (PSSpecifier)includeRemindersDueTodayInBadgeCount
{
  return self->_includeRemindersDueTodayInBadgeCount;
}

- (void)setIncludeRemindersDueTodayInBadgeCount:(id)a3
{
}

- (PSSpecifier)disableAssignmentNotifications
{
  return self->_disableAssignmentNotifications;
}

- (void)setDisableAssignmentNotifications:(id)a3
{
}

- (PSSpecifier)enableAutoCompleteReminders
{
  return self->_enableAutoCompleteReminders;
}

- (void)setEnableAutoCompleteReminders:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsDefaultListObserver
{
  return self->_daemonUserDefaultsDefaultListObserver;
}

- (void)setDaemonUserDefaultsDefaultListObserver:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsTodayNotificationObserver
{
  return self->_daemonUserDefaultsTodayNotificationObserver;
}

- (void)setDaemonUserDefaultsTodayNotificationObserver:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsShowReminderAsOverdueObserver
{
  return self->_daemonUserDefaultsShowReminderAsOverdueObserver;
}

- (void)setDaemonUserDefaultsShowReminderAsOverdueObserver:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsIncludeDueTodayObserver
{
  return self->_daemonUserDefaultsIncludeDueTodayObserver;
}

- (void)setDaemonUserDefaultsIncludeDueTodayObserver:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsMuteNotificationsObserver
{
  return self->_daemonUserDefaultsMuteNotificationsObserver;
}

- (void)setDaemonUserDefaultsMuteNotificationsObserver:(id)a3
{
}

- (REMUserDefaultsObserveToken)daemonUserDefaultsShowSuggestionsObserver
{
  return self->_daemonUserDefaultsShowSuggestionsObserver;
}

- (void)setDaemonUserDefaultsShowSuggestionsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonUserDefaultsShowSuggestionsObserver, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaultsMuteNotificationsObserver, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaultsIncludeDueTodayObserver, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaultsShowReminderAsOverdueObserver, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaultsTodayNotificationObserver, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaultsDefaultListObserver, 0);
  objc_storeStrong((id *)&self->_enableAutoCompleteReminders, 0);
  objc_storeStrong((id *)&self->_disableAssignmentNotifications, 0);
  objc_storeStrong((id *)&self->_includeRemindersDueTodayInBadgeCount, 0);
  objc_storeStrong((id *)&self->_showAsOverdue, 0);
  objc_storeStrong((id *)&self->_unsavedTodayNotificationFireTime, 0);
  objc_storeStrong((id *)&self->_defaultListSpecifier, 0);
  objc_storeStrong((id *)&self->_todayNotificationTimePicker, 0);
  objc_storeStrong((id *)&self->_todayNotificationTimeButton, 0);
  objc_storeStrong((id *)&self->_todayNotificationEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_todayNotificationGroup, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaults, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end