id sub_4228(void *a1, int a2)
{
  CFStringRef v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  if (a2) {
    v2 = @"SELECTED_";
  }
  else {
    v2 = &stru_8298;
  }
  v3 = a1;
  v4 = +[NSString stringWithFormat:@"%@DEEP_BREATHING_BREATH_RATE", v2];
  v5 = [v3 substringFromIndex:objc_msgSend(@"ID_BPM_", "length")];

  v6 = [v5 integerValue];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:v4 value:&stru_8298 table:@"DeepBreathingBreathRate"];
  v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);

  return v9;
}

void deepBreathingBreathRateDidChange(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Breath rate did change; reloading specifiers", v4, 2u);
  }
  [v2 reloadSpecifiers];
}

id sub_4B3C(void *a1)
{
  v11[0] = @"NONE_ID";
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"DEEP_BREATHING_HAPTIC_LEVEL_NONE" value:&stru_8298 table:@"DeepBreathingHapticLevel"];
  v12[0] = v3;
  v11[1] = @"MINIMAL_ID";
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DEEP_BREATHING_HAPTIC_LEVEL_MINIMAL" value:&stru_8298 table:@"DeepBreathingHapticLevel"];
  v12[1] = v5;
  v11[2] = @"PROMINENT_ID";
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DEEP_BREATHING_HAPTIC_LEVEL_PROMINENT" value:&stru_8298 table:@"DeepBreathingHapticLevel"];
  v12[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  v9 = [v8 objectForKey:v1];

  return v9;
}

void deepBreathingHapticLevelDidChange(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Haptic level did change; reloading specifiers", v4, 2u);
  }
  [v2 reloadSpecifiers];
}

void deepBreathingPreferencesDidChange(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  _HKInitializeLogging();
  v5 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Did receive %@; reloading specifiers", (uint8_t *)&v6, 0xCu);
  }
  [v4 reloadSpecifiers];
}

id sub_5CE0(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v4 = +[_HKBehavior activePairedWatchHasSmartFitnessCoaching];
  CFStringRef v5 = @"DEEP_BREATHING_REMINDER_FREQUENCY";
  if (v4) {
    CFStringRef v5 = @"DEEP_BREATHING_REMINDERS_PER_DAY";
  }
  CFStringRef v6 = @"SELECTED_";
  if (!a2) {
    CFStringRef v6 = &stru_8298;
  }
  uint64_t v7 = +[NSString stringWithFormat:@"%@%@", v6, v5];
  unsigned int v8 = +[_HKBehavior activePairedWatchHasSmartFitnessCoaching];
  uint64_t v9 = (uint64_t)[v3 integerValue];

  if (!v8) {
    v9 /= 3600;
  }
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:v7 value:&stru_8298 table:@"DeepBreathingReminderFrequency"];
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v9);

  return v12;
}

void deepBreathingReminderFrequencyDidChange(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reminder frequency did change; reloading specifiers", v4, 2u);
  }
  [v2 reloadSpecifiers];
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t FIUIDeepBreathingReminderFrequencyOptions()
{
  return _FIUIDeepBreathingReminderFrequencyOptions();
}

uint64_t FIUIDeepBreathingRemindersPerDayOptions()
{
  return _FIUIDeepBreathingRemindersPerDayOptions();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__selectedReminderFrequency(void *a1, const char *a2, ...)
{
  return [a1 _selectedReminderFrequency];
}

id objc_msgSend__selectedRemindersPerDay(void *a1, const char *a2, ...)
{
  return [a1 _selectedRemindersPerDay];
}

id objc_msgSend_activePairedWatchHasSmartFitnessCoaching(void *a1, const char *a2, ...)
{
  return [a1 activePairedWatchHasSmartFitnessCoaching];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedNotificationMuteSettingsManager(void *a1, const char *a2, ...)
{
  return [a1 sharedNotificationMuteSettingsManager];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}