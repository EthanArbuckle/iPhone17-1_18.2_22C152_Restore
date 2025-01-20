@interface HDActivityCacheDataSource
- (BOOL)updateWithError:(id *)a3;
- (HDActivityCacheDataSource)initWithProfile:(id)a3 observedQuantityTypes:(id)a4 updateOperation:(id)a5 rebuildOperation:(id)a6 queue:(id)a7;
- (HDActivityCacheHeartRateStatisticsBuilder)previousDayHeartRateStatisticsBuilder;
- (HDActivityCacheHeartRateStatisticsBuilder)targetDayHeartRateStatisticsBuilder;
- (HDActivityCacheStatisticsBuilder)previousDayStatisticsBuilder;
- (HDActivityCacheStatisticsBuilder)targetDayStatisticsBuilder;
- (NSDate)activeDevicePairedDate;
- (NSDateInterval)previousDayDateInterval;
- (NSDateInterval)targetDayDateInterval;
- (NSSet)observedQuantityTypes;
- (NSString)previousDayStatisticsBuilderTag;
- (NSString)targetDayStatisticsBuilderTag;
- (id).cxx_construct;
- (id)activityCacheStatisticsBuilder:(id)a3 sourceOrderForObjectType:(id)a4;
- (int64_t)localDeviceSourceIdentifier;
- (int64_t)previousDayCacheIndex;
- (int64_t)targetDayCacheIndex;
- (void)_samplesAddedToWorkoutNotification:(id)a3;
- (void)invalidate;
- (void)pauseUpdates;
- (void)reportTargetDayHeartRateAnalytics;
- (void)resumeUpdates;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setActiveDevicePairedDate:(id)a3;
- (void)setPreviousDayCacheIndex:(int64_t)a3;
- (void)setPreviousDayDateInterval:(id)a3;
- (void)setPreviousDayStatisticsBuilderTag:(id)a3;
- (void)setTargetDayCacheIndex:(int64_t)a3;
- (void)setTargetDayDateInterval:(id)a3;
- (void)setTargetDayStatisticsBuilderTag:(id)a3;
@end

@implementation HDActivityCacheDataSource

- (HDActivityCacheDataSource)initWithProfile:(id)a3 observedQuantityTypes:(id)a4 updateOperation:(id)a5 rebuildOperation:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v41 = a5;
  id v14 = a6;
  id v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)HDActivityCacheDataSource;
  v16 = [(HDActivityCacheDataSource *)&v42 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v12);
    objc_storeStrong((id *)&v17->_queue, a7);
    objc_storeStrong((id *)&v17->_updateOperation, a5);
    objc_storeStrong((id *)&v17->_rebuildOperation, a6);
    uint64_t v18 = +[HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierAppleStandHour];
    standHoursType = v17->_standHoursType;
    v17->_standHoursType = (HKCategoryType *)v18;

    uint64_t v20 = +[HKObjectType deepBreathingSessionType];
    deepBreathingSessionType = v17->_deepBreathingSessionType;
    v17->_deepBreathingSessionType = (HKCategoryType *)v20;

    uint64_t v22 = +[HKObjectType workoutType];
    workoutType = v17->_workoutType;
    v17->_workoutType = (HKWorkoutType *)v22;

    uint64_t v24 = +[HKObjectType watchActivationType];
    watchActivationType = v17->_watchActivationType;
    v17->_watchActivationType = (HKCategoryType *)v24;

    uint64_t v26 = +[HKCategoryType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis];
    sleepAnalysisType = v17->_sleepAnalysisType;
    v17->_sleepAnalysisType = (HKCategoryType *)v26;

    uint64_t v28 = +[NSMutableArray array];
    unfrozenSeriesCache = v17->_unfrozenSeriesCache;
    v17->_unfrozenSeriesCache = (NSMutableArray *)v28;

    v30 = (NSSet *)[v13 copy];
    observedQuantityTypes = v17->_observedQuantityTypes;
    v17->_observedQuantityTypes = v30;

    v32 = +[NSMutableSet set];
    v33 = [v13 allObjects];
    [v32 addObjectsFromArray:v33];

    [v32 addObject:v17->_standHoursType];
    [v32 addObject:v17->_workoutType];
    [v32 addObject:v17->_watchActivationType];
    [v32 addObject:v17->_deepBreathingSessionType];
    v34 = [v12 daemon];
    v35 = [v34 behavior];
    v36 = [v35 features];
    unsigned int v37 = [v36 maskRestingHeartRateSamplesWithSleepSamples];

    if (v37) {
      [v32 addObject:v17->_sleepAnalysisType];
    }
    objc_storeStrong((id *)&v17->_allObservedTypes, v32);
    v38 = +[NSNotificationCenter defaultCenter];
    [v38 addObserver:v17 selector:"_samplesAddedToWorkoutNotification:" name:HDAssociationEntityDidReceiveSyncObjectsNotification object:0];

    v39 = +[NSNotificationCenter defaultCenter];
    [v39 addObserver:v17 selector:"_samplesAddedToWorkoutNotification:" name:HDHealthStoreServerDidAssociateWorkoutSamples object:0];

    -[HDActivityCacheDataSource resumeUpdates]_0((uint64_t)v17);
  }

  return v17;
}

- (void)resumeUpdates
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 320));
    v3 = [WeakRetained dataManager];

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = *(id *)(a1 + 112);
    id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObserver:forDataType:", a1, *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)invalidate
{
  -[HDActivityCacheDataSource pauseUpdates]_0((uint64_t)self);
  [(_HKDelayedOperation *)self->_updateOperation invalidate];
  rebuildOperation = self->_rebuildOperation;

  [(_HKDelayedOperation *)rebuildOperation invalidate];
}

- (void)pauseUpdates
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 320));
    v3 = [WeakRetained dataManager];

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = *(id *)(a1 + 112);
    id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "removeObserver:forDataType:", a1, *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)updateWithError:(id *)a3
{
  char v5 = sub_10F9C((uint64_t)self, a3);
  BOOL v6 = sub_114A8((uint64_t)self);
  return v5 & v6 & sub_1156C((uint64_t)self, a3);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12A94;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&def_E6CC, v6, OS_LOG_TYPE_DEFAULT, "Samples (%{public}@) were removed, rebuilding caches", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12BC8;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)localDeviceSourceIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained sourceManager];
  id v8 = 0;
  id v4 = [v3 localDeviceSourceWithError:&v8];
  id v5 = v8;

  if (v4)
  {
    id v6 = [v4 persistentID];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_239B0();
    }
    id v6 = (id)HDActivityCacheActiveSourceCalculatorDefaultBaseSourceIdentifier;
  }

  return (int64_t)v6;
}

- (id)activityCacheStatisticsBuilder:(id)a3 sourceOrderForObjectType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  long long v9 = [WeakRetained sourceOrderManager];
  id v13 = 0;
  id v10 = [v9 orderedSourceIDsForObjectType:v7 error:&v13];
  id v11 = v13;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_23A24();
    }
  }

  return v10;
}

- (void)_samplesAddedToWorkoutNotification:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogActivityCache;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&def_E6CC, v5, OS_LOG_TYPE_DEFAULT, "Added new samples to workout (%{public}@), rebuilding caches", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15E18;
  block[3] = &unk_349E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reportTargetDayHeartRateAnalytics
{
  targetDayHeartRateStatisticsBuilder = self->_targetDayHeartRateStatisticsBuilder;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[HDActivityCacheHeartRateStatisticsBuilder reportDailyAnalyticsWithProfile:](targetDayHeartRateStatisticsBuilder, "reportDailyAnalyticsWithProfile:");
}

- (HDActivityCacheStatisticsBuilder)targetDayStatisticsBuilder
{
  return self->_targetDayStatisticsBuilder;
}

- (HDActivityCacheStatisticsBuilder)previousDayStatisticsBuilder
{
  return self->_previousDayStatisticsBuilder;
}

- (HDActivityCacheHeartRateStatisticsBuilder)targetDayHeartRateStatisticsBuilder
{
  return self->_targetDayHeartRateStatisticsBuilder;
}

- (HDActivityCacheHeartRateStatisticsBuilder)previousDayHeartRateStatisticsBuilder
{
  return self->_previousDayHeartRateStatisticsBuilder;
}

- (NSSet)observedQuantityTypes
{
  return self->_observedQuantityTypes;
}

- (NSDateInterval)targetDayDateInterval
{
  return self->_targetDayDateInterval;
}

- (void)setTargetDayDateInterval:(id)a3
{
}

- (NSDateInterval)previousDayDateInterval
{
  return self->_previousDayDateInterval;
}

- (void)setPreviousDayDateInterval:(id)a3
{
}

- (int64_t)targetDayCacheIndex
{
  return self->_targetDayCacheIndex;
}

- (void)setTargetDayCacheIndex:(int64_t)a3
{
  self->_targetDayCacheIndex = a3;
}

- (int64_t)previousDayCacheIndex
{
  return self->_previousDayCacheIndex;
}

- (void)setPreviousDayCacheIndex:(int64_t)a3
{
  self->_previousDayCacheIndex = a3;
}

- (NSString)targetDayStatisticsBuilderTag
{
  return self->_targetDayStatisticsBuilderTag;
}

- (void)setTargetDayStatisticsBuilderTag:(id)a3
{
}

- (NSString)previousDayStatisticsBuilderTag
{
  return self->_previousDayStatisticsBuilderTag;
}

- (void)setPreviousDayStatisticsBuilderTag:(id)a3
{
}

- (NSDate)activeDevicePairedDate
{
  return self->_activeDevicePairedDate;
}

- (void)setActiveDevicePairedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDevicePairedDate, 0);
  objc_storeStrong((id *)&self->_previousDayStatisticsBuilderTag, 0);
  objc_storeStrong((id *)&self->_targetDayStatisticsBuilderTag, 0);
  objc_storeStrong((id *)&self->_previousDayDateInterval, 0);
  objc_storeStrong((id *)&self->_targetDayDateInterval, 0);
  objc_storeStrong((id *)&self->_previousDayHeartRateStatisticsBuilder, 0);
  objc_storeStrong((id *)&self->_targetDayHeartRateStatisticsBuilder, 0);
  objc_storeStrong((id *)&self->_previousDayStatisticsBuilder, 0);
  objc_storeStrong((id *)&self->_targetDayStatisticsBuilder, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unfrozenSeriesCache, 0);
  sub_17628((uint64_t)&self->_isBLEPeripheralSourceCache);
  sub_17628((uint64_t)&self->_isConnectedGymDeviceCache);
  sub_17628((uint64_t)&self->_isConnectedGymSourceCache);
  sub_17628((uint64_t)&self->_isWatchSourceCache);
  objc_storeStrong((id *)&self->_rebuildOperation, 0);
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_observedQuantityTypes, 0);
  objc_storeStrong((id *)&self->_allObservedTypes, 0);
  objc_storeStrong((id *)&self->_sleepAnalysisType, 0);
  objc_storeStrong((id *)&self->_watchActivationType, 0);
  objc_storeStrong((id *)&self->_workoutType, 0);
  objc_storeStrong((id *)&self->_deepBreathingSessionType, 0);
  objc_storeStrong((id *)&self->_standHoursType, 0);
  objc_storeStrong((id *)&self->_quantitySamplesQueryString, 0);
  objc_storeStrong((id *)&self->_nonQuantitySamplesQueryString, 0);
  begin = self->_previousWatchActivationLogEntryVector.__begin_;
  if (begin)
  {
    self->_previousWatchActivationLogEntryVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *((_DWORD *)self + 74) = 1065353216;
  return self;
}

@end