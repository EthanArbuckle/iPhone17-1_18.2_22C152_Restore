@interface HFCameraManager
- (BOOL)_hasSnapshotRequesters;
- (BOOL)_hasStreamRequesters;
- (BOOL)arePeriodicSnapshotsEnabled;
- (BOOL)isContinuousStreamingEnabled;
- (BOOL)isRegisteredForEvents;
- (HFCameraManager)initWithCameraProfile:(id)a3;
- (HFExecutionEnvironment)executionEnvironment;
- (HMCameraProfile)cameraProfile;
- (NACancelable)nextSnapshotEvent;
- (NSDate)snapshotErrorDate;
- (NSError)cachedStreamError;
- (NSMapTable)snapshotRequesters;
- (NSMapTable)streamRequesters;
- (double)_snapshotTimeInterval;
- (id)_nextSnapshotDate;
- (unint64_t)snapshotErrorCount;
- (void)_beginContinuousStreaming;
- (void)_beginPeriodicSnapshots;
- (void)_cancelNextSnapshotEvent;
- (void)_dispatchStreamStateUpdate;
- (void)_endContinuousStreaming;
- (void)_endPeriodicSnapshots;
- (void)_scheduleNextSnapshotEventWithPreviousError:(id)a3;
- (void)_startStreaming;
- (void)_stopStreaming;
- (void)_updateEventRegistration;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)beginContinuousStreamingWithRequester:(id)a3;
- (void)beginPeriodicSnapshotsWithRequester:(id)a3;
- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5;
- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)dealloc;
- (void)endContinuousStreamingWithRequester:(id)a3;
- (void)endPeriodicSnapshotsWithRequester:(id)a3;
- (void)executionEnvironmentDidBecomeActive:(id)a3;
- (void)setCachedStreamError:(id)a3;
- (void)setExecutionEnvironment:(id)a3;
- (void)setIsRegisteredForEvents:(BOOL)a3;
- (void)setNextSnapshotEvent:(id)a3;
- (void)setSnapshotErrorCount:(unint64_t)a3;
- (void)setSnapshotErrorDate:(id)a3;
@end

@implementation HFCameraManager

- (NSError)cachedStreamError
{
  return self->_cachedStreamError;
}

- (HFCameraManager)initWithCameraProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraManager;
  v5 = [(HFCameraManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cameraProfile, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:2 valueOptions:0 capacity:0];
    snapshotRequesters = v6->_snapshotRequesters;
    v6->_snapshotRequesters = (NSMapTable *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:2 valueOptions:0 capacity:0];
    streamRequesters = v6->_streamRequesters;
    v6->_streamRequesters = (NSMapTable *)v9;

    uint64_t v11 = +[HFExecutionEnvironment sharedInstance];
    executionEnvironment = v6->_executionEnvironment;
    v6->_executionEnvironment = (HFExecutionEnvironment *)v11;
  }
  return v6;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  [(HFCameraManager *)self _scheduleNextSnapshotEventWithPreviousError:0];
  [(HFCameraManager *)self _startStreaming];
}

- (void)_startStreaming
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(HFCameraManager *)self _hasStreamRequesters])
  {
    [(HFCameraManager *)self setCachedStreamError:0];
    v3 = [(HFCameraManager *)self cameraProfile];
    id v4 = [v3 streamControl];
    uint64_t v5 = [v4 streamState];

    v6 = HFLogForCategory(0x1CuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(HFCameraManager *)self cameraProfile];
      v8 = objc_msgSend(v7, "hf_prettyDescription");
      uint64_t v9 = NSStringFromHMCameraStreamState(v5);
      int v12 = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Starting stream for %@, current stream state: %@", (uint8_t *)&v12, 0x16u);
    }
    if ((unint64_t)(v5 - 3) <= 1)
    {
      v10 = [(HFCameraManager *)self cameraProfile];
      uint64_t v11 = [v10 streamControl];
      [v11 startStream];

      [(HFCameraManager *)self _dispatchStreamStateUpdate];
    }
  }
}

- (BOOL)_hasStreamRequesters
{
  v2 = [(HFCameraManager *)self streamRequesters];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMapTable)streamRequesters
{
  return self->_streamRequesters;
}

- (void)_beginPeriodicSnapshots
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory(0x1BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFCameraManager *)self cameraProfile];
    uint64_t v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Beginning periodic snapshots for %@", (uint8_t *)&v6, 0xCu);
  }
  [(HFCameraManager *)self _scheduleNextSnapshotEventWithPreviousError:0];
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v10 = a5;
  id v7 = a3;
  uint64_t v8 = [(HFCameraManager *)self cameraProfile];
  id v9 = [v8 snapshotControl];

  if (v9 == v7) {
    [(HFCameraManager *)self _scheduleNextSnapshotEventWithPreviousError:v10];
  }
}

void __63__HFCameraManager__scheduleNextSnapshotEventWithPreviousError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained _hasSnapshotRequesters] & 1) == 0)
  {
    v2 = HFLogForCategory(0x1BuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v12 = [WeakRetained cameraProfile];
      v13 = objc_msgSend(v12, "hf_prettyDescription");
      int v16 = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "Taking a snapshot for unrequested %@", (uint8_t *)&v16, 0xCu);
    }
  }
  BOOL v3 = [WeakRetained cameraProfile];
  id v4 = [v3 accessory];
  char v5 = [v4 isReachable];

  if ((v5 & 1) == 0)
  {
    int v6 = HFLogForCategory(0x1BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = [WeakRetained cameraProfile];
      v15 = objc_msgSend(v14, "hf_prettyDescription");
      int v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Taking a snapshot for unreachable %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v7 = HFLogForCategory(0x1BuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [WeakRetained cameraProfile];
    id v9 = objc_msgSend(v8, "hf_prettyDescription");
    int v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Taking snapshot for %@", (uint8_t *)&v16, 0xCu);
  }
  id v10 = [WeakRetained cameraProfile];
  uint64_t v11 = [v10 snapshotControl];
  [v11 takeSnapshot];
}

- (void)_scheduleNextSnapshotEventWithPreviousError:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    char v5 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(HFCameraManager *)self cameraProfile];
      id v7 = objc_msgSend(v6, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling snapshot for %@ because demo mode is enabled", buf, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = [MEMORY[0x263EFF910] date];
      [(HFCameraManager *)self setSnapshotErrorDate:v8];

      [(HFCameraManager *)self setSnapshotErrorCount:[(HFCameraManager *)self snapshotErrorCount] + 1];
      id v9 = HFLogForCategory(0x1BuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v33 = [(HFCameraManager *)self cameraProfile];
        v34 = objc_msgSend(v33, "hf_prettyDescription");
        v35 = [(HFCameraManager *)self snapshotErrorDate];
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCameraManager snapshotErrorCount](self, "snapshotErrorCount"));
        *(_DWORD *)buf = 138413058;
        v40 = v34;
        __int16 v41 = 2112;
        *(void *)v42 = v4;
        *(_WORD *)&v42[8] = 2112;
        v43 = v35;
        __int16 v44 = 2112;
        v45 = v36;
        _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Snapshot failed for %@; error: %@; snapshotErrorDate: %@; snapshotErrorCount: %@",
          buf,
          0x2Au);
      }
    }
    else
    {
      [(HFCameraManager *)self setSnapshotErrorDate:0];
      [(HFCameraManager *)self setSnapshotErrorCount:0];
    }
    if ([(HFCameraManager *)self _hasSnapshotRequesters]
      && ([(HFCameraManager *)self cameraProfile],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 accessory],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 isReachable],
          v11,
          v10,
          (v12 & 1) != 0))
    {
      char v5 = [(HFCameraManager *)self _nextSnapshotDate];
      v13 = HFLogForCategory(0x1BuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = [(HFCameraManager *)self cameraProfile];
        v15 = objc_msgSend(v14, "hf_prettyDescription");
        int v16 = NSNumber;
        v17 = [(HFCameraManager *)self cameraProfile];
        uint64_t v18 = [v17 accessory];
        v19 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v18, "reachableTransports"));
        *(_DWORD *)buf = 138412802;
        v40 = v5;
        __int16 v41 = 2112;
        *(void *)v42 = v15;
        *(_WORD *)&v42[8] = 2112;
        v43 = v19;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling next snapshot at %@ for %@ (reachable transports: %@)", buf, 0x20u);
      }
      v20 = [(HFCameraManager *)self nextSnapshotEvent];
      [v20 cancel];

      objc_initWeak((id *)buf, self);
      v21 = [MEMORY[0x263F581B8] mainThreadScheduler];
      [v5 timeIntervalSinceNow];
      double v23 = v22;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __63__HFCameraManager__scheduleNextSnapshotEventWithPreviousError___block_invoke;
      v37[3] = &unk_26408E550;
      objc_copyWeak(&v38, (id *)buf);
      v24 = [v21 afterDelay:v37 performBlock:v23];
      [(HFCameraManager *)self setNextSnapshotEvent:v24];

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      char v5 = HFLogForCategory(0x1BuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [(HFCameraManager *)self cameraProfile];
        v26 = objc_msgSend(v25, "hf_prettyDescription");
        BOOL v27 = [(HFCameraManager *)self _hasSnapshotRequesters];
        v28 = [(HFCameraManager *)self cameraProfile];
        v29 = [v28 accessory];
        int v30 = [v29 isReachable];
        v31 = [(HFCameraManager *)self executionEnvironment];
        int v32 = [v31 isActive];
        *(_DWORD *)buf = 138413058;
        v40 = v26;
        __int16 v41 = 1024;
        *(_DWORD *)v42 = v27;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v30;
        LOWORD(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 2) = v32;
        _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling another snapshot for %@ (has requesters: %d, reachable: %d, execution active: %d", buf, 0x1Eu);
      }
    }
  }
}

- (HMCameraProfile)cameraProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraProfile);
  return (HMCameraProfile *)WeakRetained;
}

- (void)setSnapshotErrorDate:(id)a3
{
}

- (void)setSnapshotErrorCount:(unint64_t)a3
{
  self->_snapshotErrorCount = a3;
}

- (void)setNextSnapshotEvent:(id)a3
{
}

- (NACancelable)nextSnapshotEvent
{
  return self->_nextSnapshotEvent;
}

- (id)_nextSnapshotDate
{
  BOOL v3 = [(HFCameraManager *)self snapshotErrorDate];

  if (v3)
  {
    id v4 = [(HFCameraManager *)self snapshotErrorDate];
    if (![(HFCameraManager *)self snapshotErrorCount])
    {
      char v5 = HFLogForCategory(0x1BuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v16 = 0;
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Handling a snapshot error with no count", v16, 2u);
      }
    }
    [(HFCameraManager *)self _snapshotTimeInterval];
    double v7 = v6;
    unint64_t v8 = [(HFCameraManager *)self snapshotErrorCount];
    unint64_t v9 = 10;
    if (v8 < 0xA) {
      unint64_t v9 = v8;
    }
    double v10 = v7 * (double)v9;
  }
  else
  {
    uint64_t v11 = [(HFCameraManager *)self cameraProfile];
    char v12 = [v11 snapshotControl];
    v13 = [v12 mostRecentSnapshot];
    id v4 = [v13 captureDate];

    [(HFCameraManager *)self _snapshotTimeInterval];
  }
  __int16 v14 = [v4 dateByAddingTimeInterval:v10];

  return v14;
}

- (NSDate)snapshotErrorDate
{
  return self->_snapshotErrorDate;
}

- (unint64_t)snapshotErrorCount
{
  return self->_snapshotErrorCount;
}

- (double)_snapshotTimeInterval
{
  return 10.0;
}

- (void)beginPeriodicSnapshotsWithRequester:(id)a3
{
  id v4 = a3;
  char v5 = [(HFCameraManager *)self snapshotRequesters];
  double v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F58170]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    __int16 v14 = __55__HFCameraManager_beginPeriodicSnapshotsWithRequester___block_invoke;
    v15 = &unk_264098F70;
    objc_copyWeak(&v16, &location);
    unint64_t v8 = (void *)[v7 initWithTargetObject:v4 finalizer:&v12];
    unint64_t v9 = [(HFCameraManager *)self snapshotRequesters];
    [v9 setObject:v8 forKey:v4];

    double v10 = [(HFCameraManager *)self snapshotRequesters];
    uint64_t v11 = [v10 count];

    if (v11 == 1)
    {
      [(HFCameraManager *)self _beginPeriodicSnapshots];
      [(HFCameraManager *)self _updateEventRegistration];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_hasSnapshotRequesters
{
  v2 = [(HFCameraManager *)self snapshotRequesters];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMapTable)snapshotRequesters
{
  return self->_snapshotRequesters;
}

- (void)setIsRegisteredForEvents:(BOOL)a3
{
  self->_isRegisteredForEvents = a3;
}

- (void)_updateEventRegistration
{
  if ([(HFCameraManager *)self _hasSnapshotRequesters]
    || [(HFCameraManager *)self _hasStreamRequesters])
  {
    if ([(HFCameraManager *)self isRegisteredForEvents]) {
      return;
    }
    BOOL v3 = +[HFHomeKitDispatcher sharedDispatcher];
    [v3 addCameraObserver:self];

    id v4 = +[HFHomeKitDispatcher sharedDispatcher];
    [v4 addAccessoryObserver:self];

    char v5 = [(HFCameraManager *)self executionEnvironment];
    [v5 addObserver:self];
    uint64_t v6 = 1;
  }
  else
  {
    if (![(HFCameraManager *)self isRegisteredForEvents]) {
      return;
    }
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    [v7 removeCameraObserver:self];

    unint64_t v8 = +[HFHomeKitDispatcher sharedDispatcher];
    [v8 removeAccessoryObserver:self];

    char v5 = [(HFCameraManager *)self executionEnvironment];
    [v5 removeObserver:self];
    uint64_t v6 = 0;
  }

  [(HFCameraManager *)self setIsRegisteredForEvents:v6];
}

- (BOOL)isRegisteredForEvents
{
  return self->_isRegisteredForEvents;
}

- (HFExecutionEnvironment)executionEnvironment
{
  return self->_executionEnvironment;
}

- (void)dealloc
{
  BOOL v3 = [(HFCameraManager *)self nextSnapshotEvent];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HFCameraManager;
  [(HFCameraManager *)&v4 dealloc];
}

void __55__HFCameraManager_beginPeriodicSnapshotsWithRequester___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endPeriodicSnapshotsWithRequester:a2];
}

- (void)endPeriodicSnapshotsWithRequester:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(HFCameraManager *)self snapshotRequesters];
  char v5 = [v4 objectForKey:v9];

  if (v5)
  {
    uint64_t v6 = [(HFCameraManager *)self snapshotRequesters];
    [v6 removeObjectForKey:v9];

    id v7 = [(HFCameraManager *)self snapshotRequesters];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      [(HFCameraManager *)self _endPeriodicSnapshots];
      [(HFCameraManager *)self _updateEventRegistration];
    }
  }
}

- (BOOL)arePeriodicSnapshotsEnabled
{
  v2 = [(HFCameraManager *)self snapshotRequesters];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)beginContinuousStreamingWithRequester:(id)a3
{
  id v4 = a3;
  char v5 = [(HFCameraManager *)self streamRequesters];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F58170]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    __int16 v14 = __57__HFCameraManager_beginContinuousStreamingWithRequester___block_invoke;
    v15 = &unk_264098F70;
    objc_copyWeak(&v16, &location);
    uint64_t v8 = (void *)[v7 initWithTargetObject:v4 finalizer:&v12];
    id v9 = [(HFCameraManager *)self streamRequesters];
    [v9 setObject:v8 forKey:v4];

    double v10 = [(HFCameraManager *)self streamRequesters];
    uint64_t v11 = [v10 count];

    if (v11 == 1)
    {
      [(HFCameraManager *)self _beginContinuousStreaming];
      [(HFCameraManager *)self _updateEventRegistration];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __57__HFCameraManager_beginContinuousStreamingWithRequester___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endContinuousStreamingWithRequester:a2];
}

- (void)endContinuousStreamingWithRequester:(id)a3
{
  id v9 = a3;
  id v4 = [(HFCameraManager *)self streamRequesters];
  char v5 = [v4 objectForKey:v9];

  if (v5)
  {
    uint64_t v6 = [(HFCameraManager *)self streamRequesters];
    [v6 removeObjectForKey:v9];

    id v7 = [(HFCameraManager *)self streamRequesters];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      [(HFCameraManager *)self _endContinuousStreaming];
      [(HFCameraManager *)self _updateEventRegistration];
    }
  }
}

- (BOOL)isContinuousStreamingEnabled
{
  v2 = [(HFCameraManager *)self streamRequesters];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_endPeriodicSnapshots
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory(0x1BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFCameraManager *)self cameraProfile];
    char v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Ending periodic snapshots for %@", (uint8_t *)&v6, 0xCu);
  }
  [(HFCameraManager *)self _cancelNextSnapshotEvent];
}

- (void)_cancelNextSnapshotEvent
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory(0x1BuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFCameraManager *)self cameraProfile];
    char v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling next snapshot event for %@", (uint8_t *)&v7, 0xCu);
  }
  int v6 = [(HFCameraManager *)self nextSnapshotEvent];
  [v6 cancel];

  [(HFCameraManager *)self setNextSnapshotEvent:0];
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4 = a3;
  char v5 = [(HFCameraManager *)self cameraProfile];
  id v6 = [v5 snapshotControl];

  if (v6 == v4)
  {
    [(HFCameraManager *)self _scheduleNextSnapshotEventWithPreviousError:0];
  }
}

- (void)_beginContinuousStreaming
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFCameraManager *)self cameraProfile];
    char v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Beginning continuous streaming for %@", (uint8_t *)&v6, 0xCu);
  }
  [(HFCameraManager *)self _startStreaming];
}

- (void)_endContinuousStreaming
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFCameraManager *)self cameraProfile];
    char v5 = objc_msgSend(v4, "hf_prettyDescription");
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Ending continuous streaming for %@", (uint8_t *)&v6, 0xCu);
  }
  [(HFCameraManager *)self _stopStreaming];
}

- (void)_stopStreaming
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFCameraManager *)self cameraProfile];
  id v4 = [v3 streamControl];
  uint64_t v5 = [v4 streamState];

  int v6 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(HFCameraManager *)self cameraProfile];
    uint64_t v8 = objc_msgSend(v7, "hf_prettyDescription");
    uint64_t v9 = NSStringFromHMCameraStreamState(v5);
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Stopping stream for %@, current stream state: %@", (uint8_t *)&v12, 0x16u);
  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    double v10 = [(HFCameraManager *)self cameraProfile];
    uint64_t v11 = [v10 streamControl];
    [v11 stopStream];

    [(HFCameraManager *)self _dispatchStreamStateUpdate];
  }
}

- (void)_dispatchStreamStateUpdate
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke;
  aBlock[3] = &unk_26408E550;
  objc_copyWeak(&v6, &location);
  v2 = (void (**)(void))_Block_copy(aBlock);
  if (+[HFUtilities isInternalTest])
  {
    v2[2](v2);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_3;
    block[3] = &unk_264098FC0;
    id v4 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke(id *a1)
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_2;
  v4[3] = &unk_264098F98;
  a1 += 4;
  objc_copyWeak(&v5, a1);
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 dispatchCameraObserverMessage:v4 sender:WeakRetained];

  objc_destroyWeak(&v5);
}

void __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained cameraProfile];
    id v5 = [v4 streamControl];
    [v6 cameraStreamControlDidUpdateStreamState:v5];
  }
}

uint64_t __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraManager *)self cameraProfile];
  id v6 = [v5 streamControl];

  if (v6 == v4)
  {
    [(HFCameraManager *)self setCachedStreamError:0];
    [(HFCameraManager *)self _dispatchStreamStateUpdate];
  }
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = v6;
  if (+[HFExecutionEnvironment isHomeNotification])
  {
    uint64_t v8 = v6;
    if ([v6 code] == 23)
    {

      uint64_t v8 = 0;
    }
  }
  uint64_t v9 = [(HFCameraManager *)self cameraProfile];
  id v10 = [v9 streamControl];

  if (v10 == v7)
  {
    if (!v8)
    {
      uint64_t v11 = HFLogForCategory(0x1CuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFCameraManager restarting streaming after didStopStreamWithError nil", v12, 2u);
      }

      [(HFCameraManager *)self _startStreaming];
    }
    [(HFCameraManager *)self setCachedStreamError:v8];
    [(HFCameraManager *)self _dispatchStreamStateUpdate];
  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v7 = a3;
  id v4 = [(HFCameraManager *)self cameraProfile];
  id v5 = [v4 accessory];

  id v6 = v7;
  if (v5 == v7)
  {
    if ([v7 isReachable])
    {
      [(HFCameraManager *)self _scheduleNextSnapshotEventWithPreviousError:0];
      [(HFCameraManager *)self _startStreaming];
    }
    else
    {
      [(HFCameraManager *)self _cancelNextSnapshotEvent];
    }
    id v6 = v7;
  }
}

- (void)setCachedStreamError:(id)a3
{
  id v5 = (NSError *)a3;
  if (self->_cachedStreamError != v5)
  {
    objc_storeStrong((id *)&self->_cachedStreamError, a3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__HFCameraManager_setCachedStreamError___block_invoke;
    block[3] = &unk_26408DDE0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __40__HFCameraManager_setCachedStreamError___block_invoke(uint64_t a1)
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__HFCameraManager_setCachedStreamError___block_invoke_2;
  v3[3] = &unk_264098FE8;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v3);
}

void __40__HFCameraManager_setCachedStreamError___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) cameraProfile];
    id v4 = [v3 streamControl];
    [v5 cameraStreamControlDidUpdateManagerState:v4];
  }
}

- (void)setExecutionEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionEnvironment, 0);
  objc_storeStrong((id *)&self->_snapshotErrorDate, 0);
  objc_storeStrong((id *)&self->_nextSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_streamRequesters, 0);
  objc_storeStrong((id *)&self->_snapshotRequesters, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
  objc_storeStrong((id *)&self->_cachedStreamError, 0);
}

@end