@interface HDWorkoutRouteDataSource
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDWorkoutRouteDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HKDataFlowLink)workoutDataFlowLink;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_queue_createLocationDataCollectorWithConfiguration:(id)a3 workoutUUID:(id)a4;
- (id)_unitTest_locationDataCollector;
- (id)_workoutBuilderServer;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_setupLocationDataCollector;
- (void)altitudeUpdated:(double)a3;
- (void)connectionInvalidated;
- (void)elevationUpdated:(unint64_t)a3;
- (void)remote_setupWithSessionIdentifier:(id)a3;
- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4;
- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
- (void)workoutRouteUpdated:(id)a3;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
@end

@implementation HDWorkoutRouteDataSource

- (HDWorkoutRouteDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutRouteDataSource;
  v6 = [(HDStandardTaskServer *)&v15 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:5];
    elevationUnit = v6->_elevationUnit;
    v6->_elevationUnit = (HKUnit *)v9;

    _HKInitializeLogging();
    id v11 = objc_alloc(MEMORY[0x1E4F2AEC0]);
    uint64_t v12 = [v11 initWithProcessor:v6 sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*MEMORY[0x1E4F29FB8]];
    workoutDataFlowLink = v6->_workoutDataFlowLink;
    v6->_workoutDataFlowLink = (HKDataFlowLink *)v12;
  }
  return v6;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BC80];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDStandardTaskServer *)self taskUUID];
  v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)remote_setupWithSessionIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [v4 UUIDString];
    *(_DWORD *)buf = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Will setup route data source: %{public}@, session: %{public}@", buf, 0x16u);
  }
  v8 = [(HDStandardTaskServer *)self profile];
  uint64_t v9 = [v8 workoutManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke;
  v11[3] = &unk_1E62F3120;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 sessionServerFromSessionIdentifier:v10 completion:v11];
}

void __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke_2;
  block[3] = &unk_1E62F30F8;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke_2(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2)
  {
    objc_storeWeak((id *)(a1[6] + 40), v2);
    id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 40));
    [WeakRetained addObserver:a1[6] queue:*(void *)(a1[6] + 96)];

    id v4 = (void *)a1[6];
    objc_msgSend(v4, "_queue_setupLocationDataCollector");
  }
  else
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = (void *)a1[5];
      id v7 = v5;
      v8 = [v6 UUIDString];
      int v9 = 138543362;
      id v10 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Couldn't link workout route data source to session %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  switch(a4)
  {
    case 7:
      int v9 = 1;
      if (a5 != 8 && a5 != 17)
      {
        if (([v13 workoutConfiguration],
              a4 = objc_claimAutoreleasedReturnValue(),
              uint64_t v10 = [(id)a4 activityType],
              v10 != 67)
          && v10 != 61
          || (_os_feature_enabled_impl() & 1) == 0)
        {
          int v9 = 0;
        }
      }
      if (a5 != 8 && a5 != 17) {

      }
      if (v9)
      {
        [(HDLocationDataCollector *)self->_locationDataCollector resumeUpdates];
      }
      else if (a5 != 9)
      {
        [(HDLocationDataCollector *)self->_locationDataCollector startUpdates];
      }
      break;
    case 8:
      [(HDLocationDataCollector *)self->_locationDataCollector pauseUpdates];
      break;
    case 9:
      uint64_t v11 = [v13 workoutConfiguration];
      uint64_t v12 = [v11 activityType];
      if (v12 == 67 || v12 == 61) && (_os_feature_enabled_impl())
      {

        [(HDLocationDataCollector *)self->_locationDataCollector pauseUpdatesAfterDelay:15];
      }
      else
      {
      }
      break;
    case 10:
      goto LABEL_20;
    case 16:
      if (a5 == 17 || a5 == 8) {
LABEL_20:
      }
        [(HDLocationDataCollector *)self->_locationDataCollector stopUpdates];
      break;
    default:
      break;
  }
}

- (void)elevationUpdated:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke;
  v4[3] = &unk_1E62F3198;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F2B370] quantityWithUnit:*(void *)(*(void *)(a1 + 32) + 64) doubleValue:(double)*(unint64_t *)(a1 + 40)];
  _HKInitializeLogging();
  id v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    *(_DWORD *)buf = 138412546;
    v25 = v2;
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] Add elevation: %@ to elevation: %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 72);
  if (v6)
  {
    uint64_t v7 = [v6 _quantityByAddingQuantity:v2];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = v7;
  }
  else
  {
    id v10 = v2;
    int v9 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v10;
  }

  uint64_t v22 = *MEMORY[0x1E4F2A118];
  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 56);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_397;
  v19[3] = &unk_1E62F3148;
  id v20 = v11;
  uint64_t v21 = v12;
  id v14 = v11;
  [v13 sendToDestinationProcessors:v19];
  __int16 v15 = [*(id *)(a1 + 32) client];
  v16 = [v15 connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_2;
  v18[3] = &unk_1E62F3170;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v17 = [v16 remoteObjectProxyWithErrorHandler:v18];

  objc_msgSend(v17, "clientRemote_didUpdateElevation:", *(void *)(*(void *)(a1 + 32) + 72));
}

uint64_t __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_397(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elevation update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)workoutRouteUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_2;
  v9[3] = &unk_1E62F3148;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 sendToDestinationProcessors:v9];
  uint64_t v5 = [*(id *)(a1 + 32) client];
  id v6 = [v5 connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_3;
  v8[3] = &unk_1E62F3170;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v8];

  objc_msgSend(v7, "clientRemote_didUpdateRoute:", *(void *)(a1 + 40));
}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "addOtherSamples:dataSource:", v5, *(void *)(a1 + 40), v6, v7);
}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of route update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)altitudeUpdated:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke;
  v4[3] = &unk_1E62F3198;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F2B370];
  id v3 = [MEMORY[0x1E4F2B618] meterUnit];
  id v4 = [v2 quantityWithUnit:v3 doubleValue:*(double *)(a1 + 40)];

  uint64_t v5 = *(id **)(a1 + 32);
  if (!v5[10]) {
    goto LABEL_4;
  }
  if ([v5[10] compare:v4])
  {
    uint64_t v5 = *(id **)(a1 + 32);
LABEL_4:
    int v6 = [v5 client];
    uint64_t v7 = [v6 connection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke_2;
    v9[3] = &unk_1E62F3170;
    void v9[4] = *(void *)(a1 + 32);
    __int16 v8 = [v7 remoteObjectProxyWithErrorHandler:v9];

    objc_msgSend(v8, "clientRemote_didUpdateAltitude:", v4);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v4);
  }
}

void __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of altitude update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_workoutBuilderServer
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 56) allDestinationProcessors];
    v2 = objc_msgSend(v1, "hk_firstObjectPassingTest:", &__block_literal_global_1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __58__HDWorkoutRouteDataSource__queue_recoverCurrentElevation__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elevation update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __49__HDWorkoutRouteDataSource__workoutBuilderServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_queue_setupLocationDataCollector
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_locationDataCollector)
  {
    id v3 = -[HDWorkoutRouteDataSource _workoutBuilderServer]((uint64_t)self);
    if (!v3) {
      goto LABEL_18;
    }
    p_sessionServer = &self->_sessionServer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);

    if (!WeakRetained) {
      goto LABEL_18;
    }
    id v6 = objc_loadWeakRetained((id *)&self->_sessionServer);
    uint64_t v7 = [v6 currentActivity];
    __int16 v8 = [v7 workoutConfiguration];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_sessionServer);
      id v10 = [v11 workoutConfiguration];
    }
    [v10 locationType];
    [v10 activityType];
    [v10 swimmingLocationType];
    if ((_HKWorkoutActivityTypeIsRouteable() & 1) == 0)
    {
      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        id v26 = objc_loadWeakRetained((id *)p_sessionServer);
        uint64_t v27 = [v26 identifier];
        *(_DWORD *)v30 = 138543618;
        *(void *)&v30[4] = v27;
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v10;
        _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[routes] Workout route will not be tracked because activity is not routeable for session %{public}@, workout configuration %@", v30, 0x16u);
      }
      goto LABEL_17;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    uint64_t v12 = -[HDWorkoutRouteDataSource _workoutBuilderServer]((uint64_t)self);
    id v13 = v12;
    if (v12)
    {
      id v14 = [v12 currentMetadata];
      __int16 v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F2A118]];
      currentElevation = self->_currentElevation;
      self->_currentElevation = v15;

      if (self->_currentElevation)
      {
        uint64_t v17 = [(HDStandardTaskServer *)self client];
        v18 = [v17 connection];
        *(void *)v30 = MEMORY[0x1E4F143A8];
        *(void *)&v30[8] = 3221225472;
        *(void *)&v30[16] = __58__HDWorkoutRouteDataSource__queue_recoverCurrentElevation__block_invoke;
        v31 = &unk_1E62F3170;
        v32 = self;
        v19 = [v18 remoteObjectProxyWithErrorHandler:v30];

        objc_msgSend(v19, "clientRemote_didUpdateElevation:", self->_currentElevation);
      }
    }

    id v20 = [v3 taskUUID];
    uint64_t v21 = [(HDWorkoutRouteDataSource *)self _queue_createLocationDataCollectorWithConfiguration:v10 workoutUUID:v20];
    locationDataCollector = self->_locationDataCollector;
    self->_locationDataCollector = v21;

    [(HDLocationDataCollector *)self->_locationDataCollector setDelegate:self];
    id v23 = objc_loadWeakRetained((id *)&self->_sessionServer);
    if ([v23 state] == 7)
    {
    }
    else
    {
      id v28 = objc_loadWeakRetained((id *)&self->_sessionServer);
      uint64_t v29 = [v28 state];

      if (v29 != 9)
      {
LABEL_17:

LABEL_18:
        return;
      }
    }
    [(HDLocationDataCollector *)self->_locationDataCollector startUpdates];
    goto LABEL_17;
  }
}

- (id)_queue_createLocationDataCollectorWithConfiguration:(id)a3 workoutUUID:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [HDLocationDataCollector alloc];
  id v10 = [(HDStandardTaskServer *)self profile];
  id v11 = [(HDStandardTaskServer *)self delegate];
  uint64_t v12 = [v11 sampleSavingDelegate];
  id v13 = [(HDLocationDataCollector *)v9 initWithProfile:v10 sampleSavingDelegate:v12 configuration:v8 workoutUUID:v7];

  return v13;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B7B0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B7B0] clientInterface];
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutRouteDataSource_connectionInvalidated__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDWorkoutRouteDataSource_connectionInvalidated__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) stopUpdates];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained removeObserver:*(void *)(a1 + 32)];
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HDWorkoutRouteDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v9[3] = &unk_1E62F31C0;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __71__HDWorkoutRouteDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
  id v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] Data destination requests data from route data source: %{public}@, data destination: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_setupLocationDataCollector");
  }
  else
  {
    _HKInitializeLogging();
    id v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@, Expected HDWorkoutBuilderServer as a direct data destination", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HDWorkoutRouteDataSource_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke;
  block[3] = &unk_1E62F2F20;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

uint64_t __87__HDWorkoutRouteDataSource_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  if (objc_msgSend(a4, "locationType", a3) == 2)
  {
    _HKInitializeLogging();
    uint64_t v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Workout configuration updated to Indoor", v6, 2u);
    }
    [(HDLocationDataCollector *)self->_locationDataCollector stopUpdatesAndDiscardData];
  }
}

- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "workoutConfiguration", a3);
  [v5 locationType];
  [v5 activityType];
  [v5 swimmingLocationType];
  if ((_HKWorkoutActivityTypeIsRouteable() & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Workout activity updated to Indoor. Stopping location updates", v7, 2u);
    }
    [(HDLocationDataCollector *)self->_locationDataCollector stopUpdates];
  }
}

- (id)_unitTest_locationDataCollector
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  __int16 v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HDWorkoutRouteDataSource__unitTest_locationDataCollector__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__HDWorkoutRouteDataSource__unitTest_locationDataCollector__block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_latestAltitude, 0);
  objc_storeStrong((id *)&self->_currentElevation, 0);
  objc_storeStrong((id *)&self->_elevationUnit, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_locationDataCollector, 0);

  objc_destroyWeak((id *)&self->_sessionServer);
}

@end