@interface HDDateRangeQueryServer
+ (Class)queryClass;
- (BOOL)_shouldListenForUpdates;
- (BOOL)_shouldObserveAllSampleTypes;
- (HDDateRangeQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (_BYTE)_queue_sendUpdatedResultsToClient;
- (void)_deliverErrorToClient:(void *)a1;
- (void)_queue_start;
- (void)_queue_updateTimePeriodsForSampleTypes:(id *)a1;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDDateRangeQueryServer

- (HDDateRangeQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDDateRangeQueryServer;
  v11 = [(HDQueryServer *)&v18 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sampleTypesToReFetch = v11->_sampleTypesToReFetch;
    v11->_sampleTypesToReFetch = v12;

    v14 = [v10 profile];
    v15 = [v14 database];
    v16 = [(HDQueryServer *)v11 queryQueue];
    [v15 addProtectedDataObserver:v11 queue:v16];
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldObserveAllSampleTypes
{
  return 1;
}

- (void)_queue_start
{
  v8.receiver = self;
  v8.super_class = (Class)HDDateRangeQueryServer;
  [(HDQueryServer *)&v8 _queue_start];
  v3 = [(HDQueryServer *)self profile];
  id v7 = 0;
  v4 = +[HDSampleEntity dateIntervalsForSampleTypes:0 profile:v3 error:&v7];
  id v5 = v7;
  v6 = (void *)[v4 mutableCopy];

  if (v6)
  {
    objc_storeStrong((id *)&self->_dateIntervalsBySampleType, v6);
    -[HDDateRangeQueryServer _queue_sendUpdatedResultsToClient](self);
  }
  else
  {
    -[HDDateRangeQueryServer _deliverErrorToClient:](self, v5);
  }
}

- (void)_deliverErrorToClient:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v5 = [a1 clientProxy];
    v4 = [a1 queryUUID];
    objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);
  }
}

- (_BYTE)_queue_sendUpdatedResultsToClient
{
  if (result)
  {
    result[200] = 1;
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke;
    v1[3] = &unk_1E62F3208;
    v1[4] = result;
    return (unsigned char *)[result onQueue:v1];
  }
  return result;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HDDateRangeQueryServer_samplesAdded_anchor___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(HDQueryServer *)self onQueue:v7];
}

void __46__HDDateRangeQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v1 = *(unsigned char **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  v45 = v1;
  if (!v1) {
    goto LABEL_36;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v10 = [v9 sampleType];
        v11 = [v3 objectForKeyedSubscript:v10];
        if (!v11 || ([v9 _startTimestamp], double v13 = v12, objc_msgSend(v11, "_startTimestamp"), v13 < v14)) {
          [v3 setObject:v9 forKeyedSubscript:v10];
        }
        v15 = [v50 objectForKeyedSubscript:v10];
        if (!v15 || ([v9 _endTimestamp], double v17 = v16, objc_msgSend(v15, "_endTimestamp"), v17 > v18)) {
          [v50 setObject:v9 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v6);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v19 = [v3 keyEnumerator];
  uint64_t v49 = [v19 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (!v49)
  {

    goto LABEL_35;
  }
  id v42 = v2;
  int v20 = 0;
  uint64_t v47 = *(void *)v52;
  id v48 = v3;
  v21 = &OBJC_IVAR___HDQuantitySeriesSampleQueryServer__mode;
  v22 = v45;
  obuint64_t j = v19;
  do
  {
    for (uint64_t j = 0; j != v49; ++j)
    {
      if (*(void *)v52 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * j);
      v25 = [v3 objectForKeyedSubscript:v24];
      v26 = [v50 objectForKeyedSubscript:v24];
      v27 = [*(id *)&v22[v21[65]] objectForKeyedSubscript:v24];
      if (!v27)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C18]);
        v39 = [v25 startDate];
        v40 = [v26 endDate];
        v28 = (void *)[v38 initWithStartDate:v39 endDate:v40];

        [*(id *)&v22[v21[65]] setObject:v28 forKeyedSubscript:v24];
        int v20 = 1;
        goto LABEL_30;
      }
      v28 = v27;
      int v46 = v20;
      v29 = v21;
      v30 = [v27 startDate];
      v31 = [v25 startDate];
      v32 = [v30 earlierDate:v31];

      v33 = [v28 endDate];
      v34 = [v26 endDate];
      v35 = [v33 laterDate:v34];

      v36 = [v28 startDate];
      if ([v36 isEqualToDate:v32])
      {
        v37 = [v28 endDate];
        if ([v37 isEqualToDate:v35])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v22 = v45;
          int v20 = v46;
          if ((isKindOfClass & 1) == 0) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
      }
      v22 = v45;
LABEL_28:
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v32 endDate:v35];
      [*(id *)&v22[v29[65]] setObject:v41 forKeyedSubscript:v24];

      int v20 = 1;
LABEL_29:

      v21 = v29;
LABEL_30:

      id v3 = v48;
    }
    uint64_t v49 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  }
  while (v49);

  id v2 = v42;
  if (v20) {
    -[HDDateRangeQueryServer _queue_sendUpdatedResultsToClient](v22);
  }
LABEL_35:

LABEL_36:
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HDDateRangeQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(HDQueryServer *)self onQueue:v7];
}

void __59__HDDateRangeQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  if (v1)
  {
    id v2 = [v1 profile];
    id v3 = [v2 database];
    int v4 = [v3 isProtectedDataAvailable];

    if (v4) {
      -[HDDateRangeQueryServer _queue_updateTimePeriodsForSampleTypes:](v1, v5);
    }
    else {
      [v1[27] addObjectsFromArray:v5];
    }
  }
}

- (void)_queue_updateTimePeriodsForSampleTypes:(id *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  int v4 = (os_log_t *)MEMORY[0x1E4F29F90];
  id v5 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v34 = a1;
    _os_log_debug_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Updating periods for sample types", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        [a1[26] removeObjectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v8);
  }

  v11 = [a1 profile];
  id v27 = 0;
  double v12 = +[HDSampleEntity dateIntervalsForSampleTypes:v6 profile:v11 error:&v27];
  id v13 = v27;

  if (v12)
  {
    id v22 = v13;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v14 = [v12 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          int v20 = [v12 objectForKeyedSubscript:v19];
          [a1[26] setObject:v20 forKeyedSubscript:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v16);
    }

    -[HDDateRangeQueryServer _queue_sendUpdatedResultsToClient](a1);
    id v13 = v22;
  }
  else
  {
    _HKInitializeLogging();
    v21 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = a1;
      __int16 v35 = 2114;
      id v36 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Error reading intervals from sample types: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v13, "hk_isDatabaseAccessibilityError")) {
      [a1[27] addObjectsFromArray:v6];
    }
    else {
      -[HDDateRangeQueryServer _deliverErrorToClient:](a1, v13);
    }
  }
}

void __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 200))
  {
    _HKInitializeLogging();
    id v2 = (void *)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 208);
      uint64_t v9 = v2;
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = [v8 count];
      _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Sending %lu updated results to client", (uint8_t *)&v10, 0x16u);
    }
    id v3 = [*(id *)(a1 + 32) clientProxy];
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[26];
    id v6 = [v4 queryUUID];
    objc_msgSend(v3, "client_deliverDateIntervals:forQuery:", v5, v6);

    *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v6);

  if (self && v4 && [(NSMutableSet *)self->_sampleTypesToReFetch count])
  {
    id v7 = [(NSMutableSet *)self->_sampleTypesToReFetch allObjects];
    [(NSMutableSet *)self->_sampleTypesToReFetch removeAllObjects];
    -[HDDateRangeQueryServer _queue_updateTimePeriodsForSampleTypes:]((id *)&self->super.super.isa, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTypesToReFetch, 0);

  objc_storeStrong((id *)&self->_dateIntervalsBySampleType, 0);
}

@end