@interface HDActivityCacheManager
- (HDActivityCacheManager)initWithProfile:(id)a3;
- (HKActivityCache)currentActivityCache;
- (HKActivityCache)yesterdayActivityCache;
- (NSDate)dateOverride;
- (NSTimeZone)timeZoneOverride;
- (id)calendar;
- (void)_didReceiveSignificantTimeChangeNotification;
- (void)_userCharacteristicsDidChangeNotification:(id)a3;
- (void)accessStatisticsBuilderWithCacheIndex:(int64_t)a3 handler:(id)a4;
- (void)addActivityCacheObserver:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeActivityCacheObserver:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setCurrentActivityCacheOverrideDate:(id)a3 timeZone:(id)a4 completion:(id)a5;
- (void)setDateOverride:(id)a3;
- (void)setTimeZoneOverride:(id)a3;
@end

@implementation HDActivityCacheManager

- (HDActivityCacheManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)HDActivityCacheManager;
  v5 = [(HDActivityCacheManager *)&v55 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    observerQueue = v6->_observerQueue;
    v6->_observerQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[HKObjectType calorieGoal];
    calorieGoalType = v6->_calorieGoalType;
    v6->_calorieGoalType = (HKQuantityType *)v11;

    uint64_t v13 = +[HKObjectType moveMinuteGoal];
    moveMinuteGoalType = v6->_moveMinuteGoalType;
    v6->_moveMinuteGoalType = (HKQuantityType *)v13;

    uint64_t v15 = +[HKObjectType exerciseGoal];
    exerciseGoalType = v6->_exerciseGoalType;
    v6->_exerciseGoalType = (HKQuantityType *)v15;

    uint64_t v17 = +[HKObjectType standGoal];
    standGoalType = v6->_standGoalType;
    v6->_standGoalType = (HKQuantityType *)v17;

    uint64_t v19 = +[HKObjectType activityMoveModeChangeType];
    activityMoveModeChangeType = v6->_activityMoveModeChangeType;
    v6->_activityMoveModeChangeType = (HKCategoryType *)v19;

    uint64_t v21 = +[HKObjectType pauseRingsScheduleType];
    pauseRingsScheduleType = v6->_pauseRingsScheduleType;
    v6->_pauseRingsScheduleType = (HKSampleType *)v21;

    uint64_t v23 = +[HKObjectType activityGoalScheduleType];
    activityGoalScheduleType = v6->_activityGoalScheduleType;
    v6->_activityGoalScheduleType = (HKSampleType *)v23;

    v48 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    id v49 = v4;
    v25 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
    v26 = +[HKObjectType briskMinuteDataType];
    v27 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    v28 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    v29 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    v30 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierPushCount];
    v31 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    uint64_t v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, v25, v26, v27, v28, v29, v30, v31, 0);
    allQuantityTypes = v6->_allQuantityTypes;
    v6->_allQuantityTypes = (NSSet *)v32;

    id v4 = v49;
    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    goalsByIndex = v6->_goalsByIndex;
    v6->_goalsByIndex = v34;

    objc_initWeak(&location, v6);
    id v36 = objc_alloc((Class)_HKDelayedOperation);
    v37 = v6->_queue;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_6260;
    v52[3] = &unk_34898;
    objc_copyWeak(&v53, &location);
    v38 = (_HKDelayedOperation *)[v36 initWithQueue:v37 delay:v52 block:5.0];
    updateCachesOperation = v6->_updateCachesOperation;
    v6->_updateCachesOperation = v38;

    id v40 = objc_alloc((Class)_HKDelayedOperation);
    v41 = v6->_queue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_6484;
    v50[3] = &unk_34898;
    objc_copyWeak(&v51, &location);
    v42 = (_HKDelayedOperation *)[v40 initWithQueue:v41 delay:v50 block:5.0];
    rebuildCachesOperation = v6->_rebuildCachesOperation;
    v6->_rebuildCachesOperation = v42;

    uint64_t v44 = +[NSHashTable weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v44;

    v6->_hasSubscribedToSignificantTimeChangeNotifications = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:v6->_queue];

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  [(HDActivityCacheDataSource *)self->_dataSource invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  [v4 removeProtectedDataObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [v5 dataManager];

  [v6 removeObserver:self forDataType:self->_calorieGoalType];
  [v6 removeObserver:self forDataType:self->_moveMinuteGoalType];
  [v6 removeObserver:self forDataType:self->_exerciseGoalType];
  [v6 removeObserver:self forDataType:self->_standGoalType];
  [v6 removeObserver:self forDataType:self->_activityMoveModeChangeType];
  [v6 removeObserver:self forDataType:self->_pauseRingsScheduleType];
  [v6 removeObserver:self forDataType:self->_activityGoalScheduleType];
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  notify_cancel(self->_rebuildCacheNotificationToken);

  v9.receiver = self;
  v9.super_class = (Class)HDActivityCacheManager;
  [(HDActivityCacheManager *)&v9 dealloc];
}

- (void)setCurrentActivityCacheOverrideDate:(id)a3 timeZone:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6808;
  v15[3] = &unk_348C0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (id)calendar
{
  if (a1)
  {
    v2 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    v3 = sub_BAC0(a1);
    [v2 setTimeZone:v3];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_BBA0;
  v8[3] = &unk_349C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&def_E6CC, v6, OS_LOG_TYPE_DEFAULT, "Samples (%{public}@) were removed, rebuilding caches", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BDCC;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_didReceiveSignificantTimeChangeNotification
{
  _HKInitializeLogging();
  v3 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_E6CC, v3, OS_LOG_TYPE_DEFAULT, "Received significant time change", buf, 2u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C1A4;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_userCharacteristicsDidChangeNotification:" name:HDUserCharacteristicsDidChangeNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained database];
  [v6 addProtectedDataObserver:self queue:self->_queue];

  sub_BDD8((uint64_t)self);
  sub_BED4((uint64_t)self);

  sub_6330((uint64_t)self);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    sub_6330((uint64_t)self);
  }
}

- (HKActivityCache)currentActivityCache
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_B680;
  id v10 = sub_B690;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C5C0;
  v5[3] = &unk_34A38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivityCache *)v3;
}

- (HKActivityCache)yesterdayActivityCache
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_B680;
  id v10 = sub_B690;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C6C4;
  v5[3] = &unk_34A38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKActivityCache *)v3;
}

- (void)accessStatisticsBuilderWithCacheIndex:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C780;
  block[3] = &unk_34A60;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)addActivityCacheObserver:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
    sub_23240();
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C914;
  v7[3] = &unk_349C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeActivityCacheObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CAAC;
  v7[3] = &unk_349C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_userCharacteristicsDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CFC0;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSDate)dateOverride
{
  return self->_dateOverride;
}

- (void)setDateOverride:(id)a3
{
}

- (NSTimeZone)timeZoneOverride
{
  return self->_timeZoneOverride;
}

- (void)setTimeZoneOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneOverride, 0);
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rebuildCachesOperation, 0);
  objc_storeStrong((id *)&self->_updateCachesOperation, 0);
  objc_storeStrong((id *)&self->_pauseRingsScheduleType, 0);
  objc_storeStrong((id *)&self->_yesterdayActivityMoveModeChangeSample, 0);
  objc_storeStrong((id *)&self->_todayActivityMoveModeChangeSample, 0);
  objc_storeStrong((id *)&self->_activityMoveModeChangeType, 0);
  objc_storeStrong((id *)&self->_activityGoalScheduleType, 0);
  objc_storeStrong((id *)&self->_goalsByIndex, 0);
  objc_storeStrong((id *)&self->_allQuantityTypes, 0);
  objc_storeStrong((id *)&self->_standGoalType, 0);
  objc_storeStrong((id *)&self->_exerciseGoalType, 0);
  objc_storeStrong((id *)&self->_moveMinuteGoalType, 0);
  objc_storeStrong((id *)&self->_calorieGoalType, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_localDeviceSourceEntity, 0);
  objc_storeStrong((id *)&self->_yesterdayHeartRateSummary, 0);
  objc_storeStrong((id *)&self->_todayHeartRateSummary, 0);
  objc_storeStrong((id *)&self->_existingTodayActivityCache, 0);
  objc_storeStrong((id *)&self->_existingYesterdayActivityCache, 0);
  objc_storeStrong((id *)&self->_yesterdayDateInterval, 0);
  objc_storeStrong((id *)&self->_todayDateInterval, 0);
  objc_storeStrong((id *)&self->_currentTimeZone, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end