@interface HDSeriesQuantityDataAggregator
- (BOOL)requiresNewSeriesForDatum:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 currentSeries:(id)a6 configuration:(id)a7 aggregationInterval:(double)a8;
- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8;
- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7;
- (id)_codableDatumsFromData:(id)a1;
- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9;
- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4;
- (id)initialAggregationState;
- (uint64_t)_successForPersistenceError:(void *)a3 series:(void *)a4 error:;
- (void)addDatum:(id)a3 toAccumulatedData:(id)a4;
@end

@implementation HDSeriesQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HDSeriesQuantityDataAggregator;
  id result = [(HDActiveQuantityDataAggregator *)&v5 initForQuantityType:a3 dataCollectionManager:a4];
  if (result) {
    *((_DWORD *)result + 26) = 0;
  }
  return result;
}

- (uint64_t)_successForPersistenceError:(void *)a3 series:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 3);
    if (v9)
    {
      id v10 = [v8 UUID];
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
      v11 = *(void **)(a1 + 112);
      if (!v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v13 = *(void **)(a1 + 112);
        *(void *)(a1 + 112) = v12;

        v11 = *(void **)(a1 + 112);
      }
      [v11 addObject:v10];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    }
    else
    {
      id v14 = v7;
      id v10 = v14;
      if (v14)
      {
        if (a4)
        {
          id v10 = v14;
          *a4 = v10;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)requiresNewSeriesForDatum:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 currentSeries:(id)a6 configuration:(id)a7 aggregationInterval:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v18 = [v16 UUID];
  if (self)
  {
    id v19 = v18;
    os_unfair_lock_lock(&self->_lock);
    char v20 = [(NSMutableSet *)self->_lock_failedSeriesUUIDs containsObject:v19];

    os_unfair_lock_unlock(&self->_lock);
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  if (!v15)
  {
    if (a5 > 288) {
      goto LABEL_3;
    }
    goto LABEL_15;
  }
  v22 = [v15 metadata];
  uint64_t v23 = [v14 metadata];
  if (v22 == (void *)v23)
  {
  }
  else
  {
    v24 = (void *)v23;
    uint64_t v25 = [v14 metadata];
    if (!v25)
    {

      goto LABEL_3;
    }
    v26 = (void *)v25;
    v27 = [v15 metadata];
    v28 = [v14 metadata];
    int v46 = [v27 isEqual:v28];

    if (!v46)
    {
LABEL_3:
      BOOL v21 = 1;
      goto LABEL_16;
    }
  }
  v29 = [v14 dateInterval];
  v30 = [v29 startDate];
  [v30 timeIntervalSinceReferenceDate];
  double v32 = v31;
  v33 = [v15 dateInterval];
  v34 = [v33 endDate];
  [v34 timeIntervalSinceReferenceDate];
  double v36 = v35;

  BOOL v21 = 1;
  if (a5 <= 288 && v32 - v36 <= fmax(a8, 120.0))
  {
LABEL_15:
    v37 = [v14 dateInterval];
    v38 = [v37 endDate];
    [v38 timeIntervalSinceReferenceDate];
    double v40 = v39;
    v41 = [v16 startDate];
    [v41 timeIntervalSinceReferenceDate];
    double v43 = v40 - v42;

    [v17 maximumSeriesDuration];
    BOOL v21 = v43 > v44;
  }
LABEL_16:

  return v21;
}

- (void)addDatum:(id)a3 toAccumulatedData:(id)a4
{
}

- (id)_codableDatumsFromData:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v2 quantityType];
    objc_super v5 = [v4 canonicalUnit];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__HDSeriesQuantityDataAggregator__codableDatumsFromData___block_invoke;
    v8[3] = &unk_1E62F4490;
    id v9 = v5;
    id v6 = v5;
    objc_msgSend(v3, "hk_map:", v8);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id __57__HDSeriesQuantityDataAggregator__codableDatumsFromData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F2ADB0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 dateInterval];
  [v6 duration];
  *(float *)&double v7 = v7;
  [v5 setDuration:v7];

  id v8 = [v4 dateInterval];
  id v9 = [v8 startDate];
  [v9 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setTimeInterval:");

  id v10 = [v4 quantity];

  [v10 doubleValueForUnit:*(void *)(a1 + 32)];
  objc_msgSend(v5, "setValue:");

  return v5;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v15 = (_HDSeriesQuantityDataAggregationState *)a3;
  id v16 = a4;
  id v17 = a5;
  int64_t v18 = a7;
  id v19 = v17;
  id v20 = a6;
  v99 = v19;
  v100 = v16;
  v102 = v20;
  if ([(HDSeriesQuantityDataAggregator *)self shouldAggregateToSeriesForState:v15 collector:v16 device:v19 requestedAggregationDate:v20 mode:v18 options:a8])
  {
    int64_t v98 = v18;
    BOOL v21 = v15;
    v105 = self;
    if (self)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [(HDDataAggregationState *)v21 openSeries];
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          _HKInitializeLogging();
          v26 = (void *)*MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
          {
            v90 = v26;
            v91 = (objc_class *)objc_opt_class();
            NSStringFromClass(v91);
            v92 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v105;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2114;
            v159 = v92;
            _os_log_fault_impl(&dword_1BCB7D000, v90, OS_LOG_TYPE_FAULT, "%{public}@: Saved state has unexpected open series %{public}@ (expected class %{public}@); resetting state.",
              buf,
              0x20u);
          }
          v27 = [_HDSeriesQuantityDataAggregationState alloc];
          v28 = [(HDDataAggregationState *)v21 unaggregatedSensorData];
          v101 = [(HDDataAggregationState *)v27 initWithRemainingSensorData:v28];
        }
        else
        {
          v101 = v21;
        }
      }
      else
      {
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
        {
          v85 = v24;
          v86 = (objc_class *)objc_opt_class();
          v87 = NSStringFromClass(v86);
          v88 = (objc_class *)objc_opt_class();
          NSStringFromClass(v88);
          v89 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v105;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v87;
          *(_WORD *)&buf[22] = 2114;
          v159 = v89;
          _os_log_fault_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_FAULT, "%{public}@: Received unexpected state object %{public}@ (expected class %{public}@); resetting state.",
            buf,
            0x20u);
        }
        uint64_t v25 = [_HDSeriesQuantityDataAggregationState alloc];
        v22 = [(HDDataAggregationState *)v21 unaggregatedSensorData];
        v101 = [(HDDataAggregationState *)v25 initWithRemainingSensorData:v22];
      }
    }
    else
    {
      v101 = 0;
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v159 = __Block_byref_object_copy__10;
    v160 = __Block_byref_object_dispose__10;
    id v161 = [(HDDataAggregationState *)v101 openSeries];
    uint64_t v150 = 0;
    v151 = (id *)&v150;
    uint64_t v152 = 0x3032000000;
    v153 = __Block_byref_object_copy__10;
    v154 = __Block_byref_object_dispose__10;
    id v155 = [(_HDSeriesQuantityDataAggregationState *)v101 lastDatum];
    uint64_t v144 = 0;
    v145 = &v144;
    uint64_t v146 = 0x3032000000;
    v147 = __Block_byref_object_copy__10;
    v148 = __Block_byref_object_dispose__10;
    [(_HDSeriesQuantityDataAggregationState *)v101 lastDatum];
    v29 = v105;
    id v149 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v140 = 0;
    v141 = &v140;
    uint64_t v142 = 0x2020000000;
    uint64_t v143 = 0;
    uint64_t v143 = [(_HDSeriesQuantityDataAggregationState *)v101 length];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v93 = [MEMORY[0x1E4F28B00] currentHandler];
        [v93 handleFailureInMethod:a2, v105, @"HDSeriesQuantityDataAggregator.m", 200, @"Invalid parameter not satisfying: %@", @"currentSeries == nil || [currentSeries isKindOfClass:[HKQuantitySample class]]" object file lineNumber description];

        v29 = v105;
      }
    }
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(HDActiveDataAggregator *)v29 aggregationIntervalForCollector:v16];
    double v32 = v31;
    v104 = [(HDDataAggregator *)v29 configuration];
    uint64_t v134 = 0;
    v135 = &v134;
    uint64_t v136 = 0x3032000000;
    v137 = __Block_byref_object_copy__10;
    v138 = __Block_byref_object_dispose__10;
    id v139 = 0;
    v33 = [(HDDataAggregator *)v29 dataCollectionManager];
    v34 = [v33 profile];
    double v35 = [v34 dataManager];
    double v36 = [v35 quantitySeriesManager];

    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke;
    aBlock[3] = &unk_1E62F44E0;
    id v96 = v37;
    id v125 = v96;
    v126 = v105;
    v129 = &v134;
    v130 = &v140;
    v131 = &v144;
    v132 = buf;
    v133 = &v150;
    id v38 = v30;
    id v127 = v38;
    id v95 = v36;
    id v128 = v95;
    double v39 = (void (**)(void))_Block_copy(aBlock);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_297;
    v120[3] = &unk_1E62F4530;
    v120[4] = v105;
    id v121 = v99;
    v123 = buf;
    id v97 = v38;
    id v122 = v97;
    v103 = (void (**)(void *, void *))_Block_copy(v120);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    double v40 = [(HDDataAggregationState *)v101 unaggregatedSensorData];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v116 objects:v157 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v117 != v42) {
            objc_enumerationMutation(v40);
          }
          double v44 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v52 = [MEMORY[0x1E4F28B00] currentHandler];
            [v52 handleFailureInMethod:a2, v105, @"HDSeriesQuantityDataAggregator.m", 265, @"Invalid parameter not satisfying: %@", @"[datum isKindOfClass:[HDQuantityDatum class]]" object file lineNumber description];
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            id v45 = v151[5];
            uint64_t v46 = v141[3];
            uint64_t v47 = [(id)v135[5] count];
            if ([(HDSeriesQuantityDataAggregator *)v105 requiresNewSeriesForDatum:v44 lastDatum:v45 seriesLength:v47 + v46 currentSeries:*(void *)(*(void *)&buf[8] + 40) configuration:v104 aggregationInterval:v32])
            {
              v39[2](v39);
            }
          }
          if (!*(void *)(*(void *)&buf[8] + 40)) {
            v103[2](v103, v44);
          }
          uint64_t v48 = v135[5];
          if (!v48)
          {
            id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v50 = (void *)v135[5];
            v135[5] = (uint64_t)v49;

            uint64_t v48 = v135[5];
          }
          [(HDSeriesQuantityDataAggregator *)v105 addDatum:v44 toAccumulatedData:v48];
          objc_storeStrong(v151 + 5, v44);
          uint64_t v51 = v141[3];
          if ([(id)v135[5] count] + v51 == 289) {
            v39[2](v39);
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v116 objects:v157 count:16];
      }
      while (v41);
    }

    if ([(id)v135[5] count])
    {
      v53 = [MEMORY[0x1E4F1C9C8] date];
      [v104 collectionLatency];
      double v55 = v54;
      for (unint64_t j = 0; j < [(id)v135[5] count]; ++j)
      {
        v57 = [(id)v135[5] objectAtIndexedSubscript:j];
        v58 = [v57 dateInterval];
        v59 = v58;
        if (!v102) {
          goto LABEL_44;
        }
        v60 = [v58 endDate];
        char v61 = objc_msgSend(v60, "hk_isBeforeOrEqualToDate:", v102);

        if ((v61 & 1) != 0
          || !v98
          && ([v59 startDate],
              v62 = objc_claimAutoreleasedReturnValue(),
              char v63 = objc_msgSend(v62, "hk_isBeforeOrEqualToDate:", v102),
              v62,
              (v63 & 1) != 0))
        {
        }
        else
        {
LABEL_44:
          v64 = [v59 endDate];
          [v53 timeIntervalSinceDate:v64];
          BOOL v66 = v65 < v55;

          if (v66) {
            break;
          }
        }
      }
      if (j)
      {
        v67 = objc_msgSend((id)v135[5], "subarrayWithRange:", 0, j);
        [v96 addObjectsFromArray:v67];
        uint64_t v68 = [v67 lastObject];
        v69 = (void *)v145[5];
        v145[5] = v68;

        v70 = -[HDSeriesQuantityDataAggregator _codableDatumsFromData:](v105, v67);
        objc_msgSend((id)v135[5], "removeObjectsInRange:", 0, j);
        v141[3] += j;
        v71 = *(void **)(*(void *)&buf[8] + 40);
        if (!v71)
        {
          v72 = [v67 firstObject];
          v103[2](v103, v72);

          v71 = *(void **)(*(void *)&buf[8] + 40);
        }
        id v73 = v71;
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_3;
        v111[3] = &unk_1E62F4558;
        id v112 = v95;
        id v74 = v70;
        id v113 = v74;
        id v75 = v73;
        id v114 = v75;
        v115 = v105;
        v76 = (void *)[v111 copy];
        v77 = _Block_copy(v76);
        [v97 addObject:v77];
      }
    }
    if ((a8 & 2) != 0) {
      v39[2](v39);
    }
    uint64_t v78 = *(void *)(*(void *)&buf[8] + 40);
    if (v78
      && [(HDSeriesQuantityDataAggregator *)v105 shouldFreezeCurrentSeries:v78 lastDatum:v151[5] seriesLength:v141[3] configuration:v104 aggregationInterval:v32])
    {
      v39[2](v39);
    }
    v79 = [_HDSeriesQuantityDataAggregationState alloc];
    v80 = (void *)v135[5];
    id v81 = v80;
    if (!v80) {
      id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v82 = -[_HDSeriesQuantityDataAggregationState initWithRemainingSensorData:currentSeries:lastDatum:length:](v79, (uint64_t)v81, *(void *)(*(void *)&buf[8] + 40), (void *)v145[5], (void *)v141[3]);
    if (!v80) {

    }
    if ([v97 count])
    {
      v83 = [HDDataAggregationResult alloc];
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_4;
      v106[3] = &unk_1E62F4580;
      id v107 = v97;
      v108 = v105;
      v110 = &v144;
      id v109 = v100;
      uint64_t v23 = [(HDDataAggregationResult *)v83 initWithResultingAggregationState:v82 consumedSensorData:v96 persistenceHandler:v106];
    }
    else
    {
      uint64_t v23 = [[HDDataAggregationResult alloc] initWithResultingAggregationState:v82 consumedSensorData:0 persistenceHandler:0];
    }

    _Block_object_dispose(&v134, 8);
    _Block_object_dispose(&v140, 8);
    _Block_object_dispose(&v144, 8);

    _Block_object_dispose(&v150, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v156.receiver = self;
    v156.super_class = (Class)HDSeriesQuantityDataAggregator;
    v101 = v15;
    uint64_t v23 = [(HDActiveQuantityDataAggregator *)&v156 aggregateForState:v15 collector:v16 device:v19 requestedAggregationDate:v20 mode:v18 options:a8 error:a9];
  }

  return v23;
}

void __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v2 = -[HDSeriesQuantityDataAggregator _codableDatumsFromData:](*(id *)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v4 = [v2 count];
  uint64_t v5 = [*(id *)(a1 + 32) lastObject];
  uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  if (v8)
  {
    uint64_t v16 = v4 + v3;
    id v17 = *(void **)(a1 + 48);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2;
    uint64_t v25 = &unk_1E62F44B8;
    id v26 = v2;
    id v27 = *(id *)(a1 + 56);
    id v18 = v8;
    uint64_t v19 = *(void *)(a1 + 40);
    id v28 = v18;
    uint64_t v29 = v19;
    id v30 = v9;
    uint64_t v31 = v16;
    id v20 = (void *)[&v22 copy];
    BOOL v21 = _Block_copy(v20);
    objc_msgSend(v17, "addObject:", v21, v22, v23, v24, v25);
  }
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v81 = 0;
    int v9 = [v6 insertValues:v7 series:v8 error:&v81];
    id v10 = v81;
    id v11 = v10;
    if (!v9)
    {
      uint64_t v50 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](*(void *)(a1 + 56), v10, *(void **)(a1 + 48), a3);
      goto LABEL_33;
    }
  }
  uint64_t v78 = a3;
  uint64_t v12 = *(void **)(a1 + 64);
  v13 = *(void **)(a1 + 48);
  uint64_t v14 = [*(id *)(a1 + 56) dataCollectionManager];
  id v15 = [v14 profile];
  id v16 = v13;
  id v79 = v12;
  id v17 = v5;
  id v18 = v15;
  uint64_t v77 = self;
  uint64_t v19 = [v18 daemon];
  id v20 = [v19 behavior];
  LOBYTE(v12) = [v20 isAppleInternalInstall];
  int v21 = _HDIsUnitTesting;

  uint64_t v22 = (os_log_t *)MEMORY[0x1E4F29F10];
  if ((v12 & 1) != 0 || v21)
  {
    id v23 = [v16 sampleType];
    if ([v23 code] == 173)
    {
LABEL_26:

      goto LABEL_27;
    }
    v24 = [v16 sampleType];
    uint64_t v25 = [v24 code];

    BOOL v26 = v25 == 172;
    uint64_t v22 = (os_log_t *)MEMORY[0x1E4F29F10];
    if (!v26)
    {
      id v82 = 0;
      id v27 = v16;
      id v73 = v17;
      id v75 = v18;
      id v28 = v79;
      self;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9C8];
      v76 = v27;
      [v27 _startTimestamp];
      uint64_t v31 = [v29 dateWithTimeIntervalSinceReferenceDate:v30 + 1.0];
      double v32 = [v28 dateInterval];

      v33 = [v32 endDate];
      v34 = [v33 dateByAddingTimeInterval:-1.0];

      double v35 = v75;
      double v36 = 0;
      if ((objc_msgSend(v31, "hk_isAfterOrEqualToDate:", v34) & 1) == 0)
      {
        v71 = v31;
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v31 endDate:v34];
        id v38 = [v76 quantityType];
        v70 = (void *)v37;
        double v39 = (void *)v37;
        double v35 = v75;
        v72 = HDSampleEntityPredicateForDateInterval(v39, v38);

        double v40 = [v75 dataProvenanceManager];
        uint64_t v41 = [v40 provenanceEntityForProvenance:v73 error:&v82];

        uint64_t v42 = v41;
        if (v41)
        {
          v69 = v34;
          double v43 = (void *)MEMORY[0x1E4F65D00];
          uint64_t v68 = v41;
          double v44 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v41, "persistentID"));
          id v45 = [v43 predicateWithProperty:@"provenance" equalToValue:v44];

          uint64_t v46 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v72 otherPredicate:v45];
          uint64_t v47 = [v76 quantityType];
          *(void *)buf = 0;
          v67 = (void *)v46;
          double v36 = +[HDSampleEntity anySampleOfType:v47 profile:v75 encodingOptions:0 predicate:v46 error:buf];
          id v48 = *(id *)buf;

          if (v36)
          {
            id v49 = v36;
          }
          else if (v48)
          {
            id v82 = v48;
          }

          double v35 = v75;
          uint64_t v31 = v71;
          uint64_t v42 = v68;
          v34 = v69;
        }
        else
        {
          double v36 = 0;
          uint64_t v31 = v71;
        }
      }
      id v23 = v82;
      if (v36)
      {
        id v74 = v17;
        _HKInitializeLogging();
        uint64_t v51 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v77;
          __int16 v84 = 2114;
          v85 = v76;
          __int16 v86 = 2114;
          id v87 = v36;
          _os_log_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: new series %{public}@ overlaps with %{public}@", buf, 0x20u);
        }
        [v75 daemon];
        v53 = v52 = v36;
        double v54 = [v53 autoBugCaptureReporter];
        double v55 = [v76 quantityType];
        [v54 reportDataCollectionSeriesProblem:@"overlap" quantityType:v55];

        double v36 = v52;
        id v17 = v74;
      }
      if (v23)
      {
        _HKInitializeLogging();
        v56 = *MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v77;
          __int16 v84 = 2114;
          v85 = v76;
          __int16 v86 = 2114;
          id v87 = v23;
          _os_log_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_INFO, "%{public}@: error checking for overlap with %{public}@: %{public}@", buf, 0x20u);
        }
      }

      uint64_t v22 = (os_log_t *)MEMORY[0x1E4F29F10];
      goto LABEL_26;
    }
  }
LABEL_27:

  _HKInitializeLogging();
  v57 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
  {
    v59 = *(void **)(a1 + 48);
    uint64_t v58 = *(void *)(a1 + 56);
    uint64_t v61 = *(void *)(a1 + 64);
    v60 = *(void **)(a1 + 72);
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v58;
    __int16 v84 = 2112;
    v85 = v59;
    __int16 v86 = 2048;
    id v87 = v60;
    __int16 v88 = 2112;
    uint64_t v89 = v61;
    _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: Freezing series %@, length %ld, with final datum %@", buf, 0x2Au);
  }
  v62 = *(void **)(a1 + 40);
  uint64_t v63 = *(void *)(a1 + 48);
  v64 = [*(id *)(a1 + 64) metadata];
  id v80 = 0;
  double v65 = [v62 freezeSeries:v63 metadata:v64 endDate:0 error:&v80];
  id v11 = v80;

  if (v65) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](*(void *)(a1 + 56), v11, *(void **)(a1 + 48), v78);
  }

LABEL_33:
  return v50;
}

void __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1E4F2B388];
    id v6 = *(id *)(a1 + 40);
    id v7 = a2;
    uint64_t v8 = [v3 quantityType];
    int v9 = [v7 quantity];
    id v10 = [v7 dateInterval];

    id v11 = [v10 startDate];
    uint64_t v3 = [v5 _unfrozenQuantitySampleWithQuantityType:v8 quantity:v9 startDate:v11 device:v6];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2_298;
  uint64_t v19 = &unk_1E62F4508;
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v3;
  id v13 = v3;
  uint64_t v14 = (void *)[&v16 copy];
  id v15 = _Block_copy(v14);
  objc_msgSend(v12, "addObject:", v15, v16, v17, v18, v19, v20);
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_2_298(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 dataCollectionManager];
  uint64_t v8 = [v7 profile];
  int v9 = [v8 dataManager];
  v13[0] = *(void *)(a1 + 40);
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v11 = [v9 insertDataObjects:v10 withProvenance:v6 creationDate:1 skipInsertionFilter:a3 error:CFAbsoluteTimeGetCurrent()];

  return v11;
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  id v12 = 0;
  char v8 = [v5 insertValues:v6 series:v7 error:&v12];
  id v9 = v12;
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -[HDSeriesQuantityDataAggregator _successForPersistenceError:series:error:](a1[7], v9, (void *)a1[6], a3);
  }

  return v10;
}

uint64_t __113__HDSeriesQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    id v9 = (os_log_t *)MEMORY[0x1E4F29F10];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        char v11 = (*(uint64_t (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v10) + 16))();
        id v12 = 0;
        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          id v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v24 = v14;
            __int16 v25 = 2114;
            id v26 = v12;
            _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring failed persistence: %{public}@", buf, 0x16u);
          }
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v15) {
    uint64_t v16 = [*(id *)(a1 + 40) didPersistObjects:0 lastDatum:v15 collector:*(void *)(a1 + 48) error:a3];
  }
  else {
    uint64_t v16 = 1;
  }

  return v16;
}

- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8
{
  return 1;
}

- (id)initialAggregationState
{
  id v2 = [_HDSeriesQuantityDataAggregationState alloc];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = -[_HDSeriesQuantityDataAggregationState initWithRemainingSensorData:currentSeries:lastDatum:length:](v2, (uint64_t)v3, 0, 0, 0);

  return v4;
}

- (BOOL)shouldFreezeCurrentSeries:(id)a3 lastDatum:(id)a4 seriesLength:(int64_t)a5 configuration:(id)a6 aggregationInterval:(double)a7
{
  return 0;
}

- (void).cxx_destruct
{
}

@end