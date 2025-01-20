@interface HDDataCollector
+ (BOOL)_primaryContextExistsForDomain:(id)a3 profile:(id)a4;
+ (Class)sensorDatumClass;
+ (double)defaultCollectionInterval;
+ (id)_lastReceivedSensorDatumForProfile:(id)a3;
+ (id)_retrieveContextForKey:(void *)a3 domain:(void *)a4 profile:;
+ (id)_sensorDatumFromContext:(id)a3;
+ (id)domain;
+ (id)observedType;
+ (id)secondaryContextClasses;
- (BOOL)disabled;
- (HDDataCollector)initWithProfile:(id)a3;
- (HDSourceEntity)sourceEntity;
- (double)collectionInterval;
- (id)_retrieveContextForKey:(uint64_t)a1;
- (id)dataCollectorDiagnosticDescription;
- (void)_performAsync:(id)a3;
- (void)_performSync:(id)a3;
- (void)_persistContext:(void *)a3 forKey:;
- (void)_queue_transitionToFailure;
- (void)_queue_transitionToStreaming;
- (void)_queue_updateCollectionInterval:(uint64_t)a1;
- (void)collectionStartedForType:(id)a3 collectionInterval:(double)a4;
- (void)collectionStoppedForType:(id)a3;
- (void)setCollectionInterval:(double)a3;
- (void)setDisabled:(BOOL)a3;
- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3;
- (void)updateCollectionInterval:(double)a3 forType:(id)a4;
- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4;
- (void)updateHistoricalDataWithCompletion:(id)a3;
@end

@implementation HDDataCollector

- (void)_persistContext:(void *)a3 forKey:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [(id)objc_opt_class() domain];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v15 = 0;
    BOOL v9 = +[HDKeyValueEntity setData:v6 forKey:v5 domain:v7 category:0 profile:WeakRetained error:&v15];

    id v10 = v15;
    if (!v9)
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v13;
        __int16 v18 = 2114;
        id v19 = v10;
        id v14 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting context: %{public}@", buf, 0x16u);
      }
    }
  }
}

+ (double)defaultCollectionInterval
{
  return 300.0;
}

- (void)updateCollectionInterval:(double)a3 forType:(id)a4
{
  if ([a4 isEqual:self->_observedType])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__HDDataCollector_updateCollectionInterval_forType___block_invoke;
    v7[3] = &unk_1E62F3198;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(queue, v7);
  }
}

- (void)collectionStartedForType:(id)a3 collectionInterval:(double)a4
{
  if ([(HKObjectType *)self->_observedType isEqual:a3])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__HDDataCollector_collectionStartedForType_collectionInterval___block_invoke;
    v7[3] = &unk_1E62F3198;
    v7[4] = self;
    *(double *)&v7[5] = a4;
    dispatch_async(queue, v7);
  }
}

void __52__HDDataCollector_updateCollectionInterval_forType___block_invoke(uint64_t a1)
{
}

- (void)_queue_updateCollectionInterval:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(double *)(a1 + 32) != a2)
    {
      _HKInitializeLogging();
      v4 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v4;
        int v7 = 138543618;
        id v8 = (id)objc_opt_class();
        __int16 v9 = 2048;
        double v10 = a2;
        id v6 = v8;
        _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating collection period to %lf", (uint8_t *)&v7, 0x16u);
      }
    }
    *(double *)(a1 + 32) = a2;
  }
}

void __63__HDDataCollector_collectionStartedForType_collectionInterval___block_invoke(uint64_t a1)
{
  -[HDDataCollector _queue_updateCollectionInterval:](*(void *)(a1 + 32), *(double *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  if (v2 && v2[5] != 2)
  {
    -[HDDataCollector _queue_transitionToStreaming]((uint64_t)v2);
    objc_msgSend(v2, "_queue_beginStreaming");
  }
}

- (void)_queue_transitionToStreaming
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
    {
      v3 = v2;
      v4 = objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138543618;
      id v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      id v6 = v4;
      _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Transitioning to Streaming. Previous state %ld", (uint8_t *)&v7, 0x16u);
    }
    *(void *)(a1 + 40) = 2;
  }
}

- (void)collectionStoppedForType:(id)a3
{
  if ([(HKObjectType *)self->_observedType isEqual:a3])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HDDataCollector_collectionStoppedForType___block_invoke;
    block[3] = &unk_1E62F3208;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __44__HDDataCollector_collectionStoppedForType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E4F29F10];
  v3 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEBUG))
  {
    id v6 = v3;
    *(_DWORD *)v12 = 138543362;
    *(void *)&v12[4] = objc_opt_class();
    id v7 = *(id *)&v12[4];
    _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Stopping data collection", v12, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "stopPerformingUpdatesWithErrorEncountered:", 0, *(_OWORD *)v12);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    _HKInitializeLogging();
    os_log_t v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v5;
      __int16 v9 = objc_opt_class();
      uint64_t v10 = *(void *)(v4 + 40);
      *(_DWORD *)v12 = 138543618;
      *(void *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2048;
      *(void *)&v12[14] = v10;
      id v11 = v9;
      _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Transitioning to Idle. Previous state %ld", v12, 0x16u);
    }
    *(void *)(v4 + 40) = 1;
  }
}

- (HDDataCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDataCollector;
  os_log_t v5 = [(HDDataCollector *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeWeak((id *)&v6->_primaryProfile, v4);
    }
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [(id)objc_opt_class() observedType];
    observedType = v6->_observedType;
    v6->_observedType = (HKObjectType *)v9;

    v6->_state = 1;
    [(id)objc_opt_class() defaultCollectionInterval];
    v6->_collectionInterval = v11;
  }

  return v6;
}

- (void)_performAsync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HDDataCollector__performAsync___block_invoke;
  block[3] = &unk_1E62F2F20;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __33__HDDataCollector__performAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDisabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__HDDataCollector_setDisabled___block_invoke;
  v3[3] = &unk_1E62F8638;
  BOOL v4 = a3;
  v3[4] = self;
  [(HDDataCollector *)self _performAsync:v3];
}

uint64_t __31__HDDataCollector_setDisabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  int v3 = *(unsigned __int8 *)(v2 + 72);
  *(unsigned char *)(v2 + 72) = v1;
  if (v1 != v3)
  {
    uint64_t v4 = *(void *)(result + 32);
    if (*(unsigned char *)(v4 + 72))
    {
      os_log_t v5 = *(void **)(result + 32);
      return [v5 stopPerformingUpdatesWithErrorEncountered:0];
    }
    else if ((unint64_t)(*(void *)(v4 + 40) - 1) >= 2)
    {
      -[HDDataCollector _queue_transitionToStreaming](*(void *)(result + 32));
      return objc_msgSend((id)v4, "_queue_beginStreaming");
    }
  }
  return result;
}

- (id)_retrieveContextForKey:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() domain];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  id v6 = +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)HDDataCollector, v3, v4, WeakRetained);

  return v6;
}

+ (id)_retrieveContextForKey:(void *)a3 domain:(void *)a4 profile:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  id v16 = 0;
  uint64_t v9 = +[HDKeyValueEntity dataForKey:v8 domain:v7 category:0 profile:v6 entity:0 error:&v16];

  id v10 = v16;
  if (v10)
  {
    _HKInitializeLogging();
    double v11 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = v11;
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v14;
      __int16 v19 = 2114;
      id v20 = v10;
      id v15 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving context: %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

+ (id)_sensorDatumFromContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_t v5 = v4;
  if (v4 && [v4 length])
  {
    id v13 = 0;
    id v6 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(a1, "sensorDatumClass"), v5, &v13);
    id v7 = v13;
    if (!v6)
    {
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x1E4F29F10];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
      {
        double v11 = v8;
        uint64_t v12 = [v5 length];
        *(_DWORD *)buf = 138543874;
        id v15 = a1;
        __int16 v16 = 2048;
        uint64_t v17 = v12;
        __int16 v18 = 2114;
        id v19 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error decoding context (%lu bytes) %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = a1;
      __int16 v16 = 2114;
      uint64_t v17 = (uint64_t)v5;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Asked to decode empty context (%{public}@), returning nil", buf, 0x16u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)secondaryContextClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (void)_performSync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HDDataCollector__performSync___block_invoke;
  block[3] = &unk_1E62F2F20;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __32__HDDataCollector__performSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_primaryContextExistsForDomain:(id)a3 profile:(id)a4
{
  id v4 = +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)a1, @"context", a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)_lastReceivedSensorDatumForProfile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 domain];
  id v6 = +[HDDataCollector _retrieveContextForKey:domain:profile:]((uint64_t)a1, @"context", v5, v4);

  uint64_t v7 = [a1 _sensorDatumFromContext:v6];

  return v7;
}

- (double)collectionInterval
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HDDataCollector_collectionInterval__block_invoke;
  v4[3] = &unk_1E62F3230;
  v4[4] = self;
  v4[5] = &v5;
  [(HDDataCollector *)self _performSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __37__HDDataCollector_collectionInterval__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 32);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCollectionInterval:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__HDDataCollector_setCollectionInterval___block_invoke;
  v3[3] = &unk_1E62F3198;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(HDDataCollector *)self _performAsync:v3];
}

double __41__HDDataCollector_setCollectionInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (BOOL)disabled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__HDDataCollector_disabled__block_invoke;
  v4[3] = &unk_1E62F3230;
  v4[4] = self;
  v4[5] = &v5;
  [(HDDataCollector *)self _performSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__HDDataCollector_disabled__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 72) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (void)_queue_transitionToFailure
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    char v2 = (os_log_t *)MEMORY[0x1E4F29F10];
    id v3 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = a1[5];
      int v19 = 138543618;
      uint64_t v20 = v5;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      id v7 = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Transitioning to Failure. Previous state %ld", (uint8_t *)&v19, 0x16u);
    }
    if (a1[5] != 1)
    {
      [a1 stopPerformingUpdatesWithErrorEncountered:1];
      a1[5] = 3;
      uint64_t v8 = a1[8];
      _HKInitializeLogging();
      os_log_t v9 = *v2;
      BOOL v10 = os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT);
      if (v8 > 2)
      {
        if (v10)
        {
          id v15 = v9;
          __int16 v16 = objc_opt_class();
          uint64_t v17 = a1[8];
          int v19 = 138543618;
          uint64_t v20 = v16;
          __int16 v21 = 2048;
          uint64_t v22 = v17;
          id v18 = v16;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying count limit reached (%ld), not retrying", (uint8_t *)&v19, 0x16u);
        }
        a1[8] = 0;
      }
      else
      {
        if (v10)
        {
          double v11 = v9;
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = a1[8];
          int v19 = 138543618;
          uint64_t v20 = v12;
          __int16 v21 = 2048;
          uint64_t v22 = v13;
          id v14 = v12;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying from failure (%ld)", (uint8_t *)&v19, 0x16u);
        }
        ++a1[8];
        if (a1[5] != 2)
        {
          -[HDDataCollector _queue_transitionToStreaming]((uint64_t)a1);
          objc_msgSend(a1, "_queue_beginStreaming");
        }
      }
    }
  }
}

- (void)updateHistoricalDataWithCompletion:(id)a3
{
}

- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4
{
}

- (id)dataCollectorDiagnosticDescription
{
  id v3 = [(id)objc_opt_class() observedType];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSNumber numberWithDouble:self->_collectionInterval];
  unint64_t v7 = self->_state - 1;
  if (v7 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown <%ld>", self->_state);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E6308578[v7];
  }
  os_log_t v9 = [v4 stringWithFormat:@"%@ (%@): %@, %@", v5, v3, v6, v8];

  return v9;
}

+ (id)observedType
{
  return 0;
}

+ (id)domain
{
  return 0;
}

+ (Class)sensorDatumClass
{
  return 0;
}

- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (HDSourceEntity)sourceEntity
{
  return (HDSourceEntity *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_deviceEntity, 0);
  objc_storeStrong((id *)&self->_observedType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_destroyWeak((id *)&self->_primaryProfile);
}

@end