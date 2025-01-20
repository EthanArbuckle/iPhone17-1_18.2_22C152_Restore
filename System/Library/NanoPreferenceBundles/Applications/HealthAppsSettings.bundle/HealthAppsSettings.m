void nanoLifestylePreferencesDidChange(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Did receive NanoLifestylePreferencesChangedNotification; reloading specifiers",
      v4,
      2u);
  }
  [v2 reloadSpecifiers];
}

void sub_38F0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (!v6)
  {
    v7 = [a3 lastObject];
    _HKInitializeLogging();
    v8 = HKLogActivity;
    BOOL v9 = os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - last move mode sample %@", (uint8_t *)&v15, 0xCu);
      }
      v10 = +[NSCalendar currentCalendar];
      v11 = [v7 _creationDate];
      unsigned int v12 = [v10 isDateInToday:v11];

      if (v12) {
        *(unsigned char *)(*(void *)(a1 + 40) + 209) = 1;
      }
      v13 = (char *)[v7 value];
      if (v13 != (unsigned char *)&dword_0 + 1)
      {
        if (v13 != (unsigned char *)&dword_0 + 2)
        {
LABEL_17:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

          goto LABEL_18;
        }
        uint64_t v14 = 1;
LABEL_16:
        *(void *)(*(void *)(a1 + 40) + 216) = v14;
        goto LABEL_17;
      }
    }
    else if (v9)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController - no last move mode sample; defaulting Fitness Jr value to off",
        (uint8_t *)&v15,
        2u);
    }
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
    sub_4DEC();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_18:
}

void sub_3C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3C28(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_4E98();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_3FD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_3FE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFitnessJrToValue:*(void *)(a1 + 40)];
}

void sub_4374(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogActivity;
  if (a2)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController saved new move mode: %ld", buf, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 216) = [*(id *)(a1 + 40) integerValue];
    *(unsigned char *)(*(void *)(a1 + 32) + 209) = 1;
    v8 = [*(id *)(a1 + 48) objectAtIndexedSubscript:0];
    BOOL v9 = FIDefaultExerciseGoalQuantityForActivityMoveMode();
    v10 = FIDefaultStandGoalQuantityForActivityMoveMode();
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 64);
    v14[5] = _NSConcreteStackBlock;
    v14[6] = 3221225472;
    v14[7] = sub_45C8;
    v14[8] = &unk_84A0;
    uint64_t v16 = v11;
    uint64_t v17 = v12;
    id v15 = v8;
    id v13 = v8;
    FISaveGoalsForNewActivityMoveMode();
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
  {
    sub_4F00();
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_46E0;
  v14[3] = &unk_84C8;
  v14[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

void sub_45C8(void *a1, char a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogActivity;
  if (a2)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[6];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController saved new move goal: %@ with move mode: %ld default exercise/stand goals.", (uint8_t *)&v11, 0x16u);
    }
    int active = FIIsActivePairedDeviceSatellitePaired();
    v10 = (void *)a1[5];
    if (active) {
      [v10 _triggerCloudSync];
    }
    else {
      [v10 _triggerNanoSync];
    }
    FIActivityMoveModeAnalyticsSendActivityMoveModeSwitchedInSettings();
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
  {
    sub_4F68();
  }
}

id sub_46E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4700(id a1, BOOL a2, NSError *a3)
{
  v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogActivity;
  if (a2)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController successfully forced cloud sync after saving activity move mode on phone", v6, 2u);
    }
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
  {
    sub_4FD0();
  }
}

void sub_4814(id a1, BOOL a2, NSError *a3)
{
  v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogActivity;
  if (a2)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "HPRFHealthAppsSettingsController successfully forced nano sync after saving activity move mode on phone", v6, 2u);
    }
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
  {
    sub_5038();
  }
}

void sub_4CB0(id a1)
{
  qword_C7B8 = +[NSSet setWithObjects:@"EnableStandReminders", @"ProgressUpdateFrequency", @"EnableGoalCompletions", @"EnableAchievements", @"EnableWeeklySummary", @"EnableProgressUpdates", @"ActivitySharingEnableNotifications", @"EnableRemoteAchievements", @"FirstDayOfFitnessWeek", 0];

  _objc_release_x1();
}

void sub_4D54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4D7C()
{
}

void sub_4DA8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "HPRFHealthAppsSettingsController failed to load FitnessJr value; semaphore timed out",
    v1,
    2u);
}

void sub_4DEC()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to load last move mode category sample with error: %@", v2, v3, v4, v5, v6);
}

void sub_4E54(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "HPRFHealthAppsSettingsController failed to load move goals; dispatch semaphore timed out",
    v1,
    2u);
}

void sub_4E98()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to load existing move goal with error: %@", v2, v3, v4, v5, v6);
}

void sub_4F00()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to save move mode sample to database with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_4F68()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to save new goal samples to database with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_4FD0()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController could not force cloud sync after saving activity move mode on phone: %{public}@", v2, v3, v4, v5, v6);
}

void sub_5038()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController could not force nano sync after saving activity move mode on phone: %{public}@", v2, v3, v4, v5, v6);
}

void sub_50A0()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to load dob with error: %@", v2, v3, v4, v5, v6);
}

void sub_5108()
{
  sub_4D70();
  sub_4D54(&dword_0, v0, v1, "HPRFHealthAppsSettingsController failed to load wheelchair status with error: %@", v2, v3, v4, v5, v6);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t FIActivityAnalyticsSubmission()
{
  return _FIActivityAnalyticsSubmission();
}

uint64_t FIActivityMoveModeAnalyticsSendActivityMoveModeSwitchedInSettings()
{
  return _FIActivityMoveModeAnalyticsSendActivityMoveModeSwitchedInSettings();
}

uint64_t FIActivityMoveModeChangeSampleForDateComponents()
{
  return _FIActivityMoveModeChangeSampleForDateComponents();
}

uint64_t FIAgeInYearsForDateOfBirth()
{
  return _FIAgeInYearsForDateOfBirth();
}

uint64_t FICMotionConditionForWheelchairUse()
{
  return _FICMotionConditionForWheelchairUse();
}

uint64_t FIDefaultExerciseGoalQuantityForActivityMoveMode()
{
  return _FIDefaultExerciseGoalQuantityForActivityMoveMode();
}

uint64_t FIDefaultStandGoalQuantityForActivityMoveMode()
{
  return _FIDefaultStandGoalQuantityForActivityMoveMode();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return _FIIsActivePairedDeviceSatellitePaired();
}

uint64_t FISaveGoalsForNewActivityMoveMode()
{
  return _FISaveGoalsForNewActivityMoveMode();
}

uint64_t FIUIActivityLevelsForBMR()
{
  return _FIUIActivityLevelsForBMR();
}

uint64_t FIUIActivityLevelsForFitnessJr()
{
  return _FIUIActivityLevelsForFitnessJr();
}

uint64_t FIUICalculateBMR()
{
  return _FIUICalculateBMR();
}

uint64_t FIUIHealthStoreForDevice()
{
  return _FIUIHealthStoreForDevice();
}

uint64_t FIUIUserHasExistingMoveGoal()
{
  return _FIUIUserHasExistingMoveGoal();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__creationDate(void *a1, const char *a2, ...)
{
  return [a1 _creationDate];
}

id objc_msgSend__fitnessJrSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _fitnessJrSpecifiers];
}

id objc_msgSend__groupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _groupSpecifiers];
}

id objc_msgSend__loadFitnessJrValue(void *a1, const char *a2, ...)
{
  return [a1 _loadFitnessJrValue];
}

id objc_msgSend__loadIsActivitySetup(void *a1, const char *a2, ...)
{
  return [a1 _loadIsActivitySetup];
}

id objc_msgSend__shouldShowFitnessJrSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFitnessJrSpecifier];
}

id objc_msgSend__triggerCloudSync(void *a1, const char *a2, ...)
{
  return [a1 _triggerCloudSync];
}

id objc_msgSend__triggerNanoSync(void *a1, const char *a2, ...)
{
  return [a1 _triggerNanoSync];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_activePairedWatchHasSmartFitnessCoaching(void *a1, const char *a2, ...)
{
  return [a1 activePairedWatchHasSmartFitnessCoaching];
}

id objc_msgSend_alertingMode(void *a1, const char *a2, ...)
{
  return [a1 alertingMode];
}

id objc_msgSend_biologicalSex(void *a1, const char *a2, ...)
{
  return [a1 biologicalSex];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateOfBirth(void *a1, const char *a2, ...)
{
  return [a1 dateOfBirth];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternalInstall];
}

id objc_msgSend_isWheelchairUser(void *a1, const char *a2, ...)
{
  return [a1 isWheelchairUser];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leanBodyMass(void *a1, const char *a2, ...)
{
  return [a1 leanBodyMass];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_populateExistingCharacteristics(void *a1, const char *a2, ...)
{
  return [a1 populateExistingCharacteristics];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_wheelchairUseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wheelchairUseWithError:");
}