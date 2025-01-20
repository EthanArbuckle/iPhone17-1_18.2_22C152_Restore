@interface HDWorkoutCondenser
+ (BOOL)_condenseAndUpdateWorkout:(void *)a3 configuration:(void *)a4 error:;
+ (id)_insertValuesForSeries:(void *)a3 quantityType:(void *)a4 startTime:(void *)a5 values:(void *)a6 provenance:(void *)a7 configuration:(void *)a8 transaction:(void *)a9 countOut:(uint64_t)a10 error:;
+ (id)_workoutEntitiesRequiringCondensationWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:;
+ (id)_workoutEntitiesRequiringCondensationWithProfile:(uint64_t)a3 limit:(char)a4 allowRecondensation:(void *)a5 analyticsAccumulator:(uint64_t)a6 error:;
+ (id)condensableQuantityTypes;
+ (id)seriesSyncIdentifierForEntity:(id)a3 workout:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)workoutEntitiesRequiringCondensationWithProfile:(id)a3 limit:(int64_t)a4 allowRecondensation:(BOOL)a5 error:(id *)a6;
+ (uint64_t)_deleteSamplesWithUUIDData:(void *)a3 configuration:(uint64_t)a4 error:;
+ (uint64_t)_finishSeries:(uint64_t)a1 quantityType:(void *)a2 workout:(void *)a3 UUIDDataToDelete:(void *)a4 configuration:(void *)a5 transaction:(void *)a6 error:(void *)a7;
- (BOOL)condenseWorkout:(id)a3 error:(id *)a4;
- (HDWorkoutCondenser)initWithProfile:(id)a3;
- (id)condensableWorkoutsWithError:(id *)a3;
- (id)condensedWorkoutsWithError:(id *)a3;
- (void)condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)setDeletedSamplesThreshold:(int64_t)a3;
- (void)setMaximumSeriesSize:(int64_t)a3;
- (void)setMinimumSeriesSize:(int64_t)a3;
@end

@implementation HDWorkoutCondenser

- (HDWorkoutCondenser)initWithProfile:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDWorkoutCondenser;
  v5 = [(HDWorkoutCondenser *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    *(_OWORD *)&v6->_minimumSeriesSize = xmmword_1BD340B80;
    v6->_deletedSamplesThreshold = 30000;
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v10 = [v9 features];
    int v11 = [v10 workoutCondenseOnLock];

    if (v11)
    {
      v12 = (const char *)*MEMORY[0x1E4F2A598];
      v13 = v6->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __38__HDWorkoutCondenser_initWithProfile___block_invoke;
      handler[3] = &unk_1E630D6A8;
      v14 = v6;
      v24 = v14;
      notify_register_dispatch(v12, &v6->_onLockDBAvailableNotificationToken, v13, handler);
      v15 = (const char *)*MEMORY[0x1E4F2A5A0];
      v16 = v6->_queue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __38__HDWorkoutCondenser_initWithProfile___block_invoke_2;
      v21[3] = &unk_1E630D6A8;
      v22 = v14;
      notify_register_dispatch(v15, v14 + 12, v16, v21);

      periodicActivity = v24;
    }
    else
    {
      v18 = [HDPeriodicActivity alloc];
      uint64_t v19 = [(HDPeriodicActivity *)v18 initWithProfile:v4 name:@"com.apple.healthd.HDWorkoutCondenser-activity" interval:v6 delegate:*MEMORY[0x1E4F29FB8] loggingCategory:(double)(uint64_t)*MEMORY[0x1E4F141E8]];
      periodicActivity = v6->_periodicActivity;
      v6->_periodicActivity = (HDPeriodicActivity *)v19;
    }
  }
  return v6;
}

void __38__HDWorkoutCondenser_initWithProfile___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 44) == a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (!*(void *)(v2 + 32))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 80));
      id v4 = [WeakRetained database];
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      id v11 = 0;
      uint64_t v7 = [v4 takeAccessibilityAssertionWithOwnerIdentifier:v6 timeout:&v11 error:300.0];
      id v8 = v11;
      v9 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = v7;

      if (!*(void *)(v2 + 32))
      {
        _HKInitializeLogging();
        v10 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = v2;
          __int16 v14 = 2114;
          id v15 = v8;
          _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ unable to get accessibilityAssertion before lock: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

void __38__HDWorkoutCondenser_initWithProfile___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 48) == a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (*(void *)(v2 + 32))
    {
      if (!*(unsigned char *)(v2 + 40))
      {
        _HKInitializeLogging();
        v3 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v4) = 138543362;
          *(void *)((char *)&v4 + 4) = v2;
          _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ condense workouts onLock started", (uint8_t *)&v4, 0xCu);
        }
        *(unsigned char *)(v2 + 40) = 1;
        *(void *)&long long v4 = MEMORY[0x1E4F143A8];
        *((void *)&v4 + 1) = 3221225472;
        v5 = __48__HDWorkoutCondenser__attemptOnLockCondensation__block_invoke;
        v6 = &unk_1E62F2978;
        uint64_t v7 = v2;
        [(id)v2 condenseWorkoutsForReason:3 workoutBatchLimit:2 completion:&v4];
      }
    }
  }
}

- (void)dealloc
{
  [(HDAssertion *)self->_preparedDatabaseAccessibilityAssertion invalidate];
  [(HDAssertion *)self->_onLockDatabaseAccessibilityAssertion invalidate];
  notify_cancel(self->_onLockDBAvailableNotificationToken);
  notify_cancel(self->_onLockDBUnavailableNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutCondenser;
  [(HDWorkoutCondenser *)&v3 dealloc];
}

void __48__HDWorkoutCondenser__attemptOnLockCondensation__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29FB8];
  uint64_t v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ condense workouts onLockCondensation finished", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: onLockCondensation failed %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
}

- (void)condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HDWorkoutCondenser_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke;
  v11[3] = &unk_1E630D6D0;
  int64_t v13 = a4;
  int64_t v14 = a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __77__HDWorkoutCondenser_condenseWorkoutsForReason_workoutBatchLimit_completion___block_invoke(void *a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = HKStringFromWorkoutCondenserReason();
  v71 = [v2 stringWithFormat:@"%@: condense workouts (%ld, %@)", v3, v4, v5];

  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v71;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v72 = +[HKDaemonTransaction transactionWithOwner:a1[4] activityName:@"condenseWorkouts"];
  id v8 = objc_alloc_init(_HDWorkoutCondenserAnalyticsAccumulator);
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[6];
  id v74 = 0;
  v73 = v8;
  if (v9)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v9 + 8));
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 80));
    id v12 = [WeakRetained daemon];
    int64_t v13 = [v12 behavior];
    char v14 = [v13 performsWorkoutCondensation];

    if (v14)
    {
      id v15 = *(id *)(v9 + 24);
      uint64_t v16 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = 0;

      if (!v15)
      {
        id v17 = objc_loadWeakRetained((id *)(v9 + 80));
        v18 = [v17 database];
        uint64_t v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v75[0] = 0;
        id v15 = [v18 takeAccessibilityAssertionWithOwnerIdentifier:v20 timeout:v75 error:300.0];
        id v21 = v75[0];

        if (!v15)
        {
          _HKInitializeLogging();
          v67 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_INFO, "%{public}@ workout condenser cannot run without access to protected data", buf, 0xCu);
          }
          id v68 = v21;
          id v24 = v68;
          if (v68) {
            id v74 = v68;
          }

          char v29 = 0;
          goto LABEL_9;
        }
      }
      v22 = v73;
      v23 = *(NSObject **)(v9 + 8);
      id v24 = v15;
      dispatch_assert_queue_V2(v23);
      objc_super v25 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v25 setCacheScope:1];
      [(HDMutableDatabaseTransactionContext *)v25 addAccessibilityAssertion:v24];

      id v26 = objc_loadWeakRetained((id *)(v9 + 80));
      v27 = [v26 database];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __110__HDWorkoutCondenser__queue_condenseWorkoutsWithAccessibilityAssertion_batchLimit_analyticsAccumulator_error___block_invoke;
      v78 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630D748;
      v79 = (void (*)(uint64_t))v9;
      uint64_t v81 = v10;
      v28 = v22;
      v80 = v28;
      char v29 = [v27 performWithTransactionContext:v25 error:&v74 block:buf];

      [v24 invalidate];
LABEL_9:
      buf[0] = v29;

      uint64_t v30 = buf[0];
      goto LABEL_12;
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E4F29FB8];
    uint64_t v30 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_INFO, "%{public}@ workout condenser is not enabled", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
LABEL_12:

  v32 = (uint64_t (*)(uint64_t, uint64_t))v74;
  [v72 invalidate];
  double v33 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  double v34 = v33 - Current;
  v35 = *MEMORY[0x1E4F29FB8];
  v36 = *MEMORY[0x1E4F29FB8];
  if (v30)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v71;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v34;
      _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ finished in %0.4f s, Success", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v71;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2114;
    v78 = v32;
    _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@ finished in %0.4f s, Error: %{public}@", buf, 0x20u);
  }
  uint64_t v37 = a1[4];
  uint64_t v69 = a1[6];
  uint64_t v70 = a1[7];
  v38 = v73;
  v39 = v32;
  if (v37)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v37 + 8));
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v78 = __Block_byref_object_copy__197;
    v79 = __Block_byref_object_dispose__197;
    v80 = 0;
    id v40 = objc_loadWeakRetained((id *)(v37 + 80));
    v41 = [v40 database];
    v75[0] = (id)MEMORY[0x1E4F143A8];
    v75[1] = (id)3221225472;
    v75[2] = __112__HDWorkoutCondenser__queue_submitAnalyticEventForReason_batchSize_success_duration_analyticsAccumulator_error___block_invoke;
    v75[3] = &unk_1E62F82A8;
    v75[4] = buf;
    id v76 = 0;
    BOOL v42 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v41 error:&v76 block:v75];
    id v43 = v76;

    if (v42)
    {
      uint64_t v44 = [*(id *)(*(void *)&buf[8] + 40) integerValue];
      id v45 = objc_loadWeakRetained((id *)(v37 + 80));
      v46 = [v45 daemon];
      v47 = [v46 analyticsSubmissionCoordinator];
      v48 = v47;
      if (v38)
      {
        int64_t workoutsToCondense = v38->_workoutsToCondense;
        int64_t workoutsToRecondense = v38->_workoutsToRecondense;
        int64_t condensedWorkouts = v38->_condensedWorkouts;
        int64_t processedWorkouts = v38->_processedWorkouts;
        int64_t createdSeries = v38->_createdSeries;
        int64_t deletedSamples = v38->_deletedSamples;
      }
      else
      {
        int64_t createdSeries = 0;
        int64_t condensedWorkouts = 0;
        int64_t workoutsToCondense = 0;
        int64_t workoutsToRecondense = 0;
        int64_t processedWorkouts = 0;
        int64_t deletedSamples = 0;
      }
      objc_msgSend(v47, "workout_reportWorkoutCondenserEventWithReason:batchSize:hasWatchSource:duration:success:error:workoutsToCondense:workoutsToRecondense:condensedWorkouts:processedWorkouts:createdSeries:deletedSamples:", v70, v69, v44 > 0, v30, v39, workoutsToCondense, v34, workoutsToRecondense, condensedWorkouts, processedWorkouts, createdSeries, deletedSamples);
    }
    else
    {
      _HKInitializeLogging();
      v55 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v82 = 138543618;
        uint64_t v83 = v37;
        __int16 v84 = 2114;
        id v85 = v43;
        _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Unable to determine if profile has any watch sources: %{public}@", v82, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  uint64_t v56 = a1[4];
  uint64_t v57 = a1[7];
  v58 = v39;
  if (v56)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v56 + 8));
    if (v57)
    {
      v59 = *(void **)(v56 + 16);
      if (v30) {
        [v59 didPerformActivityWithResult:0 minimumRetryInterval:0 activityStartDate:0 error:(double)(uint64_t)*MEMORY[0x1E4F141E8]];
      }
      else {
        [v59 didPerformActivityWithResult:2 minimumRetryInterval:0 activityStartDate:v58 error:0.0];
      }
    }
  }

  uint64_t v60 = a1[4];
  if (v60)
  {
    v61 = *(NSObject **)(v60 + 8);
    v62 = v58;
    dispatch_assert_queue_V2(v61);
    v63 = [HDTTRPromptController alloc];
    id v64 = objc_loadWeakRetained((id *)(v60 + 80));
    v65 = [(HDTTRPromptController *)v63 initWithProfile:v64 domainName:@"HDWorkoutCondenser" loggingCategory:*MEMORY[0x1E4F29FB8]];

    [(HDTTRPromptController *)v65 setMinimumPromptInterval:604800.0];
    [(HDTTRPromptController *)v65 setMaximumErrorCount:10];
    [(HDTTRPromptController *)v65 setNotificationTitle:@"Health Unable to Compress Older Workouts"];
    [(HDTTRPromptController *)v65 setNotificationMessage:@"Health has run into a number of errors while attempting to compress your older workouts"];
    [(HDTTRPromptController *)v65 setRadarTitle:@"[Database Efficiency] Workout Condenser Problem Detected"];
    [(HDTTRPromptController *)v65 setRadarDescription:@"The workout condenser has failed multiple times since last success"];
    v66 = HKStringFromWorkoutCondenserReason();
    [(HDTTRPromptController *)v65 promptIfRequiredForReason:v66 success:v30 error:v62];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (BOOL)condenseWorkout:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(_HDWorkoutCondenserAnalyticsAccumulator);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[_HDWorkoutCondensationConfiguration configurationWithProfile:minimumSeriesSize:maximumSeriesSize:deletedSampleThreshold:analyticsAccumulator:error:]((uint64_t)_HDWorkoutCondensationConfiguration, WeakRetained, self->_minimumSeriesSize, self->_maximumSeriesSize, self->_deletedSamplesThreshold, v7);
  uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v10 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
    uint64_t v11 = (void *)MEMORY[0x1E4F65D58];
    id v12 = [v6 UUID];
    int64_t v13 = HDDataEntityPredicateForDataUUID();
    char v14 = [v11 compoundPredicateWithPredicate:v13 otherPredicate:v10];

    id v15 = objc_loadWeakRetained(v9 + 1);
    uint64_t v16 = [v15 database];
    id v24 = 0;
    id v17 = +[HDHealthEntity anyWithPredicate:v14 healthDatabase:v16 error:&v24];
    id v18 = v24;

    if (v17)
    {
      BOOL v19 = +[HDWorkoutCondenser _condenseAndUpdateWorkout:configuration:error:]((uint64_t)HDWorkoutCondenser, v17, v9, a4);
LABEL_13:

      goto LABEL_14;
    }
    if (v18)
    {
      id v18 = v18;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = [v6 sourceRevision];
      v22 = objc_msgSend(v20, "hk_error:format:", 100, @"Unable to locate 1st Party Apple Watch workout entity for condensation with workout %@ from source %@", v6, v21);

      id v18 = v22;
      if (!v18)
      {
LABEL_12:
        BOOL v19 = 0;
        goto LABEL_13;
      }
    }
    if (a4) {
      *a4 = v18;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_12;
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

+ (BOOL)_condenseAndUpdateWorkout:(void *)a3 configuration:(void *)a4 error:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
  if (v7) {
    id WeakRetained = objc_loadWeakRetained(v7 + 1);
  }
  else {
    id WeakRetained = 0;
  }
  v57[0] = 0;
  uint64_t v11 = +[HDDataEntity objectWithID:v9 encodingOptions:0 profile:WeakRetained error:v57];
  id v12 = v57[0];

  if (v11)
  {
    id v13 = v11;
    id v14 = v6;
    id v15 = v7;
    uint64_t v54 = self;
    uint64_t v56 = v13;
    [v13 duration];
    if (v7) {
      double v17 = v15[3];
    }
    else {
      double v17 = 0.0;
    }
    v55 = a4;
    id v51 = v12;
    v52 = v11;
    if (v16 >= v17)
    {
      v49 = v7;
      id v50 = v6;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id obj = [(id)objc_opt_class() condensableQuantityTypes];
      uint64_t v23 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v63;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v63 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            v57[1] = (id)MEMORY[0x1E4F143A8];
            v57[2] = (id)3221225472;
            v57[3] = __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke;
            v57[4] = &unk_1E62FA180;
            uint64_t v61 = v54;
            v57[5] = v27;
            id v28 = v56;
            id v58 = v28;
            id v29 = v14;
            id v30 = v14;
            id v59 = v30;
            v31 = v15;
            uint64_t v60 = v31;
            int v32 = HKWithAutoreleasePool();

            if (!v32)
            {

              BOOL v22 = 0;
              uint64_t v7 = v49;
              id v6 = v50;
              goto LABEL_30;
            }
            id v14 = v29;
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      uint64_t v7 = v49;
      id v6 = v50;
    }
    else
    {
    }
    id v33 = v14;
    double v34 = v15;
    self;
    if (v7) {
      id v35 = objc_loadWeakRetained(v34 + 1);
    }
    else {
      id v35 = 0;
    }
    v36 = [v35 database];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __76__HDWorkoutCondenser__updateCondenserVersionForWorkout_configuration_error___block_invoke;
    v67 = &unk_1E62F6130;
    *(void *)id v68 = v33;
    id v37 = v33;
    BOOL v38 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v36 error:v55 block:buf];

    if (v38)
    {
      v39 = v7;
      id v40 = v56;
      uint64_t v41 = self;
      _HKInitializeLogging();
      BOOL v42 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        id v43 = v42;
        [v40 workoutActivityType];
        uint64_t v44 = _HKWorkoutActivityNameForActivityType();
        [v40 duration];
        id v45 = HKDiagnosticStringFromDuration();
        v46 = [v40 _creationDate];
        v47 = HKDiagnosticStringFromDate();
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2114;
        v67 = v44;
        *(_WORD *)id v68 = 2114;
        *(void *)&v68[2] = v45;
        __int16 v69 = 2114;
        uint64_t v70 = v47;
        _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_INFO, "%{public}@: condensed workout: %{public}@, type: %{public}@, duration: %{public}@, added: %{public}@", buf, 0x34u);
      }
      BOOL v22 = 1;
      uint64_t v7 = v39;
    }
    else
    {
      BOOL v22 = 0;
    }
LABEL_30:
    id v12 = v51;
    uint64_t v11 = v52;
  }
  else
  {
    _HKInitializeLogging();
    id v18 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      BOOL v19 = v18;
      uint64_t v20 = [v6 persistentID];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v67 = v12;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_INFO, "%{public}@: failed to lookup workout with persistentID %lld: %{public}@", buf, 0x20u);
    }
    id v21 = v12;
    BOOL v22 = v21 == 0;
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v22;
}

- (id)condensedWorkoutsWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F2AD90]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HDWorkoutCondenser_condensedWorkoutsWithError___block_invoke;
  v11[3] = &unk_1E630D6F8;
  id v12 = v5;
  id v7 = v5;
  LODWORD(a3) = +[HDWorkoutEntity enumerateCondensedWorkoutsWithPredicate:0 profile:WeakRetained error:a3 handler:v11];

  if (a3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

uint64_t __49__HDWorkoutCondenser_condensedWorkoutsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)condensableWorkoutsWithError:(id *)a3
{
  id v5 = objc_opt_class();
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [v5 workoutEntitiesRequiringCondensationWithProfile:WeakRetained limit:0 allowRecondensation:0 error:a3];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F2AD90]);
    id v10 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v11 = [v10 database];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__HDWorkoutCondenser_condensableWorkoutsWithError___block_invoke;
    v17[3] = &unk_1E62F2AE0;
    id v18 = v8;
    id v19 = v9;
    id v12 = v9;
    BOOL v13 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a3 block:v17];

    if (v13) {
      id v14 = v12;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __51__HDWorkoutCondenser_condensableWorkoutsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "codableCondensedWorkoutWithTransaction:error:", v5, a3, (void)v15);
        if (!v11)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        id v12 = (void *)v11;
        [*(id *)(a1 + 40) addWorkouts:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_11:

  return v13;
}

- (void)setMinimumSeriesSize:(int64_t)a3
{
  self->_minimumSeriesSize = a3;
}

- (void)setMaximumSeriesSize:(int64_t)a3
{
  self->_maximumSeriesSize = a3;
}

- (void)setDeletedSamplesThreshold:(int64_t)a3
{
  self->_deletedSamplesThreshold = a3;
}

+ (id)workoutEntitiesRequiringCondensationWithProfile:(id)a3 limit:(int64_t)a4 allowRecondensation:(BOOL)a5 error:(id *)a6
{
  return +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithProfile:limit:allowRecondensation:analyticsAccumulator:error:]((uint64_t)a1, a3, a4, a5, 0, (uint64_t)a6);
}

+ (id)_workoutEntitiesRequiringCondensationWithProfile:(uint64_t)a3 limit:(char)a4 allowRecondensation:(void *)a5 analyticsAccumulator:(uint64_t)a6 error:
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a2;
  uint64_t v9 = self;
  uint64_t v10 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
  uint64_t v11 = HDWorkoutEntityPredicateForWorkoutCondenserVersionLessThan(5);
  id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10368000.0];
  uint64_t v13 = HDDataEntityPredicateForCreationDate(3);

  id v14 = HDWorkoutEntityPredicateForDuration(6);
  long long v15 = (void *)MEMORY[0x1E4F65D08];
  id v30 = (void *)v11;
  v31 = (void *)v10;
  v40[0] = v10;
  v40[1] = v11;
  v40[2] = v13;
  v40[3] = v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  long long v17 = [v15 predicateMatchingAllPredicates:v16];

  long long v18 = HDWorkoutEntityPredicateForWorkoutCondenserVersionEqualTo(5);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = [v8 database];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __124__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithProfile_limit_allowRecondensation_analyticsAccumulator_error___block_invoke;
  v32[3] = &unk_1E630D770;
  uint64_t v37 = v9;
  uint64_t v38 = a3;
  id v33 = v17;
  id v34 = v7;
  id v21 = v19;
  char v39 = a4;
  id v35 = v21;
  id v36 = v18;
  id v22 = v18;
  id v23 = v7;
  id v24 = v17;
  LODWORD(v10) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a6 block:v32];

  if (v10) {
    id v25 = v21;
  }
  else {
    id v25 = 0;
  }

  return v25;
}

+ (id)seriesSyncIdentifierForEntity:(id)a3 workout:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__197;
  id v24 = __Block_byref_object_dispose__197;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__HDWorkoutCondenser_seriesSyncIdentifierForEntity_workout_transaction_error___block_invoke;
  v16[3] = &unk_1E630D720;
  long long v18 = &v20;
  id v19 = a1;
  id v13 = v11;
  id v17 = v13;
  if ([v10 startTimeEndTimeCountForSeriesWithTransaction:v12 error:a6 handler:v16]) {
    id v14 = (id)v21[5];
  }
  else {
    id v14 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v14;
}

void __78__HDWorkoutCondenser_seriesSyncIdentifierForEntity_workout_transaction_error___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id v8 = *(id *)(a1 + 32);
  self;
  uint64_t v9 = NSString;
  id v10 = [v8 UUID];

  id v11 = [v10 UUIDString];
  uint64_t v12 = [v9 stringWithFormat:@"%ld:%@:%.5f:%.5f:%lld", 5, v11, *(void *)&a3, *(void *)&a4, a2];

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

uint64_t __110__HDWorkoutCondenser__queue_condenseWorkoutsWithAccessibilityAssertion_batchLimit_analyticsAccumulator_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  id v5 = +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithProfile:limit:allowRecondensation:analyticsAccumulator:error:]((uint64_t)HDWorkoutCondenser, WeakRetained, *(void *)(a1 + 48), 1, *(void **)(a1 + 40), a2);

  if (v5)
  {
    if ([v5 count])
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      v27 = +[_HDWorkoutCondensationConfiguration configurationWithProfile:minimumSeriesSize:maximumSeriesSize:deletedSampleThreshold:analyticsAccumulator:error:]((uint64_t)_HDWorkoutCondensationConfiguration, v6, *(void *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), *(void *)(*(void *)(a1 + 32) + 72), *(void **)(a1 + 40));

      id v7 = v27;
      if (v27)
      {
        id v8 = v5;
        uint64_t v9 = v27;
        uint64_t v10 = self;
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v34 = 0;
        id v35 = (double *)&v34;
        uint64_t v36 = 0x2020000000;
        uint64_t v37 = 0;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id obj = v8;
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v46 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(obj);
              }
              id v29 = v9;
              uint64_t v15 = HKWithAutoreleasePool();
              if ((v15 & 1) == 0) {
                goto LABEL_27;
              }
              double v16 = CFAbsoluteTimeGetCurrent() - Current;
              if (v16 > 180.0)
              {
                _HKInitializeLogging();
                long long v18 = *MEMORY[0x1E4F29FB8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v19 = *((void *)v35 + 3);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v39 = v10;
                  __int16 v40 = 2048;
                  uint64_t v41 = v19;
                  __int16 v42 = 2048;
                  double v43 = v16;
                  _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: end with early success due to timeout, condensed %ld workouts in %0.4f s", buf, 0x20u);
                }
                goto LABEL_27;
              }
              id v17 = v9[7];
              if (v17) {
                id v17 = (void *)v17[7];
              }
              if ((uint64_t)v17 >= (uint64_t)v9[6])
              {
                _HKInitializeLogging();
                uint64_t v20 = (void *)*MEMORY[0x1E4F29FB8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                {
                  id v21 = v9[7];
                  uint64_t v22 = v21;
                  if (v21) {
                    uint64_t v23 = *((void *)v21 + 7);
                  }
                  else {
                    uint64_t v23 = 0;
                  }
                  double v24 = v35[3];
                  *(_DWORD *)buf = 138544130;
                  uint64_t v39 = v10;
                  __int16 v40 = 2048;
                  uint64_t v41 = v23;
                  __int16 v42 = 2048;
                  double v43 = v24;
                  __int16 v44 = 2048;
                  double v45 = v16;
                  id v25 = v20;
                  _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: end with early success due number of deleted samples (%ld), condensed %ld workouts in %0.4f s", buf, 0x2Au);
                }
LABEL_27:

                goto LABEL_28;
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v46 count:16];
            uint64_t v15 = 1;
            if (v12) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v15 = 1;
        }
LABEL_28:

        _Block_object_dispose(&v34, 8);
        id v7 = v27;
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __124__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithProfile_limit_allowRecondensation_analyticsAccumulator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = HDSampleEntityOrderingTermsForOldness();
  uint64_t v10 = +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithPredicate:limit:orderingTerms:transaction:error:](v7, v6, v8, v9, v5, a3);

  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = [v10 count];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    *(void *)(v12 + 16) = v11;
  }
  [*(id *)(a1 + 48) addObjectsFromArray:v10];
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_13;
  }
  if (!*(void *)(a1 + 72))
  {
    uint64_t v15 = 0;
LABEL_9:
    id v17 = *(void **)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    long long v18 = HDWorkoutEntityOrderingTermsForCondenserDate();
    uint64_t v19 = +[HDWorkoutCondenser _workoutEntitiesRequiringCondensationWithPredicate:limit:orderingTerms:transaction:error:](v16, v17, v15, v18, v5, a3);

    if (v19)
    {
      uint64_t v20 = [v19 count];
      uint64_t v21 = *(void *)(a1 + 40);
      if (v21) {
        *(void *)(v21 + 24) = v20;
      }
      [*(id *)(a1 + 48) addObjectsFromArray:v19];

      goto LABEL_13;
    }
LABEL_16:
    uint64_t v29 = 0;
    goto LABEL_17;
  }
  unint64_t v13 = [*(id *)(a1 + 48) count];
  unint64_t v14 = *(void *)(a1 + 72);
  if (v13 < v14)
  {
    uint64_t v15 = v14 - [*(id *)(a1 + 48) count];
    goto LABEL_9;
  }
LABEL_13:
  _HKInitializeLogging();
  uint64_t v22 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 64);
    double v24 = *(void **)(a1 + 48);
    id v25 = v22;
    uint64_t v26 = [v24 count];
    uint64_t v27 = [v10 count];
    uint64_t v28 = [*(id *)(a1 + 48) count];
    int v31 = 138544130;
    uint64_t v32 = v23;
    __int16 v33 = 2048;
    uint64_t v34 = v26;
    __int16 v35 = 2048;
    uint64_t v36 = v27;
    __int16 v37 = 2048;
    uint64_t v38 = v28 - [v10 count];
    _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld workouts requiring condensation (%ld uncondensed, %ld recondensable)", (uint8_t *)&v31, 0x2Au);
  }
  uint64_t v29 = 1;
LABEL_17:

  return v29;
}

+ (id)_workoutEntitiesRequiringCondensationWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a2;
  self;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v14 = [v10 databaseForEntityClass:objc_opt_class()];

  uint64_t v15 = +[HDSQLiteEntity queryWithDatabase:v14 predicate:v12 limit:a3 orderingTerms:v11 groupBy:0];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithPredicate_limit_orderingTerms_transaction_error___block_invoke;
  v20[3] = &unk_1E62F4CC0;
  id v21 = v13;
  id v16 = v13;
  if ([v15 enumeratePersistentIDsAndProperties:0 error:a6 enumerationHandler:v20]) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

uint64_t __111__HDWorkoutCondenser__workoutEntitiesRequiringCondensationWithPredicate_limit_orderingTerms_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [(HDSQLiteEntity *)[HDWorkoutEntity alloc] initWithPersistentID:a2];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

BOOL __60__HDWorkoutCondenser__condenseWorkouts_configuration_error___block_invoke(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"%@: condense workout %ld", a1[7], *(void *)(*(void *)(a1[6] + 8) + 24)];
  _HKInitializeLogging();
  id v5 = (NSObject **)MEMORY[0x1E4F29FB8];
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    double v24 = v4;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@ started", buf, 0xCu);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = a1[4];
  if (v8)
  {
    uint64_t v9 = *(id *)(v8 + 56);
    if (v9)
    {
      v9[8] = 0;
    }
  }
  uint64_t v10 = a1[7];
  id v12 = (void *)a1[4];
  id v11 = (void *)a1[5];
  id v22 = 0;
  BOOL v13 = +[HDWorkoutCondenser _condenseAndUpdateWorkout:configuration:error:](v10, v11, v12, &v22);
  id v14 = v22;
  double v15 = CFAbsoluteTimeGetCurrent() - Current;
  _HKInitializeLogging();
  id v16 = *v5;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543618;
      double v24 = v4;
      __int16 v25 = 2048;
      double v26 = v15;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, Success", buf, 0x16u);
    }
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543874;
      double v24 = v4;
      __int16 v25 = 2048;
      double v26 = v15;
      __int16 v27 = 2114;
      id v28 = v14;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, Error: %{public}@", buf, 0x20u);
    }
    id v18 = v14;
    if (v18)
    {
      if (a2) {
        *a2 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  uint64_t v19 = a1[4];
  if (v19)
  {
    uint64_t v20 = *(id *)(v19 + 56);
    if (v20)
    {
      ++v20[4];
    }
  }
  ++*(void *)(*(void *)(a1[6] + 8) + 24);

  return v13;
}

BOOL __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  v107[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 56);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  uint64_t v10 = v4;
  self;
  if ([v7 code] == 5)
  {
    v91 = a2;
    id v11 = (void *)MEMORY[0x1E4F65D00];
    id v90 = v7;
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    uint64_t v93 = [v11 predicateWithProperty:@"data_type" value:v12 comparisonType:1 influenceIndexUsage:1];

    BOOL v13 = [v8 startDate];
    id v14 = [v13 dateByAddingTimeInterval:-600.0];
    uint64_t v15 = HDSampleEntityPredicateForStartDate(5);

    id v16 = [v8 endDate];
    BOOL v17 = [v16 dateByAddingTimeInterval:600.0];
    uint64_t v18 = HDSampleEntityPredicateForStartDate(3);

    uint64_t v19 = [v8 endDate];
    uint64_t v20 = [v19 dateByAddingTimeInterval:600.0];
    uint64_t v21 = HDSampleEntityPredicateForEndDate(3);

    id v22 = (void *)MEMORY[0x1E4F65D08];
    v94 = (void *)v15;
    v107[0] = v15;
    v107[1] = v18;
    v87 = (void *)v21;
    v88 = (void *)v18;
    v107[2] = v21;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
    v92 = [v22 predicateMatchingAllPredicates:v23];

    id v89 = v9;
    uint64_t v24 = HDAssociationEntityPredicateForChildObjectsWhereAssocationExistsWithParentObject([v9 persistentID], 1);
    __int16 v25 = [v8 startDate];
    uint64_t v26 = HDSampleEntityPredicateForStartDate(6);

    __int16 v27 = [v8 endDate];
    uint64_t v28 = HDSampleEntityPredicateForStartDate(3);

    uint64_t v29 = [v8 endDate];
    uint64_t v30 = HDSampleEntityPredicateForEndDate(3);

    int v31 = (void *)MEMORY[0x1E4F65D08];
    __int16 v84 = (void *)v28;
    id v85 = (void *)v26;
    v106[0] = v26;
    v106[1] = v28;
    uint64_t v83 = (void *)v30;
    v106[2] = v30;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:3];
    uint64_t v33 = [v31 predicateMatchingAllPredicates:v32];

    uint64_t v34 = (void *)MEMORY[0x1E4F65D08];
    uint64_t v86 = (void *)v24;
    v105[0] = v24;
    v105[1] = v33;
    v82 = (void *)v33;
    __int16 v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    uint64_t v36 = [v34 predicateMatchingAnyPredicates:v35];

    if (v10) {
      id WeakRetained = objc_loadWeakRetained(v10 + 1);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v38 = [WeakRetained metadataManager];
    uint64_t v39 = *MEMORY[0x1E4F2BB28];
    __int16 v40 = [v38 predicateWithMetadataKey:*MEMORY[0x1E4F2BB28] exists:0];

    if (v10) {
      id v41 = objc_loadWeakRetained(v10 + 1);
    }
    else {
      id v41 = 0;
    }
    __int16 v42 = [v41 metadataManager];
    double v43 = [v42 predicateWithMetadataKey:v39 value:&unk_1F17EEFE8 operatorType:4];

    __int16 v44 = (void *)MEMORY[0x1E4F65D08];
    v104[0] = v40;
    v104[1] = v43;
    double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
    v46 = [v44 predicateMatchingAnyPredicates:v45];

    uint64_t v47 = (void *)MEMORY[0x1E4F65D08];
    *(void *)buf = v93;
    *(void *)&buf[8] = v92;
    if (v10) {
      id v48 = v10[2];
    }
    else {
      id v48 = 0;
    }
    *(void *)&buf[16] = v48;
    *(void *)&long long v103 = v36;
    *((void *)&v103 + 1) = v46;
    v49 = (void *)MEMORY[0x1E4F1C978];
    id v50 = v48;
    id v51 = [v49 arrayWithObjects:buf count:5];

    v52 = [v47 predicateMatchingAllPredicates:v51];

    id v7 = v90;
    a2 = v91;
    v53 = v88;
    id v9 = v89;
    uint64_t v54 = (void *)v93;
  }
  else
  {
    uint64_t v55 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject([v9 persistentID]);
    uint64_t v56 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v57 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    uint64_t v58 = [v56 predicateWithProperty:@"data_type" value:v57 comparisonType:1 influenceIndexUsage:0];

    id v59 = (void *)MEMORY[0x1E4F65D08];
    v94 = (void *)v58;
    *(void *)buf = v58;
    if (v10) {
      id v60 = v10[2];
    }
    else {
      id v60 = 0;
    }
    *(void *)&buf[8] = v60;
    *(void *)&buf[16] = v55;
    uint64_t v61 = (void *)MEMORY[0x1E4F1C978];
    id v62 = v60;
    v53 = [v61 arrayWithObjects:buf count:3];

    [v59 predicateMatchingAllPredicates:v53];
    v52 = uint64_t v54 = (void *)v55;
  }

  long long v63 = NSString;
  uint64_t v64 = *(void *)(a1 + 64);
  long long v65 = [*(id *)(a1 + 40) UUID];
  v66 = [v63 stringWithFormat:@"%@: condense workout (%@) samples with quantity type %@", v64, v65, *(void *)(a1 + 32)];

  _HKInitializeLogging();
  v67 = (os_log_t *)MEMORY[0x1E4F29FB8];
  id v68 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v66;
    _os_log_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_INFO, "%{public}@ started", buf, 0xCu);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v70 = *(void *)(a1 + 56);
  if (v70) {
    id v71 = objc_loadWeakRetained((id *)(v70 + 8));
  }
  else {
    id v71 = 0;
  }
  v72 = [v71 database];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke_325;
  v95[3] = &unk_1E6305DC0;
  uint64_t v73 = *(void *)(a1 + 32);
  id v74 = *(void **)(a1 + 40);
  uint64_t v100 = *(void *)(a1 + 64);
  id v101 = 0;
  v95[4] = v73;
  id v96 = v74;
  id v97 = *(id *)(a1 + 48);
  id v75 = v52;
  id v98 = v75;
  id v99 = *(id *)(a1 + 56);
  BOOL v76 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v72 error:&v101 block:v95];
  id v77 = v101;

  double v78 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v79 = *v67;
  if (os_log_type_enabled(*v67, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v66;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v78 - Current;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v103) = v76;
    WORD2(v103) = 2114;
    *(void *)((char *)&v103 + 6) = v77;
    _os_log_impl(&dword_1BCB7D000, v79, OS_LOG_TYPE_INFO, "%{public}@ finished in %0.4f s, (%{BOOL}d, %{public}@)", buf, 0x26u);
  }
  if (!v76)
  {
    id v80 = v77;
    if (v80)
    {
      if (a2) {
        *a2 = v80;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v76;
}

uint64_t __66__HDWorkoutCondenser__condenseWorkout_entity_configuration_error___block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  id v103 = v4;
  id v9 = v5;
  id v10 = v7;
  id v11 = a2;
  id v12 = v6;
  self;
  id v13 = v12;
  id v14 = v9;
  id v15 = v10;
  id v16 = v11;
  id v105 = v8;
  id v101 = [NSString stringWithFormat:@"%@: checking if workoutEntity (%@) requires processing for quantity type %@", self, v13, v105];

  _HKInitializeLogging();
  BOOL v17 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v101;
    _os_log_debug_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ started", buf, 0xCu);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v19 = v13;
  id v20 = v15;
  id v106 = v16;
  id v107 = v14;
  self;
  uint64_t v21 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"hfd_key"];
  id v22 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v107 otherPredicate:v21];

  uint64_t v23 = [v106 protectedDatabase];

  uint64_t v24 = *MEMORY[0x1E4F65C78];
  *(void *)buf = 0;
  __int16 v25 = +[HDSQLiteEntity countValueForProperty:v24 predicate:v22 database:v23 error:buf];
  id v26 = *(id *)buf;

  if (!v25)
  {
    if (v26)
    {
      id v26 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Error getting count of single value samples associated with workout entity %lld", objc_msgSend(v19, "persistentID"));
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
LABEL_16:
        unint64_t v29 = 0;
        goto LABEL_17;
      }
    }
    if (a3) {
      *a3 = v26;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_16;
  }
  uint64_t v27 = [v25 integerValue];
  if (v20) {
    uint64_t v28 = *((void *)v20 + 4);
  }
  else {
    uint64_t v28 = 0;
  }
  if (v27 >= v28) {
    unint64_t v29 = 1;
  }
  else {
    unint64_t v29 = 2;
  }
LABEL_17:

  double v30 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  int v31 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v86 = v31;
    v87 = HKStringFromFailableBooleanResult();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v101;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v30 - Current;
    *(_WORD *)&buf[22] = 2048;
    double v134 = v30 - Current;
    LOWORD(v135) = 2112;
    *(void *)((char *)&v135 + 2) = v87;
    _os_log_debug_impl(&dword_1BCB7D000, v86, OS_LOG_TYPE_DEBUG, "%{public}@ finished single value samples check in %0.5f (total %0.5f): %@", buf, 0x2Au);
  }
  if (v29 >= 2)
  {
    id v32 = v19;
    id v33 = v107;
    id v34 = v20;
    id v35 = v106;
    self;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    char v132 = 0;
    *(void *)&long long v108 = 0;
    *((void *)&v108 + 1) = &v108;
    long long v109 = 0x2020000000uLL;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v126 = 0;
    uint64_t v36 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v36 timeIntervalSinceReferenceDate];
    uint64_t v38 = v37;

    v126 = v38;
    id v117 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __114__HDWorkoutCondenser__hasSamplesThatOverlapInTimeWithEntity_enumerationPredicate_configuration_transaction_error___block_invoke;
    double v134 = COERCE_DOUBLE(&unk_1E630D7C0);
    *((void *)&v135 + 1) = &v123;
    v136 = &v129;
    v137 = &v108;
    uint64_t v39 = v34;
    *(void *)&long long v135 = v39;
    BOOL v40 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:v33 transaction:v35 options:0 error:&v117 handler:buf];
    id v41 = v117;
    id v42 = v41;
    if (v40)
    {
      if (v39) {
        uint64_t v43 = v39[4];
      }
      else {
        uint64_t v43 = 0;
      }
      if (*(void *)(*((void *)&v108 + 1) + 24) >= v43)
      {
        if (*((unsigned char *)v130 + 24)) {
          unint64_t v29 = 1;
        }
        else {
          unint64_t v29 = 2;
        }
      }
      else
      {
        unint64_t v29 = 2;
      }
LABEL_35:

      _Block_object_dispose(&v123, 8);
      _Block_object_dispose(&v108, 8);
      _Block_object_dispose(&v129, 8);

      double v44 = CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      double v45 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
      {
        id v89 = v45;
        id v90 = HKStringFromFailableBooleanResult();
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v101;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v44 - v30;
        *(_WORD *)&buf[22] = 2048;
        double v134 = v44 - Current;
        LOWORD(v135) = 2112;
        *(void *)((char *)&v135 + 2) = v90;
        _os_log_debug_impl(&dword_1BCB7D000, v89, OS_LOG_TYPE_DEBUG, "%{public}@ finished overlapping samples check in %0.5f (total %0.5f): %@", buf, 0x2Au);
      }
      goto LABEL_37;
    }
    if (v41)
    {
      id v42 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Error while enumerating samples associated with workout entity %lld to find overlaps", objc_msgSend(v32, "persistentID"));
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
LABEL_34:

        unint64_t v29 = 0;
        goto LABEL_35;
      }
    }
    if (a3)
    {
      id v42 = v42;
      *a3 = v42;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_34;
  }
LABEL_37:

  if (!v29)
  {
    uint64_t v46 = 0;
    goto LABEL_76;
  }
  if (v29 != 2)
  {
    if (v20)
    {
      uint64_t v47 = (unsigned __int8 *)*((id *)v20 + 7);
      if (!v47 || (int v48 = v47[8], v47, !v48))
      {
        v49 = *((id *)v20 + 7);
        if (v49)
        {
          ++v49[5];
        }
        id v50 = *((id *)v20 + 7);
        if (v50)
        {
          v50[8] = 1;
        }
      }
    }
    id v51 = v105;
    id v52 = v103;
    id v102 = v107;
    id v53 = v20;
    id v54 = v106;
    uint64_t v97 = self;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x3032000000;
    v126 = __Block_byref_object_copy__197;
    v127 = __Block_byref_object_dispose__197;
    id v128 = 0;
    id v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__197;
    v121 = __Block_byref_object_dispose__197;
    id v122 = 0;
    uint64_t v113 = 0;
    v114 = (double *)&v113;
    uint64_t v115 = 0x2020000000;
    unint64_t v116 = 0xFFEFFFFFFFFFFFFFLL;
    v112[0] = 0;
    v112[1] = v112;
    v112[2] = 0x2020000000;
    v112[3] = 0x8010000000000000;
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __104__HDWorkoutCondenser__processSamplesWithQuantityType_workout_predicate_configuration_transaction_error___block_invoke;
    double v134 = COERCE_DOUBLE(&unk_1E630D7E8);
    v142 = &v123;
    uint64_t v146 = v97;
    uint64_t v100 = v53;
    *(void *)&long long v135 = v100;
    id v59 = v54;
    *((void *)&v135 + 1) = v59;
    id v98 = (uint64_t *)v57;
    v136 = v98;
    id v96 = (long long *)v58;
    v137 = v96;
    id v99 = v55;
    id v138 = v99;
    id v60 = v56;
    id v139 = v60;
    v143 = v112;
    v144 = &v117;
    id v93 = v51;
    id v140 = v93;
    v145 = &v113;
    id v94 = v52;
    v95 = v59;
    id v141 = v94;
    if (!+[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v102 transaction:v59 options:0 error:a3 handler:buf])goto LABEL_74; {
    uint64_t v61 = [v60 count];
    }
    uint64_t v62 = [v99 count];
    if (!v20 || (unint64_t)(v62 + v61) >= v100[4])
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v63 = v99;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v108 objects:&v129 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v109;
        do
        {
          uint64_t v66 = 0;
          do
          {
            if (*(void *)v109 != v65) {
              objc_enumerationMutation(v63);
            }
            v67 = *(double **)(*((void *)&v108 + 1) + 8 * v66);
            if (![v60 count])
            {
              if (v67) {
                uint64_t v68 = *((void *)v67 + 4);
              }
              else {
                uint64_t v68 = 0;
              }
              *((void *)v114 + 3) = v68;
            }
            if (v67)
            {
              double v70 = v67[5];
              double v69 = v67[6];
              double v71 = v67[4];
            }
            else
            {
              double v69 = 0.0;
              double v71 = 0.0;
              double v70 = 0.0;
            }
            v72 = [MEMORY[0x1E4F2ADB0] datumWithStartTime:v71 value:v69 endTime:v70];
            [v60 addObject:v72];

            ++v66;
          }
          while (v64 != v66);
          uint64_t v73 = [v63 countByEnumeratingWithState:&v108 objects:&v129 count:16];
          uint64_t v64 = v73;
        }
        while (v73);
      }

      [v63 removeAllObjects];
      id v74 = v118[5];
      double v75 = v114[3];
      BOOL v76 = (void *)v124[5];
      id v91 = v94;
      id v77 = v93;
      v92 = v96;
      double v78 = v100;
      id v79 = v95;
      id v80 = v76;
      id v81 = v60;
      id v82 = v74;
      uint64_t v83 = self;
      __int16 v84 = +[HDWorkoutCondenser _insertValuesForSeries:quantityType:startTime:values:provenance:configuration:transaction:countOut:error:](v75, v83, v82, v77, v81, v80, v78, v79, 0, (uint64_t)a3);

      if (!v84)
      {

        goto LABEL_74;
      }
      char v85 = +[HDWorkoutCondenser _finishSeries:quantityType:workout:UUIDDataToDelete:configuration:transaction:error:](v83, v84, v77, v91, v92, v78, v79);

      if ((v85 & 1) == 0)
      {
LABEL_74:
        uint64_t v46 = 0;
        goto LABEL_75;
      }
      [v92 setLength:0];
    }
    if (!objc_msgSend(v98, "hk_countOfUUIDs")
      || +[HDWorkoutCondenser _deleteSamplesWithUUIDData:configuration:error:](v97, v98, v100, (uint64_t)a3))
    {
      uint64_t v46 = 1;
LABEL_75:

      _Block_object_dispose(v112, 8);
      _Block_object_dispose(&v113, 8);
      _Block_object_dispose(&v117, 8);

      _Block_object_dispose(&v123, 8);
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  uint64_t v46 = 1;
LABEL_76:

  return v46;
}

uint64_t __114__HDWorkoutCondenser__hasSamplesThatOverlapInTimeWithEntity_enumerationPredicate_configuration_transaction_error___block_invoke(void *a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 + 0.00000011920929 < *(double *)(*(void *)(a1[5] + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) += a8;
  uint64_t v8 = a1[4];
  if (v8) {
    uint64_t v8 = *(void *)(v8 + 32);
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) >= v8 && *(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    return 0;
  }
  uint64_t v10 = *(void *)(a1[5] + 8);
  double v11 = *(double *)(v10 + 24);
  if (v11 <= a3) {
    double v11 = a3;
  }
  *(double *)(v10 + 24) = v11;
  return 1;
}

uint64_t __104__HDWorkoutCondenser__processSamplesWithQuantityType_workout_predicate_configuration_transaction_error___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, const unsigned __int8 *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    id v20 = [(HDSQLiteEntity *)[HDQuantitySampleEntity alloc] initWithPersistentID:a2];
    uint64_t v21 = *(void **)(a1 + 32);
    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v21;
    id v25 = v22;
    self;
    id v26 = [v25 protectedDatabase];
    uint64_t v27 = [(HDSQLiteEntity *)v23 valueForProperty:@"provenance" database:v26];
    double v78 = v24;
    uint64_t v79 = a13;
    if (v27)
    {
      if (v24) {
        id WeakRetained = objc_loadWeakRetained(v24 + 1);
      }
      else {
        id WeakRetained = 0;
      }
      unint64_t v29 = [WeakRetained dataProvenanceManager];
      double v30 = [v29 originProvenanceForPersistentID:v27 transaction:v25 error:a13];

      if (v30) {
        id v31 = v30;
      }

      id v32 = v78;
    }
    else
    {
      id v32 = v24;
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a13, 100, @"Unable to get %@ for persistentID %lld", @"provenance", -[HDSQLiteEntity persistentID](v23, "persistentID"));
      double v30 = 0;
    }

    uint64_t v33 = *(void *)(*(void *)(a1 + 96) + 8);
    id v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v30;

    uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    a13 = v79;
    if (!v35) {
      return 0;
    }
  }
  uint64_t v36 = [_HDWorkoutCondenserBufferDatum alloc];
  if (v36
    && (v80.receiver = v36,
        v80.super_class = (Class)_HDWorkoutCondenserBufferDatum,
        (__int16 v37 = objc_msgSendSuper2(&v80, sel_init)) != 0))
  {
    uint64_t v38 = v37;
    *((double *)v37 + 4) = a6;
    *((double *)v37 + 5) = a7;
    *((double *)v37 + 6) = a5;
    uuid_copy(v37 + 8, a9);
    v38[24] = a11 > 1;
    if (a11 >= 2)
    {
      int v39 = 0;
      BOOL v40 = (id *)(a1 + 48);
      goto LABEL_17;
    }
    int v39 = 0;
  }
  else
  {
    uint64_t v38 = 0;
    int v39 = 1;
  }
  BOOL v40 = (id *)(a1 + 56);
LABEL_17:
  objc_msgSend(*v40, "hk_appendUUIDBytes:", a9);
  id v41 = *(void **)(a1 + 64);
  id v42 = v38;
  id v43 = v41;
  self;
  double v44 = [v43 lastObject];
  double v45 = v44;
  if (v44)
  {
    if (v39)
    {
      if (v44[4] != 0.0) {
        goto LABEL_25;
      }
      id v77 = v44;
      goto LABEL_54;
    }
    if (v42[4] == v44[4])
    {
      uint64_t v46 = v44;
      if (v42[4] != v45[4])
      {
        BOOL v76 = [MEMORY[0x1E4F28B00] currentHandler];
        [v76 handleFailureInMethod:sel_shouldReplaceDatum_, v42, @"HDWorkoutCondenser.m", 1460, @"Invalid parameter not satisfying: %@", @"_startTime == anotherDatum->_startTime" object file lineNumber description];
      }
      double v47 = v42[5];
      double v48 = v46[5];
      if (v47 < v48) {
        goto LABEL_23;
      }
      if (v47 <= v48)
      {
        double v73 = v42[6];
        double v74 = v46[6];
        if (v73 < v74)
        {
LABEL_23:

LABEL_24:
          [v43 removeLastObject];
          goto LABEL_25;
        }
        if (v73 <= v74)
        {
          uint64_t v75 = HKCompareUUIDBytes();

          if (v75 == -1) {
            goto LABEL_26;
          }
          goto LABEL_24;
        }
      }
LABEL_54:

      goto LABEL_26;
    }
  }
LABEL_25:
  [v43 addObject:v42];
LABEL_26:

  unint64_t v49 = [*(id *)(a1 + 64) count];
  uint64_t v50 = *(void *)(a1 + 32);
  if (!v50 || v49 >= *(void *)(v50 + 32))
  {
    uint64_t v52 = [*(id *)(a1 + 64) firstObject];
    unint64_t v53 = [*(id *)(a1 + 72) count];
    id v54 = *(void **)(a1 + 32);
    if (v54 && v53 < v54[5]) {
      goto LABEL_41;
    }
    double v55 = v52 ? *(double *)(v52 + 32) + 0.00000011920929 : 0.00000011920929;
    if (v55 < *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
      goto LABEL_41;
    }
    v80.receiver = 0;
    uint64_t v56 = +[HDWorkoutCondenser _insertValuesForSeries:quantityType:startTime:values:provenance:configuration:transaction:countOut:error:](*(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24), *(void *)(a1 + 128), *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40), *(void **)(a1 + 80), *(void **)(a1 + 72), *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v54, *(void **)(a1 + 40), &v80, a13);
    uint64_t v57 = *(void *)(*(void *)(a1 + 112) + 8);
    id v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    id v59 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    if (v59)
    {
      id v60 = *(void **)(a1 + 32);
      if (v60) {
        uint64_t v61 = v60[5];
      }
      else {
        uint64_t v61 = 0;
      }
      if ((uint64_t)v80.receiver < v61) {
        goto LABEL_40;
      }
      if (+[HDWorkoutCondenser _finishSeries:quantityType:workout:UUIDDataToDelete:configuration:transaction:error:](*(void *)(a1 + 128), v59, *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 56), v60, *(void **)(a1 + 40)))
      {
        uint64_t v62 = *(void *)(*(void *)(a1 + 112) + 8);
        id v63 = *(void **)(v62 + 40);
        *(void *)(v62 + 40) = 0;

        [*(id *)(a1 + 56) setLength:0];
LABEL_40:
        [*(id *)(a1 + 72) removeAllObjects];
LABEL_41:
        if (![*(id *)(a1 + 72) count])
        {
          if (v52)
          {
            *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = *(void *)(v52 + 32);
            uint64_t v64 = *(void *)(v52 + 40);
          }
          else
          {
            *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
            uint64_t v64 = 0;
          }
          *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v64;
        }
        uint64_t v65 = *(void *)(*(void *)(a1 + 104) + 8);
        double v66 = *(double *)(v65 + 24);
        if (v52)
        {
          if (v66 < *(double *)(v52 + 40)) {
            double v66 = *(double *)(v52 + 40);
          }
          *(double *)(v65 + 24) = v66;
          double v68 = *(double *)(v52 + 40);
          double v67 = *(double *)(v52 + 48);
          double v69 = *(double *)(v52 + 32);
        }
        else
        {
          double v67 = 0.0;
          if (v66 < 0.0) {
            double v66 = 0.0;
          }
          *(double *)(v65 + 24) = v66;
          double v69 = 0.0;
          double v68 = 0.0;
        }
        double v70 = *(void **)(a1 + 72);
        double v71 = [MEMORY[0x1E4F2ADB0] datumWithStartTime:v69 value:v67 endTime:v68];
        [v70 addObject:v71];

        [*(id *)(a1 + 64) removeObjectAtIndex:0];
        uint64_t v51 = 1;
        goto LABEL_50;
      }
    }
    uint64_t v51 = 0;
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v51 = 1;
LABEL_51:

  return v51;
}

+ (id)_insertValuesForSeries:(void *)a3 quantityType:(void *)a4 startTime:(void *)a5 values:(void *)a6 provenance:(void *)a7 configuration:(void *)a8 transaction:(void *)a9 countOut:(uint64_t)a10 error:
{
  uint64_t v16 = a10;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id WeakRetained = a3;
  id v56 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = self;
  double v55 = v19;
  if (!WeakRetained)
  {
    id v51 = v21;
    _HKInitializeLogging();
    uint64_t v23 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = v23;
      *(_DWORD *)buf = 138543874;
      uint64_t v59 = v22;
      __int16 v60 = 2114;
      uint64_t v61 = (uint64_t)v56;
      __int16 v62 = 2048;
      uint64_t v63 = [v18 count];
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "%{public}@: create series quantityType %{public}@ with %lu values", buf, 0x20u);
    }
    uint64_t v52 = v20;
    id v53 = v18;
    uint64_t v50 = v22;
    if (v20) {
      id WeakRetained = objc_loadWeakRetained(v20 + 1);
    }
    else {
      id WeakRetained = 0;
    }
    id v25 = (void *)[v56 dataObjectClass];
    id v26 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v27 = [v56 canonicalUnit];
    uint64_t v28 = [v26 quantityWithUnit:v27 doubleValue:0.0];
    unint64_t v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a1];
    double v30 = [v25 _unfrozenQuantitySampleWithQuantityType:v56 quantity:v28 startDate:v29 device:0];

    id v31 = [WeakRetained dataManager];
    uint64_t v57 = v30;
    id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    uint64_t v33 = [HDSourceEntity alloc];
    id v34 = [v19 sourceID];
    uint64_t v35 = -[HDSQLiteEntity initWithPersistentID:](v33, "initWithPersistentID:", [v34 longLongValue]);
    uint64_t v36 = [HDDeviceEntity alloc];
    __int16 v37 = [v19 deviceID];
    uint64_t v38 = -[HDSQLiteEntity initWithPersistentID:](v36, "initWithPersistentID:", [v37 longLongValue]);
    int v39 = [v19 sourceVersion];
    int v40 = [v31 insertDataObjects:v32 sourceEntity:v35 deviceEntity:v38 sourceVersion:v39 creationDate:a10 error:CFAbsoluteTimeGetCurrent()];

    if (!v40)
    {
      uint64_t v46 = 0;
      id v20 = v52;
      id v18 = v53;
      id v21 = v51;
      goto LABEL_18;
    }
    uint64_t v41 = [v30 UUID];

    id WeakRetained = (id)v41;
    id v20 = v52;
    id v18 = v53;
    uint64_t v22 = v50;
    id v21 = v51;
    uint64_t v16 = a10;
  }
  id v42 = [v21 protectedDatabase];
  id v43 = HDDataEntityPredicateForDataUUID();
  double v30 = +[HDDataEntity anyInDatabase:v42 predicate:v43 error:v16];

  if (!v30) {
    goto LABEL_16;
  }
  _HKInitializeLogging();
  double v44 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    double v48 = v44;
    uint64_t v49 = [v18 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = v22;
    __int16 v60 = 2048;
    uint64_t v61 = v49;
    _os_log_debug_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEBUG, "%{public}@: insert %lu values into series", buf, 0x16u);
  }
  if ([v30 insertValues:v18 transaction:v21 error:v16])
  {
    if (a9)
    {
      double v45 = [v30 countForSeriesWithTransaction:v21 error:v16];
      uint64_t v46 = v45;
      if (!v45) {
        goto LABEL_18;
      }
      *a9 = [v45 integerValue];
    }
    id WeakRetained = WeakRetained;
    uint64_t v46 = WeakRetained;
  }
  else
  {
LABEL_16:
    uint64_t v46 = 0;
  }
LABEL_18:

  return v46;
}

+ (uint64_t)_finishSeries:(uint64_t)a1 quantityType:(void *)a2 workout:(void *)a3 UUIDDataToDelete:(void *)a4 configuration:(void *)a5 transaction:(void *)a6 error:(void *)a7
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  self;
  id v26 = v16;
  unint64_t v29 = v15;
  uint64_t v27 = v12;
  uint64_t v28 = v13;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v17;
  id v23 = v16;
  uint64_t v24 = HKWithAutoreleasePool();

  return v24;
}

+ (uint64_t)_deleteSamplesWithUUIDData:(void *)a3 configuration:(uint64_t)a4 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = objc_msgSend(v6, "hk_countOfUUIDs");
  _HKInitializeLogging();
  uint64_t v10 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138543618;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    _os_log_debug_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: delete %ld condensed samples", (uint8_t *)&v17, 0x16u);
    if (!v7) {
      goto LABEL_5;
    }
  }
  else if (!v7)
  {
    goto LABEL_5;
  }
  double v11 = v7[7];
  if (v11)
  {
    v11[7] += v9;
  }
LABEL_5:
  id v12 = objc_alloc_init(HDDataDeletionConfiguration);
  [(HDDataDeletionConfiguration *)v12 setFailIfNotFound:0];
  [(HDDataDeletionConfiguration *)v12 setPreserveExactStartAndEndDates:1];
  if (v7) {
    id WeakRetained = objc_loadWeakRetained(v7 + 1);
  }
  else {
    id WeakRetained = 0;
  }
  id v14 = [WeakRetained dataManager];
  uint64_t v15 = [v14 deleteObjectsWithUUIDCollection:v6 configuration:v12 error:a4];

  return v15;
}

uint64_t __106__HDWorkoutCondenser__finishSeries_quantityType_workout_UUIDDataToDelete_configuration_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v51[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [*(id *)(a1 + 40) protectedDatabase];
  id v7 = HDDataEntityPredicateForDataUUID();
  uint64_t v8 = +[HDDataEntity anyInDatabase:v6 predicate:v7 error:a2];

  if (v8)
  {
    id v43 = WeakRetained;
    uint64_t v9 = *(void **)(a1 + 64);
    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    id v12 = v10;
    id v13 = v9;
    id v14 = v8;
    uint64_t v15 = [self seriesSyncIdentifierForEntity:v14 workout:v13 transaction:v12 error:a2];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v17 = *MEMORY[0x1E4F2A1F8];
      v51[0] = *MEMORY[0x1E4F2A1F0];
      v51[1] = v17;
      *(void *)buf = v15;
      *(void *)&buf[8] = &unk_1F17EF000;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v51 count:2];
      __int16 v19 = [v16 dictionaryWithDictionary:v18];

      if ([v11 code] == 5) {
        [v19 setObject:&unk_1F17EEFE8 forKeyedSubscript:*MEMORY[0x1E4F2BB28]];
      }
    }
    else
    {
      __int16 v19 = 0;
    }
    id WeakRetained = v43;

    if (v19)
    {
      _HKInitializeLogging();
      uint64_t v21 = (os_log_t *)MEMORY[0x1E4F29FB8];
      id v22 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = *(void *)(a1 + 80);
        id v34 = *(void **)(a1 + 64);
        uint64_t v35 = v22;
        uint64_t v36 = [v34 UUID];
        __int16 v37 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v36;
        __int16 v47 = 2114;
        double v48 = v37;
        __int16 v49 = 2114;
        uint64_t v50 = v19;
        _os_log_debug_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEBUG, "%{public}@: workout (%{public}@) freeze series %{public}@ with metadata: %{public}@", buf, 0x2Au);
      }
      id v23 = +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:*(void *)(a1 + 48) metadata:v19 endDate:0 profile:v43 error:a2];
      if (v23)
      {
        _HKInitializeLogging();
        os_log_t v24 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = *(void *)(a1 + 80);
          int v39 = *(void **)(a1 + 64);
          int v40 = v24;
          uint64_t v41 = [v39 UUID];
          id v42 = [v23 frozenIdentifier];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v41;
          __int16 v47 = 2114;
          double v48 = v42;
          _os_log_debug_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEBUG, "%{public}@: workout (%{public}@) associate series %{public}@", buf, 0x20u);
        }
        id v25 = [v23 frozenIdentifier];
        double v45 = v25;
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        uint64_t v27 = [*(id *)(a1 + 64) UUID];
        id v44 = 0;
        BOOL v28 = +[HDAssociationEntity associateSampleUUIDs:v26 withSampleUUID:v27 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v44 profile:v43 error:a2];
        id v29 = v44;

        if (v28)
        {
          uint64_t v30 = *(void *)(a1 + 32);
          if (v30)
          {
            id v31 = *(id *)(v30 + 56);
            if (v31)
            {
              ++v31[6];
            }
          }
          uint64_t v20 = +[HDWorkoutCondenser _deleteSamplesWithUUIDData:configuration:error:](*(void *)(a1 + 80), *(void **)(a1 + 72), *(void **)(a1 + 32), a2);
        }
        else
        {
          uint64_t v20 = 0;
        }
        id WeakRetained = v43;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

uint64_t __76__HDWorkoutCondenser__updateCondenserVersionForWorkout_configuration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = [v5 date];
  uint64_t v8 = [v4 updateCondenserVersion:5 date:v7 transaction:v6 error:a3];

  return v8;
}

+ (id)condensableQuantityTypes
{
  v29[25] = *MEMORY[0x1E4F143B8];
  BOOL v28 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  v29[0] = v28;
  uint64_t v27 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
  v29[1] = v27;
  id v26 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
  v29[2] = v26;
  id v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
  v29[3] = v25;
  os_log_t v24 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E8]];
  v29[4] = v24;
  id v23 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  v29[5] = v23;
  id v22 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B0]];
  v29[6] = v22;
  uint64_t v21 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B8]];
  v29[7] = v21;
  uint64_t v20 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C0]];
  v29[8] = v20;
  __int16 v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C8]];
  v29[9] = v19;
  uint64_t v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8D0]];
  v29[10] = v18;
  uint64_t v17 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
  v29[11] = v17;
  id v16 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A660]];
  v29[12] = v16;
  uint64_t v15 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A668]];
  v29[13] = v15;
  id v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A650]];
  v29[14] = v14;
  uint64_t v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A910]];
  v29[15] = v2;
  uint64_t v3 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A948]];
  v29[16] = v3;
  uint64_t v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C8]];
  v29[17] = v4;
  id v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C0]];
  v29[18] = v5;
  id v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7A8]];
  v29[19] = v6;
  id v7 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D0]];
  v29[20] = v7;
  uint64_t v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
  v29[21] = v8;
  uint64_t v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A648]];
  v29[22] = v9;
  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A870]];
  v29[23] = v10;
  id v11 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8A8]];
  v29[24] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:25];

  return v13;
}

BOOL __112__HDWorkoutCondenser__queue_submitAnalyticEventForReason_batchSize_success_duration_analyticsAccumulator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F65C78];
  id v6 = a2;
  id v7 = HDSourceEntityPredicateForAppleWatchSources();
  uint64_t v8 = [v6 unprotectedDatabase];

  uint64_t v9 = +[HDSQLiteEntity countValueForProperty:v5 predicate:v7 database:v8 error:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  uint64_t v4 = (const char *)*MEMORY[0x1E4F14138];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14318], 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = self;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation enqueued", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_378;
  v13[3] = &unk_1E6301108;
  v13[4] = self;
  id v14 = v5;
  id v8 = v5;
  uint64_t v9 = +[HDMaintenanceOperation maintenanceOperationWithName:@"Workout Condensing" asynchronousBlock:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained daemon];
  id v12 = [v11 maintenanceWorkCoordinator];
  [v12 enqueueMaintenanceOperation:v9];
}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = [WeakRetained database];
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v12 = 0;
  uint64_t v6 = [v3 takeAccessibilityAssertionWithOwnerIdentifier:v5 timeout:&v12 error:300.0];
  id v7 = v12;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v6;

  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@ unable to get accessibilityAssertion before enqueing maintenance operation: %{public}@", buf, 0x16u);
    }
  }
}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_378(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation running", buf, 0xCu);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_379;
  v8[3] = &unk_1E62FF6D8;
  v8[4] = v6;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 condenseWorkoutsForReason:0 workoutBatchLimit:500 completion:v8];
}

void __57__HDWorkoutCondenser_performPeriodicActivity_completion___block_invoke_379(void *a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void (**)(uint64_t))(v4 + 16);
  id v6 = a3;
  v5(v4);
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[4];
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "%{public}@: maintenance operation finished", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1[4] + 24) invalidate];
  uint64_t v9 = a1[4];
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  (*(void (**)(double))(a1[6] + 16))(0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsAccumulator, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_onLockDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end