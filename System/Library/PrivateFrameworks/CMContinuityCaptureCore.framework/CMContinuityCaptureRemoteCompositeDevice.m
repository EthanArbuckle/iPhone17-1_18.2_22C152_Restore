@interface CMContinuityCaptureRemoteCompositeDevice
+ (void)setWombatMode:(BOOL)a3;
- (BOOL)_avcaptureDeviceSupportsDockKit;
- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4;
- (BOOL)setupCaptureDevices;
- (CMContinuityCaptureEventQueue)eventQueue;
- (CMContinuityCaptureFrameRateManager)frameRateManager;
- (CMContinuityCaptureRemoteCompositeDevice)initWithTransportServer:(id)a3 videoPreviewLayer:(id)a4;
- (ContinuityCaptureDeviceServer)server;
- (NSArray)continuityCaptureDevices;
- (NSArray)controls;
- (NSDate)currentSessionActivationStartTime;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5;
- (id)controlWithName:(id)a3;
- (id)debugInfo;
- (int64_t)state;
- (unint64_t)currentSessionID;
- (void)_invalidate;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)connectionInterrupted:(id)a3 forDevice:(id)a4;
- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)handleSynchronizeAudioClockCompletion;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postAggregatedCachedEventsIfApplicable;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)postEventOnAllEntities:(id)a3 data:(id)a4;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setupControls;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)terminateCompleteForDevice:(id)a3;
- (void)updateStreamConnectStatus;
- (void)updateSystemState;
@end

@implementation CMContinuityCaptureRemoteCompositeDevice

- (CMContinuityCaptureRemoteCompositeDevice)initWithTransportServer:(id)a3 videoPreviewLayer:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v60.receiver = self;
  v60.super_class = (Class)CMContinuityCaptureRemoteCompositeDevice;
  v8 = [(CMContinuityCaptureRemoteCompositeDevice *)&v60 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v8->_videoPreviewLayer, a4);
  v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  remoteClientDisconnectNotifiedByEntityType = v9->_remoteClientDisconnectNotifiedByEntityType;
  v9->_remoteClientDisconnectNotifiedByEntityType = v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  cmControlByName = v9->_cmControlByName;
  v9->_cmControlByName = v12;

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.continuity-capture", v14);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v15;

  id v17 = objc_storeWeak((id *)&v9->_server, v6);
  [v6 setDelegate:v9];

  v18 = [[CMContinuityCaptureEventQueue alloc] initWithActionDelegate:v9 queue:v9->_queue];
  eventQueue = v9->_eventQueue;
  v9->_eventQueue = v18;

  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  captureDeviceByEntityType = v9->_captureDeviceByEntityType;
  v9->_captureDeviceByEntityType = v20;

  v9->_legacyConnectionResetDelay = FigGetCFPreferenceNumberWithDefault();
  v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  pendingEventToBePostedQueue = v9->_pendingEventToBePostedQueue;
  v9->_pendingEventToBePostedQueue = v22;

  v24 = objc_alloc_init(CMContinuityCaptureFrameRateManager);
  frameRateManager = v9->_frameRateManager;
  v9->_frameRateManager = v24;

  v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  activeVideoEntities = v9->_activeVideoEntities;
  v9->_activeVideoEntities = v26;

  uint64_t v28 = os_transaction_create();
  transaction = v9->_transaction;
  v9->_transaction = (OS_os_transaction *)v28;

  [(CMContinuityCaptureRemoteCompositeDevice *)v9 setupControls];
  if ([(CMContinuityCaptureRemoteCompositeDevice *)v9 setupCaptureDevices])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_server);
    v31 = [WeakRetained localDevice];
    [v31 addObserver:v9 forKeyPath:@"activeStreams" options:3 context:0];

    id v32 = objc_loadWeakRetained((id *)&v9->_server);
    [v32 addObserver:v9 forKeyPath:@"timeSyncClock" options:3 context:0];

    atomic_store(1u, (unsigned __int8 *)&v9->_observingTimeSyncState);
    atomic_store(1u, (unsigned __int8 *)&v9->_observingActiveStreamState);
    v33 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
    v34 = [v33 queue];
    dispatch_assert_queue_not_V2(v34);

    v35 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
    v36 = [v35 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke;
    block[3] = &unk_264C99148;
    v37 = v9;
    v59 = v37;
    dispatch_async_and_wait(v36, block);

    v38 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    v39 = [v38 queue];
    dispatch_assert_queue_not_V2(v39);

    v40 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    v41 = [v40 queue];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_2;
    v56[3] = &unk_264C99148;
    v42 = v37;
    v57 = v42;
    dispatch_async_and_wait(v41, v56);

    dispatch_assert_queue_not_V2((dispatch_queue_t)v9->_queue);
    v43 = v9->_queue;
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_3;
    v54[3] = &unk_264C99148;
    v44 = v42;
    v55 = v44;
    dispatch_async_and_wait(v43, v54);

    v45 = [(NSMutableDictionary *)v9->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];

    if (v45)
    {
      v46 = [(NSMutableDictionary *)v9->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
      v47 = [v46 captureSession];
      [v47 addObserver:v44 forKeyPath:@"state" options:3 context:0];

      atomic_store(1u, v44 + 97);
    }
    v48 = [(NSMutableDictionary *)v9->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A558];

    if (v48)
    {
      v49 = [(NSMutableDictionary *)v9->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A558];
      v50 = [v49 captureSession];
      [v50 addObserver:v44 forKeyPath:@"state" options:3 context:0];

      atomic_store(1u, v44 + 98);
    }
    v51 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v62 = v44;
      __int16 v63 = 2080;
      v64 = "-[CMContinuityCaptureRemoteCompositeDevice initWithTransportServer:videoPreviewLayer:]";
      __int16 v65 = 2112;
      id v66 = v6;
      _os_log_impl(&dword_235FC2000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ %s server: %@", buf, 0x20u);
    }

    v52 = v44;
  }
  else
  {
LABEL_11:
    v52 = 0;
  }

  return v52;
}

void __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke(uint64_t a1)
{
  v2 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"batteryState" options:3 context:0];

  id v3 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"batteryLevel" options:3 context:0];
}

void __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_2(uint64_t a1)
{
  id v2 = +[CMContinuityCaptureThermalMonitor sharedInstance];
  [v2 addObserver:*(void *)(a1 + 32) forKeyPath:@"thermalLevel" options:3 context:0];
}

uint64_t __86__CMContinuityCaptureRemoteCompositeDevice_initWithTransportServer_videoPreviewLayer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStreamConnectStatus];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (CMContinuityCaptureFrameRateManager)frameRateManager
{
  return self->_frameRateManager;
}

- (NSDate)currentSessionActivationStartTime
{
  id v2 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 sessionActivationStartTime];
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

+ (void)setWombatMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543874;
    id v7 = a1;
    __int16 v8 = 2080;
    v9 = "+[CMContinuityCaptureRemoteCompositeDevice setWombatMode:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", (uint8_t *)&v6, 0x1Cu);
  }

  FigCaptureSessionRemoteSetWombatInUse();
  FigCaptureSessionRemoteSetWombatEnabled();
}

- (void)updateStreamConnectStatus
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v105 = self;
    __int16 v106 = 2080;
    v107 = "-[CMContinuityCaptureRemoteCompositeDevice updateStreamConnectStatus]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  if (v4)
  {
    id v83 = v4;
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v6 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v7 = CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
    __int16 v8 = (NSMutableSet *)[v6 initWithArray:v7];
    pendingSidebandStreamIdentifiers = self->_pendingSidebandStreamIdentifiers;
    self->_pendingSidebandStreamIdentifiers = v8;

    __int16 v10 = [v83 localDevice];
    objc_sync_enter(v10);
    BOOL v11 = [v83 localDevice];
    uint64_t v12 = [v11 activeStreams];

    objc_sync_exit(v10);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    obuint64_t j = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v114 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v95 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          id v17 = self->_pendingSidebandStreamIdentifiers;
          v18 = [v16 streamIdentifier];
          [(NSMutableSet *)v17 removeObject:v18];

          if ([v16 entity])
          {
            v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "entity"));
            [v5 addObject:v19];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v114 count:16];
      }
      while (v13);
    }

    v20 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      remoteClientDisconnectNotifiedByEntityType = self->_remoteClientDisconnectNotifiedByEntityType;
      v22 = [v83 timeSyncClock];
      v23 = self->_pendingSidebandStreamIdentifiers;
      *(_DWORD *)buf = 138544386;
      v105 = self;
      __int16 v106 = 2114;
      v107 = (const char *)v5;
      __int16 v108 = 2114;
      int64_t v109 = (int64_t)remoteClientDisconnectNotifiedByEntityType;
      __int16 v110 = 2112;
      v111 = v22;
      __int16 v112 = 2112;
      v113 = v23;
      _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ active entities %{public}@ pendingReconnectEntities %{public}@ timeSync %@ pendingSidebandStreamIdentifiers %@", buf, 0x34u);
    }
    if ([v5 count])
    {
      v24 = [v83 timeSyncClock];
      BOOL v25 = v24 == 0;

      if (!v25)
      {
        int64_t v26 = [v83 currentTransport];
        v27 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int64_t currentTransport = self->_currentTransport;
          *(_DWORD *)buf = 138543874;
          v105 = self;
          __int16 v106 = 2048;
          v107 = (const char *)currentTransport;
          __int16 v108 = 2048;
          int64_t v109 = v26;
          _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ evaluate pong %ld -> %ld", buf, 0x20u);
        }

        if (v26 != self->_currentTransport)
        {
          v29 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];

          if (v29)
          {
            v30 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
            v31 = [v30 captureSession];
            [v31 setTransport:v26];
          }
          id v32 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A558];

          if (v32)
          {
            v33 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
            v34 = [v33 captureSession];
            [v34 setTransport:v26];
          }
          self->_int64_t currentTransport = v26;
          if (v26 == 2)
          {
            v35 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v105 = self;
              _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ skip pong sound since device is wired", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v36 = [v83 clientDeviceModel];
            v37 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v105 = self;
              __int16 v106 = 1024;
              LODWORD(v107) = v36 == 2;
              _os_log_impl(&dword_235FC2000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ play pong sound since device is wireless (consider pong history : %d)", buf, 0x12u);
            }

            v35 = +[CMContinuityCapturePongSoundManager sharedInstance];
            v38 = [v83 localDevice];
            v39 = [v38 deviceIdentifier];
            v40 = [v39 UUIDString];
            [v35 pongIfNeededWithShouldConsiderPongHistory:v36 == 2 forIdentifier:v40];
          }
        }
      }
    }
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v41 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v90 objects:v103 count:16];
    if (v42)
    {
      char v81 = 0;
      uint64_t v43 = *(void *)v91;
      while (1)
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v91 != v43) {
            objc_enumerationMutation(v41);
          }
          v45 = *(void **)(*((void *)&v90 + 1) + 8 * v44);
          v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "entity"));
          int v47 = [v5 containsObject:v46];

          if (!v47)
          {
            v55 = self->_remoteClientDisconnectNotifiedByEntityType;
            v56 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "entity"));
            LOBYTE(v55) = [(NSMutableSet *)v55 containsObject:v56];

            if (v55) {
              goto LABEL_49;
            }
            v57 = self->_remoteClientDisconnectNotifiedByEntityType;
            v58 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "entity"));
            [(NSMutableSet *)v57 addObject:v58];

            uint64_t v59 = [v45 entity];
            v102[0] = &unk_26E96A570;
            v101[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
            v101[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
            v50 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
            v102[1] = v50;
            objc_super v60 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
            [(CMContinuityCaptureRemoteCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventRemoteClientDisconnect" entity:v59 data:v60];

            goto LABEL_48;
          }
          v48 = [v83 timeSyncClock];
          BOOL v49 = v48 == 0;

          if (v49)
          {
            v50 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v105 = self;
              v52 = v50;
              v53 = "%{public}@ Wait for timesync clock";
              uint32_t v54 = 12;
LABEL_45:
              _os_log_impl(&dword_235FC2000, v52, OS_LOG_TYPE_DEFAULT, v53, buf, v54);
            }
LABEL_48:

            goto LABEL_49;
          }
          if ([(NSMutableSet *)self->_pendingSidebandStreamIdentifiers count])
          {
            v50 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = self->_pendingSidebandStreamIdentifiers;
              *(_DWORD *)buf = 138543618;
              v105 = self;
              __int16 v106 = 2112;
              v107 = (const char *)v51;
              v52 = v50;
              v53 = "%{public}@ Wait for sideband identifiers %@";
              uint32_t v54 = 22;
              goto LABEL_45;
            }
            goto LABEL_48;
          }
          v61 = self->_remoteClientDisconnectNotifiedByEntityType;
          v62 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "entity"));
          LODWORD(v61) = [(NSMutableSet *)v61 containsObject:v62];

          if (v61)
          {
            -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self, "postEvent:entity:data:", @"kCMContinuityCaptureEventRemoteClientReconnect", [v45 entity], 0);
            __int16 v63 = self->_remoteClientDisconnectNotifiedByEntityType;
            v50 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v45, "entity"));
            [(NSMutableSet *)v63 removeObject:v50];
            char v81 = 1;
            goto LABEL_48;
          }
          char v81 = 1;
LABEL_49:
          ++v44;
        }
        while (v42 != v44);
        uint64_t v64 = [v41 countByEnumeratingWithState:&v90 objects:v103 count:16];
        uint64_t v42 = v64;
        if (!v64) {
          goto LABEL_55;
        }
      }
    }
    char v81 = 0;
LABEL_55:

    if ([v5 count])
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)self willChangeValueForKey:@"state"];
      int64_t v65 = self->_state & 0xFFFFFFFFFFFFFFF7;
    }
    else
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)self willChangeValueForKey:@"state"];
      int64_t v65 = self->_state | 8;
    }
    self->_state = v65;
    [(CMContinuityCaptureRemoteCompositeDevice *)self didChangeValueForKey:@"state"];
    if (v81)
    {
      v100[0] = @"kCMContinuityCaptureControlSystemPressure";
      v100[1] = @"kCMContinuityCaptureControlBatteryLevel";
      v100[2] = @"kCMContinuityCaptureControlBatteryState";
      [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:3];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v66 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v67 = [v66 countByEnumeratingWithState:&v86 objects:v99 count:16];
      if (v67)
      {
        uint64_t v68 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v67; ++j)
          {
            if (*(void *)v87 != v68) {
              objc_enumerationMutation(v66);
            }
            v70 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:*(void *)(*((void *)&v86 + 1) + 8 * j)];
            if (v70)
            {
              v71 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v105 = self;
                __int16 v106 = 2112;
                v107 = v70;
                _os_log_impl(&dword_235FC2000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated %@", buf, 0x16u);
              }

              v72 = [v83 localDevice];
              [v72 setValueForControl:v70 completion:0];
            }
          }
          uint64_t v67 = [v66 countByEnumeratingWithState:&v86 objects:v99 count:16];
        }
        while (v67);
      }

      if (![(NSMutableSet *)self->_remoteClientDisconnectNotifiedByEntityType count])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
        v74 = [WeakRetained localDevice];
        int v75 = [v74 legacyReconnectRecovery];

        if (v75)
        {
          v76 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int legacyConnectionResetDelay = self->_legacyConnectionResetDelay;
            *(_DWORD *)buf = 138543618;
            v105 = self;
            __int16 v106 = 1024;
            LODWORD(v107) = legacyConnectionResetDelay;
            _os_log_impl(&dword_235FC2000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ Legacy Recovery after %u", buf, 0x12u);
          }

          id v78 = objc_loadWeakRetained((id *)&self->_server);
          v79 = [v78 localDevice];
          [v79 setLegacyReconnectRecovery:0];

          [(CMContinuityCaptureRemoteCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventUserPause" entity:0 data:0];
          dispatch_time_t v80 = dispatch_time(0, 1000000000 * self->_legacyConnectionResetDelay);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __69__CMContinuityCaptureRemoteCompositeDevice_updateStreamConnectStatus__block_invoke;
          block[3] = &unk_264C990F8;
          objc_copyWeak(&v85, &location);
          dispatch_after(v80, MEMORY[0x263EF83A0], block);
          objc_destroyWeak(&v85);
        }
      }
      [(CMContinuityCaptureRemoteCompositeDevice *)self postAggregatedCachedEventsIfApplicable];
      [(CMContinuityCaptureRemoteCompositeDevice *)self updateSystemState];
    }
    v4 = v83;
  }

  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureRemoteCompositeDevice_updateStreamConnectStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained postEvent:@"kCMContinuityCaptureEventUserResume" entity:0 data:0];
    id v2 = [v5 server];
    BOOL v3 = v2;
    if (v2)
    {
      v4 = [v2 localDevice];
      [v4 postEvent:@"kCMContinuityCaptureEventUserResume" entity:0 data:0];
    }
    id WeakRetained = v5;
  }
}

- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v23 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    char v15 = 0;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v15)
        {
          [v10 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          char v15 = 1;
        }
        else if ([*(id *)(*((void *)&v24 + 1) + 8 * i) count] {
               && ([v18 firstObject], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
        }
        {
          v20 = v19;
          if (([v19 isEqualToString:v9] & 1) != 0
            || [v20 isEqualToString:v23])
          {
            id v21 = v18;

            char v15 = 0;
          }
          else
          {
            if (v14) {
              [v10 addObject:v14];
            }

            [v10 addObject:v18];
            id v21 = 0;
            char v15 = 1;
          }

          uint64_t v14 = v21;
        }
        else
        {
          char v15 = 0;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);

    if (v14) {
      [v10 addObject:v14];
    }
  }
  else
  {

    uint64_t v14 = 0;
  }

  return v10;
}

- (void)postAggregatedCachedEventsIfApplicable
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_pendingEventToBePostedQueue count])
  {
    BOOL v3 = [(CMContinuityCaptureRemoteCompositeDevice *)self _aggregateEventPairInAnyState:self->_pendingEventToBePostedQueue entryEventName:@"kCMContinuityCaptureEventActiveCallStart" exitEventName:@"kCMContinuityCaptureEventActiveCallEnd"];
    v4 = [(CMContinuityCaptureRemoteCompositeDevice *)self _aggregateEventPairInAnyState:v3 entryEventName:@"kCMContinuityCaptureEventUserPause" exitEventName:@"kCMContinuityCaptureEventUserResume"];

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingEventToBePostedQueue = self->_pendingEventToBePostedQueue;
    self->_pendingEventToBePostedQueue = v5;

    if (v4 && [v4 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v18 = v4;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((unint64_t)[v12 count] >= 3)
            {
              uint64_t v13 = [v12 objectAtIndexedSubscript:0];
              uint64_t v14 = [v12 objectAtIndexedSubscript:1];
              uint64_t v15 = [v14 unsignedIntegerValue];

              uint64_t v16 = [v12 objectAtIndexedSubscript:2];
              id v17 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                long long v24 = self;
                __int16 v25 = 2114;
                long long v26 = v13;
                __int16 v27 = 1024;
                int v28 = v15;
                _os_log_impl(&dword_235FC2000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Posting Cached event %{public}@ entity %d", buf, 0x1Cu);
              }

              [(CMContinuityCaptureRemoteCompositeDevice *)self postEvent:v13 entity:v15 data:v16];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
        }
        while (v9);
      }

      v4 = v18;
    }
  }
}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke;
  block[3] = &unk_264C9A800;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke(id *a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = (void *)*((void *)a1[4] + 3);
  BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[5], "entity"));
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = (void *)*((void *)a1[4] + 3);
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[5], "entity"));
    id v7 = [v5 objectForKeyedSubscript:v6];

    id v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      id v10 = a1[5];
      uint64_t v11 = v9[3];
      id v12 = a1[6];
      *(_DWORD *)buf = 138544130;
      v40 = v9;
      __int16 v41 = 2114;
      id v42 = v10;
      __int16 v43 = 2114;
      uint64_t v44 = v11;
      __int16 v45 = 2112;
      id v46 = v12;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate complete for %{public}@ currentPending %{public}@ server %@", buf, 0x2Au);
    }

    if ([a1[5] entity] == 1)
    {
      uint64_t v13 = [v7 captureSession];
      uint64_t v14 = [v13 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_26;
      block[3] = &unk_264C9A800;
      void block[4] = a1[4];
      id v37 = a1[6];
      id v38 = v7;
      dispatch_async(v14, block);
    }
    if ([a1[5] entity] == 3)
    {
      uint64_t v15 = [v7 captureSession];
      uint64_t v16 = [v15 queue];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_27;
      v33[3] = &unk_264C9A800;
      v33[4] = a1[4];
      id v34 = a1[6];
      id v35 = v7;
      dispatch_async(v16, v33);
    }
    id v17 = (void *)*((void *)a1[4] + 3);
    v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[5], "entity"));
    [v17 removeObjectForKey:v18];

    if (![*((id *)a1[4] + 3) count])
    {
      long long v19 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = a1[4];
        *(_DWORD *)buf = 138543362;
        v40 = v20;
        _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Session termination complete", buf, 0xCu);
      }

      id v21 = a1[6];
      if (v21)
      {
        long long v22 = [v21 queue];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_28;
        v31[3] = &unk_264C99080;
        v31[4] = a1[4];
        id v32 = a1[6];
        dispatch_async(v22, v31);

        id v23 = [a1[6] localDevice];
        long long v24 = [v23 queue];
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3221225472;
        __int16 v27 = __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_29;
        int v28 = &unk_264C99080;
        id v29 = a1[4];
        id v30 = a1[6];
        dispatch_async(v24, &v25);

        objc_msgSend(a1[6], "relayTerminationComplete", v25, v26, v27, v28, v29);
      }
      [a1[4] _invalidate];
      [a1[4] willChangeValueForKey:@"state"];
      *((void *)a1[4] + 7) = 16;
      [a1[4] didChangeValueForKey:@"state"];
    }
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_26(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove video capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 97));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) captureSession];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"state" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 97));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_27(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove audio capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 98));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) captureSession];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"state" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 98));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_28(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove timesync kvo %@", (uint8_t *)&v6, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 100));
  if (v5)
  {
    [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"timeSyncClock" context:0];
    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 100));
  }
}

void __71__CMContinuityCaptureRemoteCompositeDevice_terminateCompleteForDevice___block_invoke_29(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove active stream kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 99));
  if (v5)
  {
    int v6 = [*(id *)(a1 + 40) localDevice];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"activeStreams" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 99));
  }
}

- (unint64_t)currentSessionID
{
  id v2 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 currentSessionID];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__CMContinuityCaptureRemoteCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __91__CMContinuityCaptureRemoteCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlSystemPressure"];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v13 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  if (v13)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = self;
        __int16 v35 = 2114;
        unint64_t v36 = (unint64_t)v9;
        __int16 v37 = 2114;
        uint64_t v38 = (uint64_t)v10;
        _os_log_debug_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEBUG, "%@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
      }
    }
    if ([v9 isEqualToString:@"systemPressureState"])
    {
      id v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v16 = [v15 level];
      id v17 = [v12 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 value];
        id v32 = v13;
        id v18 = v9;
        id v19 = v12;
        id v20 = v15;
        id v21 = v11;
        id v23 = v22 = v10;
        char v24 = [v23 isEqualToString:v16];

        id v10 = v22;
        id v11 = v21;
        id v15 = v20;
        id v12 = v19;
        id v9 = v18;
        uint64_t v13 = v32;

        if (v24)
        {
LABEL_13:

          goto LABEL_21;
        }
        uint64_t v25 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v12 value];
          *(_DWORD *)buf = 138543874;
          id v34 = self;
          __int16 v35 = 2112;
          unint64_t v36 = (unint64_t)v26;
          __int16 v37 = 2112;
          uint64_t v38 = (uint64_t)v16;
          _os_log_impl(&dword_235FC2000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ System Pressure state changed from %@ to %@.", buf, 0x20u);
        }
        [v12 setValue:v16];
        id v17 = [v32 localDevice];
        [v17 setValueForControl:v12 completion:0];
      }

      goto LABEL_13;
    }
    if (([v9 isEqualToString:@"activeStreams"] & 1) != 0
      || [v9 isEqualToString:@"timeSyncClock"])
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)self updateStreamConnectStatus];
    }
    else if (([v9 isEqualToString:@"batteryState"] & 1) != 0 {
           || ([v9 isEqualToString:@"batteryLevel"] & 1) != 0
    }
           || [v9 isEqualToString:@"thermalLevel"])
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)self updateSystemState];
    }
    else if (([v9 isEqualToString:@"currentState"] & 1) == 0 {
           && [v9 isEqualToString:@"state"])
    }
    {
      __int16 v27 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v28 = [v27 integerValue];

      id v29 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v30 = [(CMContinuityCaptureRemoteCompositeDevice *)self currentSessionID];
        *(_DWORD *)buf = 138543874;
        id v34 = self;
        __int16 v35 = 2048;
        unint64_t v36 = v30;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] capture session state %ld", buf, 0x20u);
      }

      if (v28 == 3)
      {
        v31 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1008 userInfo:0];
        [(CMContinuityCaptureRemoteCompositeDevice *)self connectionInterrupted:v31 forDevice:0];
      }
    }
  }
LABEL_21:
}

- (void)connectionInterrupted:(id)a3 forDevice:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  int v7 = (void *)v6;
  if (v5 && v6 && [v5 code])
  {
    uint64_t v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Interrupted, error %{public}@", buf, 0x16u);
    }

    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", mach_continuous_time(), @"CMContinuityCaptureStateMachineEventDataKeyOption", @"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart", @"CMContinuityCaptureStateMachineEventDataKeyPostTime", &unk_26E96A570, MEMORY[0x263EFFA88]);
    v13[2] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:3];
    [(CMContinuityCaptureRemoteCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventRemoteClientDisconnect" entity:0 data:v10];

    id v11 = [v7 localDevice];
    [v11 postEvent:@"kCMContinuityCaptureEventConnectionDisconnect" entity:0 data:0];
  }
}

- (BOOL)setupCaptureDevices
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  if (v3)
  {
    unint64_t v4 = +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:2];
    if (v4) {
      BOOL v5 = [v3 clientDeviceModel] != 2;
    }
    else {
      BOOL v5 = 0;
    }

    int v7 = [CMContinuityCaptureAVCaptureVideoSession alloc];
    uint64_t v8 = (void *)FigDispatchQueueCreateWithPriority();
    id v9 = [(CMContinuityCaptureAVCaptureVideoSession *)v7 initWithQueue:v8 requiresMulticamSession:v5];

    [(CMContinuityCaptureAVCaptureVideoSession *)v9 setVideoPreviewLayer:self->_videoPreviewLayer];
    -[CMContinuityCaptureAVCaptureBaseSession setTransport:](v9, "setTransport:", [v3 currentTransport]);
    -[CMContinuityCaptureAVCaptureBaseSession setClientDeviceModel:](v9, "setClientDeviceModel:", [v3 clientDeviceModel]);
    id v10 = [CMContinuityCaptureAVCaptureAudioSession alloc];
    id v11 = (void *)FigDispatchQueueCreateWithPriority();
    uint64_t v39 = [(CMContinuityCaptureAVCaptureAudioSession *)v10 initWithQueue:v11];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v40 = v3;
    uint64_t v12 = [v3 localDevice];
    uint64_t v13 = [v12 capabilities];
    id v14 = [v13 devicesCapabilities];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v19 entityType] != 2
            || (uint64_t v20 = [v40 clientDeviceModel],
                id v21 = off_264C98BE8,
                id v22 = (CMContinuityCaptureAVCaptureAudioSession *)v9,
                v20 == 2))
          {
            uint64_t v23 = [v19 entityType];
            id v21 = off_264C98BF0;
            id v22 = (CMContinuityCaptureAVCaptureAudioSession *)v9;
            if (v23 != 1)
            {
              uint64_t v24 = [v19 entityType];
              id v21 = off_264C98BD8;
              id v22 = v39;
              if (v24 != 3) {
                goto LABEL_19;
              }
            }
          }
          uint64_t v25 = [objc_alloc(*v21) initWithCapabilities:v19 compositeDelegate:self captureSession:v22];
          if (v25)
          {
            uint64_t v26 = v25;
            __int16 v27 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v46 = self;
              __int16 v47 = 2114;
              v48 = v26;
              _os_log_impl(&dword_235FC2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@", buf, 0x16u);
            }

            captureDeviceByEntityType = self->_captureDeviceByEntityType;
            id v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "entityType"));
            [(NSMutableDictionary *)captureDeviceByEntityType setObject:v26 forKeyedSubscript:v29];
          }
          else
          {
LABEL_19:
            uint64_t v26 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              int v30 = [v19 entityType];
              *(_DWORD *)buf = 138543618;
              id v46 = self;
              __int16 v47 = 1024;
              LODWORD(v48) = v30;
              _os_log_impl(&dword_235FC2000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to create capture device for entity %d", buf, 0x12u);
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v16);
    }

    uint64_t v31 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A588];
    if (v31)
    {
      id v32 = (void *)v31;
      v33 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];

      if (v33)
      {
        id v34 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
        __int16 v35 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A588];
        [v35 setCompanionDevice:v34];

        unint64_t v36 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A588];
        __int16 v37 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
        [v37 setCompanionDevice:v36];
      }
    }
    BOOL v6 = [(NSMutableDictionary *)self->_captureDeviceByEntityType count] != 0;

    id v3 = v40;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (ContinuityCaptureDeviceServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  id v3 = WeakRetained;
  if (WeakRetained) {
    id v4 = WeakRetained;
  }

  return (ContinuityCaptureDeviceServer *)v3;
}

- (NSArray)controls
{
  return (NSArray *)[(NSMutableDictionary *)self->_cmControlByName allValues];
}

- (NSArray)continuityCaptureDevices
{
  return (NSArray *)[(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
}

- (CMContinuityCaptureEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (void)invalidate
{
  id v3 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 queue];
    dispatch_assert_queue_V2(v5);

    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke;
    v7[3] = &unk_264C99080;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
  }
}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localDevice];
  id v3 = [v2 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_2;
  block[3] = &unk_264C99080;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v7.i64[0];
  int8x16_t v12 = vextq_s8(v7, v7, 8uLL);
  dispatch_async(v3, block);

  BOOL v5 = [*(id *)(a1 + 32) queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_45;
  v9[3] = &unk_264C99080;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  dispatch_async(v5, v9);

  [*(id *)(a1 + 32) relayTerminationComplete];
  [*(id *)(a1 + 40) _invalidate];
}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove active stream kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 99));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) localDevice];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"activeStreams" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 99));
  }
}

void __54__CMContinuityCaptureRemoteCompositeDevice_invalidate__block_invoke_45(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove timesync kvo %@", (uint8_t *)&v6, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 100));
  if (v5)
  {
    [*(id *)(a1 + 40) removeObserver:*(void *)(a1 + 32) forKeyPath:@"timeSyncClock" context:0];
    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 100));
  }
}

- (void)_invalidate
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v3 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v46 = self;
    __int16 v47 = 2082;
    v48 = "-[CMContinuityCaptureRemoteCompositeDevice _invalidate]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_sessionInvalidated);
  if ((v4 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_sessionInvalidated);
    unsigned __int8 v5 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
    int v6 = [v5 queue];
    dispatch_assert_queue_not_V2(v6);

    uint64_t v7 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
    __int16 v8 = [v7 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke;
    block[3] = &unk_264C99148;
    void block[4] = self;
    dispatch_async_and_wait(v8, block);

    uint64_t v9 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    uint64_t v10 = [v9 queue];
    dispatch_assert_queue_not_V2(v10);

    uint64_t v11 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    int8x16_t v12 = [v11 queue];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_2;
    v42[3] = &unk_264C99148;
    v42[4] = self;
    dispatch_async_and_wait(v12, v42);

    uint64_t v13 = [MEMORY[0x263EFF910] now];
    id v14 = CMContinuityCaptureLog(2);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    CFStringRef v16 = (const __CFString *)*MEMORY[0x263F2BFD8];
    CFStringRef v17 = (const __CFString *)*MEMORY[0x263F2BFD0];
    if (v15)
    {
      *(_DWORD *)buf = 138544130;
      id v46 = self;
      __int16 v47 = 2112;
      v48 = (const char *)v17;
      __int16 v49 = 2112;
      CFStringRef v50 = v16;
      __int16 v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting preference (%@) '%@' to %@", buf, 0x2Au);
    }

    id v32 = v13;
    CFPreferencesSetValue(v16, v13, v17, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v18 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v24 = [v23 queue];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_47;
          v37[3] = &unk_264C99080;
          v37[4] = self;
          v37[5] = v23;
          dispatch_async(v24, v37);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v20);
    }

    uint64_t v25 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A540];
    uint64_t v26 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A558];
    if (v25)
    {
      __int16 v27 = [v25 captureSession];
      uint64_t v28 = [v27 queue];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_48;
      v35[3] = &unk_264C99080;
      v35[4] = self;
      id v36 = v25;
      dispatch_async(v28, v35);
    }
    if (v26)
    {
      id v29 = [v26 captureSession];
      int v30 = [v29 queue];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_49;
      v33[3] = &unk_264C99080;
      v33[4] = self;
      id v34 = v26;
      dispatch_async(v30, v33);
    }
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke(uint64_t a1)
{
  id v2 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"batteryState" context:0];

  id v3 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"batteryLevel" context:0];
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_2(uint64_t a1)
{
  id v2 = +[CMContinuityCaptureThermalMonitor sharedInstance];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"thermalLevel" context:0];
}

uint64_t __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_47(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidate %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) stopCameraCaptureStack:0];
  return [*(id *)(a1 + 40) invalidate];
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_48(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove video capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 97));
  if (v5)
  {
    int v6 = [*(id *)(a1 + 40) captureSession];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"state" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 97));
  }
}

void __55__CMContinuityCaptureRemoteCompositeDevice__invalidate__block_invoke_49(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ remove audio capture session kvo %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 98));
  if (v5)
  {
    int v6 = [*(id *)(a1 + 40) captureSession];
    [v6 removeObserver:*(void *)(a1 + 32) forKeyPath:@"state" context:0];

    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 98));
  }
}

- (void)setupControls
{
  uint64_t v3 = [CMContinuityCaptureControl alloc];
  uint64_t v4 = *MEMORY[0x263EF97B0];
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  unsigned __int8 v5 = [(CMContinuityCaptureControl *)v3 initWithName:@"kCMContinuityCaptureControlSystemPressure" attributes:0 entity:4 minimumSupportedVersion:&v23 value:v4];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v5 forKeyedSubscript:@"kCMContinuityCaptureControlSystemPressure"];
  int v6 = [CMContinuityCaptureControl alloc];
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  int v7 = [(CMContinuityCaptureControl *)v6 initWithName:@"kCMContinuityCaptureControlIncomingCall" attributes:0 entity:4 minimumSupportedVersion:&v23 value:0];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v7 forKeyedSubscript:@"kCMContinuityCaptureControlIncomingCall"];
  uint64_t v8 = [CMContinuityCaptureControl alloc];
  __int16 v9 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  uint64_t v10 = [v9 batteryLevel];
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  uint64_t v11 = [(CMContinuityCaptureControl *)v8 initWithName:@"kCMContinuityCaptureControlBatteryLevel" attributes:0 entity:4 minimumSupportedVersion:&v23 value:v10];

  [(NSMutableDictionary *)self->_cmControlByName setObject:v11 forKeyedSubscript:@"kCMContinuityCaptureControlBatteryLevel"];
  int8x16_t v12 = [CMContinuityCaptureControl alloc];
  uint64_t v13 = NSNumber;
  id v14 = +[CMContinuityCaptureBatteryStateMonitor sharedInstance];
  BOOL v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "batteryState"));
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  CFStringRef v16 = [(CMContinuityCaptureControl *)v12 initWithName:@"kCMContinuityCaptureControlBatteryState" attributes:0 entity:4 minimumSupportedVersion:&v23 value:v15];

  [(NSMutableDictionary *)self->_cmControlByName setObject:v16 forKeyedSubscript:@"kCMContinuityCaptureControlBatteryState"];
  CFStringRef v17 = [CMContinuityCaptureControl alloc];
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  uint64_t v18 = [(CMContinuityCaptureControl *)v17 initWithName:@"kCMContinuityCaptureControlIncomingCallComplete" attributes:0 entity:4 minimumSupportedVersion:&v23 value:0];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v18 forKeyedSubscript:@"kCMContinuityCaptureControlIncomingCallComplete"];
  if ([(CMContinuityCaptureRemoteCompositeDevice *)self _avcaptureDeviceSupportsDockKit])
  {
    uint64_t v19 = [CMContinuityCaptureControl alloc];
    long long v23 = xmmword_236059610;
    uint64_t v24 = 0;
    uint64_t v20 = [(CMContinuityCaptureControl *)v19 initWithName:@"kCMContinuityCaptureControlDockedTrackingActive" attributes:0 entity:4 minimumSupportedVersion:&v23 value:0];
    [(NSMutableDictionary *)self->_cmControlByName setObject:v20 forKeyedSubscript:@"kCMContinuityCaptureControlDockedTrackingActive"];
  }
  uint64_t v21 = [CMContinuityCaptureControl alloc];
  long long v23 = xmmword_236059610;
  uint64_t v24 = 0;
  id v22 = [(CMContinuityCaptureControl *)v21 initWithName:@"kCMContinuityCaptureControlDebugInfo" attributes:0 entity:4 minimumSupportedVersion:&v23 value:&stru_26E95AB60];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v22 forKeyedSubscript:@"kCMContinuityCaptureControlDebugInfo"];
}

- (id)debugInfo
{
  return 0;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    BOOL v15 = self;
    __int16 v16 = 2080;
    CFStringRef v17 = "-[CMContinuityCaptureRemoteCompositeDevice handleAVCNegotiation:data:]";
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@  %s %d", buf, 0x1Cu);
  }

  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke;
  v10[3] = &unk_264C997E8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    unsigned __int8 v5 = (void *)*((void *)WeakRetained + 3);
    id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    int v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      [v7 handleAVCNegotiation:*(void *)(a1 + 48) data:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v2);
      }
    }
  }
}

- (void)handleSynchronizeAudioClockCompletion
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__CMContinuityCaptureRemoteCompositeDevice_handleSynchronizeAudioClockCompletion__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureRemoteCompositeDevice_handleSynchronizeAudioClockCompletion__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[3] objectForKeyedSubscript:&unk_26E96A558];
    id v5 = v4;
    if (v4)
    {
      [v4 handleSynchronizeAudioClockCompletion];
    }
    else
    {
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v1);
      }
    }
  }
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CMContinuityCaptureRemoteCompositeDevice_captureStillImage_entity_completion___block_invoke;
  block[3] = &unk_264C9A828;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureRemoteCompositeDevice_captureStillImage_entity_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 3);
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v6 captureStillImage:*(void *)(a1 + 32) entity:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
    }
    else
    {
      int v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1001 userInfo:0];
      id v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543874;
        uint64_t v10 = v3;
        __int16 v11 = 2112;
        id v12 = v6;
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_error_impl(&dword_235FC2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Invalid capture device %@ error %@", (uint8_t *)&v9, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  if (v6)
  {
    int v7 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
    id v8 = [v7 localDevice];
    int v9 = [v8 deviceIdentifier];
    uint64_t v10 = [v9 UUIDString];
    __int16 v11 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v10, self];
  }
  else
  {
    __int16 v11 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, 0, self];
  }

  return (NSString *)v11;
}

- (void)enqueueReactionEffect:(id)a3 entity:(int64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__CMContinuityCaptureRemoteCompositeDevice_enqueueReactionEffect_entity___block_invoke;
  v9[3] = &unk_264C997E8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a4;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __73__CMContinuityCaptureRemoteCompositeDevice_enqueueReactionEffect_entity___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[3] objectForKeyedSubscript:&unk_26E96A540];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v4 enqueueReactionEffect:*(void *)(a1 + 32) entity:*(void *)(a1 + 48)];
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-1001 userInfo:0];
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138543874;
        id v8 = v3;
        __int16 v9 = 2112;
        id v10 = v4;
        __int16 v11 = 2112;
        id v12 = v5;
        _os_log_error_impl(&dword_235FC2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Invalid capture device %@ error %@", (uint8_t *)&v7, 0x20u);
      }
    }
  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__CMContinuityCaptureRemoteCompositeDevice_postEvent_entity_data___block_invoke;
  void v13[3] = &unk_264C99238;
  objc_copyWeak(v17, &location);
  id v14 = v8;
  uint64_t v15 = self;
  v17[1] = (id)a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __66__CMContinuityCaptureRemoteCompositeDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained server];
    if (!v5)
    {
LABEL_34:

      goto LABEL_35;
    }
    id v6 = CMContinuityCaptureRemoteEventToBeRelayedList();
    if ([*((id *)v4 + 10) count]
      && [v6 containsObject:*(void *)(a1 + 32)])
    {
      int v7 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (void *)*((void *)v4 + 10);
        uint64_t v10 = *(void *)(a1 + 32);
        id v9 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        id v31 = v9;
        __int16 v32 = 2112;
        v33 = v8;
        __int16 v34 = 2114;
        uint64_t v35 = v10;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Wait for sideband identifiers %@, cache event %{public}@", buf, 0x20u);
      }

      id v11 = (void *)*((void *)v4 + 11);
      v29[0] = *(void *)(a1 + 32);
      uint64_t v12 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
      uint64_t v13 = (void *)v12;
      uint64_t v14 = *(void *)(a1 + 48);
      if (!v14) {
        uint64_t v14 = MEMORY[0x263EFFA78];
      }
      v29[1] = v12;
      v29[2] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
      [v11 addObject:v15];
      goto LABEL_31;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventUserPause"])
    {
      id v16 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543362;
        id v31 = v17;
        _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ UserPause", buf, 0xCu);
      }
      [v4 willChangeValueForKey:@"state"];
      unint64_t v18 = *((void *)v4 + 7) | 1;
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventUserResume"])
      {
LABEL_19:
        if (*(void *)(a1 + 64) == 4
          && ([*((id *)v4 + 4) objectForKeyedSubscript:*(void *)(a1 + 32)],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              v21,
              v21))
        {
          if (([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureControlIncomingCall"] & 1) == 0
            && ![*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureControlIncomingCallComplete"])
          {
            goto LABEL_33;
          }
          id v22 = [*((id *)v4 + 4) objectForKeyedSubscript:*(void *)(a1 + 32)];
          uint64_t v13 = v22;
          if (!v22) {
            goto LABEL_32;
          }
          [v22 setValue:*(void *)(a1 + 48)];
          long long v23 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            id v31 = v24;
            __int16 v32 = 2114;
            v33 = v13;
            _os_log_impl(&dword_235FC2000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ SetValue %{public}@", buf, 0x16u);
          }

          uint64_t v15 = [v5 localDevice];
          [v15 setValueForControl:v13 completion:0];
        }
        else
        {
          if (!*(void *)(a1 + 32))
          {
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v13 = [v4 eventQueue];
          uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 64), *(void *)(a1 + 32));
          uint64_t v15 = (void *)v25;
          uint64_t v26 = *(void *)(a1 + 48);
          if (!v26) {
            uint64_t v26 = MEMORY[0x263EFFA78];
          }
          v28[1] = v25;
          v28[2] = v26;
          __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
          [v13 enqueueEventAction:3 args:v27];
        }
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      int v19 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543362;
        id v31 = v20;
        _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ UserResume", buf, 0xCu);
      }
      [v4 willChangeValueForKey:@"state"];
      unint64_t v18 = *((void *)v4 + 7) & 0xFFFFFFFFFFFFFFFELL;
    }
    *((void *)v4 + 7) = v18;
    [v4 didChangeValueForKey:@"state"];
    goto LABEL_19;
  }
LABEL_35:
}

- (void)postEventOnAllEntities:(id)a3 data:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "postEvent:entity:data:", v6, objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "entity"), v7);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CMContinityCaptureDebugLogEnabled())
  {
    id v7 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v51 = self;
      __int16 v52 = 2048;
      unint64_t v53 = a3;
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_debug_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEBUG, "%@ Perform %lu %@", buf, 0x20u);
    }
  }
  switch(a3)
  {
    case 3uLL:
      if ((unint64_t)[v6 count] >= 2)
      {
        uint64_t v18 = [v6 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v20 = [v6 objectAtIndexedSubscript:1];
          objc_opt_class();
          char v21 = objc_opt_isKindOfClass();

          if (v21)
          {
            id v22 = [v6 objectAtIndexedSubscript:2];
            if (v22)
            {
              id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
              uint64_t v24 = [v6 objectAtIndexedSubscript:2];
              id v12 = (id)[v23 initWithDictionary:v24];
            }
            else
            {
              id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            }

            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_2;
            v40[3] = &unk_264C99260;
            objc_copyWeak(&v41, &location);
            uint64_t v35 = (void *)MEMORY[0x237DFB780](v40);
            [v12 setObject:v35 forKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];

            uint64_t v36 = [v6 objectAtIndexedSubscript:0];
            __int16 v37 = [v6 objectAtIndexedSubscript:1];
            -[CMContinuityCaptureRemoteCompositeDevice _postEvent:entity:data:](self, "_postEvent:entity:data:", v36, [v37 unsignedIntValue], v12);

            objc_destroyWeak(&v41);
            goto LABEL_23;
          }
        }
      }
      goto LABEL_26;
    case 2uLL:
      if ([v6 count] == 3)
      {
        uint64_t v25 = [v6 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if (v26)
        {
          __int16 v27 = [v6 objectAtIndexedSubscript:1];
          objc_opt_class();
          char v28 = objc_opt_isKindOfClass();

          if (v28)
          {
            id v29 = [v6 objectAtIndexedSubscript:0];
            unsigned int v30 = [v29 unsignedIntValue];

            id v31 = [v6 objectAtIndexedSubscript:1];
            unsigned int v32 = [v31 unsignedIntValue];

            v33 = [v6 objectAtIndexedSubscript:2];
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_59;
            v42[3] = &unk_264C992D8;
            objc_copyWeak(&v44, &location);
            uint64_t v34 = v30;
            id v12 = v33;
            id v43 = v12;
            [(CMContinuityCaptureRemoteCompositeDevice *)self _stopStream:v34 option:v32 completion:v42];

            objc_destroyWeak(&v44);
            goto LABEL_23;
          }
        }
      }
LABEL_26:
      BOOL v38 = 0;
      goto LABEL_25;
    case 1uLL:
      if ([v6 count] == 3)
      {
        id v8 = [v6 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v9 = objc_opt_isKindOfClass();

        if (v9)
        {
          uint64_t v10 = [v6 objectAtIndexedSubscript:1];
          objc_opt_class();
          char v11 = objc_opt_isKindOfClass();

          if (v11)
          {
            id v12 = [v6 objectAtIndexedSubscript:0];
            long long v13 = [v6 objectAtIndexedSubscript:1];
            unsigned int v14 = [v13 unsignedIntValue];

            long long v15 = [v6 objectAtIndexedSubscript:2];
            v45[0] = MEMORY[0x263EF8330];
            v45[1] = 3221225472;
            v45[2] = __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke;
            v45[3] = &unk_264C995C0;
            objc_copyWeak(&v48, &location);
            uint64_t v16 = v14;
            id v46 = v6;
            id v17 = v15;
            id v47 = v17;
            [(CMContinuityCaptureRemoteCompositeDevice *)self _startStream:v12 option:v16 completion:v45];

            objc_destroyWeak(&v48);
LABEL_23:

            break;
          }
        }
      }
      goto LABEL_26;
  }
  BOOL v38 = 1;
LABEL_25:
  objc_destroyWeak(&location);

  return v38;
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_cold_1(v4, a1, v6);
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    }
    id v8 = [WeakRetained eventQueue];
    [v8 notifyCompletion];
  }
}

uint64_t __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_59(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = WeakRetained;
    if (v5)
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
      id WeakRetained = v8;
    }
    id v6 = [WeakRetained eventQueue];
    [v6 notifyCompletion];
  }
  return MEMORY[0x270F9A758]();
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained eventQueue];
    [v2 notifyCompletion];

    id WeakRetained = v3;
  }
}

- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v18 = a3;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v9 = [(CMContinuityCaptureRemoteCompositeDevice *)self server];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4 == 4)
    {
      char v11 = [v9 localDevice];
      [v11 postEvent:v18 entity:4 data:v8];
    }
    else if (a4)
    {
      captureDeviceByEntityType = self->_captureDeviceByEntityType;
      long long v13 = [NSNumber numberWithInteger:a4];
      unsigned int v14 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v13];

      if (v14)
      {
        long long v15 = self->_captureDeviceByEntityType;
        uint64_t v16 = [NSNumber numberWithInteger:a4];
        id v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
        [v17 postEvent:v18 entity:a4 data:v8];
      }
    }
    else
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)self postEventOnAllEntities:v18 data:v8];
    }
  }
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  id v14 = v8;
  id v15 = v9;
  v16[1] = (id)a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) entity] == 3)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      id v17[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_2;
      v17[3] = &unk_264C9A228;
      id v18 = *(id *)(a1 + 40);
      id v4 = (void *)MEMORY[0x237DFB780](v17);
      uint64_t v5 = +[CMContinuityCapturePongSoundManager sharedInstance];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_3;
      void v13[3] = &unk_264C99300;
      objc_copyWeak(v16, v2);
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 56);
      id v14 = v6;
      v16[1] = v7;
      id v8 = v4;
      id v15 = v8;
      [v5 waitForPongCompletion:v13];

      objc_destroyWeak(v16);
      id v9 = v18;
    }
    else
    {
      id v9 = [WeakRetained eventQueue];
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
      v20[0] = v10;
      id v11 = MEMORY[0x237DFB780](v20, *(void *)(a1 + 40));
      v20[1] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:3];
      [v9 enqueueEventAction:1 args:v12];
    }
  }
}

uint64_t __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_2(uint64_t a1)
{
  id v2 = +[CMContinuityCapturePongSoundManager sharedInstance];
  [v2 releaseSystemPongAssertion];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_4;
    v7[3] = &unk_264C9A2C8;
    void v7[4] = v3;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = v5;
    uint64_t v10 = v6;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v4, v7);
  }
}

void __74__CMContinuityCaptureRemoteCompositeDevice_startStream_option_completion___block_invoke_4(uint64_t a1)
{
  v7[3] = *MEMORY[0x263EF8340];
  id v2 = +[CMContinuityCapturePongSoundManager sharedInstance];
  [v2 acquireSystemPongAssertion];

  id v3 = [*(id *)(a1 + 32) eventQueue];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 56), *(void *)(a1 + 40));
  v7[1] = v4;
  id v5 = (void *)MEMORY[0x237DFB780](*(void *)(a1 + 48));
  v7[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  [v3 enqueueEventAction:1 args:v6];
}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    char v26 = self;
    __int16 v27 = 2080;
    char v28 = "-[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:]";
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "entity"));
  long long v13 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v12];

  if (v13)
  {
    if (self->_state != 1)
    {
      if ([v8 entity] == 1 || objc_msgSend(v8, "entity") == 2)
      {
        activeVideoEntities = self->_activeVideoEntities;
        id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "entity"));
        [(NSMutableSet *)activeVideoEntities addObject:v17];
      }
      [(CMContinuityCaptureRemoteCompositeDevice *)self willChangeValueForKey:@"state"];
      uint64_t v18 = [v8 entity];
      uint64_t v19 = 4;
      if (v18 == 3) {
        uint64_t v19 = 2;
      }
      self->_state |= v19;
      [(CMContinuityCaptureRemoteCompositeDevice *)self didChangeValueForKey:@"state"];
      uint64_t v20 = [v13 entity];
      v24[0] = v8;
      id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, @"CMContinuityCaptureStateMachineEventDataKeyConfiguration", @"CMContinuityCaptureStateMachineEventDataKeyOption");
      v24[1] = v15;
      v23[2] = @"CMContinuityCaptureStateMachineEventDataCompletionBlock";
      char v21 = (void *)MEMORY[0x237DFB780](v9);
      v24[2] = v21;
      id v22 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
      [v13 postEvent:@"kCMContinuityCaptureEventStartStream" entity:v20 data:v22];

      goto LABEL_17;
    }
    id v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:]();
    }
  }
  else
  {
    id v14 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:]();
    }
  }

  if (v9)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-12785 userInfo:0];
    v9[2](v9, v15);
LABEL_17:
  }
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    __int16 v16 = 2080;
    id v17 = "-[CMContinuityCaptureRemoteCompositeDevice stopStream:option:completion:]";
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %d", buf, 0x1Cu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v12[2] = __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke;
  v12[3] = &unk_264C993F0;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = (id)a3;
  v14[2] = (id)a4;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id v16[2] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 48) == 3)
    {
      id v5 = +[CMContinuityCapturePongSoundManager sharedInstance];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      id v11[2] = __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke_2;
      v11[3] = &unk_264C993F0;
      objc_copyWeak(&v13, v2);
      long long v14 = *(_OWORD *)(a1 + 48);
      id v12 = *(id *)(a1 + 32);
      [v5 waitForPongCompletion:v11];

      objc_destroyWeak(&v13);
    }
    else
    {
      uint64_t v6 = [WeakRetained eventQueue];
      uint64_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      id v15 = v7;
      id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
      v16[0] = v8;
      id v9 = MEMORY[0x237DFB780](v16, *(void *)(a1 + 32));
      v16[1] = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:3];
      [v6 enqueueEventAction:2 args:v10];
    }
  }
}

void __73__CMContinuityCaptureRemoteCompositeDevice_stopStream_option_completion___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained eventQueue];
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 56), v5);
    v9[1] = v6;
    uint64_t v7 = (void *)MEMORY[0x237DFB780](*(void *)(a1 + 32));
    v9[2] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    [v4 enqueueEventAction:2 args:v8];
  }
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v21[2] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *))a5;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  uint64_t v10 = [NSNumber numberWithInteger:a3];
  id v11 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v10];

  if (v11)
  {
    if ((unint64_t)(a3 - 1) <= 1)
    {
      activeVideoEntities = self->_activeVideoEntities;
      id v13 = [NSNumber numberWithInteger:a3];
      [(NSMutableSet *)activeVideoEntities removeObject:v13];
    }
    if (a4) {
      goto LABEL_15;
    }
    [(CMContinuityCaptureRemoteCompositeDevice *)self willChangeValueForKey:@"state"];
    if (a3 == 3)
    {
      uint64_t v14 = -3;
    }
    else
    {
      if ([(NSMutableSet *)self->_activeVideoEntities count])
      {
LABEL_14:
        [(CMContinuityCaptureRemoteCompositeDevice *)self didChangeValueForKey:@"state"];
LABEL_15:
        uint64_t v17 = [v11 entity];
        v20[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
        __int16 v16 = [NSNumber numberWithUnsignedInteger:a4];
        v21[0] = v16;
        v20[1] = @"CMContinuityCaptureStateMachineEventDataCompletionBlock";
        __int16 v18 = (void *)MEMORY[0x237DFB780](v8);
        v21[1] = v18;
        int v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [v11 postEvent:@"kCMContinuityCaptureEventStopStream" entity:v17 data:v19];

        goto LABEL_16;
      }
      uint64_t v14 = -5;
    }
    self->_state &= v14;
    goto LABEL_14;
  }
  id v15 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CMContinuityCaptureRemoteCompositeDevice _startStream:option:completion:]();
  }

  if (v8)
  {
    __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-12785 userInfo:0];
    v8[2](v8, v16);
LABEL_16:
  }
}

- (void)updateSystemState
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v2 = 2080;
  id v3 = "-[CMContinuityCaptureRemoteCompositeDevice updateSystemState]";
  _os_log_debug_impl(&dword_235FC2000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ %s", v1, 0x16u);
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    int v19 = self;
    __int16 v20 = 2080;
    char v21 = "-[CMContinuityCaptureRemoteCompositeDevice setValueForControl:completion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CMContinuityCaptureRemoteCompositeDevice_setValueForControl_completion___block_invoke;
  block[3] = &unk_264C99D60;
  objc_copyWeak(&v16, &location);
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureRemoteCompositeDevice_setValueForControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  __int16 v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[3];
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
    id v7 = [v5 objectForKeyedSubscript:v6];

    if ([*(id *)(a1 + 32) entity] == 4)
    {
      id v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        int v16 = 138412546;
        uint64_t v17 = v9;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_INFO, "%@ system notification for %@", (uint8_t *)&v16, 0x16u);
      }

      id v11 = [*(id *)(a1 + 32) name];
      int v12 = [v11 isEqualToString:@"kCMContinuityCaptureControlDockedTrackingActive"];

      if (v12)
      {
        id v13 = objc_loadWeakRetained(v4 + 5);
        uint64_t v14 = [v13 localDevice];
        [v14 setValueForControl:*(void *)(a1 + 32) completion:0];
      }
    }
    else if (v7)
    {
      [v7 setValueForControl:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
    else
    {
      id v15 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(v2);
      }
    }
  }
}

- (BOOL)_avcaptureDeviceSupportsDockKit
{
  if (GestaltGetDeviceClass() != 1) {
    return 0;
  }
  return MEMORY[0x270F95FB8](@"s7nuHoZIYNoOHCqT9iyZkQ");
}

- (id)controlWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CMContinuityCaptureRemoteCompositeDevice *)self controls];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activeVideoEntities, 0);
  objc_storeStrong((id *)&self->_frameRateManager, 0);
  objc_storeStrong((id *)&self->_pendingEventToBePostedQueue, 0);
  objc_storeStrong((id *)&self->_pendingSidebandStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteClientDisconnectNotifiedByEntityType, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_captureDeviceByEntityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

void __70__CMContinuityCaptureRemoteCompositeDevice_handleAVCNegotiation_data___block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_235FC2000, v2, v3, "%{public}@ Invalid capture device", v4, v5, v6, v7, v8);
}

void __65__CMContinuityCaptureRemoteCompositeDevice_postEventAction_args___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ completion for %@", v6, 0x16u);
}

- (void)_startStream:option:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ Invalid capture device", v2, v3, v4, v5, v6);
}

- (void)_startStream:option:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%{public}@ In pause state, skip action", v2, v3, v4, v5, v6);
}

@end