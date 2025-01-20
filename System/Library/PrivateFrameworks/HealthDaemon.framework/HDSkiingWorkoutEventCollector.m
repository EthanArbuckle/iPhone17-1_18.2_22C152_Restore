@interface HDSkiingWorkoutEventCollector
+ (BOOL)isAvailableInCurrentHardware;
+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3;
- (HDSkiingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4;
- (void)_queue_errorOccurred:(void *)a1;
- (void)_queue_querySkiDataWithCompletion:(uint64_t)a1;
- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4;
- (void)startWithSessionId:(id)a3;
- (void)stop;
@end

@implementation HDSkiingWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  if (_HDIsUnitTesting) {
    return 1;
  }
  else {
    return MEMORY[0x1F40E7B70](a1, a2);
  }
}

- (HDSkiingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HDSkiingWorkoutEventCollector;
  v4 = [(HDWorkoutEventCollector *)&v13 initWithProfile:a3 delegate:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HDWorkoutEventCollector *)v4 profile];
    v7 = [v6 workoutManager];
    uint64_t v8 = [v7 newCMSkiTracker];
    skiTracker = v5->_skiTracker;
    v5->_skiTracker = (CMSkiTracker *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueue();
    workoutEventQueue = v5->_workoutEventQueue;
    v5->_workoutEventQueue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

- (void)startWithSessionId:(id)a3
{
  id v4 = a3;
  workoutEventQueue = self->_workoutEventQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDSkiingWorkoutEventCollector_startWithSessionId___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workoutEventQueue, v7);
}

void __52__HDSkiingWorkoutEventCollector_startWithSessionId___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "Starting ski workout event collector for sessionID %@", (uint8_t *)&buf, 0xCu);
    }
    v10.receiver = v1;
    v10.super_class = (Class)HDSkiingWorkoutEventCollector;
    objc_msgSendSuper2(&v10, sel_startWithSessionId_, v2);
    id v4 = objc_alloc(MEMORY[0x1E4F22280]);
    v5 = [v1 sessionId];
    uint64_t v6 = [v4 initWithSessionId:v5];
    v7 = (void *)v1[5];
    v1[5] = v6;

    id v8 = (void *)v1[4];
    uint64_t v9 = v1[5];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v12 = __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke;
    objc_super v13 = &unk_1E62FBAC8;
    v14 = v1;
    [v8 startUpdatesFromRecord:v9 handler:&buf];
  }
}

- (void)stop
{
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HDSkiingWorkoutEventCollector_stop__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(workoutEventQueue, block);
}

id __37__HDSkiingWorkoutEventCollector_stop__block_invoke(id result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = (id *)*((void *)result + 4);
  if (v1)
  {
    _HKInitializeLogging();
    id v2 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      id v4 = [v1 sessionId];
      LODWORD(v5.receiver) = 138412290;
      *(id *)((char *)&v5.receiver + 4) = v4;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ski workout event collector for sessionID: %@", (uint8_t *)&v5, 0xCu);
    }
    [v1[4] stopUpdates];
    v5.receiver = v1;
    v5.super_class = (Class)HDSkiingWorkoutEventCollector;
    return objc_msgSendSuper2(&v5, sel_stop);
  }
  return result;
}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return a3 == 61 || a3 == 67;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  id v5 = a4;
  workoutEventQueue = self->_workoutEventQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HDSkiingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke;
  v8[3] = &unk_1E62F4928;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workoutEventQueue, v8);
}

void __76__HDSkiingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionId];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    -[HDSkiingWorkoutEventCollector _queue_querySkiDataWithCompletion:](v3, v4);
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Terminating request for collecting pending ski events as sessionId is nil", v7, 2u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 1, 0);
    }
  }
}

- (void)_queue_querySkiDataWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke;
    v7[3] = &unk_1E62FB2D0;
    v7[4] = a1;
    id v8 = v3;
    [v5 querySkiUpdatesFromRecord:v6 handler:v7];
  }
}

void __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2;
  v8[3] = &unk_1E62F31C0;
  id v9 = v4;
  uint64_t v10 = v5;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    -[HDSkiingWorkoutEventCollector _queue_errorOccurred:](v1, v2);
  }
  else {
    -[HDSkiingWorkoutEventCollector _queue_querySkiDataWithCompletion:]((uint64_t)v1, 0);
  }
}

- (void)_queue_errorOccurred:(void *)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Error getting ski data: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v5 = objc_alloc(MEMORY[0x1E4F2B990]);
    uint64_t v6 = [a1 sessionId];
    id v7 = (void *)[v5 initWithSessionId:v6 error:v3];

    id v8 = [a1 delegate];
    [v8 receivedWorkoutEvent:v7];
  }
}

void __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E62F2F48;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v2 = *(id **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = v5;
  if (v2)
  {
    if (v5)
    {
      -[HDSkiingWorkoutEventCollector _queue_errorOccurred:](v2, v5);
    }
    else
    {
      uint64_t v64 = v1;
      uint64_t v7 = &OBJC_IVAR___HDQuantitySeriesSampleQueryServer__mode;
      uint64_t v8 = [v2[5] recordId];
      id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
      if (!v8)
      {
        uint64_t v10 = [v4 firstObject];
        id v11 = v2[5];
        v2[5] = (id)v10;

        _HKInitializeLogging();
        id v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          id v62 = v2[5];
          *(_DWORD *)v80 = 138412290;
          id v81 = v62;
          _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "Setting initial reference ski data to %@", v80, 0xCu);
        }
      }
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v63 = v4;
      id v13 = v4;
      uint64_t v75 = [v13 countByEnumeratingWithState:&v76 objects:v80 count:16];
      if (v75)
      {
        uint64_t v74 = *(void *)v77;
        uint64_t v67 = *MEMORY[0x1E4F2A1A0];
        uint64_t v68 = *MEMORY[0x1E4F2A0D8];
        uint64_t v65 = *MEMORY[0x1E4F2A120];
        uint64_t v66 = *MEMORY[0x1E4F2A098];
        id v69 = v13;
        do
        {
          for (uint64_t i = 0; i != v75; ++i)
          {
            if (*(void *)v77 != v74) {
              objc_enumerationMutation(v13);
            }
            uint64_t v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            _HKInitializeLogging();
            v16 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&buf[4] = v15;
              _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Processing ski data: %@", buf, 0xCu);
            }
            v17 = [v15 sessionId];
            v18 = [v2 sessionId];
            char v19 = [v17 isEqual:v18];

            if (v19)
            {
              unint64_t v20 = [v15 recordId];
              if (v20 > [*(id *)((char *)v2 + v7[20]) recordId])
              {
                [v15 runDistance];
                double v22 = v21;
                [*(id *)((char *)v2 + v7[20]) runDistance];
                if (v22 - v23 > 2.22044605e-16)
                {
                  v24 = *(id *)((char *)v2 + v7[20]);
                  id v25 = v15;
                  v26 = (void *)MEMORY[0x1E4F2B618];
                  id v27 = v24;
                  uint64_t v28 = [v26 unitFromString:@"m/s"];
                  v29 = (void *)MEMORY[0x1E4F2B370];
                  [v25 runAvgSpeed];
                  v73 = objc_msgSend(v29, "quantityWithUnit:doubleValue:", v28);
                  v30 = (void *)MEMORY[0x1E4F2B370];
                  [v25 runMaxSpeed];
                  v71 = (void *)v28;
                  v72 = objc_msgSend(v30, "quantityWithUnit:doubleValue:", v28);
                  v31 = (void *)MEMORY[0x1E4F2B370];
                  v32 = [MEMORY[0x1E4F2B618] percentUnit];
                  [v25 runSlope];
                  uint64_t v34 = [v31 quantityWithUnit:v32 doubleValue:(double)(tan(v33) * 100.0)];

                  [v25 runElevationDescent];
                  double v36 = v35;
                  [v27 runElevationDescent];
                  double v38 = v37;

                  v39 = (void *)MEMORY[0x1E4F2B370];
                  v40 = [MEMORY[0x1E4F2B618] meterUnit];
                  uint64_t v41 = [v39 quantityWithUnit:v40 doubleValue:v36 - v38];

                  id v42 = objc_alloc(MEMORY[0x1E4F28C18]);
                  v43 = [v25 startDate];
                  v44 = [v25 endDate];
                  v45 = (void *)[v42 initWithStartDate:v43 endDate:v44];

                  [v45 duration];
                  v70 = (void *)v34;
                  if (v46 == 0.0)
                  {
                    v47 = (void *)v41;
                    _HKInitializeLogging();
                    id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                    v48 = *MEMORY[0x1E4F29FB8];
                    v49 = v71;
                    uint64_t v7 = &OBJC_IVAR___HDQuantitySeriesSampleQueryServer__mode;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138543362;
                      *(void *)&buf[4] = v25;
                      _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "Dropping zero-duration segment created from data: %{public}@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v84[0] = v68;
                    v84[1] = v67;
                    *(void *)long long buf = v73;
                    *(void *)&buf[8] = v72;
                    v84[2] = v66;
                    v84[3] = v65;
                    *(void *)&buf[16] = v34;
                    uint64_t v86 = v41;
                    v47 = (void *)v41;
                    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v84 count:4];
                    id v55 = objc_alloc(MEMORY[0x1E4F2B990]);
                    v56 = [v2 sessionId];
                    v57 = (void *)[v55 initWithEventType:9 sessionId:v56 dateInterval:v45 metadata:v54];

                    _HKInitializeLogging();
                    id v9 = (os_log_t *)MEMORY[0x1E4F29FB8];
                    v58 = *MEMORY[0x1E4F29FB8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v82 = 138412290;
                      v83 = v57;
                      _os_log_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEFAULT, "Generating workout segment event: %@", v82, 0xCu);
                    }
                    v59 = [v2 delegate];
                    [v59 receivedWorkoutEvent:v57];

                    uint64_t v7 = &OBJC_IVAR___HDQuantitySeriesSampleQueryServer__mode;
                    v49 = v71;
                  }

                  id v13 = v69;
                }
                objc_storeStrong((id *)((char *)v2 + v7[20]), v15);
              }
            }
            else
            {
              _HKInitializeLogging();
              os_log_t v50 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
              {
                v51 = v50;
                v52 = [v15 sessionId];
                v53 = [v2 sessionId];
                *(_DWORD *)long long buf = 138412546;
                *(void *)&buf[4] = v52;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v53;
                _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "Ignoring ski data with mismatched session id. Ski data session id: %@ [self sessionID]: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v75 = [v13 countByEnumeratingWithState:&v76 objects:v80 count:16];
        }
        while (v75);
      }

      id v4 = v63;
      uint64_t v1 = v64;
      id v6 = 0;
    }
  }

  uint64_t result = *(void *)(v1 + 56);
  if (result)
  {
    v61 = *(uint64_t (**)(void))(result + 16);
    return v61();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEventQueue, 0);
  objc_storeStrong((id *)&self->_referenceSkiData, 0);

  objc_storeStrong((id *)&self->_skiTracker, 0);
}

@end