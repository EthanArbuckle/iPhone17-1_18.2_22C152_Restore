@interface IRSystemStateManager
+ (BOOL)isObservedEventType:(int64_t)a3;
- (BOOL)_updateSystemStateWithAppInFocus:(id)a3 andOpenWindowIfApplicable:(BOOL)a4 isScreenUnlockEvent:(BOOL)a5;
- (BOOL)_updateSystemStateWithAppInFocusWindowEnd;
- (BOOL)_updateSystemStateWithDeviceWiFi:(id)a3;
- (BOOL)_updateSystemStateWithDisplayOn:(BOOL)a3;
- (BOOL)_updateSystemStateWithIsContinuityDisplay:(BOOL)a3;
- (BOOL)_updateSystemStateWithLOIType:(int)a3 WithLOIIdentifier:(id)a4;
- (BOOL)_updateSystemStateWithMediaRoute:(id)a3;
- (BOOL)_updateSystemStateWithOutputDevice:(id)a3;
- (BOOL)_updateSystemStateWithPredictedOutputDevice:(id)a3;
- (BOOL)isBiomeRegistered;
- (BOOL)startLowLatencyMiLo;
- (IRAVOutputContextController)audioAVOutputContextController;
- (IRBiomeProvider)biomeProvider;
- (IRCMPDRFenceBridge)pdrFenceBridge;
- (IRDisplayMonitor)displayMonitor;
- (IRMiLoProvider)miloProvider;
- (IRMiloLslPredictionDO)miloProviderLslPredictionResults;
- (IRNearbyDeviceContainerDO)nearbyDeviceContainer;
- (IRPolicyManagerContextObserver)contextObserver;
- (IRProximityProvider)proximityProvider;
- (IRServiceStore)serviceStore;
- (IRSystemStateDO)systemState;
- (IRSystemStateManager)initWithQueue:(id)a3 contextObserver:(id)a4 biomeProvider:(id)a5 miloProvider:(id)a6 proximityProvider:(id)a7 serviceStore:(id)a8 displayMonitor:(id)a9 audioAVOutputContextController:(id)a10 isLowLatencyMiLo:(BOOL)a11;
- (IRTimer)appInFocusWindowTimer;
- (IRTimer)pdrFenceTimer;
- (OS_dispatch_queue)queue;
- (id)_miloLslPredictionToDO:(id)a3;
- (void)_cancelAppInFocusWindowTimer;
- (void)_checkAndStartPDRFenceLogicIfNeededWithEvent:(id)a3 andCandidate:(id)a4;
- (void)_checkAndStopPDRFenceLogicIfNeeded;
- (void)_checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:(id)a3;
- (void)_didUpdateContextWithReason:(id)a3;
- (void)_initBiomeIfNeededUponAppInFocus;
- (void)_registerToMiLo:(BOOL)a3;
- (void)_startAppInFocusWindowTimer;
- (void)_unregisterForBiomeEvents;
- (void)_unregisterFromMiLo;
- (void)addEvent:(id)a3 forCandidate:(id)a4;
- (void)context:(id)a3 didUpdateOutputDevice:(id)a4;
- (void)context:(id)a3 didUpdatePredicatedOutputDevice:(id)a4;
- (void)dealloc;
- (void)deallocSync;
- (void)deleteLegacyServiceIdentifier;
- (void)didSpotOnLocationCompleteWithError:(id)a3;
- (void)endAppInFocusWindow;
- (void)logProviderState;
- (void)monitor:(id)a3 didUpdateAppInFocus:(id)a4 isScreenUnlockEvent:(BOOL)a5;
- (void)monitor:(id)a3 didUpdateDisplayOn:(BOOL)a4;
- (void)monitor:(id)a3 didUpdateIsContinuityDisplay:(BOOL)a4;
- (void)onPrediction:(id)a3;
- (void)onUpdateLOIType:(int)a3 WithLOIIdentifier:(id)a4;
- (void)provider:(id)a3 didUpdateDeviceWiFi:(id)a4;
- (void)provider:(id)a3 didUpdateMediaRoute:(id)a4;
- (void)provider:(id)a3 didUpdateNearbyDevices:(id)a4;
- (void)restartLowLatencyMiLo:(BOOL)a3;
- (void)setAppInFocusWindowTimer:(id)a3;
- (void)setAudioAVOutputContextController:(id)a3;
- (void)setBiomeProvider:(id)a3;
- (void)setContextObserver:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setIsBiomeRegistered:(BOOL)a3;
- (void)setMiloProvider:(id)a3;
- (void)setMiloProviderLslPredictionResults:(id)a3;
- (void)setNearbyDeviceContainer:(id)a3;
- (void)setPdrFenceBridge:(id)a3;
- (void)setPdrFenceTimer:(id)a3;
- (void)setProximityProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceStore:(id)a3;
- (void)setSystemState:(id)a3;
@end

@implementation IRSystemStateManager

void __72__IRSystemStateManager_monitor_didUpdateAppInFocus_isScreenUnlockEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithAppInFocus:*(void *)(a1 + 32) andOpenWindowIfApplicable:1 isScreenUnlockEvent:*(unsigned __int8 *)(a1 + 40)])objc_msgSend(v3, "_didUpdateContextWithReason:", @"App in focus"); {
}
  }

- (void)_didUpdateContextWithReason:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v6 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = [(IRSystemStateManager *)self systemState];
    v9 = +[IRLogQEUtility getSystemStateAsString:v8];
    v10 = [(IRSystemStateManager *)self miloProvider];
    v11 = [(IRSystemStateManager *)self miloProviderLslPredictionResults];
    v12 = [v10 getMiloServiceStatusStringQEWithPrediction:v11];
    int v14 = 136316162;
    v15 = "#system-state-manager, ";
    __int16 v16 = 2112;
    v17 = v5;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "%s[%@], System state might have changed due to %@:\n%@\n%@", (uint8_t *)&v14, 0x34u);
  }
  v13 = [(IRSystemStateManager *)self contextObserver];
  [v13 didUpdateContextWithReason:v4 andOverrides:0];
}

- (IRMiLoProvider)miloProvider
{
  return self->_miloProvider;
}

- (IRPolicyManagerContextObserver)contextObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextObserver);

  return (IRPolicyManagerContextObserver *)WeakRetained;
}

- (IRMiloLslPredictionDO)miloProviderLslPredictionResults
{
  return self->_miloProviderLslPredictionResults;
}

- (BOOL)_updateSystemStateWithAppInFocus:(id)a3 andOpenWindowIfApplicable:(BOOL)a4 isScreenUnlockEvent:(BOOL)a5
{
  BOOL v5 = a5;
  LODWORD(v6) = a4;
  id v8 = a3;
  v9 = [(IRSystemStateManager *)self systemState];
  uint64_t v10 = [v9 appInFocusBundleID];
  BOOL v11 = v10 != (void)v8;
  if ((id)v10 == v8)
  {
    __int16 v16 = v8;
    goto LABEL_13;
  }
  v12 = (void *)v10;
  v13 = [(IRSystemStateManager *)self systemState];
  int v14 = [v13 appInFocusBundleID];
  char v15 = [v8 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    v9 = IRAVInitialRouteSharingPolicyForBundleIdentifier(v8);
    [(IRSystemStateManager *)self _cancelAppInFocusWindowTimer];
    if (v8) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = 0;
    }
    if (v6 == 1) {
      [(IRSystemStateManager *)self _startAppInFocusWindowTimer];
    }
    else {
      BOOL v5 = 0;
    }
    v17 = [(IRSystemStateManager *)self systemState];
    __int16 v18 = (void *)[v17 copyWithReplacementAppInFocusBundleID:v8];
    [(IRSystemStateManager *)self setSystemState:v18];

    id v19 = [(IRSystemStateManager *)self systemState];
    __int16 v20 = (void *)[v19 copyWithReplacementAvInitialRouteSharingPolicy:v9];
    [(IRSystemStateManager *)self setSystemState:v20];

    v21 = [(IRSystemStateManager *)self systemState];
    __int16 v22 = (void *)[v21 copyWithReplacementAppInFocusWindowValid:v6];
    [(IRSystemStateManager *)self setSystemState:v22];

    v23 = [(IRSystemStateManager *)self systemState];
    uint64_t v24 = (void *)[v23 copyWithReplacementAppInFocusWindowScreenUnlockEvent:v5];
    [(IRSystemStateManager *)self setSystemState:v24];

    [(IRSystemStateManager *)self _initBiomeIfNeededUponAppInFocus];
    v25 = [(IRSystemStateManager *)self systemState];
    v26 = [v25 appInFocusBundleID];

    if (!v26)
    {
      BOOL v11 = 1;
      goto LABEL_14;
    }
    __int16 v16 = [(IRSystemStateManager *)self miloProvider];
    [v16 recoverServiceIfRequired];
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
}

- (void)_startAppInFocusWindowTimer
{
  objc_initWeak(&location, self);
  id v3 = [IRTimer alloc];
  id v4 = +[IRPreferences shared];
  BOOL v5 = [v4 appInFocusWindowInSeconds];
  [v5 doubleValue];
  double v7 = v6;
  id v8 = [(IRSystemStateManager *)self queue];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __51__IRSystemStateManager__startAppInFocusWindowTimer__block_invoke;
  v13 = &unk_26539FA70;
  objc_copyWeak(&v14, &location);
  v9 = [(IRTimer *)v3 initWithInterval:0 repeats:v8 queue:&v10 block:v7];
  -[IRSystemStateManager setAppInFocusWindowTimer:](self, "setAppInFocusWindowTimer:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)monitor:(id)a3 didUpdateAppInFocus:(id)a4 isScreenUnlockEvent:(BOOL)a5
{
  id v7 = a4;
  id v8 = [(IRSystemStateManager *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__IRSystemStateManager_monitor_didUpdateAppInFocus_isScreenUnlockEvent___block_invoke;
  v10[3] = &unk_2653A00C0;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  IRDispatchAsyncWithStrongSelf(v8, self, v10);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAppInFocusWindowTimer:(id)a3
{
}

- (void)_initBiomeIfNeededUponAppInFocus
{
  if ([(IRSystemStateManager *)self isBiomeRegistered]) {
    return;
  }
  id v3 = [(IRSystemStateManager *)self contextObserver];
  id v4 = [v3 getService];
  uint64_t v5 = [v4 servicePackage];

  if (v5 != 1) {
    return;
  }
  double v6 = [(IRSystemStateManager *)self systemState];
  id v7 = [v6 appInFocusBundleID];
  if ([v7 isEqual:@"com.apple.TVRemoteUIService"])
  {
  }
  else
  {
    id v8 = [(IRSystemStateManager *)self systemState];
    id v9 = [v8 appInFocusBundleID];
    char v10 = [v9 isEqual:@"com.apple.facetime"];

    if ((v10 & 1) == 0) {
      return;
    }
  }
  for (uint64_t i = 1; i != 4; ++i)
  {
    if (!+[IRSystemStateManager isObservedEventType:i]) {
      continue;
    }
    BOOL v12 = [(IRSystemStateManager *)self biomeProvider];
    [v12 addObserver:self forEvent:i];

    v13 = [(IRSystemStateManager *)self biomeProvider];
    id v14 = [v13 fetchLatestEventsOfEventType:i numEvents:1];

    if (v14 && [v14 count] == 1)
    {
      if (i == 2)
      {
        v17 = [v14 firstObject];
        __int16 v16 = [v17 eventBody];

        [(IRSystemStateManager *)self _updateSystemStateWithMediaRoute:v16];
        goto LABEL_14;
      }
      if (i == 1)
      {
        char v15 = [v14 firstObject];
        __int16 v16 = [v15 eventBody];

        [(IRSystemStateManager *)self _updateSystemStateWithDeviceWiFi:v16];
LABEL_14:
      }
    }
  }

  [(IRSystemStateManager *)self setIsBiomeRegistered:1];
}

- (BOOL)isBiomeRegistered
{
  return self->_isBiomeRegistered;
}

- (void)_cancelAppInFocusWindowTimer
{
  id v3 = [(IRSystemStateManager *)self appInFocusWindowTimer];

  if (v3)
  {
    id v4 = [(IRSystemStateManager *)self appInFocusWindowTimer];
    [v4 invalidate];

    [(IRSystemStateManager *)self setAppInFocusWindowTimer:0];
  }
}

- (IRTimer)appInFocusWindowTimer
{
  return self->_appInFocusWindowTimer;
}

- (IRNearbyDeviceContainerDO)nearbyDeviceContainer
{
  return self->_nearbyDeviceContainer;
}

- (void)logProviderState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(IRSystemStateManager *)self nearbyDeviceContainer];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#system-state-manager, Cached Nearby devices: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (IRSystemStateManager)initWithQueue:(id)a3 contextObserver:(id)a4 biomeProvider:(id)a5 miloProvider:(id)a6 proximityProvider:(id)a7 serviceStore:(id)a8 displayMonitor:(id)a9 audioAVOutputContextController:(id)a10 isLowLatencyMiLo:(BOOL)a11
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v72.receiver = self;
  v72.super_class = (Class)IRSystemStateManager;
  v25 = [(IRSystemStateManager *)&v72 init];
  if (v25)
  {
    id v71 = v24;
    id v26 = objc_alloc_init(MEMORY[0x263F38510]);
    id v70 = v17;
    [(IRSystemStateManager *)v25 setQueue:v17];
    id v69 = v18;
    [(IRSystemStateManager *)v25 setContextObserver:v18];
    id v68 = v19;
    [(IRSystemStateManager *)v25 setBiomeProvider:v19];
    id v67 = v20;
    [(IRSystemStateManager *)v25 setMiloProvider:v20];
    id v65 = v22;
    [(IRSystemStateManager *)v25 setServiceStore:v22];
    id v66 = v21;
    [(IRSystemStateManager *)v25 setProximityProvider:v21];
    id v64 = v23;
    [(IRSystemStateManager *)v25 setDisplayMonitor:v23];
    [(IRSystemStateManager *)v25 setAudioAVOutputContextController:v24];
    v27 = (void *)[v26 copyMyAppleIDAndReturnError:0];
    v28 = [MEMORY[0x263EFFA18] localTimeZone];
    uint64_t v29 = [v28 secondsFromGMT];
    v30 = [(IRSystemStateManager *)v25 displayMonitor];
    char v31 = [v30 isContinuityDisplay];
    v32 = [(IRSystemStateManager *)v25 displayMonitor];
    BYTE1(v63) = [v32 displayOn];
    LOBYTE(v63) = v31;
    LOWORD(v62) = 0;
    +[IRSystemStateDO systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:](IRSystemStateDO, "systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:displayOn:", 0, 0, 0, 0, 0, v27, 0, 0, v29, 0, 0, 0, 0, 0,
      0,
      v62,
      0,
    v33 = v63);
    [(IRSystemStateManager *)v25 setSystemState:v33];

    v34 = [IRNearbyDeviceContainerDO alloc];
    v35 = [MEMORY[0x263EFFA08] set];
    v36 = [(IRNearbyDeviceContainerDO *)v34 initWithFreezeDateNIHomeDevice:0 nearbyDevices:v35];
    [(IRSystemStateManager *)v25 setNearbyDeviceContainer:v36];

    [(IRSystemStateManager *)v25 _registerToMiLo:a11];
    v37 = [(IRSystemStateManager *)v25 proximityProvider];
    [v37 addObserver:v25];

    v38 = [(IRSystemStateManager *)v25 displayMonitor];
    [v38 addObserver:v25];

    v39 = [(IRSystemStateManager *)v25 audioAVOutputContextController];
    [v39 addObserver:v25];

    v40 = [(IRSystemStateManager *)v25 displayMonitor];
    v41 = [v40 getAppInFocusWithTimestamp];

    v42 = +[IRPreferences shared];
    v43 = [v42 appInFocusWindowEnableOnServiceRun];
    if ([v43 BOOLValue])
    {
      BOOL v44 = 1;
    }
    else
    {
      v45 = [MEMORY[0x263EFF910] now];
      v46 = [v41 second];
      [v45 timeIntervalSinceDate:v46];
      double v48 = v47;
      v49 = +[IRPreferences shared];
      v50 = [v49 appInFocusWindowInSeconds];
      [v50 doubleValue];
      BOOL v44 = v48 <= v51;
    }
    v52 = [v41 first];
    [(IRSystemStateManager *)v25 _updateSystemStateWithAppInFocus:v52 andOpenWindowIfApplicable:v44 isScreenUnlockEvent:0];

    v53 = [(IRSystemStateManager *)v25 audioAVOutputContextController];
    v54 = [v53 getOutputDevice];
    [(IRSystemStateManager *)v25 _updateSystemStateWithOutputDevice:v54];

    v55 = [(IRSystemStateManager *)v25 audioAVOutputContextController];
    v56 = [v55 getPredictedOutputDevice];
    [(IRSystemStateManager *)v25 _updateSystemStateWithPredictedOutputDevice:v56];

    v57 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v58 = (void *)*MEMORY[0x263F50090];
    id v19 = v68;
    id v18 = v69;
    id v23 = v64;
    id v24 = v71;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      v59 = v58;
      v60 = [(IRSystemStateManager *)v25 systemState];
      *(_DWORD *)buf = 136315650;
      v74 = "#system-state-manager, ";
      __int16 v75 = 2112;
      v76 = v57;
      __int16 v77 = 2112;
      v78 = v60;
      _os_log_impl(&dword_25418E000, v59, OS_LOG_TYPE_DEFAULT, "%s[%@], Initial state of system state = %@", buf, 0x20u);
    }
    id v17 = v70;
    id v21 = v66;
    id v20 = v67;
    id v22 = v65;
  }

  return v25;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IRSystemStateManager;
  [(IRSystemStateManager *)&v2 dealloc];
}

- (void)deallocSync
{
  [(IRSystemStateManager *)self _unregisterFromMiLo];
  [(IRSystemStateManager *)self _unregisterForBiomeEvents];
  id v3 = [(IRSystemStateManager *)self proximityProvider];
  [v3 removeObserver:self];

  id v4 = [(IRSystemStateManager *)self displayMonitor];
  [v4 removeObserver:self];

  id v5 = [(IRSystemStateManager *)self audioAVOutputContextController];
  [v5 removeObserver:self];
}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(IRSystemStateManager *)self queue];
  dispatch_assert_queue_V2(v7);

  [(IRSystemStateManager *)self _updateSystemStateWithAppInFocusWindowEnd];
  [(IRSystemStateManager *)self _checkAndStartPDRFenceLogicIfNeededWithEvent:v8 andCandidate:v6];

  [(IRSystemStateManager *)self _didUpdateContextWithReason:@"Add event"];
  [(IRSystemStateManager *)self _checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:v8];
}

- (BOOL)startLowLatencyMiLo
{
  id v3 = [(IRSystemStateManager *)self miloProvider];
  int v4 = [v3 startLowLatencyMiLo];

  if (v4)
  {
    id v5 = [(IRSystemStateManager *)self miloProvider];
    id v6 = [v5 requestSinglePrediction];

    id v7 = [MEMORY[0x263EFFA08] set];
    id v8 = [MEMORY[0x263EFFA08] set];
    id v9 = [MEMORY[0x263EFF910] date];
    char v10 = +[IRMiloLslPredictionDO miloLslPredictionDOWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](IRMiloLslPredictionDO, "miloLslPredictionDOWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v6, 0, 0, v7, v8, v9, +[IRMiLoProvider highConfidenceValue], 0);
    [(IRSystemStateManager *)self setMiloProviderLslPredictionResults:v10];
  }
  return v4;
}

- (void)endAppInFocusWindow
{
  if ([(IRSystemStateManager *)self _updateSystemStateWithAppInFocusWindowEnd])
  {
    [(IRSystemStateManager *)self _didUpdateContextWithReason:@"App in focus window end"];
  }
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(IRSystemStateManager *)self setMiloProviderLslPredictionResults:0];
  [(IRSystemStateManager *)self _unregisterFromMiLo];
  [(IRSystemStateManager *)self _registerToMiLo:v3];
  id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    id v7 = NSNumber;
    id v8 = v6;
    id v9 = [v7 numberWithBool:v3];
    int v10 = 136315650;
    id v11 = "#system-state-manager, ";
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    char v15 = v9;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], MiLo session restarting with isLowLatencyMiLo: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_registerToMiLo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = +[IRPreferences shared];
  id v6 = [v5 miloEnable];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    id v17 = [(IRSystemStateManager *)self miloProvider];
    id v8 = [(IRSystemStateManager *)self contextObserver];
    id v9 = [v8 getService];
    int v10 = [v9 serviceIdentifier];
    id v11 = objc_alloc(MEMORY[0x263F08C38]);
    __int16 v12 = [(IRSystemStateManager *)self serviceStore];
    v13 = [v12 fetchMiLoServiceUuid];
    __int16 v14 = (void *)[v11 initWithUUIDString:v13];
    [v17 addObserver:self withToken:v10 withLegacyServiceUUID:v14 isLowLatency:v3];
  }
  else
  {
    char v15 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v16 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "#system-state-manager, ";
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_INFO, "%s[%@], MiLo is not enabled in user defaults", buf, 0x16u);
    }
  }
}

- (void)_unregisterFromMiLo
{
  id v2 = [(IRSystemStateManager *)self miloProvider];
  [v2 removeObserver];
}

- (void)_unregisterForBiomeEvents
{
  for (uint64_t i = 1; i != 4; ++i)
  {
    if (+[IRSystemStateManager isObservedEventType:i])
    {
      int v4 = [(IRSystemStateManager *)self biomeProvider];
      [v4 removeObserver:self forEvent:i];
    }
  }
}

- (void)_checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:(id)a3
{
  if ([a3 isPickerChoiceEvent])
  {
    id v6 = [(IRSystemStateManager *)self systemState];
    int v4 = [MEMORY[0x263EFF910] now];
    id v5 = (void *)[v6 copyWithReplacementLatestPickerChoiceDate:v4];
    [(IRSystemStateManager *)self setSystemState:v5];
  }
}

void __51__IRSystemStateManager__startAppInFocusWindowTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained endAppInFocusWindow];
    id WeakRetained = v2;
  }
}

- (void)_checkAndStartPDRFenceLogicIfNeededWithEvent:(id)a3 andCandidate:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IRSystemStateManager *)self pdrFenceTimer];

  if (!v8)
  {
    id v9 = +[IREventDO eventDOWithMediaType:9];
    int v10 = +[IREventDO eventDOWithMediaType:10];
    id v11 = +[IREventDO eventDOWithMediaType:0];
    if (([v6 isEqual:v9] & 1) != 0
      || ([v6 isEqual:v10] & 1) != 0
      || [v7 isBrokeredDevice] && objc_msgSend(v6, "isEqual:", v11))
    {
      __int16 v12 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      v13 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "#system-state-manager, ";
        __int16 v43 = 2112;
        BOOL v44 = v12;
        _os_log_impl(&dword_25418E000, v13, OS_LOG_TYPE_INFO, "%s[%@], Starting PDRFence PDR fence logic", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      __int16 v14 = +[IRPreferences shared];
      char v15 = [v14 pdrFenceOtherThanRadiusTimeoutInSeconds];
      uint64_t v16 = [v15 integerValue];

      if (+[IRCMPDRFenceBridge isAvailable])
      {
        id v17 = [(IRSystemStateManager *)self pdrFenceBridge];
        BOOL v18 = v17 == 0;

        if (v18)
        {
          id v19 = [[IRCMPDRFenceBridge alloc] initWithFenceIdentifier:@"PDRFence"];
          [(IRSystemStateManager *)self setPdrFenceBridge:v19];
        }
        __int16 v20 = [(IRSystemStateManager *)self pdrFenceBridge];
        [v20 startSession];

        id v21 = +[IRPreferences shared];
        uint64_t v22 = [v21 pdrFenceRadiusInMeters];
        [v22 floatValue];
        int v24 = v23;

        v25 = [(IRSystemStateManager *)self pdrFenceBridge];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke;
        v39[3] = &unk_26539FA70;
        objc_copyWeak(&v40, (id *)buf);
        LODWORD(v26) = v24;
        [v25 setFence:v39 withCompletion:v26];

        v27 = +[IRPreferences shared];
        v28 = [v27 pdrFenceRadiusTimeoutInSeconds];
        uint64_t v16 = [v28 integerValue];

        objc_destroyWeak(&v40);
      }
      uint64_t v29 = [IRTimer alloc];
      v30 = [(IRSystemStateManager *)self queue];
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      v36 = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_19;
      v37 = &unk_26539FA70;
      objc_copyWeak(&v38, (id *)buf);
      char v31 = [(IRTimer *)v29 initWithInterval:0 repeats:v30 queue:&v34 block:(double)v16];
      -[IRSystemStateManager setPdrFenceTimer:](self, "setPdrFenceTimer:", v31, v34, v35, v36, v37);

      v32 = [(IRSystemStateManager *)self systemState];
      v33 = (void *)[v32 copyWithReplacementPdrFenceActive:1];
      [(IRSystemStateManager *)self setSystemState:v33];

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained queue];

    if (v3)
    {
      int v4 = [v2 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_2;
      block[3] = &unk_26539FCE8;
      id v6 = v2;
      dispatch_async(v4, block);
    }
  }
}

uint64_t __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  BOOL v3 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "#system-state-manager, ";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_INFO, "%s[%@], PDR fence crossed", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) _checkAndStopPDRFenceLogicIfNeeded];
}

void __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_19(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    BOOL v3 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      int v5 = "#system-state-manager, ";
      __int16 v6 = 2112;
      __int16 v7 = v2;
      _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_INFO, "%s[%@], PDR fence timeout", (uint8_t *)&v4, 0x16u);
    }

    [WeakRetained _checkAndStopPDRFenceLogicIfNeeded];
  }
}

- (void)_checkAndStopPDRFenceLogicIfNeeded
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(IRSystemStateManager *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(IRSystemStateManager *)self pdrFenceTimer];

  if (v4)
  {
    int v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    __int16 v6 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "#system-state-manager, ";
      __int16 v14 = 2112;
      char v15 = v5;
      _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_INFO, "%s[%@], Stopping PDR fence logic", (uint8_t *)&v12, 0x16u);
    }

    __int16 v7 = [(IRSystemStateManager *)self pdrFenceBridge];
    [v7 clearFence];

    uint64_t v8 = [(IRSystemStateManager *)self pdrFenceBridge];
    [v8 endSession];

    uint64_t v9 = [(IRSystemStateManager *)self pdrFenceTimer];
    [v9 invalidate];

    [(IRSystemStateManager *)self setPdrFenceTimer:0];
    int v10 = [(IRSystemStateManager *)self systemState];
    id v11 = (void *)[v10 copyWithReplacementPdrFenceActive:0];
    [(IRSystemStateManager *)self setSystemState:v11];

    [(IRSystemStateManager *)self _didUpdateContextWithReason:@"PDR fence crossed"];
  }
}

- (void)provider:(id)a3 didUpdateDeviceWiFi:(id)a4
{
  id v5 = a4;
  __int16 v6 = [(IRSystemStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__IRSystemStateManager_provider_didUpdateDeviceWiFi___block_invoke;
  v8[3] = &unk_2653A0078;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __53__IRSystemStateManager_provider_didUpdateDeviceWiFi___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithDeviceWiFi:*(void *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Device WiFi"];
  }
}

- (void)provider:(id)a3 didUpdateMediaRoute:(id)a4
{
  id v5 = a4;
  __int16 v6 = [(IRSystemStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__IRSystemStateManager_provider_didUpdateMediaRoute___block_invoke;
  v8[3] = &unk_2653A0078;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __53__IRSystemStateManager_provider_didUpdateMediaRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithMediaRoute:*(void *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Media route"];
  }
}

- (void)deleteLegacyServiceIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(IRSystemStateManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  int v4 = [(IRSystemStateManager *)self serviceStore];
  LOBYTE(v3) = [v4 updateMiloServiceWithMiloUuidString:0];

  id v5 = (const void **)MEMORY[0x263F50120];
  __int16 v6 = (os_log_t *)MEMORY[0x263F50090];
  if ((v3 & 1) == 0)
  {
    id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "#system-state-manager, ";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Milo Save error] Could not update milo service to nil in DB", (uint8_t *)&v11, 0x16u);
    }
  }
  id v9 = dispatch_get_specific(*v5);
  int v10 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "#system-state-manager, ";
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_INFO, "%s[%@], deleteLegacyServiceIdentifier", (uint8_t *)&v11, 0x16u);
  }
}

- (id)_miloLslPredictionToDO:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    int v4 = [v3 predictedEvents];
    uint64_t v16 = [v4 compactMap:&__block_literal_global_9];

    id v5 = [IRMiloLslPredictionDO alloc];
    __int16 v6 = [v3 predictionId];
    id v7 = [v6 UUIDString];
    uint64_t v8 = [v3 miLoServiceQuality];
    uint64_t v9 = [v3 miLoServiceQualityReasonBitmap];
    int v10 = [MEMORY[0x263EFFA08] setWithArray:v16];
    int v11 = [v3 predictionTime];
    uint64_t v12 = [v3 confidence];
    uint64_t v13 = [v3 confidenceReasonBitmap];

    __int16 v14 = [(IRMiloLslPredictionDO *)v5 initWithPredictionId:v7 miLoServiceQuality:v8 miLoServiceQualityReasonBitmap:v9 scores:v10 nearbyDevices:0 predictionTime:v11 confidence:v12 confidenceReasonBitmap:v13];
  }
  else
  {
    __int16 v14 = 0;
  }

  return v14;
}

IRMiloLslSingleScoreDO *__47__IRSystemStateManager__miloLslPredictionToDO___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [IRMiloLslSingleScoreDO alloc];
  int v4 = [v2 score];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [v2 eventId];

  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [(IRMiloLslSingleScoreDO *)v3 initWithScore:v8 eventID:v6];

  return v9;
}

- (void)onPrediction:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(IRSystemStateManager *)self queue];
  dispatch_assert_queue_V2(v5);

  double v6 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v7 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = v7;
    int v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v4, "miLoServiceQuality"));
    int v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "miLoServiceQualityReasonBitmap"));
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "confidence"));
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "confidenceReasonBitmap"));
    __int16 v14 = NSNumber;
    uint64_t v15 = [v4 predictedEvents];
    uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    int v18 = 136316930;
    id v19 = "#system-state-manager, ";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    char v31 = v13;
    __int16 v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "%s[%@], Received MiLo prediction: %@ with quality: %@ and reason: %@, confidence: %@, Confidence Reason: %@, Num Evets = %@", (uint8_t *)&v18, 0x52u);
  }
  id v17 = [(IRSystemStateManager *)self _miloLslPredictionToDO:v4];
  [(IRSystemStateManager *)self setMiloProviderLslPredictionResults:v17];

  [(IRSystemStateManager *)self _didUpdateContextWithReason:@"MiLo prediction"];
}

- (void)onUpdateLOIType:(int)a3 WithLOIIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(IRSystemStateManager *)self queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v9 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    int v11 = IRLocationSemanticUserSpecificPlaceTypeToString(v4);
    int v12 = 136315906;
    uint64_t v13 = "#system-state-manager, ";
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_DEFAULT, "%s[%@], Received MiLo LOI update with LOI type: %@ and identifier: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(IRSystemStateManager *)self _updateSystemStateWithLOIType:v4 WithLOIIdentifier:v6];
  [(IRSystemStateManager *)self _didUpdateContextWithReason:@"Location Semantic"];
}

- (void)didSpotOnLocationCompleteWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(IRSystemStateManager *)self contextObserver];
  [v5 didSpotOnLocationComplete:v4];
}

- (BOOL)_updateSystemStateWithIsContinuityDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [(IRSystemStateManager *)v4 systemState];
  uint64_t v8 = (void *)[v7 copyWithReplacementIsContinuityDisplay:v3];
  [(IRSystemStateManager *)v4 setSystemState:v8];

  uint64_t v9 = [(IRSystemStateManager *)v4 systemState];
  LOBYTE(v4) = [v9 isEqual:v6] ^ 1;

  return (char)v4;
}

- (BOOL)_updateSystemStateWithDisplayOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [(IRSystemStateManager *)v4 systemState];
  uint64_t v8 = (void *)[v7 copyWithReplacementDisplayOn:v3];
  [(IRSystemStateManager *)v4 setSystemState:v8];

  uint64_t v9 = [(IRSystemStateManager *)v4 systemState];
  LOBYTE(v4) = [v9 isEqual:v6] ^ 1;

  return (char)v4;
}

- (BOOL)_updateSystemStateWithDeviceWiFi:(id)a3
{
  id v4 = a3;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [(IRSystemStateManager *)self systemState];
  uint64_t v8 = [v4 SSID];

  uint64_t v9 = (void *)[v7 copyWithReplacementDeviceWiFiSSID:v8];
  [(IRSystemStateManager *)self setSystemState:v9];

  int v10 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v9) = [v10 isEqual:v6] ^ 1;

  return (char)v9;
}

- (BOOL)_updateSystemStateWithLOIType:(int)a3 WithLOIIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(IRSystemStateManager *)self systemState];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [(IRSystemStateManager *)self systemState];
  int v10 = (void *)[v9 copyWithReplacementLocationSemanticUserSpecificPlaceType:v4];
  [(IRSystemStateManager *)self setSystemState:v10];

  int v11 = [(IRSystemStateManager *)self systemState];
  int v12 = (void *)[v11 copyWithReplacementLocationSemanticLoiIdentifier:v6];

  [(IRSystemStateManager *)self setSystemState:v12];
  uint64_t v13 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v11) = [v13 isEqual:v8] ^ 1;

  return (char)v11;
}

- (BOOL)_updateSystemStateWithMediaRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [v4 groupLeaderOutputDeviceID];
  if (v7)
  {
    uint64_t v8 = [v4 outputDevices];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      id v7 = [v4 groupLeaderOutputDeviceID];
    }
    else
    {
      id v7 = 0;
    }
  }
  int v10 = [(IRSystemStateManager *)self systemState];
  int v11 = (void *)[v10 copyWithReplacementMediaRouteGroupLeaderOutputDeviceID:v7];
  [(IRSystemStateManager *)self setSystemState:v11];

  int v12 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v10) = [v12 isEqual:v6] ^ 1;

  return (char)v10;
}

- (BOOL)_updateSystemStateWithAppInFocusWindowEnd
{
  BOOL v3 = [(IRSystemStateManager *)self systemState];
  id v4 = (void *)[v3 copy];

  [(IRSystemStateManager *)self _cancelAppInFocusWindowTimer];
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copyWithReplacementAppInFocusWindowValid:0];
  [(IRSystemStateManager *)self setSystemState:v6];

  id v7 = [(IRSystemStateManager *)self systemState];
  uint64_t v8 = (void *)[v7 copyWithReplacementAppInFocusWindowScreenUnlockEvent:0];
  [(IRSystemStateManager *)self setSystemState:v8];

  uint64_t v9 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v7) = [v9 isEqual:v4] ^ 1;

  return (char)v7;
}

- (BOOL)_updateSystemStateWithOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [(IRSystemStateManager *)self systemState];
  uint64_t v8 = [v4 deviceName];
  uint64_t v9 = (void *)[v7 copyWithReplacementOutputDeviceName:v8];
  [(IRSystemStateManager *)self setSystemState:v9];

  int v10 = [(IRSystemStateManager *)self systemState];
  int v11 = objc_msgSend(v10, "copyWithReplacementOutputDeviceType:", objc_msgSend(v4, "deviceType"));
  [(IRSystemStateManager *)self setSystemState:v11];

  int v12 = [(IRSystemStateManager *)self systemState];
  uint64_t v13 = [v4 deviceSubType];

  __int16 v14 = (void *)[v12 copyWithReplacementOutputDeviceSubType:v13];
  [(IRSystemStateManager *)self setSystemState:v14];

  uint64_t v15 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v14) = [v15 isEqual:v6] ^ 1;

  return (char)v14;
}

- (BOOL)_updateSystemStateWithPredictedOutputDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(IRSystemStateManager *)self systemState];
  id v6 = (void *)[v5 copy];

  id v7 = [(IRSystemStateManager *)self systemState];
  uint64_t v8 = [v4 deviceName];
  uint64_t v9 = (void *)[v7 copyWithReplacementPredictedOutputDeviceName:v8];
  [(IRSystemStateManager *)self setSystemState:v9];

  int v10 = [(IRSystemStateManager *)self systemState];
  int v11 = objc_msgSend(v10, "copyWithReplacementPredictedOutputDeviceType:", objc_msgSend(v4, "deviceType"));
  [(IRSystemStateManager *)self setSystemState:v11];

  int v12 = [(IRSystemStateManager *)self systemState];
  uint64_t v13 = [v4 deviceSubType];

  __int16 v14 = (void *)[v12 copyWithReplacementPredictedOutputDeviceSubType:v13];
  [(IRSystemStateManager *)self setSystemState:v14];

  uint64_t v15 = [(IRSystemStateManager *)self systemState];
  LOBYTE(v14) = [v15 isEqual:v6] ^ 1;

  return (char)v14;
}

- (void)provider:(id)a3 didUpdateNearbyDevices:(id)a4
{
  id v5 = a4;
  id v6 = [(IRSystemStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__IRSystemStateManager_provider_didUpdateNearbyDevices___block_invoke;
  v8[3] = &unk_2653A0078;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __56__IRSystemStateManager_provider_didUpdateNearbyDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 nearbyDeviceContainer];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = +[IRPreferences shared];
  id v7 = [v6 deviceRangeProximityThreshold];
  [v7 doubleValue];
  BOOL v8 = +[IRProximityProvider didContainer:changeWithUpdatetContainer:andRangeThreshold:](IRProximityProvider, "didContainer:changeWithUpdatetContainer:andRangeThreshold:", v4, v5);

  id v9 = (void *)[*(id *)(a1 + 32) copy];
  [v3 setNearbyDeviceContainer:v9];

  if (v8)
  {
    [v3 _didUpdateContextWithReason:@"nearby device change"];
    int v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    int v11 = *MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 136315650;
      __int16 v14 = "#system-state-manager, ";
      __int16 v15 = 2112;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_DEFAULT, "%s[%@], Updated cached nearby devices: %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)monitor:(id)a3 didUpdateIsContinuityDisplay:(BOOL)a4
{
  id v6 = [(IRSystemStateManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__IRSystemStateManager_monitor_didUpdateIsContinuityDisplay___block_invoke;
  v7[3] = &__block_descriptor_33_e30_v16__0__IRSystemStateManager_8l;
  BOOL v8 = a4;
  IRDispatchAsyncWithStrongSelf(v6, self, v7);
}

void __61__IRSystemStateManager_monitor_didUpdateIsContinuityDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithIsContinuityDisplay:*(unsigned __int8 *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Continuity display"];
  }
}

- (void)monitor:(id)a3 didUpdateDisplayOn:(BOOL)a4
{
  id v6 = [(IRSystemStateManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__IRSystemStateManager_monitor_didUpdateDisplayOn___block_invoke;
  v7[3] = &__block_descriptor_33_e30_v16__0__IRSystemStateManager_8l;
  BOOL v8 = a4;
  IRDispatchAsyncWithStrongSelf(v6, self, v7);
}

void __51__IRSystemStateManager_monitor_didUpdateDisplayOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithDisplayOn:*(unsigned __int8 *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Display On"];
  }
}

- (void)context:(id)a3 didUpdateOutputDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(IRSystemStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__IRSystemStateManager_context_didUpdateOutputDevice___block_invoke;
  v8[3] = &unk_2653A0078;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __54__IRSystemStateManager_context_didUpdateOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithOutputDevice:*(void *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Output device"];
  }
}

- (void)context:(id)a3 didUpdatePredicatedOutputDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(IRSystemStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__IRSystemStateManager_context_didUpdatePredicatedOutputDevice___block_invoke;
  v8[3] = &unk_2653A0078;
  id v9 = v5;
  id v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);
}

void __64__IRSystemStateManager_context_didUpdatePredicatedOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _updateSystemStateWithPredictedOutputDevice:*(void *)(a1 + 32)]) {
    [v3 _didUpdateContextWithReason:@"Predicted output device"];
  }
}

+ (BOOL)isObservedEventType:(int64_t)a3
{
  return a3 != 3;
}

- (void)setMiloProviderLslPredictionResults:(id)a3
{
}

- (void)setNearbyDeviceContainer:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setContextObserver:(id)a3
{
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
}

- (void)setMiloProvider:(id)a3
{
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
}

- (IRServiceStore)serviceStore
{
  return self->_serviceStore;
}

- (void)setServiceStore:(id)a3
{
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
}

- (void)setIsBiomeRegistered:(BOOL)a3
{
  self->_isBiomeRegistered = a3;
}

- (IRCMPDRFenceBridge)pdrFenceBridge
{
  return self->_pdrFenceBridge;
}

- (void)setPdrFenceBridge:(id)a3
{
}

- (IRTimer)pdrFenceTimer
{
  return self->_pdrFenceTimer;
}

- (void)setPdrFenceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdrFenceTimer, 0);
  objc_storeStrong((id *)&self->_pdrFenceBridge, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowTimer, 0);
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_serviceStore, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_miloProvider, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);
  objc_destroyWeak((id *)&self->_contextObserver);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceContainer, 0);

  objc_storeStrong((id *)&self->_miloProviderLslPredictionResults, 0);
}

@end