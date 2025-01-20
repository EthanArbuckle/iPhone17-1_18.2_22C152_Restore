@interface HDLocationDataCollector
- (BOOL)isElevationAvailable;
- (BOOL)locationServicesEnabled;
- (CMElevation)elevation;
- (HDLocationDataCollector)initWithProfile:(id)a3 sampleSavingDelegate:(id)a4 configuration:(id)a5 workoutUUID:(id)a6;
- (HDLocationEventDelegate)delegate;
- (NSString)description;
- (id)createCMElevation;
- (id)workoutLocationManager;
- (int)authorizationStatus;
- (int64_t)state;
- (void)_queue_deleteCurrentRoute;
- (void)_queue_pauseLocationUpdatesAfterDelay:(uint64_t)a1;
- (void)_queue_resumeWorkout;
- (void)_queue_savedLocationData;
- (void)_queue_setupLocationUpdates;
- (void)_queue_stopGPSUpdates;
- (void)_queue_stopUpdates;
- (void)dealloc;
- (void)healthLocationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)healthLocationManager:(id)a3 didFailWithError:(id)a4;
- (void)healthLocationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)pauseUpdates;
- (void)pauseUpdatesAfterDelay:(unint64_t)a3;
- (void)resumeUpdates;
- (void)setDelegate:(id)a3;
- (void)setElevation:(id)a3;
- (void)startUpdates;
- (void)stopUpdates;
- (void)stopUpdatesAndDiscardData;
@end

@implementation HDLocationDataCollector

- (void)setDelegate:(id)a3
{
}

- (HDLocationEventDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDLocationEventDelegate *)WeakRetained;
}

void __52__HDLocationDataCollector__queue_createSeriesSample__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29FB8];
  v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 80);
      v10 = v6;
      v11 = [v9 UUID];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Saved route %@ with associated workout %@.", (uint8_t *)&v15, 0x20u);
    }
    v13 = [*(id *)(a1 + 32) delegate];
    [v13 workoutRouteUpdated:*(void *)(*(void *)(a1 + 32) + 80)];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[routes] %{public}@ Error occurred while saving route: %{public}@", (uint8_t *)&v15, 0x16u);
  }
}

- (HDLocationDataCollector)initWithProfile:(id)a3 sampleSavingDelegate:(id)a4 configuration:(id)a5 workoutUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HDLocationDataCollector;
  uint64_t v14 = [(HDLocationDataCollector *)&v22 init];
  int v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    v15->_state = 0;
    objc_storeStrong((id *)&v15->_sampleSavingDelegate, a4);
    objc_storeStrong((id *)&v15->_workoutUUID, a6);
    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v15->_lastPausedTime = -1.0;
    v15->_activityType = [v12 activityType];
    int v18 = [v12 shouldUseExtendedMode];
    __int16 v19 = (double *)MEMORY[0x1E4F1E740];
    if (!v18) {
      __int16 v19 = (double *)MEMORY[0x1E4F1E6D8];
    }
    v15->_desiredAccuracy = *v19;
    uint64_t v20 = [v12 predictionSessionUUID];
    v15->_predictedActivity = v20 != 0;
  }
  return v15;
}

- (void)dealloc
{
  [(HDAssertion *)self->_locationUpdatingAssertion invalidate];
  locationUpdatingAssertion = self->_locationUpdatingAssertion;
  self->_locationUpdatingAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDLocationDataCollector;
  [(HDLocationDataCollector *)&v4 dealloc];
}

- (int64_t)state
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__HDLocationDataCollector_state__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__HDLocationDataCollector_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64);
  return result;
}

- (NSString)description
{
  int64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t state = self->_state;
  if (state >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%zd)", self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E630B858[state];
  }
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v7];

  return (NSString *)v8;
}

- (id)workoutLocationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v3 = [WeakRetained workoutManager];
  objc_super v4 = [v3 locationManager];

  return v4;
}

- (int)authorizationStatus
{
  return [MEMORY[0x1E4F1E600] authorizationStatusForBundlePath:@"/System/Library/LocationBundles/AppleWatchWorkout.bundle"];
}

- (BOOL)locationServicesEnabled
{
  return [MEMORY[0x1E4F1E600] locationServicesEnabled];
}

- (id)createCMElevation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F221F0]);

  return v2;
}

- (BOOL)isElevationAvailable
{
  return [MEMORY[0x1E4F221F0] isElevationAvailable];
}

- (void)_queue_deleteCurrentRoute
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    _HKInitializeLogging();
    id v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
    int64_t v3 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = *(void **)(a1 + 80);
      id v5 = v3;
      uint64_t v6 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = a1;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ route %@ is empty, deleting.", buf, 0x16u);
    }
    v7 = objc_alloc_init(HDDataDeletionConfiguration);
    [(HDDataDeletionConfiguration *)v7 setGenerateDeletedObjects:0];
    [(HDDataDeletionConfiguration *)v7 setFailIfNotFound:0];
    [(HDDataDeletionConfiguration *)v7 setNotifyObservers:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v9 = [WeakRetained dataManager];
    id v10 = [*(id *)(a1 + 80) UUID];
    v24[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v17 = 0;
    [v9 deleteObjectsWithUUIDCollection:v11 configuration:v7 error:&v17];
    id v12 = v17;

    if (v12)
    {
      _HKInitializeLogging();
      os_log_t v13 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void **)(a1 + 80);
        int v15 = v13;
        uint64_t v16 = [v14 UUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        uint64_t v21 = v16;
        __int16 v22 = 2114;
        id v23 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[routes] %{public}@ error deleting empty route %{public}@: %{public}@.", buf, 0x20u);
      }
    }
  }
}

- (void)_queue_stopUpdates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2 == 3 || v2 == 0)
    {
      _HKInitializeLogging();
      objc_super v4 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v13 = 138543362;
      uint64_t v14 = a1;
      id v5 = "[routes] %{public}@ Inactive collector, ignoring end request";
      uint64_t v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_11;
    }
    *(void *)(a1 + 64) = 3;
    uint64_t v8 = [(id)a1 workoutLocationManager];
    [v8 removeObserver:a1];

    -[HDLocationDataCollector _queue_stopGPSUpdates](a1);
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 120);
      uint64_t v12 = *(void *)(a1 + 128);
      int v13 = 138543874;
      uint64_t v14 = a1;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      id v5 = "[routes] %{public}@ Received %tu valid locations, skipped %tu";
      uint64_t v6 = v9;
      uint32_t v7 = 32;
LABEL_11:
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v13, v7);
    }
  }
}

- (void)_queue_stopGPSUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    _HKInitializeLogging();
    uint64_t v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
    int64_t v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = a1;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop elevation updates.", (uint8_t *)&v7, 0xCu);
    }
    *(void *)(a1 + 96) = 0xBFF0000000000000;
    [*(id *)(a1 + 144) stopElevationUpdates];
    _HKInitializeLogging();
    objc_super v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = a1;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location manager GPS updates.", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 112) invalidate];
    id v5 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    uint64_t v6 = [(id)a1 workoutLocationManager];
    [v6 removeObserver:a1];
  }
}

- (void)stopUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int64_t v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location updates.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HDLocationDataCollector_stopUpdates__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__HDLocationDataCollector_stopUpdates__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  -[HDLocationDataCollector _queue_stopUpdates](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
    if (*(void *)(v2 + 80))
    {
      if (*(unsigned char *)(v2 + 88) || *(unsigned char *)(v2 + 40))
      {
        _HKInitializeLogging();
        int64_t v3 = (os_log_t *)MEMORY[0x1E4F29FB8];
        objc_super v4 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          id v5 = *(void **)(v2 + 80);
          uint64_t v6 = v4;
          int v7 = [v5 UUID];
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v2;
          __int16 v23 = 2112;
          v24 = v7;
          _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Freezing series sample: %@", buf, 0x16u);
        }
        uint64_t v8 = [*(id *)(v2 + 80) UUID];
        id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
        id v20 = 0;
        id v10 = +[HDSeriesSampleEntity freezeSeriesWithIdentifier:v8 metadata:MEMORY[0x1E4F1CC08] profile:WeakRetained error:&v20];
        id v11 = v20;

        if (!v10 || v11)
        {
          _HKInitializeLogging();
          os_log_t v16 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
          {
            __int16 v17 = *(void **)(v2 + 80);
            uint64_t v18 = v16;
            uint64_t v19 = [v17 UUID];
            *(_DWORD *)buf = 138543874;
            uint64_t v22 = v2;
            __int16 v23 = 2114;
            v24 = v19;
            __int16 v25 = 2114;
            id v26 = v11;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[routes] %{public}@ error freezing sample UUID %{public}@: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v12 = *(void **)(v2 + 80);
          *(void *)(v2 + 80) = 0;
        }
      }
      else
      {
        -[HDLocationDataCollector _queue_deleteCurrentRoute](v2);
      }
    }
    else
    {
      _HKInitializeLogging();
      int v13 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        __int16 v15 = NSStringFromSelector(sel__queue_freezeCurrentWorkoutRoute);
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v2;
        __int16 v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ %{public}@ _route is nil.", buf, 0x16u);
      }
    }
  }
}

- (void)stopUpdatesAndDiscardData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int64_t v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Stop location updates and discard data.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDLocationDataCollector_stopUpdatesAndDiscardData__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__HDLocationDataCollector_stopUpdatesAndDiscardData__block_invoke(uint64_t a1)
{
  -[HDLocationDataCollector _queue_stopUpdates](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  -[HDLocationDataCollector _queue_deleteCurrentRoute](v2);
}

- (void)startUpdates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int64_t v3 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    workoutUUID = self->_workoutUUID;
    unint64_t activityType = self->_activityType;
    uint64_t v6 = v3;
    int v7 = [(HDLocationDataCollector *)self delegate];
    *(_DWORD *)buf = 138544130;
    id v11 = self;
    __int16 v12 = 2112;
    int v13 = workoutUUID;
    __int16 v14 = 1024;
    int v15 = activityType;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Start location updates for workout %@ of type %d with data source %@", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HDLocationDataCollector_startUpdates__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__HDLocationDataCollector_startUpdates__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64) == 1)
  {
    _HKInitializeLogging();
    int64_t v3 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ location updates already started, ignoring start request", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(void *)(v2 + 120) = 0;
    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    -[HDLocationDataCollector _queue_setupLocationUpdates](v5);
  }
}

- (void)_queue_setupLocationUpdates
{
  v36[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if ([(id)a1 locationServicesEnabled])
    {
      uint64_t v2 = [(id)a1 workoutLocationManager];
      [v2 addObserver:a1];
      *(_DWORD *)(a1 + 72) = [(id)a1 authorizationStatus];
      _HKInitializeLogging();
      int64_t v3 = (os_log_t *)MEMORY[0x1E4F29FB8];
      uint64_t v4 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = a1;
        if ((v5 - 3) >= 2) {
          int v6 = @"denied/not determined";
        }
        else {
          int v6 = @"approved";
        }
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v5;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v6;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization status is: %d (%@)", buf, 0x1Cu);
      }
      int v7 = *(_DWORD *)(a1 + 72);
      if ((v7 - 3) >= 2)
      {
        if (!v7) {
          [v2 requestWhenInUseAuthorization];
        }
      }
      else
      {
        *(void *)(a1 + 64) = 1;
        uint64_t v8 = *(void *)(a1 + 24);
        int v9 = [(id)a1 isElevationAvailable];
        if (v8 == 46) {
          int v10 = 0;
        }
        else {
          int v10 = v9;
        }
        if (v10 == 1)
        {
          if (!*(void *)(a1 + 144))
          {
            _HKInitializeLogging();
            id v11 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = a1;
              _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[routes] [elevation] %{public}@ Creating CMElevation.", buf, 0xCu);
            }
            uint64_t v12 = [(id)a1 createCMElevation];
            int v13 = *(void **)(a1 + 144);
            *(void *)(a1 + 144) = v12;
          }
          *(void *)(a1 + 104) = 0;
          objc_initWeak((id *)buf, (id)a1);
          __int16 v14 = *(void **)(a1 + 144);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __54__HDLocationDataCollector__queue_setupLocationUpdates__block_invoke;
          v30[3] = &unk_1E630B810;
          objc_copyWeak(&v31, (id *)buf);
          [v14 startElevationUpdatesWithHandler:v30];
          objc_destroyWeak(&v31);
          objc_destroyWeak((id *)buf);
        }
        if (!*(void *)(a1 + 80))
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          int v15 = (void *)MEMORY[0x1E4F2B7A0];
          __int16 v16 = [MEMORY[0x1E4F2AEF8] localDevice];
          v35[0] = *MEMORY[0x1E4F2BBF0];
          __int16 v17 = [*(id *)(a1 + 16) UUIDString];
          v36[0] = v17;
          v35[1] = *MEMORY[0x1E4F2A1F0];
          uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v19 = [v18 UUIDString];
          v36[1] = v19;
          v35[2] = *MEMORY[0x1E4F2A1F8];
          v36[2] = &unk_1F17EEF58;
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
          uint64_t v21 = [v15 _workoutRouteWithDevice:v16 metadata:v20];
          uint64_t v22 = *(void **)(a1 + 80);
          *(void *)(a1 + 80) = v21;

          __int16 v23 = *(void **)(a1 + 48);
          uint64_t v34 = *(void *)(a1 + 80);
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __52__HDLocationDataCollector__queue_createSeriesSample__block_invoke;
          *(void *)&buf[24] = &unk_1E62F2978;
          uint64_t v33 = a1;
          [v23 saveSamples:v24 withCompletion:buf];
        }
        _HKInitializeLogging();
        __int16 v25 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v2;
          _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Fetched location manager: %@, create in-use assertion, and start updating location.", buf, 0x16u);
        }
        [*(id *)(a1 + 112) invalidate];
        id v26 = [*(id *)(a1 + 16) UUIDString];
        uint64_t v27 = [v2 takeLocationUpdatingAssertionForOwnerIdentifier:v26 desiredAccuracy:*(double *)(a1 + 32)];
        v28 = *(void **)(a1 + 112);
        *(void *)(a1 + 112) = v27;
      }
    }
    else
    {
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location services is not enabled", buf, 0xCu);
      }
    }
  }
}

void __54__HDLocationDataCollector__queue_setupLocationUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = v6;
  id v8 = v5;
  if (WeakRetained)
  {
    int v9 = WeakRetained[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HDLocationDataCollector__handleElevationData_error___block_invoke;
    block[3] = &unk_1E62F30F8;
    id v12 = v8;
    id v13 = v7;
    __int16 v14 = WeakRetained;
    dispatch_async(v9, block);
  }
}

- (void)pauseUpdatesAfterDelay:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ HDLocationDataCollector: Pause updates.", buf, 0xCu);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HDLocationDataCollector_pauseUpdatesAfterDelay___block_invoke;
  v7[3] = &unk_1E62F3198;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

void __50__HDLocationDataCollector_pauseUpdatesAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64) == 2)
  {
    _HKInitializeLogging();
    int64_t v3 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v4;
    id v5 = "[routes] %{public}@ location updates already paused, ignoring end request";
    id v6 = v3;
    uint32_t v7 = 12;
LABEL_10:
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, v7);
    return;
  }
  if ((*(_DWORD *)(v2 + 72) - 3) >= 2)
  {
    _HKInitializeLogging();
    int v9 = *MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(_DWORD *)(v10 + 72);
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 1024;
    int v15 = v11;
    id v5 = "[routes] %{public}@ Last status was %d, location not approved";
    id v6 = v9;
    uint32_t v7 = 18;
    goto LABEL_10;
  }
  uint64_t v8 = *(void *)(a1 + 40);

  -[HDLocationDataCollector _queue_pauseLocationUpdatesAfterDelay:](v2, v8);
}

- (void)_queue_pauseLocationUpdatesAfterDelay:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    *(CFAbsoluteTime *)(a1 + 96) = CFAbsoluteTimeGetCurrent();
    *(void *)(a1 + 64) = 2;
    dispatch_time_t v4 = dispatch_time(0, 1000000000 * a2);
    id v5 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__HDLocationDataCollector__queue_pauseLocationUpdatesAfterDelay___block_invoke;
    v6[3] = &unk_1E62F3198;
    v6[4] = a1;
    v6[5] = a2;
    dispatch_after(v4, v5, v6);
  }
}

- (void)pauseUpdates
{
  int64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  dispatch_time_t v4 = [v3 objectForKey:@"HDPauseWorkoutGPSTimeout"];

  if (v4) {
    uint64_t v5 = [v4 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = 180;
  }

  [(HDLocationDataCollector *)self pauseUpdatesAfterDelay:v5];
}

void __65__HDLocationDataCollector__queue_pauseLocationUpdatesAfterDelay___block_invoke(uint64_t a1)
{
  if (*(double *)(*(void *)(a1 + 32) + 96) > 0.0)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v3 = *(void *)(a1 + 32);
    if (Current - *(double *)(v3 + 96) > (double)*(unint64_t *)(a1 + 40))
    {
      -[HDLocationDataCollector _queue_stopGPSUpdates](v3);
    }
  }
}

- (void)resumeUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v7 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ HDLocationDataCollector: Resume updates.", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HDLocationDataCollector_resumeUpdates__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __40__HDLocationDataCollector_resumeUpdates__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[8];
  if (v3)
  {
    if (v3 == 3 || v3 == 1)
    {
      _HKInitializeLogging();
      uint64_t v5 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v6;
      uint32_t v7 = "[routes] %{public}@ location updates already started or ended, ignoring resume request";
      uint64_t v8 = v5;
      uint32_t v9 = 12;
    }
    else
    {
      v2[8] = 1;
      uint64_t v10 = *(void *)(a1 + 32);
      if ((*(_DWORD *)(v10 + 72) - 3) < 2)
      {
        -[HDLocationDataCollector _queue_resumeWorkout](v10);
        return;
      }
      _HKInitializeLogging();
      int v11 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = *(_DWORD *)(v12 + 72);
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 1024;
      int v17 = v13;
      uint32_t v7 = "[routes] %{public}@ Last status was %d, location not approved";
      uint64_t v8 = v11;
      uint32_t v9 = 18;
    }
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
    return;
  }

  [v2 startUpdates];
}

- (void)_queue_resumeWorkout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(double *)(a1 + 96) <= 0.0 || (*(_DWORD *)(a1 + 72) - 3) > 1)
    {
      _HKInitializeLogging();
      uint64_t v3 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 96);
        int v5 = 138543618;
        uint64_t v6 = a1;
        __int16 v7 = 2048;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ GPS was stopped; restart GPS. Last paused time: %f",
          (uint8_t *)&v5,
          0x16u);
      }
      *(void *)(a1 + 96) = 0xBFF0000000000000;
      -[HDLocationDataCollector _queue_setupLocationUpdates](a1);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v2 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138543362;
        uint64_t v6 = a1;
        _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ We resumed the workout before GPS was stopped. Don't restart GPS", (uint8_t *)&v5, 0xCu);
      }
      *(void *)(a1 + 96) = 0xBFF0000000000000;
    }
  }
}

void __54__HDLocationDataCollector__handleElevationData_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (uint64_t v3 = *(void **)(a1 + 40)) == 0)
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      unint64_t v13 = *(void *)(v12 + 144);
      unint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      unint64_t v19 = v13;
      __int16 v20 = 2114;
      unint64_t v21 = v14;
      uint64_t v10 = "[routes] [elevation] %{public}@ Error updating: %@, %{public}@";
      int v11 = v2;
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v4 = [v3 elevationAscended];
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(double *)(v6 + 96) > 0.0)
    {
      *(void *)(v6 + 104) = v4;
      return;
    }
    unint64_t v7 = *(void *)(v6 + 104);
    if (v4 >= v7)
    {
      if (v4 && v4 != v7)
      {
        *(void *)(v6 + 104) = v4;
        id v15 = [*(id *)(a1 + 48) delegate];
        [v15 elevationUpdated:v5 - v7];
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v8 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v9;
        __int16 v18 = 2048;
        unint64_t v19 = v5;
        __int16 v20 = 2048;
        unint64_t v21 = v7;
        uint64_t v10 = "[routes] [elevation] %{public}@ Error  currentElevationGain: %lu is less than previousGain:%lu";
        int v11 = v8;
LABEL_16:
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, v10, buf, 0x20u);
      }
    }
  }
}

- (void)_queue_savedLocationData
{
  self->_didSaveLocationData = 1;
}

- (void)healthLocationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__HDLocationDataCollector_healthLocationManager_didChangeAuthorizationStatus___block_invoke;
  v5[3] = &unk_1E630B838;
  int v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

void __78__HDLocationDataCollector_healthLocationManager_didChangeAuthorizationStatus___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v1 = *(_DWORD *)(a1 + 40) - 3;
  if (v1 < 2 != (*(_DWORD *)(*(void *)(a1 + 32) + 72) - 3) < 2)
  {
    _HKInitializeLogging();
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F29FB8];
    unint64_t v4 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(v5 + 72);
      int v7 = *(_DWORD *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v5;
      __int16 v20 = 1024;
      int v21 = v6;
      __int16 v22 = 1024;
      int v23 = v7;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Did change location authorization (%d -> %d)", (uint8_t *)&v18, 0x18u);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = *(_DWORD *)(a1 + 40);
    if (v1 > 1)
    {
      _HKInitializeLogging();
      uint64_t v12 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v18 = 138543362;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: pause location updates.", (uint8_t *)&v18, 0xCu);
      }
      unint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v15 = [v14 objectForKey:@"HDPauseWorkoutGPSTimeout"];

      if (v15) {
        uint64_t v16 = [v15 unsignedIntegerValue];
      }
      else {
        uint64_t v16 = 180;
      }

      -[HDLocationDataCollector _queue_pauseLocationUpdatesAfterDelay:](*(void *)(a1 + 32), v16);
    }
    else
    {
      double v8 = *(double *)(*(void *)(a1 + 32) + 96);
      _HKInitializeLogging();
      uint64_t v9 = *v3;
      BOOL v10 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
      if (v8 <= 0.0)
      {
        if (v10)
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v18 = 138543362;
          uint64_t v19 = v17;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: start location updates.", (uint8_t *)&v18, 0xCu);
        }
        -[HDLocationDataCollector _queue_setupLocationUpdates](*(void *)(a1 + 32));
      }
      else
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v18 = 138543362;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[routes] %{public}@ Location authorization change: resume location updates.", (uint8_t *)&v18, 0xCu);
        }
        -[HDLocationDataCollector _queue_resumeWorkout](*(void *)(a1 + 32));
      }
    }
  }
}

- (void)healthLocationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HDLocationDataCollector_healthLocationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_1E62F31C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __68__HDLocationDataCollector_healthLocationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (*(double *)(*(void *)(a1 + 32) + 96) <= 0.0)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v62 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v47;
      double v8 = (os_log_t *)MEMORY[0x1E4F29FB8];
      *(void *)&long long v5 = 138543874;
      long long v42 = v5;
      id v43 = v3;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(v3);
          }
          BOOL v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
          _HKInitializeLogging();
          os_log_t v11 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v44 = *(void *)(a1 + 32);
            id v15 = v11;
            [v10 coordinate];
            uint64_t v17 = v16;
            [v10 coordinate];
            uint64_t v19 = v18;
            [v10 altitude];
            uint64_t v21 = v20;
            [v10 speed];
            uint64_t v23 = v22;
            uint64_t v24 = v2;
            int v25 = [v10 type];
            id v26 = [v10 timestamp];
            *(_DWORD *)buf = 138544898;
            uint64_t v51 = v44;
            __int16 v52 = 2048;
            *(void *)v53 = v17;
            *(_WORD *)&v53[8] = 2048;
            *(void *)&v53[10] = v19;
            __int16 v54 = 2048;
            uint64_t v55 = v21;
            __int16 v56 = 2048;
            uint64_t v57 = v23;
            __int16 v58 = 1024;
            int v59 = v25;
            uint64_t v2 = v24;
            id v3 = v43;
            __int16 v60 = 2112;
            v61 = v26;
            _os_log_debug_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ Did update with location. coord (%f %f) altitude: %f speed: %f, type: %d date: %@", buf, 0x44u);
          }
          if ((objc_msgSend(v10, "type", v42) == 1
             || [v10 type] == 9
             || [v10 type] == 3
             || [v10 type] == 11)
            && ([v10 horizontalAccuracy], v12 < 50.0))
          {
            [v2 addObject:v10];
            uint64_t v13 = 120;
          }
          else
          {
            _HKInitializeLogging();
            os_log_t v14 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v27 = *(void *)(a1 + 32);
              v28 = v14;
              int v29 = [v10 type];
              [v10 horizontalAccuracy];
              *(_DWORD *)buf = v42;
              uint64_t v51 = v27;
              id v3 = v43;
              __int16 v52 = 1024;
              *(_DWORD *)v53 = v29;
              *(_WORD *)&v53[4] = 2048;
              *(void *)&v53[6] = v30;
              _os_log_debug_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ Skipped adding location of type: %d, horizontal accuracy: %g", buf, 0x1Cu);
            }
            uint64_t v13 = 128;
          }
          ++*(void *)(*(void *)(a1 + 32) + v13);
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v3 countByEnumeratingWithState:&v46 objects:v62 count:16];
      }
      while (v6);
    }

    if ([v2 count])
    {
      id v31 = *(void **)(*(void *)(a1 + 32) + 80);
      if (v31)
      {
        v32 = [v31 UUID];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        id v45 = 0;
        BOOL v34 = +[HDLocationSeriesSampleEntity insertLocationData:v2 seriesIdentifier:v32 profile:WeakRetained error:&v45];
        id v35 = v45;

        if (v34)
        {
          v36 = [v2 lastObject];
          [v36 altitude];
          double v38 = v37;

          v39 = [*(id *)(a1 + 32) delegate];
          [v39 altitudeUpdated:v38];

          objc_msgSend(*(id *)(a1 + 32), "_queue_savedLocationData");
        }
        else
        {
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v41;
            __int16 v52 = 2114;
            *(void *)v53 = v35;
            _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "[routes] %{public}@ Did not successfully save location. Error: %{public}@", buf, 0x16u);
          }
        }
      }
    }
  }
}

- (void)healthLocationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  double v8 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v8;
    int v10 = 138543874;
    os_log_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    int v15 = [v7 code];
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "[routes] %{public}@ %@ failed to get location with error: %d", (uint8_t *)&v10, 0x1Cu);
  }
}

- (CMElevation)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sampleSavingDelegate, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end