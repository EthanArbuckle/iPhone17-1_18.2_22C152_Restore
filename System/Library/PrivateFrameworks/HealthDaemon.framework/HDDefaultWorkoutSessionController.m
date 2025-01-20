@interface HDDefaultWorkoutSessionController
+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4;
+ (id)recoveryIdentifier;
- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3;
- (HDDefaultWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6;
- (id)_ownerIdentifier;
- (id)_typesToCollect;
- (uint64_t)_currentActivityMoveMode;
- (void)_instantiateSwimTrackerActivityTypeIfNeeded:(uint64_t)a1;
- (void)_lowPowerModeStateChanged:(id)a3;
- (void)_queue_setupAssertionGroup;
- (void)_startSwimTrackerWithIdentifier:(uint64_t)a1;
- (void)beginNewActivity:(id)a3;
- (void)dealloc;
- (void)endCurrentActivity:(id)a3;
- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4;
- (void)hktest_setStateTransitionCompletionHandler:(id)a3;
- (void)receivedWorkoutEvent:(id)a3;
- (void)receivedWorkoutEvent:(id)a3 forWorkoutActivity:(id)a4;
- (void)unitTest_setCMWorkoutManager:(id)a3;
- (void)unitTest_suggestActivity:(id)a3;
- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4;
- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6;
@end

@implementation HDDefaultWorkoutSessionController

- (HDDefaultWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HDDefaultWorkoutSessionController;
  v12 = [(HDDefaultWorkoutSessionController *)&v32 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v9);
    uint64_t v14 = HKCreateSerialDispatchQueue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_sessionConfiguration, a4);
    objc_storeWeak((id *)&v13->_sessionStateController, v11);
    currentActivity = v13->_currentActivity;
    v13->_currentActivity = 0;

    v17 = v13->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__HDDefaultWorkoutSessionController_initWithProfile_sessionConfiguration_sessionStateController_recoveryState___block_invoke;
    block[3] = &unk_1E62F3208;
    v18 = v13;
    v31 = v18;
    dispatch_sync(v17, block);
    v19 = [HDWorkoutEventsManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    uint64_t v21 = [(HDWorkoutEventsManager *)v19 initWithProfile:WeakRetained];
    eventsManager = v18->_eventsManager;
    v18->_eventsManager = (HDWorkoutEventsManager *)v21;

    id v23 = objc_loadWeakRetained((id *)&v13->_profile);
    v24 = [v23 workoutManager];
    uint64_t v25 = [v24 newBiomeInterface];
    bmInterface = v18->_bmInterface;
    v18->_bmInterface = (HDBiomeInterface *)v25;

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v18 selector:sel__lowPowerModeStateChanged_ name:*MEMORY[0x1E4F287E8] object:0];

    v28 = [(HDWorkoutSessionConfiguration *)v13->_sessionConfiguration sessionIdentifier];
    -[HDDefaultWorkoutSessionController _startSwimTrackerWithIdentifier:]((uint64_t)v18, v28);
  }
  return v13;
}

void __111__HDDefaultWorkoutSessionController_initWithProfile_sessionConfiguration_sessionStateController_recoveryState___block_invoke(uint64_t a1)
{
}

- (void)_queue_setupAssertionGroup
{
  v79[5] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v2 = objc_alloc_init(HDSessionAssertionGroup);
    v3 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v2;

    v4 = [*(id *)(a1 + 32) workoutConfiguration];
    uint64_t v5 = [v4 activityType];

    objc_initWeak(&location, (id)a1);
    v6 = [HDSessionAssertionWrapper alloc];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke;
    v68[3] = &unk_1E63008C0;
    objc_copyWeak(&v69, &location);
    v45 = [(HDSessionAssertionWrapper *)v6 initWithCreateAndTakeBlock:v68];
    v7 = [HDSessionAssertionWrapper alloc];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_2;
    v66[3] = &unk_1E63008C0;
    objc_copyWeak(&v67, &location);
    v43 = [(HDSessionAssertionWrapper *)v7 initWithCreateAndTakeBlock:v66];
    v8 = [HDSessionAssertionWrapper alloc];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_3;
    v64[3] = &unk_1E63008C0;
    objc_copyWeak(&v65, &location);
    v44 = [(HDSessionAssertionWrapper *)v8 initWithCreateAndTakeBlock:v64];
    id v9 = [HDSessionAssertionWrapper alloc];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_4;
    v62[3] = &unk_1E63008C0;
    objc_copyWeak(&v63, &location);
    id v10 = [(HDSessionAssertionWrapper *)v9 initWithCreateAndTakeBlock:v62];
    id v11 = [HDSessionAssertionWrapper alloc];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_5;
    v60[3] = &unk_1E63008C0;
    objc_copyWeak(&v61, &location);
    v41 = [(HDSessionAssertionWrapper *)v11 initWithCreateAndTakeBlock:v60];
    v12 = [HDSessionAssertionWrapper alloc];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_6;
    v58[3] = &unk_1E63008C0;
    objc_copyWeak(&v59, &location);
    v42 = [(HDSessionAssertionWrapper *)v12 initWithCreateAndTakeBlock:v58];
    v13 = [HDSessionAssertionWrapper alloc];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_7;
    v56[3] = &unk_1E63008C0;
    objc_copyWeak(&v57, &location);
    v40 = [(HDSessionAssertionWrapper *)v13 initWithCreateAndTakeBlock:v56];
    uint64_t v14 = [HDSessionAssertionWrapper alloc];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_8;
    v54[3] = &unk_1E63008C0;
    objc_copyWeak(&v55, &location);
    v15 = [(HDSessionAssertionWrapper *)v14 initWithCreateAndTakeBlock:v54];
    v16 = [HDSessionAssertionWrapper alloc];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_9;
    v52[3] = &unk_1E63008C0;
    objc_copyWeak(&v53, &location);
    v39 = [(HDSessionAssertionWrapper *)v16 initWithCreateAndTakeBlock:v52];
    v17 = [HDSessionAssertionWrapper alloc];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_10;
    v50[3] = &unk_1E63008C0;
    objc_copyWeak(&v51, &location);
    v18 = [(HDSessionAssertionWrapper *)v17 initWithCreateAndTakeBlock:v50];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v19 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:&unk_1F17ECCA8];
    v79[0] = v45;
    v79[1] = v43;
    v79[2] = v44;
    v79[3] = v10;
    v79[4] = v18;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:5];
    [v19 setObject:v20 forKeyedSubscript:&unk_1F17ECCC0];

    uint64_t v21 = [v19 objectForKeyedSubscript:&unk_1F17ECCC0];
    [v19 setObject:v21 forKeyedSubscript:&unk_1F17ECCD8];

    v22 = [v19 objectForKeyedSubscript:&unk_1F17ECCC0];
    [v19 setObject:v22 forKeyedSubscript:&unk_1F17ECCF0];

    v78[0] = v45;
    v78[1] = v43;
    v78[2] = v44;
    v78[3] = v10;
    v78[4] = v41;
    v78[5] = v42;
    v78[6] = v40;
    v78[7] = v15;
    v78[8] = v18;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:9];
    [v19 setObject:v23 forKeyedSubscript:&unk_1F17ECD08];

    v77[0] = v45;
    v77[1] = v43;
    v77[2] = v44;
    v77[3] = v10;
    v77[4] = v41;
    v77[5] = v42;
    v77[6] = v40;
    v77[7] = v15;
    v77[8] = v18;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:9];
    [v19 setObject:v24 forKeyedSubscript:&unk_1F17ECD20];

    v76[0] = v45;
    v76[1] = v43;
    v76[2] = v44;
    v76[3] = v10;
    v76[4] = v41;
    v76[5] = v42;
    v76[6] = v15;
    v76[7] = v18;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:8];
    [v19 setObject:v25 forKeyedSubscript:&unk_1F17ECD38];

    v75[0] = v45;
    v75[1] = v44;
    v75[2] = v10;
    v75[3] = v41;
    v75[4] = v42;
    v75[5] = v40;
    v75[6] = v15;
    v75[7] = v18;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:8];
    v27 = (void *)[v26 mutableCopy];

    if (v5 != 61) {
      [v27 addObject:v43];
    }
    [v19 setObject:v27 forKeyedSubscript:&unk_1F17ECD50];
    v74[0] = v45;
    v74[1] = v43;
    v74[2] = v44;
    v74[3] = v10;
    v74[4] = v42;
    v74[5] = v40;
    v74[6] = v15;
    v74[7] = v18;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:8];
    [v19 setObject:v28 forKeyedSubscript:&unk_1F17ECD68];
    [v19 setObject:v28 forKeyedSubscript:&unk_1F17ECD80];
    v73[0] = v45;
    v73[1] = v43;
    v73[2] = v44;
    v73[3] = v10;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
    [v19 setObject:v29 forKeyedSubscript:&unk_1F17ECD98];
    v30 = [v29 arrayByAddingObject:v39];
    [v19 setObject:v30 forKeyedSubscript:&unk_1F17ECDB0];

    v72 = v39;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [v19 setObject:v31 forKeyedSubscript:&unk_1F17ECDC8];

    [v19 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:&unk_1F17ECDE0];
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&v63);

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v32 = [v19 countByEnumeratingWithState:&v46 objects:v71 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v19);
          }
          v35 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v36 = [v35 integerValue];
          v37 = *(void **)(a1 + 40);
          v38 = [v19 objectForKeyedSubscript:v35];
          [v37 setupState:v36 withAssertions:v38];
        }
        uint64_t v32 = [v19 countByEnumeratingWithState:&v46 objects:v71 count:16];
      }
      while (v32);
    }
  }
}

- (void)_startSwimTrackerWithIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && _os_feature_enabled_impl()) {
    [*(id *)(a1 + 88) startWith:v3];
  }
}

- (void)dealloc
{
  [(HDSessionAssertionGroup *)self->_assertionGroup invalidate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDDefaultWorkoutSessionController;
  [(HDDefaultWorkoutSessionController *)&v4 dealloc];
}

- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6
{
  id v9 = a6;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__HDDefaultWorkoutSessionController_workoutSessionServer_didTransitionFromState_toState_date___block_invoke;
  v12[3] = &unk_1E62F6BF8;
  int64_t v14 = a4;
  int64_t v15 = a5;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(queue, v12);
}

void __94__HDDefaultWorkoutSessionController_workoutSessionServer_didTransitionFromState_toState_date___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      id v3 = -[HDDefaultWorkoutSessionController _typesToCollect](v2);
      +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:v3];
    }
  }
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 56);
  [*(id *)(*(void *)(a1 + 32) + 40) transitionToState:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 96);
  if (v5)
  {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(v4 + 56), *(void *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  [*(id *)(v4 + 64) workoutSessionWithConfiguration:*(void *)(v4 + 32) transitionedToState:*(void *)(a1 + 56) fromState:*(void *)(a1 + 48)];
  switch(*(void *)(a1 + 56))
  {
    case 7:
      uint64_t v21 = *(void *)(a1 + 48);
      switch(v21)
      {
        case 17:
          goto LABEL_19;
        case 9:
          return;
        case 8:
LABEL_19:
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
          id v23 = [WeakRetained daemon];
          v24 = [v23 workoutPluginExtension];
          id v58 = [v24 coreMotionWorkoutInterface];

          v20 = [*(id *)(*(void *)(a1 + 32) + 32) sessionIdentifier];
          [v58 resumeWorkoutForWorkoutSessionUUID:v20];
          goto LABEL_20;
      }
      uint64_t v44 = *(void *)(a1 + 32);
      if (!v44) {
        return;
      }
      _HKInitializeLogging();
      v45 = (os_log_t *)MEMORY[0x1E4F29FB8];
      long long v46 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        long long v47 = *(void **)(v44 + 32);
        long long v48 = v46;
        long long v49 = [v47 workoutConfiguration];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        _os_log_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: Enabling low power mode, if necessary, with configuration: %@", buf, 0x16u);
      }
      v50 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v26 = [v50 persistentDomainForName:@"com.apple.nanolifestyle.sessiontrackerapp"];

      id v51 = [v26 objectForKey:@"EnablePowerSavingMode"];
      if (!v51) {
        goto LABEL_32;
      }
      v52 = v51;
      int v53 = [v51 BOOLValue];

      if (v53)
      {
        v54 = [MEMORY[0x1E4F28F80] processInfo];
        int v55 = [v54 isLowPowerModeEnabled];

        if (v55)
        {
          _HKInitializeLogging();
          v56 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v44;
            _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Low power mode is already enabled; do nothing.",
              buf,
              0xCu);
          }
        }
        else
        {
          id v57 = [*(id *)(v44 + 32) workoutConfiguration];
          [v57 setShouldUseLowPowerMode:1];

          id v26 = objc_loadWeakRetained((id *)(v44 + 16));
          v37 = [*(id *)(v44 + 32) workoutConfiguration];
          [v26 generateConfigurationUpdate:v37];
LABEL_31:

LABEL_32:
        }
      }
      return;
    case 8:
    case 0x11:
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      v18 = [v17 daemon];
      id v19 = [v18 workoutPluginExtension];
      id v58 = [v19 coreMotionWorkoutInterface];

      v20 = [*(id *)(*(void *)(a1 + 32) + 32) sessionIdentifier];
      [v58 pauseWorkoutForWorkoutSessionUUID:v20];
LABEL_20:

      return;
    case 0xBLL:
      uint64_t v25 = *(void *)(a1 + 32);
      id v26 = *(id *)(a1 + 40);
      if (!v25) {
        goto LABEL_32;
      }
      _HKInitializeLogging();
      v27 = (os_log_t *)MEMORY[0x1E4F29FB8];
      v28 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v25;
        _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Requesting post-stop data aggregation for all collected types and pending events collection.", buf, 0xCu);
      }
      v29 = dispatch_group_create();
      dispatch_group_enter(v29);
      id v30 = objc_loadWeakRetained((id *)(v25 + 8));
      v31 = [v30 dataCollectionManager];
      uint64_t v32 = *(void *)(v25 + 80);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke;
      id v69 = &unk_1E62F5D48;
      uint64_t v70 = v25;
      uint64_t v33 = v29;
      v71 = v33;
      [v31 requestAggregationThroughDate:v26 types:v32 mode:0 options:3 completion:buf];

      dispatch_group_enter(v33);
      _HKInitializeLogging();
      v34 = *v27;
      if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v63) = 138543362;
        *(void *)((char *)&v63 + 4) = v25;
        _os_log_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting pending events collection", (uint8_t *)&v63, 0xCu);
      }
      v35 = *(void **)(v25 + 48);
      uint64_t v36 = [*(id *)(v25 + 32) sessionIdentifier];
      *(void *)&long long v63 = MEMORY[0x1E4F143A8];
      *((void *)&v63 + 1) = 3221225472;
      v64 = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_338;
      id v65 = &unk_1E62F31C0;
      v37 = v33;
      v66 = v37;
      uint64_t v67 = v25;
      [v35 requestPendingEventsThroughDate:v26 sessionIdentifier:v36 completion:&v63];

      id v38 = objc_loadWeakRetained((id *)(v25 + 8));
      v39 = [v38 daemon];
      v40 = [v39 workoutPluginExtension];
      v41 = [v40 coreMotionWorkoutInterface];

      if (v41)
      {
        dispatch_group_enter(v37);
        v42 = [*(id *)(v25 + 32) sessionIdentifier];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_339;
        v61[3] = &unk_1E63008E8;
        v61[4] = v25;
        v62 = v37;
        [v41 averageMETsForWorkoutSessionUUID:v42 completion:v61];
      }
      v43 = *(NSObject **)(v25 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_341;
      block[3] = &unk_1E62F31C0;
      void block[4] = v25;
      id v60 = v26;
      dispatch_group_notify(v37, v43, block);

      goto LABEL_31;
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        _HKInitializeLogging();
        v7 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(void **)(v6 + 32);
          id v9 = v7;
          id v10 = [v8 workoutConfiguration];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Disabling low power mode, if necessary, with configuration: %@", buf, 0x16u);
        }
        id v11 = [*(id *)(v6 + 32) workoutConfiguration];
        int v12 = [v11 shouldUseLowPowerMode];

        if (v12)
        {
          id v13 = [*(id *)(v6 + 32) workoutConfiguration];
          [v13 setShouldUseLowPowerMode:0];

          id v14 = objc_loadWeakRetained((id *)(v6 + 16));
          int64_t v15 = [*(id *)(v6 + 32) workoutConfiguration];
          [v14 generateConfigurationUpdate:v15];
        }
      }
      v16 = *(void **)(*(void *)(a1 + 32) + 88);
      [v16 stop];
      return;
    default:
      return;
  }
}

- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__HDDefaultWorkoutSessionController_workoutSessionServer_didChangeConfiguration___block_invoke;
  v8[3] = &unk_1E62F31C0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __81__HDDefaultWorkoutSessionController_workoutSessionServer_didChangeConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) activityConfigurations];
  [*(id *)(a1 + 32) setActivityConfigurations:v2];

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(v3 + 40);
  -[HDDefaultWorkoutSessionController _queue_setupAssertionGroup](v3);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "transitionToState:", objc_msgSend(v4, "state"));
  [v4 invalidate];
}

+ (id)recoveryIdentifier
{
  return 0;
}

- (void)beginNewActivity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HDDefaultWorkoutSessionController_beginNewActivity___block_invoke;
    v8[3] = &unk_1E62F31C0;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Not beginning activity as workoutActivity is nil", buf, 2u);
    }
  }
}

void __54__HDDefaultWorkoutSessionController_beginNewActivity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [WeakRetained daemon];
  id v4 = [v3 workoutPluginExtension];
  id v17 = [v4 coreMotionWorkoutInterface];

  id v5 = [*(id *)(a1 + 40) workoutConfiguration];
  uint64_t v6 = [v5 suggestedActivityUUID];
  BOOL v7 = v6 == 0;

  [v17 setCurrentActivity:*(void *)(a1 + 40) isManualTransition:v7];
  v8 = (void *)[*(id *)(a1 + 40) copy];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(v9 + 72) workoutConfiguration];
  -[HDDefaultWorkoutSessionController _instantiateSwimTrackerActivityTypeIfNeeded:](v9, [v10 activityType]);

  uint64_t v11 = *(void *)(a1 + 32);
  int v12 = [*(id *)(v11 + 72) UUID];
  -[HDDefaultWorkoutSessionController _startSwimTrackerWithIdentifier:](v11, v12);

  id v13 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v14 = [v5 activityType];
  int64_t v15 = [*(id *)(a1 + 40) UUID];
  [v13 updateEventCollectorsForActivityType:v14 activityIdentifier:v15];

  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v16 didBeginNewActivity:v8];
}

- (void)_instantiateSwimTrackerActivityTypeIfNeeded:(uint64_t)a1
{
  if (a1 && a2 == 46 && !*(void *)(a1 + 88) && _os_feature_enabled_impl())
  {
    uint64_t v3 = [_TtC12HealthDaemon13HDSwimTracker alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v4 = [(HDSwimTracker *)v3 initWithProfile:WeakRetained];
    id v5 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v4;
  }
}

- (void)endCurrentActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HDDefaultWorkoutSessionController_endCurrentActivity___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__HDDefaultWorkoutSessionController_endCurrentActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) workoutConfiguration];
  [*(id *)(*(void *)(a1 + 32) + 88) stop];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v5 = [v8 activityType];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 32) sessionIdentifier];
  [v4 updateEventCollectorsForActivityType:v5 activityIdentifier:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained didEndCurrentActivity:*(void *)(a1 + 40)];
}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HDWorkoutSessionConfiguration *)self->_sessionConfiguration enableWorkoutChangeDetection];
  if (v5)
  {
    [(HDWorkoutSessionConfiguration *)self->_sessionConfiguration setActivityConfigurations:v4];
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      sessionConfiguration = self->_sessionConfiguration;
      id v8 = v6;
      uint64_t v9 = [(HDWorkoutSessionConfiguration *)sessionConfiguration clientApplicationIdentifier];
      id v10 = [(HDWorkoutSessionConfiguration *)self->_sessionConfiguration activityConfigurations];
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      int64_t v15 = v10;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Automatic change detection enabled for activity configurations from %@ with configurations %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (void)receivedWorkoutEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  BOOL v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "Received workout event %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HDDefaultWorkoutSessionController_receivedWorkoutEvent___block_invoke;
  v8[3] = &unk_1E62F31C0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __58__HDDefaultWorkoutSessionController_receivedWorkoutEvent___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sessionId];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 32) sessionIdentifier];
  if ([v2 isEqual:v3])
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) sessionId];
    BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 72) UUID];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v16 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
      {
        id v17 = *(void **)(a1 + 32);
        v18 = v16;
        id v19 = [v17 sessionId];
        v20 = [*(id *)(*(void *)(a1 + 40) + 32) sessionIdentifier];
        uint64_t v21 = [*(id *)(*(void *)(a1 + 40) + 72) UUID];
        *(_DWORD *)buf = 138543874;
        v28 = v19;
        __int16 v29 = 2114;
        id v30 = v20;
        __int16 v31 = 2114;
        uint64_t v32 = v21;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_INFO, "Event received for non current sessionID: %{public}@, session ID: %{public}@, current activity ID: %{public}@", buf, 0x20u);
      }
      return;
    }
  }
  if ((*(void *)(*(void *)(a1 + 40) + 56) != 9 || [*(id *)(a1 + 32) eventType] != 7)
    && [*(id *)(a1 + 32) eventType] != 3
    && [*(id *)(a1 + 32) eventType] != 2)
  {
    if ([*(id *)(a1 + 32) eventType] == 12)
    {
      id v7 = [*(id *)(a1 + 32) metadata];
      id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2A178]];
      int v9 = [v8 BOOLValue];

      id v10 = [*(id *)(*(void *)(a1 + 40) + 32) workoutConfiguration];
      uint64_t v11 = v10;
      if (v9) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 3;
      }
      [v10 setLocationType:v12];

      uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 32) workoutConfiguration];
      [v13 setShouldDisambiguateLocation:0];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      int64_t v15 = [*(id *)(*(void *)(a1 + 40) + 32) workoutConfiguration];
      [WeakRetained generateConfigurationUpdate:v15];

      [*(id *)(*(void *)(a1 + 40) + 64) workoutConfigurationUpdated:*(void *)(*(void *)(a1 + 40) + 32)];
    }
    else
    {
      id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      [v22 generateEvent:*(void *)(a1 + 32)];
    }
    uint64_t v23 = [*(id *)(a1 + 32) eventType];
    if (v23 == 8)
    {
      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      v24 = [*(id *)(a1 + 32) dateInterval];
      uint64_t v25 = [v24 startDate];
      [v26 autoResumeWithDate:v25];
    }
    else
    {
      if (v23 != 7) {
        return;
      }
      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      v24 = [*(id *)(a1 + 32) dateInterval];
      uint64_t v25 = [v24 startDate];
      [v26 autoPauseWithDate:v25];
    }
  }
}

- (void)receivedWorkoutEvent:(id)a3 forWorkoutActivity:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Received workout event %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HDDefaultWorkoutSessionController_receivedWorkoutEvent_forWorkoutActivity___block_invoke;
  block[3] = &unk_1E62F30F8;
  id v13 = v6;
  id v14 = v7;
  int64_t v15 = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __77__HDDefaultWorkoutSessionController_receivedWorkoutEvent_forWorkoutActivity___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) workoutEventType] == 14)
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 138543362;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Suggested workout acivity: %{public}@ ", (uint8_t *)&v5, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
    [WeakRetained didDetectActivityChange:*(void *)(a1 + 40)];
  }
}

+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4
{
  return 1;
}

- (void)hktest_setStateTransitionCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HDDefaultWorkoutSessionController_hktest_setStateTransitionCompletionHandler___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __80__HDDefaultWorkoutSessionController_hktest_setStateTransitionCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
}

- (void)unitTest_suggestActivity:(id)a3
{
  p_sessionStateController = &self->_sessionStateController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  [WeakRetained didDetectActivityChange:v4];
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "faking workout detection %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(HDWorkoutEventsManager *)self->_eventsManager fakeActivityDetection:v6 workoutActivity:v7];
}

- (id)_ownerIdentifier
{
  uint64_t v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [v2 process];
  id v4 = [v3 applicationIdentifier];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) clientApplicationIdentifier];
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    int v9 = [*(id *)(a1 + 32) sessionIdentifier];
    id v8 = [v9 UUIDString];
  }

  return v8;
}

- (id)_typesToCollect
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) workoutConfiguration];
  uint64_t v3 = [v2 activityType];

  id v4 = [*(id *)(a1 + 32) workoutConfiguration];
  BOOL v5 = [v4 locationType] == 2;

  uint64_t v6 = -[HDDefaultWorkoutSessionController _currentActivityMoveMode](a1);
  uint64_t v18 = [MEMORY[0x1E4F2B778] observedTypesForActivityType:v3 isIndoor:v5 connectedToFitnessMachine:0 activityMode:v6];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
  id v8 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C8]];
  [v7 addObject:v8];
  if (-[HDDefaultWorkoutSessionController _currentActivityMoveMode](a1) == 2)
  {
    int v9 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5D0]];
    [v7 addObject:v9];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [*(id *)(a1 + 32) activityConfigurations];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        int64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v15 activityType] == 13)
        {
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F2B778], "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", objc_msgSend(v15, "activityType"), 0, 0, v6);
          [v7 unionSet:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v7;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    id v4 = [v3 daemon];
    BOOL v5 = [v4 workoutPluginExtension];

    uint64_t v6 = [v2[4] clientProcessBundleIdentifier];
    id v7 = [v5 alertSuppressor];
    id v8 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    int v9 = [v7 createAndTakeAssertionForOwnerIdentifier:v8 processBundleIdentifier:v6];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    id v4 = [v3 daemon];
    BOOL v5 = [v4 workoutPluginExtension];

    uint64_t v6 = [v5 backgroundWorkoutRunner];
    id v7 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    id v8 = [v2[4] client];
    int v9 = objc_msgSend(v6, "takeBackgroundRunningAssertionForOwnerIdentifier:client:includeCoreLocationAssertion:", v7, v8, objc_msgSend(v2[4], "requiresCoreLocationAssertion"));
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    id v4 = [v3 daemon];
    BOOL v5 = [v4 workoutPluginExtension];

    if ([v2[4] supports3rdPartyAOT])
    {
      uint64_t v6 = 1;
    }
    else
    {
      id v7 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
      uint64_t v6 = [v7 isEqualToString:@"com.apple.SessionTrackerApp"];
    }
    id v8 = [v5 carouselServicesManager];
    int v9 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    id v10 = [v8 takeSessionAssertionForOwnerIdentifier:v9 supportsAOT:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    id v8 = 0;
    goto LABEL_8;
  }
  char v3 = [WeakRetained[4] supportsAppRelaunchForRecovery];
  if (!_HDIsUnitTesting && (v3 & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
    {
      id v5 = v2[4];
      uint64_t v6 = v4;
      id v7 = [v5 clientProcessBundleIdentifier];
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "Keep alive assertion not taken for client %{public}@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_6;
  }
  id v9 = objc_loadWeakRetained(v2 + 1);
  id v10 = [v9 daemon];
  uint64_t v11 = [v10 workoutPluginExtension];

  uint64_t v12 = [v2[4] clientApplicationIdentifier];
  uint64_t v13 = [v2[4] clientProcessBundleIdentifier];
  id v14 = [v11 appLauncher];
  id v8 = [v14 takeKeepAliveAssertionForApplicationBundleIdentifier:v12 processBundleIdentifier:v13 payloadOptions:MEMORY[0x1E4F1CC08]];

LABEL_8:

  return v8;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    id v4 = [v3 daemon];
    id v5 = [v4 workoutPluginExtension];

    if ([v2[4] enableWorkoutChangeDetection])
    {
      uint64_t v6 = [v2[4] activityConfigurations];
      BOOL v7 = [v6 count] != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    id v8 = [v5 coreMotionWorkoutInterface];
    id v9 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    id v10 = [v2[4] sessionIdentifier];
    uint64_t v11 = [v2[4] workoutConfiguration];
    uint64_t v12 = [v2[4] activityConfigurations];
    uint64_t v13 = [v8 takeCMWorkoutAssertionForOwnerIdentifier:v9 sessionUUID:v10 workoutConfiguration:v11 activityConfigurations:v12 enableWorkoutChangeDetection:v7];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_6(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v23 = (uint64_t)WeakRetained;
    id v3 = -[HDDefaultWorkoutSessionController _typesToCollect]((uint64_t)WeakRetained);
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    id v4 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (([v10 isEqual:v4] & 1) == 0)
          {
            uint64_t v11 = NSNumber;
            uint64_t v12 = [v10 code];
            BOOL v13 = v12 == 179 || v12 == 75;
            double v14 = 60.0;
            if (!v13) {
              double v14 = 0.5;
            }
            int64_t v15 = [v11 numberWithDouble:v14];
            [v24 setObject:v15 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    int v16 = +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:1 hasRunningWorkout:1 hasBackgroundObserver:0];
    uint64_t v2 = (void *)v23;
    id v17 = objc_loadWeakRetained((id *)(v23 + 8));
    uint64_t v18 = [v17 dataCollectionManager];
    long long v19 = -[HDDefaultWorkoutSessionController _ownerIdentifier](v23);
    long long v20 = [v18 takeCollectionAssertionWithOwnerIdentifier:v19 collectionIntervalsByType:v24 observerState:v16];

    if (v20) {
      objc_storeStrong((id *)(v23 + 80), obj);
    }
  }
  else
  {
    long long v20 = 0;
  }

  return v20;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_7(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    id v3 = -[HDDefaultWorkoutSessionController _typesToCollect]((uint64_t)WeakRetained);
    int v4 = [v3 containsObject:v2];

    if (v4)
    {
      id v5 = +[HDDataCollectionObserverState dataCollectionObserverStateInForeground:1 hasRunningWorkout:1 hasBackgroundObserver:0];
      id v6 = objc_loadWeakRetained(WeakRetained + 1);
      uint64_t v7 = [v6 dataCollectionManager];
      uint64_t v8 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)WeakRetained);
      id v17 = v2;
      id v9 = NSNumber;
      uint64_t v10 = [v2 code];
      BOOL v11 = v10 == 179 || v10 == 75;
      double v12 = 60.0;
      if (!v11) {
        double v12 = 0.5;
      }
      BOOL v13 = [v9 numberWithDouble:v12];
      v18[0] = v13;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      int64_t v15 = [v7 takeCollectionAssertionWithOwnerIdentifier:v8 collectionIntervalsByType:v14 observerState:v5];
    }
    else
    {
      int64_t v15 = 0;
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[9];
    if (v3)
    {
      int v4 = [v3 workoutConfiguration];
      uint64_t v5 = [v4 activityType];
    }
    else
    {
      id v6 = [*(id *)(v2 + 32) workoutConfiguration];
      uint64_t v5 = [v6 activityType];

      -[HDDefaultWorkoutSessionController _instantiateSwimTrackerActivityTypeIfNeeded:](v2, v5);
    }
    uint64_t v7 = *(void **)(v2 + 48);
    uint64_t v8 = -[HDDefaultWorkoutSessionController _ownerIdentifier](v2);
    id v9 = [*(id *)(v2 + 32) sessionIdentifier];
    uint64_t v10 = [v7 takeSessionAssertionWithOwnerIdentifier:v8 activityType:v5 sessionIdentifier:v9 eventsDelegate:v2];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    int v4 = [v3 daemon];
    uint64_t v5 = [v4 workoutPluginExtension];

    id v6 = [v5 heartRateRecoveryManager];
    uint64_t v7 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    id v8 = objc_loadWeakRetained(v2 + 2);
    id v9 = [v6 createAndTakeAssertionForOwnerIdentifier:v7 sessionStateController:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_10(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F65CC8]);
    id v3 = -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)WeakRetained);
    int v4 = (void *)[v2 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierPlatinum" ownerIdentifier:v3];

    id v5 = objc_loadWeakRetained(WeakRetained + 1);
    id v6 = [v5 sessionAssertionManager];
    [v6 takeAssertion:v4];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (uint64_t)_currentActivityMoveMode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  int v4 = [WeakRetained userCharacteristicsManager];
  id v10 = 0;
  id v5 = [v4 userCharacteristicForType:v2 error:&v10];
  id v6 = v10;

  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Error reading activity mode %{public}@", buf, 0xCu);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = [v5 integerValue];
  }

  return v8;
}

- (void)_lowPowerModeStateChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HDDefaultWorkoutSessionController__lowPowerModeStateChanged___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __63__HDDefaultWorkoutSessionController__lowPowerModeStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) workoutConfiguration];
  int v3 = [v2 shouldUseLowPowerMode];

  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28F80] processInfo];
    char v5 = [v4 isLowPowerModeEnabled];

    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 32) workoutConfiguration];
      [v6 setShouldUseLowPowerMode:0];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) workoutConfiguration];
      [WeakRetained generateConfigurationUpdate:v8];

      _HKInitializeLogging();
      id v9 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        BOOL v11 = *(void **)(v10 + 32);
        id v12 = v9;
        uint64_t v13 = [v11 workoutConfiguration];
        int v14 = 138543618;
        uint64_t v15 = v10;
        __int16 v16 = 2112;
        id v17 = v13;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: System low power mode state changed; it will NOT be automatically turned off after workout is stop"
          "ped with configuration: %@",
          (uint8_t *)&v14,
          0x16u);
      }
    }
  }
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  uint64_t v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished post-stop data aggregation.", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Post-stop data aggregation failed: %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_338(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  _HKInitializeLogging();
  id v2 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished pending events collection", (uint8_t *)&v4, 0xCu);
  }
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29FB8];
  uint64_t v8 = *MEMORY[0x1E4F29FB8];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v10 = v7;
      uint64_t v11 = [v9 sessionIdentifier];
      int v15 = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Generating average METs for workout session: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    uint64_t v19 = *MEMORY[0x1E4F2A0D0];
    v20[0] = v5;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [WeakRetained generateMetadata:v13];
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id WeakRetained = v7;
    uint64_t v13 = [v14 sessionIdentifier];
    int v15 = 138543618;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_error_impl(&dword_1BCB7D000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed retrieving METs for workout %{public}@ with error %{public}@", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_341(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v2 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Completed requests for post-stop data aggregation and event collection.", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained finishAggregationWithDate:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hkTestTransitionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_swimTracker, 0);
  objc_storeStrong((id *)&self->_collectedTypes, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_bmInterface, 0);
  objc_storeStrong((id *)&self->_eventsManager, 0);
  objc_storeStrong((id *)&self->_assertionGroup, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_sessionStateController);

  objc_destroyWeak((id *)&self->_profile);
}

@end