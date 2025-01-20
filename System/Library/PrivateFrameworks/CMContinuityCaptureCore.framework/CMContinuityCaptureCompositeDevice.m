@interface CMContinuityCaptureCompositeDevice
- (BOOL)hasValidStreamState;
- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4;
- (BOOL)setupCaptureDevices;
- (BOOL)shouldSwitchConnection;
- (BOOL)validConnectionResetEventForData:(id)a3;
- (CMContinuityCaptureCompositeDevice)initWithDevice:(id)a3 provider:(id)a4;
- (CMContinuityCaptureEventQueue)eventQueue;
- (CMContinuityCaptureProvider)provider;
- (ContinuityCaptureDeviceClient)client;
- (NSArray)continuityCaptureDevices;
- (NSArray)controls;
- (NSDate)currentSessionActivationStartTime;
- (NSString)description;
- (NSString)publishTime;
- (id)controlWithName:(id)a3;
- (id)debugInfo;
- (int64_t)currentPreferredAvailableTransport;
- (unint64_t)currentSessionID;
- (unint64_t)lastSessionID;
- (void)_device:(id)a3 updatedValueForControl:(id)a4;
- (void)_handlePlacementStepSkipped;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)connectionInterrupted:(id)a3 forDevice:(id)a4;
- (void)deferDevice:(BOOL)a3;
- (void)device:(id)a3 updatedValueForControl:(id)a4;
- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4;
- (void)disableAutoTransportSwitch:(BOOL)a3;
- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4;
- (void)handleBatteryState:(id)a3;
- (void)handleRemoteSystemNotificationControl:(id)a3;
- (void)logConnectionSwitch:(id)a3;
- (void)logRemoteSessionSummary:(id)a3;
- (void)notifyTransportError:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performConnectionChangeEventIfApplicable:(id)a3;
- (void)performConnectionDisconnectEventIfApplicable:(id)a3;
- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5;
- (void)postEventOnAllEntities:(id)a3 data:(id)a4;
- (void)postValueChangeForControl:(id)a3;
- (void)registerStreamIntentForCaptureDevice:(id)a3 completion:(id)a4;
- (void)relayEvent:(id)a3;
- (void)relayUserDisconnect;
- (void)resetTransportDevice:(id)a3;
- (void)scheduleBatteryLevelNotification:(id)a3;
- (void)scheduleSystemPressureNotification:(id)a3;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setupControls;
- (void)setupSidebandMessageNotificationHandler;
- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5;
- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5;
- (void)terminateCompleteForDevice:(id)a3;
- (void)unregisterStreamIntentForCaptureDevice:(id)a3;
@end

@implementation CMContinuityCaptureCompositeDevice

- (CMContinuityCaptureCompositeDevice)initWithDevice:(id)a3 provider:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  v9 = [v6 deviceIdentifier];
  id v10 = [v8 stringWithFormat:@"com.apple.CMContinuityCompositeDevice.%@", v9];
  [v10 UTF8String];
  v11 = (void *)FigDispatchQueueCreateWithPriority();

  v42.receiver = self;
  v42.super_class = (Class)CMContinuityCaptureCompositeDevice;
  v12 = [(CMContinuityCaptureCompositeDevice *)&v42 init];
  if (v12
    && (v13 = [[CMContinuityCaptureNWClient alloc] initWithDevice:v6 queue:v11 taskDelegate:v12]) != 0)
  {
    v14 = v13;
    v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v12;
      __int16 v45 = 2114;
      v46 = v14;
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ create with client %{public}@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v12->_provider, v7);
    objc_storeStrong((id *)&v12->_client, v14);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    captureDeviceByEntityType = v12->_captureDeviceByEntityType;
    v12->_captureDeviceByEntityType = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cmControlByName = v12->_cmControlByName;
    v12->_cmControlByName = v18;

    objc_storeStrong((id *)&v12->_queue, v11);
    v20 = [[CMContinuityCaptureEventQueue alloc] initWithActionDelegate:v12 queue:v12->_queue];
    eventQueue = v12->_eventQueue;
    v12->_eventQueue = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connectionSwitchLogs = v12->_connectionSwitchLogs;
    v12->_connectionSwitchLogs = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    remoteSessionLogs = v12->_remoteSessionLogs;
    v12->_remoteSessionLogs = v24;

    uint64_t v26 = CMContinuityCaptureGetCurrentTimeString();
    publishTime = v12->_publishTime;
    v12->_publishTime = (NSString *)v26;

    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    streamingIntentEntities = v12->_streamingIntentEntities;
    v12->_streamingIntentEntities = v28;

    [(CMContinuityCaptureCompositeDevice *)v12 setupControls];
    if ([(CMContinuityCaptureCompositeDevice *)v12 setupCaptureDevices])
    {
      v30 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      v31 = [v30 queue];
      dispatch_assert_queue_not_V2(v31);

      v32 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      v33 = [v32 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__CMContinuityCaptureCompositeDevice_initWithDevice_provider___block_invoke;
      block[3] = &unk_264C99080;
      id v34 = v6;
      id v40 = v34;
      v35 = v12;
      v41 = v35;
      dispatch_async_and_wait(v33, block);

      objc_storeWeak(v35 + 11, v34);
      [v35 setupSidebandMessageNotificationHandler];
      v36 = v35;
    }
    else
    {
      v38 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v12;
        _os_log_impl(&dword_235FC2000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to setup capture devices", buf, 0xCu);
      }

      v36 = 0;
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

uint64_t __62__CMContinuityCaptureCompositeDevice_initWithDevice_provider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:@"deviceStatus" options:3 context:0];
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:@"placementStepSkipped" options:3 context:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 addObserver:v3 forKeyPath:@"terminationDeferred" options:3 context:0];
}

- (void)setupSidebandMessageNotificationHandler
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v3 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke;
  v7[3] = &unk_264C990D0;
  objc_copyWeak(&v8, &location);
  v4 = [(ContinuityCaptureDeviceClient *)self->_client device];
  v5 = [v4 deviceIdentifier];
  id v6 = [v5 UUIDString];
  [v3 addSidebandMessageNotificationHandler:v7 forDeviceIdentifier:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained[1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke_2;
    v11[3] = &unk_264C990A8;
    objc_copyWeak(&v15, v7);
    id v12 = v6;
    id v13 = v5;
    v14 = v9;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v15);
  }
}

void __77__CMContinuityCaptureCompositeDevice_setupSidebandMessageNotificationHandler__block_invoke_2(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id location = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_45;
  }
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
  if ([v3 integerValue] == 7
    && ([*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"];
      uint64_t v9 = [v8 unsignedLongValue];

      id v10 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained(location);
        id v12 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        id v70 = v11;
        __int16 v71 = 2114;
        v72 = v12;
        __int16 v73 = 2048;
        uint64_t v74 = v9;
        id v13 = "%@ Received remote termination complete for %{public}@ transportSessionID : %llx";
LABEL_15:
        _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0x20u);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
  }
  v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
  if ([v14 integerValue] != 3) {
    goto LABEL_18;
  }
  uint64_t v15 = [*(id *)(a1 + 32) objectForKey:@"ContinuityCaptureRapportClientEventNameKey"];
  if (!v15) {
    goto LABEL_18;
  }
  v16 = (void *)v15;
  v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientEventNameKey"];
  if (![v17 isEqualToString:@"kCMContinuityCaptureEventUserDisconnect"]
    || ([*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_18:
    goto LABEL_19;
  }
  v19 = (void *)v18;
  v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientTransportSessionIDKey"];
    uint64_t v9 = [v22 unsignedLongValue];

    id v10 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_loadWeakRetained(location);
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v70 = v11;
      __int16 v71 = 2114;
      v72 = v23;
      __int16 v73 = 2048;
      uint64_t v74 = v9;
      id v13 = "%@ Received user disconnect for %{public}@ transportSessionID : %llx";
      goto LABEL_15;
    }
LABEL_16:

    [WeakRetained[8] remoteSessionTerminationForIdentfier:v9];
    goto LABEL_45;
  }
LABEL_19:
  v24 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientMessageTypeKey"];
  if ([v24 integerValue] != 9
    || ([*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientSystemControlsKey"], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_45;
  }
  uint64_t v26 = (void *)v25;
  v27 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientSystemControlsKey"];
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();

  if (v28)
  {
    v53 = WeakRetained;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v55 = a1;
    id obj = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ContinuityCaptureRapportClientSystemControlsKey"];
    uint64_t v29 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (!v29) {
      goto LABEL_43;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v64;
    unint64_t v32 = 0x263F08000uLL;
    unint64_t v33 = 0x264C98000uLL;
    while (1)
    {
      uint64_t v34 = 0;
      uint64_t v56 = v30;
      do
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v63 + 1) + 8 * v34);
        v36 = *(void **)(v32 + 2344);
        uint64_t v37 = objc_opt_class();
        id v62 = 0;
        v38 = [v36 unarchivedObjectOfClass:v37 fromData:v35 error:&v62];
        id v39 = v62;
        if (v38)
        {
          id v40 = CMContinuityCaptureLog(0);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 138412546;
            id v70 = v41;
            __int16 v71 = 2114;
            v72 = v38;
            _os_log_impl(&dword_235FC2000, v40, OS_LOG_TYPE_DEFAULT, "%@ Recieved control %{public}@ update", buf, 0x16u);
          }
          objc_super v42 = [v38 name];
          if ([v42 isEqualToString:@"kCMContinuityCaptureControlBatteryLevel"])
          {
          }
          else
          {
            v43 = [v38 name];
            int v44 = [v43 isEqualToString:@"kCMContinuityCaptureControlBatteryState"];

            if (!v44) {
              goto LABEL_41;
            }
          }
          uint64_t v45 = v31;
          unint64_t v46 = v33;
          unint64_t v47 = v32;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v48 = [*(id *)(*(void *)(v55 + 48) + 16) allValues];
          uint64_t v49 = [v48 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v50; ++i)
              {
                if (*(void *)v59 != v51) {
                  objc_enumerationMutation(v48);
                }
                [*(id *)(*((void *)&v58 + 1) + 8 * i) setValueForControl:v38 completion:0];
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v58 objects:v67 count:16];
            }
            while (v50);
          }

          unint64_t v32 = v47;
          unint64_t v33 = v46;
          uint64_t v31 = v45;
          uint64_t v30 = v56;
        }
LABEL_41:

        ++v34;
      }
      while (v34 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (!v30)
      {
LABEL_43:

        WeakRetained = v53;
        break;
      }
    }
  }
LABEL_45:
}

- (void)relayUserDisconnect
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke;
  v4[3] = &unk_264C990F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_loadWeakRetained(v1);
      *(_DWORD *)buf = 138543618;
      id v17 = v4;
      __int16 v18 = 2082;
      v19 = "-[CMContinuityCaptureCompositeDevice relayUserDisconnect]_block_invoke";
      _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s", buf, 0x16u);
    }
    id v5 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    id v6 = [v5 activeSession];
    id v7 = [v6 shieldSessionID];

    if (v7)
    {
      id v8 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      uint64_t v9 = [v8 activeSession];
      id v10 = [v9 shieldSessionID];

      id v11 = [WeakRetained[8] device];
      objc_msgSend(v11, "relayUserDisconnectForTransport:reason:shieldSessionID:", objc_msgSend(WeakRetained, "currentPreferredAvailableTransport"), @"User disconnect", v10);

      id v12 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      id v13 = [v12 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke_17;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v15, v1);
      dispatch_async(v13, block);

      objc_destroyWeak(&v15);
    }
    else
    {
      id v10 = @"Unknown";
    }
  }
}

void __57__CMContinuityCaptureCompositeDevice_relayUserDisconnect__block_invoke_17(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    v2 = [WeakRetained[8] device];
    [v2 setUserDisconnected:1];

    WeakRetained = v3;
  }
}

- (void)relayEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0
    || ([v4 isEqualToString:@"kCMContinuityCaptureEventStateMismatched"] & 1) != 0)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__CMContinuityCaptureCompositeDevice_relayEvent___block_invoke;
    v7[3] = &unk_264C99120;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = self;
      __int16 v11 = 2080;
      id v12 = "-[CMContinuityCaptureCompositeDevice relayEvent:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s not allowed for %{public}@", location, 0x20u);
    }
  }
}

void __49__CMContinuityCaptureCompositeDevice_relayEvent___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543874;
      id v9 = v5;
      __int16 v10 = 2082;
      __int16 v11 = "-[CMContinuityCaptureCompositeDevice relayEvent:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s name %@", (uint8_t *)&v8, 0x20u);
    }
    id v7 = [WeakRetained[8] device];
    objc_msgSend(v7, "postEvent:entity:data:forTransport:", *(void *)(a1 + 32), 0, 0, objc_msgSend(WeakRetained, "currentPreferredAvailableTransport"));
  }
}

- (NSDate)currentSessionActivationStartTime
{
  return (NSDate *)[(ContinuityCaptureDeviceClient *)self->_client sessionActivationStartTime];
}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke;
  v13[3] = &unk_264C99120;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v14 = v5;
  uint64_t v6 = (void *)MEMORY[0x237DFB780](v13);
  client = self->_client;
  uint64_t v8 = [v5 entity];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_3;
  v10[3] = &unk_264C99170;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [(ContinuityCaptureDeviceClient *)client terminateEntity:v8 option:512 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained provider];
    if (v5)
    {
      uint64_t v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v2);
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v30 = v7;
        __int16 v31 = 2114;
        uint64_t v32 = v8;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate complete for %{public}@", buf, 0x16u);
      }
      id v9 = (void *)*((void *)v4 + 2);
      __int16 v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
      id v11 = [v9 objectForKey:v10];

      if (v11)
      {
        id v12 = (void *)*((void *)v4 + 2);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "entity"));
        [v12 removeObjectForKey:v13];

        id v14 = [v5 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_18;
        block[3] = &unk_264C99148;
        id v28 = *(id *)(a1 + 32);
        dispatch_async(v14, block);

        if (![*((id *)v4 + 2) count])
        {
          id v15 = (void *)*((void *)v4 + 9);
          if (v15)
          {
            dispatch_block_cancel(v15);
            v16 = (void *)*((void *)v4 + 9);
            *((void *)v4 + 9) = 0;
          }
          id v17 = +[CMContinuityCaptureDiscoverySession sharedInstance];
          __int16 v18 = [v17 queue];
          dispatch_assert_queue_not_V2(v18);

          v19 = +[CMContinuityCaptureDiscoverySession sharedInstance];
          uint64_t v20 = [v19 queue];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_2;
          v26[3] = &unk_264C99148;
          v26[4] = v4;
          dispatch_async_and_wait(v20, v26);

          char v21 = [*((id *)v4 + 3) objectForKeyedSubscript:@"kCMContinuityCaptureControlCameraHidden"];
          [v21 removeObserver:v4 forKeyPath:@"value" context:0];
          objc_storeWeak((id *)v4 + 11, 0);
          v22 = +[CMContinuityCaptureDiscoverySession sharedInstance];
          v23 = [*((id *)v4 + 8) device];
          v24 = [v23 deviceIdentifier];
          uint64_t v25 = [v24 UUIDString];
          [v22 removeSidebandMessageNotificationHandlerForDeviceIdentifier:v25];

          [*((id *)v4 + 8) invalidate];
          [v5 terminateCompleteForDevice:v4];
        }
      }
    }
  }
}

uint64_t __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceDeviceRemoval];
}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) device];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"deviceStatus" context:0];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) device];
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"placementStepSkipped" context:0];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 64) device];
  [v4 removeObserver:*(void *)(a1 + 32) forKeyPath:@"terminationDeferred" context:0];
}

void __65__CMContinuityCaptureCompositeDevice_terminateCompleteForDevice___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    dispatch_async(WeakRetained[1], *(dispatch_block_t *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (void)device:(id)a3 updatedValueForControl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)[v7 copy];
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__CMContinuityCaptureCompositeDevice_device_updatedValueForControl___block_invoke;
  v12[3] = &unk_264C99198;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureCompositeDevice_device_updatedValueForControl___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _device:*(void *)(a1 + 32) updatedValueForControl:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_device:(id)a3 updatedValueForControl:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 name];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A288];
  int v10 = [v7 isEqual:v9];

  if (!v10) {
    goto LABEL_14;
  }
  if (![v8 isEqualToString:@"kCMContinuityCaptureControlCameraHidden"])
  {
    __int16 v18 = @"kCMContinuityCaptureControlCameraReadyToUnhide";
    if ([v8 isEqualToString:@"kCMContinuityCaptureControlCameraReadyToUnhide"]
      || (__int16 v18 = @"kCMContinuityCaptureControlBatteryState",
          [v8 isEqualToString:@"kCMContinuityCaptureControlBatteryState"])
      || (__int16 v18 = @"kCMContinuityCaptureControlBatteryLevel",
          [v8 isEqualToString:@"kCMContinuityCaptureControlBatteryLevel"]))
    {
      id v11 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:v18];
      v19 = [v6 value];
      [v11 setValue:v19];

LABEL_12:
      id v12 = 0;
      id v13 = 0;
      goto LABEL_13;
    }
LABEL_14:
    id v11 = 0;
    goto LABEL_12;
  }
  id v11 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlCameraHidden"];
  id v12 = [v11 value];
  id v13 = [v6 value];
  if (([v12 isEqualToNumber:v13] & 1) == 0)
  {
    [v11 setValue:v13];
    if ([v13 isEqualToNumber:MEMORY[0x263EFFA80]])
    {
      id v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(ContinuityCaptureDeviceClient *)self->_client device];
        int v20 = 138543618;
        char v21 = self;
        __int16 v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ relay skip placement step message on device %@", (uint8_t *)&v20, 0x16u);
      }
      v16 = [(ContinuityCaptureDeviceClient *)self->_client device];
      [v16 setPlacementStepSkipped:1];

      id v17 = [(ContinuityCaptureDeviceClient *)self->_client device];
      objc_msgSend(v17, "relaySkipPlacementStepForTranport:", -[CMContinuityCaptureCompositeDevice currentPreferredAvailableTransport](self, "currentPreferredAvailableTransport"));
    }
  }
LABEL_13:
}

- (ContinuityCaptureDeviceClient)client
{
  return self->_client;
}

- (void)logConnectionSwitch:(id)a3
{
  connectionSwitchLogs = self->_connectionSwitchLogs;
  id v5 = a3;
  if ((unint64_t)[(NSMutableArray *)connectionSwitchLogs count] >= 0xB) {
    [(NSMutableArray *)self->_connectionSwitchLogs removeObjectAtIndex:0];
  }
  id v6 = self->_connectionSwitchLogs;
  id v7 = NSString;
  CMContinuityCaptureGetCurrentTimeString();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 stringWithFormat:@"%@ %@", v5, v9];

  [(NSMutableArray *)v6 addObject:v8];
}

- (void)resetTransportDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke;
  v7[3] = &unk_264C99080;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(queue, v7);
}

void __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke(int8x16_t *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[2].i64[0];
  id v3 = [*(id *)(a1[2].i64[1] + 64) device];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    id v4 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v5 = [v4 queue];
    dispatch_assert_queue_not_V2(v5);

    id v6 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v7 = [v6 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke_2;
    block[3] = &unk_264C99080;
    int8x16_t v14 = a1[2];
    id v8 = (id)v14.i64[0];
    int8x16_t v20 = vextq_s8(v14, v14, 8uLL);
    dispatch_async_and_wait(v7, block);

    objc_storeWeak((id *)(a1[2].i64[1] + 88), (id)a1[2].i64[0]);
  }
  objc_msgSend(*(id *)(a1[2].i64[1] + 64), "resetTransportDevice:", a1[2].i64[0], *(_OWORD *)&v14);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [*(id *)(a1[2].i64[1] + 16) allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13++) resetTransportDevice:a1[2].i64[0]];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v11);
  }
}

uint64_t __59__CMContinuityCaptureCompositeDevice_resetTransportDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"deviceStatus" context:0];

    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v4 removeObserver:*(void *)(a1 + 32) forKeyPath:@"placementStepSkipped" context:0];

    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v5 removeObserver:*(void *)(a1 + 32) forKeyPath:@"terminationDeferred" context:0];
  }
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"deviceStatus" options:3 context:0];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"placementStepSkipped" options:3 context:0];
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  return [v6 addObserver:v7 forKeyPath:@"terminationDeferred" options:3 context:0];
}

- (void)logRemoteSessionSummary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ((unint64_t)[(NSMutableArray *)self->_remoteSessionLogs count] >= 6) {
      [(NSMutableArray *)self->_remoteSessionLogs removeObjectAtIndex:0];
    }
    id v5 = [v4 dataUsingEncoding:4];
    if (v5)
    {
      id v8 = 0;
      id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:1 error:&v8];
      id v7 = v8;
      if (v6)
      {
        [(NSMutableArray *)self->_remoteSessionLogs addObject:v6];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
    id v5 = 0;
  }
}

- (void)setupControls
{
  id v3 = [CMContinuityCaptureControl alloc];
  uint64_t v4 = *MEMORY[0x263EF97B0];
  long long v12 = xmmword_2360593D0;
  uint64_t v13 = 0;
  id v5 = [(CMContinuityCaptureControl *)v3 initWithName:@"kCMContinuityCaptureControlSystemPressure" attributes:0 entity:4 minimumSupportedVersion:&v12 value:v4];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v5 forKeyedSubscript:@"kCMContinuityCaptureControlSystemPressure"];
  id v6 = [CMContinuityCaptureControl alloc];
  long long v12 = xmmword_2360593D0;
  uint64_t v13 = 0;
  id v7 = [(CMContinuityCaptureControl *)v6 initWithName:@"kCMContinuityCaptureControlBatteryLevel" attributes:0 entity:4 minimumSupportedVersion:&v12 value:&unk_26E96A798];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v7 forKeyedSubscript:@"kCMContinuityCaptureControlBatteryLevel"];
  id v8 = [CMContinuityCaptureControl alloc];
  long long v12 = xmmword_2360593D0;
  uint64_t v13 = 0;
  id v9 = [(CMContinuityCaptureControl *)v8 initWithName:@"kCMContinuityCaptureControlBatteryState" attributes:0 entity:4 minimumSupportedVersion:&v12 value:&unk_26E96A2A0];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v9 forKeyedSubscript:@"kCMContinuityCaptureControlBatteryState"];
  uint64_t v10 = [CMContinuityCaptureControl alloc];
  long long v12 = xmmword_2360593D0;
  uint64_t v13 = 0;
  uint64_t v11 = [(CMContinuityCaptureControl *)v10 initWithName:@"kCMContinuityCaptureControlDockedTrackingActive" attributes:0 entity:4 minimumSupportedVersion:&v12 value:MEMORY[0x263EFFA80]];
  [(NSMutableDictionary *)self->_cmControlByName setObject:v11 forKeyedSubscript:@"kCMContinuityCaptureControlDockedTrackingActive"];
}

- (NSArray)controls
{
  return (NSArray *)[(NSMutableDictionary *)self->_cmControlByName allValues];
}

- (NSArray)continuityCaptureDevices
{
  return (NSArray *)[(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
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

- (BOOL)setupCaptureDevices
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [(ContinuityCaptureDeviceClient *)self->_client device];
  uint64_t v4 = [v3 capabilities];
  id v5 = [v4 devicesCapabilities];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v28;
    *(void *)&long long v7 = 138543618;
    long long v26 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v11, "entityType", v26) == 1)
        {
          uint64_t v12 = [[CMContinuityCaptureVideoDevice alloc] initWithCapabilities:v11 compositeDelegate:self];
          if (v12)
          {
            p_super = &v12->super.super;
            long long v14 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              uint64_t v32 = self;
              __int16 v33 = 2114;
              uint64_t v34 = p_super;
              _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Created %{public}@", buf, 0x16u);
            }

            captureDeviceByEntityType = self->_captureDeviceByEntityType;
            long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "entityType"));
            [(NSMutableDictionary *)captureDeviceByEntityType setObject:p_super forKeyedSubscript:v16];

            goto LABEL_14;
          }
        }
        else
        {
          [v11 entityType];
        }
        p_super = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = [v11 entityType];
          *(_DWORD *)buf = v26;
          uint64_t v32 = self;
          __int16 v33 = 1024;
          LODWORD(v34) = v17;
          _os_log_impl(&dword_235FC2000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to create capture device for entity %d", buf, 0x12u);
        }
LABEL_14:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v18 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A2B8];
  if (v18)
  {
    v19 = (void *)v18;
    int8x16_t v20 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A288];

    if (v20)
    {
      char v21 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A288];
      uint64_t v22 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A2B8];
      [v22 setCompanionDevice:v21];

      v23 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A2B8];
      uint64_t v24 = [(NSMutableDictionary *)self->_captureDeviceByEntityType objectForKeyedSubscript:&unk_26E96A288];
      [v24 setCompanionDevice:v23];
    }
  }
  return [(NSMutableDictionary *)self->_captureDeviceByEntityType count] != 0;
}

- (void)connectionInterrupted:(id)a3 forDevice:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 code] && (objc_msgSend(v7, "terminationDeferred") & 1) == 0)
  {
    uint64_t v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v14 = self;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection Interrupted, error %{public}@", buf, 0x16u);
    }

    if ([v6 code] == -1012)
    {
      [(CMContinuityCaptureCompositeDevice *)self relayEvent:@"kCMContinuityCaptureEventStateMismatched"];
    }
    else
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", mach_continuous_time(), @"CMContinuityCaptureStateMachineEventDataKeyPostTime");
      uint64_t v12 = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      [(CMContinuityCaptureCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventConnectionDisconnect" entity:0 data:v10];
    }
  }
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  id v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v7];

  if (v8) {
    [v8 handleAVCNegotiation:a3 data:v9];
  }
}

- (int64_t)currentPreferredAvailableTransport
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(ContinuityCaptureDeviceClient *)self->_client device];
  char v4 = [v3 wired];

  if (v4) {
    return 2;
  }
  id v6 = [(ContinuityCaptureDeviceClient *)self->_client device];
  unsigned int v7 = [v6 wifiP2pActive];

  return v7;
}

- (void)notifyTransportError:(id)a3
{
  v26[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && [v4 code] != -1010 && objc_msgSend(v4, "code") != -1011 && objc_msgSend(v4, "code") == -1005)
  {
    id v5 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    v25[0] = @"kContinuityCaptureNotificationKeyTitle";
    v25[1] = @"kContinuityCaptureNotificationKeyBody";
    v26[0] = @"MULTIDEVICE_NOTIFICATION_TITLE";
    v26[1] = @"MULTIDEVICE_NOTIFICATION_BODY";
    v25[2] = @"kContinuityCaptureNotificationKeyBodyArgs";
    v24[0] = &stru_26E95AB60;
    v23 = [(CMContinuityCaptureCompositeDevice *)self client];
    uint64_t v22 = [v23 device];
    char v21 = [v22 deviceName];
    v24[1] = v21;
    int8x16_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    v26[2] = v20;
    v25[3] = @"kContinuityCaptureNotificationKeyIdentifier";
    id v6 = NSString;
    v19 = [(CMContinuityCaptureCompositeDevice *)self client];
    uint64_t v18 = [v19 device];
    uint64_t v17 = [v18 deviceIdentifier];
    id v16 = [v17 UUIDString];
    __int16 v15 = [v6 stringWithFormat:@"%@%@", @"CMContinuityCaptureMultiDeviceNotification", v16];
    v26[3] = v15;
    v26[4] = MEMORY[0x263EFFA80];
    v25[4] = @"kContinuityCaptureNotificationKeyOneTime";
    v25[5] = @"kContinuityCaptureNotificationKeyDeviceModel";
    long long v14 = [(CMContinuityCaptureCompositeDevice *)self client];
    unsigned int v7 = [v14 device];
    uint64_t v8 = [v7 deviceModel];
    void v26[5] = v8;
    v25[6] = @"kContinuityCaptureNotificationKeyDeviceIdentifier";
    id v9 = [(CMContinuityCaptureCompositeDevice *)self client];
    uint64_t v10 = [v9 device];
    uint64_t v11 = [v10 deviceIdentifier];
    uint64_t v12 = [v11 UUIDString];
    v26[6] = v12;
    long long v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:7];
    [v5 scheduleNotification:2 data:v13];

    [(CMContinuityCaptureCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventStreamDisableForMultipleStream" entity:0 data:0];
  }
}

- (void)registerStreamIntentForCaptureDevice:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = self;
    __int16 v19 = 2080;
    int8x16_t v20 = "-[CMContinuityCaptureCompositeDevice registerStreamIntentForCaptureDevice:completion:]";
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke;
  v12[3] = &unk_264C991E8;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = a1 + 6;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    id v5 = [WeakRetained client];
    id v6 = [v5 device];
    id v7 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v27 = 0;
    char v8 = objc_msgSend(v4, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v6, 0, 1, objc_msgSend(v7, "isSessionInitiatedOnCommunalDevice"), &v27);
    id v9 = v27;

    if (v8)
    {
      id v10 = (void *)[WeakRetained currentPreferredAvailableTransport];
      if (v10)
      {
        BOOL v11 = [WeakRetained[7] count] == 0;
        id v12 = WeakRetained[7];
        id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[4], "entity"));
        [v12 addObject:v13];

        if (v11)
        {
          id v22 = WeakRetained[8];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_64;
          v23[3] = &unk_264C991C0;
          objc_copyWeak(v26, v2);
          id v24 = a1[4];
          v26[1] = v10;
          id v25 = a1[5];
          [v22 setPreferredTransport:v10 resetConnection:0 completion:v23];

          objc_destroyWeak(v26);
        }
        else
        {
          (*((void (**)(void))a1[5] + 2))();
        }
      }
      else
      {
        __int16 v19 = (void (**)(id, void *))a1[5];
        int8x16_t v20 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870185 userInfo:0];
        v19[2](v19, v20);
      }
    }
    else
    {
      id v14 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2114;
        id v31 = v9;
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ startSessionWithDevice returned %{public}@", buf, 0x16u);
      }
      [WeakRetained notifyTransportError:v9];
      id v16 = (void (**)(id, void *))a1[5];
      id v17 = objc_alloc(MEMORY[0x263F087E8]);
      if (v9) {
        uint64_t v18 = [v9 code];
      }
      else {
        uint64_t v18 = -536870185;
      }
      __int16 v21 = (void *)[v17 initWithDomain:@"ContinuityCapture" code:v18 userInfo:0];
      v16[2](v16, v21);
    }
  }
}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 && [a2 code])
    {
      id v6 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_loadWeakRetained(v4);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        id v19 = v7;
        __int16 v20 = 2114;
        uint64_t v21 = v8;
        __int16 v22 = 1024;
        int v23 = v9;
        __int16 v24 = 2114;
        id v25 = a2;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice setPreferredTransport %{public}@ transport %d error %{public}@", buf, 0x26u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v10 = objc_loadWeakRetained(WeakRetained + 15);
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 56);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_65;
        v14[3] = &unk_264C991C0;
        objc_copyWeak(v17, v4);
        id v12 = *(id *)(a1 + 32);
        id v13 = *(void **)(a1 + 56);
        id v15 = v12;
        v17[1] = v13;
        id v16 = *(id *)(a1 + 40);
        [v10 registerStreamIntentForDevice:WeakRetained forTransportType:v11 completion:v14];

        objc_destroyWeak(v17);
      }
    }
  }
}

void __86__CMContinuityCaptureCompositeDevice_registerStreamIntentForCaptureDevice_completion___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a2 && [a2 code])
  {
    id v4 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      id v15 = WeakRetained;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = a2;
      _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice %{public}@ transport %d error %{public}@", buf, 0x26u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (v8)
    {
      id v13 = v8;
      uint64_t v9 = [v8[8] device];
      id v10 = [v9 magicStateMonitor];
      [v10 holdMagicStateAssertion:1];

      uint64_t v11 = [v13[8] device];
      id v12 = [v11 magicStateMonitor];
      [v12 releaseMagicStateAssertion:2 stateTransitionCoolDownTime:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v8 = v13;
    }
  }
}

- (void)unregisterStreamIntentForCaptureDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2080;
    uint64_t v17 = "-[CMContinuityCaptureCompositeDevice unregisterStreamIntentForCaptureDevice:]";
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %{public}@", buf, 0x20u);
  }

  uint64_t v6 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  uint64_t v7 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  char v8 = [v6 isEqual:dispatch_get_specific(v7)] ^ 1;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CMContinuityCaptureCompositeDevice_unregisterStreamIntentForCaptureDevice___block_invoke;
  block[3] = &unk_264C99210;
  void block[4] = self;
  id v12 = v4;
  char v13 = v8;
  id v10 = v4;
  dispatch_async_and_wait(queue, block);
}

void __77__CMContinuityCaptureCompositeDevice_unregisterStreamIntentForCaptureDevice___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([*(id *)(*(void *)(a1 + 32) + 56) count] == 1
      && (id v4 = *(void **)(*(void *)(a1 + 32) + 56),
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "entity")),
          id v5 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v4) = [v4 containsObject:v5],
          v5,
          v4))
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));

      uint64_t v7 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(unsigned __int8 *)(a1 + 48);
        int v15 = 138543874;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        __int16 v18 = "-[CMContinuityCaptureCompositeDevice unregisterStreamIntentForCaptureDevice:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = v9;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s syncOnSessionQueue:%d", (uint8_t *)&v15, 0x1Cu);
      }

      if (v6) {
        [v6 unregisterStreamIntentForDevice:*(void *)(a1 + 32)];
      }
      id v10 = [*(id *)(*(void *)(a1 + 32) + 64) device];
      uint64_t v11 = [v10 magicStateMonitor];
      [v11 releaseMagicStateAssertion:1 stateTransitionCoolDownTime:5];
    }
    else
    {
      id v6 = v3;
    }
    id v12 = *(void **)(a1 + 40);
    char v13 = *(void **)(*(void *)(a1 + 32) + 56);
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "entity"));
    [v13 removeObject:v14];
  }
}

- (void)disableAutoTransportSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "Off";
    if (v3) {
      id v6 = "On";
    }
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2080;
    id v10 = v6;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ turn %s transport switch guard", (uint8_t *)&v7, 0x16u);
  }

  atomic_store(v3, (unsigned __int8 *)&self->autoTransportSwitchDisabled);
}

- (BOOL)shouldSwitchConnection
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->autoTransportSwitchDisabled);
  if (v3)
  {
    id v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      int v20 = self;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ skip transport switch since auto switch is disabled", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    id v4 = [(ContinuityCaptureDeviceClient *)self->_client device];
    objc_sync_enter(v4);
    id v5 = [(ContinuityCaptureDeviceClient *)self->_client device];
    id v6 = [v5 activeStreams];

    objc_sync_exit(v4);
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(ContinuityCaptureDeviceClient *)self->_client preferredTransport];
    int64_t v9 = [(CMContinuityCaptureCompositeDevice *)self currentPreferredAvailableTransport];
    if (v7)
    {
      int v10 = v9;
      if (v8 == v9)
      {
        uint64_t v11 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543618;
          int v20 = self;
          __int16 v21 = 1024;
          LODWORD(v22) = v8;
          id v12 = "%{public}@ Transport status unchanged %d";
          char v13 = v11;
          uint32_t v14 = 18;
LABEL_15:
          _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
        }
      }
      else
      {
        BOOL v16 = v9 == 0;
        uint64_t v11 = CMContinuityCaptureLog(2);
        BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (!v16)
        {
          if (v17)
          {
            int v19 = 138544130;
            int v20 = self;
            __int16 v21 = 2048;
            unint64_t v22 = [(CMContinuityCaptureCompositeDevice *)self currentSessionID];
            __int16 v23 = 1024;
            int v24 = v8;
            __int16 v25 = 1024;
            int v26 = v10;
            _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Transport Switch from %d -> %d", (uint8_t *)&v19, 0x22u);
          }
          BOOL v15 = 1;
          goto LABEL_17;
        }
        if (v17)
        {
          int v19 = 138543362;
          int v20 = self;
          id v12 = "%{public}@  No valid transport available for switch";
          char v13 = v11;
          uint32_t v14 = 12;
          goto LABEL_15;
        }
      }
      BOOL v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (void)deferDevice:(BOOL)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v22[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
    v22[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
    v23[0] = &unk_26E96A2D0;
    id v4 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
    v23[1] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    [(CMContinuityCaptureCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventRemoteClientDisconnect" entity:0 data:v5];

    int v19 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    id v6 = [v19 activeSession];
    uint64_t v7 = [v6 device];
    uint64_t v8 = [v7 deviceIdentifier];
    int64_t v9 = [v8 UUIDString];
    [(CMContinuityCaptureCompositeDevice *)self client];
    v11 = int v10 = self;
    id v12 = [v11 device];
    char v13 = [v12 deviceIdentifier];
    uint32_t v14 = [v13 UUIDString];
    int v15 = [v9 isEqualToString:v14];

    if (!v15) {
      return;
    }
    BOOL v16 = [(CMContinuityCaptureCompositeDevice *)v10 client];
    [v16 abortRemoteSession];
  }
  else
  {
    if (self->_undeferBlockForSidecarClient) {
      return;
    }
    v20[0] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
    BOOL v16 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
    v21[0] = v16;
    v20[1] = @"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset";
    BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CMContinuityCaptureCompositeDevice hasValidStreamState](self, "hasValidStreamState"));
    v21[1] = v17;
    __int16 v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    [(CMContinuityCaptureCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventConnectionDisconnect" entity:0 data:v18];
  }
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
  id v17[2] = __85__CMContinuityCaptureCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
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

void __85__CMContinuityCaptureCompositeDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v67 = self;
    __int16 v68 = 2080;
    v69 = "-[CMContinuityCaptureCompositeDevice _observeValueForKeyPath:ofObject:change:context:]";
    __int16 v70 = 2112;
    id v71 = v9;
    _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![v9 isEqualToString:@"currentState"])
  {
    if ([v9 isEqualToString:@"deviceStatus"]
      && [(CMContinuityCaptureCompositeDevice *)self shouldSwitchConnection])
    {
      v63[0] = @"CMContinuityCaptureStateMachineEventDataKeySessionID";
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ContinuityCaptureDeviceClient currentSessionID](self->_client, "currentSessionID"));
      v64[0] = v37;
      v63[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
      v38 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
      v64[1] = v38;
      id v39 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
      [(CMContinuityCaptureCompositeDevice *)self postEvent:@"kCMContinuityCaptureEventConnectionChange" entity:0 data:v39];

LABEL_51:
      unint64_t v47 = 0;
      BOOL v17 = 0;
      int v26 = 0;
      long long v28 = 0;
      goto LABEL_52;
    }
    if (![v9 isEqualToString:@"terminationDeferred"])
    {
      if ([v9 isEqualToString:@"placementStepSkipped"])
      {
        v48 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        int v49 = [v48 BOOLValue];

        if (v49) {
          [(CMContinuityCaptureCompositeDevice *)self _handlePlacementStepSkipped];
        }
      }
      goto LABEL_51;
    }
    uint64_t v40 = *MEMORY[0x263F081B8];
    id v41 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if ([v41 BOOLValue])
    {
      objc_super v42 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      char v43 = [v42 BOOLValue];

      if ((v43 & 1) == 0)
      {
        int v44 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v67 = self;
          _os_log_impl(&dword_235FC2000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ Defer device", buf, 0xCu);
        }

        uint64_t v45 = self;
        uint64_t v46 = 1;
        goto LABEL_50;
      }
    }
    else
    {
    }
    uint64_t v50 = [v10 objectForKeyedSubscript:v40];
    if ([v50 BOOLValue])
    {

      goto LABEL_51;
    }
    uint64_t v51 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    int v52 = [v51 BOOLValue];

    if (!v52) {
      goto LABEL_51;
    }
    v53 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v67 = self;
      _os_log_impl(&dword_235FC2000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Un-Defer device", buf, 0xCu);
    }

    uint64_t v45 = self;
    uint64_t v46 = 0;
LABEL_50:
    [(CMContinuityCaptureCompositeDevice *)v45 deferDevice:v46];
    goto LABEL_51;
  }
  id v12 = a6;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  id v58 = v12;
  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "entity"));
  id v15 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKey:v14];

  if (!v15)
  {
LABEL_37:
    BOOL v17 = 0;
    goto LABEL_38;
  }
  uint64_t v16 = *MEMORY[0x263F081B8];
  BOOL v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if (v17)
  {
    id v18 = [v10 objectForKeyedSubscript:v16];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v20 = *MEMORY[0x263F081C8];
      uint64_t v21 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      if (v21)
      {
        unint64_t v22 = (void *)v21;
        __int16 v23 = [v10 objectForKeyedSubscript:v20];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();

        if (v24)
        {
          __int16 v25 = [v10 objectForKeyedSubscript:v16];
          int v26 = [v25 name];

          uint64_t v27 = [v10 objectForKeyedSubscript:v20];
          long long v28 = [v27 name];

          id v29 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            v67 = self;
            __int16 v68 = 2112;
            v69 = v28;
            __int16 v70 = 2112;
            id v71 = v26;
            __int16 v72 = 2112;
            id v73 = v58;
            _os_log_impl(&dword_235FC2000, v29, OS_LOG_TYPE_INFO, "%{public}@ Change of state from %@ to %@ for %@", buf, 0x2Au);
          }

          __int16 v30 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
          BOOL v17 = v30;
          if (v30)
          {
            uint64_t v56 = self;
            if ([v30 count])
            {
              id v54 = v10;
              id v55 = v9;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id obj = v17;
              uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v60;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v60 != v33) {
                      objc_enumerationMutation(obj);
                    }
                    id v35 = *(id *)(*((void *)&v59 + 1) + 8 * i);
                    if (v35 != v58)
                    {
                      if ((([v28 isEqualToString:@"kCMContinuityCaptureStatePaused"] & 1) != 0
                         || [v28 isEqualToString:@"kCMContinuityCaptureStateDisabled"])&& ((uint64_t v36 = @"kCMContinuityCaptureEventAssociatedDeviceResume", (objc_msgSend(v26, "isEqualToString:", @"kCMContinuityCaptureStateStreaming", v54, v55) & 1) != 0)|| (uint64_t v36 = @"kCMContinuityCaptureEventAssociatedDeviceResume", (objc_msgSend(v26, "isEqualToString:", @"kCMContinuityCaptureStateInit") & 1) != 0))|| (uint64_t v36 = @"kCMContinuityCaptureEventAssociatedDevicePause", objc_msgSend(v26, "isEqualToString:", @"kCMContinuityCaptureStatePaused", v54, v55)))
                      {
                        -[CMContinuityCaptureCompositeDevice postEvent:entity:data:](v56, "postEvent:entity:data:", v36, [v35 entity], 0);
                      }
                    }
                  }
                  uint64_t v32 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
                }
                while (v32);
              }
              BOOL v17 = obj;

              id v10 = v54;
              id v9 = v55;
            }
          }
          goto LABEL_39;
        }
      }
    }
    goto LABEL_37;
  }
LABEL_38:
  int v26 = 0;
  long long v28 = 0;
LABEL_39:
  unint64_t v47 = v58;
LABEL_52:
}

- (CMContinuityCaptureEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (unint64_t)lastSessionID
{
  return self->_lastSessionID;
}

- (BOOL)hasValidStreamState
{
  id v3 = [(CMContinuityCaptureCompositeDevice *)self client];
  id v4 = [v3 device];
  if ([v4 hasStreamIntent])
  {
    id v5 = [(CMContinuityCaptureCompositeDevice *)self client];
    id v6 = [v5 device];
    if ([v6 userDisconnected])
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v8 = [(CMContinuityCaptureCompositeDevice *)self client];
      id v9 = [v8 device];
      id v10 = [v9 capabilities];
      if (v10)
      {
        id v11 = [(CMContinuityCaptureCompositeDevice *)self client];
        id v12 = [v11 device];
        [v12 capabilities];
        char v13 = v15 = v8;
        char v7 = [v13 userDisabled];

        uint64_t v8 = v15;
      }
      else
      {
        char v7 = 1;
      }
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7 ^ 1;
}

- (BOOL)validConnectionResetEventForData:(id)a3
{
  id v4 = a3;
  if (![(ContinuityCaptureDeviceClient *)self->_client lastActivationTime]) {
    goto LABEL_7;
  }
  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyPostTime"];
    if (v5)
    {
      id v6 = (void *)v5;
      char v7 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyPostTime"];
      unint64_t v8 = [v7 unsignedLongLongValue];
      unint64_t v9 = [(ContinuityCaptureDeviceClient *)self->_client lastActivationTime];

      if (v8 < v9) {
        goto LABEL_7;
      }
    }
  }
  if (![(CMContinuityCaptureCompositeDevice *)self hasValidStreamState])
  {
LABEL_7:
    BOOL v11 = 0;
  }
  else
  {
    id v10 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyPostTime"];
    BOOL v11 = v10 != 0;
  }
  return v11;
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    __int16 v20 = 2080;
    uint64_t v21 = "-[CMContinuityCaptureCompositeDevice postEvent:entity:data:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@ %ld", buf, 0x2Au);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke;
  block[3] = &unk_264C99238;
  objc_copyWeak(v18, (id *)buf);
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  v18[1] = (id)a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventTerminate"])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2;
      block[3] = &unk_264C990F8;
      objc_copyWeak(&v46, v2);
      dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
      uint64_t v5 = (void *)*((void *)WeakRetained + 9);
      *((void *)WeakRetained + 9) = v4;

      dispatch_time_t v6 = dispatch_time(0, 4000000000);
      dispatch_after(v6, *((dispatch_queue_t *)WeakRetained + 1), *((dispatch_block_t *)WeakRetained + 9));
      objc_destroyWeak(&v46);
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventUserDisconnect"])
    {
      char v7 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      id v8 = [v7 queue];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_3;
      v43[3] = &unk_264C990F8;
      objc_copyWeak(&v44, v2);
      dispatch_async(v8, v43);

      id v9 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = WeakRetained;
        _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ User Disconnect", buf, 0xCu);
      }

      objc_destroyWeak(&v44);
      goto LABEL_8;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventStreamDisableForWifiContention"])
    {
      id v13 = [*(id *)(a1 + 40) client];
      id v14 = [v13 device];
      int v15 = [v14 wired];

      if (v15)
      {
        uint64_t v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543362;
          id v48 = v17;
          _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip kCMContinuityCaptureEventStreamDisableForWifiContention since we have active session on USB", buf, 0xCu);
        }
        goto LABEL_8;
      }
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventConnectionChange"])
    {
      id v18 = *(void **)(a1 + 48);
      if (v18
        && ([v18 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"], v19 = objc_claimAutoreleasedReturnValue(), BOOL v20 = v19 == 0, v19, !v20)|| objc_msgSend(WeakRetained, "shouldSwitchConnection")&& (objc_msgSend(WeakRetained, "validConnectionResetEventForData:", *(void *)(a1 + 48)) & 1) != 0)
      {
LABEL_31:
        if (*(void *)(a1 + 64))
        {
          id v10 = [WeakRetained eventQueue];
          v51[0] = *(void *)(a1 + 32);
          long long v28 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
          v51[1] = v28;
          uint64_t v29 = MEMORY[0x263EFFA78];
          if (*(void *)(a1 + 48)) {
            uint64_t v29 = *(void *)(a1 + 48);
          }
          v51[2] = v29;
          __int16 v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
          [v10 enqueueEventAction:3 args:v30];
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v10 = objc_msgSend(*((id *)WeakRetained + 2), "allKeys", 0);
          uint64_t v31 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v40;
            uint64_t v33 = MEMORY[0x263EFFA78];
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v40 != v32) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v35 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                uint64_t v36 = [WeakRetained eventQueue];
                v52[0] = *(void *)(a1 + 32);
                v52[1] = v35;
                uint64_t v37 = *(void *)(a1 + 48);
                if (!v37) {
                  uint64_t v37 = v33;
                }
                v52[2] = v37;
                v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];
                [v36 enqueueEventAction:3 args:v38];
              }
              uint64_t v31 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
            }
            while (v31);
          }
        }
        goto LABEL_44;
      }
    }
    else
    {
      if (([*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventConnectionDisconnect"] & 1) == 0
        && ![*(id *)(a1 + 32) isEqualToString:@"kCMContinuityCaptureEventStreamInterrupted"])
      {
        goto LABEL_31;
      }
      uint64_t v21 = [*((id *)WeakRetained + 8) device];
      objc_sync_enter(v21);
      __int16 v22 = [*((id *)WeakRetained + 8) device];
      id v23 = [v22 activeStreams];

      objc_sync_exit(v21);
      BOOL v24 = ![v23 count]
         || ([WeakRetained validConnectionResetEventForData:*(void *)(a1 + 48)] & 1) == 0;
      int64_t v25 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"];
      if (v25)
      {
        uint64_t v26 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"];
        int v27 = [v26 BOOLValue];

        if ((v27 | !v24) == 1) {
          goto LABEL_31;
        }
      }
      else
      {

        if (!v24) {
          goto LABEL_31;
        }
      }
    }
LABEL_8:
    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_loadWeakRetained(v2);
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v48 = v11;
      __int16 v49 = 2114;
      uint64_t v50 = v12;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@  skip event %{public}@", buf, 0x16u);
    }
LABEL_44:
  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    id v23 = WeakRetained;
    _os_log_impl(&dword_235FC2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ termination timeout", buf, 0xCu);
  }
  dispatch_block_t v4 = (id *)(a1 + 32);
  uint64_t v5 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v6 = v5;
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [v5[2] allKeys];
    uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v6[2] objectForKeyedSubscript:v11];
          id v13 = [v12 queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_73;
          block[3] = &unk_264C99120;
          objc_copyWeak(&v16, v4);
          void block[4] = v11;
          dispatch_async(v13, block);

          objc_destroyWeak(&v16);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_73(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_block_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2_74;
    v6[3] = &unk_264C99120;
    objc_copyWeak(&v7, v2);
    v6[4] = *(void *)(a1 + 32);
    [v5 terminateComplete:v6];

    objc_destroyWeak(&v7);
  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_2_74(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_block_t v4 = WeakRetained;
    id v3 = [WeakRetained[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 terminateCompleteForDevice:v3];

    id WeakRetained = v4;
  }
}

void __60__CMContinuityCaptureCompositeDevice_postEvent_entity_data___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained[8] device];
    [v2 setUserDisconnected:1];

    id WeakRetained = v3;
  }
}

- (void)performConnectionDisconnectEventIfApplicable:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = self;
    __int16 v38 = 2080;
    long long v39 = "-[CMContinuityCaptureCompositeDevice performConnectionDisconnectEventIfApplicable:]";
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s data %@", buf, 0x20u);
  }

  int64_t v6 = [(CMContinuityCaptureCompositeDevice *)self currentPreferredAvailableTransport];
  id v7 = [(ContinuityCaptureDeviceClient *)self->_client device];
  objc_sync_enter(v7);
  uint64_t v8 = [(ContinuityCaptureDeviceClient *)self->_client device];
  uint64_t v9 = [v8 activeStreams];

  objc_sync_exit(v7);
  uint64_t v10 = [v9 count];
  if (!v4) {
    goto LABEL_16;
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"];
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset"];
  int v13 = [v12 BOOLValue];
  int v14 = v6 ? v13 : 0;

  if (v14)
  {
    int v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = self;
      __int16 v38 = 2080;
      long long v39 = "-[CMContinuityCaptureCompositeDevice performConnectionDisconnectEventIfApplicable:]";
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s force reset", buf, 0x16u);
    }
  }
  else
  {
LABEL_16:
    if (!v10
      || ((v16 = [(CMContinuityCaptureCompositeDevice *)self validConnectionResetEventForData:v4], v6)? (BOOL v17 = v16): (BOOL v17 = 0), !v17))
    {
      id v23 = [(CMContinuityCaptureCompositeDevice *)self eventQueue];
      [v23 notifyCompletion];
      goto LABEL_30;
    }
  }
  long long v18 = +[CMContinuityCaptureSessionStateManager sharedInstance];
  long long v19 = [(CMContinuityCaptureCompositeDevice *)self client];
  long long v20 = [v19 device];
  uint64_t v21 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  id v32 = 0;
  char v22 = objc_msgSend(v18, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v20, v6, 1, objc_msgSend(v21, "isSessionInitiatedOnCommunalDevice"), &v32);
  id v23 = v32;

  if (v22)
  {
    v34[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
    v34[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
    v35[0] = &unk_26E96A2D0;
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
    v35[1] = v24;
    int64_t v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [(CMContinuityCaptureCompositeDevice *)self _postEvent:@"kCMContinuityCaptureEventRemoteClientDisconnect" entity:0 data:v25];

    if ([(CMContinuityCaptureCompositeDevice *)self currentPreferredAvailableTransport])
    {
      client = self->_client;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __83__CMContinuityCaptureCompositeDevice_performConnectionDisconnectEventIfApplicable___block_invoke;
      v30[3] = &unk_264C99260;
      objc_copyWeak(&v31, &location);
      [(ContinuityCaptureDeviceClient *)client resetSession:v30];
      objc_destroyWeak(&v31);
    }
    else
    {
      long long v28 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = self;
        _os_log_impl(&dword_235FC2000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ No valid transport for reset", buf, 0xCu);
      }

      uint64_t v29 = [(CMContinuityCaptureCompositeDevice *)self eventQueue];
      [v29 notifyCompletion];
    }
  }
  else
  {
    if (v23
      && ([v23 code] == -1011 || objc_msgSend(v23, "code") == -1010 || objc_msgSend(v23, "code") == -1013))
    {
      [(CMContinuityCaptureCompositeDevice *)self notifyTransportError:v23];
    }
    int v27 = [(CMContinuityCaptureCompositeDevice *)self eventQueue];
    [v27 notifyCompletion];
  }
LABEL_30:

  objc_destroyWeak(&location);
}

void __83__CMContinuityCaptureCompositeDevice_performConnectionDisconnectEventIfApplicable___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained(v3);
      int v7 = [WeakRetained[8] preferredTransport];
      *(_DWORD *)buf = 138543874;
      id v27 = v6;
      __int16 v28 = 1024;
      int v29 = v7;
      __int16 v30 = 2114;
      uint64_t v31 = a2;
      _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resetSession %d error %{public}@", buf, 0x1Cu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [WeakRetained[2] allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) integerValue];
          id v23 = @"CMContinuityCaptureStateMachineEventDataKeySessionID";
          int v13 = NSNumber;
          int v14 = [WeakRetained client];
          int v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "currentSessionID"));
          uint64_t v24 = v15;
          BOOL v16 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          [WeakRetained postEvent:@"kCMContinuityCaptureEventRemoteClientReconnect" entity:v12 data:v16];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);
    }

    BOOL v17 = [WeakRetained eventQueue];
    [v17 notifyCompletion];
  }
}

- (void)performConnectionChangeEventIfApplicable:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = [(CMContinuityCaptureCompositeDevice *)self provider];
  if (v5)
  {
    if (!v4
      || ([v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"], id v6 = objc_claimAutoreleasedReturnValue(), v7 = v6 == 0, v6, v7))
    {
      if (![(CMContinuityCaptureCompositeDevice *)self shouldSwitchConnection]
        || ![(CMContinuityCaptureCompositeDevice *)self validConnectionResetEventForData:v4])
      {
        id v14 = [(CMContinuityCaptureCompositeDevice *)self eventQueue];
        [v14 notifyCompletion];
LABEL_25:

        goto LABEL_26;
      }
      if (!v4) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v8 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v9;
        _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Force Connection Switch to %@", buf, 0x16u);
      }
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      uint64_t v12 = [v4 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataForceConnectionChangeForTransport"];
      int v13 = (void *)[v12 integerValue];

      goto LABEL_15;
    }
LABEL_14:
    int v13 = [(CMContinuityCaptureCompositeDevice *)self currentPreferredAvailableTransport];
LABEL_15:
    int v15 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    BOOL v16 = [(CMContinuityCaptureCompositeDevice *)self client];
    BOOL v17 = [v16 device];
    long long v18 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v29 = 0;
    char v19 = objc_msgSend(v15, "startSessionWithDevice:forTransportType:validateTransport:initiatedOnCommunalDevice:outError:", v17, v13, 1, objc_msgSend(v18, "isSessionInitiatedOnCommunalDevice"), &v29);
    id v14 = v29;

    if (v19)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke;
      v27[3] = &unk_264C99288;
      objc_copyWeak(v28, &location);
      v28[1] = v13;
      long long v20 = (void *)MEMORY[0x237DFB780](v27);
      long long v21 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = self;
        _os_log_impl(&dword_235FC2000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ go ahead with connection switch", buf, 0xCu);
      }

      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      void v24[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_76;
      v24[3] = &unk_264C992D8;
      objc_copyWeak(&v26, &location);
      id v22 = v20;
      id v25 = v22;
      [v5 registerStreamIntentForDevice:self forTransportType:v13 completion:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(v28);
    }
    else
    {
      if (v14
        && ([v14 code] == -1011
         || [v14 code] == -1010
         || [v14 code] == -1013))
      {
        [(CMContinuityCaptureCompositeDevice *)self notifyTransportError:v14];
      }
      id v23 = [(CMContinuityCaptureCompositeDevice *)self eventQueue];
      [v23 notifyCompletion];
    }
    goto LABEL_25;
  }
LABEL_26:

  objc_destroyWeak(&location);
}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543618;
    id v17 = WeakRetained;
    __int16 v18 = 2114;
    char v19 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ registerStreamIntentForDevice (performConnectionChangeEventIfApplicable) error %{public}@", buf, 0x16u);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    if (a2 && [a2 code])
    {
      BOOL v7 = [v6 eventQueue];
      [v7 notifyCompletion];
    }
    else
    {
      v6[12] = [v6 currentSessionID];
      v14[0] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
      v14[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
      v15[0] = &unk_26E96A2D0;
      uint64_t v8 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
      v15[1] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      [v6 _postEvent:@"kCMContinuityCaptureEventRemoteClientDisconnect" entity:0 data:v9];

      uint64_t v10 = (void *)v6[8];
      uint64_t v11 = *(void *)(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_75;
      v12[3] = &unk_264C99288;
      objc_copyWeak(v13, (id *)(a1 + 32));
      v13[1] = *(id *)(a1 + 40);
      [v10 setPreferredTransport:v11 resetConnection:1 completion:v12];
      objc_destroyWeak(v13);
    }
  }
}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_75(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained(v4);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v29 = v7;
      __int16 v30 = 1024;
      int v31 = v8;
      __int16 v32 = 2114;
      uint64_t v33 = a2;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setPreferredTransport %d error %{public}@", buf, 0x1Cu);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [WeakRetained[2] allKeys];
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v20 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) integerValue];
          v25[0] = @"CMContinuityCaptureStateMachineEventDataKeySessionID";
          int v13 = NSNumber;
          id v14 = [WeakRetained client];
          int v15 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v14, "currentSessionID"));
          v25[1] = @"CMContinuityCaptureStateMachineEventDataKeyOption";
          v26[0] = v15;
          BOOL v16 = [NSNumber numberWithUnsignedInteger:0];
          v26[1] = v16;
          id v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
          [WeakRetained postEvent:@"kCMContinuityCaptureEventRemoteClientReconnect" entity:v12 data:v17];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }

    __int16 v18 = [WeakRetained eventQueue];
    [v18 notifyCompletion];
  }
}

void __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_76(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_2;
    v7[3] = &unk_264C992B0;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __79__CMContinuityCaptureCompositeDevice_performConnectionChangeEventIfApplicable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)postEventAction:(unint64_t)a3 args:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
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
      uint64_t v34 = self;
      __int16 v35 = 2048;
      unint64_t v36 = a3;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_debug_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEBUG, "%@ Perform %lu %@", buf, 0x20u);
    }
  }
  if (a3 == 3)
  {
    if ((unint64_t)[v6 count] < 2) {
      goto LABEL_22;
    }
    id v8 = [v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || ([v6 objectAtIndexedSubscript:1],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v11 = objc_opt_isKindOfClass(),
          v10,
          (v11 & 1) == 0))
    {
LABEL_22:
      BOOL v25 = 0;
      goto LABEL_21;
    }
    uint64_t v12 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v6 objectAtIndexedSubscript:0];
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = self;
      __int16 v35 = 2114;
      unint64_t v36 = (unint64_t)v13;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ Perform event %{public}@", buf, 0x16u);
    }
    id v14 = [v6 objectAtIndexedSubscript:0];
    int v15 = [v14 isEqualToString:@"kCMContinuityCaptureEventConnectionChange"];

    if (v15)
    {
      id v16 = [v6 objectAtIndexedSubscript:2];
      [(CMContinuityCaptureCompositeDevice *)self performConnectionChangeEventIfApplicable:v16];
    }
    else
    {
      id v17 = [v6 objectAtIndexedSubscript:0];
      int v18 = [v17 isEqualToString:@"kCMContinuityCaptureEventConnectionDisconnect"];

      if (v18)
      {
        id v16 = [v6 objectAtIndexedSubscript:2];
        [(CMContinuityCaptureCompositeDevice *)self performConnectionDisconnectEventIfApplicable:v16];
      }
      else
      {
        char v19 = [v6 objectAtIndexedSubscript:2];
        if (v19)
        {
          id v20 = objc_alloc(MEMORY[0x263EFF9A0]);
          long long v21 = [v6 objectAtIndexedSubscript:2];
          id v16 = (id)[v20 initWithDictionary:v21];
        }
        else
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        }

        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        id v29 = __59__CMContinuityCaptureCompositeDevice_postEventAction_args___block_invoke;
        __int16 v30 = &unk_264C99260;
        objc_copyWeak(&v31, &location);
        long long v22 = (void *)MEMORY[0x237DFB780](&v27);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, @"CMContinuityCaptureStateMachineEventDataCompletionBlock", v27, v28, v29, v30);

        long long v23 = [v6 objectAtIndexedSubscript:0];
        long long v24 = [v6 objectAtIndexedSubscript:1];
        -[CMContinuityCaptureCompositeDevice _postEvent:entity:data:](self, "_postEvent:entity:data:", v23, [v24 unsignedIntValue], v16);

        objc_destroyWeak(&v31);
      }
    }
  }
  BOOL v25 = 1;
LABEL_21:
  objc_destroyWeak(&location);

  return v25;
}

void __59__CMContinuityCaptureCompositeDevice_postEventAction_args___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained eventQueue];
    [v2 notifyCompletion];

    id WeakRetained = v3;
  }
}

- (void)_postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543874;
    long long v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ postEvent : %{public}@ entity : %d", (uint8_t *)&v20, 0x1Cu);
  }

  if (a4)
  {
    captureDeviceByEntityType = self->_captureDeviceByEntityType;
    uint64_t v12 = [NSNumber numberWithInteger:a4];
    int v13 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKey:v12];

    if (v13)
    {
      id v14 = self->_captureDeviceByEntityType;
      int v15 = [NSNumber numberWithInteger:a4];
      id v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
      [v16 postEvent:v8 entity:a4 data:v9];
    }
    else if (v9)
    {
      id v17 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];

      if (v17)
      {
        int v18 = [v9 objectForKeyedSubscript:@"CMContinuityCaptureStateMachineEventDataCompletionBlock"];
        char v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870911 userInfo:0];
        ((void (**)(void, void *))v18)[2](v18, v19);
      }
    }
  }
  else
  {
    [(CMContinuityCaptureCompositeDevice *)self postEventOnAllEntities:v8 data:v9];
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
  block[2] = __68__CMContinuityCaptureCompositeDevice_startStream_option_completion___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureCompositeDevice_startStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startStream:*(void *)(a1 + 32) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v10 = [(CMContinuityCaptureCompositeDevice *)self provider];
  if (v10)
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    void v51[3] = __Block_byref_object_copy_;
    v51[4] = __Block_byref_object_dispose_;
    id v52 = 0;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[CMContinuityCaptureCompositeDevice _startStream:option:completion:]";
      *(_WORD *)&buf[22] = 2114;
      id v55 = v8;
      LOWORD(v56) = 2048;
      *(void *)((char *)&v56 + 2) = a4;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s starting stream with configuration %{public}@, option '%lu'", buf, 0x2Au);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v55 = __Block_byref_object_copy_;
    *(void *)&long long v56 = __Block_byref_object_dispose_;
    *((void *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v56 + 1) = dispatch_group_create();
    captureDeviceByEntityType = self->_captureDeviceByEntityType;
    int v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "entity"));
    id v14 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v13];

    if (v14)
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)&buf[8] + 40));
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)&buf[8] + 40));
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke;
      v45[3] = &unk_264C99378;
      objc_copyWeak(v50, &location);
      id v15 = v8;
      id v46 = v15;
      id v48 = buf;
      __int16 v49 = v51;
      id v28 = v14;
      id v47 = v28;
      v50[1] = (id)a4;
      id v16 = (void *)MEMORY[0x237DFB780](v45);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_79;
      v40[3] = &unk_264C99350;
      objc_copyWeak(&v44, &location);
      id v17 = v15;
      id v41 = v17;
      uint64_t v42 = v51;
      char v43 = buf;
      int v18 = (void *)MEMORY[0x237DFB780](v40);
      uint64_t v27 = v14;
      id v19 = v9;
      client = self->_client;
      uint64_t v21 = [v17 entity];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_81;
      v38[3] = &unk_264C993A0;
      id v26 = v16;
      id v39 = v26;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_3;
      v36[3] = &unk_264C993A0;
      id v22 = v18;
      id v37 = v22;
      [(ContinuityCaptureDeviceClient *)client activateEntity:v21 configuration:v17 option:a4 entityCompletion:v38 overallCompletion:v36];
      id v23 = *(NSObject **)(*(void *)&buf[8] + 40);
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_4;
      block[3] = &unk_264C993C8;
      objc_copyWeak(&v35, &location);
      id v9 = v19;
      id v14 = v27;
      uint64_t v33 = v51;
      __int16 v30 = v17;
      id v31 = v28;
      id v32 = v9;
      uint64_t v34 = buf;
      dispatch_group_notify(v23, queue, block);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v44);

      objc_destroyWeak(v50);
    }
    else
    {
      int v25 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870911 userInfo:0];
      (*((void (**)(id, void *))v9 + 2))(v9, v25);
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v51, 8);
  }

  objc_destroyWeak(&location);
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    id v7 = v6;
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v16 = objc_loadWeakRetained(v4);
        id v17 = [WeakRetained client];
        uint64_t v18 = [v17 currentSessionID];
        int v19 = [*(id *)(a1 + 32) entity];
        *(_DWORD *)buf = 138544130;
        id v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        __int16 v29 = 1024;
        int v30 = v19;
        __int16 v31 = 2114;
        id v32 = a2;
        _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] Activation failure for entity %d error %{public}@", buf, 0x26u);
      }
      if ([a2 code])
      {
        id v8 = WeakRetained[1];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_77;
        block[3] = &unk_264C99328;
        void block[4] = *(void *)(a1 + 48);
        dispatch_async(v8, block);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
        goto LABEL_11;
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_loadWeakRetained(v4);
        uint64_t v10 = [WeakRetained client];
        uint64_t v11 = [v10 currentSessionID];
        int v12 = [*(id *)(a1 + 32) entity];
        *(_DWORD *)buf = 138543874;
        id v26 = v9;
        __int16 v27 = 2048;
        uint64_t v28 = v11;
        __int16 v29 = 1024;
        int v30 = v12;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Activation complete for entity %d", buf, 0x1Cu);
      }
    }
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 72);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2;
    v20[3] = &unk_264C99350;
    objc_copyWeak(&v23, v4);
    id v21 = *(id *)(a1 + 32);
    int8x16_t v22 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    [v14 startStream:v13 option:v15 completion:v20];

    objc_destroyWeak(&v23);
  }
LABEL_11:
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_77(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    id v7 = v6;
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v8 = objc_loadWeakRetained(v4);
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v14 = v8;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = a2;
        _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ start stream failure for %@ error %@", buf, 0x20u);
LABEL_7:
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(v4);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ start stream complete for %@", buf, 0x16u);
      goto LABEL_7;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v11 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_78;
    block[3] = &unk_264C99328;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(v11, block);
  }
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_78(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_79(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    id v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v15 = objc_loadWeakRetained((id *)(a1 + 56));
        uint64_t v16 = [WeakRetained client];
        uint64_t v17 = [v16 currentSessionID];
        int v18 = [*(id *)(a1 + 32) entity];
        *(_DWORD *)buf = 138544130;
        id v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = v17;
        __int16 v26 = 1024;
        int v27 = v18;
        __int16 v28 = 2114;
        id v29 = v4;
        _os_log_error_impl(&dword_235FC2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [sessionID:%llx] Overall activation failure for entity %d error %{public}@", buf, 0x26u);
      }
      WeakRetained[12] = [WeakRetained currentSessionID];
      if ([v4 code])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        v20[0] = @"CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart";
        v20[1] = @"CMContinuityCaptureStateMachineEventDataKeyPostTime";
        v21[0] = MEMORY[0x263EFFA80];
        id v8 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
        v21[1] = v8;
        uint64_t v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [WeakRetained postEvent:@"kCMContinuityCaptureEventStreamInterrupted" entity:0 data:v9];
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 56));
        uint64_t v11 = [WeakRetained client];
        uint64_t v12 = [v11 currentSessionID];
        int v13 = [*(id *)(a1 + 32) entity];
        *(_DWORD *)buf = 138543874;
        id v23 = v10;
        __int16 v24 = 2048;
        uint64_t v25 = v12;
        __int16 v26 = 1024;
        int v27 = v13;
        _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Overall activation complete for entity %d", buf, 0x1Cu);
      }
      WeakRetained[12] = [WeakRetained currentSessionID];
    }
    id v14 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_80;
    block[3] = &unk_264C99328;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(v14, block);
  }
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_80(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

uint64_t __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_2_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__CMContinuityCaptureCompositeDevice__startStream_option_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained) {
    goto LABEL_17;
  }
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = CMContinuityCaptureLog(2);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_8;
    }
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [WeakRetained client];
    uint64_t v9 = [v8 currentSessionID];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    id v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    uint64_t v38 = v11;
    uint64_t v12 = "%{public}@ [sessionID:%llx] Overall start stream failure for configuration %@ with error %@";
    int v13 = v5;
    uint32_t v14 = 42;
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [WeakRetained client];
    uint64_t v15 = [v8 currentSessionID];
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    id v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v15;
    __int16 v35 = 2112;
    uint64_t v36 = v16;
    uint64_t v12 = "%{public}@ [sessionID:%llx] Overall start stream completion for configuration %@";
    int v13 = v5;
    uint32_t v14 = 32;
  }
  _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);

LABEL_8:
  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v17)
  {
    if ([v17 code])
    {
      int v18 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      int v19 = [v18 shouldResetConnectionForDevice:*(void *)(a1 + 40)];

      if (v19)
      {
        int v20 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = objc_loadWeakRetained(v2);
          *(_DWORD *)buf = 138543362;
          id v32 = v21;
          _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ stream failed try reset", buf, 0xCu);
        }
        uint64_t v22 = [*(id *)(a1 + 40) entity];
        id v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", mach_continuous_time(), @"CMContinuityCaptureStateMachineEventDataKeyPostTime");
        v30[0] = v23;
        v29[1] = @"CMContinuityCaptureStateMachineEventDataKeyForceConnectionReset";
        __int16 v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "hasValidStreamState"));
        v30[1] = v24;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        [WeakRetained postEvent:@"kCMContinuityCaptureEventConnectionDisconnect" entity:v22 data:v25];
      }
    }
  }
  uint64_t v26 = *(void *)(a1 + 48);
  if (v26) {
    (*(void (**)(uint64_t, void))(v26 + 16))(v26, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = 0;

LABEL_17:
}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CMContinuityCaptureCompositeDevice_stopStream_option_completion___block_invoke;
  block[3] = &unk_264C993F0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  id v13[2] = (id)a4;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __67__CMContinuityCaptureCompositeDevice_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _stopStream:*(void *)(a1 + 48) option:*(void *)(a1 + 56) completion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = [(CMContinuityCaptureCompositeDevice *)self provider];
  id v10 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = "-[CMContinuityCaptureCompositeDevice _stopStream:option:completion:]";
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s ", buf, 0x16u);
  }

  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  id v12 = [NSNumber numberWithInteger:a3];
  int v13 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v12];

  if (v13 && v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke;
    v15[3] = &unk_264C99468;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a4;
    id v17[2] = (id)a3;
    id v16 = v8;
    [v13 stopStream:a3 option:a4 completion:v15];

    objc_destroyWeak(v17);
  }
  else
  {
    uint32_t v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"ContinuityCapture" code:-536870911 userInfo:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v14);
  }
  objc_destroyWeak(&location);
}

void __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_2;
    block[3] = &unk_264C99440;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    long long v11 = *(_OWORD *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }
}

void __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      BOOL v5 = (*(void *)(a1 + 56) & 0x200) == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
      }
    }
    else
    {
      BOOL v6 = (void *)*((void *)WeakRetained + 8);
      uint64_t v7 = *(void *)(a1 + 64);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_3;
      v9[3] = &unk_264C99418;
      id v11 = *(id *)(a1 + 40);
      id v10 = *(id *)(a1 + 32);
      [v6 terminateEntity:v7 option:v4 completion:v9];
    }
  }
}

uint64_t __68__CMContinuityCaptureCompositeDevice__stopStream_option_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)scheduleSystemPressureNotification:(id)a3
{
  v29[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlSystemPressure"];
  if (v5)
  {
    BOOL v6 = [v4 value];
    [v5 setValue:v6];
  }
  uint64_t v7 = [v4 value];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EF97C0]];

  if (v8)
  {
    id v9 = [(ContinuityCaptureDeviceClient *)self->_client device];
    id v10 = [v9 deviceModel];
    BOOL v11 = continuityCaptureNotificationCenter_isiPhone(v10);

    id v12 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    int v13 = @"SYSTEM_PRESSURE_TITLE_IPAD";
    if (v11) {
      int v13 = @"SYSTEM_PRESSURE_TITLE_IPHONE";
    }
    v28[0] = @"kContinuityCaptureNotificationKeyTitle";
    v28[1] = @"kContinuityCaptureNotificationKeyBody";
    uint32_t v14 = @"SYSTEM_PRESSURE_SHUTDOWN_IPAD";
    if (v11) {
      uint32_t v14 = @"SYSTEM_PRESSURE_SHUTDOWN_IPHONE";
    }
    v29[0] = v13;
    v29[1] = v14;
    id v28[2] = @"kContinuityCaptureNotificationKeyBodyArgs";
    uint64_t v26 = [(ContinuityCaptureDeviceClient *)self->_client device];
    uint64_t v25 = [v26 deviceName];
    uint64_t v27 = v25;
    __int16 v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    void v29[2] = v24;
    v29[3] = MEMORY[0x263EFFA80];
    v28[3] = @"kContinuityCaptureNotificationKeyOneTime";
    v28[4] = @"kContinuityCaptureNotificationKeyIdentifier";
    uint64_t v15 = NSString;
    id v16 = [(ContinuityCaptureDeviceClient *)self->_client device];
    uint64_t v17 = [v16 deviceIdentifier];
    int v18 = [v17 UUIDString];
    int v19 = [v15 stringWithFormat:@"%@%@", @"CMContinuityCaptureSystemPressueNotification", v18];
    v29[4] = v19;
    v28[5] = @"kContinuityCaptureNotificationKeyDeviceModel";
    int v20 = [(ContinuityCaptureDeviceClient *)self->_client device];
    __int16 v21 = [v20 deviceModel];
    v29[5] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
    [v12 scheduleNotification:7 data:v22];
  }
  else
  {
    uint64_t v23 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v23 unscheduleNotification:7];
  }
}

- (void)scheduleBatteryLevelNotification:(id)a3
{
  void v64[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v6 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlBatteryLevel"];
  uint64_t v7 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlBatteryState"];
  int v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_39;
  }
  id v10 = [v4 name];
  int v11 = [v10 isEqualToString:@"kCMContinuityCaptureControlBatteryLevel"];

  if (!v11) {
    goto LABEL_39;
  }
  id v12 = [v6 value];
  [v12 floatValue];
  float v14 = v13;

  uint64_t v15 = [v4 value];
  [v15 floatValue];
  float v17 = v16;

  id v52 = v8;
  int v18 = [v8 value];
  int v51 = [v18 intValue];

  int v19 = [(CMContinuityCaptureCompositeDevice *)self client];
  int v20 = [v19 device];
  __int16 v21 = [v20 deviceModel];
  BOOL v22 = continuityCaptureNotificationCenter_isiPhone(v21);

  BOOL v50 = v22;
  if (v14 > 0.05 && v17 <= 0.05 && v17 > 0.0)
  {
    uint64_t v23 = [(CMContinuityCaptureCompositeDevice *)self client];
    __int16 v24 = [v23 device];
    uint64_t v25 = [v24 deviceName];
    v64[0] = v25;
    uint64_t v26 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26E96A7A8 numberStyle:3];
    v64[1] = v26;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
    [v5 setObject:v27 forKeyedSubscript:@"kContinuityCaptureNotificationKeyBodyArgs"];

LABEL_19:
    goto LABEL_20;
  }
  if (v14 > 0.1 && v17 <= 0.1 && v17 > 0.05)
  {
    uint64_t v23 = [(CMContinuityCaptureCompositeDevice *)self client];
    __int16 v24 = [v23 device];
    __int16 v28 = [v24 deviceName];
    v63[0] = v28;
    id v29 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26E96A7B8 numberStyle:3];
    v63[1] = v29;
    uint64_t v30 = (void *)MEMORY[0x263EFF8C0];
    __int16 v31 = v63;
LABEL_18:
    id v32 = [v30 arrayWithObjects:v31 count:2];
    [v5 setObject:v32 forKeyedSubscript:@"kContinuityCaptureNotificationKeyBodyArgs"];

    goto LABEL_19;
  }
  if (v14 > 0.2 && v17 <= 0.2 && v17 > 0.1)
  {
    uint64_t v23 = [(CMContinuityCaptureCompositeDevice *)self client];
    __int16 v24 = [v23 device];
    __int16 v28 = [v24 deviceName];
    v62[0] = v28;
    id v29 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26E96A7C8 numberStyle:3];
    v62[1] = v29;
    uint64_t v30 = (void *)MEMORY[0x263EFF8C0];
    __int16 v31 = v62;
    goto LABEL_18;
  }
LABEL_20:
  int v8 = v52;
  __int16 v33 = [v5 objectForKeyedSubscript:@"kContinuityCaptureNotificationKeyBodyArgs"];
  uint64_t v34 = v33;
  if (!v33 || v51 != 4 && v51 != 1)
  {
LABEL_28:

    goto LABEL_29;
  }

  if (v17 < v14)
  {
    [v5 setObject:@"CONTINUITY_CAPTURE_TITLE" forKeyedSubscript:@"kContinuityCaptureNotificationKeyTitle"];
    if (v50) {
      __int16 v35 = @"BATTERY_LEVEL_BODY_IPHONE";
    }
    else {
      __int16 v35 = @"BATTERY_LEVEL_BODY_IPAD";
    }
    [v5 setObject:v35 forKeyedSubscript:@"kContinuityCaptureNotificationKeyBody"];
    uint64_t v36 = NSString;
    __int16 v37 = [(ContinuityCaptureDeviceClient *)self->_client device];
    uint64_t v38 = [v37 deviceIdentifier];
    uint64_t v39 = [v38 UUIDString];
    __int16 v40 = [v36 stringWithFormat:@"%@%@", @"CMContinuityCaptureBatteryNotification", v39];
    [v5 setObject:v40 forKeyedSubscript:@"kContinuityCaptureNotificationKeyIdentifier"];

    [v5 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"kContinuityCaptureNotificationKeyOneTime"];
    id v41 = [(ContinuityCaptureDeviceClient *)self->_client device];
    uint64_t v42 = [v41 deviceModel];
    [v5 setObject:v42 forKeyedSubscript:@"kContinuityCaptureNotificationKeyDeviceModel"];

    uint64_t v34 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v34 scheduleNotification:6 data:v5];
    goto LABEL_28;
  }
LABEL_29:
  char v43 = [v4 value];
  [v6 setValue:v43];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v44 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(v44);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * i) setValueForControl:v4 completion:0];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v46);
  }

  __int16 v49 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v58 = self;
    __int16 v59 = 2112;
    long long v60 = v6;
    _os_log_impl(&dword_235FC2000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Battery Level %@ updated", buf, 0x16u);
  }

LABEL_39:
}

- (void)handleBatteryState:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlBatteryState"];
  if (v5)
  {
    BOOL v6 = [v4 value];
    int v7 = [v6 intValue];

    if (v7 == 2)
    {
      int v8 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
      [v8 unscheduleNotification:6];
    }
    BOOL v9 = [v4 value];
    [v5 setValue:v9];

    id v10 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v22 = self;
      __int16 v23 = 2112;
      __int16 v24 = v5;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Battery state %@ updated", buf, 0x16u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v11 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) setValueForControl:v4 completion:0];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)handleRemoteSystemNotificationControl:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 name];

    if (v6)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      int v7 = [v5 name];
      int v8 = [v7 isEqualToString:@"kCMContinuityCaptureControlSystemPressure"];

      if (v8)
      {
        [(CMContinuityCaptureCompositeDevice *)self scheduleSystemPressureNotification:v5];
        goto LABEL_24;
      }
      BOOL v9 = [v5 name];
      int v10 = [v9 isEqualToString:@"kCMContinuityCaptureControlBatteryLevel"];

      if (v10)
      {
        [(CMContinuityCaptureCompositeDevice *)self scheduleBatteryLevelNotification:v5];
        goto LABEL_24;
      }
      int v11 = [v5 name];
      int v12 = [v11 isEqualToString:@"kCMContinuityCaptureControlBatteryState"];

      if (v12)
      {
        [(CMContinuityCaptureCompositeDevice *)self handleBatteryState:v5];
        goto LABEL_24;
      }
      uint64_t v13 = [v5 name];
      int v14 = [v13 isEqualToString:@"kCMContinuityCaptureControlIncomingCall"];

      if (v14)
      {
        uint64_t v15 = [v5 value];

        if (v15) {
          goto LABEL_24;
        }
        long long v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138543362;
          id v29 = self;
          long long v17 = "%{public}@ Invalid call data";
LABEL_29:
          _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, 0xCu);
        }
      }
      else
      {
        long long v18 = [v5 name];
        int v19 = [v18 isEqualToString:@"kCMContinuityCaptureControlIncomingCallComplete"];

        if (v19)
        {
          int v20 = [v5 value];

          if (v20)
          {
            __int16 v21 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
            [v21 unscheduleNotification:4];

            BOOL v22 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
            [v22 unscheduleNotification:5];

            goto LABEL_24;
          }
          long long v16 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 138543362;
            id v29 = self;
            long long v17 = "%{public}@ Invalid call data";
            goto LABEL_29;
          }
        }
        else
        {
          __int16 v23 = [v5 name];
          int v24 = [v23 isEqualToString:@"kCMContinuityCaptureControlDebugInfo"];

          if (!v24) {
            goto LABEL_24;
          }
          uint64_t v25 = [v5 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            if (CMContinityCaptureDebugLogEnabled())
            {
              uint64_t v27 = CMContinuityCaptureLog(2);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
                [(CMContinuityCaptureCompositeDevice *)(uint64_t)self handleRemoteSystemNotificationControl:v27];
              }
            }
            long long v16 = [v5 value];
            [(CMContinuityCaptureCompositeDevice *)self logRemoteSessionSummary:v16];
            goto LABEL_23;
          }
          long long v16 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 138543362;
            id v29 = self;
            long long v17 = "%{public}@ Invalid control data";
            goto LABEL_29;
          }
        }
      }
LABEL_23:
    }
  }
LABEL_24:
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  BOOL v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "entity"));
  int v10 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v9];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v6 entity] == 4)
  {
    int v11 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_INFO, "%@ system notification for %@", (uint8_t *)&v12, 0x16u);
    }

    [(CMContinuityCaptureCompositeDevice *)self handleRemoteSystemNotificationControl:v6];
  }
  else if (v10)
  {
    [v10 setValueForControl:v6 completion:v7];
  }
}

- (void)postValueChangeForControl:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CMContinuityCaptureCompositeDevice_postValueChangeForControl___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureCompositeDevice_postValueChangeForControl___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setValueForControl:*(void *)(a1 + 32) completion:&__block_literal_global];
    id WeakRetained = v3;
  }
}

- (void)synchronizeAudioClockWithSampleTime:(unint64_t)a3 networkTime:(unint64_t)a4 clockGrandMasterIdentifier:(unint64_t)a5
{
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  captureDeviceByEntityType = self->_captureDeviceByEntityType;
  id v7 = [NSNumber numberWithInteger:a4];
  id v8 = [(NSMutableDictionary *)captureDeviceByEntityType objectForKeyedSubscript:v7];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 didCaptureStillImage:v9 entity:a4];
    }
  }
}

- (unint64_t)currentSessionID
{
  return [(ContinuityCaptureDeviceClient *)self->_client currentSessionID];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(ContinuityCaptureDeviceClient *)self->_client device];
  id v7 = [v6 deviceIdentifier];
  id v8 = [v7 UUIDString];
  id v9 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v8, self];

  return (NSString *)v9;
}

- (id)debugInfo
{
  return 0;
}

- (void)_handlePlacementStepSkipped
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"kCMContinuityCaptureControlCameraReadyToUnhide"];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 value];
    if (([v5 isEqualToNumber:MEMORY[0x263EFFA88]] & 1) == 0)
    {
      [v4 setValue:MEMORY[0x263EFFA88]];
      id v6 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        long long v18 = self;
        __int16 v19 = 2082;
        int v20 = "-[CMContinuityCaptureCompositeDevice _handlePlacementStepSkipped]";
        __int16 v21 = 2112;
        BOOL v22 = v4;
        _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s updated value for %@", buf, 0x20u);
      }

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = [(NSMutableDictionary *)self->_captureDeviceByEntityType allValues];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * i) setValueForControl:v4 completion:0];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (id)controlWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CMContinuityCaptureCompositeDevice *)self controls];
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

- (CMContinuityCaptureProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (CMContinuityCaptureProvider *)WeakRetained;
}

- (NSString)publishTime
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishTime, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong(&self->_undeferBlockForSidecarClient, 0);
  objc_destroyWeak((id *)&self->_deviceStatusObserverDevice);
  objc_storeStrong(&self->_pendingTerminationTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_streamingIntentEntities, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_remoteSessionLogs, 0);
  objc_storeStrong((id *)&self->_connectionSwitchLogs, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_captureDeviceByEntityType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleRemoteSystemNotificationControl:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 value];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ RemoteSessionSummary %{public}@", (uint8_t *)&v6, 0x16u);
}

@end