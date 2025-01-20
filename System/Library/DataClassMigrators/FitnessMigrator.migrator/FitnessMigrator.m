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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__getDataMigrationVersion(void *a1, const char *a2, ...)
{
  return [a1 _getDataMigrationVersion];
}

id objc_msgSend__migrateDefaultPaceForOutdoorRunningAndCycling(void *a1, const char *a2, ...)
{
  return [a1 _migrateDefaultPaceForOutdoorRunningAndCycling];
}

id objc_msgSend__migrateUnsupportedDeepBreathingReminderFrequency(void *a1, const char *a2, ...)
{
  return [a1 _migrateUnsupportedDeepBreathingReminderFrequency];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}
gration complete"", (uint8_t *)&v8, 2u);
  }
  return 1;
}

- (void)_setDataMigrationVersion:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.FitnessMigrator"];
  [v4 setInteger:a3 forKey:@"CurrentDataVersion"];
}

- (int64_t)_getDataMigrationVersion
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.FitnessMigrator"];
  id v3 = [v2 integerForKey:@"CurrentDataVersion"];

  return (int64_t)v3;
}

- (void)_migrateDefaultPaceForOutdoorRunningAndCycling
{
}

- (void)_migrateUnsupportedDeepBreathingReminderFrequency
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v2 = (const __CFString *)kNLDeepBreathingPreferencesDomain;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ReminderFrequency", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CFIndex v4 = AppIntegerValue;
    v5 = FIUIDeepBreathingReminderFrequencyOptions();
    v6 = +[NSNumber numberWithInteger:v4];
    unsigned __int8 v7 = [v5 containsObject:v6];

    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      v8 = (void *)HKLogDeepBreathing;
      if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = +[NSNumber numberWithInteger:v4];
        v11 = +[NSNumber numberWithInteger:18000];
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[FitnessMigrator] Found invalid ReminderFrequency value of %{public}@, migrating to %{public}@", buf, 0x16u);
      }
      CFPreferencesSetAppValue(@"ReminderFrequency", +[NSNumber numberWithInteger:18000], v2);
      id v12 = objc_alloc_init((Class)NPSManager);
      v13 = +[NSSet setWithObject:@"ReminderFrequency"];
      [v12 synchronizeNanoDomain:v2 keys:v13];
    }
  }
}

@end