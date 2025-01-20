@interface HDAggregateDataCollector
- (BOOL)requiresSampleAggregation;
- (HDAggregateDataCollector)initWithProfile:(id)a3;
- (double)_queue_aggregationInterval;
- (double)_queue_maxDatumDuration;
- (double)maxDatumDuration;
- (id)_queue_lastReceivedSecondaryContext;
- (id)_queue_lastReceivedSensorDatum;
- (id)_queue_processSensorDataBatched:(id)a3 firstDatum:(id)a4 lastSensorDatum:(id *)a5;
- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)_queue_beginStreaming;
- (void)_queue_fetchHistoricalDataForcedUpdate:(void *)a3 completion:;
- (void)_queue_handleUpdatingHistoricalDataForcedUpdate:(void *)a3 completion:;
- (void)_queue_updateLastReceivedSecondaryContext:(id)a3;
- (void)_queue_updateLastReceivedSensorDatum:(id)a3;
- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4;
- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5;
- (void)setMaxDatumDuration:(double)a3;
- (void)updateHistoricalData;
- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4;
- (void)updateHistoricalDataWithCompletion:(id)a3;
@end

@implementation HDAggregateDataCollector

void __44__HDAggregateDataCollector_initWithProfile___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__HDAggregateDataCollector__queue_executeHistoricalFetchOperation__block_invoke;
    v3[3] = &unk_1E62F2978;
    v3[4] = WeakRetained;
    v2 = WeakRetained;
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](WeakRetained, 0, v3);
    WeakRetained = v2;
  }
}

- (id)_queue_lastReceivedSensorDatum
{
  lastReceivedSensorDatum = self->_lastReceivedSensorDatum;
  if (!lastReceivedSensorDatum)
  {
    -[HDDataCollector _retrieveContextForKey:]((uint64_t)self, @"context");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [(id)objc_opt_class() _sensorDatumFromContext:v4];

    v6 = self->_lastReceivedSensorDatum;
    self->_lastReceivedSensorDatum = v5;

    lastReceivedSensorDatum = self->_lastReceivedSensorDatum;
  }

  return lastReceivedSensorDatum;
}

void __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F10];
  v7 = *MEMORY[0x1E4F29F10];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v8 = v6;
    *(_DWORD *)buf = 138543618;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2114;
    id v17 = v5;
    id v9 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred during update handler: %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v9 = v15;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Received update notification", buf, 0xCu);
LABEL_4:
  }
LABEL_6:
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke_418;
  v12[3] = &unk_1E62F8638;
  char v13 = a2;
  v12[4] = v10;
  dispatch_async(v11, v12);
}

void __44__HDAggregateDataCollector_initWithProfile___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enableLoggingWithName:v4 category:*MEMORY[0x1E4F29F10]];
}

- (double)_queue_aggregationInterval
{
  return self->super._collectionInterval;
}

- (BOOL)requiresSampleAggregation
{
  return 1;
}

- (id)_queue_processSensorDataBatched:(id)a3 firstDatum:(id)a4 lastSensorDatum:(id *)a5
{
  id v8 = a4;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __87__HDAggregateDataCollector__queue_processSensorDataBatched_firstDatum_lastSensorDatum___block_invoke;
  v23 = &unk_1E6308538;
  v24 = self;
  id v12 = v11;
  id v25 = v12;
  char v13 = _Block_copy(&v20);
  [(HDAggregateDataCollector *)self _queue_aggregationInterval];
  double v15 = v14;
  [(HDAggregateDataCollector *)self _queue_maxDatumDuration];
  id v17 = HDDataCollectorEnumerateBatches(v10, v8, v13, v15, v16);

  if (a5) {
    *a5 = v17;
  }
  id v18 = v12;

  return v18;
}

- (double)_queue_maxDatumDuration
{
  return self->_maxDatumDuration;
}

BOOL __87__HDAggregateDataCollector__queue_processSensorDataBatched_firstDatum_lastSensorDatum___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 compare:v12] == 1)
  {
    _HKInitializeLogging();
    char v13 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
    {
      id v17 = v13;
      *(_DWORD *)v19 = 138543874;
      *(void *)&v19[4] = objc_opt_class();
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v11;
      *(_WORD *)&v19[22] = 2112;
      id v20 = v12;
      id v18 = *(id *)&v19[4];
      _os_log_fault_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Tried to create HKObjects with start date (%@) later than end date (%@)", v19, 0x20u);
    }
    id v14 = v12;

    id v11 = v14;
  }
  double v15 = objc_msgSend(*(id *)(a1 + 32), "hkObjectsFromSensorData:baseSensorDatum:startDate:endDate:", v9, v10, v11, v12, *(_OWORD *)v19, *(void *)&v19[16], v20);
  if (v15) {
    [*(id *)(a1 + 40) addObjectsFromArray:v15];
  }

  return v15 != 0;
}

- (void)_queue_updateLastReceivedSensorDatum:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lastReceivedSensorDatum = &self->_lastReceivedSensorDatum;
  objc_storeStrong((id *)&self->_lastReceivedSensorDatum, a3);
  id v6 = a3;
  v7 = *p_lastReceivedSensorDatum;
  id v14 = 0;
  id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
  id v8 = v14;
  if (!v13)
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      id v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      double v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      id v12 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Error encoding context (%@) %{public}@", buf, 0x20u);
    }
  }

  -[HDDataCollector _persistContext:forKey:]((uint64_t)self, v13, @"context");
}

- (void)_queue_beginStreaming
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HDAggregateDataCollector;
  [(HDDataCollector *)&v8 _queue_beginStreaming];
  if (self && self->super._disabled)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
    {
      id v4 = v3;
      id v5 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      id v6 = v5;
      _os_log_debug_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", buf, 0xCu);
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__HDAggregateDataCollector__queue_beginStreaming__block_invoke;
    v7[3] = &unk_1E62F2978;
    v7[4] = self;
    if (self) {
      -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](self, 0, v7);
    }
  }
}

void __49__HDAggregateDataCollector__queue_beginStreaming__block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned __int8 **)(a1 + 32);
  if (a2)
  {
    if (!v2) {
      return;
    }
    int v3 = v2[72];
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29F10];
    id v5 = *MEMORY[0x1E4F29F10];
    if (v3)
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      id v6 = v4;
      LODWORD(v11) = 138543362;
      *(void *)((char *)&v11 + 4) = objc_opt_class();
      id v7 = *(id *)((char *)&v11 + 4);
      _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", (uint8_t *)&v11, 0xCu);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v4;
        LODWORD(v11) = 138543362;
        *(void *)((char *)&v11 + 4) = objc_opt_class();
        id v10 = *(id *)((char *)&v11 + 4);
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin updates", (uint8_t *)&v11, 0xCu);
      }
      id v6 = objc_msgSend(v2, "_queue_lastReceivedSensorDatum", v11);
      [v2 stopPerformingUpdatesWithErrorEncountered:0];
      *(void *)&long long v11 = MEMORY[0x1E4F143A8];
      *((void *)&v11 + 1) = 3221225472;
      id v12 = __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke;
      id v13 = &unk_1E62F2978;
      id v14 = v2;
      [v2 beginUpdatesFromDatum:v6 withHandler:&v11];
    }
  }
  else
  {
    objc_super v8 = *(void **)(a1 + 32);
    -[HDDataCollector _queue_transitionToFailure](v8);
  }
}

- (void)updateHistoricalData
{
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HDAggregateDataCollector_updateHistoricalData__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__HDAggregateDataCollector_updateHistoricalData__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40) == 3)
  {
    _HKInitializeLogging();
    int v3 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected failure state, beginning streaming", (uint8_t *)&v7, 0xCu);
    }
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      if (v6[5] != 2)
      {
        -[HDDataCollector _queue_transitionToStreaming]((uint64_t)v6);
        objc_msgSend(v6, "_queue_beginStreaming");
      }
    }
  }
  else
  {
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:]((unsigned char *)v2, 0, 0);
  }
}

- (id)_queue_lastReceivedSecondaryContext
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  lastReceivedSecondaryContext = self->_lastReceivedSecondaryContext;
  if (!lastReceivedSecondaryContext)
  {
    -[HDDataCollector _retrieveContextForKey:]((uint64_t)self, @"secondaryContext");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4 && [v4 length])
    {
      id v6 = (void *)MEMORY[0x1E4F28DC0];
      int v7 = [(id)objc_opt_class() secondaryContextClasses];
      id v17 = 0;
      id v8 = [v6 unarchivedObjectOfClasses:v7 fromData:v5 error:&v17];
      id v9 = v17;

      if (!v8)
      {
        _HKInitializeLogging();
        id v10 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
        {
          id v13 = v10;
          id v14 = objc_opt_class();
          id v15 = v14;
          uint64_t v16 = [v5 length];
          *(_DWORD *)buf = 138543874;
          __int16 v19 = v14;
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          __int16 v22 = 2114;
          id v23 = v9;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error decoding context (%lu bytes): %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v8 = 0;
    }

    long long v11 = self->_lastReceivedSecondaryContext;
    self->_lastReceivedSecondaryContext = v8;

    lastReceivedSecondaryContext = self->_lastReceivedSecondaryContext;
  }

  return lastReceivedSecondaryContext;
}

- (HDAggregateDataCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDAggregateDataCollector;
  id v5 = [(HDDataCollector *)&v18 initWithProfile:v4];
  id v6 = v5;
  if (v5)
  {
    v5->_maxDatumDuration = 360.0;
    v5->_didReceiveSensorDatum = 0;
    objc_initWeak(&location, v5);
    id v7 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    queue = v6->super._queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__HDAggregateDataCollector_initWithProfile___block_invoke;
    v15[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v16, &location);
    uint64_t v9 = [v7 initWithMode:1 clock:0 queue:queue delay:v15 block:1.84467441e19];
    historicalFetchOperation = v6->_historicalFetchOperation;
    v6->_historicalFetchOperation = (_HKDelayedOperation *)v9;

    long long v11 = v6->super._queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HDAggregateDataCollector_initWithProfile___block_invoke_2;
    block[3] = &unk_1E62F3208;
    id v14 = v6;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setMaxDatumDuration:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__HDAggregateDataCollector_setMaxDatumDuration___block_invoke;
  v3[3] = &unk_1E62F3198;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(HDDataCollector *)self _performAsync:v3];
}

double __48__HDAggregateDataCollector_setMaxDatumDuration___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

void __66__HDAggregateDataCollector__queue_executeHistoricalFetchOperation__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      *(_DWORD *)uint64_t v9 = 138543618;
      *(void *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v5;
      id v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred during historical fetch for update handler: %{public}@", v9, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "stopPerformingUpdatesWithErrorEncountered:", 0, *(_OWORD *)v9, *(void *)&v9[16], v10);
    -[HDDataCollector _queue_transitionToFailure](*(void **)(a1 + 32));
  }
}

- (double)maxDatumDuration
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__HDAggregateDataCollector_maxDatumDuration__block_invoke;
  v4[3] = &unk_1E62F3230;
  v4[4] = self;
  v4[5] = &v5;
  [(HDDataCollector *)self _performSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__HDAggregateDataCollector_maxDatumDuration__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_maxDatumDuration");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __47__HDAggregateDataCollector__queue_beginUpdates__block_invoke_418(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(v1 + 104) = 1;
    double v2 = *(void **)(a1 + 32);
    uint64_t v3 = (void *)v2[11];
    objc_msgSend(v2, "_queue_aggregationInterval");
    objc_msgSend(v3, "executeWithDelay:");
  }
  else
  {
    *(unsigned char *)(v1 + 104) = 0;
    id v4 = *(void **)(a1 + 32);
    -[HDDataCollector _queue_transitionToFailure](v4);
  }
}

- (void)_queue_updateLastReceivedSecondaryContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_lastReceivedSecondaryContext, a3);
  id v5 = a3;
  id v12 = 0;
  id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v6 = v12;
  if (!v11)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      id v10 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error encoding dictionary context (%@) %{public}@", buf, 0x20u);
    }
  }

  -[HDDataCollector _persistContext:forKey:]((uint64_t)self, v11, @"secondaryContext");
}

- (void)_queue_handleUpdatingHistoricalDataForcedUpdate:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__HDAggregateDataCollector__queue_handleUpdatingHistoricalDataForcedUpdate_completion___block_invoke;
    v7[3] = &unk_1E6306B38;
    v7[4] = a1;
    char v9 = a2;
    id v8 = v5;
    -[HDAggregateDataCollector _queue_fetchHistoricalDataForcedUpdate:completion:](a1, a2, v7);
  }
}

void __87__HDAggregateDataCollector__queue_handleUpdatingHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 104)) {
      *(void *)(v7 + 64) = 0;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "hk_isHealthKitError") || objc_msgSend(v6, "code") != 450)
  {
LABEL_12:
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t, void *))(v16 + 16))(v16, a2, v6);
    }
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v8 = (os_log_t *)MEMORY[0x1E4F29F10];
  char v9 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    int v17 = 138543362;
    id v18 = (id)objc_opt_class();
    id v11 = v18;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected CoreMotion database reset, resetting state", (uint8_t *)&v17, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateLastReceivedSensorDatum:", 0);
    _HKInitializeLogging();
    os_log_t v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = objc_opt_class();
      int v17 = 138543362;
      id v18 = v14;
      id v15 = v14;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Set last received sensor datum to nil, persisting nil context", (uint8_t *)&v17, 0xCu);
    }
  }
  -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
LABEL_14:
}

- (void)_queue_fetchHistoricalDataForcedUpdate:(void *)a3 completion:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1[72])
  {
    if (a1[120] && (a2 & 1) == 0)
    {
      _HKInitializeLogging();
      char v9 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        *(_DWORD *)buf = 138543362;
        id v26 = (id)objc_opt_class();
        id v11 = v26;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Requested update while fetching historical data. Marking _needsHistoricalFetch", buf, 0xCu);
      }
      a1[121] = 1;
      goto LABEL_9;
    }
    a1[120] = 1;
    os_log_t v12 = objc_msgSend(a1, "_queue_lastReceivedSensorDatum");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    id v14 = (void *)*MEMORY[0x1E4F29F10];
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v15)
      {
        uint64_t v16 = v14;
        int v17 = objc_opt_class();
        id v18 = v17;
        uint64_t v19 = _IdentifierStringsFromSensorDatum(v12);
        *(_DWORD *)buf = 138543874;
        id v26 = v17;
        __int16 v27 = 2112;
        v28 = v12;
        __int16 v29 = 2114;
        v30 = v19;
        __int16 v20 = "%{public}@: Forced fetch of historical data since last record: %@ %{public}@";
LABEL_16:
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, v20, buf, 0x20u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = v14;
      uint64_t v21 = objc_opt_class();
      id v18 = v21;
      uint64_t v19 = _IdentifierStringsFromSensorDatum(v12);
      *(_DWORD *)buf = 138543874;
      id v26 = v21;
      __int16 v27 = 2112;
      v28 = v12;
      __int16 v29 = 2114;
      v30 = v19;
      __int16 v20 = "%{public}@: Fetching historical data since last record: %@ %{public}@";
      goto LABEL_16;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke;
    v22[3] = &unk_1E6302288;
    v22[4] = a1;
    CFAbsoluteTime v24 = Current;
    id v23 = v5;
    [a1 fetchHistoricalSensorDataSinceDatum:v12 databaseIdentifier:0 completion:v22];

    goto LABEL_18;
  }
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v8 = v26;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Data collector disabled, not beginning streaming.", buf, 0xCu);
  }
LABEL_9:
  if (v5) {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
  }
LABEL_18:
}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = v7;
    uint64_t v10 = [v5 count];
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    __int16 v24 = 2048;
    CFAbsoluteTime v25 = v11;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Historical fetch returned %ld datums in %0.2lfs", buf, 0x20u);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(NSObject **)(v12 + 24);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_419;
  v16[3] = &unk_1E62F2F48;
  v16[4] = v12;
  id v17 = v5;
  id v18 = v6;
  id v19 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v5;
  dispatch_async(v13, v16);
}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_419(id *a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(a1[4], "_queue_lastReceivedSensorDatum");
  id v3 = a1[6];
  id v4 = a1[5];
  id v5 = v3;
  id v6 = v2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 sourceId];

    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  if (v6) {
    BOOL v9 = !v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v12 = 0;
    if (!v5)
    {
LABEL_13:
      BOOL v11 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v12 = [v4 count] == 0;
    if (!v5) {
      goto LABEL_13;
    }
  }
  uint64_t v10 = [v5 domain];
  if ([v10 isEqualToString:*MEMORY[0x1E4F22140]]) {
    BOOL v11 = [v5 code] == 107;
  }
  else {
    BOOL v11 = 0;
  }

LABEL_16:
  if (v12 || v11)
  {
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v55 = v13;
      v56 = objc_opt_class();
      id v58 = a1[5];
      id v57 = a1[6];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2112;
      v81 = v6;
      *(_WORD *)v82 = 2112;
      *(void *)&v82[2] = v58;
      id v59 = v56;
      _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Detected a database reset with the following results: %{public}@, %@, %@", buf, 0x2Au);
    }
    *((unsigned char *)a1[4] + 120) = 0;
    id v14 = (void (**)(id, void, void *))a1[7];
    if (v14)
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 450, @"CoreMotion indicated a database reset.");
      v14[2](v14, 0, v15);
    }
    goto LABEL_46;
  }
  id v16 = a1[5];
  if (v16)
  {
    id v17 = (id *)a1[4];
    v69[1] = 3221225472;
    v69[0] = MEMORY[0x1E4F143A8];
    v70 = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_424;
    v71 = &unk_1E62F70B0;
    v72 = v17;
    id v73 = a1[7];
    id v18 = v16;
    id v19 = v6;
    __int16 v20 = v69;
    if (v17)
    {
      id v21 = v18;
      id WeakRetained = objc_loadWeakRetained(v17 + 2);
      uint64_t v23 = [WeakRetained database];
      __int16 v24 = [v23 mostRecentObliterationDate];

      if (v24
        && ([v21 firstObject],
            CFAbsoluteTime v25 = objc_claimAutoreleasedReturnValue(),
            [v25 startDate],
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            char v27 = objc_msgSend(v26, "hk_isBeforeDate:", v24),
            v26,
            v25,
            (v27 & 1) != 0))
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __54__HDAggregateDataCollector__queue_filteredSensorData___block_invoke;
        v81 = &unk_1E6308510;
        *(void *)v82 = v24;
        *(void *)&v82[8] = v17;
        objc_msgSend(v21, "hk_filter:", buf);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v28 = v21;
      }
      id v18 = v28;

      if ([v18 count])
      {
        id v29 = v19;
        v66 = v29;
        if ([v17 requiresSampleAggregation])
        {
          id v79 = v29;
          v30 = objc_msgSend(v17, "_queue_processSensorDataBatched:firstDatum:lastSensorDatum:", v18, v29, &v79);
          id v31 = v79;
        }
        else
        {
          v30 = [v17 hkObjectsFromSensorData:v18 baseSensorDatum:v29 startDate:0 endDate:0];
          id v31 = [v18 lastObject];
        }
        v38 = v31;
        id location = v17 + 2;
        v68 = v20;
        _HKInitializeLogging();
        v39 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          id v65 = v19;
          v40 = v39;
          v41 = objc_opt_class();
          id v64 = v41;
          uint64_t v42 = [v18 count];
          uint64_t v43 = [v30 count];
          v44 = _IdentifierStringsFromSensorDatum(v38);
          *(_DWORD *)buf = 138544386;
          *(void *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v42;
          *(_WORD *)&buf[22] = 2048;
          v81 = (void *)v43;
          *(_WORD *)v82 = 2112;
          *(void *)&v82[2] = v38;
          *(_WORD *)&v82[10] = 2114;
          *(void *)&v82[12] = v44;
          _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: (Processed: %ld, Persisting: %ld, Context: %@ %{public}@)", buf, 0x34u);

          id v19 = v65;
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke;
        v81 = &unk_1E62F9F48;
        *(void *)v82 = v17;
        id v45 = v38;
        *(void *)&v82[8] = v45;
        id v46 = v30;
        *(void *)&v82[16] = v46;
        v47 = _Block_copy(buf);
        id v48 = objc_loadWeakRetained(location);
        v49 = [v48 database];
        id v78 = 0;
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_2;
        v76[3] = &unk_1E62FA3D0;
        id v77 = v47;
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_3;
        v74[3] = &unk_1E62F8610;
        id v50 = v77;
        id v75 = v50;
        BOOL v51 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v49 error:&v78 block:v76 inaccessibilityHandler:v74];
        id v52 = v78;

        __int16 v20 = v68;
        ((void (*)(void *, BOOL, id))v70)(v68, v51, v52);
      }
      else
      {
        _HKInitializeLogging();
        v34 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          v36 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v36;
          id v37 = v36;
          _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Received empty array of sensor data. Exiting early", buf, 0xCu);
        }
        ((void (*)(void *, uint64_t, void))v70)(v20, 1, 0);
      }
    }

    goto LABEL_46;
  }
  v32 = [a1[6] domain];
  if (![v32 isEqualToString:*MEMORY[0x1E4F22140]])
  {

LABEL_42:
    _HKInitializeLogging();
    v53 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v60 = v53;
      v61 = objc_opt_class();
      id v62 = a1[6];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v62;
      id v63 = v61;
      _os_log_error_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching historical sensor data: %{public}@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  uint64_t v33 = [a1[6] code];

  if (v33 != 109) {
    goto LABEL_42;
  }
LABEL_44:
  *((unsigned char *)a1[4] + 120) = 0;
  v54 = (void (**)(id, void, id))a1[7];
  if (v54) {
    v54[2](v54, 0, a1[6]);
  }
LABEL_46:
}

void __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_424(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  double v2 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished fetching historical data.", buf, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_425;
  v7[3] = &unk_1E62F4928;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, v7);
}

uint64_t __78__HDAggregateDataCollector__queue_fetchHistoricalDataForcedUpdate_completion___block_invoke_425(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  double v2 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id v4 = objc_opt_class();
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 121);
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    id v6 = v4;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Needs historical fetch: %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 121))
  {
    *(unsigned char *)(v7 + 121) = 0;
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return -[HDAggregateDataCollector _queue_fetchHistoricalDataForcedUpdate:completion:](result, 0, *(void *)(a1 + 40));
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
    }
  }
  return result;
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateLastReceivedSensorDatum:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) willPersistHKObjects:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  int v5 = [WeakRetained dataCollectionManager];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  if (v7)
  {
    id v8 = (void *)*((void *)v7 + 7);
    if (!v8)
    {
      id v9 = objc_loadWeakRetained((id *)v7 + 2);
      id v10 = [v9 deviceManager];
      id v20 = 0;
      uint64_t v11 = [v10 currentDeviceEntityWithError:&v20];
      id v12 = v20;

      if (!v11)
      {
        _HKInitializeLogging();
        uint64_t v13 = (void *)*MEMORY[0x1E4F29F10];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
        {
          id v17 = v13;
          id v18 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          __int16 v22 = v18;
          __int16 v23 = 2114;
          id v24 = v12;
          id v19 = v18;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching local device: %{public}@", buf, 0x16u);
        }
      }

      id v14 = (void *)*((void *)v7 + 7);
      *((void *)v7 + 7) = v11;

      id v8 = (void *)*((void *)v7 + 7);
    }
    id v7 = v8;
  }
  uint64_t v15 = [v5 sensorDataArrayReceived:v6 deviceEntity:v7 error:a2];

  return v15;
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__HDAggregateDataCollector__queue_processSensorData_lastSensorDatum_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__HDAggregateDataCollector__queue_filteredSensorData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 startDate];
  int v5 = objc_msgSend(v4, "hk_isBeforeDate:", *(void *)(a1 + 32));

  if (v5)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5 ^ 1u;
}

- (void)updateHistoricalDataWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HDAggregateDataCollector_updateHistoricalDataWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HDAggregateDataCollector_updateHistoricalDataWithCompletion___block_invoke(uint64_t a1)
{
  double v2 = *(unsigned char **)(a1 + 32);
  if (v2) {
    -[HDAggregateDataCollector _queue_handleUpdatingHistoricalDataForcedUpdate:completion:](v2, 0, *(void **)(a1 + 40));
  }
}

- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HDAggregateDataCollector_updateHistoricalDataForcedUpdate_completion___block_invoke;
  block[3] = &unk_1E62F61F8;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __72__HDAggregateDataCollector_updateHistoricalDataForcedUpdate_completion___block_invoke(uint64_t a1)
{
}

- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedSecondaryContext, 0);
  objc_storeStrong((id *)&self->_lastReceivedSensorDatum, 0);

  objc_storeStrong((id *)&self->_historicalFetchOperation, 0);
}

@end