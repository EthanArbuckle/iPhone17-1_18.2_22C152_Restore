@interface HDMCHeartStatisticsEnumerator
- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4;
- (HDMCHeartStatisticsEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 databaseAccessibilityAssertion:(id)a6;
- (id)_asleepSleepAnalysisDateIntervalTreeOnDayIndex:(int64_t)a3 calendar:(id)a4 error:(id *)a5;
- (id)_cachingSessionWithCalendar:(id)a3 error:(id *)a4;
- (id)_heartStatisticsForDayIndex:(int64_t)a3 calendar:(id)a4 errorOut:(id *)a5;
@end

@implementation HDMCHeartStatisticsEnumerator

- (id)_cachingSessionWithCalendar:(id)a3 error:(id *)a4
{
  v62[2] = *MEMORY[0x263EF8340];
  id v53 = a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained sourceManager];
  id v56 = 0;
  v8 = [v7 localDeviceSourceWithError:&v56];
  id v9 = v56;

  if (v8)
  {
    id v10 = objc_loadWeakRetained((id *)p_profile);
    v11 = [v10 metadataManager];
    uint64_t v12 = *MEMORY[0x263F0AB20];
    MEMORY[0x22A634880]();
    v13 = v51 = v8;
    v49 = [v11 predicateWithMetadataKey:v12 allowedValues:v13];

    v14 = (void *)MEMORY[0x263F434A8];
    v15 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v62[0] = v15;
    v62[1] = v49;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
    v47 = [v14 predicateMatchingAllPredicates:v16];

    v17 = _HKCategoryValueSleepAnalysisAsleepValues();
    v48 = HDCategorySampleEntityPredicateEqualToValues();

    uint64_t v60 = *MEMORY[0x263F42FD0];
    uint64_t v61 = MEMORY[0x263EFFA88];
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    id v50 = v9;
    id v19 = objc_alloc(MEMORY[0x263F432F8]);
    v20 = (void *)MEMORY[0x263EFFA08];
    v21 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
    v59 = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    v23 = [v20 setWithArray:v22];
    v46 = (void *)v18;
    v45 = (void *)[v19 initWithSampleTypes:v23 encodingOptions:v18 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v48];

    id v24 = objc_alloc(MEMORY[0x263F432F8]);
    v25 = (void *)MEMORY[0x263EFFA08];
    v26 = [MEMORY[0x263F0A658] heartRateType];
    v58 = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
    v28 = [v25 setWithArray:v27];
    v43 = (void *)[v24 initWithSampleTypes:v28 encodingOptions:v18 restrictedSourceEntities:0 authorizationFilter:0 samplePredicate:v47];

    v44 = [MEMORY[0x263EFFA18] localTimeZone];
    v29 = NSString;
    v30 = [v44 name];
    v31 = [v29 stringWithFormat:@"%@_%@", @"menstrualCycles", v30];

    v32 = objc_msgSend(MEMORY[0x263F08798], "hk_sleepDayIntervalForMorningIndexRange:calendar:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v53);
    id v33 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v33 setDay:1];
    id v34 = objc_alloc(MEMORY[0x263F43310]);
    id v35 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v36 = objc_opt_class();
    v37 = [v32 startDate];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __67__HDMCHeartStatisticsEnumerator__cachingSessionWithCalendar_error___block_invoke;
    v54[3] = &unk_264750E18;
    id v55 = v53;
    v8 = v51;
    v38 = (void *)[v34 initWithProfile:v35 cachingIdentifier:v31 sourceEntity:v51 queryDescriptor:v43 cachedClass:v36 queryInterval:v32 anchorDate:v37 intervalComponents:v33 timeIntervalToBucketIndex:v54];

    v57 = v45;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    [v38 setInvalidationQueryDescriptors:v39];

    [v38 setAccessibilityAssertion:self->_databaseAccessibilityAssertion];
    id v9 = v50;
  }
  else
  {
    id v40 = v9;
    if (v40)
    {
      if (a4) {
        *a4 = v40;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_FAULT)) {
      -[HDMCHeartStatisticsEnumerator _cachingSessionWithCalendar:error:](v41);
    }
    v38 = 0;
  }

  return v38;
}

uint64_t __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_310(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[2];
  BOOL v12 = __OFSUB__(a4, v11);
  uint64_t v13 = a4 - v11;
  if (v13 < 0 != v12 || v13 >= v10[3])
  {
LABEL_16:
    uint64_t v21 = 1;
    goto LABEL_17;
  }
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEBUG))
    {
      id v24 = v20;
      v25 = objc_opt_class();
      v26 = NSNumber;
      id v27 = v25;
      v28 = [v26 numberWithInteger:a4];
      *(_DWORD *)buf = 138543874;
      v42 = v25;
      __int16 v43 = 2112;
      v44 = v28;
      __int16 v45 = 2114;
      id v46 = v9;
      _os_log_debug_impl(&dword_225722000, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics returned for dayIndex:%@ heart statistics:%{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_16;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  id v40 = 0;
  v16 = [v10 _heartStatisticsForDayIndex:a4 calendar:v15 errorOut:&v40];
  id v17 = v40;
  _HKInitializeLogging();
  uint64_t v18 = (void *)*MEMORY[0x263F09930];
  id v19 = *MEMORY[0x263F09930];
  if (v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v29 = v18;
      v30 = objc_opt_class();
      v31 = NSNumber;
      id v32 = v30;
      id v33 = [v31 numberWithInteger:a4];
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      __int16 v43 = 2112;
      v44 = v33;
      __int16 v45 = 2114;
      id v46 = v16;
      _os_log_debug_impl(&dword_225722000, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics created for dayIndex:%@ heart statistics:%{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 56) addObject:v16];
    if (([v16 isEmpty] & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v34 = v18;
    id v35 = objc_opt_class();
    uint64_t v36 = *(void **)(a1 + 48);
    v37 = NSNumber;
    id v38 = v35;
    v39 = [v37 numberWithInteger:a4];
    *(_DWORD *)buf = 138543874;
    v42 = v35;
    __int16 v43 = 2114;
    v44 = v36;
    __int16 v45 = 2112;
    id v46 = v39;
    _os_log_error_impl(&dword_225722000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating heart statistics: %{public}@ for dayIndex: %@", buf, 0x20u);
  }
  id v23 = v17;
  if (v23)
  {
    if (a5) {
      *a5 = v23;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v21 = 0;
LABEL_17:

  return v21;
}

uint64_t __67__HDMCHeartStatisticsEnumerator__cachingSessionWithCalendar_error___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v3 = objc_msgSend(v2, "hk_morningIndexWithCalendar:", *(void *)(a1 + 32));

  return v3;
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_313(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_313_cold_1(a1, v6);
    }
  }
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_312(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
    }
  }
}

- (HDMCHeartStatisticsEnumerator)initWithProfile:(id)a3 calendarCache:(id)a4 dayIndexRange:(id)a5 databaseAccessibilityAssertion:(id)a6
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMCHeartStatisticsEnumerator;
  v14 = [(HDMCHeartStatisticsEnumerator *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v11);
    objc_storeStrong((id *)&v15->_calendarCache, a4);
    v15->_dayIndexRange.start = var0;
    v15->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v15->_databaseAccessibilityAssertion, a6);
  }

  return v15;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v74 = (void (**)(id, void *))a4;
  v6 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  v7 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = [WeakRetained database];
  id v88 = 0;
  id v10 = [v7 maxRowIDForPredicate:0 healthDatabase:v9 error:&v88];
  id v11 = v88;

  if (!v10)
  {
    id v16 = v11;
    id v12 = v16;
    if (v16)
    {
      if (a3)
      {
        id v12 = v16;
        char v14 = 0;
        *a3 = v12;
        id v15 = v12;
        goto LABEL_62;
      }
      _HKLogDroppedError();
    }
    char v14 = 0;
    id v15 = v12;
    goto LABEL_62;
  }
  id v87 = v11;
  id v12 = [(HDMCHeartStatisticsEnumerator *)self _cachingSessionWithCalendar:v6 error:&v87];
  id v13 = v87;

  if (!v12 && v13)
  {
    char v14 = 0;
    id v15 = v13;
    goto LABEL_62;
  }
  id v86 = v13;
  uint64_t v17 = [v12 cachesExistWithError:&v86];
  id v15 = v86;

  switch(v17)
  {
    case 2:
      id v71 = v15;
      v72 = v10;
      uint64_t v60 = a3;
      _HKInitializeLogging();
      id v19 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v90 = v21;
        id v22 = v21;
        _os_log_impl(&dword_225722000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No cache exists so we need to query all heart statistics data and save to our cache", buf, 0xCu);
      }
      id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
      int64_t start = self->_dayIndexRange.start;
      id v73 = v23;
      v25 = (os_log_t *)MEMORY[0x263F09930];
      uint64_t v61 = v6;
      while (1)
      {
        v26 = (void *)MEMORY[0x22A634E00]();
        id v85 = 0;
        id v27 = [(HDMCHeartStatisticsEnumerator *)self _heartStatisticsForDayIndex:start calendar:v6 errorOut:&v85];
        id v28 = v85;
        if (v27)
        {
          if (([v27 isEmpty] & 1) == 0)
          {
            _HKInitializeLogging();
            os_log_t v29 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEBUG))
            {
              v42 = v29;
              __int16 v43 = objc_opt_class();
              os_log_t log = (os_log_t)NSNumber;
              id v70 = v43;
              uint64_t v44 = [log numberWithInteger:start];
              *(_DWORD *)buf = 138543874;
              v90 = v43;
              __int16 v91 = 2112;
              uint64_t v92 = v44;
              __int16 v45 = (void *)v44;
              __int16 v93 = 2114;
              uint64_t v94 = (uint64_t)v27;
              _os_log_debug_impl(&dword_225722000, v42, OS_LOG_TYPE_DEBUG, "[%{public}@] Statistics created for dayIndex: %@ heart statistics:%{public}@", buf, 0x20u);
            }
            [v73 addObject:v27];
            if ((unint64_t)[v73 count] >= 0x14)
            {
              v84[0] = MEMORY[0x263EF8330];
              v84[1] = 3221225472;
              v84[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke;
              v84[3] = &unk_264750820;
              v84[4] = self;
              [v12 insertCaches:v73 anchor:v72 completion:v84];
              _HKInitializeLogging();
              os_log_t v30 = *v25;
              if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
              {
                loga = v30;
                v63 = objc_opt_class();
                v31 = NSNumber;
                id v68 = v63;
                v64 = [v73 firstObject];
                v62 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v64, "dayIndex"));
                id v32 = NSNumber;
                id v33 = [v73 lastObject];
                id v34 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "dayIndex"));
                *(_DWORD *)buf = 138543874;
                v90 = v63;
                __int16 v91 = 2112;
                uint64_t v92 = (uint64_t)v62;
                __int16 v93 = 2112;
                uint64_t v94 = (uint64_t)v34;
                _os_log_impl(&dword_225722000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Statistics saved from dayIndex:%@ to dayIndex: %@", buf, 0x20u);

                v6 = v61;
              }
              id v35 = objc_alloc_init(MEMORY[0x263EFF980]);

              id v73 = v35;
              v25 = (os_log_t *)MEMORY[0x263F09930];
            }
            v74[2](v74, v27);
          }
        }
        else
        {
          _HKInitializeLogging();
          os_log_t v36 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_ERROR))
          {
            id v38 = v36;
            v39 = objc_opt_class();
            os_log_t logb = (os_log_t)NSNumber;
            id v69 = v39;
            uint64_t v40 = [logb numberWithInteger:start];
            *(_DWORD *)buf = 138543874;
            v90 = v39;
            __int16 v91 = 2114;
            uint64_t v92 = (uint64_t)v28;
            __int16 v93 = 2112;
            uint64_t v94 = v40;
            v41 = (void *)v40;
            _os_log_error_impl(&dword_225722000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating heart statistics: %{public}@ for dayIndex: %@", buf, 0x20u);
          }
        }

        if (v28) {
          break;
        }
        ++start;
        int64_t duration = self->_dayIndexRange.duration;
        if (duration >= 1 && duration + self->_dayIndexRange.start <= start)
        {
          v83[0] = MEMORY[0x263EF8330];
          v83[1] = 3221225472;
          v83[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_309;
          v83[3] = &unk_264750820;
          v83[4] = self;
          id v10 = v72;
          [v12 insertCaches:v73 anchor:v72 completion:v83];

          int v56 = 0;
          a3 = v60;
          goto LABEL_46;
        }
      }
      id v15 = v71;
      if (v60) {
        *uint64_t v60 = v28;
      }
      else {
        _HKLogDroppedError();
      }
      id v10 = v72;

      goto LABEL_61;
    case 1:
      _HKInitializeLogging();
      id v46 = (NSObject **)MEMORY[0x263F09930];
      uint64_t v47 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        v49 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v90 = v49;
        id v50 = v49;
        _os_log_impl(&dword_225722000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cache exists and will be returning values from cache", buf, 0xCu);
      }
      id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v82 = v15;
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_310;
      v77[3] = &unk_264750DF0;
      v77[4] = self;
      v81 = v74;
      id v78 = v6;
      id v79 = v15;
      id v52 = v51;
      id v80 = v52;
      id v53 = v15;
      int v54 = [v12 activateWithError:&v82 cacheHandler:v77];
      id v71 = v82;

      if (v54)
      {
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_312;
        v76[3] = &unk_264750820;
        v76[4] = self;
        [v12 insertCaches:v52 anchor:v10 completion:v76];
      }
      else
      {
        _HKInitializeLogging();
        id v55 = *v46;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[HDMCHeartStatisticsEnumerator enumerateWithError:handler:](v55);
        }
      }

      int v56 = v54 ^ 1;
LABEL_46:
      id v15 = v71;
      break;
    case 0:
      _HKInitializeLogging();
      uint64_t v18 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCHeartStatisticsEnumerator enumerateWithError:handler:](v18);
      }
      id v15 = v15;
      if (v15)
      {
        if (a3) {
          *a3 = v15;
        }
        else {
          _HKLogDroppedError();
        }
      }

LABEL_61:
      char v14 = 0;
      goto LABEL_62;
    default:
      int v56 = 0;
      break;
  }
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_313;
  v75[3] = &unk_264750820;
  v75[4] = self;
  [v12 finishWithCompletion:v75];
  if (v15) {
    int v57 = 1;
  }
  else {
    int v57 = v56;
  }
  if (v57 == 1)
  {
    id v58 = v15;
    if (v15)
    {
      if (a3) {
        *a3 = v58;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  char v14 = v57 ^ 1;
LABEL_62:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (id)_asleepSleepAnalysisDateIntervalTreeOnDayIndex:(int64_t)a3 calendar:(id)a4 error:(id *)a5
{
  v29[2] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F0A158];
  uint64_t v9 = *MEMORY[0x263F09410];
  id v10 = a4;
  id v11 = [v8 categoryTypeForIdentifier:v9];
  id v12 = objc_msgSend(MEMORY[0x263F08798], "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v10);

  id v13 = HDSampleEntityPredicateForDateInterval();

  char v14 = _HKCategoryValueSleepAnalysisAsleepValues();
  id v15 = HDCategorySampleEntityPredicateEqualToValues();

  id v16 = (void *)MEMORY[0x263F434A8];
  v29[0] = v13;
  v29[1] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v18 = [v16 predicateMatchingAllPredicates:v17];

  id v19 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v21 = [v19 entityEnumeratorWithType:v11 profile:WeakRetained];

  [v21 setPredicate:v18];
  [v21 setLimitCount:0];
  id v22 = objc_alloc_init(MEMORY[0x263F0A2C0]);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __95__HDMCHeartStatisticsEnumerator__asleepSleepAnalysisDateIntervalTreeOnDayIndex_calendar_error___block_invoke;
  v27[3] = &unk_264750C50;
  id v28 = v22;
  id v23 = v22;
  if ([v21 enumerateWithError:a5 handler:v27]) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  return v25;
}

BOOL __95__HDMCHeartStatisticsEnumerator__asleepSleepAnalysisDateIntervalTreeOnDayIndex_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x22A634E00]();
  objc_opt_class();
  id v5 = HKSafeObject();
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F08798]);
    v7 = [v5 startDate];
    v8 = [v5 endDate];
    uint64_t v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];

    [*(id *)(a1 + 32) insertInterval:v9];
  }

  return v5 != 0;
}

- (id)_heartStatisticsForDayIndex:(int64_t)a3 calendar:(id)a4 errorOut:(id *)a5
{
  v101[3] = *MEMORY[0x263EF8340];
  v8 = (os_log_t *)MEMORY[0x263F09930];
  id v9 = a4;
  os_signpost_id_t v10 = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  os_log_t v11 = *v8;
  if (os_signpost_enabled(*v8))
  {
    id v12 = v11;
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      char v14 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      v98 = v14;
      _os_signpost_emit_with_name_impl(&dword_225722000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "menstrual-cycles-heartStatisticsForDayIndex", "dayIndex=%@", buf, 0xCu);
    }
  }
  os_signpost_id_t spid = v10;
  v81 = a5;
  uint64_t v15 = [MEMORY[0x263F0A658] heartRateType];
  id v95 = 0;
  [(HDMCHeartStatisticsEnumerator *)self _asleepSleepAnalysisDateIntervalTreeOnDayIndex:a3 calendar:v9 error:&v95];
  uint64_t v17 = v16 = self;
  id v82 = v95;
  uint64_t v18 = objc_msgSend(MEMORY[0x263F43380], "hdmc_tenthPercentileCalculator");
  int64_t v77 = a3;
  id v19 = objc_msgSend(MEMORY[0x263F08798], "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v9);

  v20 = (void *)v15;
  uint64_t v21 = HDSampleEntityPredicateForDateInterval();

  id v78 = v16;
  p_profile = (id *)&v16->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&v16->_profile);
  id v24 = [WeakRetained metadataManager];
  uint64_t v25 = *MEMORY[0x263F0AB20];
  v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26D8EE8F0, 0);
  uint64_t v27 = [v24 predicateWithMetadataKey:v25 allowedValues:v26];

  id v28 = [v17 mergedIntervals];
  uint64_t v29 = [v28 count];

  v84 = (void *)v27;
  if (v29)
  {
    v76 = v18;
    id v30 = objc_loadWeakRetained(p_profile);
    v31 = [v30 metadataManager];
    id v32 = MEMORY[0x22A634880]();
    uint64_t v33 = [v31 predicateWithMetadataKey:v25 allowedValues:v32];

    id v34 = (void *)MEMORY[0x263F434A8];
    id v35 = HDSampleEntityPredicateForDataType();
    v96[0] = v35;
    v96[1] = v21;
    v75 = v21;
    os_log_t v36 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v96[2] = v36;
    v96[3] = v33;
    v74 = (void *)v33;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
    id v38 = [v34 predicateMatchingAllPredicates:v37];

    v39 = objc_msgSend(MEMORY[0x263F43380], "hdmc_tenthPercentileCalculator");
    uint64_t v40 = objc_msgSend(MEMORY[0x263F43380], "hdmc_tenthPercentileCalculator");
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke;
    aBlock[3] = &unk_264750DA0;
    aBlock[4] = v78;
    id v41 = v38;
    id v90 = v41;
    id v91 = v17;
    id v42 = v40;
    id v92 = v42;
    id v43 = v39;
    id v93 = v43;
    uint64_t v44 = _Block_copy(aBlock);
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_4;
    v86[3] = &unk_264750DC8;
    id v45 = v42;
    id v87 = v45;
    id v46 = v44;
    id v88 = v46;
    id v85 = v82;
    int v47 = [v43 performAddSampleTransaction:v86 error:&v85];
    id v48 = v85;

    v49 = v17;
    if (v47)
    {
      id v79 = v41;
      v83 = v20;
      id v50 = (void *)MEMORY[0x263F45138];
      id v51 = [v45 currentStatistics];
      id v52 = [v43 currentStatistics];
      id v53 = [v50 dailyHeartStatisticsWithDayIndex:v77 asleepStatistics:v51 awakeStatistics:v52];

      _HKInitializeLogging();
      int v54 = (void *)*MEMORY[0x263F09930];
      if (!os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
      {
        v20 = v83;
        id v41 = v79;
LABEL_32:

        id v58 = v20;
        if (!v47)
        {
          id v71 = 0;
          uint64_t v21 = v75;
          v65 = v76;
          goto LABEL_41;
        }
        if (v48)
        {
          uint64_t v21 = v75;
          v65 = v76;
          if (v81)
          {
            id v48 = v48;
            id v71 = 0;
            id *v81 = v48;
            goto LABEL_41;
          }
          _HKLogDroppedError();
          goto LABEL_40;
        }
        uint64_t v21 = v75;
        v65 = v76;
LABEL_38:
        id v53 = v53;
        id v48 = 0;
        id v71 = v53;
        goto LABEL_41;
      }
      id v55 = v54;
      int v56 = v55;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        int v57 = [NSNumber numberWithInteger:v77];
        *(_DWORD *)buf = 138412546;
        v98 = v57;
        __int16 v99 = 2112;
        v100 = &unk_26D8EE920;
        _os_signpost_emit_with_name_impl(&dword_225722000, v56, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-heartStatisticsForDayIndex", "dayIndex=%@ sleepData=%@", buf, 0x16u);
      }
      v20 = v83;
      id v41 = v79;
    }
    else
    {
      v66 = v48;
      int v56 = v66;
      if (v66)
      {
        if (v81)
        {
          int v56 = v66;
          id *v81 = v56;
        }
        else
        {
          _HKLogDroppedError();
        }
        v49 = v17;
      }
      id v53 = 0;
    }

    goto LABEL_32;
  }
  id v58 = v20;
  id v80 = v17;
  v59 = (void *)MEMORY[0x263F434A8];
  v101[0] = v21;
  uint64_t v60 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v101[1] = v60;
  v101[2] = v27;
  uint64_t v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:3];
  v62 = [v59 predicateMatchingAllPredicates:v61];

  id v63 = objc_loadWeakRetained(p_profile);
  id v94 = v82;
  v64 = objc_msgSend(v18, "hdmc_heartRateStatisticsWithProfile:predicate:errorOut:", v63, v62, &v94);
  id v48 = v94;

  v65 = v18;
  if (!v48)
  {
    id v53 = [MEMORY[0x263F45138] dailyHeartStatisticsWithDayIndex:v77 asleepStatistics:0 awakeStatistics:v64];
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x263F09930];
    v49 = v80;
    if (os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
    {
      id v68 = v67;
      id v69 = v68;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        id v70 = [NSNumber numberWithInteger:v77];
        *(_DWORD *)buf = 138412546;
        v98 = v70;
        __int16 v99 = 2112;
        v100 = &unk_26D8EE908;
        _os_signpost_emit_with_name_impl(&dword_225722000, v69, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-daily-heart-statistics", "dayIndex=%@ sleepData=%@", buf, 0x16u);
      }
    }

    goto LABEL_38;
  }
  v49 = v17;
  if (v81) {
    id *v81 = v48;
  }
  else {
    _HKLogDroppedError();
  }

  id v53 = 0;
LABEL_40:
  id v71 = 0;
LABEL_41:

  return v71;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained database];
  id v6 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_2;
  v13[3] = &unk_264750D78;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  uint64_t v9 = [v5 performTransactionWithContext:v6 error:&v19 block:v13 inaccessibilityHandler:0];
  id v10 = v19;

  if ((v9 & 1) == 0)
  {
    id v11 = v10;
    if (v11)
    {
      if (a2) {
        *a2 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v9;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [MEMORY[0x263F43268] metadataValueStatementWithTransaction:a2];
  id v6 = (void *)MEMORY[0x263F432F0];
  uint64_t v7 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v19 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_3;
  v14[3] = &unk_264750D50;
  v14[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v15 = v9;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  uint64_t v10 = [v6 orderedQuantityValuesBySeriesForPredicate:v7 profile:WeakRetained options:1 error:&v19 handler:v14];
  id v11 = v19;

  if ((v10 & 1) == 0)
  {
    id v12 = v11;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v10;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v23 = [WeakRetained metadataManager];
  id v24 = [v23 metadataForObjectID:a2 baseMetadata:0 keyFilter:0 statement:*(void *)(a1 + 40) error:a13];

  uint64_t v25 = *MEMORY[0x263F0AB20];
  v26 = [v24 objectForKeyedSubscript:*MEMORY[0x263F0AB20]];

  if (v26)
  {
    if ([*(id *)(a1 + 48) hasOverlapWithStartTime:a6 endTime:a7])
    {
      uint64_t v27 = *(void **)(a1 + 56);
      double v28 = a5;
      double v29 = a6;
      double v30 = a7;
    }
    else
    {
      id v32 = [v24 objectForKeyedSubscript:v25];
      [v32 integerValue];
      int IsSedentary = HKMCHeartRateContextIsSedentary();

      if (!IsSedentary)
      {
        uint64_t v31 = 1;
        goto LABEL_9;
      }
      uint64_t v27 = *(void **)(a1 + 64);
      double v28 = a5;
      double v29 = a3;
      double v30 = a4;
    }
    uint64_t v31 = [v27 addSampleValue:a10 startTime:a13 endTime:v28 sourceID:v29 error:v30];
  }
  else
  {
    uint64_t v31 = 0;
  }
LABEL_9:

  return v31;
}

uint64_t __79__HDMCHeartStatisticsEnumerator__heartStatisticsForDayIndex_calendar_errorOut___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performAddSampleTransaction:*(void *)(a1 + 40) error:a2];
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
    }
  }
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_309(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)enumerateWithError:(void *)a1 handler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error checking for caches in cacheStore: %{public}@", v7, v8, v9, v10, v11);
}

- (void)enumerateWithError:(void *)a1 handler:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (id)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Error activating cache and enumerating over existing caches: %@", v6, v7, v8, v9, 2u);
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_3_2(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error saving statistics in cache store: %{public}@", v7, v8, v9, v10, v11);
}

void __60__HDMCHeartStatisticsEnumerator_enumerateWithError_handler___block_invoke_313_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_3_2(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to finish caching session: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_cachingSessionWithCalendar:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  _os_log_fault_impl(&dword_225722000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Error retrieving source to create cache store: %{public}@", v5, 0x16u);
}

@end