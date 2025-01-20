@interface CLSRoutineService
- (BOOL)hasLocationsOfInterestInformation;
- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4;
- (BOOL)routineIsAvailable;
- (CLSRoutineService)initWithFetchDateInterval:(id)a3 locationCache:(id)a4;
- (CLSRoutineServiceStatisticsStruct)statistics;
- (double)_disambiguationDistanceForDevicePlacementType:(unint64_t)a3;
- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3;
- (id)_fetchLocationOfInterestTransitionsWithinDateInterval:(id)a3 routineManager:(id)a4;
- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4;
- (id)_placemarksFromLocationsOfInterest:(id)a3;
- (id)lastLocationOfInterestVisit;
- (id)locationOfInterestAtLocation:(id)a3;
- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationOfInterestVisitsInDateInterval:(id)a3;
- (id)locationsOfInterestOfType:(int64_t)a3;
- (id)placemarksOfInterestOfType:(int64_t)a3;
- (id)visitsCache;
- (int64_t)predominantTransportationModeForDateInterval:(id)a3 confidence:(double *)a4;
- (unint64_t)_devicePlacementTypeForLocationsOfInterestVisits:(id)a3;
- (void)_buildLocationsOfInterestCache;
- (void)_pinPendingVisits;
- (void)cacheLocationOfInterest:(id)a3;
- (void)invalidateLocationsOfInterest;
- (void)setRoutineIsAvailable:(BOOL)a3;
@end

@implementation CLSRoutineService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_pendingPinningVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_fetchDateInterval, 0);
}

- (CLSRoutineServiceStatisticsStruct)statistics
{
  objc_copyStruct(retstr, &self->_statistics, 72, 1, 0);
  return result;
}

- (void)setRoutineIsAvailable:(BOOL)a3
{
  self->_routineIsAvailable = a3;
}

- (BOOL)routineIsAvailable
{
  return self->_routineIsAvailable;
}

- (id)_placemarksFromLocationsOfInterest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "placemarkWithLocationCache:", self->_locationCache, (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_pinPendingVisits
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableSet *)self->_pendingPinningVisitIdentifiers count];
  if (self->_routineIsAvailable && v3 != 0)
  {
    unint64_t v5 = v3;
    v6 = [(CLSRoutineService *)self visitsCache];
    double v7 = (double)v5;
    double v8 = (double)(unint64_t)[v6 numberOfLocationsOfInterestVisits];
    if (v8 * 0.8 <= (double)v5)
    {
      uint64_t v9 = [v6 locationsOfInterestOfType:0];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      unint64_t v10 = 0;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v42 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [*(id *)(*((void *)&v41 + 1) + 8 * i) visits];
            uint64_t v15 = [v14 count];

            v10 += v15;
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v11);
      }
      long long v16 = [v6 locationsOfInterestOfType:1];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = [*(id *)(*((void *)&v37 + 1) + 8 * j) visits];
            uint64_t v21 = [v20 count];

            v10 += v21;
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
        }
        while (v17);
      }
      if (v8 * 0.9 > (double)v10)
      {
        v22 = +[CLSLogging sharedLogging];
        v23 = [v22 loggingConnection];

        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&buf[4] = v7 / v8;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)v10 / v8;
          _os_log_impl(&dword_1D2150000, v23, OS_LOG_TYPE_INFO, "Safeguard Pinning. Not pinning any visits. total %f, homeWork %f", buf, 0x16u);
        }

        v24 = [MEMORY[0x1E4F1CA80] set];
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        self->_pendingPinningVisitIdentifiers = v24;

LABEL_30:
        return;
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F5CEB8] defaultManager];
    dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v46 = 0;
    v27 = self->_pendingPinningVisitIdentifiers;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __38__CLSRoutineService__pinPendingVisits__block_invoke;
    v34[3] = &unk_1E690FCB0;
    v36 = buf;
    v34[4] = self;
    long long v16 = v26;
    v35 = v16;
    [v9 extendLifetimeOfVisitsWithIdentifiers:v27 handler:v34];
    dispatch_time_t v28 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v16, v28))
    {
      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
      v29 = +[CLSLogging sharedLogging];
      v30 = [v29 loggingConnection];

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_error_impl(&dword_1D2150000, v30, OS_LOG_TYPE_ERROR, "Timeout pinning visits CoreRoutine", v33, 2u);
      }
    }
    v31 = [MEMORY[0x1E4F1CA80] set];
    v32 = self->_pendingPinningVisitIdentifiers;
    self->_pendingPinningVisitIdentifiers = v31;

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
}

void __38__CLSRoutineService__pinPendingVisits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 == 0;
  if (v3)
  {
    id v4 = +[CLSLogging sharedLogging];
    unint64_t v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      double v7 = [v3 localizedDescription];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1D2150000, v5, OS_LOG_TYPE_ERROR, "Could not pin visit with UUIDs %@. \"%@\"", (uint8_t *)&v8, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_fetchLocationOfInterestTransitionsWithinDateInterval:(id)a3 routineManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4528;
    v25 = __Block_byref_object_dispose__4529;
    id v26 = 0;
    dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_13);
    uint64_t v9 = [v6 startDate];
    __int16 v10 = [v6 endDate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__CLSRoutineService__fetchLocationOfInterestTransitionsWithinDateInterval_routineManager___block_invoke_2;
    v18[3] = &unk_1E690FC88;
    v20 = &v21;
    v18[4] = self;
    id v11 = v8;
    id v19 = v11;
    [v7 fetchTransitionsBetweenStartDate:v9 endDate:v10 handler:v18];

    dispatch_time_t v12 = dispatch_time(0, 2000000000);
    if (dispatch_block_wait(v11, v12))
    {
      v13 = +[CLSLogging sharedLogging];
      long long v14 = [v13 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_error_impl(&dword_1D2150000, v14, OS_LOG_TYPE_ERROR, "Timeout getting loi transitions from CoreRoutine", v17, 2u);
      }

      id v15 = 0;
      self->_routineIsAvailable = 0;
    }
    else if (self->_routineIsAvailable)
    {
      id v15 = (id)v22[5];
    }
    else
    {
      id v15 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __90__CLSRoutineService__fetchLocationOfInterestTransitionsWithinDateInterval_routineManager___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  dispatch_block_t v8 = +[CLSLogging sharedLogging];
  uint64_t v9 = [v8 loggingConnection];

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = [v7 userInfo];
      int v11 = 138412546;
      uint64_t v12 = (uint64_t)v7;
      __int16 v13 = 2112;
      long long v14 = v10;
      _os_log_error_impl(&dword_1D2150000, v9, OS_LOG_TYPE_ERROR, "CoreRoutine error getting loi transitions, error: %@, userInfo: %@", (uint8_t *)&v11, 0x16u);
    }
    *(unsigned char *)(a1[4] + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = [v6 count];
      _os_log_impl(&dword_1D2150000, v9, OS_LOG_TYPE_INFO, "CoreRoutine found %lu transitions.", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke;
  long long v14 = &unk_1E690FC60;
  id v15 = v4;
  long long v16 = self;
  id v5 = v4;
  id v6 = (void (**)(void, void))MEMORY[0x1D2602540](&v11);
  id v7 = v6[2](v6, 0);
  if (self->_routineIsAvailable)
  {
    dispatch_block_t v8 = v6[2](v6, 1);
    if (self->_routineIsAvailable)
    {
      uint64_t v9 = objc_msgSend(v7, "mutableCopy", v11, v12, v13, v14, v15, v16);
      [v9 addObjectsFromArray:v8];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_block_t v8 = 0;
  }
  uint64_t v9 = 0;
LABEL_6:

  return v9;
}

id __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4528;
  uint64_t v21 = __Block_byref_object_dispose__4529;
  id v22 = 0;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2;
  v13[3] = &unk_1E690FC38;
  id v15 = &v17;
  uint64_t v16 = a2;
  id v5 = *(void **)(a1 + 32);
  v13[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v14 = v6;
  [v5 fetchLocationsOfInterestOfType:a2 withHandler:v13];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  if (dispatch_block_wait(v6, v7))
  {
    dispatch_block_t v8 = +[CLSLogging sharedLogging];
    uint64_t v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_1D2150000, v9, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", v12, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 40) = 0;
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  dispatch_block_t v8 = +[CLSLogging sharedLogging];
  uint64_t v9 = [v8 loggingConnection];

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v7 userInfo];
      int v13 = 138412546;
      uint64_t v14 = (uint64_t)v7;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_1D2150000, v9, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", (uint8_t *)&v13, 0x16u);
    }
    *(unsigned char *)(a1[4] + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v6 count];
      uint64_t v11 = (void *)a1[7];
      int v13 = 134218240;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D2150000, v9, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois for type %lu", (uint8_t *)&v13, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_block_t v8 = [(CLSRoutineService *)self _fetchHomeAndWorkLocationsOfInterestWithRoutineManager:v7];
  uint64_t v9 = v8;
  if (self->_routineIsAvailable)
  {
    if (v8)
    {
      uint64_t v10 = [v8 mutableCopy];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    }
    id v11 = (id)v10;
    if (v6)
    {
      dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_4539);
      int v13 = [v6 startDate];
      uint64_t v14 = [v6 endDate];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__CLSRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke_2;
      v21[3] = &unk_1E690FC10;
      id v11 = v11;
      id v22 = v11;
      uint64_t v23 = self;
      id v15 = v12;
      id v24 = v15;
      [v7 fetchLocationsOfInterestVisitedBetweenStartDate:v13 endDate:v14 withHandler:v21];

      dispatch_time_t v16 = dispatch_time(0, 2000000000);
      if (dispatch_block_wait(v15, v16))
      {
        uint64_t v17 = +[CLSLogging sharedLogging];
        uint64_t v18 = [v17 loggingConnection];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_error_impl(&dword_1D2150000, v18, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", v20, 2u);
        }

        self->_routineIsAvailable = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __80__CLSRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CLSLogging sharedLogging];
  dispatch_block_t v8 = [v7 loggingConnection];

  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v6 userInfo];
      int v10 = 138412546;
      uint64_t v11 = (uint64_t)v6;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_1D2150000, v8, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) addObjectsFromArray:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_buildLocationsOfInterestCache
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (self->_routineIsAvailable)
  {
    v2 = self;
    v76 = [[CLSLocationOfInterestCache alloc] initWithLocationCache:self->_locationCache];
    id v3 = (void *)MEMORY[0x1D2602300]();
    dispatch_block_t v4 = [MEMORY[0x1E4F5CEB8] defaultManager];
    id v5 = [(CLSRoutineService *)v2 _fetchLocationsOfInterestWithinDateInterval:v2->_fetchDateInterval routineManager:v4];
    if (v2->_routineIsAvailable)
    {
      v62 = v3;
      v63 = v5;
      v64 = v4;
      v65 = v2;
      if (v5)
      {
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        obuint64_t j = v5;
        uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
        if (v68)
        {
          uint64_t v67 = *(void *)v82;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v82 != v67) {
                objc_enumerationMutation(obj);
              }
              id v7 = *(void **)(*((void *)&v81 + 1) + 8 * v6);
              uint64_t v8 = MEMORY[0x1D2602300]();
              id v9 = v7;
              int v10 = [v9 mapItem];
              if ([v10 validMUID]) {
                uint64_t v11 = [v10 muid];
              }
              else {
                uint64_t v11 = 0;
              }
              __int16 v12 = [[CLSLitePlacemark alloc] initWithRTMapItem:v10];
              uint64_t v13 = [v9 type];
              uint64_t v14 = v13 + 1;
              context = (void *)v8;
              uint64_t v75 = v6;
              v71 = v10;
              if ((unint64_t)(v13 + 1) >= 5)
              {
                uint64_t v17 = v13;
                uint64_t v18 = +[CLSLogging sharedLogging];
                uint64_t v19 = [v18 loggingConnection];

                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  unint64_t v92 = v17;
                  _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %lu. File a radar against Photos Media Mining.", buf, 0xCu);
                }

                uint64_t v15 = -1;
                double v16 = 50.0;
              }
              else
              {
                uint64_t v15 = qword_1D21C52F0[v14];
                double v16 = dbl_1D21C5318[v14];
              }
              uint64_t v20 = [(CLSLitePlacemark *)v12 location];
              uint64_t v21 = [CLSLocationOfInterest alloc];
              id v22 = [v9 identifier];
              v70 = v12;
              uint64_t v23 = [(CLSLitePlacemark *)v12 region];
              v69 = (void *)v20;
              id v24 = [(CLSLocationOfInterest *)v21 initWithIdentifier:v22 locationOfInterestType:v15 location:v20 placemarkRegion:v23 businessItemMuid:v11 radius:v16];

              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              v72 = v9;
              v25 = [v9 visits];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v85 objects:buf count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v86 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    v30 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                    id v31 = objc_alloc(MEMORY[0x1E4F28C18]);
                    v32 = [v30 entryDate];
                    v33 = [v30 exitDate];
                    v34 = (void *)[v31 initWithStartDate:v32 endDate:v33];

                    [v30 locationOfInterestConfidence];
                    double v36 = v35;
                    long long v37 = [CLSLocationOfInterestVisit alloc];
                    long long v38 = [v30 identifier];
                    long long v39 = [(CLSLocationOfInterestVisit *)v37 initWithIdentifier:v38 visitInterval:v34 confidence:v36];

                    [(CLSLocationOfInterest *)v24 addVisit:v39];
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v85 objects:buf count:16];
                }
                while (v27);
              }

              [(CLSLocationOfInterestCache *)v76 addLocationOfInterest:v24];
              uint64_t v6 = v75 + 1;
            }
            while (v75 + 1 != v68);
            uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
          }
          while (v68);
        }

        v2 = v65;
      }
      contexta = (void *)MEMORY[0x1D2602300]();
      [(CLSRoutineService *)v2 _fetchLocationOfInterestTransitionsWithinDateInterval:v2->_fetchDateInterval routineManager:v4];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v40 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v78;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v78 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v77 + 1) + 8 * v44);
            char v46 = (void *)MEMORY[0x1D2602300]();
            id v47 = v45;
            id v48 = objc_alloc(MEMORY[0x1E4F28C18]);
            uint64_t v49 = [v47 startDate];
            v50 = [v47 stopDate];
            v51 = (void *)[v48 initWithStartDate:v49 endDate:v50];

            unint64_t v52 = [v47 modeOfTransportation];
            unint64_t v53 = v52;
            if (v52 >= 4)
            {
              v55 = +[CLSLogging sharedLogging];
              v56 = [v55 loggingConnection];

              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                unint64_t v92 = v53;
                _os_log_error_impl(&dword_1D2150000, v56, OS_LOG_TYPE_ERROR, "Undefined ModeOfTransportation %lu. File a radar against Photos Media Mining.", buf, 0xCu);
              }

              uint64_t v54 = -1;
            }
            else
            {
              uint64_t v54 = v52 - 1;
            }
            v57 = [CLSLocationOfInterestTransition alloc];
            v58 = [v47 identifier];
            v59 = [(CLSLocationOfInterestTransition *)v57 initWithIdentifier:v58 transitionInterval:v51 transportationMode:v54];

            [(CLSLocationOfInterestCache *)v76 addLocationOfInterestTransition:v59];
            ++v44;
          }
          while (v42 != v44);
          uint64_t v42 = [v40 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v42);
      }

      dispatch_block_t v4 = v64;
      v2 = v65;
      id v3 = v62;
      id v5 = v63;
    }

    visitsCache = v2->_visitsCache;
    v2->_visitsCache = v76;
    v61 = v76;

    [(CLSLocationOfInterestCache *)v61 numberOfLocationsOfInterest];
    [(CLSLocationOfInterestCache *)v61 numberOfLocationsOfInterestVisits];
    [(CLSLocationOfInterestCache *)v61 numberOfLocationsOfInterestTransitions];
  }
}

- (int64_t)predominantTransportationModeForDateInterval:(id)a3 confidence:(double *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v38 = [(CLSRoutineService *)self visitsCache];
  uint64_t v6 = [v38 locationsOfInterestTransitionInDateInterval:v5];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v14 = [v13 transportationMode];
        uint64_t v15 = [v13 transitionInterval];
        [v15 duration];
        double v17 = v16;

        uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
        uint64_t v19 = [v7 objectForKeyedSubscript:v18];
        [v19 doubleValue];
        double v21 = v20;

        id v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:v17 + v21];
        uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
        [v7 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v24 = v7;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    int64_t v28 = -1;
    double v29 = -1.79769313e308;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        id v31 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        v32 = [v24 objectForKeyedSubscript:v31];
        [v32 doubleValue];
        double v34 = v33;

        if (v34 > v29)
        {
          int64_t v28 = [v31 unsignedIntegerValue];
          double v29 = v34;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v26);

    double v35 = 1.0;
    if (v29 != -1.79769313e308)
    {
      [v5 duration];
      if (v36 > 0.0) {
        double v35 = fmin(v29 / v36, 1.0);
      }
    }
  }
  else
  {

    double v35 = 1.0;
    int64_t v28 = -1;
  }
  if (a4) {
    *a4 = v35;
  }

  return v28;
}

- (double)_disambiguationDistanceForDevicePlacementType:(unint64_t)a3
{
  double result = 1.79769313e308;
  if (a3 == 2) {
    double result = 200000.0;
  }
  if (a3 == 1) {
    return 50000.0;
  }
  return result;
}

- (unint64_t)_devicePlacementTypeForLocationsOfInterestVisits:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 <= 2)
    {
      uint64_t v6 = [v3 anyObject];
      id v7 = [v6 visitInterval];
      [v7 duration];
      double v9 = v8;

      if (v9 >= 43200.0)
      {
        if (v9 >= 172800.0)
        {
          if (v9 <= 86400.0) {
            unint64_t v5 = 0;
          }
          else {
            unint64_t v5 = 3;
          }
        }
        else
        {
          unint64_t v5 = 2;
        }
      }
      else
      {
        unint64_t v5 = 1;
      }
    }
    else
    {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  ++self->_statistics.numberOfMatchRequests;
  double v8 = [(CLSRoutineService *)self visitsCache];
  double v9 = [v8 locationsOfInterestVisitsInDateInterval:v7];
  if (![v9 count]) {
    goto LABEL_3;
  }
  uint64_t v10 = [v8 earliestVisitStartDate];
  uint64_t v11 = [v7 startDate];
  uint64_t v12 = [v10 compare:v11];

  if (v12 == 1) {
    goto LABEL_3;
  }
  double v33 = v8;
  id v34 = v7;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v32 = v9;
  obuint64_t j = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        double v21 = objc_msgSend(v19, "identifier", v32, v33, v34);
        [(NSMutableSet *)pendingPinningVisitIdentifiers addObject:v21];

        id v22 = [v19 locationOfInterest];
        uint64_t v23 = [v22 location];
        [v23 distanceFromLocation:v6];
        double v25 = v24;
        [v22 placemarkLocationDistanceFromLocation:v23 locationCache:self->_locationCache];
        BOOL v26 = v25 <= 200.0;
        if (v27 <= 200.0) {
          BOOL v26 = 1;
        }
        if (v26) {
          ++self->_statistics.numberOfCloseByLocationMatches;
        }
        v16 |= v26;
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);
  }
  else
  {
    char v16 = 0;
  }

  self->_statistics.numberOfTimeMatches += [obj count];
  unint64_t numberOfVisits = self->_statistics.numberOfVisits;
  if (numberOfVisits) {
    self->_statistics.pinningVisitsRatio = (double)(unint64_t)[(NSMutableSet *)self->_pendingPinningVisitIdentifiers count]/ (double)numberOfVisits;
  }
  if (v16)
  {
    BOOL v13 = 0;
LABEL_25:
    double v8 = v33;
    id v7 = v34;
    double v9 = v32;
    goto LABEL_26;
  }
  unint64_t v29 = [(CLSRoutineService *)self _devicePlacementTypeForLocationsOfInterestVisits:obj];
  BOOL v13 = 0;
  if (!v29) {
    goto LABEL_25;
  }
  double v8 = v33;
  id v7 = v34;
  double v9 = v32;
  if (v29 == 3) {
    goto LABEL_26;
  }
  [(CLSRoutineService *)self _disambiguationDistanceForDevicePlacementType:v29];
  v30 = objc_msgSend(v33, "closestLocationOfInterestVisitToLocation:withinDistance:inDateInterval:", v6, v34);

  if (!v30)
  {
    ++self->_statistics.numberOfRemoteLocationMatches;
    BOOL v13 = 1;
    goto LABEL_26;
  }
LABEL_3:
  BOOL v13 = 0;
LABEL_26:

  return v13;
}

- (id)locationOfInterestVisitsInDateInterval:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CLSRoutineService *)self visitsCache];
  id v6 = [v5 locationsOfInterestVisitsAtLocation:0 inDateInterval:v4];

  return v6;
}

- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CLSRoutineService *)self visitsCache];
  double v9 = [v8 locationsOfInterestVisitsAtLocation:v7 inDateInterval:v6];

  return v9;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CLSRoutineService *)self visitsCache];
  id v6 = [v5 locationOfInterestAtLocation:v4];

  return v6;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CLSRoutineService *)self visitsCache];
  double v9 = [v8 closestLocationOfInterestVisitToLocation:v7 withinDistance:v6 inDateInterval:200.0];

  uint64_t v10 = [v9 locationOfInterest];

  return v10;
}

- (id)placemarksOfInterestOfType:(int64_t)a3
{
  id v4 = [(CLSRoutineService *)self locationsOfInterestOfType:a3];
  unint64_t v5 = [(CLSRoutineService *)self _placemarksFromLocationsOfInterest:v4];

  return v5;
}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  id v4 = [(CLSRoutineService *)self visitsCache];
  unint64_t v5 = [v4 locationsOfInterestOfType:a3];

  return v5;
}

- (void)cacheLocationOfInterest:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSRoutineService *)self visitsCache];
  [v5 addLocationOfInterest:v4];
}

- (id)visitsCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_visitsCache) {
    [(CLSRoutineService *)v2 _buildLocationsOfInterestCache];
  }
  objc_sync_exit(v2);

  visitsCache = v2->_visitsCache;
  return visitsCache;
}

- (id)lastLocationOfInterestVisit
{
  v2 = [(CLSRoutineService *)self visitsCache];
  id v3 = [v2 lastLocationOfInterestVisit];

  return v3;
}

- (BOOL)hasLocationsOfInterestInformation
{
  v2 = [(CLSRoutineService *)self visitsCache];
  BOOL v3 = [v2 numberOfLocationsOfInterest] != 0;

  return v3;
}

- (void)invalidateLocationsOfInterest
{
  self->_statistics.pinningVisitsRatio = 0.0;
  *(_OWORD *)&self->_statistics.numberOfTimeMatches = 0u;
  *(_OWORD *)&self->_statistics.numberOfRemoteLocationMatches = 0u;
  *(_OWORD *)&self->_statistics.routineAvailable = 0u;
  *(_OWORD *)&self->_statistics.unint64_t numberOfVisits = 0u;
  visitsCache = self->_visitsCache;
  self->_visitsCache = 0;

  self->_pendingPinningVisitIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  MEMORY[0x1F41817F8]();
}

- (CLSRoutineService)initWithFetchDateInterval:(id)a3 locationCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSRoutineService;
  double v9 = [(CLSRoutineService *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_routineIsAvailable = 1;
    objc_storeStrong((id *)&v9->_fetchDateInterval, a3);
    objc_storeStrong((id *)&v10->_locationCache, a4);
    [(CLSRoutineService *)v10 invalidateLocationsOfInterest];
  }

  return v10;
}

@end