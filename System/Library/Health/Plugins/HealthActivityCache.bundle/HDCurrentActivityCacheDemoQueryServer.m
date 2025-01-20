@interface HDCurrentActivityCacheDemoQueryServer
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)shouldObserveActivityCache;
- (void)_queue_start;
@end

@implementation HDCurrentActivityCacheDemoQueryServer

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (BOOL)shouldObserveActivityCache
{
  return 0;
}

- (void)_queue_start
{
  v28.receiver = self;
  v28.super_class = (Class)HDCurrentActivityCacheDemoQueryServer;
  [(HDCurrentActivityCacheQueryServer *)&v28 _queue_start];
  v3 = +[HKUnit kilocalorieUnit];
  v4 = +[HKUnit minuteUnit];
  uint64_t v5 = +[NSDate date];
  v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = _HKActivityCacheDateComponentsFromDate();
  v24 = (void *)v5;
  v8 = [v6 startOfDayForDate:v5];
  v9 = [v6 dateByAddingUnit:16 value:1 toDate:v8 options:0];
  uint64_t v10 = [v6 startOfDayForDate:v9];

  v11 = +[NSUUID UUID];
  v22 = (void *)v10;
  v23 = (void *)v7;
  v12 = +[HKActivityCache _activityCacheWithUUID:v11 startDate:v8 endDate:v10 dateComponents:v7 sequence:1];

  v26 = v3;
  v13 = sub_10420((uint64_t)self, (uint64_t)HKQuantityTypeIdentifierActiveEnergyBurned, v3);
  v14 = sub_10420((uint64_t)self, (uint64_t)HKQuantityTypeIdentifierAppleMoveTime, v4);
  v25 = v4;
  v15 = sub_10420((uint64_t)self, (uint64_t)HKQuantityTypeIdentifierAppleExerciseTime, v4);
  v16 = sub_1069C((uint64_t)self);
  v17 = [(HDCurrentActivityCacheDemoQueryServer *)self clientProxy];
  v18 = [v17 remoteObjectProxy];

  _HKInitializeLogging();
  v19 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_E6CC, v19, OS_LOG_TYPE_INFO, "Delivering demo Activity Statistics", buf, 2u);
  }
  v20 = objc_opt_new();
  [v20 setCurrentActivityCache:v12];
  [v20 setActiveEnergyResults:v13];
  [v20 setAppleMoveTimeResults:v14];
  [v20 setAppleExerciseTimeResults:v15];
  [v20 setAppleStandHourResults:v16];
  v21 = [(HDCurrentActivityCacheDemoQueryServer *)self queryUUID];
  objc_msgSend(v18, "client_deliverQueryResult:queryUUID:", v20, v21);
}

@end