@interface HKWorkoutBuilder
+ (double)_elapsedTimeAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6;
+ (id)_constructionStateMachineForBuilderConfiguration:(id)a3 builderIdentifier:(id)a4;
+ (id)clientInterface;
+ (id)serverInterface;
+ (int64_t)_collectionStateAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6;
- (BOOL)_resourceQueue_canAddMetadataInCurrentState;
- (BOOL)isCurrentlyRunning;
- (BOOL)shouldRetry;
- (HKDevice)device;
- (HKHealthStore)healthStore;
- (HKSeriesBuilder)seriesBuilderForType:(HKSeriesType *)seriesType;
- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType;
- (HKTaskServerProxyProvider)proxyProvider;
- (HKWorkoutBuilder)init;
- (HKWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device;
- (HKWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5;
- (HKWorkoutBuilder)initWithHealthStore:(id)a3 configuration:(id)a4 goalType:(unint64_t)a5 goal:(id)a6 device:(id)a7;
- (HKWorkoutBuilderConfiguration)configuration;
- (HKWorkoutConfiguration)workoutConfiguration;
- (NSArray)workoutActivities;
- (NSArray)workoutEvents;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)allStatistics;
- (NSDictionary)metadata;
- (NSMutableDictionary)seriesBuilders;
- (NSMutableDictionary)statisticsByType;
- (NSString)description;
- (NSTimeInterval)elapsedTimeAtDate:(NSDate *)date;
- (NSUUID)identifier;
- (OS_dispatch_queue)resourceQueue;
- (double)_currentElapsedTime;
- (id)_currentSnapshot;
- (id)_resourceQueue_endDateForSnapshotWithStartDate:(id)a3;
- (id)_resourceQueue_eventsBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)_resourceQueue_seriesBuilderWithIdentifier:(id)a3 type:(id)a4;
- (id)_resourceQueue_startDateForSnapshot;
- (id)exportedInterface;
- (id)goal;
- (id)remoteInterface;
- (unint64_t)goalType;
- (void)_pushCurrentTargetState;
- (void)_recoverWithCompletion:(id)a3;
- (void)_removeMetadata:(id)a3 completion:(id)a4;
- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4;
- (void)_resourceQueue_addSamples:(id)a3 completion:(id)a4;
- (void)_resourceQueue_addWorkoutActivity:(id)a3 completion:(id)a4;
- (void)_resourceQueue_addWorkoutEvents:(id)a3 completion:(id)a4;
- (void)_resourceQueue_beginCollectionWithStartDate:(id)a3 completion:(id)a4;
- (void)_resourceQueue_endCollectionWithEndDate:(id)a3 completion:(id)a4;
- (void)_resourceQueue_finishWorkoutWithCompletion:(id)a3;
- (void)_resourceQueue_freezeSeriesBuilders;
- (void)_resourceQueue_markRecoveryRequired;
- (void)_resourceQueue_removeMetadata:(id)a3 completion:(id)a4;
- (void)_resourceQueue_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4;
- (void)_resourceQueue_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4;
- (void)_resourceQueue_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5;
- (void)_resourceQueue_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5;
- (void)_resourceQueue_updateDevice:(id)a3;
- (void)_resourceQueue_updateElapsedTimeCache;
- (void)_restoreRecoveredSeriesBuildersWithCompletion:(id)a3;
- (void)_setDevice:(id)a3;
- (void)_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4;
- (void)_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4;
- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)addSamples:(NSArray *)samples completion:(void *)completion;
- (void)addWorkoutActivity:(HKWorkoutActivity *)workoutActivity completion:(void *)completion;
- (void)addWorkoutEvents:(NSArray *)workoutEvents completion:(void *)completion;
- (void)beginCollectionWithStartDate:(NSDate *)startDate completion:(void *)completion;
- (void)clientRemote_didBeginActivity:(id)a3;
- (void)clientRemote_didChangeElapsedTimeBasisWithStartDate:(id)a3 endDate:(id)a4;
- (void)clientRemote_didEndActivity:(id)a3;
- (void)clientRemote_didFailWithError:(id)a3;
- (void)clientRemote_didFinishRecovery;
- (void)clientRemote_didRecoverSeriesBuilders:(id)a3;
- (void)clientRemote_didUpdateActivities:(id)a3;
- (void)clientRemote_didUpdateEvents:(id)a3;
- (void)clientRemote_didUpdateMetadata:(id)a3;
- (void)clientRemote_didUpdateStatistics:(id)a3;
- (void)clientRemote_finishedWorkout:(id)a3;
- (void)clientRemote_stateDidChange:(int64_t)a3 startDate:(id)a4 endDate:(id)a5;
- (void)clientRemote_synchronizeWithCompletion:(id)a3;
- (void)connectionInterrupted;
- (void)currentZonesForType:(id)a3 completion:(id)a4;
- (void)discardWorkout;
- (void)endCollectionWithEndDate:(NSDate *)endDate completion:(void *)completion;
- (void)finishWorkoutWithCompletion:(void *)completion;
- (void)setConfiguration:(id)a3;
- (void)setSeriesBuilders:(id)a3;
- (void)setStatisticsByType:(id)a3;
- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6;
- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8;
- (void)unitTest_setFailureHandler:(id)a3;
- (void)unitTest_setRecoveryFinishedHandler:(id)a3;
- (void)unitTest_setServerStateChangeHandler:(id)a3;
- (void)updateActivityWithUUID:(NSUUID *)UUID addMedatata:(NSDictionary *)metadata completion:(void *)completion;
- (void)updateActivityWithUUID:(NSUUID *)UUID endDate:(NSDate *)endDate completion:(void *)completion;
@end

@implementation HKWorkoutBuilder

+ (id)_constructionStateMachineForBuilderConfiguration:(id)a3 builderIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 associatedSessionUUID];
  v8 = (void *)v7;
  if (v7) {
    id v9 = (id)v7;
  }
  else {
    id v9 = v6;
  }
  v10 = +[HKStateMachine nameForOwner:a1 UUID:v9 tag:0];

  v11 = [[HKStateMachine alloc] initWithName:v10];
  v12 = [(HKStateMachine *)v11 addStateWithIndex:0 label:@"NotStarted"];
  v13 = [(HKStateMachine *)v11 addStateWithIndex:1 label:@"Active"];
  v14 = [(HKStateMachine *)v11 addStateWithIndex:2 label:@"Ended"];
  v15 = [(HKStateMachine *)v11 addStateWithIndex:3 label:@"Finished"];
  v16 = [(HKStateMachine *)v11 addStateWithIndex:4 label:@"Discarded"];
  id v17 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v13 event:100 label:@"begin"];
  id v18 = [(HKStateMachine *)v11 addStateTransitionFrom:v13 to:v14 event:101 label:@"end"];
  id v19 = [(HKStateMachine *)v11 addStateTransitionFrom:v14 to:v15 event:102 label:@"finish"];
  id v20 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v16 event:103 label:@"discard"];
  id v21 = [(HKStateMachine *)v11 addStateTransitionFrom:v13 to:v16 event:103 label:@"discard"];
  id v22 = [(HKStateMachine *)v11 addStateTransitionFrom:v14 to:v16 event:103 label:@"discard"];
  id v23 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v13 event:1 label:@"server-active"];
  id v24 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v14 event:2 label:@"server-ended"];
  id v25 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v15 event:3 label:@"server-finished"];
  id v26 = [(HKStateMachine *)v11 addStateTransitionFrom:v12 to:v16 event:4 label:@"server-discarded"];
  id v27 = [(HKStateMachine *)v11 addStateTransitionFrom:v13 to:v14 event:2 label:@"server-ended"];
  id v28 = [(HKStateMachine *)v11 addStateTransitionFrom:v13 to:v15 event:3 label:@"server-finished"];
  id v29 = [(HKStateMachine *)v11 addStateTransitionFrom:v13 to:v16 event:4 label:@"server-discarded"];
  id v30 = [(HKStateMachine *)v11 addStateTransitionFrom:v14 to:v15 event:3 label:@"server-finished"];
  id v31 = [(HKStateMachine *)v11 addStateTransitionFrom:v14 to:v16 event:4 label:@"server-discarded"];
  id v32 = [(HKStateMachine *)v11 addStateTransitionFrom:v16 to:v15 event:3 label:@"server-finished"];
  id v33 = [(HKStateMachine *)v11 addStateTransitionFrom:v15 to:v16 event:4 label:@"server-discarded"];

  return v11;
}

- (HKWorkoutBuilder)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device
{
  v8 = device;
  id v9 = configuration;
  v10 = healthStore;
  v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  [(HKWorkoutBuilderConfiguration *)v11 setDevice:v8];

  [(HKWorkoutBuilderConfiguration *)v11 setWorkoutConfiguration:v9];
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [(HKWorkoutBuilder *)self initWithHealthStore:v10 builderConfiguration:v11 builderIdentifier:v12];

  return v13;
}

- (HKWorkoutBuilder)initWithHealthStore:(id)a3 configuration:(id)a4 goalType:(unint64_t)a5 goal:(id)a6 device:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  [(HKWorkoutBuilderConfiguration *)v16 setDevice:v12];

  [(HKWorkoutBuilderConfiguration *)v16 setWorkoutConfiguration:v14];
  [(HKWorkoutBuilderConfiguration *)v16 setGoalType:a5];
  [(HKWorkoutBuilderConfiguration *)v16 setGoal:v13];

  id v17 = [MEMORY[0x1E4F29128] UUID];
  id v18 = [(HKWorkoutBuilder *)self initWithHealthStore:v15 builderConfiguration:v16 builderIdentifier:v17];

  return v18;
}

- (HKWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)HKWorkoutBuilder;
  id v12 = [(HKWorkoutBuilder *)&v39 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_identifier, a5);
    objc_storeStrong((id *)&v13->_builderConfiguration, a4);
    id v14 = [v10 workoutConfiguration];
    uint64_t v15 = [v14 copy];
    workoutConfiguration = v13->_workoutConfiguration;
    v13->_workoutConfiguration = (HKWorkoutConfiguration *)v15;

    uint64_t v17 = HKCreateSerialDispatchQueue(v13, @"resource");
    resourceQueue = v13->_resourceQueue;
    v13->_resourceQueue = (OS_dispatch_queue *)v17;

    id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    seriesBuilders = v13->_seriesBuilders;
    v13->_seriesBuilders = v19;

    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statisticsByType = v13->_statisticsByType;
    v13->_statisticsByType = v21;

    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)MEMORY[0x1E4F1CC08];

    workoutEvents = v13->_workoutEvents;
    v13->_workoutEvents = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activitiesPerUUID = v13->_activitiesPerUUID;
    v13->_activitiesPerUUID = v25;

    id v27 = [[HKRetryableOperation alloc] initWithQueue:v13->_resourceQueue retryCount:5];
    retryableOperation = v13->_retryableOperation;
    v13->_retryableOperation = v27;

    v13->_serverConstructionState = 0;
    uint64_t v29 = [(id)objc_opt_class() _constructionStateMachineForBuilderConfiguration:v10 builderIdentifier:v11];
    constructionStateMachine = v13->_constructionStateMachine;
    v13->_constructionStateMachine = (HKStateMachine *)v29;

    [(HKStateMachine *)v13->_constructionStateMachine setDelegate:v13];
    id v31 = v13->_resourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HKWorkoutBuilder_initWithHealthStore_builderConfiguration_builderIdentifier___block_invoke;
    block[3] = &unk_1E58BBA00;
    id v32 = v13;
    v38 = v32;
    dispatch_sync(v31, block);
    id v33 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v9 taskIdentifier:@"HKWorkoutBuilderServerIdentifier" exportedObject:v32 taskUUID:v11];
    id v34 = v32[24];
    v32[24] = v33;

    [v32[24] setTaskConfiguration:v10];
    _HKInitializeLogging();
    v35 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_impl(&dword_19C023000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0)", buf, 0xCu);
    }
  }
  return v13;
}

uint64_t __79__HKWorkoutBuilder_initWithHealthStore_builderConfiguration_builderIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) enterAtState:0];
}

- (NSString)description
{
  v3 = [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration associatedSessionUUID];

  uint64_t v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [(NSUUID *)self->_identifier hk_shortRepresentation];
  v8 = (void *)v7;
  if (v3)
  {
    id v9 = [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration associatedSessionUUID];
    id v10 = objc_msgSend(v9, "hk_shortRepresentation");
    id v11 = [v4 stringWithFormat:@"%@_%@ [%@]", v6, v8, v10];
  }
  else
  {
    id v11 = [v4 stringWithFormat:@"%@_%@", v6, v7];
  }

  return (NSString *)v11;
}

+ (int64_t)_collectionStateAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10 && (objc_msgSend(v9, "hk_isBeforeDate:", v10) & 1) == 0)
  {
    if (v11 && (objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v9) & 1) != 0)
    {
      int64_t v13 = 3;
    }
    else
    {
      id v26 = v11;
      id v27 = v10;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v12;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        int64_t v13 = 1;
LABEL_9:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
          id v20 = [v19 dateInterval];
          id v21 = [v20 startDate];
          char v22 = objc_msgSend(v21, "hk_isAfterDate:", v9);

          if (v22) {
            break;
          }
          uint64_t v23 = [v19 type];
          if (v23 == 2)
          {
            int64_t v13 = 1;
          }
          else if (v23 == 1)
          {
            int64_t v13 = 2;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v16) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
      else
      {
        int64_t v13 = 1;
      }

      id v11 = v26;
      id v10 = v27;
      id v12 = v25;
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

+ (double)_elapsedTimeAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = 0.0;
  if (!v10 || (objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v9) & 1) != 0) {
    goto LABEL_29;
  }
  if (v11)
  {
    uint64_t v14 = HKDateMin(v9, v11);

    id v9 = (id)v14;
  }
  [v10 timeIntervalSinceReferenceDate];
  double v16 = v15;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (!v18)
  {

    goto LABEL_28;
  }
  uint64_t v19 = v18;
  id v35 = v12;
  id v36 = v11;
  uint64_t v20 = *(void *)v38;
  char v21 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v38 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v24 = objc_msgSend(v23, "dateInterval", v35, v36, (void)v37);
      id v25 = [v24 startDate];

      if (objc_msgSend(v25, "hk_isBeforeDate:", v10))
      {
        _HKInitializeLogging();
        uint64_t v28 = HKLogWorkouts;
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v42 = v25;
          __int16 v43 = 2114;
          id v44 = v10;
          long long v29 = "Event start date: %{public}@ is before workout start date: %{public}@";
          long long v30 = v28;
          uint32_t v31 = 22;
LABEL_25:
          _os_log_impl(&dword_19C023000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
        }
LABEL_26:

        goto LABEL_27;
      }
      if (objc_msgSend(v25, "hk_isAfterDate:", v9))
      {
        _HKInitializeLogging();
        uint64_t v32 = HKLogWorkouts;
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v42 = v25;
          long long v29 = "Event start date: %{public}@ is in future";
          long long v30 = v32;
          uint32_t v31 = 12;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      if ((([v23 type] == 1) & v21) == 1)
      {
        [v25 timeIntervalSinceReferenceDate];
        char v21 = 0;
        double v13 = v13 + v26 - v16;
        double v16 = 0.0;
      }
      if ([v23 type] == 2 && (v21 & 1) == 0)
      {
        [v25 timeIntervalSinceReferenceDate];
        double v16 = v27;
        char v21 = 1;
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_27:

  id v12 = v35;
  id v11 = v36;
  if (v21)
  {
LABEL_28:
    [v9 timeIntervalSinceReferenceDate];
    double v13 = v13 + v33 - v16;
  }
LABEL_29:

  return v13;
}

- (HKDevice)device
{
  return [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration device];
}

- (void)beginCollectionWithStartDate:(NSDate *)startDate completion:(void *)completion
{
  id v6 = startDate;
  uint64_t v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    v8 = _Block_copy(aBlock);
  }
  else
  {
    v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  double v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_beginCollectionWithStartDate:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (NSDate)startDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HKWorkoutBuilder_startDate__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __29__HKWorkoutBuilder_startDate__block_invoke(uint64_t a1)
{
}

- (NSDate)endDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__HKWorkoutBuilder_endDate__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__HKWorkoutBuilder_endDate__block_invoke(uint64_t a1)
{
}

- (double)_currentElapsedTime
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HKWorkoutBuilder__currentElapsedTime__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFAbsoluteTime __39__HKWorkoutBuilder__currentElapsedTime__block_invoke(uint64_t a1)
{
  CFAbsoluteTime result = *(double *)(*(void *)(a1 + 32) + 64);
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 80))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    CFAbsoluteTime result = Current - *(double *)(*(void *)(a1 + 32) + 72) + *(double *)(v4 + 24);
    *(CFAbsoluteTime *)(v4 + 24) = result;
  }
  return result;
}

- (NSTimeInterval)elapsedTimeAtDate:(NSDate *)date
{
  uint64_t v4 = date;
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HKWorkoutBuilder_elapsedTimeAtDate___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v11 = self;
  char v12 = &v13;
  id v10 = v4;
  uint64_t v6 = v4;
  dispatch_sync(resourceQueue, block);
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __38__HKWorkoutBuilder_elapsedTimeAtDate___block_invoke(void *a1)
{
  uint64_t result = +[HKWorkoutBuilder _elapsedTimeAtDate:a1[4] startDate:*(void *)(a1[5] + 24) endDate:*(void *)(a1[5] + 32) sortedEvents:*(void *)(a1[5] + 48)];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (BOOL)isCurrentlyRunning
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__HKWorkoutBuilder_isCurrentlyRunning__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__HKWorkoutBuilder_isCurrentlyRunning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)addSamples:(NSArray *)samples completion:(void *)completion
{
  uint64_t v6 = samples;
  double v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    uint64_t v8 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  uint64_t v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __42__HKWorkoutBuilder_addSamples_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __42__HKWorkoutBuilder_addSamples_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __42__HKWorkoutBuilder_addSamples_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addSamples:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)addWorkoutEvents:(NSArray *)workoutEvents completion:(void *)completion
{
  uint64_t v6 = workoutEvents;
  id v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    id v8 = _Block_copy(aBlock);
  }
  else
  {
    id v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  uint64_t v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addWorkoutEvents:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (NSArray)workoutEvents
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__HKWorkoutBuilder_workoutEvents__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __33__HKWorkoutBuilder_workoutEvents__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  uint64_t v6 = metadata;
  id v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    uint64_t v8 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  uint64_t v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __43__HKWorkoutBuilder_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (NSDictionary)metadata
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__HKWorkoutBuilder_metadata__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __28__HKWorkoutBuilder_metadata__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)addWorkoutActivity:(HKWorkoutActivity *)workoutActivity completion:(void *)completion
{
  uint64_t v6 = workoutActivity;
  id v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    uint64_t v8 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  uint64_t v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addWorkoutActivity:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (NSArray)workoutActivities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__HKWorkoutBuilder_workoutActivities__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __37__HKWorkoutBuilder_workoutActivities__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v2 = [v5 sortedArrayUsingComparator:&__block_literal_global];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __37__HKWorkoutBuilder_workoutActivities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)updateActivityWithUUID:(NSUUID *)UUID endDate:(NSDate *)endDate completion:(void *)completion
{
  uint64_t v8 = UUID;
  char v9 = endDate;
  id v10 = completion;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v21 = v10;
    id v11 = _Block_copy(aBlock);
  }
  else
  {
    id v11 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_3;
  v16[3] = &unk_1E58BBB10;
  v16[4] = self;
  id v17 = v8;
  uint64_t v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  uint64_t v15 = v8;
  dispatch_async(resourceQueue, v16);
}

void __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateActivityWithUUID:endDate:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)updateActivityWithUUID:(NSUUID *)UUID addMedatata:(NSDictionary *)metadata completion:(void *)completion
{
  id v8 = UUID;
  char v9 = metadata;
  id v10 = completion;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v21 = v10;
    id v11 = _Block_copy(aBlock);
  }
  else
  {
    id v11 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_3;
  v16[3] = &unk_1E58BBB10;
  v16[4] = self;
  id v17 = v8;
  uint64_t v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  uint64_t v15 = v8;
  dispatch_async(resourceQueue, v16);
}

void __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateActivityWithUUID:addMetadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)endCollectionWithEndDate:(NSDate *)endDate completion:(void *)completion
{
  uint64_t v6 = endDate;
  id v7 = completion;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    id v8 = _Block_copy(aBlock);
  }
  else
  {
    id v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_endCollectionWithEndDate:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)finishWorkoutWithCompletion:(void *)completion
{
  id v4 = completion;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke;
    aBlock[3] = &unk_1E58BBB38;
    aBlock[4] = self;
    id v11 = v4;
    id v5 = _Block_copy(aBlock);
  }
  else
  {
    id v5 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_3;
  v8[3] = &unk_1E58BB978;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(resourceQueue, v8);
}

void __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BB9A0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishWorkoutWithCompletion:", *(void *)(a1 + 40));
}

- (void)discardWorkout
{
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HKWorkoutBuilder_discardWorkout__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_async(resourceQueue, block);
}

uint64_t __34__HKWorkoutBuilder_discardWorkout__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) enqueueEvent:103 date:0 error:0 completion:&__block_literal_global_74];
}

void __34__HKWorkoutBuilder_discardWorkout__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __34__HKWorkoutBuilder_discardWorkout__block_invoke_2_cold_1();
    }
  }
}

- (NSDictionary)allStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(HKWorkoutBuilder *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__HKWorkoutBuilder_allStatistics__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __33__HKWorkoutBuilder_allStatistics__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 176) copy];

  return MEMORY[0x1F41817F8]();
}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  id v4 = quantityType;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(HKWorkoutBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HKWorkoutBuilder_statisticsForType___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (HKStatistics *)v7;
}

uint64_t __38__HKWorkoutBuilder_statisticsForType___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 176) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (HKSeriesBuilder)seriesBuilderForType:(HKSeriesType *)seriesType
{
  id v4 = seriesType;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(HKWorkoutBuilder *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HKWorkoutBuilder_seriesBuilderForType___block_invoke;
  block[3] = &unk_1E58BBAC8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (HKSeriesBuilder *)v7;
}

uint64_t __41__HKWorkoutBuilder_seriesBuilderForType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_seriesBuilderWithIdentifier:type:", 0, *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)_resourceQueue_startDateForSnapshot
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  workoutStartDate = self->_workoutStartDate;
  if (workoutStartDate)
  {
    uint64_t v3 = workoutStartDate;
  }
  else
  {
    id v5 = [(NSArray *)self->_workoutEvents firstObject];
    id v6 = [v5 dateInterval];
    uint64_t v3 = [v6 startDate];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(NSMutableDictionary *)self->_statisticsByType allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v3;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) startDate];
          HKDateMin(v12, v13);
          uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue();

          ++v11;
          uint64_t v12 = v3;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v3;
}

- (id)_resourceQueue_endDateForSnapshotWithStartDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  workoutEndDate = self->_workoutEndDate;
  if (workoutEndDate)
  {
    id v6 = workoutEndDate;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)self->_statisticsByType allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        id v13 = v7;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) endDate];
          id v7 = HKDateMax(v13, v14);

          ++v12;
          id v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    long long v15 = [(NSArray *)self->_workoutEvents lastObject];
    long long v16 = [v15 dateInterval];
    long long v17 = [v16 endDate];
    HKDateMax(v7, v17);
    id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

    long long v18 = +[HKObjectType workoutType];
    if ([v18 isMaximumDurationRestricted])
    {
      [v18 maximumAllowedDuration];
      id v19 = objc_msgSend(v4, "dateByAddingTimeInterval:");
      uint64_t v20 = HKDateMin(v6, v19);

      id v6 = (NSDate *)v20;
    }
  }

  return v6;
}

- (id)_resourceQueue_eventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workoutEvents = self->_workoutEvents;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HKWorkoutBuilder__resourceQueue_eventsBetweenStartDate_endDate___block_invoke;
  v13[3] = &unk_1E58BBB80;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(NSArray *)workoutEvents hk_filter:v13];

  return v11;
}

uint64_t __66__HKWorkoutBuilder__resourceQueue_eventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dateInterval];
  id v5 = [v4 startDate];
  if (objc_msgSend(v5, "hk_isBeforeDate:", *(void *)(a1 + 32)))
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [v3 dateInterval];
    uint64_t v8 = [v7 endDate];
    uint64_t v6 = objc_msgSend(v8, "hk_isAfterDate:", *(void *)(a1 + 40)) ^ 1;
  }
  return v6;
}

- (id)_currentSnapshot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__HKWorkoutBuilder__currentSnapshot__block_invoke;
  v5[3] = &unk_1E58BBBA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__HKWorkoutBuilder__currentSnapshot__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_startDateForSnapshot");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) workoutConfiguration];
    uint64_t v17 = [v2 activityType];

    id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) mutableCopy];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 192) taskUUID];
    id v5 = [v4 UUIDString];
    [v3 setObject:v5 forKeyedSubscript:@"_HKPrivateWorkoutBuilderSnapshotMetadataFinalWorkoutUUIDStringKey"];

    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_endDateForSnapshotWithStartDate:", v18);
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_eventsBetweenStartDate:endDate:", v18, v6);
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v9 + 176);
    uint64_t v11 = [*(id *)(v9 + 16) goalType];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) goal];
    id v13 = [*(id *)(*(void *)(a1 + 32) + 16) device];
    uint64_t v14 = +[HKWorkout _workoutWithActivityType:v17 startDate:v18 endDate:v6 workoutEvents:v7 workoutActivities:v8 duration:v10 statistics:0.0 goalType:v11 goal:v12 device:v13 metadata:v3];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (unint64_t)goalType
{
  return [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration goalType];
}

- (id)goal
{
  return [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration goal];
}

- (void)_setDevice:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__HKWorkoutBuilder__setDevice___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(resourceQueue, v7);
}

uint64_t __31__HKWorkoutBuilder__setDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateDevice:", *(void *)(a1 + 40));
}

- (void)_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  id v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder__setStatisticsMergeStrategy_forType___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(resourceQueue, block);
}

uint64_t __56__HKWorkoutBuilder__setStatisticsMergeStrategy_forType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_setStatisticsMergeStrategy:forType:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder__setStatisticsComputationMethod_forType___block_invoke;
  block[3] = &unk_1E58BBBF8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(resourceQueue, block);
}

uint64_t __60__HKWorkoutBuilder__setStatisticsComputationMethod_forType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_setStatisticsComputationMethod:forType:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_removeMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v16 = v7;
    id v8 = _Block_copy(aBlock);
  }
  else
  {
    id v8 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_3;
  block[3] = &unk_1E58BBA78;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(resourceQueue, block);
}

void __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_removeMetadata:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)currentZonesForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke;
  v13[3] = &unk_1E58BBC20;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_currentZonesForType:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)shouldRetry
{
  return self->_proxyProvider != 0;
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  id v8 = a5;
  switch([a4 index])
  {
    case 1:
      if (v8)
      {
        id v9 = (NSDate *)[v8 copy];
        workoutStartDate = self->_workoutStartDate;
        self->_workoutStartDate = v9;
      }
      if (!self->_workoutStartDate)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          -[HKWorkoutBuilder stateMachine:didEnterState:date:error:]();
        }
      }
      break;
    case 2:
      if (v8)
      {
        id v11 = (NSDate *)[v8 copy];
        workoutEndDate = self->_workoutEndDate;
        self->_workoutEndDate = v11;
      }
      if (!self->_workoutEndDate)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          -[HKWorkoutBuilder stateMachine:didEnterState:date:error:]();
        }
      }
      break;
    case 3:
    case 4:
      [(HKWorkoutBuilder *)self _resourceQueue_freezeSeriesBuilders];
      break;
    default:
      break;
  }
}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  _HKInitializeLogging();
  id v12 = HKLogWorkouts;
  BOOL v13 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)id v15 = 138543618;
      *(void *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = v10;
      id v14 = "%{public}@: (#w0) %{public}@.";
LABEL_6:
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 0x16u);
    }
  }
  else if (v13)
  {
    *(_DWORD *)id v15 = 138543618;
    *(void *)&v15[4] = self;
    *(_WORD *)&v15[12] = 2114;
    *(void *)&v15[14] = v11;
    id v14 = "%{public}@: (#w0) Enter at %{public}@.";
    goto LABEL_6;
  }
  [(HKWorkoutBuilder *)self _pushCurrentTargetState];
}

- (void)_pushCurrentTargetState
{
  proxyProvider = self->_proxyProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke;
  v4[3] = &unk_1E58BBC98;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_81;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v4 errorHandler:v3];
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 184);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_2;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, v7);
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) currentState];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v2 index];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3;
  v9[3] = &unk_1E58BBC70;
  v9[4] = v5;
  id v10 = v2;
  id v8 = v2;
  objc_msgSend(v3, "remote_setTargetConstructionState:startDate:endDate:completion:", v4, v6, v7, v9);
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w2) Server acknowledged transition to state %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1();
  }
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_81(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1();
  }
}

- (void)_resourceQueue_beginCollectionWithStartDate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (v7)
  {
    constructionStateMachine = self->_constructionStateMachine;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__HKWorkoutBuilder__resourceQueue_beginCollectionWithStartDate_completion___block_invoke;
    v11[3] = &unk_1E58BBCE8;
    id v13 = v8;
    SEL v14 = a2;
    v11[4] = self;
    id v12 = v7;
    [(HKStateMachine *)constructionStateMachine enqueueEvent:100 date:v12 error:0 completion:v11];
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"startDate cannot be nil"");
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
  }
}

void __75__HKWorkoutBuilder__resourceQueue_beginCollectionWithStartDate_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v4;

    uint64_t v7 = [*(id *)(a1 + 40) copy];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    uint64_t v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "_resourceQueue_updateElapsedTimeCache");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 56), @"Unable to begin a workout that has already started."");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v11);
  }
}

- (void)_resourceQueue_endCollectionWithEndDate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (!v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = objc_opt_class();
    id v12 = @"endDate cannot be nil";
LABEL_8:
    id v13 = objc_msgSend(v10, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v11, a2, v12);
    v8[2](v8, 0, v13);

    goto LABEL_9;
  }
  if (!self->_workoutStartDate)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = objc_opt_class();
    id v12 = @"cannot set endDate without a startDate";
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "hk_isAfterDate:") & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = objc_opt_class();
    id v12 = @"endDate must be after startDate";
    goto LABEL_8;
  }
  constructionStateMachine = self->_constructionStateMachine;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HKWorkoutBuilder__resourceQueue_endCollectionWithEndDate_completion___block_invoke;
  v14[3] = &unk_1E58BBCE8;
  uint64_t v16 = v8;
  SEL v17 = a2;
  v14[4] = self;
  id v15 = v7;
  [(HKStateMachine *)constructionStateMachine enqueueEvent:101 date:v15 error:0 completion:v14];

LABEL_9:
}

void __71__HKWorkoutBuilder__resourceQueue_endCollectionWithEndDate_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v4;

    uint64_t v7 = [*(id *)(a1 + 40) copy];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;

    uint64_t v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "_resourceQueue_updateElapsedTimeCache");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 56), @"Unable to end a workout that is not currently active."");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v11);
  }
}

- (void)_resourceQueue_finishWorkoutWithCompletion:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  constructionStateMachine = self->_constructionStateMachine;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HKWorkoutBuilder__resourceQueue_finishWorkoutWithCompletion___block_invoke;
  v8[3] = &unk_1E58BBD10;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [(HKStateMachine *)constructionStateMachine enqueueEvent:102 date:0 error:0 completion:v8];
}

uint64_t __63__HKWorkoutBuilder__resourceQueue_finishWorkoutWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    *(void *)(*(void *)(a1 + 32) + 128) = [*(id *)(a1 + 40) copy];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Unable to finish a workout that is not currently ended."");
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v2, 0, v4);
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_resourceQueue_addSamples:(id)a3 completion:(id)a4
{
  id v6 = a3;
  resourceQueue = self->_resourceQueue;
  uint64_t v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  id v17 = 0;
  BOOL v9 = +[HKWorkout _validateObjects:v6 forClass:objc_opt_class() error:&v17];
  id v10 = v17;
  if (v9)
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke;
    v15[3] = &unk_1E58BBDB0;
    v15[4] = self;
    id v16 = v6;
    id v12 = v10;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v15 completion:v8];

    uint64_t v8 = v12;
  }
  else
  {
    id v13 = (void (*)(void *, void, id))v8[2];
    id v14 = v17;
    v13(v8, 0, v14);
  }
}

void __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 192);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD60;
  v9[4] = v4;
  id v11 = v3;
  id v10 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_4;
  v7[3] = &unk_1E58BBD88;
  id v8 = v11;
  id v6 = v11;
  [v5 fetchProxyWithHandler:v9 errorHandler:v7];
}

void __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldRetry])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_3;
    v7[3] = &unk_1E58BBD38;
    uint64_t v4 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remote_addSamples:completion:", v4, v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*(void (**)(uint64_t, void, void, void *))(v5 + 16))(v5, 0, 0, v6);
  }
}

uint64_t __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addWorkoutEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  resourceQueue = self->_resourceQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  id v17 = 0;
  BOOL v9 = +[HKWorkout _validateObjects:v6 forClass:objc_opt_class() error:&v17];
  id v10 = v17;
  if (v9)
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke;
    v15[3] = &unk_1E58BBDB0;
    v15[4] = self;
    id v16 = v6;
    id v12 = v10;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v15 completion:v8];

    id v8 = v12;
  }
  else
  {
    id v13 = (void (*)(void *, void, id))v8[2];
    id v14 = v17;
    v13(v8, 0, v14);
  }
}

void __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldRetry])
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 192);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_2;
    v8[3] = &unk_1E58BBC20;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v10;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addWorkoutEvents:completion:", v3, v4);
}

uint64_t __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_resourceQueue_canAddMetadataInCurrentState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v3 = [(HKStateMachine *)self->_constructionStateMachine currentState];
  if ([v3 index] == 4)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(HKStateMachine *)self->_constructionStateMachine currentState];
    BOOL v4 = [v5 index] != 3;
  }
  return v4;
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if ([(HKWorkoutBuilder *)self _resourceQueue_canAddMetadataInCurrentState]&& checkWhetherAllMetadataAlreadyExists(v6, self->_metadata))
  {
    _HKInitializeLogging();
    id v8 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Metadata update was elided as all requested metadata already existed.", buf, 0xCu);
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke;
    v10[3] = &unk_1E58BBDB0;
    v10[4] = self;
    id v11 = v6;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v10 completion:v7];
  }
}

void __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldRetry])
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 192);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
    v8[3] = &unk_1E58BBC20;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v10;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addMetadata:completion:", v3, v4);
}

uint64_t __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_removeMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  resourceQueue = self->_resourceQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  retryableOperation = self->_retryableOperation;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke;
  v11[3] = &unk_1E58BBDB0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v11 completion:v8];
}

void __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldRetry])
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 192);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_2;
    v8[3] = &unk_1E58BBC20;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v10;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeMetadata:completion:", v3, v4);
}

uint64_t __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addWorkoutActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  currentActivity = self->_currentActivity;
  if (currentActivity
    && ([(HKWorkoutActivity *)currentActivity endDate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot add new activity before ending current activity.");
    v7[2](v7, 0, v11);
  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke;
    v12[3] = &unk_1E58BBDB0;
    v12[4] = self;
    id v13 = v6;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v12 completion:v7];
  }
}

void __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldRetry])
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 192);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_2;
    v8[3] = &unk_1E58BBC20;
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v10;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_3;
  v4[3] = &unk_1E58BBD38;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addWorkoutActivity:completion:", v3, v4);
}

uint64_t __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  resourceQueue = self->_resourceQueue;
  id v11 = a5;
  dispatch_assert_queue_V2(resourceQueue);
  retryableOperation = self->_retryableOperation;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke;
  v15[3] = &unk_1E58BBE00;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v15 completion:v11];
}

void __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] shouldRetry])
  {
    BOOL v4 = (void *)*((void *)a1[4] + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_2;
    v8[3] = &unk_1E58BBDD8;
    id v9 = a1[5];
    id v10 = a1[6];
    id v11 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v11;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_3;
  v5[3] = &unk_1E58BBD38;
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_updateActivityWithUUID:endDate:completion:", v3, v4, v5);
}

uint64_t __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  id v11 = [(NSMutableDictionary *)self->_activitiesPerUUID objectForKeyedSubscript:v8];
  id v12 = [v11 metadata];
  if ([(HKWorkoutBuilder *)self _resourceQueue_canAddMetadataInCurrentState]&& checkWhetherAllMetadataAlreadyExists(v9, v12))
  {
    _HKInitializeLogging();
    id v13 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = self;
      _os_log_impl(&dword_19C023000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Activity metadata update was elided as all requested metadata already existed.", buf, 0xCu);
    }
    v10[2](v10, 1, 0);
  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke;
    v15[3] = &unk_1E58BBE00;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [(HKRetryableOperation *)retryableOperation _queue_performRetryableOperation:v15 completion:v10];
  }
}

void __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] shouldRetry])
  {
    uint64_t v4 = (void *)*((void *)a1[4] + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_2;
    v8[3] = &unk_1E58BBDD8;
    id v9 = a1[5];
    id v10 = a1[6];
    id v11 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_4;
    v6[3] = &unk_1E58BBD88;
    id v7 = v11;
    [v4 fetchProxyWithHandler:v8 errorHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 0, @"An unknown error occurred");
    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v5);
  }
}

void __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_3;
  v5[3] = &unk_1E58BBD38;
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_updateActivityWithUUID:addMetadata:completion:", v3, v4, v5);
}

uint64_t __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_resourceQueue_seriesBuilderWithIdentifier:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  id v8 = [(NSMutableDictionary *)self->_seriesBuilders objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v9 = +[HKSeriesType workoutRouteType];
    int v10 = [v7 isEqual:v9];

    if (v10)
    {
      id v11 = [HKWorkoutRouteBuilder alloc];
      healthStore = self->_healthStore;
      id v13 = [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration device];
      id v8 = [(HKWorkoutRouteBuilder *)v11 initWithHealthStore:healthStore identifier:v6 device:v13 workoutBuilderID:self->_identifier];

      if (v8) {
        [(NSMutableDictionary *)self->_seriesBuilders setObject:v8 forKey:v7];
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_resourceQueue_updateElapsedTimeCache
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  if (+[HKWorkoutBuilder _collectionStateAtDate:v3 startDate:self->_workoutStartDate endDate:self->_workoutEndDate sortedEvents:self->_workoutEvents] == 1)
  {
    [v3 timeIntervalSinceReferenceDate];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
    double v4 = 0.0;
  }
  self->_lastResumeTimestamp = v4;
  self->_BOOL currentlyRunning = v5;
  +[HKWorkoutBuilder _elapsedTimeAtDate:v3 startDate:self->_workoutStartDate endDate:self->_workoutEndDate sortedEvents:self->_workoutEvents];
  self->_double accumulatedElapsedTime = v6;
  workoutStartDate = self->_workoutStartDate;
  _HKInitializeLogging();
  id v8 = HKLogWorkouts;
  BOOL v9 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (workoutStartDate)
  {
    if (v9)
    {
      id v11 = self->_workoutStartDate;
      workoutEndDate = self->_workoutEndDate;
      id v12 = v8;
      uint64_t v13 = [(NSDate *)workoutEndDate description];
      id v14 = (void *)v13;
      id v15 = @"<not ended>";
      double accumulatedElapsedTime = self->_accumulatedElapsedTime;
      BOOL currentlyRunning = self->_currentlyRunning;
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      int v19 = 138544386;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      if (currentlyRunning) {
        id v18 = "running";
      }
      else {
        id v18 = "paused";
      }
      long long v22 = v11;
      __int16 v23 = 2114;
      long long v24 = v15;
      __int16 v25 = 2048;
      double v26 = accumulatedElapsedTime;
      __int16 v27 = 2080;
      uint64_t v28 = v18;
      _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) (%{public}@ - %{public}@) Elapsed: %0.2lfs %s.", (uint8_t *)&v19, 0x34u);
    }
  }
  else if (v9)
  {
    int v19 = 138543362;
    uint64_t v20 = self;
    _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Elapsed time cache updated but workout has not yet started.", (uint8_t *)&v19, 0xCu);
  }
}

- (void)_resourceQueue_freezeSeriesBuilders
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_seriesBuilders allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __55__HKWorkoutBuilder__resourceQueue_freezeSeriesBuilders__block_invoke;
        v9[3] = &unk_1E58BBE28;
        v9[4] = v8;
        [v8 freezeBuilderWithCompletion:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __55__HKWorkoutBuilder__resourceQueue_freezeSeriesBuilders__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    uint64_t v6 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Freezing series builder %{public}@ failed: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_resourceQueue_updateDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration setDevice:v4];
  [(HKTaskServerProxyProvider *)self->_proxyProvider setTaskConfiguration:self->_builderConfiguration];
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke;
  v7[3] = &unk_1E58BBC98;
  id v8 = v4;
  id v6 = v4;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v7 errorHandler:&__block_literal_global_124];
}

uint64_t __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateDevice:", *(void *)(a1 + 32));
}

void __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();
  }
}

- (void)_resourceQueue_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke;
  v9[3] = &unk_1E58BBE70;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:&__block_literal_global_126];
}

uint64_t __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setStatisticsMergeStrategy:forType:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();
  }
}

- (void)_resourceQueue_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke;
  v9[3] = &unk_1E58BBE70;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:&__block_literal_global_128];
}

uint64_t __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setStatisticsComputationMethod:forType:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();
  }
}

- (void)_resourceQueue_markRecoveryRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (![(HKWorkoutBuilderConfiguration *)self->_builderConfiguration requiresRecovery])
  {
    [(HKWorkoutBuilderConfiguration *)self->_builderConfiguration setRequiresRecovery:1];
    builderConfiguration = self->_builderConfiguration;
    proxyProvider = self->_proxyProvider;
    [(HKTaskServerProxyProvider *)proxyProvider setTaskConfiguration:builderConfiguration];
  }
}

- (void)clientRemote_didUpdateStatistics:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __53__HKWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  uint64_t v3 = [*(id *)(a1 + 40) workoutStatistics];
  [v2 addEntriesFromDictionary:v3];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [*(id *)(a1 + 40) activitiesStatistics];
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v30 + 1) + 8 * v4);
        id v6 = [*(id *)(a1 + 40) activitiesStatistics];
        uint64_t v7 = [v6 objectForKeyedSubscript:v5];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
              id v14 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v5];
              uint64_t v15 = [v8 objectForKeyedSubscript:v13];
              [v14 _setStatistics:v15 forType:v13];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v10);
        }

        ++v4;
      }
      while (v4 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v25);
  }

  _HKInitializeLogging();
  id v16 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    int v19 = v16;
    uint64_t v20 = [v17 allTypes];
    __int16 v21 = [v20 allObjects];
    long long v22 = [v21 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v18;
    __int16 v36 = 2114;
    long long v37 = v22;
    _os_log_impl(&dword_19C023000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Updated statistics for types: %{public}@", buf, 0x16u);
  }
}

- (void)clientRemote_didUpdateMetadata:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HKWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __51__HKWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  _HKInitializeLogging();
  id v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Server updated metadata.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clientRemote_didUpdateEvents:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke_2;
  v6[3] = &unk_1E58BBE98;
  id v2 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(v2, "hk_filter:", v6);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Server added events.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateEvents:", v3);
}

uint64_t __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) containsObject:a2] ^ 1;
}

- (void)clientRemote_didUpdateActivities:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __53__HKWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v2 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v9 = *(void **)(*(void *)(v2 + 32) + 56);
        uint64_t v10 = [v8 UUID];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        uint64_t v12 = [v11 allStatistics];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          id v14 = [v11 allStatistics];
          [v8 _setAllStatistics:v14];
        }
        uint64_t v15 = [v8 UUID];
        [v27 setObject:v8 forKeyedSubscript:v15];

        id v16 = [v5 startDate];
        id v17 = [v8 startDate];
        char v18 = objc_msgSend(v16, "hk_isAfterOrEqualToDate:", v17);

        if ((v18 & 1) == 0)
        {
          id v19 = v8;

          uint64_t v5 = v19;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v20 = v2;
  uint64_t v21 = *(void *)(v2 + 32);
  long long v22 = *(void **)(v21 + 56);
  *(void *)(v21 + 56) = v27;
  id v23 = v27;

  uint64_t v24 = *(void *)(v20 + 32);
  uint64_t v25 = *(void **)(v24 + 8);
  *(void *)(v24 + 8) = v5;
}

- (void)clientRemote_didBeginActivity:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKWorkoutBuilder_clientRemote_didBeginActivity___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __50__HKWorkoutBuilder_clientRemote_didBeginActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [*(id *)(a1 + 40) UUID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v7 = [v5 UUID];
    [v6 setObject:v5 forKeyedSubscript:v7];

    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = (id *)(*(void *)(a1 + 32) + 8);
    objc_storeStrong(v9, v8);
  }
}

- (void)clientRemote_didEndActivity:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HKWorkoutBuilder_clientRemote_didEndActivity___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

uint64_t __48__HKWorkoutBuilder_clientRemote_didEndActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [*(id *)(a1 + 40) UUID];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [*(id *)(a1 + 40) endDate];
  [v4 _setEndDate:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;

  id v8 = *(void **)(a1 + 32);

  return objc_msgSend(v8, "_resourceQueue_markRecoveryRequired");
}

- (void)clientRemote_didChangeElapsedTimeBasisWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HKWorkoutBuilder_clientRemote_didChangeElapsedTimeBasisWithStartDate_endDate___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(resourceQueue, block);
}

uint64_t __80__HKWorkoutBuilder_clientRemote_didChangeElapsedTimeBasisWithStartDate_endDate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v2);
  }
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v3);
  }
  id v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_resourceQueue_updateElapsedTimeCache");
}

- (void)clientRemote_didRecoverSeriesBuilders:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HKWorkoutBuilder_clientRemote_didRecoverSeriesBuilders___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __58__HKWorkoutBuilder_clientRemote_didRecoverSeriesBuilders___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v10 = (id)objc_msgSend(v8, "_resourceQueue_seriesBuilderWithIdentifier:type:", v7, v9);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)clientRemote_didFinishRecovery
{
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_clientRemote_didFinishRecovery__block_invoke;
  block[3] = &unk_1E58BBA00;
  void block[4] = self;
  dispatch_sync(resourceQueue, block);
}

void __50__HKWorkoutBuilder_clientRemote_didFinishRecovery__block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 144));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 32));
    uint64_t v2 = v3;
  }
}

- (void)clientRemote_synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKWorkoutBuilder_clientRemote_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E58BBEC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, block);
}

uint64_t __59__HKWorkoutBuilder_clientRemote_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_stateDidChange:(int64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__132;
  id v23 = __Block_byref_object_dispose__133;
  id v24 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke;
  block[3] = &unk_1E58BBEE8;
  void block[4] = self;
  int64_t v18 = a3;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v17 = &v19;
  dispatch_sync(resourceQueue, block);
  uint64_t v13 = v20[5];
  if (v13) {
    (*(void (**)(uint64_t, HKWorkoutBuilder *, int64_t))(v13 + 16))(v13, self, a3);
  }

  _Block_object_dispose(&v19, 8);
}

void __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void *)(v3 + 88);
    uint64_t v5 = v2;
    id v6 = HKWorkoutBuilderConstructionStateToString(v4);
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v3;
    __int16 v42 = 2114;
    __int16 v43 = v6;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Server state updated to %{public}@", buf, 0x16u);
  }
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 24))
  {
    uint64_t v8 = [*(id *)(a1 + 40) copy];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;

    uint64_t v7 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v7 + 32))
  {
    uint64_t v11 = [*(id *)(a1 + 48) copy];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = v11;

    uint64_t v7 = *(void *)(a1 + 32);
  }
  [*(id *)(v7 + 96) enqueueEvent:*(void *)(v7 + 88) date:0 error:0 completion:&__block_literal_global_136];
  uint64_t v14 = *(void *)(a1 + 64);
  if (v14 == 2)
  {
    id v15 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 120));
    if (v15)
    {
      uint64_t v21 = *(void *)(a1 + 32);
      long long v22 = *(void **)(v21 + 120);
      *(void *)(v21 + 120) = 0;

      int64_t v18 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      long long v32 = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_3;
      uint64_t v33 = &unk_1E58BBEC0;
      uint64_t v19 = &v34;
      id v15 = v15;
      id v34 = v15;
      uint64_t v20 = &v30;
      goto LABEL_13;
    }
  }
  else
  {
    if (v14 != 1) {
      goto LABEL_15;
    }
    id v15 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 112));
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(void **)(v16 + 112);
      *(void *)(v16 + 112) = 0;

      int64_t v18 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      long long v37 = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_2;
      long long v38 = &unk_1E58BBEC0;
      uint64_t v19 = &v39;
      id v15 = v15;
      id v39 = v15;
      uint64_t v20 = &v35;
LABEL_13:
      dispatch_async(v18, v20);
    }
  }

LABEL_15:
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void *)(v23 + 88);
  uint64_t v25 = objc_msgSend(*(id *)(v23 + 96), "currentState", v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
  uint64_t v26 = [v25 index];

  if (v24 != v26) {
    [*(id *)(a1 + 32) _pushCurrentTargetState];
  }
  long long v27 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 136));
  uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;
}

uint64_t __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_finishedWorkout:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0;

  id v4 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 128));
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = 0;

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke_2;
    v8[3] = &unk_1E58BBF10;
    id v10 = v4;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v7, v8);
  }
}

uint64_t __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)clientRemote_didFailWithError:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0;

  id v4 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 112));
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = 0;

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_2;
    block[3] = &unk_1E58BBF10;
    id v34 = v4;
    id v33 = *(id *)(a1 + 40);
    dispatch_async(v7, block);
  }
  id v8 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 120));
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = 0;

    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_3;
    v29[3] = &unk_1E58BBF10;
    id v31 = v8;
    id v30 = *(id *)(a1 + 40);
    dispatch_async(v11, v29);
  }
  uint64_t v12 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 128));
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 128);
    *(void *)(v13 + 128) = 0;

    id v15 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_4;
    v26[3] = &unk_1E58BBF10;
    id v28 = v12;
    id v27 = *(id *)(a1 + 40);
    dispatch_async(v15, v26);
  }
  uint64_t v16 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  if (v16)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int64_t v18 = *(void **)(v17 + 152);
    *(void *)(v17 + 152) = 0;

    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_5;
    v23[3] = &unk_1E58BB9A0;
    id v20 = v16;
    uint64_t v21 = *(void *)(a1 + 32);
    long long v22 = *(void **)(a1 + 40);
    id v25 = v20;
    v23[4] = v21;
    id v24 = v22;
    dispatch_async(v19, v23);
  }
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)clientInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECEA440];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v2 setClasses:v3 forSelector:sel_clientRemote_didUpdateMetadata_ argumentIndex:0 ofReply:0];

  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didUpdateEvents_, 0, 0);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_clientRemote_didRecoverSeriesBuilders_ argumentIndex:0 ofReply:0];
  id v9 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didUpdateActivities_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED51C50];
  id v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addDataSourcesWithIdentifiers_, 0, 0);
  id v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removeDataSourcesWithIdentifiers_, 0, 0);
  id v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addSamples_completion_, 0, 0);
  id v6 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addWorkoutEvents_completion_, 0, 0);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v2 setClasses:v7 forSelector:sel_remote_addMetadata_completion_ argumentIndex:0 ofReply:0];

  id v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  [v2 setClasses:v8 forSelector:sel_remote_updateActivityWithUUID_addMetadata_completion_ argumentIndex:1 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  return +[HKWorkoutBuilder clientInterface];
}

- (id)remoteInterface
{
  return +[HKWorkoutBuilder serverInterface];
}

- (void)connectionInterrupted
{
  proxyProvider = self->_proxyProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke;
  v4[3] = &unk_1E58BBF38;
  void v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_255;
  v3[3] = &unk_1E58BBCC0;
  v3[4] = self;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v4 errorHandler:v3];
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Beginning recovery after server interruption.", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_253;
  v6[3] = &unk_1E58BBE28;
  void v6[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "remote_recoverWithCompletion:", v6);
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_253(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_253_cold_1();
    }
  }
  [*(id *)(a1 + 32) _pushCurrentTargetState];
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_255(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_255_cold_1();
  }
}

- (HKWorkoutBuilderConfiguration)configuration
{
  id v2 = [(HKTaskServerProxyProvider *)self->_proxyProvider taskConfiguration];
  id v3 = (void *)[v2 copy];

  return (HKWorkoutBuilderConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
}

- (void)_recoverWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = self;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Beginning client recovery.", buf, 0xCu);
  }
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke;
    aBlock[3] = &unk_1E58BBA50;
    aBlock[4] = self;
    id v13 = v4;
    id v4 = _Block_copy(aBlock);
  }
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_3;
  v10[3] = &unk_1E58BBC20;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_256;
  v8[3] = &unk_1E58BBC48;
  void v8[4] = self;
  id v9 = v11;
  id v7 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v10 errorHandler:v8];
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 200) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_2;
  block[3] = &unk_1E58BBA28;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4;
  v4[3] = &unk_1E58BBA50;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "remote_recoverWithCompletion:", v4);
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _restoreRecoveredSeriesBuildersWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_256(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_restoreRecoveredSeriesBuildersWithCompletion:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 168) allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  uint64_t v9 = a1;
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_2;
        v13[3] = &unk_1E58BBF60;
        id v15 = v20;
        uint64_t v14 = v2;
        [v7 recoverWithCompletion:v13];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  id v8 = *(NSObject **)(*(void *)(v9 + 32) + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_3;
  block[3] = &unk_1E58BBF88;
  id v11 = *(id *)(v9 + 40);
  char v12 = v20;
  dispatch_group_notify(v2, v8, block);

  _Block_object_dispose(v20, 8);
}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a2) {
    BOOL v3 = *(unsigned char *)(v2 + 24) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to restore 1 or more series builders");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v4);
  }
  else
  {
    uint64_t v2 = *(void (**)(uint64_t, void, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 32);
    v2(v3, 0, 0);
  }
}

- (void)unitTest_setServerStateChangeHandler:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HKWorkoutBuilder_unitTest_setServerStateChangeHandler___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

uint64_t __57__HKWorkoutBuilder_unitTest_setServerStateChangeHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)unitTest_setRecoveryFinishedHandler:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HKWorkoutBuilder_unitTest_setRecoveryFinishedHandler___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

uint64_t __56__HKWorkoutBuilder_unitTest_setRecoveryFinishedHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)unitTest_setFailureHandler:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HKWorkoutBuilder_unitTest_setFailureHandler___block_invoke;
  v7[3] = &unk_1E58BB978;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(resourceQueue, v7);
}

uint64_t __47__HKWorkoutBuilder_unitTest_setFailureHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (NSMutableDictionary)seriesBuilders
{
  return self->_seriesBuilders;
}

- (void)setSeriesBuilders:(id)a3
{
}

- (NSMutableDictionary)statisticsByType
{
  return self->_statisticsByType;
}

- (void)setStatisticsByType:(id)a3
{
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_statisticsByType, 0);
  objc_storeStrong((id *)&self->_seriesBuilders, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong(&self->_unitTest_failureHandler, 0);
  objc_storeStrong(&self->_unitTest_recoveryFinishedHandler, 0);
  objc_storeStrong(&self->_unitTest_serverStateChangedHandler, 0);
  objc_storeStrong(&self->_finishWorkoutCompletionHandler, 0);
  objc_storeStrong(&self->_endCollectionCompletionHandler, 0);
  objc_storeStrong(&self->_beginCollectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);
  objc_storeStrong((id *)&self->_constructionStateMachine, 0);
  objc_storeStrong((id *)&self->_activitiesPerUUID, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_workoutEndDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);
  objc_storeStrong((id *)&self->_builderConfiguration, 0);

  objc_storeStrong((id *)&self->_currentActivity, 0);
}

void __34__HKWorkoutBuilder_discardWorkout__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Failed to discard workout, make sure the workout builder is active: %{public}@", v2, v3, v4, v5, v6);
}

void __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to fetch current zones for type with error: %{public}@.");
}

- (void)stateMachine:didEnterState:date:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: No start date set after moving to active state.", v2, v3, v4, v5, v6);
}

- (void)stateMachine:didEnterState:date:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: No end date set after moving to active state.", v2, v3, v4, v5, v6);
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to update target construction state: %{public}@");
}

void __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "Unable to update workout builder server's device with error: %@", v2, v3, v4, v5, v6);
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_253_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to recover after connection invalidation: %{public}@");
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_255_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to restart task server after connection invalidation: %{public}@");
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: (#w0) Failed to recover workout after client restart: %{public}@.");
}

@end