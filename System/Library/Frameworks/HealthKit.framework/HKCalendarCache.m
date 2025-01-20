@interface HKCalendarCache
+ (id)earliestTimeZoneCalendar;
+ (id)latestTimeZoneCalendar;
- (HKCalendarCache)init;
- (id)calendarForTimeZone:(id)a3;
- (id)currentCalendar;
- (void)_test_setCurrentCalendar:(id)a3;
@end

@implementation HKCalendarCache

- (HKCalendarCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKCalendarCache;
  v2 = [(HKCalendarCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    calendarsByTimeZoneName = v2->_calendarsByTimeZoneName;
    v2->_calendarsByTimeZoneName = v3;
  }
  return v2;
}

- (id)calendarForTimeZone:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKCalendarCache.m", 29, @"Invalid parameter not satisfying: %@", @"timeZone != nil" object file lineNumber description];
  }
  calendarsByTimeZoneName = self->_calendarsByTimeZoneName;
  v7 = [v5 name];
  v8 = [(NSMutableDictionary *)calendarsByTimeZoneName objectForKeyedSubscript:v7];

  if (!v8)
  {
    _HKInitializeLogging();
    v9 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG)) {
      [(HKCalendarCache *)v9 calendarForTimeZone:(uint64_t)v5];
    }
    v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    [v8 setTimeZone:v5];
    v10 = self->_calendarsByTimeZoneName;
    v11 = [v5 name];
    [(NSMutableDictionary *)v10 setObject:v8 forKeyedSubscript:v11];
  }

  return v8;
}

- (id)currentCalendar
{
  test_currentCalendar = self->_test_currentCalendar;
  if (test_currentCalendar)
  {
    v3 = test_currentCalendar;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    objc_super v6 = [v5 timeZone];
    v3 = [(HKCalendarCache *)self calendarForTimeZone:v6];
  }

  return v3;
}

+ (id)earliestTimeZoneCalendar
{
  if (earliestTimeZoneCalendar_onceToken != -1) {
    dispatch_once(&earliestTimeZoneCalendar_onceToken, &__block_literal_global_138);
  }
  v2 = (void *)earliestTimeZoneCalendar_calendar;

  return v2;
}

void __43__HKCalendarCache_earliestTimeZoneCalendar__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v1 = (void *)earliestTimeZoneCalendar_calendar;
  earliestTimeZoneCalendar_calendar = v0;

  v2 = (void *)earliestTimeZoneCalendar_calendar;
  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:-43200];
  [v2 setTimeZone:v3];
}

+ (id)latestTimeZoneCalendar
{
  if (latestTimeZoneCalendar_onceToken[0] != -1) {
    dispatch_once(latestTimeZoneCalendar_onceToken, &__block_literal_global_18_1);
  }
  v2 = (void *)latestTimeZoneCalendar_calendar;

  return v2;
}

void __41__HKCalendarCache_latestTimeZoneCalendar__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v1 = (void *)latestTimeZoneCalendar_calendar;
  latestTimeZoneCalendar_calendar = v0;

  v2 = (void *)latestTimeZoneCalendar_calendar;
  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:50400];
  [v2 setTimeZone:v3];
}

- (void)_test_setCurrentCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_currentCalendar, 0);

  objc_storeStrong((id *)&self->_calendarsByTimeZoneName, 0);
}

- (void)calendarForTimeZone:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  int v7 = 138543874;
  id v8 = (id)objc_opt_class();
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  id v6 = v8;
  _os_log_debug_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@.%p] Creating new calendar for time zone: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end