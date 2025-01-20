@interface CalChronometry
+ (id)activeCalendar;
+ (id)activeTimeZone;
+ (id)currentLanguageCode;
+ (id)currentLocationCode;
+ (void)_configureChronometry;
+ (void)_currentLocaleDidChange:(id)a3;
+ (void)_currentTimeZoneDidChange:(id)a3;
+ (void)_resetTodayRolloverTimer;
+ (void)_todayRolloverTimerFired;
+ (void)_updateActiveCalendar;
+ (void)_updateActiveTimeZone;
+ (void)_updateEveything;
+ (void)_updateForLocaleChange;
+ (void)initialize;
+ (void)setActiveTimeZone:(id)a3;
@end

@implementation CalChronometry

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 _configureChronometry];
  }
}

+ (void)_configureChronometry
{
  if ((_configureChronometry___DidInitialize & 1) == 0)
  {
    _configureChronometry___DidInitialize = 1;
    [a1 _updateActiveCalendar];
    +[CalDateLocalization initializeFormatters];
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:a1 selector:sel__currentTimeZoneDidChange_ name:*MEMORY[0x1E4F1C4F8] object:0];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:a1 selector:sel__resetTodayRolloverTimer name:*MEMORY[0x1E4F1C4F0] object:0];
  }
}

+ (void)_currentLocaleDidChange:(id)a3
{
  [a1 cancelPreviousPerformRequestsWithTarget:a1 selector:sel__updateForLocaleChange object:0];

  [a1 performSelector:sel__updateForLocaleChange withObject:0 afterDelay:0.5];
}

+ (void)_updateForLocaleChange
{
  [a1 _updateEveything];
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"com.apple.calendar.LocaleChanged" object:0];
}

+ (void)_currentTimeZoneDidChange:(id)a3
{
  objc_msgSend(a1, "_updateActiveTimeZone", a3);

  [a1 _resetTodayRolloverTimer];
}

+ (void)_updateEveything
{
  [a1 _updateActiveCalendar];
  +[CalDateLocalization rebuildFormatters];

  +[CalDateLocalization rebuildWeekendDays];
}

+ (id)activeTimeZone
{
  return (id)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
}

+ (void)setActiveTimeZone:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v4 = [a1 activeTimeZone];
    char v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      [MEMORY[0x1E4F1CAF0] setDefaultTimeZone:v6];
      [a1 _updateActiveTimeZone];
      [a1 _resetTodayRolloverTimer];
    }
  }
}

+ (void)_updateActiveTimeZone
{
  [a1 _updateActiveCalendar];
  +[CalDateLocalization rebuildFormatters];
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:@"com.apple.calendar.TimeZoneChanged" object:0];
}

+ (void)_updateActiveCalendar
{
  id obj = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (!obj) {
    abort();
  }
  id v3 = a1;
  objc_sync_enter(v3);
  if ((id)__ActiveCalendar != obj)
  {
    objc_storeStrong((id *)&__ActiveCalendar, obj);
    v4 = (void *)__ActiveCalendar;
    char v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v4 setLocale:v5];

    id v6 = (void *)__ActiveCalendar;
    v7 = [v3 activeTimeZone];
    [v6 setTimeZone:v7];
  }
  objc_sync_exit(v3);
}

+ (id)activeCalendar
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)__ActiveCalendar;
  objc_sync_exit(v2);

  return v3;
}

+ (id)currentLocationCode
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 localeIdentifier];

  v4 = [v3 componentsSeparatedByString:@"_"];
  if ((unint64_t)[v4 count] < 2)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [v4 objectAtIndex:1];
  }

  return v5;
}

+ (id)currentLanguageCode
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 localeIdentifier];

  v4 = [v3 componentsSeparatedByString:@"_"];
  if ((unint64_t)[v4 count] < 2)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v4 objectAtIndex:0];
  }
  id v6 = v5;

  return v6;
}

+ (void)_resetTodayRolloverTimer
{
  [(id)_todayRolloverTimer invalidate];
  id v3 = (void *)_todayRolloverTimer;
  _todayRolloverTimer = 0;

  v4 = [a1 activeTimeZone];
  id v5 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  char v6 = [v4 isEquivalentTo:v5];

  if ((v6 & 1) == 0)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v16 setDay:1];
    v7 = [a1 activeCalendar];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [v7 dateByAddingComponents:v16 toDate:v8 options:0];

    v10 = [v7 components:30 fromDate:v9];
    v11 = [v7 dateFromComponents:v10];
    v12 = (void *)MEMORY[0x1E4F1CB00];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:v13];
    uint64_t v14 = objc_msgSend(v12, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__todayRolloverTimerFired, 0, 0);
    v15 = (void *)_todayRolloverTimer;
    _todayRolloverTimer = v14;
  }
}

+ (void)_todayRolloverTimerFired
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CalChronometryTodayChangedNotification" object:0];

  [a1 _resetTodayRolloverTimer];
}

@end