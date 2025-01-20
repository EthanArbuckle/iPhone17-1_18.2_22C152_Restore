@interface HDWorkoutBuilderSampleQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldObserveDatabaseProtectedDataAvailability;
- (BOOL)_shouldObserveOnPause;
- (HDWorkoutBuilderSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (_BYTE)_queue_scheduleHistoricalQuery;
- (id)_workoutBuilderSampleQueryClientWithErrorHandler:(id)a1;
- (void)_queue_performHistoricalQuery;
- (void)_queue_start;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)didCreateTaskServer:(id)a3;
- (void)workoutBuilderServer:(id)a3 addedQuantities:(id)a4;
- (void)workoutBuilderServer:(id)a3 addedSamples:(id)a4;
@end

@implementation HDWorkoutBuilderSampleQueryServer

- (HDWorkoutBuilderSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDWorkoutBuilderSampleQueryServer;
  v12 = [(HDQueryServer *)&v21 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    v12->_hasFinishedHistoricalFetch = [v10 needsHistoricalData] ^ 1;
    uint64_t v13 = [v10 workoutBuilderIdentifier];
    workoutBuilderIdentifier = v12->_workoutBuilderIdentifier;
    v12->_workoutBuilderIdentifier = (NSUUID *)v13;

    v12->_deliverQuantities = [v10 deliverQuantities];
    v15 = [v11 profile];
    v16 = [v15 daemon];
    v17 = [v16 taskServerRegistry];
    v18 = v12->_workoutBuilderIdentifier;
    v19 = [(HDQueryServer *)v12 queryQueue];
    [v17 addObserver:v12 forTaskServerUUID:v18 queue:v19];
  }
  return v12;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, @"Invalid configuration class %@.", v13);

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  v7 = [v6 workoutBuilderIdentifier];

  if (!v7)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = @"Missing workout builder identifier.";
LABEL_9:
    objc_msgSend(v14, "hk_assignError:code:description:", a5, 3, v15);
    goto LABEL_10;
  }
  if ([v6 deliverQuantities])
  {
    v8 = [v6 objectType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = @"Attempt to request quantities for a non-quantity type.";
      goto LABEL_9;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)_workoutBuilderSampleQueryClientWithErrorHandler:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v2 clientProxy];
    id v2 = [v4 remoteObjectProxyWithErrorHandler:v3];
  }

  return v2;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)_shouldObserveOnPause
{
  return 0;
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  v4.receiver = self;
  v4.super_class = (Class)HDWorkoutBuilderSampleQueryServer;
  [(HDQueryServer *)&v4 _queue_start];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutBuilderServer);

  if (WeakRetained) {
    -[HDWorkoutBuilderSampleQueryServer _queue_performHistoricalQuery]((uint64_t)self);
  }
}

- (void)_queue_performHistoricalQuery
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 216));

    if (WeakRetained)
    {
      if (*(unsigned char *)(a1 + 200)) {
        return;
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke;
      v34[3] = &unk_1E62F3170;
      v34[4] = a1;
      id v3 = -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:]((id)a1, v34);
      if (*(unsigned char *)(a1 + 203))
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v36 = __Block_byref_object_copy__32;
        v37 = __Block_byref_object_dispose__32;
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v4 = objc_loadWeakRetained((id *)(a1 + 216));
        v5 = [(id)a1 sampleType];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_294;
        v29[3] = &unk_1E62F7888;
        v32 = buf;
        id v33 = 0;
        id v6 = v3;
        id v30 = v6;
        uint64_t v31 = a1;
        char v7 = [v4 enumerateQuantitiesOfType:v5 error:&v33 handler:v29];
        id v8 = v33;

        if ([*(id *)(*(void *)&buf[8] + 40) count] || !*(unsigned char *)(a1 + 201))
        {
          uint64_t v9 = *(void *)(*(void *)&buf[8] + 40);
          int v10 = *(unsigned __int8 *)(a1 + 200);
          id v11 = [(id)a1 queryUUID];
          objc_msgSend(v6, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v9, v10 != 0, v11);

          *(unsigned char *)(a1 + 201) = 1;
        }

        _Block_object_dispose(buf, 8);
        if (v7)
        {
LABEL_13:
          *(unsigned char *)(a1 + 200) = 1;
LABEL_18:

          return;
        }
      }
      else
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v36 = __Block_byref_object_copy__32;
        v37 = __Block_byref_object_dispose__32;
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v13 = objc_loadWeakRetained((id *)(a1 + 216));
        v14 = (void *)MEMORY[0x1E4F1CAD0];
        v15 = [(id)a1 sampleType];
        v16 = [v14 setWithObject:v15];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_2;
        v24[3] = &unk_1E62F78B0;
        v27 = buf;
        id v28 = 0;
        id v17 = v3;
        id v25 = v17;
        uint64_t v26 = a1;
        int v18 = [v13 enumerateSamplesOfTypes:v16 error:&v28 handler:v24];
        id v19 = v28;

        if ([*(id *)(*(void *)&buf[8] + 40) count] || !*(unsigned char *)(a1 + 201))
        {
          uint64_t v20 = *(void *)(*(void *)&buf[8] + 40);
          int v21 = *(unsigned __int8 *)(a1 + 200);
          v22 = [(id)a1 queryUUID];
          objc_msgSend(v17, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v20, v21 != 0, v22);

          *(unsigned char *)(a1 + 201) = 1;
        }

        _Block_object_dispose(buf, 8);
        id v8 = 0;
        if (v18) {
          goto LABEL_13;
        }
      }
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to complete historical fetch: %{public}@", buf, 0x16u);
      }
      goto LABEL_18;
    }
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = a1;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to perform historical query: no workout builder server has been found yet.", buf, 0xCu);
    }
  }
}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send historical samples to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  if ((unint64_t)[v5 count] >= 0x190)
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) queryUUID];
    objc_msgSend(v9, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v8, 0, v10);

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v15 = (id)[objc_alloc(MEMORY[0x1E4F2B738]) initWithQuantity:v7 dateInterval:v6];

  [v14 addObject:v15];
}

void __66__HDWorkoutBuilderSampleQueryServer__queue_performHistoricalQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= 0x190)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) queryUUID];
    objc_msgSend(v4, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v3, 0, v5);

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
}

- (_BYTE)_queue_scheduleHistoricalQuery
{
  if (result)
  {
    if (!result[200])
    {
      v1[0] = MEMORY[0x1E4F143A8];
      v1[1] = 3221225472;
      v1[2] = __67__HDWorkoutBuilderSampleQueryServer__queue_scheduleHistoricalQuery__block_invoke;
      v1[3] = &unk_1E62F3208;
      v1[4] = result;
      return (unsigned char *)[result scheduleDatabaseAccessOnQueueWithBlock:v1];
    }
  }
  return result;
}

void __67__HDWorkoutBuilderSampleQueryServer__queue_scheduleHistoricalQuery__block_invoke(uint64_t a1)
{
}

- (void)didCreateTaskServer:(id)a3
{
  id obj = a3;
  id v4 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_storeWeak((id *)&self->_workoutBuilderServer, obj);
    [obj addSampleObserver:self];

    -[HDWorkoutBuilderSampleQueryServer _queue_scheduleHistoricalQuery](self);
  }
}

- (void)workoutBuilderServer:(id)a3 addedSamples:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (self->_deliverQuantities)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = [(HDQueryServer *)self sampleType];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke;
    v14[3] = &unk_1E62F78D8;
    id v15 = v8;
    id v9 = v8;
    uint64_t v7 = objc_msgSend(v6, "hk_filter:", v14);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke_2;
    v13[3] = &unk_1E62F3170;
    v13[4] = self;
    uint64_t v10 = -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:](self, v13);
    if ([v7 count] || !self->_hasNotifiedFinishedHistoricalFetch)
    {
      BOOL hasFinishedHistoricalFetch = self->_hasFinishedHistoricalFetch;
      uint64_t v12 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v10, "client_deliverSamples:hasFinishedHistoricalFetch:queryUUID:", v7, hasFinishedHistoricalFetch, v12);
    }
    if (self->_hasFinishedHistoricalFetch) {
      self->_hasNotifiedFinishedHistoricalFetch = 1;
    }
  }
}

uint64_t __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sampleType];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __71__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedSamples___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send added samples to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)workoutBuilderServer:(id)a3 addedQuantities:(id)a4
{
  if (self->_deliverQuantities)
  {
    id v5 = a4;
    int v6 = [(HDQueryServer *)self sampleType];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke;
    v13[3] = &unk_1E62F7900;
    id v14 = v6;
    id v7 = v6;
    __int16 v8 = objc_msgSend(v5, "hk_map:", v13);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke_2;
    v12[3] = &unk_1E62F3170;
    v12[4] = self;
    id v9 = -[HDWorkoutBuilderSampleQueryServer _workoutBuilderSampleQueryClientWithErrorHandler:](self, v12);
    if ([v8 count] || !self->_hasNotifiedFinishedHistoricalFetch)
    {
      BOOL hasFinishedHistoricalFetch = self->_hasFinishedHistoricalFetch;
      id v11 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v9, "client_deliverQuantities:hasFinishedHistoricalFetch:queryUUID:", v8, hasFinishedHistoricalFetch, v11);
    }
    if (self->_hasFinishedHistoricalFetch) {
      self->_hasNotifiedFinishedHistoricalFetch = 1;
    }
  }
}

id __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hdw_type");
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F2B738]);
    int v6 = objc_msgSend(v3, "hdw_quantity");
    id v7 = objc_msgSend(v3, "hdw_dateInterval");
    __int16 v8 = (void *)[v5 initWithQuantity:v6 dateInterval:v7];
  }
  else
  {
    __int16 v8 = 0;
  }

  return v8;
}

void __74__HDWorkoutBuilderSampleQueryServer_workoutBuilderServer_addedQuantities___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send added quantities to client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  uint64_t v5 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v5);

  -[HDWorkoutBuilderSampleQueryServer _queue_scheduleHistoricalQuery](self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutBuilderServer);

  objc_storeStrong((id *)&self->_workoutBuilderIdentifier, 0);
}

@end