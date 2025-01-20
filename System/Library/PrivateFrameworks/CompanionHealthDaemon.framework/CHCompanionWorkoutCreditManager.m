@interface CHCompanionWorkoutCreditManager
- (BOOL)_queue_generateAndSaveSamplesForIntervals:(id)a3 withExerciseMinuteTable:(id)a4 standHourTable:(id)a5 standMinuteTable:(id)a6 moveMinuteTable:(id)a7 error:(id)a8;
- (CHCompanionWorkoutCreditManager)initWithProfile:(id)a3;
- (id)_queue_samplesForType:(id)a3 fromStartTime:(id)a4 toEndTime:(id)a5;
- (id)_queue_userLocalProtectedDomain;
- (id)_queue_workoutAnchor;
- (id)_queue_workoutsSinceAnchor:(id *)a3 error:(id)a4;
- (void)_queue_fastForwardAnchor;
- (void)_queue_performWorkoutCreditFixup;
- (void)_queue_processWorkouts;
- (void)_queue_setWorkoutAnchor:(id)a3;
- (void)dealloc;
- (void)performWorkoutCreditFixup;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)stopObservingWorkouts;
@end

@implementation CHCompanionWorkoutCreditManager

- (CHCompanionWorkoutCreditManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHCompanionWorkoutCreditManager;
  v5 = [(CHCompanionWorkoutCreditManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    anchor = v6->_anchor;
    v6->_anchor = 0;

    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    calendar = v6->_calendar;
    v6->_calendar = (NSCalendar *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  [(CHCompanionWorkoutCreditManager *)self stopObservingWorkouts];
  v3.receiver = self;
  v3.super_class = (Class)CHCompanionWorkoutCreditManager;
  [(CHCompanionWorkoutCreditManager *)&v3 dealloc];
}

- (void)performWorkoutCreditFixup
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__CHCompanionWorkoutCreditManager_performWorkoutCreditFixup__block_invoke;
  v4[3] = &unk_26471FEB8;
  objc_copyWeak(&v5, &location);
  dispatch_sync(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__CHCompanionWorkoutCreditManager_performWorkoutCreditFixup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    id v3 = WeakRetained;

    objc_msgSend(v3, "_queue_performWorkoutCreditFixup");
    id WeakRetained = v3;
  }
}

- (void)stopObservingWorkouts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x263F0A598] workoutType];
  [v3 removeObserver:self forDataType:v4];
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained dataManager];
  id v5 = [MEMORY[0x263F0A598] workoutType];
  [v4 addObserver:self forDataType:v5];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  _HKInitializeLogging();
  id v5 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225615000, v5, OS_LOG_TYPE_INFO, "[CWCM] Workout sample added", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CHCompanionWorkoutCreditManager_samplesAdded_anchor___block_invoke;
  block[3] = &unk_26471FE40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__CHCompanionWorkoutCreditManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processWorkouts");
}

- (void)_queue_processWorkouts
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 138543874;
  id v3 = @"Companion Workout Credit Manager";
  __int16 v4 = 2048;
  uint64_t v5 = 0x404E000000000000;
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_225615000, a2, OS_LOG_TYPE_ERROR, "Failed to get accessibility assertion for %{public}@ with %lf second timeout with error %{public}@", (uint8_t *)&v2, 0x20u);
}

uint64_t __57__CHCompanionWorkoutCreditManager__queue_processWorkouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_workoutAnchor");
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 24) && *(unsigned char *)(v5 + 40)
    || (objc_msgSend((id)v5, "_queue_fastForwardAnchor"), uint64_t v5 = *(void *)(a1 + 32), *(void *)(v5 + 24)))
  {
    if (*(unsigned char *)(v5 + 40)) {
      objc_msgSend((id)v5, "_queue_performWorkoutCreditFixup");
    }
  }
  return 1;
}

- (void)_queue_fastForwardAnchor
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_225615000, log, OS_LOG_TYPE_ERROR, "[CWCM] Error:%{public}@ reading anchor data from domain: %@", (uint8_t *)&v3, 0x16u);
}

- (id)_queue_workoutAnchor
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = [(CHCompanionWorkoutCreditManager *)self _queue_userLocalProtectedDomain];
  id v12 = 0;
  __int16 v5 = [v4 numberForKey:@"companionWorkoutCreditAnchorKey" error:&v12];
  id v6 = v12;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x263F09970];
  uint64_t v8 = *MEMORY[0x263F09970];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v7;
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_225615000, v10, OS_LOG_TYPE_ERROR, "[CWCM] Error: %{public}@ retrieving data from key value domain. %@: %@", buf, 0x20u);
    }
    __int16 v5 = 0;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_225615000, v7, OS_LOG_TYPE_INFO, "[CWCM] Anchor fetched: %@", buf, 0xCu);
  }

  return v5;
}

- (void)_queue_setWorkoutAnchor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int16 v5 = [(CHCompanionWorkoutCreditManager *)self _queue_userLocalProtectedDomain];
  id v9 = 0;
  [v5 setNumber:v4 forKey:@"companionWorkoutCreditAnchorKey" error:&v9];
  id v6 = v9;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x263F09970];
  uint64_t v8 = *MEMORY[0x263F09970];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v11 = v6;
      __int16 v12 = 2112;
      v13 = v5;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_225615000, v7, OS_LOG_TYPE_ERROR, "[CWCM] Error:%{public}@ saving data into key value domain. %@: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_225615000, v7, OS_LOG_TYPE_INFO, "[CWCM] Anchor saved: %@", buf, 0xCu);
  }
}

- (id)_queue_userLocalProtectedDomain
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc(MEMORY[0x263F43218]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  __int16 v5 = (void *)[v3 initWithCategory:100 domainName:@"com.apple.healthd.workout" profile:WeakRetained];

  return v5;
}

- (void)_queue_performWorkoutCreditFixup
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_225615000, log, OS_LOG_TYPE_ERROR, "[CWCM] Error: %{public}@ generating and saving workout related samples", (uint8_t *)&v1, 0xCu);
}

void __67__CHCompanionWorkoutCreditManager__queue_performWorkoutCreditFixup__block_invoke(uint64_t a1, void *a2)
{
}

void __67__CHCompanionWorkoutCreditManager__queue_performWorkoutCreditFixup__block_invoke_310(uint64_t a1, void *a2)
{
  id v13 = a2;
  switch([v13 type])
  {
    case 1:
    case 5:
      id v3 = objc_alloc(MEMORY[0x263F08798]);
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      __int16 v5 = [v13 dateInterval];
      id v6 = [v5 startDate];
      uint64_t v7 = (void *)[v3 initWithStartDate:v4 endDate:v6];

      uint64_t v8 = [[CHCompanionWorkoutCreditManagerInterval alloc] initWithDateInterval:v7 activityMoveMode:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) addObject:v8];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

      break;
    case 2:
    case 6:
      id v9 = [v13 dateInterval];
      uint64_t v10 = [v9 startDate];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      break;
    default:
      break;
  }
}

- (BOOL)_queue_generateAndSaveSamplesForIntervals:(id)a3 withExerciseMinuteTable:(id)a4 standHourTable:(id)a5 standMinuteTable:(id)a6 moveMinuteTable:(id)a7 error:(id)a8
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v131 = a7;
  id v115 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v132 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obj = v14;
  uint64_t v118 = [obj countByEnumeratingWithState:&v138 objects:v144 count:16];
  if (v118)
  {
    uint64_t v117 = *(void *)v139;
    uint64_t v126 = *MEMORY[0x263F09BD0];
    uint64_t v127 = *MEMORY[0x263F09BE8];
    uint64_t v129 = *MEMORY[0x263F09240];
    double v18 = 0.0;
    id v128 = v15;
    v119 = v17;
    v130 = v16;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v139 != v117) {
          objc_enumerationMutation(obj);
        }
        uint64_t v125 = v19;
        v20 = *(void **)(*((void *)&v138 + 1) + 8 * v19);
        v21 = objc_msgSend(v20, "dateInterval", v115);
        v22 = [v21 startDate];
        [v22 timeIntervalSinceReferenceDate];
        double v24 = v23;

        double v122 = v24;
        uint64_t v25 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v24];
        v26 = [v20 dateInterval];
        v27 = [v26 endDate];
        [v27 timeIntervalSinceReferenceDate];
        double v29 = v28;

        uint64_t v120 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v29];
        v121 = (void *)v25;
        v124 = -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 128, v25);
        double v30 = (double)[v124 second];
        double v31 = floor(v30 / 60.0);
        v32 = v20;
        v33 = [v20 dateInterval];
        v34 = [v33 startDate];
        [v34 timeIntervalSinceReferenceDate];
        double v36 = floor(v35 / 60.0) * 60.0;

        v133 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v36];
        if (v31 > 0.0)
        {
          uint64_t v37 = 0;
          do
          {
            v38 = [(NSCalendar *)self->_calendar dateByAddingUnit:64 value:v37 toDate:v133 options:0];
            v39 = [v38 dateByAddingTimeInterval:60.0];
            v40 = [v15 objectForKey:v38];
            if (!v40)
            {
              v41 = (void *)MEMORY[0x263F0A630];
              v42 = [MEMORY[0x263F0A830] minuteUnit];
              v43 = [v41 quantityWithUnit:v42 doubleValue:1.0];

              v44 = (void *)MEMORY[0x263F0A648];
              v45 = [MEMORY[0x263F0A658] briskMinuteDataType];
              v46 = [v44 quantitySampleWithType:v45 quantity:v43 startDate:v38 endDate:v39];

              [v15 setObject:v46 forKey:v38];
              [v132 addObject:v46];
            }
            if ([v32 activityMoveMode] == 2)
            {
              v47 = [v131 objectForKey:v38];
              if (!v47)
              {
                v48 = (void *)MEMORY[0x263F0A630];
                v49 = [MEMORY[0x263F0A830] minuteUnit];
                v50 = [v48 quantityWithUnit:v49 doubleValue:1.0];

                v51 = (void *)MEMORY[0x263F0A648];
                v52 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v126];
                v53 = [v51 quantitySampleWithType:v52 quantity:v50 startDate:v38 endDate:v39];

                id v15 = v128;
                [v131 setObject:v53 forKey:v38];
                [v132 addObject:v53];
              }
            }

            ++v37;
          }
          while (v31 > (double)v37);
          id v17 = v119;
          if (v31 > 0.0)
          {
            uint64_t v54 = 0;
            do
            {
              v55 = [(NSCalendar *)self->_calendar dateByAddingUnit:64 value:v54 toDate:v133 options:0];
              v56 = [v55 dateByAddingTimeInterval:300.0];
              v57 = [v119 objectForKey:v55];
              if (!v57)
              {
                v58 = (void *)MEMORY[0x263F0A630];
                v59 = [MEMORY[0x263F0A830] minuteUnit];
                v60 = [v58 quantityWithUnit:v59 doubleValue:1.0];

                v61 = (void *)MEMORY[0x263F0A648];
                v62 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v127];
                v63 = [v61 quantitySampleWithType:v62 quantity:v60 startDate:v55 endDate:v56];

                id v15 = v128;
                [v119 setObject:v63 forKey:v55];
                [v132 addObject:v63];
              }
              v54 += 5;
            }
            while (v31 > (double)v54);
          }
        }
        double v64 = v18 + v30 - v31 * 60.0;
        double v18 = v64;
        if (v64 >= 60.0)
        {
          v65 = [v133 dateByAddingTimeInterval:60.0];
          v66 = [v15 objectForKey:v133];
          if (!v66)
          {
            v67 = (void *)MEMORY[0x263F0A630];
            v68 = [MEMORY[0x263F0A830] minuteUnit];
            v69 = [v67 quantityWithUnit:v68 doubleValue:1.0];

            v70 = (void *)MEMORY[0x263F0A648];
            v71 = [MEMORY[0x263F0A658] briskMinuteDataType];
            v72 = [v70 quantitySampleWithType:v71 quantity:v69 startDate:v133 endDate:v65];

            [v15 setObject:v72 forKey:v133];
            [v132 addObject:v72];
          }
          if ([v32 activityMoveMode] == 2)
          {
            v73 = [v131 objectForKey:v133];
            if (!v73)
            {
              v74 = (void *)MEMORY[0x263F0A630];
              v75 = [MEMORY[0x263F0A830] minuteUnit];
              v76 = [v74 quantityWithUnit:v75 doubleValue:1.0];

              v77 = (void *)MEMORY[0x263F0A648];
              v78 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v126];
              v79 = [v77 quantitySampleWithType:v78 quantity:v76 startDate:v133 endDate:v65];

              [v131 setObject:v79 forKey:v133];
              [v132 addObject:v79];
            }
          }
          double v18 = v64 + -60.0;
        }
        if (v64 >= 300.0)
        {
          double v18 = v18 + -300.0;
          v83 = [v133 dateByAddingTimeInterval:v18];
          v84 = [v17 objectForKey:v133];
          id v16 = v130;
          v82 = (void *)v120;
          v81 = v121;
          if (!v84)
          {
            v85 = (void *)MEMORY[0x263F0A630];
            v86 = [MEMORY[0x263F0A830] minuteUnit];
            v87 = [v85 quantityWithUnit:v86 doubleValue:1.0];

            v88 = (void *)MEMORY[0x263F0A648];
            v89 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v127];
            v90 = [v88 quantitySampleWithType:v89 quantity:v87 startDate:v133 endDate:v83];

            id v16 = v130;
            [v17 setObject:v90 forKey:v133];
            [v132 addObject:v90];
          }
          double v80 = v122;
        }
        else
        {
          id v16 = v130;
          double v80 = v122;
          v82 = (void *)v120;
          v81 = v121;
        }
        v91 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:floor(v80 / 3600.0) * 3600.0];

        v92 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:ceil(v29 / 3600.0) * 3600.0];

        v123 = [(NSCalendar *)self->_calendar components:32 fromDate:v91 toDate:v92 options:0];
        uint64_t v93 = [v123 hour];
        if (v93 >= 1)
        {
          uint64_t v94 = v93;
          for (uint64_t i = 0; i != v94; ++i)
          {
            v96 = [(NSCalendar *)self->_calendar dateByAddingUnit:32 value:i toDate:v91 options:0];
            v97 = [v96 dateByAddingTimeInterval:3600.0];
            v98 = [v16 objectForKey:v96];
            if (!v98)
            {
              v99 = (void *)MEMORY[0x263F0A150];
              v100 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:v129];
              v101 = [v99 categorySampleWithType:v100 value:0 startDate:v96 endDate:v97];

              id v16 = v130;
              [v130 setObject:v101 forKey:v96];
              [v132 addObject:v101];
            }
          }
        }

        uint64_t v19 = v125 + 1;
        id v17 = v119;
        id v15 = v128;
      }
      while (v125 + 1 != v118);
      uint64_t v118 = [obj countByEnumeratingWithState:&v138 objects:v144 count:16];
    }
    while (v118);
  }

  uint64_t v102 = [v132 count];
  _HKInitializeLogging();
  v103 = *MEMORY[0x263F09970];
  BOOL v104 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_INFO);
  if (v102)
  {
    if (v104)
    {
      v105 = v103;
      uint64_t v106 = [v132 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v143 = v106;
      _os_log_impl(&dword_225615000, v105, OS_LOG_TYPE_INFO, "[CWCM] Created %zd samples from workouts", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v108 = (void *)MEMORY[0x263F431C8];
    id v109 = WeakRetained;
    v110 = [v109 database];
    id v137 = v115;
    v134[0] = MEMORY[0x263EF8330];
    v134[1] = 3221225472;
    v134[2] = __155__CHCompanionWorkoutCreditManager__queue_generateAndSaveSamplesForIntervals_withExerciseMinuteTable_standHourTable_standMinuteTable_moveMinuteTable_error___block_invoke;
    v134[3] = &unk_26471FF58;
    id v135 = v109;
    id v136 = v132;
    id v111 = v109;
    char v112 = [v108 performWriteTransactionWithHealthDatabase:v110 error:&v137 block:v134];
    id v113 = v137;
  }
  else
  {
    if (v104)
    {
      *(_WORD *)buf = 0;
      char v112 = 1;
      _os_log_impl(&dword_225615000, v103, OS_LOG_TYPE_INFO, "[CWCM] No new samples generated from workouts", buf, 2u);
    }
    else
    {
      char v112 = 1;
    }
    id v113 = v115;
  }

  return v112;
}

uint64_t __155__CHCompanionWorkoutCreditManager__queue_generateAndSaveSamplesForIntervals_withExerciseMinuteTable_standHourTable_standMinuteTable_moveMinuteTable_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = [*(id *)(a1 + 32) dataProvenanceManager];
  id v6 = [v5 defaultLocalDataProvenance];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) dataManager];
    uint64_t v8 = [v7 insertDataObjects:*(void *)(a1 + 40) withProvenance:v6 creationDate:a3 error:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_queue_samplesForType:(id)a3 fromStartTime:(id)a4 toEndTime:(id)a5
{
  v40[3] = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  __int16 v12 = (void *)MEMORY[0x263F434A0];
  uint64_t v13 = *MEMORY[0x263F43088];
  id v14 = _HDSQLiteValueForDate();

  id v15 = [v12 predicateWithProperty:v13 greaterThanOrEqualToValue:v14];

  id v16 = (void *)MEMORY[0x263F434A0];
  uint64_t v17 = *MEMORY[0x263F43080];
  double v18 = _HDSQLiteValueForDate();

  uint64_t v19 = [v16 predicateWithProperty:v17 lessThanOrEqualToValue:v18];

  v20 = HDDataEntityPredicateForOriginProductType();
  v21 = (void *)MEMORY[0x263F434A8];
  v40[0] = v15;
  v40[1] = v19;
  v40[2] = v20;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
  double v23 = [v21 predicateMatchingAllPredicates:v22];

  double v24 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v32 = 0;
  id v33 = 0;
  v26 = [v24 samplesWithType:v11 profile:WeakRetained encodingOptions:0 predicate:v23 limit:0 anchor:&v33 error:&v32];

  id v27 = v33;
  id v28 = v32;

  if (v28)
  {
    _HKInitializeLogging();
    double v29 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v35 = v28;
      __int16 v36 = 2112;
      uint64_t v37 = v23;
      __int16 v38 = 2112;
      id v39 = v27;
      _os_log_error_impl(&dword_225615000, v29, OS_LOG_TYPE_ERROR, "[CWCM] Error: %{public}@ fetching samples with predicate: %@, anchor: %@", buf, 0x20u);
    }
    id v30 = 0;
  }
  else
  {
    id v30 = v26;
  }

  return v30;
}

- (id)_queue_workoutsSinceAnchor:(id *)a3 error:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v8 = HDDataEntityPredicateForOriginProductType();
  calendar = self->_calendar;
  id v10 = [MEMORY[0x263EFF910] date];
  id v11 = [(NSCalendar *)calendar dateByAddingUnit:16 value:-1 toDate:v10 options:0];

  __int16 v12 = [(NSCalendar *)self->_calendar startOfDayForDate:v11];
  uint64_t v13 = HDSampleEntityPredicateForEndDate();

  id v14 = [MEMORY[0x263F434D0] compoundPredicateWithPredicate:v8 otherPredicate:v13];
  id v15 = (void *)MEMORY[0x263F43458];
  id v16 = [MEMORY[0x263F0A598] workoutType];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v21 = v7;
  double v18 = [v15 samplesWithType:v16 profile:WeakRetained encodingOptions:0 predicate:v14 limit:0 anchor:a3 error:&v21];
  id v19 = v21;

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end