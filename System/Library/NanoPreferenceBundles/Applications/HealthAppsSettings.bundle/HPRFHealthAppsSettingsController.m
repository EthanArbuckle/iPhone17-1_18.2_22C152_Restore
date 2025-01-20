@interface HPRFHealthAppsSettingsController
- (BOOL)_shouldShowFitnessJrSpecifier;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (BOOL)wantsGlanceRowIfApplicable;
- (HPRFHealthAppsSettingsController)init;
- (id)_fitnessJrSpecifiers;
- (id)_groupSpecifiers;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)getFitnessJrValue;
- (id)getProgressUpdateFrequency:(id)a3;
- (id)localizedPaneTitle;
- (id)notificationApplicationSpecifiers;
- (void)_loadFitnessJrValue;
- (void)_loadIsActivitySetup;
- (void)_setFitnessJrToValue:(id)a3;
- (void)_triggerCloudSync;
- (void)_triggerNanoSync;
- (void)dealloc;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)showFitnessJrPrompt:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HPRFHealthAppsSettingsController

- (HPRFHealthAppsSettingsController)init
{
  v18.receiver = self;
  v18.super_class = (Class)HPRFHealthAppsSettingsController;
  v2 = [(HPRFHealthAppsSettingsController *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(HPRFHealthAppsSettingsController *)v2 localizedPaneTitle];
    [(HPRFHealthAppsSettingsController *)v3 setTitle:v4];

    v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
    uint64_t v8 = [v7 firstObject];
    device = v3->_device;
    v3->_device = (NRDevice *)v8;

    uint64_t v10 = FIUIHealthStoreForDevice();
    healthStore = v3->_healthStore;
    v3->_healthStore = (HKHealthStore *)v10;

    id v12 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v3->_healthStore];
    v13 = (FIUIFormattingManager *)[objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v12];
    formattingManager = v3->_formattingManager;
    v3->_formattingManager = v13;

    v15 = (_HKWheelchairUseCharacteristicCache *)[objc_alloc((Class)_HKWheelchairUseCharacteristicCache) initWithHealthStore:v3->_healthStore];
    wheelchairUseCharacteristicCache = v3->_wheelchairUseCharacteristicCache;
    v3->_wheelchairUseCharacteristicCache = v15;

    [(_HKWheelchairUseCharacteristicCache *)v3->_wheelchairUseCharacteristicCache addObserver:v3];
    v3->_isActivitySetup = 0;
    [(HPRFHealthAppsSettingsController *)v3 _loadIsActivitySetup];
    v3->_didSwitchFitnessJrToday = 0;
    [(HPRFHealthAppsSettingsController *)v3 _loadFitnessJrValue];
  }
  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HPRFHealthAppsSettingsController;
  [(HPRFHealthAppsSettingsController *)&v4 viewDidLoad];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)nanoLifestylePreferencesDidChange, @"NanoLifestylePreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HPRFHealthAppsSettingsController;
  [(HPRFHealthAppsSettingsController *)&v8 viewDidAppear:a3];
  if (!self->_device)
  {
    objc_super v4 = +[_HKBehavior sharedBehavior];
    unsigned int v5 = [v4 isAppleInternalInstall];

    if (v5)
    {
      v6 = +[UIAlertController alertControllerWithTitle:@"Unexpected state!" message:@"Didn't get an active watch, this is unexpected and will lead to unexpected results. Please file a radar." preferredStyle:1];
      v7 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v6 addAction:v7];

      [(HPRFHealthAppsSettingsController *)self presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (void)dealloc
{
  [(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache removeObserver:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HPRFHealthAppsSettingsController;
  [(HPRFHealthAppsSettingsController *)&v4 dealloc];
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_86D0 table:@"HealthAppsSettings"];

  return v3;
}

- (BOOL)wantsGlanceRowIfApplicable
{
  return 1;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.ActivityMonitorApp";
}

- (id)_groupSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(HPRFHealthAppsSettingsController *)self _shouldShowFitnessJrSpecifier])
  {
    objc_super v4 = [(HPRFHealthAppsSettingsController *)self _fitnessJrSpecifiers];
    [v3 addObjectsFromArray:v4];
  }
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v18 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"HealthAppsGroupSettings" inBundle:v5 target:self stringsTable:@"HealthAppsSettings"];

  [v3 addObjectsFromArray:v18];
  v6 = +[HKHealthStore localizationStringSuffixForWheelchairUser:[(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser]];
  v7 = [v3 specifierForID:@"STAND_REMINDERS_ENABLED_LABEL"];
  objc_super v8 = [@"STAND_REMINDERS_ENABLED_LABEL" stringByAppendingString:v6];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:v8 value:&stru_86D0 table:@"HealthAppsSettings"];
  [v7 setName:v10];

  [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  v11 = [v3 specifierForID:@"STAND_REMINDERS_ENABLED_FOOTER"];
  id v12 = [@"STAND_REMINDERS_ENABLED_FOOTER" stringByAppendingString:v6];
  v13 = +[FIUIFormattingManager stringWithNumber:&off_8C00 decimalPrecision:1];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:v12 value:&stru_86D0 table:@"HealthAppsSettings"];
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);

  [v11 setProperty:v16 forKey:PSFooterTextGroupKey];

  return v3;
}

- (id)notificationApplicationSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"HealthAppsSettings" inBundle:v3 target:self stringsTable:@"HealthAppsSettings"];
  id v5 = [v4 mutableCopy];

  if (+[_HKBehavior activePairedWatchHasSmartFitnessCoaching])
  {
    v6 = +[HKHealthStore localizationStringSuffixForWheelchairUser:[(_HKWheelchairUseCharacteristicCache *)self->_wheelchairUseCharacteristicCache isWheelchairUser]];
    v7 = [v5 specifierForID:@"GOAL_COMPLETIONS_ENABLED_FOOTER"];
    objc_super v8 = [@"GOAL_COMPLETIONS_ENABLED_FOOTER_SMART_COACH" stringByAppendingString:v6];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:v8 value:&stru_86D0 table:@"HealthAppsSettings"];
    [v7 setProperty:v10 forKey:PSFooterTextGroupKey];
  }
  if ([(HPRFHealthAppsSettingsController *)self alertingMode])
  {
    v11 = [(HPRFHealthAppsSettingsController *)self _groupSpecifiers];
    id v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v11 count]);
    [v5 insertObjects:v11 atIndexes:v12];
  }

  return v5;
}

- (id)applicationGroupSpecifiers
{
  if ([(HPRFHealthAppsSettingsController *)self alertingMode])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(HPRFHealthAppsSettingsController *)self _groupSpecifiers];
  }

  return v3;
}

- (id)getProgressUpdateFrequency:(id)a3
{
  return +[HPRFHealthAppsProgressUpdatesSettingsController progressUpdateFrequency];
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 propertyForKey:PSKeyNameKey];
  if (v8)
  {
    if (qword_C7B0 != -1) {
      dispatch_once(&qword_C7B0, &stru_8590);
    }
    unsigned int v9 = [(id)qword_C7B8 containsObject:v8];
    if (v6)
    {
      if (v9)
      {
        uint64_t v10 = [v7 propertyForKey:PSValueKey];
        unsigned __int8 v11 = [v6 isEqual:v10];

        if ((v11 & 1) == 0) {
          FIActivityAnalyticsSubmission();
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)HPRFHealthAppsSettingsController;
  [(HPRFHealthAppsSettingsController *)&v12 setPreferenceValue:v6 specifier:v7];
}

- (id)_fitnessJrSpecifiers
{
  id v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"FITNESS_JR_FOOTER" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  uint64_t v6 = PSIDKey;
  [v3 setObject:v5 forKeyedSubscript:PSIDKey];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v8 = [v7 localizedStringForKey:@"FITNESS_JR_FOOTER" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  [v3 setObject:v8 forKeyedSubscript:PSFooterTextGroupKey];

  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"FITNESS_JR_LABEL" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  unsigned __int8 v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"showFitnessJrPrompt:" get:"getFitnessJrValue" detail:0 cell:6 edit:0];

  objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"FITNESS_JR_LABEL" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  [v11 setObject:v13 forKeyedSubscript:v6];

  [v11 setObject:@"EnableFitnessJr" forKeyedSubscript:PSKeyNameKey];
  v14 = +[NSNumber numberWithBool:1];
  [v11 setObject:v14 forKeyedSubscript:PSNotifyNanoKey];

  v17[0] = v3;
  v17[1] = v11;
  v15 = +[NSArray arrayWithObjects:v17 count:2];

  return v15;
}

- (void)_loadFitnessJrValue
{
  if (self->_healthStore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    objc_super v4 = +[HKObjectType categoryTypeForIdentifier:_HKCategoryTypeIdentifierActivityMoveModeChange];
    id v5 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:0];
    uint64_t v6 = +[NSSortDescriptor sortDescriptorWithKey:_HKObjectSortIdentifierCreationDate ascending:0];
    id v7 = objc_alloc((Class)HKSampleQuery);
    v16[0] = v5;
    v16[1] = v6;
    objc_super v8 = +[NSArray arrayWithObjects:v16 count:2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_38F0;
    v13[3] = &unk_8400;
    unsigned int v9 = v3;
    v14 = v9;
    v15 = self;
    id v10 = [v7 initWithSampleType:v4 predicate:0 limit:1 sortDescriptors:v8 resultsHandler:v13];

    [(HKHealthStore *)self->_healthStore executeQuery:v10];
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      _HKInitializeLogging();
      objc_super v12 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_4DA8(v12);
      }
      [(HKHealthStore *)self->_healthStore stopQuery:v10];
    }
  }
}

- (void)_loadIsActivitySetup
{
  if (self->_healthStore)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    FIUIUserHasExistingMoveGoal();
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      _HKInitializeLogging();
      id v5 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_4E54(v5);
      }
    }
    self->_isActivitySetup = *((unsigned char *)v7 + 24);

    _Block_object_dispose(&v6, 8);
  }
}

- (id)getFitnessJrValue
{
  return +[NSNumber numberWithInteger:self->_fitnessJrValue];
}

- (void)showFitnessJrPrompt:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isEqualToNumber:&off_8C18];
  if (v5) {
    CFStringRef v6 = @"TOGGLE_FITNESS_JR_ENABLE_CONFIRM_BUTTON_TEXT";
  }
  else {
    CFStringRef v6 = @"TOGGLE_FITNESS_JR_DISABLE_CONFIRM_BUTTON_TEXT";
  }
  CFStringRef v7 = @"TOGGLE_FITNESS_JR_DISABLE_CONFIRM_TITLE";
  if (v5) {
    CFStringRef v7 = @"TOGGLE_FITNESS_JR_ENABLE_CONFIRM_TITLE";
  }
  CFStringRef v19 = v7;
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  char v9 = [v8 localizedStringForKey:@"TOGGLE_FITNESS_JR_CANCEL_BUTTON_TEXT" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_3FD8;
  v23[3] = &unk_8450;
  v23[4] = self;
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v23];

  dispatch_time_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v12 = [v11 localizedStringForKey:v6 value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_3FE0;
  v21[3] = &unk_8478;
  v21[4] = self;
  id v22 = v4;
  id v20 = v4;
  v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v21];

  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:v19 value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"TOGGLE_FITNESS_JR_CONFIRM_MESSAGE" value:&stru_86D0 table:@"HealthAppsSettings-tinker"];
  objc_super v18 = +[UIAlertController alertControllerWithTitle:v15 message:v17 preferredStyle:1];

  [v18 addAction:v10];
  [v18 addAction:v13];
  [(HPRFHealthAppsSettingsController *)self presentViewController:v18 animated:1 completion:0];
}

- (void)_setFitnessJrToValue:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isEqualToNumber:&off_8C30];
  CFStringRef v6 = +[NSCalendar currentCalendar];
  CFStringRef v7 = +[NSDate date];
  uint64_t v8 = objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v7);

  char v9 = +[NSCalendar currentCalendar];
  id v10 = [v9 components:_HKRequiredCalendarUnitsForCacheIndexDateComponents fromDate:v8];

  id v11 = [objc_alloc((Class)FIActivitySettingsController) initWithHealthStore:self->_healthStore];
  [v11 populateExistingCharacteristics];
  [v11 biologicalSex];
  [v11 weight];
  if (v5) {
    v29 = {;
  }
    objc_super v12 = [v11 leanBodyMass];
    v13 = [v11 height];
    [v11 dateOfBirth];
    id v14 = v4;
    v16 = v15 = v10;
    [v11 wheelchairUse];
    FIUICalculateBMR();

    id v10 = v15;
    id v4 = v14;

    v17 = FIUIActivityLevelsForBMR();
    uint64_t v18 = 1;
  }
  else {
    CFStringRef v19 = {;
  }
    id v20 = +[HKUnit gramUnitWithMetricPrefix:9];
    [v19 doubleValueForUnit:v20];

    v21 = [v11 height];
    id v22 = +[HKUnit meterUnitWithMetricPrefix:7];
    [v21 doubleValueForUnit:v22];

    v23 = [v11 dateOfBirth];
    FIAgeInYearsForDateOfBirth();

    [v11 wheelchairUse];
    FICMotionConditionForWheelchairUse();
    v17 = FIUIActivityLevelsForFitnessJr();
    uint64_t v18 = 2;
  }
  v24 = FIActivityMoveModeChangeSampleForDateComponents();
  healthStore = self->_healthStore;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_4374;
  v30[3] = &unk_84F0;
  id v33 = v8;
  uint64_t v34 = v18;
  v30[4] = self;
  id v31 = v4;
  id v32 = v17;
  id v26 = v8;
  id v27 = v17;
  id v28 = v4;
  [(HKHealthStore *)healthStore saveObject:v24 withCompletion:v30];
}

- (void)_triggerCloudSync
{
}

- (void)_triggerNanoSync
{
  id v2 = [objc_alloc((Class)HKNanoSyncControl) initWithHealthStore:self->_healthStore];
  [v2 forceNanoSyncWithOptions:0 completion:&stru_8550];
}

- (BOOL)_shouldShowFitnessJrSpecifier
{
  if (self->_isActivitySetup)
  {
    healthStore = self->_healthStore;
    id v22 = 0;
    id v4 = [(HKHealthStore *)healthStore wheelchairUseWithError:&v22];
    id v5 = v22;
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_5108();
      }
    }
    else if ([v4 wheelchairUse] == (char *)&dword_0 + 2)
    {
      _HKInitializeLogging();
      uint64_t v8 = HKLogActivity;
      char v7 = 0;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - user is in wheelchair mode", buf, 2u);
        char v7 = 0;
      }
      goto LABEL_15;
    }
    if (self->_fitnessJrValue == 1 || self->_didSwitchFitnessJrToday)
    {
      _HKInitializeLogging();
      char v9 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        int64_t fitnessJrValue = self->_fitnessJrValue;
        BOOL didSwitchFitnessJrToday = self->_didSwitchFitnessJrToday;
        *(_DWORD *)buf = 134218240;
        unint64_t v24 = fitnessJrValue;
        __int16 v25 = 1024;
        BOOL v26 = didSwitchFitnessJrToday;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - _fitnessJrValue %ld _didSwitchFitnessJrToday %d", buf, 0x12u);
      }
      char v7 = 1;
      goto LABEL_15;
    }
    v13 = self->_healthStore;
    id v21 = 0;
    id v14 = [(HKHealthStore *)v13 dateOfBirthComponentsWithError:&v21];
    id v15 = v21;
    if (v15)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
        sub_50A0();
      }
    }
    else
    {
      if (v14)
      {
        v16 = [v14 date];
        unint64_t v17 = FIAgeInYearsForDateOfBirth();
        unint64_t v18 = kActivityMoveModeMoveTimeMaximumAge;
        char v7 = v17 <= kActivityMoveModeMoveTimeMaximumAge;
        _HKInitializeLogging();
        CFStringRef v19 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = v17;
          __int16 v25 = 1024;
          BOOL v26 = v17 <= v18;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - ageInYears %lu shouldShowFitnessJrSpecifier %d", buf, 0x12u);
        }

        goto LABEL_27;
      }
      _HKInitializeLogging();
      id v20 = HKLogActivity;
      char v7 = 0;
      if (!os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

LABEL_15:
        return v7;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - age unknown; not showing FitnessJr switch",
        buf,
        2u);
    }
    char v7 = 0;
    goto LABEL_27;
  }
  _HKInitializeLogging();
  CFStringRef v6 = HKLogActivity;
  char v7 = 0;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - activity not setup; not showing FitnessJr switch",
      buf,
      2u);
    return 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end