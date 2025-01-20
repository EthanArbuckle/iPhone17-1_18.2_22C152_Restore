@interface HDSwimmingWorkoutEventCollector
+ (BOOL)isAvailableInCurrentHardware;
+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3;
- (HDSwimmingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4;
- (void)_queue_errorOccurred:(void *)a1;
- (void)_queue_querySwimDataWithCompletion:(uint64_t)a1;
- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4;
- (void)startWithSessionId:(id)a3;
- (void)stop;
@end

@implementation HDSwimmingWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  if (_HDIsUnitTesting) {
    return 1;
  }
  else {
    return MEMORY[0x1F40E7B78](a1, a2);
  }
}

- (HDSwimmingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HDSwimmingWorkoutEventCollector;
  v4 = [(HDWorkoutEventCollector *)&v12 initWithProfile:a3 delegate:a4];
  if (v4)
  {
    uint64_t v5 = HKCreateSerialDispatchQueue();
    workoutEventQueue = v4->_workoutEventQueue;
    v4->_workoutEventQueue = (OS_dispatch_queue *)v5;

    v7 = [(HDWorkoutEventCollector *)v4 profile];
    v8 = [v7 workoutManager];
    uint64_t v9 = [v8 newCMSwimTracker];
    swimTracker = v4->_swimTracker;
    v4->_swimTracker = (CMSwimTracker *)v9;
  }
  return v4;
}

- (void)startWithSessionId:(id)a3
{
  id v4 = a3;
  workoutEventQueue = self->_workoutEventQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDSwimmingWorkoutEventCollector_startWithSessionId___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workoutEventQueue, v7);
}

void __54__HDSwimmingWorkoutEventCollector_startWithSessionId___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      id v5 = *(id *)&buf[4];
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting swim workout event collector for sessionID %@", buf, 0x16u);
    }
    v12.receiver = v1;
    v12.super_class = (Class)HDSwimmingWorkoutEventCollector;
    objc_msgSendSuper2(&v12, sel_startWithSessionId_, v2);
    id v6 = objc_alloc(MEMORY[0x1E4F222A0]);
    v7 = [v1 sessionId];
    uint64_t v8 = [v6 initWithSessionId:v7];
    uint64_t v9 = (void *)v1[5];
    v1[5] = v8;

    v10 = (void *)v1[4];
    uint64_t v11 = v1[5];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke;
    v14 = &unk_1E62FBAC8;
    v15 = v1;
    [v10 startUpdatesFromRecord:v11 handler:buf];
  }
}

- (void)stop
{
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HDSwimmingWorkoutEventCollector_stop__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(workoutEventQueue, block);
}

id __39__HDSwimmingWorkoutEventCollector_stop__block_invoke(id result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = (id *)*((void *)result + 4);
  if (v1)
  {
    _HKInitializeLogging();
    id v2 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      id v4 = objc_opt_class();
      id v5 = v4;
      id v6 = [v1 sessionId];
      *(_DWORD *)v7 = 138543618;
      *(void *)&v7[4] = v4;
      *(_WORD *)&v7[12] = 2112;
      *(void *)&v7[14] = v6;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping swim workout event collector for sessionID: %@", v7, 0x16u);
    }
    [v1[4] stopUpdates];
    *(void *)v7 = v1;
    *(void *)&v7[8] = HDSwimmingWorkoutEventCollector;
    return objc_msgSendSuper2((objc_super *)v7, sel_stop);
  }
  return result;
}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return a3 == 46;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workoutEventQueue, block);
}

void __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke(id *a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = [a1[4] sessionId];

  if (v2)
  {
    v3 = (uint64_t *)(a1 + 4);
    objc_initWeak(location, a1[4]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke_2;
    aBlock[3] = &unk_1E62FB2A8;
    objc_copyWeak(&v12, location);
    id v10 = a1[5];
    id v11 = a1[6];
    id v4 = _Block_copy(aBlock);
    -[HDSwimmingWorkoutEventCollector _queue_querySwimDataWithCompletion:](*v3, v4);

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v7 = v5;
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v8 = *(id *)((char *)location + 4);
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Terminating request for collecting pending swim events as sessionId is nil", (uint8_t *)location, 0xCu);
    }
    id v6 = (void (**)(id, uint64_t, void))a1[6];
    if (v6) {
      v6[2](v6, 1, 0);
    }
  }
}

void __78__HDSwimmingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      BOOL v6 = *((void *)WeakRetained + 7) == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      goto LABEL_18;
    }
    id v7 = (void *)*((void *)WeakRetained + 8);
    id v8 = [*((id *)WeakRetained + 6) endDate];
    LOBYTE(v7) = [v7 isEqualToDate:v8];

    if (v7) {
      goto LABEL_18;
    }
    id v9 = [*((id *)WeakRetained + 6) endDate];
    if (!v9 || objc_msgSend(*((id *)WeakRetained + 7), "hk_isAfterDate:", v9))
    {
      id v10 = v5;

      id v9 = v10;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*((void *)WeakRetained + 7) endDate:v9];
    [v11 duration];
    if (v12 == 0.0)
    {
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
LABEL_17:

LABEL_18:
        v23 = (void *)*((void *)WeakRetained + 7);
        *((void *)WeakRetained + 7) = 0;

        goto LABEL_19;
      }
      v14 = v13;
      v15 = objc_opt_class();
      uint64_t v16 = *((void *)WeakRetained + 7);
      *(_DWORD *)buf = 138544130;
      id v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      id v32 = v5;
      id v17 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Dropping zero-duration segment created with start date: %{public}@, end date: %{public}@ and fallback end date: %{public}@", buf, 0x2Au);
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x1E4F2B990]);
      v19 = [WeakRetained sessionId];
      v14 = [v18 initWithEventType:9 sessionId:v19 dateInterval:v11 metadata:0];

      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        *(_DWORD *)buf = 138543618;
        id v26 = (id)objc_opt_class();
        __int16 v27 = 2114;
        v28 = v14;
        id v22 = v26;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Collection stopping: Adding workout segment event %{public}@", buf, 0x16u);
      }
      id v17 = [WeakRetained delegate];
      [v17 receivedWorkoutEvent:v14];
    }

    goto LABEL_17;
  }
LABEL_19:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queue_querySwimDataWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke;
    v7[3] = &unk_1E62FB2D0;
    v7[4] = a1;
    id v8 = v3;
    [v5 querySwimUpdatesFromRecord:v6 handler:v7];
  }
}

void __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2;
  v8[3] = &unk_1E62F31C0;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __71__HDSwimmingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    -[HDSwimmingWorkoutEventCollector _queue_errorOccurred:](v1, v2);
  }
  else {
    -[HDSwimmingWorkoutEventCollector _queue_querySwimDataWithCompletion:]((uint64_t)v1, 0);
  }
}

- (void)_queue_errorOccurred:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v9 = v4;
      int v11 = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v3;
      id v10 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting swim data for lap events: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    id v5 = objc_alloc(MEMORY[0x1E4F2B990]);
    uint64_t v6 = [a1 sessionId];
    id v7 = (void *)[v5 initWithSessionId:v6 error:v3];

    id v8 = [a1 delegate];
    [v8 receivedWorkoutEvent:v7];
  }
}

void __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E62F2F48;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __70__HDSwimmingWorkoutEventCollector__queue_querySwimDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = v5;
  if (v2)
  {
    if (v5)
    {
      -[HDSwimmingWorkoutEventCollector _queue_errorOccurred:]((void *)v2, v5);
      goto LABEL_58;
    }
    unint64_t v7 = 0x1EBA09000uLL;
    uint64_t v8 = [*(id *)(v2 + 40) recordId];
    id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
    if (!v8)
    {
      uint64_t v10 = [v4 firstObject];
      int v11 = *(void **)(v2 + 40);
      *(void *)(v2 + 40) = v10;

      _HKInitializeLogging();
      os_log_t v12 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        v99 = v12;
        v100 = objc_opt_class();
        uint64_t v101 = *(void *)(v2 + 40);
        *(_DWORD *)v118 = 138543618;
        v119 = v100;
        __int16 v120 = 2112;
        uint64_t v121 = v101;
        id v102 = v100;
        _os_log_debug_impl(&dword_1BCB7D000, v99, OS_LOG_TYPE_DEBUG, "[%{public}@] Setting initial reference swim data to %@", v118, 0x16u);
      }
    }
    uint64_t v104 = v1;
    if (!*(void *)(v2 + 56))
    {
      uint64_t v13 = [*(id *)(v2 + 40) startDate];
      id v14 = *(void **)(v2 + 56);
      *(void *)(v2 + 56) = v13;
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v103 = v4;
    id obj = v4;
    uint64_t v113 = [obj countByEnumeratingWithState:&v114 objects:v118 count:16];
    if (v113)
    {
      uint64_t v112 = *(void *)v115;
      uint64_t v108 = *MEMORY[0x1E4F2A1E8];
      uint64_t v107 = *MEMORY[0x1E4F2A1C8];
      do
      {
        for (uint64_t i = 0; i != v113; ++i)
        {
          if (*(void *)v115 != v112) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          _HKInitializeLogging();
          os_log_t v17 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v17;
            v19 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v125 = v19;
            __int16 v126 = 2112;
            id v127 = v16;
            id v20 = v19;
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing swim data: %@", buf, 0x16u);
          }
          v21 = [v16 sessionId];
          id v22 = [(id)v2 sessionId];
          char v23 = [v21 isEqual:v22];

          if (v23)
          {
            unint64_t v24 = [v16 lapCount];
            unint64_t v25 = [*(id *)(v2 + *(int *)(v7 + 2852)) lapCount];
            if (v24 > v25)
            {
              id v26 = v16;
              __int16 v27 = NSNumber;
              unint64_t v28 = [v26 strokeType];
              unint64_t v109 = v24;
              if (v28 >= 7)
              {
                v36 = [MEMORY[0x1E4F28B00] currentHandler];
                v37 = [NSString stringWithUTF8String:"HKSwimmingStrokeStyle _HKSwimmingStrokeStyleFromCMSwimStrokeType(CMSwimStrokeType)"];
                [v36 handleFailureInFunction:v37 file:@"HDSwimmingWorkoutEventCollector.m" lineNumber:347 description:@"Invalid swimming stroke style"];

                uint64_t v29 = 0;
              }
              else
              {
                uint64_t v29 = qword_1BD329FC8[v28];
              }
              v38 = [v27 numberWithInteger:v29];
              if ([v26 isSWOLFValid])
              {
                v39 = NSNumber;
                [v26 SWOLF];
                v40 = objc_msgSend(v39, "numberWithDouble:");
                v122[0] = v108;
                v122[1] = v107;
                v123[0] = v38;
                v123[1] = v40;
                v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:2];
              }
              else
              {
                v122[0] = v108;
                v123[0] = v38;
                v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:1];
              }
              v41 = [v26 endDate];
              v42 = [v26 startDate];
              int v43 = objc_msgSend(v41, "hk_isBeforeDate:", v42);

              if (v43)
              {
                _HKInitializeLogging();
                v44 = (void *)*MEMORY[0x1E4F29F10];
                BOOL v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT);
                id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                if (v45)
                {
                  log = v44;
                  v46 = objc_opt_class();
                  id v106 = v46;
                  v47 = [v26 startDate];
                  v48 = [v26 endDate];
                  *(_DWORD *)buf = 138543874;
                  v125 = v46;
                  __int16 v126 = 2114;
                  id v127 = v47;
                  __int16 v128 = 2114;
                  v129 = v48;
                  _os_log_fault_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_FAULT, "[%{public}@] Out-of-order CMSwimData lap events: %{public}@, %{public}@", buf, 0x20u);

                  id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                }
              }
              else
              {
                id v49 = objc_alloc(MEMORY[0x1E4F28C18]);
                v50 = [v26 startDate];
                v51 = [v26 endDate];
                v52 = (void *)[v49 initWithStartDate:v50 endDate:v51];

                id v53 = objc_alloc(MEMORY[0x1E4F2B990]);
                v54 = [(id)v2 sessionId];
                v55 = (void *)[v53 initWithEventType:5 sessionId:v54 dateInterval:v52 metadata:v111];

                _HKInitializeLogging();
                v56 = (void *)*MEMORY[0x1E4F29FB8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                {
                  v57 = v56;
                  v58 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v125 = v58;
                  __int16 v126 = 2112;
                  id v127 = v55;
                  id v59 = v58;
                  _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding workout lap event: %@", buf, 0x16u);
                }
                unint64_t v7 = 0x1EBA09000uLL;
                if (*(unsigned char *)(v2 + 80))
                {
                  uint64_t v60 = [v26 startDate];
                  v61 = *(void **)(v2 + 56);
                  *(void *)(v2 + 56) = v60;

                  *(unsigned char *)(v2 + 80) = 0;
                }
                v62 = [(id)v2 delegate];
                [v62 receivedWorkoutEvent:v55];

                id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
              }

              unint64_t v24 = v109;
            }
            unint64_t v63 = [v16 segment];
            if (v63 <= [*(id *)(v2 + *(int *)(v7 + 2852)) segment])
            {
              if (v24 > v25) {
                goto LABEL_53;
              }
              goto LABEL_54;
            }
            id v64 = v16;
            v65 = [*(id *)(v2 + 48) endDate];
            int v66 = objc_msgSend(v65, "hk_isBeforeDate:", *(void *)(v2 + 56));

            if (v66)
            {
              _HKInitializeLogging();
              v67 = (void *)*MEMORY[0x1E4F29F10];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
              {
                v68 = v67;
                v69 = objc_opt_class();
                v70 = *(void **)(v2 + 56);
                v71 = *(void **)(v2 + 48);
                id v72 = v69;
                v73 = [v71 endDate];
                *(_DWORD *)buf = 138543874;
                v125 = v69;
                __int16 v126 = 2114;
                id v127 = v70;
                id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                __int16 v128 = 2114;
                v129 = v73;
                _os_log_fault_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_FAULT, "[%{public}@] Out-of-order CMSwimData segment events: %{public}@, %{public}@", buf, 0x20u);

                goto LABEL_51;
              }
LABEL_52:

LABEL_53:
              objc_storeStrong((id *)(v2 + *(int *)(v7 + 2852)), v16);
LABEL_54:
              objc_storeStrong((id *)(v2 + 48), v16);
              continue;
            }
            id v74 = objc_alloc(MEMORY[0x1E4F28C18]);
            uint64_t v75 = *(void *)(v2 + 56);
            v76 = [*(id *)(v2 + 48) endDate];
            v68 = [v74 initWithStartDate:v75 endDate:v76];

            [v68 duration];
            if (v77 == 0.0)
            {
              _HKInitializeLogging();
              os_log_t v78 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
              {
                v79 = v78;
                v80 = objc_opt_class();
                v81 = *(void **)(v2 + 56);
                v82 = *(void **)(v2 + 48);
                id v83 = v80;
                v84 = [v82 endDate];
                *(_DWORD *)buf = 138544130;
                v125 = v80;
                __int16 v126 = 2114;
                id v127 = v64;
                __int16 v128 = 2114;
                v129 = v81;
                unint64_t v7 = 0x1EBA09000;
                __int16 v130 = 2114;
                v131 = v84;
                _os_log_error_impl(&dword_1BCB7D000, v79, OS_LOG_TYPE_ERROR, "[%{public}@] Dropping zero-duration segment created from data: %{public}@ with start date: %{public}@ and end date: %{public}@", buf, 0x2Au);

                id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                goto LABEL_50;
              }
            }
            else
            {
              if ([v64 isSegmentSWOLFValid])
              {
                v85 = NSNumber;
                [v64 segmentSWOLF];
                v86 = objc_msgSend(v85, "numberWithDouble:");
                v122[0] = v107;
                v123[0] = v86;
                v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:1];
              }
              else
              {
                v79 = 0;
              }
              id v87 = objc_alloc(MEMORY[0x1E4F2B990]);
              v88 = [(id)v2 sessionId];
              v89 = (void *)[v87 initWithEventType:9 sessionId:v88 dateInterval:v68 metadata:v79];

              *(unsigned char *)(v2 + 80) = 1;
              uint64_t v90 = [v64 endDate];
              v91 = *(void **)(v2 + 64);
              *(void *)(v2 + 64) = v90;

              _HKInitializeLogging();
              os_log_t v92 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
              {
                v93 = v92;
                v94 = objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v125 = v94;
                __int16 v126 = 2114;
                id v127 = v89;
                id v95 = v94;
                _os_log_impl(&dword_1BCB7D000, v93, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding workout segment event: %{public}@", buf, 0x16u);

                id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
              }
              v96 = [(id)v2 delegate];
              [v96 receivedWorkoutEvent:v89];

LABEL_50:
            }
LABEL_51:

            goto LABEL_52;
          }
          _HKInitializeLogging();
          os_log_t v30 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = v30;
            id v32 = objc_opt_class();
            id v33 = v32;
            v34 = [v16 sessionId];
            v35 = [(id)v2 sessionId];
            *(_DWORD *)buf = 138543874;
            v125 = v32;
            __int16 v126 = 2112;
            id v127 = v34;
            __int16 v128 = 2112;
            v129 = v35;
            _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring swim data with mismatched session id. Swim data session id: %@ [self sessionID]: %@", buf, 0x20u);
          }
        }
        uint64_t v113 = [obj countByEnumeratingWithState:&v114 objects:v118 count:16];
      }
      while (v113);
    }

    id v4 = v103;
    uint64_t v1 = v104;
    id v6 = 0;
  }
LABEL_58:

  uint64_t result = *(void *)(v1 + 56);
  if (result)
  {
    v98 = *(uint64_t (**)(void))(result + 16);
    return v98();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEventQueue, 0);
  objc_storeStrong((id *)&self->_prevSegmentEndDate, 0);
  objc_storeStrong((id *)&self->_currentSegmentStartDate, 0);
  objc_storeStrong((id *)&self->_lastSwimData, 0);
  objc_storeStrong((id *)&self->_referenceSwimData, 0);

  objc_storeStrong((id *)&self->_swimTracker, 0);
}

@end