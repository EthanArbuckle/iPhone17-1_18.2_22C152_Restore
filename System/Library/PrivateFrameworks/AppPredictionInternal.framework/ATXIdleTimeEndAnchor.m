@interface ATXIdleTimeEndAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)minimumSecondsForBeingIdle;
+ (double)secondsOfInfluence;
+ (id)duetEventsPredicates;
+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)keyPathForContextStore;
+ (id)longDescription;
+ (id)predicateForContextStoreRegistration;
+ (id)sampleEvent;
+ (int64_t)anchorType;
+ (void)shouldProcessContextStoreNotification;
@end

@implementation ATXIdleTimeEndAnchor

+ (double)minimumSecondsForBeingIdle
{
  v2 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v2 idleTimeEndAnchorMinimumSecondsForBeingIdle];
  double v4 = v3;

  return v4;
}

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithIntegerValue:1];
  v7[0] = v2;
  double v3 = (void *)MEMORY[0x1E4F5B5D0];
  [(id)objc_opt_class() minimumSecondsForBeingIdle];
  double v4 = objc_msgSend(v3, "predicateForEventsWithMinimumDuration:");
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = [(id)objc_opt_class() duetEventsPredicates];
  v10 = (void *)[v8 initWithArray:v9];

  [(id)objc_opt_class() supportedDuetDataProviderClass];
  v11 = objc_opt_new();
  v12 = [v11 fetchEventsBetweenStartDate:v7 andEndDate:v6 withPredicates:v10];

  v13 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_172);

  return v13;
}

BOOL __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 endDate];
  uint64_t v3 = +[_ATXActionUtils localHourOfDayFromDate:v2];

  double v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_3(v3, v4);
  }

  unint64_t v5 = v3 - 4;
  id v6 = __atxlog_handle_anchor();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 >= 8)
  {
    if (v7) {
      __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_2();
    }
  }
  else if (v7)
  {
    __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1();
  }

  return v5 < 8;
}

+ (int64_t)anchorType
{
  return 4;
}

+ (id)longDescription
{
  return @"The user hasn't used their device for a prolonged period of time. Likely after waking up in the morning.";
}

+ (double)secondsOfInfluence
{
  return 10800.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 0;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForDeviceLockStatus];
}

+ (id)predicateForContextStoreRegistration
{
  v2 = (void *)MEMORY[0x1E4F5B6E8];
  uint64_t v3 = [(id)objc_opt_class() keyPathForContextStore];
  [(id)objc_opt_class() minimumSecondsForBeingIdle];
  double v4 = objc_msgSend(v2, "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v3, &unk_1F27F1D28);

  return v4;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  if (![(id)objc_opt_class() shouldProcessContextStoreNotificationForNumber]) {
    return 0;
  }
  v2 = objc_opt_new();
  uint64_t v3 = +[_ATXActionUtils localHourOfDayFromDate:v2];

  double v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification];
  }

  unint64_t v5 = v3 - 4;
  id v6 = __atxlog_handle_anchor();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  BOOL v8 = v5 >= 8;
  BOOL v9 = v5 < 8;
  if (v8)
  {
    if (v7) {
      +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification]();
    }
  }
  else if (v7)
  {
    +[ATXIdleTimeEndAnchor shouldProcessContextStoreNotification]();
  }

  return v9;
}

+ (BOOL)isActive
{
  return 1;
}

+ (id)sampleEvent
{
  v2 = [ATXScreenLockStateDuetEvent alloc];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
  double v4 = objc_opt_new();
  unint64_t v5 = [(ATXScreenLockStateDuetEvent *)v2 initWithScreenLockState:0 startDate:v3 endDate:v4];

  return v5;
}

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Counting IdleTimeEnd Anchor occurrence because it's in the acceptable time window.", v2, v3, v4, v5, v6);
}

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Not counting IdleTimeEnd Anchor occurrence because it's either too early or too late.", v2, v3, v4, v5, v6);
}

void __71__ATXIdleTimeEndAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "IdleTimeEnd Anchor occurred at local hour: %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)shouldProcessContextStoreNotification
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "IdleTimeEnd Anchor fired at local hour: %ld", (uint8_t *)&v2, 0xCu);
}

@end