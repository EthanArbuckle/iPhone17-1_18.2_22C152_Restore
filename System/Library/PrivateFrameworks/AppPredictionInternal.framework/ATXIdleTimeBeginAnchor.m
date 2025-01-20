@interface ATXIdleTimeBeginAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)minimumSecondsForBeingIdle;
+ (double)secondsOfInfluence;
+ (double)weightedAverageOfHoursFromDates:(id)a3;
+ (id)anchorOccurenceDateFromDuetEvent:(id)a3;
+ (id)duetEventsPredicates;
+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)keyPathForContextStore;
+ (id)longDescription;
+ (id)predicateForContextStoreRegistration;
+ (id)predictNextAnchorOccurrenceDate;
+ (id)sampleEvent;
+ (int64_t)anchorType;
+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5;
@end

@implementation ATXIdleTimeBeginAnchor

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

  v13 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_43);

  return v13;
}

uint64_t __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 endDate];
  uint64_t v3 = +[_ATXActionUtils localHourOfDayFromDate:v2];

  double v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1(v3, v4);
  }

  return 1;
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 startDate];

  id v7 = (void *)[v5 initWithTimeInterval:v6 sinceDate:-10800.0];
  return v7;
}

+ (int64_t)anchorType
{
  return 3;
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
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [a1 predictNextAnchorOccurrenceDate];
  v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = a1;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Inference (%@): Setting up XPC activity for IdleTimeBegin Anchor to fire at %@...", buf, 0x16u);
  }

  v10 = objc_opt_new();
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v12);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x1E4F141A8], 60);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v13, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x1E4F142F8], 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__ATXIdleTimeBeginAnchor_registerForNotificationsWithoutUsingContextStoreForObserver_enterSelector_exitSelector___block_invoke;
  v16[3] = &unk_1E68AD9E0;
  id v17 = v7;
  SEL v18 = a4;
  id v14 = v7;
  xpc_activity_register("com.apple.duetexpertd.idle_time_begin_trigger", v13, v16);
  v15 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = a1;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Inference (%@): Done setting up XPC activity for IdleTimeBegin Anchor.", buf, 0xCu);
  }
}

void __113__ATXIdleTimeBeginAnchor_registerForNotificationsWithoutUsingContextStoreForObserver_enterSelector_exitSelector___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    id v4 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Triggering IdleTimeBegin Anchor based on prescheduled XPC Activity.", v7, 2u);
    }

    id v5 = (void *)MEMORY[0x1D25F6CC0]();
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      ((void (*)(void, void))[v6 methodForSelector:*(void *)(a1 + 40)])(*(void *)(a1 + 32), *(void *)(a1 + 40));
    }
  }
}

+ (id)predictNextAnchorOccurrenceDate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = [v3 historicalAnchorOccurrenceDatesForAnchor:v4];

  [a1 weightedAverageOfHoursFromDates:v5];
  long double v7 = v6;
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = objc_opt_new();
  v10 = [v8 components:62 fromDate:v9];

  double v11 = fmod(v7, 24.0);
  long double v12 = fmod(v7, 1.0) * 60.0;
  [v10 setHour:(uint64_t)v11];
  [v10 setMinute:(uint64_t)v12];
  xpc_object_t v13 = [v8 dateFromComponents:v10];
  [v13 timeIntervalSinceNow];
  if (v14 < -10.0)
  {
    uint64_t v15 = [v8 dateByAddingUnit:16 value:1 toDate:v13 options:0];

    xpc_object_t v13 = (void *)v15;
  }
  v16 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    v19 = v13;
    __int16 v20 = 2048;
    long double v21 = v7;
    _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Prediction: %@ (%.3f)", (uint8_t *)&v18, 0x16u);
  }

  return v13;
}

+ (double)weightedAverageOfHoursFromDates:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke;
  v18[3] = &unk_1E68ADA08;
  id v5 = v4;
  id v19 = v5;
  uint64_t v20 = 96;
  double v6 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v18);
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  double v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke_2;
  v9[3] = &unk_1E68ADA30;
  v9[4] = &v14;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  double v7 = v15[3] / (v11[3] + 1.0e-12);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

id __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) components:*(void *)(a1 + 40) fromDate:a2];
  double v3 = (double)[v2 hour];
  double v4 = (double)[v2 minute] / 60.0 + v3;
  if (v4 < 12.0) {
    double v4 = v4 + 24.0;
  }
  id v5 = [NSNumber numberWithDouble:v4];

  return v5;
}

double __58__ATXIdleTimeBeginAnchor_weightedAverageOfHoursFromDates___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = pow(0.9, (double)a3);
  [a2 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + v6 * v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v5 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

+ (id)keyPathForContextStore
{
  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  return 1;
}

+ (id)sampleEvent
{
  v2 = [ATXScreenLockStateDuetEvent alloc];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
  double v4 = objc_opt_new();
  double v5 = [(ATXScreenLockStateDuetEvent *)v2 initWithScreenLockState:0 startDate:v3 endDate:v4];

  return v5;
}

void __73__ATXIdleTimeBeginAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "IdleTimeBegin Anchor occurred at local hour: %ld", (uint8_t *)&v2, 0xCu);
}

@end