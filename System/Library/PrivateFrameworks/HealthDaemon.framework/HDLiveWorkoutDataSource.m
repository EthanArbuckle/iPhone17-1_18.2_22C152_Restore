@interface HDLiveWorkoutDataSource
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDLiveWorkoutDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (HKDataFlowLink)workoutDataFlowLink;
- (id)_dataSourceConfigurationWithWorkoutConfiguration:(uint64_t)a1;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_lock_shouldAddSample:(uint64_t)a1;
- (unint64_t)workoutDataDestinationState;
- (void)_setDataSourceConfiguration:(uint64_t)a1;
- (void)_updateSampleTypesToCollect:(void *)a3 filtersBySampleType:;
- (void)addMetadata:(id)a3 dataSource:(id)a4;
- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5;
- (void)addOtherSamples:(id)a3 dataSource:(id)a4;
- (void)addQuantities:(id)a3 dataSource:(id)a4;
- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4;
- (void)connectionInvalidated;
- (void)remote_setDataSourceConfiguration:(id)a3;
- (void)remote_synchronizeWithCompletion:(id)a3;
- (void)workoutDataDestination:(id)a3 didAttachDataSourceToSessionIdentifer:(id)a4;
- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4;
- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)workoutDataDestination:(id)a3 didEndActivity:(id)a4;
- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
@end

@implementation HDLiveWorkoutDataSource

- (HDLiveWorkoutDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HDLiveWorkoutDataSource;
  v12 = [(HDStandardTaskServer *)&v26 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    v13 = [v11 profile];
    objc_storeWeak((id *)&v12->_profile, v13);

    v14 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v12->_lock;
    v12->_lock = v14;

    _HKInitializeLogging();
    id v16 = objc_alloc(MEMORY[0x1E4F2AEC0]);
    uint64_t v17 = [v16 initWithProcessor:v12 sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*MEMORY[0x1E4F29FB8]];
    workoutDataFlowLink = v12->_workoutDataFlowLink;
    v12->_workoutDataFlowLink = (HKDataFlowLink *)v17;

    v19 = [HDWorkoutBasicDataSource alloc];
    v20 = [v10 workoutConfiguration];
    uint64_t v21 = [(HDWorkoutBasicDataSource *)v19 initWithConfiguration:v20 client:v11];
    basicDataSource = v12->_basicDataSource;
    v12->_basicDataSource = (HDWorkoutBasicDataSource *)v21;

    v23 = v12->_workoutDataFlowLink;
    v24 = [(HDWorkoutBasicDataSource *)v12->_basicDataSource workoutDataFlowLink];
    [(HKDataFlowLink *)v23 addSource:v24];

    -[HDLiveWorkoutDataSource _setDataSourceConfiguration:]((uint64_t)v12, v10);
  }

  return v12;
}

- (void)_setDataSourceConfiguration:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 72);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __55__HDLiveWorkoutDataSource__setDataSourceConfiguration___block_invoke;
    id v10 = &unk_1E62F31C0;
    id v11 = v3;
    uint64_t v12 = a1;
    objc_msgSend(v5, "hk_withLock:", &v7);
    v6 = objc_msgSend(*(id *)(a1 + 56), "sampleTypesToCollect", v7, v8, v9, v10);
    [*(id *)(a1 + 64) setSampleTypesToCollect:v6];
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BA40];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_setDataSourceConfiguration:(id)a3
{
}

- (void)remote_synchronizeWithCompletion:(id)a3
{
}

void __55__HDLiveWorkoutDataSource__setDataSourceConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [*(id *)(a1 + 32) filtersBySampleType];
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 40) client];
        v9 = [*(id *)(a1 + 32) filtersBySampleType];
        id v10 = [v9 objectForKeyedSubscript:v7];
        id v11 = [v8 filterWithQueryFilter:v10 objectType:v7];
        [v2 setObject:v11 forKeyedSubscript:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F2B780]);
  v13 = [*(id *)(a1 + 32) workoutConfiguration];
  v14 = [*(id *)(a1 + 32) sampleTypesToCollect];
  v15 = [*(id *)(a1 + 32) eventTypesToCollect];
  uint64_t v16 = objc_msgSend(v12, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v13, v14, v2, v15, objc_msgSend(*(id *)(a1 + 32), "collectsDefaultTypes"));
  uint64_t v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 56);
  *(void *)(v17 + 56) = v16;
}

- (uint64_t)_lock_shouldAddSample:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 sampleType];
    uint64_t v6 = [*(id *)(a1 + 56) sampleTypesToCollect];
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 56) filtersBySampleType];
      v9 = [v8 objectForKeyedSubscript:v5];

      if (v9) {
        a1 = [v9 acceptsDataObject:v4];
      }
      else {
        a1 = 1;
      }
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B158] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B158] clientInterface];
}

- (void)connectionInvalidated
{
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(HDWorkoutBasicDataSource *)self->_basicDataSource setWorkoutConfiguration:a4];
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "%{public}@:Updated workout configuration", (uint8_t *)&v6, 0xCu);
  }
}

- (void)workoutDataDestination:(id)a3 didAttachDataSourceToSessionIdentifer:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  int v6 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    uint64_t v8 = [v5 UUIDString];
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering for session: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v10 = [WeakRetained workoutManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__HDLiveWorkoutDataSource_workoutDataDestination_didAttachDataSourceToSessionIdentifer___block_invoke;
  v12[3] = &unk_1E62F3120;
  id v13 = v5;
  v14 = self;
  id v11 = v5;
  [v10 sessionServerFromSessionIdentifier:v11 completion:v12];
}

void __88__HDLiveWorkoutDataSource_workoutDataDestination_didAttachDataSourceToSessionIdentifer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 64);
    [v3 setSessionServer:a2];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      int v6 = v4;
      int v7 = [v5 UUIDString];
      int v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to link data source to session %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (unint64_t)workoutDataDestinationState
{
  return 1;
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__83;
  v22[4] = __Block_byref_object_dispose__83;
  id v23 = 0;
  int v8 = [(HDStandardTaskServer *)self client];
  v9 = [v8 authorizationOracle];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke;
  v18[3] = &unk_1E62FED90;
  long long v20 = v22;
  id v21 = 0;
  id v10 = v6;
  id v19 = v10;
  char v11 = [v9 performReadAuthorizationTransactionWithError:&v21 handler:v18];
  id v12 = v21;

  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__83;
    objc_super v26 = __Block_byref_object_dispose__83;
    id v27 = 0;
    lock = self->_lock;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_391;
    v17[3] = &unk_1E62FEDE0;
    v17[5] = buf;
    v17[6] = v22;
    v17[4] = self;
    [(NSLock *)lock hk_withLock:v17];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      workoutDataFlowLink = self->_workoutDataFlowLink;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_3;
      v16[3] = &unk_1E62FEE08;
      v16[4] = self;
      v16[5] = buf;
      [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v16];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter objects for read authorization: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(v22, 8);
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2;
  v10[3] = &unk_1E62FED68;
  id v11 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "hk_filter:", v10);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return 1;
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_msgSend(a2, "hdw_sample");
  uint64_t v6 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *, void, uint64_t *))(v2 + 16))(v2, v3, 0, &v6);

  return v4;
}

void __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_391(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2_392;
  v6[3] = &unk_1E62FEDB8;
  v6[4] = a1[4];
  uint64_t v3 = objc_msgSend(v2, "hk_filter:", v6);
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2_392(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "hdw_sample");
  uint64_t v4 = -[HDLiveWorkoutDataSource _lock_shouldAddSample:](v2, v3);

  return v4;
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 addQuantities:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dataSource:*(void *)(a1 + 32)];
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HDStandardTaskServer *)self client];
  v9 = [v8 authorizationOracle];
  id v20 = 0;
  id v10 = [v9 filteredObjectsForReadAuthorization:v7 anchor:0 error:&v20];

  id v11 = v20;
  if (v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v22 = __Block_byref_object_copy__83;
    id v23 = __Block_byref_object_dispose__83;
    id v24 = 0;
    lock = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke;
    v16[3] = &unk_1E62FEE30;
    id v19 = buf;
    id v17 = v10;
    v18 = self;
    [(NSLock *)lock hk_withLock:v16];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      workoutDataFlowLink = self->_workoutDataFlowLink;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_3;
      v15[3] = &unk_1E62FEE08;
      v15[4] = self;
      v15[5] = buf;
      [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v15];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter objects for read authorization: %{public}@", buf, 0x16u);
    }
  }
}

void __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_2;
  v6[3] = &unk_1E62F78D8;
  v6[4] = a1[5];
  uint64_t v3 = objc_msgSend(v2, "hk_filter:", v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  return -[HDLiveWorkoutDataSource _lock_shouldAddSample:](*(void *)(a1 + 32), a2);
}

uint64_t __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 addOtherSamples:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dataSource:*(void *)(a1 + 32)];
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HDLiveWorkoutDataSource_addWorkoutEvents_dataSource___block_invoke;
  v8[3] = &unk_1E62F3148;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

uint64_t __55__HDLiveWorkoutDataSource_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addWorkoutEvents:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HDLiveWorkoutDataSource_addMetadata_dataSource___block_invoke;
  v8[3] = &unk_1E62F3148;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

uint64_t __50__HDLiveWorkoutDataSource_addMetadata_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__HDLiveWorkoutDataSource_addMetadataToWorkoutActivity_withSampleStartDate_dataSource___block_invoke;
  v12[3] = &unk_1E62FEE58;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v12];
}

void __87__HDLiveWorkoutDataSource_addMetadataToWorkoutActivity_withSampleStartDate_dataSource___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 addMetadataToWorkoutActivity:a1[4] withSampleStartDate:a1[5] dataSource:a1[6]];
  }
}

- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  uint64_t v2 = [(HKDataFlowLink *)self->_workoutDataFlowLink destinationProcessorsConformingToProtocol:&unk_1F185BC10];
  id v3 = [v2 firstObject];

  return (HDWorkoutDataAccumulator *)v3;
}

- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4
{
  id v9 = a4;
  if ([(HKWorkoutDataSourceConfiguration *)self->_dataSourceConfiguration collectsDefaultTypes])
  {
    id v5 = [v9 workoutConfiguration];
    id v6 = -[HDLiveWorkoutDataSource _dataSourceConfigurationWithWorkoutConfiguration:]((uint64_t)self, v5);

    id v7 = [v6 sampleTypesToCollect];
    id v8 = [v6 filtersBySampleType];
    -[HDLiveWorkoutDataSource _updateSampleTypesToCollect:filtersBySampleType:]((uint64_t)self, v7, v8);
  }
}

- (id)_dataSourceConfigurationWithWorkoutConfiguration:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained userCharacteristicsManager];
    id v13 = 0;
    id v7 = [v6 userCharacteristicForType:v4 error:&v13];
    id v8 = v13;

    if (v7)
    {
      uint64_t v9 = [v7 integerValue];
    }
    else
    {
      if (v8)
      {
        _HKInitializeLogging();
        id v10 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = v8;
          _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Error reading activity mode %{public}@", buf, 0xCu);
        }
      }
      uint64_t v9 = 1;
    }
    id v11 = [MEMORY[0x1E4F2B778] defaultConfigurationWithWorkoutConfiguration:v3 activityMoveMode:v9];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_updateSampleTypesToCollect:(void *)a3 filtersBySampleType:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [*(id *)(a1 + 56) sampleTypesToCollect];
    if ([v5 isEqualToSet:v7])
    {
      id v8 = [*(id *)(a1 + 56) filtersBySampleType];
      char v9 = [v6 isEqualToDictionary:v8];

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v10 = *(void **)(a1 + 72);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke;
    v16[3] = &unk_1E62F30F8;
    void v16[4] = a1;
    id v11 = v5;
    id v17 = v11;
    id v18 = v6;
    objc_msgSend(v10, "hk_withLock:", v16);
    [*(id *)(a1 + 64) setSampleTypesToCollect:v11];
    id v12 = [(id)a1 client];
    id v13 = [v12 connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke_2;
    v15[3] = &unk_1E62F3170;
    v15[4] = a1;
    id v14 = [v13 remoteObjectProxyWithErrorHandler:v15];

    objc_msgSend(v14, "clientRemote_didUpdateDataSourceConfiguration:", *(void *)(a1 + 56));
  }
LABEL_7:
}

- (void)workoutDataDestination:(id)a3 didEndActivity:(id)a4
{
  if ([(HKWorkoutDataSourceConfiguration *)self->_dataSourceConfiguration collectsDefaultTypes])
  {
    id v5 = [(HKWorkoutDataSourceConfiguration *)self->_dataSourceConfiguration workoutConfiguration];
    -[HDLiveWorkoutDataSource _dataSourceConfigurationWithWorkoutConfiguration:]((uint64_t)self, v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [v8 sampleTypesToCollect];
    id v7 = [v8 filtersBySampleType];
    -[HDLiveWorkoutDataSource _updateSampleTypesToCollect:filtersBySampleType:]((uint64_t)self, v6, v7);
  }
}

void __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F2B780]);
  id v9 = [*(id *)(a1[4] + 56) workoutConfiguration];
  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  id v5 = [*(id *)(a1[4] + 56) eventTypesToCollect];
  uint64_t v6 = objc_msgSend(v2, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v9, v4, v3, v5, objc_msgSend(*(id *)(a1[4] + 56), "collectsDefaultTypes"));
  uint64_t v7 = a1[4];
  id v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v6;
}

void __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify live workout data source client of new collected types with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_basicDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceConfiguration, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end