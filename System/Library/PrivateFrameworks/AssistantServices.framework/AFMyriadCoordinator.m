@interface AFMyriadCoordinator
+ (id)currentCoordinator;
+ (void)clearCurrentCoordinator;
+ (void)didChangeDefaults;
- (AFMyriadCoordinator)initWithDelegate:(id)a3;
- (BOOL)_deviceShouldContinue:(id)a3;
- (BOOL)_inTaskTriggerWasTooSoon;
- (BOOL)_isAPhone:(unsigned __int8)a3;
- (BOOL)_okayToSuppressOnOutput;
- (BOOL)_shouldContinueFor:(id)a3;
- (BOOL)_shouldHandleEmergency;
- (BOOL)_shouldStopListeningBeforeAdvertising;
- (BOOL)_shouldUseContextCollector;
- (BOOL)_testAndUpdateWedgeFilter:(id)a3;
- (BOOL)inTask;
- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4;
- (float)deviceTrumpDelay;
- (id)_endAdvertisingAnalyticsContext:(BOOL)a3;
- (id)_myriadSession;
- (id)_phsSetupRecord;
- (id)_sortedReplies;
- (id)_sortedReplies:(id)a3;
- (id)_stateAsString;
- (id)_stateAsString:(unint64_t)a3;
- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6;
- (id)_triggerTypeForArbitrationParticipationFrom:(int64_t)a3;
- (id)continuationRecord;
- (id)directTriggerRecord;
- (id)emergencyHandledRecord;
- (id)emergencyRecord;
- (id)emptyRecord;
- (id)lateSuppressionRecord;
- (id)responseObject:(unsigned __int16)a3;
- (id)slowdownRecord:(unsigned __int16)a3;
- (id)voiceTriggerRecord;
- (int)_myriadStateForSelf:(unint64_t)a3;
- (unint64_t)_nextElectionPublisherState;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3;
- (void)_adjustActionWindowsFromSlowdown:(int)a3;
- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 andMoveTo:(unint64_t)a6;
- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4;
- (void)_advertiseIndefinite:(id)a3;
- (void)_advertiseSlowdown;
- (void)_advertiseSuppressTriggerInOutput;
- (void)_advertiseTrigger;
- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 thenExecute:(id)a6;
- (void)_ageWedgeFilter;
- (void)_cancelOverallTimeout;
- (void)_cancelTimer;
- (void)_clearMyriadSession;
- (void)_clearWiProxReadinessTimer;
- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4;
- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4;
- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4;
- (void)_createMyriadSessionIfRequired;
- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4;
- (void)_duringNextWindowEnterState:(unint64_t)a3;
- (void)_duringNextWindowExecute:(id)a3;
- (void)_endAdvertising:(id)a3;
- (void)_endAdvertisingWithDeviceProhibitions:(id)a3;
- (void)_enterBLEDiagnosticMode;
- (void)_enterState:(unint64_t)a3;
- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4;
- (void)_forceLocalWinner:(id)a3;
- (void)_handleStateMachineErrorIfNeeded;
- (void)_initDeviceClassAndAdjustments;
- (void)_initializeTimer;
- (void)_initializeWiProxReadinessTimer;
- (void)_leaveBLEDiagnosticMode;
- (void)_loseElection;
- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4;
- (void)_readDefaults;
- (void)_resetActionWindows;
- (void)_resetAdvertisementTimings;
- (void)_resetAudioData;
- (void)_resumeWiProxReadinessTimer;
- (void)_setMyriadContext:(id)a3;
- (void)_setOverallTimeout;
- (void)_setupActionWindows;
- (void)_signalEmergencyCallHandled;
- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)_startAdvertisingFromInTaskVoiceTrigger;
- (void)_startAdvertisingFromVoiceTrigger;
- (void)_startListenTimer;
- (void)_startListening:(id)a3;
- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5;
- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5;
- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5;
- (void)_stopAdvertising:(id)a3;
- (void)_stopAdvertisingAndListening;
- (void)_stopListening:(id)a3;
- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4;
- (void)_suspendWiProxReadinessTimer;
- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3;
- (void)_triggerABCForType:(id)a3 context:(id)a4;
- (void)_unduck;
- (void)_updateArbitrationParticipationContextWithCompletion:(id)a3;
- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5;
- (void)_updateVoiceTriggerTimeFromFile;
- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4;
- (void)_waitWiProxAndExecute:(id)a3;
- (void)_winElection;
- (void)advertiseWith:(id)a3;
- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)dealloc;
- (void)endAdvertising:(id)a3;
- (void)endAdvertisingAfterDelay:(float)a3;
- (void)endAdvertisingWithDeviceProhibitions:(id)a3;
- (void)endTask;
- (void)enterState:(unint64_t)a3;
- (void)faceDetectedBoostWithMyriadContext:(id)a3;
- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4;
- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5;
- (void)heySiriAdvertisingPending:(id)a3;
- (void)heySiriDidUpdateState:(id)a3;
- (void)heySiriStartedAdvertising:(id)a3;
- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4;
- (void)heySiriStartedScanning:(id)a3;
- (void)heySiriStoppedAdvertising:(id)a3;
- (void)heySiriStoppedScanning:(id)a3;
- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4;
- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4;
- (void)myriadSession:(id)a3;
- (void)notifyCurrentDecisionResult;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
- (void)preheatWiProx;
- (void)readDefaults;
- (void)requestWillPresentUsefulUserResult;
- (void)resetMyriadCoordinator:(id)a3;
- (void)resetReplies;
- (void)resetStateMachine;
- (void)setCurrentRequestId:(id)a3;
- (void)setInTask:(BOOL)a3;
- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 withSlowdown:(int)a5;
- (void)setupEnabled:(BOOL)a3;
- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5;
- (void)startAdvertisingEmergency;
- (void)startAdvertisingEmergencyHandled;
- (void)startAdvertisingEmergencySignal;
- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4;
- (void)startAdvertisingFromAlertFiringVoiceTrigger;
- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromCarPlayTrigger;
- (void)startAdvertisingFromDirectTrigger;
- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3;
- (void)startAdvertisingFromInEarTrigger;
- (void)startAdvertisingFromInTaskVoiceTrigger;
- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromOutgoingTrigger;
- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3;
- (void)startAdvertisingFromVoiceTrigger;
- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3;
- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4;
- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3;
- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4;
- (void)startAdvertisingSlowdown:(unsigned __int16)a3;
- (void)startListening;
- (void)startListening:(id)a3;
- (void)startListeningToEmergencySignal;
- (void)startResponseAdvertising:(unsigned __int16)a3;
- (void)startWatchAdvertisingFromDirectTrigger;
- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3;
- (void)startWatchAdvertisingFromVoiceTrigger;
- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3;
- (void)stopListening;
- (void)stopListening:(id)a3;
- (void)updateRequestId:(id)a3;
- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4;
@end

@implementation AFMyriadCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arbitrationEventsDelegate, 0);
  objc_storeStrong((id *)&self->_lastWonBySmallAmountDate, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_currentMyriadContext, 0);
  objc_storeStrong(&self->_waitForWiproxReadinessToScan, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_myriadStateMachineForceNoActivityObserver, 0);
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);
  objc_storeStrong((id *)&self->_electionRepostWinDecisionPublisher, 0);
  objc_storeStrong((id *)&self->_electionLossPublisher, 0);
  objc_storeStrong((id *)&self->_electionWinPublisher, 0);
  objc_storeStrong((id *)&self->_electionBeginPublisher, 0);
  objc_storeStrong((id *)&self->_myriadSession, 0);
  objc_storeStrong((id *)&self->_goodnessScoreEvaluator, 0);
  objc_storeStrong((id *)&self->_contextRecord, 0);
  objc_storeStrong((id *)&self->_advContextManager, 0);

  objc_storeStrong((id *)&self->_sfDiagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_sfdiagnostics, 0);
  objc_storeStrong((id *)&self->_callPunchout, 0);
  objc_storeStrong((id *)&self->_triggerTime, 0);
  objc_storeStrong((id *)&self->_designatedSelfID, 0);
  objc_storeStrong((id *)&self->_heySiriBTLE, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_maxSlowdownRecord, 0);
  objc_storeStrong((id *)&self->_overrideMyriadRecord, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_overallTimeout, 0);
  objc_storeStrong((id *)&self->_eventToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_myriadAdvertisementContextQueue, 0);
  objc_storeStrong((id *)&self->_myriadWorkQueue, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_multipleContinuations, 0);
  objc_storeStrong((id *)&self->_incomingTrumps, 0);
  objc_storeStrong((id *)&self->_previousTrumps, 0);
  objc_storeStrong((id *)&self->_repliesBeforeDecision, 0);
  objc_storeStrong((id *)&self->_replyCounts, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_previousAdvertisedData, 0);
}

- (void)resetMyriadCoordinator:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AFMyriadCoordinator_resetMyriadCoordinator___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __46__AFMyriadCoordinator_resetMyriadCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _enterState:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)myriadSession:(id)a3
{
  if (a3) {
    (*((void (**)(id, AFMyriadSession *))a3 + 2))(a3, self->_myriadSession);
  }
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (float)deviceTrumpDelay
{
  return self->_deviceTrumpDelay;
}

- (void)startAdvertisingEmergencySignal
{
  [(AFMyriadCoordinator *)self _setupActionWindows];
  [(AFMyriadCoordinator *)self _enterState:8];
}

- (void)startListeningToEmergencySignal
{
  [(AFMyriadCoordinator *)self _setupActionWindows];
  [(AFMyriadCoordinator *)self _enterState:7];
}

- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = getWPHeySiriKeyManufacturerData();
    v10 = (void *)v9;
    if (v9)
    {
      uint64_t v12 = v9;
      v13[0] = v6;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [(AFMyriadCoordinator *)self heySiri:self->_heySiriBTLE foundDevice:v8 withInfo:v11];
    }
  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = (AFNotifyObserver *)a3;
  id v7 = (void *)AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [(AFNotifyObserver *)v6 name];
    int v10 = 136315650;
    v11 = "-[AFMyriadCoordinator notifyObserver:didReceiveNotificationWithToken:]";
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 1024;
    int v15 = a4;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s Notification received: %@ (%d)", (uint8_t *)&v10, 0x1Cu);
  }
  if (self->_preferencesChangedNotification == v6)
  {
    [(AFMyriadCoordinator *)self _readDefaults];
  }
  else if (self->_myriadStateMachineForceNoActivityObserver == v6)
  {
    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal) {
      [(AFMyriadCoordinator *)self _enterState:0];
    }
  }
}

- (void)_signalEmergencyCallHandled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[AFMyriadCoordinator _signalEmergencyCallHandled]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(&self->_delegate);
    [v6 myriadCoordinatorDidHandleEmergency:self];
  }
}

- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  kdebug_trace();
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFMyriadCoordinator heySiri:failedToStartScanningWithError:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon failed to start scanning with error %@", (uint8_t *)&v7, 0x16u);
  }
  [(AFMyriadCoordinator *)self _leaveBLEDiagnosticMode];
}

- (void)heySiriStoppedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[AFMyriadCoordinator heySiriStoppedScanning:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning ends", (uint8_t *)&v9, 0xCu);
  }
  [(AFMyriadCoordinator *)self _leaveBLEDiagnosticMode];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&self->_delegate);
    [v8 myriadCoordinatorBTLEDidEndScanning:self];
  }
}

- (void)heySiriStartedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[AFMyriadCoordinator heySiriStartedScanning:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning begins", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&self->_delegate);
    [v8 myriadCoordinatorBTLEDidStartScanning:self];
  }
}

- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    char v7 = "-[AFMyriadCoordinator heySiri:failedToStartAdvertisingWithError:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon failed to start advertising with error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)heySiriStoppedAdvertising:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      id v4 = +[AFAnalytics sharedAnalytics];
      v20 = @"state";
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_myriadState);
      v21[0] = v5;
      int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v4 logEventWithType:2005 context:v6];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v8 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      id v9 = [(AFMyriadSession *)self->_myriadSession sessionId];
      [(AFMyriadInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingEnded:v8 withCdaId:v9 withTimestamp:mach_absolute_time()];
    }
  }
  uint64_t v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    uint64_t v12 = mach_absolute_time();
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFMyriadCoordinator heySiriStoppedAdvertising:]";
    __int16 v18 = 2048;
    unint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v12);
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising ends at: %lld", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained(&self->_delegate);
    [v15 myriadCoordinatorBTLEDidEndAdvertising:self];
  }
}

- (void)heySiriAdvertisingPending:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[AFMyriadCoordinator heySiriAdvertisingPending:]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising overridden and now pending", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      id v5 = +[AFAnalytics sharedAnalytics];
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_myriadState, @"state");
      v15[0] = v6;
      char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v5 logEventWithType:2003 context:v7];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v9 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      uint64_t v10 = [(AFMyriadSession *)self->_myriadSession sessionId];
      [(AFMyriadInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingStarted:v9 withCdaId:v10 withTimestamp:a3];
    }
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained(&self->_delegate);
    [v13 myriadCoordinatorBTLEDidStartAdvertising:self];
  }
}

- (void)heySiriStartedAdvertising:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (AFIsHorseman_isHorseman)
  {
    int v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[AFMyriadCoordinator heySiriStartedAdvertising:]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s No longer used by this device.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      char v7 = v6;
      int v8 = 136315394;
      uint64_t v9 = "-[AFMyriadCoordinator heySiriStartedAdvertising:]";
      __int16 v10 = 2048;
      unint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v8, 0x16u);
    }
    [(AFMyriadCoordinator *)self _trackHeySiriStartedAdvertisingAt:v5];
  }
}

- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  int v6 = AFIsHorseman_isHorseman;
  char v7 = AFSiriLogContextConnection;
  BOOL v8 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = v7;
      int v10 = 136315394;
      uint64_t v11 = "-[AFMyriadCoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      __int16 v12 = 2048;
      unint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(a4);
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v10, 0x16u);
    }
    [(AFMyriadCoordinator *)self _trackHeySiriStartedAdvertisingAt:a4];
  }
  else if (v8)
  {
    int v10 = 136315138;
    uint64_t v11 = "-[AFMyriadCoordinator heySiriStartedAdvertisingAt:timeStamp:]";
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Not yet supported on this device.", (uint8_t *)&v10, 0xCu);
  }
}

- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = getWPHeySiriKeyManufacturerData();
  if (v9)
  {
    int v10 = [v8 objectForKey:v9];
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = [[AFMyriadRecord alloc] initWithDeviceID:v7 data:v10];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained(&self->_delegate);
    [v14 myriadCoordinator:self didReceiveAdvertisement:v11];
  }
  if ([(AFMyriadRecord *)v11 deviceGroup] == self->_deviceGroup)
  {
    id v15 = [(AFMyriadRecord *)v11 deviceID];
    uint64_t v16 = [v15 UUIDString];

    myriadWorkQueue = self->_myriadWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__AFMyriadCoordinator_heySiri_foundDevice_withInfo___block_invoke;
    block[3] = &unk_1E5929DF0;
    v21 = v11;
    v22 = self;
    id v23 = v7;
    id v24 = v10;
    id v25 = v16;
    __int16 v18 = v16;
    dispatch_async(myriadWorkQueue, block);

LABEL_10:
    goto LABEL_11;
  }
  v19 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = v19;
    *(_DWORD *)buf = 136315906;
    v27 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]";
    __int16 v28 = 1024;
    int v29 = [(AFMyriadRecord *)v11 deviceGroup];
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert from other deviceGroup %d: %@ data= %@", buf, 0x26u);
    goto LABEL_10;
  }
LABEL_11:
}

void __52__AFMyriadCoordinator_heySiri_foundDevice_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) pHash];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(v3 + 40);
  uint64_t v5 = [*(id *)(v3 + 360) UUIDString];
  int v6 = [v4 valueForKey:v5];
  int v7 = 0;
  for (int i = [v6 pHash] ^ v2; i; i &= i - 1)
    ++v7;

  uint64_t v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
    __int16 v66 = 2048;
    v67 = v11;
    __int16 v68 = 2112;
    uint64_t v69 = v10;
    __int16 v70 = 2112;
    uint64_t v71 = v12;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s BTLE processing advert in state: %lu from: %@ data= %@", buf, 0x2Au);
  }
  char v13 = *(void **)(a1 + 40);
  switch(v13[1])
  {
    case 0:
    case 3:
    case 4:
    case 6:
    case 9:
    case 0xBLL:
    case 0xDLL:
    case 0x10:
      id v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        id v15 = v14;
        uint64_t v16 = [v13 _stateAsString];
        uint64_t v17 = *(void *)(a1 + 48);
        uint64_t v18 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v66 = 2112;
        v67 = v16;
        __int16 v68 = 2112;
        uint64_t v69 = v17;
        __int16 v70 = 2112;
        uint64_t v71 = v18;
        _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert while in state %@: %@ data= %@", buf, 0x2Au);
      }
      return;
    case 1:
    case 0xELL:
    case 0xFLL:
      if (![*(id *)(a1 + 40) _testAndUpdateWedgeFilter:*(void *)(a1 + 32)]) {
        return;
      }
      v19 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 64)];

      if (v19)
      {
        v20 = *(void **)(*(void *)(a1 + 40) + 48);
        v21 = (void *)MEMORY[0x1E4F28ED0];
        v22 = [v20 objectForKey:*(void *)(a1 + 64)];
        id v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
        [v20 setObject:v23 forKey:*(void *)(a1 + 64)];
      }
      else
      {
        v41 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v42 = *(void **)(a1 + 48);
          uint64_t v43 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v66 = 2112;
          v67 = v42;
          __int16 v68 = 2112;
          uint64_t v69 = v43;
          _os_log_impl(&dword_19CF1D000, v41, OS_LOG_TYPE_INFO, "%s BTLE heard advert from: %@ data= %@", buf, 0x20u);
        }
        v44 = *(void **)(*(void *)(a1 + 40) + 48);
        v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
        [v44 setObject:v22 forKey:*(void *)(a1 + 64)];
      }

      if (![*(id *)(a1 + 32) isSlowdown]) {
        goto LABEL_43;
      }
      uint64_t v45 = *(void *)(a1 + 40);
      v46 = *(void **)(v45 + 304);
      if (!v46) {
        goto LABEL_39;
      }
      int v47 = [v46 slowdownDelay];
      if (v47 < (int)[*(id *)(a1 + 32) slowdownDelay])
      {
        uint64_t v45 = *(void *)(a1 + 40);
LABEL_39:
        objc_storeStrong((id *)(v45 + 304), *(id *)(a1 + 32));
        *(unsigned char *)(*(void *)(a1 + 40) + 327) = 1;
        v48 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v50 = *(void **)(a1 + 48);
          uint64_t v49 = *(void *)(a1 + 56);
          v51 = *(void **)(*(void *)(a1 + 40) + 304);
          v52 = v48;
          int v53 = [v51 slowdownDelay];
          *(_DWORD *)buf = 136315906;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v66 = 2112;
          v67 = v50;
          __int16 v68 = 2112;
          uint64_t v69 = v49;
          __int16 v70 = 1024;
          LODWORD(v71) = v53;
          _os_log_impl(&dword_19CF1D000, v52, OS_LOG_TYPE_INFO, "%s BTLE heard slowdown advert from: %@ data= %@, max delay is now %d msecs", buf, 0x26u);
        }
        kdebug_trace();
        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
        {
          v54 = +[AFAnalytics sharedAnalytics];
          v62[0] = @"delay";
          v55 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", (int)objc_msgSend(*(id *)(a1 + 32), "slowdownDelay"));
          v62[1] = @"max";
          v63[0] = v55;
          v56 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", (int)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 304), "slowdownDelay"));
          v63[1] = v56;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
          [v54 logEventWithType:2008 context:v57];
        }
      }
LABEL_43:
      if (v7 <= 16)
      {
        *(void *)(*(void *)(a1 + 40) + 592) = mach_absolute_time();
        goto LABEL_53;
      }
      v58 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v66 = 1024;
        LODWORD(v67) = v7;
        _os_log_impl(&dword_19CF1D000, v58, OS_LOG_TYPE_INFO, "%s BTLE editDist: %d > allowed, ignoring this advert ", buf, 0x12u);
      }
      return;
    case 2:
      id v31 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        __int16 v32 = *(void **)(a1 + 48);
        uint64_t v33 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v66 = 2112;
        v67 = v32;
        __int16 v68 = 2112;
        uint64_t v69 = v33;
        _os_log_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_INFO, "%s BTLE suppressing straggler response to: %@ data= %@", buf, 0x20u);
        char v13 = *(void **)(a1 + 40);
      }
      int v29 = v13;
      uint64_t v30 = 3;
      goto LABEL_52;
    case 5:
      if ([*(id *)(a1 + 32) isAContinuation])
      {
        uint64_t v34 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:*(void *)(a1 + 64)];

        if (!v34)
        {
          v35 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v36 = *(void **)(a1 + 48);
            uint64_t v37 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 136315650;
            v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
            __int16 v66 = 2112;
            v67 = v36;
            __int16 v68 = 2112;
            uint64_t v69 = v37;
            _os_log_impl(&dword_19CF1D000, v35, OS_LOG_TYPE_INFO, "%s BTLE heard another device sending continuation: %@ data= %@", buf, 0x20u);
          }
        }
        [*(id *)(*(void *)(a1 + 40) + 80) setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 64)];
      }
      return;
    case 7:
      if ([*(id *)(a1 + 32) isAnEmergency]) {
        goto LABEL_50;
      }
      return;
    case 8:
    case 0xCLL:
      id v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        id v25 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v66 = 2112;
        v67 = v25;
        _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s BTLE heard a record waiting for a emergency handled notice: %@ ", buf, 0x16u);
      }
      if (![*(id *)(a1 + 32) isAnEmergencyHandled]) {
        return;
      }
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v27 = *(void **)(a1 + 48);
        uint64_t v28 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        __int16 v66 = 2112;
        v67 = v27;
        __int16 v68 = 2112;
        uint64_t v69 = v28;
        _os_log_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration was handled: %@ data= %@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) _signalEmergencyCallHandled];
      int v29 = *(void **)(a1 + 40);
      uint64_t v30 = 4;
      goto LABEL_52;
    case 0xALL:
      if ([*(id *)(a1 + 32) isAContinuation])
      {
        v38 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v39 = *(void **)(a1 + 48);
          uint64_t v40 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v66 = 2112;
          v67 = v39;
          __int16 v68 = 2112;
          uint64_t v69 = v40;
          _os_log_impl(&dword_19CF1D000, v38, OS_LOG_TYPE_INFO, "%s BTLE heard a continuation: %@ data= %@", buf, 0x20u);
        }
        [*(id *)(a1 + 40) _stopListening:0];
        [*(id *)(a1 + 40) _enterState:7];
      }
      else if ([*(id *)(a1 + 32) isAnEmergency])
      {
        v59 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v60 = *(void **)(a1 + 48);
          uint64_t v61 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          __int16 v66 = 2112;
          v67 = v60;
          __int16 v68 = 2112;
          uint64_t v69 = v61;
          _os_log_impl(&dword_19CF1D000, v59, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration: %@ data= %@", buf, 0x20u);
        }
LABEL_50:
        if ([*(id *)(a1 + 40) _shouldHandleEmergency])
        {
          int v29 = *(void **)(a1 + 40);
          uint64_t v30 = 9;
LABEL_52:
          [v29 enterState:v30];
        }
      }
      else
      {
LABEL_53:
        [*(id *)(a1 + 40) _updateRepliesWith:*(void *)(a1 + 32) id:*(void *)(a1 + 64) data:*(void *)(a1 + 56)];
      }
      return;
    case 0x11:
      [*(id *)(a1 + 40) _testAndUpdateWedgeFilter:*(void *)(a1 + 32)];
      return;
    default:
      return;
  }
}

- (void)heySiriDidUpdateState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = v5;
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[AFMyriadCoordinator heySiriDidUpdateState:]";
    __int16 v13 = 2048;
    uint64_t v14 = [v4 state];
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon state changed to: %ld", buf, 0x16u);
  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__AFMyriadCoordinator_heySiriDidUpdateState___block_invoke;
  v9[3] = &unk_1E592C710;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(myriadWorkQueue, v9);
}

void __45__AFMyriadCoordinator_heySiriDidUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 312) = [*(id *)(a1 + 40) state] == 3;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 312))
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[AFMyriadCoordinator heySiriDidUpdateState:]_block_invoke";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon wiprox state signalling", (uint8_t *)&v8, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v4 = (void (**)(void))MEMORY[0x19F3A50D0](*(void *)(v2 + 456));
    [*(id *)(a1 + 32) _clearWiProxReadinessTimer];
    if (v4) {
      v4[2](v4);
    }
    if (*(void *)(*(void *)(a1 + 32) + 584))
    {
      uint64_t v5 = (void (**)(void))MEMORY[0x19F3A50D0]();
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 584);
      *(void *)(v6 + 584) = 0;

      if (v5) {
        v5[2](v5);
      }
    }
  }
}

- (void)_triggerABCForType:(id)a3 context:(id)a4
{
  advContextManager = self->_advContextManager;
  if (advContextManager) {
    [(AFMyriadAdvertisementContextManager *)advContextManager triggerABCForType:@"Myriad" subType:a3 context:a4];
  }
}

- (void)_leaveBLEDiagnosticMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_myriadWorkQueue) {
    __assert_rtn("-[AFMyriadCoordinator _leaveBLEDiagnosticMode]", "AFMyriadCoordinator.m", 3943, "_myriadWorkQueue");
  }
  if (self->_sfdiagnostics)
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (!AFIsHorseman_isHorseman)
    {
      uint64_t v3 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        uint64_t v9 = "-[AFMyriadCoordinator _leaveBLEDiagnosticMode]";
        _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE leaving diagnostic mode", (uint8_t *)&v8, 0xCu);
      }
      [(SFDiagnostics *)self->_sfdiagnostics invalidate];
      sfdiagnostics = self->_sfdiagnostics;
      self->_sfdiagnostics = 0;

      uint64_t v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
        int v8 = 136315650;
        uint64_t v9 = "-[AFMyriadCoordinator _leaveBLEDiagnosticMode]";
        __int16 v10 = 2048;
        uint64_t v11 = 0x3FF7333340000000;
        __int16 v12 = 2112;
        __int16 v13 = sfDiagnosticsTimer;
        _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE cancelling diagnostic mode timer for %f seconds %@", (uint8_t *)&v8, 0x20u);
      }
      [(AFWatchdogTimer *)self->_sfDiagnosticsTimer cancel];
      int v7 = self->_sfDiagnosticsTimer;
      self->_sfDiagnosticsTimer = 0;
    }
  }
}

- (void)_enterBLEDiagnosticMode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_myriadWorkQueue) {
    __assert_rtn("-[AFMyriadCoordinator _enterBLEDiagnosticMode]", "AFMyriadCoordinator.m", 3913, "_myriadWorkQueue");
  }
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (!AFIsHorseman_isHorseman)
  {
    [(AFMyriadCoordinator *)self _leaveBLEDiagnosticMode];
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE entering diagnostic mode", buf, 0xCu);
    }
    id v4 = (SFDiagnostics *)objc_alloc_init((Class)getSFDiagnosticsClass());
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = v4;

    [(SFDiagnostics *)self->_sfdiagnostics setDispatchQueue:self->_myriadWorkQueue];
    uint64_t v6 = self->_sfdiagnostics;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke;
    v13[3] = &unk_1E592C248;
    v13[4] = self;
    [(SFDiagnostics *)v6 diagnosticBLEModeWithCompletion:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke_553;
    v12[3] = &unk_1E592C678;
    v12[4] = self;
    int v7 = (void *)MEMORY[0x19F3A50D0](v12);
    int v8 = [[AFWatchdogTimer alloc] initWithTimeoutInterval:self->_myriadWorkQueue onQueue:v7 timeoutHandler:1.45000005];
    sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = v8;

    [(AFWatchdogTimer *)self->_sfDiagnosticsTimer start];
    __int16 v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = self->_sfDiagnosticsTimer;
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]";
      __int16 v16 = 2048;
      uint64_t v17 = 0x3FF7333340000000;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s BTLE added diagnostic mode timer for %f seconds %@", buf, 0x20u);
    }
  }
}

void __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s BTLE failed to enter diagnostic mode %@", (uint8_t *)&v5, 0x16u);
    }
    [*(id *)(a1 + 32) _leaveBLEDiagnosticMode];
  }
}

uint64_t __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke_553(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE diagnostic mode timer fired", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _leaveBLEDiagnosticMode];
}

- (void)_waitWiProxAndExecute:(id)a3
{
}

- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AFMyriadCoordinator_waitWiProx_andExecute___block_invoke;
  block[3] = &unk_1E592B3E8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __45__AFMyriadCoordinator_waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _waitWiProx:*(void *)(a1 + 48) andExecute:*(void *)(a1 + 40)];
}

- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL BTLEReady = self->_BTLEReady;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke;
  __int16 v16 = &unk_1E592C6E8;
  uint64_t v17 = self;
  id v8 = v6;
  id v18 = v8;
  uint64_t v9 = MEMORY[0x19F3A50D0](&v13);
  id v10 = (void *)v9;
  if (BTLEReady || !self->_BLEActivityEnabled)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    uint64_t v11 = [(WPHeySiri *)self->_heySiriBTLE state];
    __int16 v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]";
      __int16 v21 = 2048;
      int64_t v22 = a3;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s #myriad BTLE not ready, waiting to execute for up to %ld msecs (current HeySiri WPState %ld)", buf, 0x20u);
    }
    [(AFMyriadCoordinator *)self _createWaitWiProxTimer:a3 waitBlock:v10];
  }
}

void __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 440);
  int v4 = *(unsigned __int8 *)(v2 + 441);
  label = dispatch_queue_get_label(0);
  id v6 = label;
  if (label && !strcmp(label, (const char *)myriad_work_queue_label))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
    uint64_t v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = "YES";
      if (v4) {
        uint64_t v13 = "YES";
      }
      else {
        uint64_t v13 = "NO";
      }
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v24 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
      int v15 = *(unsigned __int8 *)(v14 + 441);
      int v16 = *(unsigned __int8 *)(v14 + 440);
      if (v15) {
        uint64_t v17 = "YES";
      }
      else {
        uint64_t v17 = "NO";
      }
      *(_DWORD *)buf = 136316162;
      if (v3) {
        id v18 = "YES";
      }
      else {
        id v18 = "NO";
      }
      __int16 v25 = 2080;
      v26 = v13;
      if (!v16) {
        __int16 v12 = "NO";
      }
      __int16 v27 = 2080;
      uint64_t v28 = (uint64_t)v17;
      __int16 v29 = 2080;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      __int16 v32 = v12;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s #myriad didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", buf, 0x34u);
    }
  }
  else
  {
    __int16 v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315651;
      uint64_t v24 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
      __int16 v25 = 2081;
      v26 = v6;
      __int16 v27 = 2081;
      uint64_t v28 = myriad_work_queue_label;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s #myriad Method called on unexpected thread (curr:%{private}s expected:%{private}s)", buf, 0x20u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    id v8 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke_547;
    block[3] = &unk_1E5929DC8;
    id v9 = *(id *)(a1 + 40);
    char v21 = v4;
    void block[4] = *(void *)(a1 + 32);
    id v20 = v9;
    char v22 = v3;
    dispatch_async(v8, block);
  }
}

void __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke_547(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = "YES";
    if (*(unsigned char *)(a1 + 48)) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 441)) {
      __int16 v7 = "YES";
    }
    else {
      __int16 v7 = "NO";
    }
    if (*(unsigned char *)(a1 + 49)) {
      id v8 = "YES";
    }
    else {
      id v8 = "NO";
    }
    if (!*(unsigned char *)(v6 + 440)) {
      int v4 = "NO";
    }
    int v9 = 136316162;
    uint64_t v10 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
    __int16 v11 = 2080;
    __int16 v12 = v5;
    __int16 v13 = 2080;
    uint64_t v14 = v7;
    __int16 v15 = 2080;
    int v16 = v8;
    __int16 v17 = 2080;
    id v18 = v4;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", (uint8_t *)&v9, 0x34u);
  }
}

- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4
{
  id v6 = a4;
  [(AFMyriadCoordinator *)self _suspendWiProxReadinessTimer];
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  dispatch_time_t v8 = dispatch_time(0, 1000000 * a3);
  dispatch_source_set_timer(waitTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke;
  v18[3] = &unk_1E592C678;
  v18[4] = self;
  int v9 = (void *)MEMORY[0x19F3A50D0](v18);
  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, v9);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke_546;
  int v16 = &unk_1E592C360;
  id v17 = v6;
  id v10 = v6;
  __int16 v11 = (void *)MEMORY[0x19F3A50D0](&v13);
  id waitBlock = self->_wiproxReadinessTimer.waitBlock;
  self->_wiproxReadinessTimer.id waitBlock = v11;

  [(AFMyriadCoordinator *)self _resumeWiProxReadinessTimer];
}

uint64_t __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadCoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s #myriad BTLE WiProx readiness timer timed out, WiProx not called", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _clearWiProxReadinessTimer];
}

uint64_t __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke_546(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadCoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad BTLE done waiting on WiProx to execute", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_clearWiProxReadinessTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_wiproxReadinessTimer.waitTimer)
  {
    int v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[AFMyriadCoordinator _clearWiProxReadinessTimer]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer wait block cleared", (uint8_t *)&v5, 0xCu);
    }
    id waitBlock = self->_wiproxReadinessTimer.waitBlock;
    self->_wiproxReadinessTimer.id waitBlock = 0;
  }
}

- (void)_suspendWiProxReadinessTimer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_wiproxReadinessTimer.isWaitTimerSuspended)
  {
    int v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int v5 = "-[AFMyriadCoordinator _suspendWiProxReadinessTimer]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer suspended", (uint8_t *)&v4, 0xCu);
    }
    self->_wiproxReadinessTimer.isWaitTimerSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  }
}

- (void)_resumeWiProxReadinessTimer
{
  self->_wiproxReadinessTimer.isWaitTimerSuspended = 0;
}

- (void)_initializeWiProxReadinessTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[AFMyriadCoordinator _initializeWiProxReadinessTimer]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer initialized", (uint8_t *)&v6, 0xCu);
  }
  int v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  self->_wiproxReadinessTimer.waitTimer = v4;

  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, &__block_literal_global_545);
  [(AFMyriadCoordinator *)self _resumeWiProxReadinessTimer];
}

- (void)_ageWedgeFilter
{
  p_previousTrumps = &self->_previousTrumps;
  previousTrumps = self->_previousTrumps;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator__ageWedgeFilter__block_invoke;
  v7[3] = &unk_1E592ACD0;
  v7[4] = self;
  [(NSMutableDictionary *)previousTrumps enumerateKeysAndObjectsUsingBlock:v7];
  objc_storeStrong((id *)p_previousTrumps, self->_incomingTrumps);
  int v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  incomingTrumps = self->_incomingTrumps;
  self->_incomingTrumps = v5;
}

void __38__AFMyriadCoordinator__ageWedgeFilter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  int v5 = [a3 intValue];
  if (v5 >= 2)
  {
    int v6 = v5;
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v10];

    if (!v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 72);
      int v9 = [MEMORY[0x1E4F28ED0] numberWithInt:(v6 - 1)];
      [v8 setObject:v9 forKey:v10];
    }
  }
}

- (BOOL)_testAndUpdateWedgeFilter:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "userConfidence") | (objc_msgSend(v4, "tieBreaker") << 8));
  if ([v4 isATrump])
  {
    incomingTrumps = self->_incomingTrumps;
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:20];
    [(NSMutableDictionary *)incomingTrumps setObject:v7 forKey:v5];

    int v8 = [v4 deviceClass];
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (AFIsHorseman_isHorseman && v8 == 6)
    {
      int v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        id v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
        __int16 v18 = 2112;
        id v19 = v4;
        id v10 = "%s BTLE ignoring incoming event bad device class for Horseman %@";
LABEL_11:
        _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0x16u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    __int16 v11 = [(NSMutableDictionary *)self->_previousTrumps objectForKeyedSubscript:v5];

    if (v11)
    {
      int v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        id v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
        __int16 v18 = 2112;
        id v19 = v4;
        id v10 = "%s BTLE ignoring as wedged suppress %@";
        goto LABEL_11;
      }
LABEL_12:
      char v12 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v13 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v13;
    int v16 = 136315650;
    id v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 1024;
    int v21 = [v4 isSane];
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s BTLE record %@  isSane: %d", (uint8_t *)&v16, 0x1Cu);
  }
  char v12 = [v4 isSane];
LABEL_16:

  return v12;
}

- (int)_myriadStateForSelf:(unint64_t)a3
{
  if (a3 < 0x12) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)_nextElectionPublisherState
{
  unint64_t electionPublisherState = self->_electionPublisherState;
  if (electionPublisherState) {
    unint64_t v3 = (electionPublisherState + 1) % 0x3D;
  }
  else {
    unint64_t v3 = 1;
  }
  self->_unint64_t electionPublisherState = v3;
  return v3;
}

- (void)notifyCurrentDecisionResult
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AFMyriadCoordinator_notifyCurrentDecisionResult__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

void __50__AFMyriadCoordinator_notifyCurrentDecisionResult__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 == 14 || v2 == 1)
  {
    id v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v5 = v4;
      int v6 = [(id)v1 _stateAsString:v2];
      int v11 = 136315394;
      char v12 = "-[AFMyriadCoordinator notifyCurrentDecisionResult]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE ignoring decision result callback (state = %@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (*(unsigned char *)(v1 + 400))
  {
    int v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = v8;
      id v10 = [(id)v1 _stateAsString:v2];
      int v11 = 136315394;
      char v12 = "-[AFMyriadCoordinator notifyCurrentDecisionResult]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s BTLE reposting result win (state = %@)", (uint8_t *)&v11, 0x16u);

      uint64_t v1 = *(void *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v1 + 544), "publishState:", objc_msgSend((id)v1, "_nextElectionPublisherState"));
  }
}

- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(NSMutableDictionary *)self->_replies objectForKey:v9];
  char v12 = v11;
  if (!v11)
  {
    id v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ([v11 isAContinuation] && (objc_msgSend(v8, "isAContinuation") & 1) == 0)
  {
    id v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      *(_DWORD *)__int16 v18 = 136315650;
      *(void *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v10;
      *(_WORD *)&v18[22] = 2112;
      *(void *)id v19 = v9;
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s BTLE Updating record table, data= %@, for %@", v18, 0x20u);
    }
LABEL_13:
    -[NSMutableDictionary setObject:forKey:](self->_replies, "setObject:forKey:", v8, v9, *(_OWORD *)v18, *(void *)&v18[16], *(void *)v19);
    goto LABEL_14;
  }
  int v13 = [v8 isALateSupressionTrumpFor:v12];
  uint64_t v14 = AFSiriLogContextConnection;
  BOOL v15 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      int v16 = v14;
      *(_DWORD *)__int16 v18 = 136316162;
      *(void *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = [v12 goodness];
      *(_WORD *)&v18[18] = 1024;
      *(_DWORD *)&v18[20] = [v8 goodness];
      *(_WORD *)id v19 = 2112;
      *(void *)&v19[2] = v10;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s BTLE Updating record table with a late supression(%hhu -> %hhu), data= %@, for %@", v18, 0x2Cu);
    }
    goto LABEL_13;
  }
  if (v15)
  {
    *(_DWORD *)__int16 v18 = 136315650;
    *(void *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v10;
    *(_WORD *)&v18[22] = 2112;
    *(void *)id v19 = v9;
    _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s BTLE ignoring this advert because one already exists, data= %@, for %@", v18, 0x20u);
  }
LABEL_14:
}

- (BOOL)_inTaskTriggerWasTooSoon
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (self->_ignoreInTaskTimer && AFCDAFaceDetection())
  {
    unint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad got attention, ignoring too-soon time limit.", (uint8_t *)&v29, 0xCu);
    }
    goto LABEL_13;
  }
  if (self->_triggerTime)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:self->_triggerTime];
    double v6 = v5;
    uint64_t v7 = self->_advTiming.advertTriggerAdvStartTime;
    id v8 = v7;
    double v9 = 3.40282347e38;
    if (v7) {
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v4, 3.40282347e38);
    }
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    else {
      double v10 = 3.40282347e38;
    }
    if (self->_clientIsDirectActivating)
    {
      BOOL v11 = 0;
      BOOL v12 = v6 < self->_deviceTrumpDelay;
    }
    else
    {
      BOOL v12 = 0;
      BOOL v11 = !self->_clientIsInEarActivation;
    }
    BOOL v15 = v10 > 0.5 || v8 == 0;
    BOOL v16 = self->_myriadState == 1 && v15;
    BOOL v17 = !v11 && v16;
    __int16 v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v19 = v18;
      [v4 timeIntervalSinceReferenceDate];
      uint64_t v21 = v20;
      [(NSDate *)self->_triggerTime timeIntervalSinceReferenceDate];
      uint64_t v23 = v22;
      [(NSDate *)v8 timeIntervalSinceReferenceDate];
      int v29 = 136317186;
      uint64_t v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      __int16 v31 = 2048;
      uint64_t v32 = v21;
      __int16 v33 = 2048;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      uint64_t v36 = v24;
      __int16 v37 = 2048;
      double v38 = v6;
      __int16 v39 = 2048;
      double v40 = v10;
      __int16 v41 = 1024;
      BOOL v42 = v6 < 0.5;
      __int16 v43 = 1024;
      BOOL v44 = v12;
      __int16 v45 = 1024;
      BOOL v46 = v17;
      _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_INFO, "%s #myriad CurrentTime: %f TrigerTime: %f, ElectionAdvertisementTime: %f, triggerDelta: %f, electionAdvertisementRemainingTime: %f [isIntaskTooSoonForVoiceTriggerActivation = %d, isIntaskTooSoonForDirectActivation = %d, currentElectionAdvertisementIsSane = %d]", (uint8_t *)&v29, 0x50u);

      __int16 v18 = AFSiriLogContextConnection;
    }
    int v25 = v6 < 0.5 || v12;
    int v13 = v25 | v17;
    BOOL v26 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v13 == 1)
    {
      if (v26)
      {
        int v29 = 136315138;
        uint64_t v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
        __int16 v27 = "%s #myriad BTLE in-task continuous voice trigger heard too soon. Ignoring.";
LABEL_37:
        _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v29, 0xCu);
      }
    }
    else if (v26)
    {
      int v29 = 136315138;
      uint64_t v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      __int16 v27 = "%s #myriad BTLE in-task continious voice trigger heard. NOT ignoring.";
      goto LABEL_37;
    }

    return v13;
  }
LABEL_13:
  LOBYTE(v13) = 0;
  return v13;
}

- (id)_sortedReplies:(id)a3
{
  unint64_t v3 = [a3 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_541_32741];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)[v4 count] < 2)
  {
    [v5 addObjectsFromArray:v4];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__AFMyriadCoordinator__sortedReplies___block_invoke_2;
    v9[3] = &unk_1E5929DA0;
    id v10 = v6;
    id v11 = v5;
    id v7 = v6;
    [v4 enumerateObjectsUsingBlock:v9];
  }
  return v5;
}

void __38__AFMyriadCoordinator__sortedReplies___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v3 = [v4 asAdvertisementData];
  if ([v4 isCollectedFromContextCollector])
  {
    if ([*(id *)(a1 + 32) containsObject:v3]) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }
LABEL_4:
}

uint64_t __38__AFMyriadCoordinator__sortedReplies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  int v8 = [v6 deviceClass];
  if ((v8 == 10 || v8 == 6)
    && [v6 isATrump]
    && [v7 deviceClass] == 7
    && ([v7 isATrump] & 1) != 0)
  {
    goto LABEL_23;
  }
  if ([v6 deviceClass] == 7)
  {
    if ([v6 isATrump])
    {
      int v9 = [v7 deviceClass];
      if (v9 == 10 || v9 == 6) && ([v7 isATrump])
      {
        uint64_t v10 = -1;
        goto LABEL_22;
      }
    }
  }
  int v11 = [v6 goodness];
  if (v11 == [v7 goodness])
  {
    unsigned int v12 = [v6 userConfidence];
    unsigned int v13 = [v7 userConfidence];
  }
  else
  {
    unsigned int v12 = [v6 goodness];
    unsigned int v13 = [v7 goodness];
  }
  unsigned int v14 = v13;
  if (v12 == v13)
  {
    unsigned int v12 = [v6 tieBreaker];
    unsigned int v14 = [v7 tieBreaker];
    if ([v6 hasEqualAdvertisementData:v7])
    {
      if ([v6 isCollectedFromContextCollector]
        && ![v7 isCollectedFromContextCollector])
      {
LABEL_23:
        uint64_t v10 = 1;
        goto LABEL_22;
      }
    }
  }
  if (v12 < v14) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
LABEL_22:

  return v10;
}

- (id)_sortedReplies
{
  return [(AFMyriadCoordinator *)self _sortedReplies:self->_replies];
}

- (BOOL)_isAPhone:(unsigned __int8)a3
{
  return a3 == 2;
}

- (BOOL)_shouldHandleEmergency
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AFMyriadCoordinator *)self _sortedReplies:self->_repliesBeforeDecision];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
    __int16 v25 = 2112;
    BOOL v26 = replies;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s BTLE emergencyCallSummary: %@", buf, 0x16u);
  }
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_538];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (-[AFMyriadCoordinator _isAPhone:](self, "_isAPhone:", objc_msgSend(v11, "deviceClass", (void)v18))) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    int v13 = [v11 isMe];
    unsigned int v14 = AFSiriLogContextConnection;
    BOOL v15 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
        BOOL v16 = "%s BTLE Emergency call: this device should handle";
LABEL_19:
        _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
      BOOL v16 = "%s BTLE Emergency call: This device should NOT handle, another is better";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
LABEL_11:

  unsigned int v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s BTLE Emergency Call: No device available to handle this call", buf, 0xCu);
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return v13;
}

void __45__AFMyriadCoordinator__shouldHandleEmergency__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[AFMyriadCoordinator _shouldHandleEmergency]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = a3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE EmergencyCallSummary %lu: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (BOOL)_shouldContinueFor:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AFMyriadCoordinator *)self _sortedReplies];
  int v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    uint64_t v36 = "-[AFMyriadCoordinator _shouldContinueFor:]";
    __int16 v37 = 2112;
    double v38 = replies;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE end advertising summary: %@", buf, 0x16u);
  }
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_536];
  lastWonBySmallAmountDate = self->_lastWonBySmallAmountDate;
  self->_lastWonBySmallAmountDate = 0;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v31;
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v29 = v12 + v11;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v9);
      }
      if (v4)
      {
        BOOL v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
        BOOL v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v15, "deviceClass"));
        int v17 = [v4 containsObject:v16];

        if (!v17) {
          break;
        }
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        uint64_t v12 = v29;
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    char v20 = [v15 isATrump];
    int v21 = [v15 isMe];
    char v19 = v20 & v21;
    if ((v20 & 1) == 0)
    {
      long long v18 = v9;
      if (!v21) {
        goto LABEL_29;
      }
      if (v12 + v14 + 1 < (unint64_t)[v9 count])
      {
        uint64_t v22 = [v9 objectAtIndex:v12 + v14 + 1];
        int v23 = [v15 goodness];
        if ((int)(v23 - [v22 goodness]) <= 2)
        {
          uint64_t v24 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v36 = "-[AFMyriadCoordinator _shouldContinueFor:]";
            _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s #myriad Won by a small margin, storing state to mitigate recency boost", buf, 0xCu);
          }
          uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", self);
          BOOL v26 = *(void **)(v28 + 624);
          *(void *)(v28 + 624) = v25;
        }
      }
      char v19 = 1;
    }
    long long v18 = v9;
  }
  else
  {
LABEL_12:

    long long v18 = [v9 firstObject];
    if ([v18 isATrump]) {
      self->_clientLostDueToTrumping = 1;
    }
    if ((objc_msgSend(v18, "isMe", self) & 1) == 0
      && [v18 isInEarTrump]
      && [(AFMyriadRecord *)self->_triggerRecord isInEarTrump])
    {
      char v19 = 1;
    }
    else
    {
      char v19 = [v18 isMe];
    }
  }
LABEL_29:

  return v19;
}

void __42__AFMyriadCoordinator__shouldContinueFor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[AFMyriadCoordinator _shouldContinueFor:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = a3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE summary %lu: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (id)emptyRecord
{
  unint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:0];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 setTieBreaker:0];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:0];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)slowdownRecord:(unsigned __int16)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((a3 >> 3) >= 0xFF) {
    uint64_t v4 = 255;
  }
  else {
    uint64_t v4 = a3 >> 3;
  }
  id v5 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v5 setPHash:0];
  [(AFMyriadRecord *)v5 setIsMe:1];
  [(AFMyriadRecord *)v5 setUserConfidence:v4];
  [(AFMyriadRecord *)v5 generateTiebreaker];
  [(AFMyriadRecord *)v5 setRawAudioGoodnessScore:0 withBump:208];
  [(AFMyriadRecord *)v5 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v5 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v5 setProductType:self->_productType];
  int v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[AFMyriadCoordinator slowdownRecord:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE created slowdown record %@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)responseObject:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v5 setPHash:v3];
  [(AFMyriadRecord *)v5 setIsMe:1];
  [(AFMyriadRecord *)v5 generateTiebreaker];
  [(AFMyriadRecord *)v5 setRawAudioGoodnessScore:0 withBump:255];
  [(AFMyriadRecord *)v5 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v5 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v5 setProductType:self->_productType];
  return v5;
}

- (id)emergencyHandledRecord
{
  uint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:0];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 generateTiebreaker];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:224];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)emergencyRecord
{
  uint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:0];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 generateTiebreaker];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:239];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)continuationRecord
{
  uint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:0xFFFFLL];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 generateTiebreaker];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:0];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)lateSuppressionRecord
{
  uint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:self->_lastPHash];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 generateTiebreaker];
  [(AFMyriadRecord *)v3 generateRandomConfidence];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:255];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)directTriggerRecord
{
  uint64_t v3 = [(AFMyriadContext *)self->_currentMyriadContext perceptualAudioHash];
  uint64_t v4 = [v3 data];

  if ([v4 length] == 12)
  {
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    int v6 = v4;
LABEL_5:
    objc_msgSend(v6, "getBytes:range:", p_voiceTriggerTime, 4, 8);
    goto LABEL_6;
  }
  uint64_t v7 = &self->_voiceTriggerTime;
  if ([v4 length] == 13)
  {
    int v6 = v4;
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    goto LABEL_5;
  }
  if (!*v7) {
    goto LABEL_13;
  }
  uint64_t v10 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
  {
    uint64_t v11 = v10;
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    uint64_t v10 = v11;
  }
  if (*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0
     - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)*v7 / 1000000000.0 > 1.45000005)
LABEL_13:
    *uint64_t v7 = 0;
LABEL_6:
  int v8 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v8 setPHash:0xFFFFLL];
  [(AFMyriadRecord *)v8 setIsMe:1];
  [(AFMyriadRecord *)v8 generateTiebreaker];
  [(AFMyriadRecord *)v8 generateRandomConfidence];
  [(AFMyriadRecord *)v8 setRawAudioGoodnessScore:0 withBump:255];
  [(AFMyriadRecord *)v8 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v8 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v8 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v8 setProductType:self->_productType];

  return v8;
}

- (id)_phsSetupRecord
{
  uint64_t v3 = objc_alloc_init(AFMyriadRecord);
  [(AFMyriadRecord *)v3 setPHash:63993];
  [(AFMyriadRecord *)v3 setIsMe:1];
  [(AFMyriadRecord *)v3 generateTiebreaker];
  [(AFMyriadRecord *)v3 generateRandomConfidence];
  [(AFMyriadRecord *)v3 setRawAudioGoodnessScore:0 withBump:249];
  [(AFMyriadRecord *)v3 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v3 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v3 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v3 setProductType:self->_productType];
  return v3;
}

- (id)voiceTriggerRecord
{
  uint64_t v3 = [(AFMyriadContext *)self->_currentMyriadContext perceptualAudioHash];
  uint64_t v4 = [v3 data];

  id v5 = [[AFMyriadRecord alloc] initWithAudioData:v4];
  if ([v4 length] == 12)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
  }
  else
  {
    uint64_t v6 = [v4 length];
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    if (v6 == 13)
    {
      objc_msgSend(v4, "getBytes:range:", p_voiceTriggerTime, 4, 8);
      goto LABEL_7;
    }
    unint64_t *p_voiceTriggerTime = 0;
  }
  [(AFMyriadRecord *)v5 generateTiebreaker];
LABEL_7:
  [(AFMyriadRecord *)v5 setIsMe:1];
  [(AFMyriadRecord *)v5 setDeviceID:self->_designatedSelfID];
  [(AFMyriadRecord *)v5 setDeviceGroup:self->_deviceGroup];
  [(AFMyriadRecord *)v5 setDeviceClass:self->_deviceClass];
  [(AFMyriadRecord *)v5 setProductType:self->_productType];

  return v5;
}

- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 thenExecute:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke;
  v34[3] = &unk_1E5929D10;
  v34[4] = self;
  id v12 = v10;
  id v35 = v12;
  float v36 = a5;
  float v37 = a4;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x19F3A50D0](v34);
  previousAdvertisedData = self->_previousAdvertisedData;
  if (previousAdvertisedData && [(NSData *)previousAdvertisedData isEqualToData:v12])
  {
    BOOL v15 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = self->_previousAdvertisedData;
      BOOL v26 = v15;
      double v27 = [(NSData *)v25 description];
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]";
      __int16 v40 = 2112;
      double v41 = v27;
      _os_log_error_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_ERROR, "%s BTLE error: attempting to readvertise %@", buf, 0x16u);
    }
    self->_stateMachineEncounteredError = 1;
    [(AFMyriadCoordinator *)self _enterState:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      int v17 = WeakRetained;
      id v18 = objc_loadWeakRetained(&self->_delegate);
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = objc_loadWeakRetained(&self->_delegate);
        *(float *)&double v21 = a4;
        *(float *)&double v22 = a5;
        [v20 advertisingWillBeginWithDelay:v21 advertisingInterval:v22];
      }
    }
    int v23 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]";
      __int16 v40 = 2048;
      double v41 = a4;
      _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s BTLE starting advert delay timer for %f secs", buf, 0x16u);
    }
    if (a4 == 0.0)
    {
      ((void (**)(void, id, id))v13)[2](v13, v12, v11);
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_533;
      v28[3] = &unk_1E5929D38;
      v28[4] = self;
      float v32 = a4;
      float v33 = a5;
      long long v30 = v13;
      id v29 = v12;
      id v31 = v11;
      *(float *)&double v24 = a4;
      [(AFMyriadCoordinator *)self _startTimer:@"advert delay" for:v28 thenExecute:v24];
    }
  }
}

void __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 323) = 0;
  uint64_t v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v50 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]_block_invoke";
    __int16 v51 = 2112;
    uint64_t v52 = v8;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s BTLE delay finished, advertising: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v11 myriadCoordinator:*(void *)(a1 + 32) willStartAdvertisingUsingData:v5];
  }
  if ([*(id *)(a1 + 32) _shouldUseContextCollector]) {
    [*(id *)(a1 + 32) _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:*(float *)(a1 + 48) advertisementDelay:*(float *)(a1 + 52)];
  }
  id v12 = *(void **)(a1 + 32);
  int v13 = *(_DWORD *)(a1 + 48);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_515;
  v45[3] = &unk_1E592C6E8;
  v45[4] = v12;
  id v14 = v6;
  id v46 = v14;
  LODWORD(v15) = v13;
  [v12 _startTimer:@"advertise" for:v45 thenExecute:v15];
  kdebug_trace();
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v16 != 5)
  {
    v47[0] = @"state";
    int v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v16);
    v48[0] = v17;
    v47[1] = @"adv-delay";
    LODWORD(v18) = *(_DWORD *)(a1 + 52);
    char v19 = [MEMORY[0x1E4F28ED0] numberWithFloat:v18];
    v48[1] = v19;
    v47[2] = @"adv-interval";
    LODWORD(v20) = *(_DWORD *)(a1 + 48);
    double v21 = [MEMORY[0x1E4F28ED0] numberWithFloat:v20];
    v48[2] = v21;
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];

    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      int v23 = +[AFAnalytics sharedAnalytics];
      [v23 logEventWithType:2002 context:v22];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      double v24 = *(void **)(a1 + 32);
      uint64_t v25 = (void *)v24[76];
      uint64_t v26 = [v24 _myriadStateForSelf:v24[1]];
      int v28 = *(_DWORD *)(a1 + 48);
      int v27 = *(_DWORD *)(a1 + 52);
      id v29 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
      uint64_t v30 = mach_absolute_time();
      LODWORD(v31) = v27;
      LODWORD(v32) = v28;
      [v25 logCDAElectionAdvertisingStarting:v26 withDelay:v29 withInterval:v30 withCdaId:v31 withTimestamp:v32];
    }
  }
  float v33 = getWPHeySiriAdvertisingData();
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v35 = v34;
  if (v33) {
    [v34 setObject:v5 forKey:v33];
  }
  [*(id *)(a1 + 32) _enterBLEDiagnosticMode];
  float v36 = *(void **)(a1 + 32);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_2;
  v43[3] = &unk_1E592C710;
  v43[4] = v36;
  id v37 = v35;
  id v44 = v37;
  [v36 _waitWiProxAndExecute:v43];
  id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  if (v38)
  {
    uint64_t v39 = v38;
    id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    char v41 = objc_opt_respondsToSelector();

    if (v41)
    {
      id v42 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
      [v42 advertisingDidBegin:*(void *)(a1 + 32)];
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_533(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 320) || *(unsigned char *)(v2 + 321)) && *(void *)(v2 + 8) == 1)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = [v3 dateByAddingTimeInterval:*(float *)(a1 + 64)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 472);
    *(void *)(v5 + 472) = v4;

    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = [v7 dateByAddingTimeInterval:(float)(*(float *)(a1 + 64) + *(float *)(a1 + 68))];
    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = *(void **)(v9 + 480);
    *(void *)(v9 + 480) = v8;
  }
  id v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v11();
}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_515(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    uint64_t v2 = +[AFAnalytics sharedAnalytics];
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8), @"state");
    v13[1] = @"unixTime";
    v14[0] = v3;
    uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSince1970];
    id v6 = objc_msgSend(v4, "numberWithDouble:");
    v14[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v2 logEventWithType:2010 context:v7];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8[1] == 1)
    {
      uint64_t v9 = (void *)v8[76];
      uint64_t v10 = [v8 _myriadStateForSelf:1];
      id v11 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
      [v9 logCDAElectionTimerEnded:v10 withCdaId:v11 withTimestamp:mach_absolute_time()];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 319) || *(unsigned char *)(v2 + 314))
  {
    uint64_t v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v3;
      uint64_t v5 = mach_absolute_time();
      int v6 = 136315394;
      uint64_t v7 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]_block_invoke_2";
      __int16 v8 = 2048;
      unint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld", (uint8_t *)&v6, 0x16u);

      uint64_t v2 = *(void *)(v1 + 32);
    }
    uint64_t result = [*(id *)(v2 + 352) startScanningAndAdvertisingWithData:*(void *)(v1 + 40)];
    *(unsigned char *)(*(void *)(v1 + 32) + 440) = 1;
    *(unsigned char *)(*(void *)(v1 + 32) + 441) = 1;
  }
  return result;
}

- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_1E592B3C0;
  void block[4] = self;
  id v12 = v8;
  float v13 = a4;
  float v14 = a5;
  id v10 = v8;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 7;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2;
  v6[3] = &unk_1E592C678;
  v6[4] = v4;
  return [v4 _advertiseWith:v3 afterDelay:v6 maxInterval:a2 thenExecute:a3];
}

void __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3;
  block[3] = &unk_1E592C678;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAdvertisingAndListening];
}

- (void)advertiseWith:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AFMyriadCoordinator_advertiseWith___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __37__AFMyriadCoordinator_advertiseWith___block_invoke(uint64_t a1, double a2, double a3)
{
  *(void *)(*(void *)(a1 + 32) + 248) = 7;
  LODWORD(a3) = 0.5;
  return [*(id *)(a1 + 32) _advertiseWith:*(void *)(a1 + 40) afterDelay:0 maxInterval:0.0 thenExecute:a3];
}

- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  self->_recordType = 7;
  id v10 = [a3 asAdvertisementData];
  *(float *)&double v8 = a4;
  *(float *)&double v9 = a5;
  [(AFMyriadCoordinator *)self _advertiseWith:v10 afterDelay:0 maxInterval:v8 thenExecute:v9];
}

- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFMyriadCoordinator_startAdvertising_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_1E592B3C0;
  void block[4] = self;
  id v12 = v8;
  float v13 = a4;
  float v14 = a5;
  id v10 = v8;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __63__AFMyriadCoordinator_startAdvertising_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return [*(id *)(a1 + 32) _startAdvertising:*(void *)(a1 + 40) afterDelay:a2 maxInterval:a3];
}

- (void)_advertiseIndefinite:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AFMyriadCoordinator__advertiseIndefinite___block_invoke;
  v6[3] = &unk_1E592C710;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AFMyriadCoordinator *)self _waitWiProxAndExecute:v6];
}

void __44__AFMyriadCoordinator__advertiseIndefinite___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getWPHeySiriAdvertisingData();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) asAdvertisementData];
    [v3 setObject:v4 forKey:v2];
  }
  [*(id *)(a1 + 40) _enterBLEDiagnosticMode];
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 319))
  {
    id v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      uint64_t v8 = mach_absolute_time();
      int v9 = 136315394;
      id v10 = "-[AFMyriadCoordinator _advertiseIndefinite:]_block_invoke";
      __int16 v11 = 2048;
      unint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v8);
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld", (uint8_t *)&v9, 0x16u);

      uint64_t v5 = *(void *)(a1 + 40);
    }
    [*(id *)(v5 + 352) startScanningAndAdvertisingWithData:v3];
    *(unsigned char *)(*(void *)(a1 + 40) + 440) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 441) = 1;
  }
}

- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 andMoveTo:(unint64_t)a6
{
  self->_nextState = a6;
  int v9 = [a3 asAdvertisementData];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__AFMyriadCoordinator__advertise_afterDelay_maxInterval_andMoveTo___block_invoke;
  v11[3] = &unk_1E592C678;
  v11[4] = self;
  *(float *)&double v10 = a5;
  [(AFMyriadCoordinator *)self _advertiseWith:v9 afterDelay:v11 maxInterval:COERCE_DOUBLE((unint64_t)LODWORD(a4)) thenExecute:v10];
}

uint64_t __67__AFMyriadCoordinator__advertise_afterDelay_maxInterval_andMoveTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enterState:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4
{
  LODWORD(v4) = 0.75;
  [(AFMyriadCoordinator *)self _advertise:a3 afterDelay:a4 maxInterval:0.0 andMoveTo:v4];
}

- (void)_advertiseSuppressTriggerInOutput
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
  }
  double v4 = *(double *)&_AFMachAbsoluteTimeRate_rate;
  unint64_t voiceTriggerTime = self->_voiceTriggerTime;
  id v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    double v10 = v4 * (double)v3 / 1000000000.0
        - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
    unint64_t previousState = self->_previousState;
    id v12 = v6;
    uint64_t v13 = [(AFMyriadCoordinator *)self _stateAsString:previousState];
    float v14 = [(AFMyriadCoordinator *)self _stateAsString:self->_myriadState];
    BOOL clientIsDeciding = self->_clientIsDeciding;
    unint64_t v16 = self->_voiceTriggerTime;
    *(_DWORD *)buf = 136316418;
    double v20 = "-[AFMyriadCoordinator _advertiseSuppressTriggerInOutput]";
    __int16 v21 = 2112;
    double v22 = v13;
    __int16 v23 = 2112;
    double v24 = v14;
    __int16 v25 = 1024;
    BOOL v26 = clientIsDeciding;
    __int16 v27 = 2048;
    unint64_t v28 = v16;
    __int16 v29 = 2048;
    double v30 = v10;
    _os_log_debug_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d, _voiceTriggerTime: %llu, secondsSinceVoiceTrigger: %f", buf, 0x3Au);
  }
  if ([(AFMyriadCoordinator *)self _okayToSuppressOnOutput])
  {
    int v18 = 1056964608;
    *(_DWORD *)buf = 0;
    if (self->_voiceTriggerTime) {
      [(AFMyriadCoordinator *)self setupAdvIntervalsInDelay:buf interval:&v18 withSlowdown:0];
    }
    id v7 = [(AFMyriadRecord *)self->_triggerRecord asAdvertisementData];
    [(AFMyriadCoordinator *)self _createMyriadSessionIfRequired];
    [(AFMyriadCoordinator *)self _addElectionAdvertisementDataToMyriadSession:v7];
    LODWORD(v9) = v18;
    LODWORD(v8) = *(_DWORD *)buf;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__AFMyriadCoordinator__advertiseSuppressTriggerInOutput__block_invoke;
    v17[3] = &unk_1E592C678;
    v17[4] = self;
    [(AFMyriadCoordinator *)self _advertiseWith:v7 afterDelay:v17 maxInterval:v8 thenExecute:v9];
  }
}

uint64_t __56__AFMyriadCoordinator__advertiseSuppressTriggerInOutput__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _endAdvertising:0];
  [*(id *)(a1 + 32) _resetAudioData];
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
    case 14:
      uint64_t v5 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        id v7 = v5;
        double v8 = [(id)v3 _stateAsString:v4];
        double v9 = [*(id *)(a1 + 32) _stateAsString:*(void *)(*(void *)(a1 + 32) + 8)];
        int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 330);
        int v11 = 136315906;
        id v12 = "-[AFMyriadCoordinator _advertiseSuppressTriggerInOutput]_block_invoke";
        __int16 v13 = 2112;
        float v14 = v8;
        __int16 v15 = 2112;
        unint64_t v16 = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d", (uint8_t *)&v11, 0x26u);

        uint64_t v3 = *(void *)(a1 + 32);
      }
      if (*(unsigned char *)(v3 + 330)) {
        [(id)v3 _winElection];
      }
LABEL_8:
      uint64_t v2 = 2;
      break;
    case 2:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
      uint64_t v2 = *(void *)(v3 + 24);
      break;
    case 3:
    case 4:
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "_winElection", 0);
      uint64_t v2 = 4;
      break;
    case 7:
      uint64_t v2 = 10;
      break;
    default:
      return [*(id *)(a1 + 32) enterState:v2];
  }
  return [*(id *)(a1 + 32) enterState:v2];
}

- (BOOL)_okayToSuppressOnOutput
{
  return (self->_myriadState > 0x11) | (0x54B5u >> self->_myriadState) & 1;
}

- (void)_advertiseSlowdown
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(void *)&self->_delayTarget = 0x3F8000003EE66668;
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v16 = "-[AFMyriadCoordinator _advertiseSlowdown]";
    __int16 v17 = 2048;
    uint64_t v18 = 0x3FDCCCCD00000000;
    __int16 v19 = 2048;
    uint64_t v20 = 0x3FF0000000000000;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE slowdown advertising delay: %f finished, interval: %f", buf, 0x20u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    uint64_t v4 = +[AFAnalytics sharedAnalytics];
    __int16 v13 = @"delay";
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_slowdownMsecs);
    float v14 = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v4 logEventWithType:2007 context:v6];
  }
  self->_clientDoneRespondingToSlowdown = 0;
  maxSlowdownRecord = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  kdebug_trace();
  double v8 = [(AFMyriadCoordinator *)self slowdownRecord:LOWORD(self->_slowdownMsecs)];
  double v9 = [v8 asAdvertisementData];
  *(float *)&double v10 = self->_delayTarget;
  *(float *)&double v11 = self->_advertInterval;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__AFMyriadCoordinator__advertiseSlowdown__block_invoke;
  v12[3] = &unk_1E592C678;
  v12[4] = self;
  [(AFMyriadCoordinator *)self _advertiseWith:v9 afterDelay:v12 maxInterval:v10 thenExecute:v11];
}

uint64_t __41__AFMyriadCoordinator__advertiseSlowdown__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[AFMyriadCoordinator _advertiseSlowdown]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending slowdown advertising, 2nd pass not seen", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) _endAdvertising:0];
  *(_DWORD *)(*(void *)(a1 + 32) + 296) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 327) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 304);
  *(void *)(v3 + 304) = 0;

  return [*(id *)(a1 + 32) enterState:0];
}

- (void)_advertiseTrigger
{
  v49[2] = *(double *)MEMORY[0x1E4F143B8];
  float v43 = 0.5;
  float v44 = 0.0;
  if (self->_clientIsWatchTrumpPromote) {
    goto LABEL_32;
  }
  if (self->_clientIsDirectActivating)
  {
    float deviceTrumpDelay = self->_deviceTrumpDelay;
    float v44 = deviceTrumpDelay;
    goto LABEL_9;
  }
  if (self->_clientIsInEarActivation || self->_clientRespondingToCarPlay)
  {
    float deviceInEarDelay = self->_deviceInEarDelay;
    float deviceInEarInterval = self->_deviceInEarInterval;
    float v43 = deviceInEarInterval;
    float v44 = deviceInEarDelay;
  }
  else
  {
LABEL_32:
    if (self->_voiceTriggerTime) {
      [(AFMyriadCoordinator *)self setupAdvIntervalsInDelay:&v44 interval:&v43 withSlowdown:0];
    }
  }
LABEL_9:
  if (!self->_clientIsDirectActivating) {
    [(AFNotifyStatePublisher *)self->_electionBeginPublisher publishState:[(AFMyriadCoordinator *)self _nextElectionPublisherState]];
  }
  int v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int testInducedSlowdownMsecs = self->_testInducedSlowdownMsecs;
    int slowdownMsecs = self->_slowdownMsecs;
    double v9 = v6;
    double v10 = [(AFMyriadCoordinator *)self _stateAsString];
    *(_DWORD *)buf = 136315906;
    id v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
    __int16 v47 = 1024;
    *(_DWORD *)v48 = testInducedSlowdownMsecs;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = slowdownMsecs;
    LOWORD(v49[0]) = 2112;
    *(void *)((char *)v49 + 2) = v10;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s BTLE checking if slowdown needed testmsecs=%d msecs=%d state=%@", buf, 0x22u);
  }
  int v11 = self->_testInducedSlowdownMsecs;
  if (v11 < 1 || self->_clientDoneRespondingToSlowdown)
  {
    uint64_t v12 = self->_slowdownMsecs;
    if ((int)v12 <= 0)
    {
      __int16 v13 = AFSiriLogContextConnection;
    }
    else
    {
      __int16 v13 = AFSiriLogContextConnection;
      if (self->_clientIsRespondingToSlowdown)
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
          _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown delay, 2nd pass seen", buf, 0xCu);
          uint64_t v12 = self->_slowdownMsecs;
        }
        *(_DWORD *)buf = 0;
        int v39 = 1056964608;
        [(AFMyriadCoordinator *)self setupAdvIntervalsInDelay:buf interval:&v39 withSlowdown:v12];
        [(AFMyriadCoordinator *)self _adjustActionWindowsFromSlowdown:self->_slowdownMsecs];
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          id v16 = objc_loadWeakRetained(&self->_delegate);
          *(float *)&double v17 = (float)self->_slowdownMsecs;
          [v16 myriadCoordinator:self willStartAdvertisingWithSlowDownInterval:v17];
        }
        self->_int slowdownMsecs = 0;
        self->_clientIsRespondingToSlowdown = 0;
        maxSlowdownRecord = self->_maxSlowdownRecord;
        self->_maxSlowdownRecord = 0;

        [(AFMyriadRecord *)self->_triggerRecord generateTiebreaker];
        __int16 v19 = [(AFMyriadRecord *)self->_triggerRecord asAdvertisementData];
        LODWORD(v20) = *(_DWORD *)buf;
        LODWORD(v21) = v39;
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        float v36 = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_505;
        id v37 = &unk_1E592C678;
        id v38 = self;
        double v22 = &v34;
LABEL_26:
        -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v19, v22, v20, v21, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);

        return;
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
      __int16 v47 = 2048;
      *(double *)v48 = v44;
      *(_WORD *)&v48[8] = 2048;
      v49[0] = v43;
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s BTLE computed advertising delay: %f finished, interval: %f", buf, 0x20u);
    }
    __int16 v19 = [(AFMyriadRecord *)self->_triggerRecord asAdvertisementData];
    *(float *)&double v21 = v43;
    *(float *)&double v20 = v44;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_506;
    double v32 = &unk_1E592C678;
    float v33 = self;
    double v22 = &v29;
    goto LABEL_26;
  }
  __int16 v23 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
    _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s BTLE advertising TEST INDUCED slowdown delay, 2nd pass seen", buf, 0xCu);
    int v11 = self->_testInducedSlowdownMsecs;
  }
  self->_delayTarget = v44;
  self->_advertInterval = v43;
  double v24 = [(AFMyriadCoordinator *)self slowdownRecord:(unsigned __int16)v11];
  __int16 v25 = [v24 asAdvertisementData];

  self->_int slowdownMsecs = 0;
  self->_clientIsRespondingToSlowdown = 0;
  BOOL v26 = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  *(float *)&double v27 = self->_delayTarget;
  *(float *)&double v28 = self->_advertInterval;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke;
  v40[3] = &unk_1E592B398;
  float v41 = v44;
  float v42 = v43;
  v40[4] = self;
  [(AFMyriadCoordinator *)self _advertiseWith:v25 afterDelay:v40 maxInterval:v27 thenExecute:v28];
}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 40);
  int v9 = *(_DWORD *)(a1 + 44);
  int v10 = v2;
  [*(id *)(a1 + 32) setupAdvIntervalsInDelay:&v10 interval:&v9 withSlowdown:*(unsigned int *)(*(void *)(a1 + 32) + 300)];
  [*(id *)(a1 + 32) _adjustActionWindowsFromSlowdown:*(unsigned int *)(*(void *)(a1 + 32) + 300)];
  [*(id *)(*(void *)(a1 + 32) + 240) generateTiebreaker];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[AFMyriadCoordinator _advertiseTrigger]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown finished, advertising delayed trigger", buf, 0xCu);
  }
  uint64_t v4 = *(id **)(a1 + 32);
  uint64_t v5 = [v4[30] asAdvertisementData];
  LODWORD(v7) = v9;
  LODWORD(v6) = v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_501;
  v8[3] = &unk_1E592C678;
  v8[4] = *(void *)(a1 + 32);
  [v4 _advertiseWith:v5 afterDelay:v8 maxInterval:v6 thenExecute:v7];
}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_505(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_506(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_501(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v1 _endAdvertisingWithDeviceProhibitions:v2];
}

- (void)_resetAdvertisementTimings
{
  advertTriggerAdvStartTime = self->_advTiming.advertTriggerAdvStartTime;
  self->_advTiming.advertTriggerAdvStartTime = 0;

  advertTriggerEndTime = self->_advTiming.advertTriggerEndTime;
  self->_advTiming.advertTriggerEndTime = 0;
}

- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 withSlowdown:(int)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  float v9 = (double)a5 / 1000.0;
  unint64_t voiceTriggerTime = self->_voiceTriggerTime;
  if (_AFMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
  }
  double v11 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
  double v12 = v9;
  uint64_t v13 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
  }
  float v14 = v11 + 1.45000005 + v12 + *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v13 / -1000000000.0;
  char v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v21 = 136316162;
    double v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
    __int16 v23 = 2048;
    double v24 = v11;
    __int16 v25 = 2048;
    double v26 = v11 + 1.45000005 + v12;
    __int16 v27 = 2048;
    double v28 = v14;
    __int16 v29 = 1024;
    int v30 = a5;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s endTime: %f targetTime: %f, advInterval: %f, slowDown: %d (ms)", (uint8_t *)&v21, 0x30u);
  }
  float v16 = 1.0;
  if (v14 <= 1.0)
  {
    float v17 = 0.0;
    float v16 = 0.5;
    if (v14 >= 0.5) {
      float v16 = v14;
    }
  }
  else if ((float)(v14 + -1.0) <= 0.45)
  {
    float v17 = v14 + -1.0;
  }
  else
  {
    float v17 = 0.0;
  }
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    [(AFMyriadPreferences *)self->_preferences testDeviceDelay];
    if (v18 != 0.0) {
      float v17 = v18;
    }
    __int16 v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315906;
      double v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
      __int16 v23 = 2048;
      double v24 = v16;
      __int16 v25 = 2048;
      double v26 = v17;
      __int16 v27 = 2048;
      double v28 = v12;
      double v20 = "%s adjusted advInterval: %f (secs) device delay: %f (secs), slowDown: %f (secs)";
LABEL_22:
      _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v21, 0x2Au);
    }
  }
  else
  {
    __int16 v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315906;
      double v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
      __int16 v23 = 2048;
      double v24 = v16;
      __int16 v25 = 2048;
      double v26 = v17;
      __int16 v27 = 2048;
      double v28 = v12;
      double v20 = "%s adjusted advInterval: %f (secs) adjusted delay: %f (secs), slowDown: %f (secs)";
      goto LABEL_22;
    }
  }
  *a3 = v17;
  *a4 = v16;
}

- (void)_duringNextWindowEnterState:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AFMyriadCoordinator__duringNextWindowEnterState___block_invoke;
  v5[3] = &unk_1E5929BD0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  [(AFMyriadCoordinator *)self _duringNextWindowExecute:v5];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __51__AFMyriadCoordinator__duringNextWindowEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enterState:*(void *)(a1 + 40)];
}

- (void)_duringNextWindowExecute:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_triggerTime)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    double v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:self->_triggerTime sinceDate:(float)((float)self->_nDeltaTs * 1.5)];
    if ([v6 compare:v5] == -1)
    {
      do
      {
        int v8 = self->_nDeltaTs + 1;
        self->_nDeltaTs = v8;
        double v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:self->_triggerTime sinceDate:(float)((float)v8 * 1.5)];

        double v6 = v7;
      }
      while ([v7 compare:v5] == -1);
    }
    else
    {
      double v7 = v6;
    }
    float v9 = [(NSDateFormatter *)self->_dateFormat stringFromDate:v7];
    int v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[AFMyriadCoordinator _duringNextWindowExecute:]";
      __int16 v14 = 2112;
      char v15 = v9;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s BTLE next action window: %@", (uint8_t *)&v12, 0x16u);
    }
    [(AFMyriadCoordinator *)self _createDispatchTimerForEvent:v7 toExecute:v4];
  }
  else
  {
    double v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[AFMyriadCoordinator _duringNextWindowExecute:]";
      _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s BTLE Attempt to execute time windowed action when trigger time not initialized", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_adjustActionWindowsFromSlowdown:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = [(NSDate *)self->_triggerTime dateByAddingTimeInterval:(double)a3 / 1000.0];
    triggerTime = self->_triggerTime;
    self->_triggerTime = v5;

    double v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      dateFormat = self->_dateFormat;
      float v9 = self->_triggerTime;
      int v10 = v7;
      double v11 = [(NSDateFormatter *)dateFormat stringFromDate:v9];
      int v12 = 136315650;
      uint64_t v13 = "-[AFMyriadCoordinator _adjustActionWindowsFromSlowdown:]";
      __int16 v14 = 1024;
      int v15 = a3;
      __int16 v16 = 2112;
      float v17 = v11;
      _os_log_debug_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_DEBUG, "%s BTLE action window adjusted by slowdown signal %d msecs new time: %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)_resetActionWindows
{
  triggerTime = self->_triggerTime;
  self->_triggerTime = 0;

  self->_int slowdownMsecs = 0;
}

- (void)_setupActionWindows
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  triggerTime = self->_triggerTime;
  self->_triggerTime = v3;

  self->_nDeltaTs = 0;
  uint64_t v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    dateFormat = self->_dateFormat;
    double v7 = self->_triggerTime;
    int v8 = v5;
    float v9 = [(NSDateFormatter *)dateFormat stringFromDate:v7];
    int v10 = 136315394;
    double v11 = "-[AFMyriadCoordinator _setupActionWindows]";
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s BTLE action window trigger time: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_resetAudioData
{
  self->_unint64_t voiceTriggerTime = 0;
}

- (id)_triggerTypeForArbitrationParticipationFrom:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = self->_recordType - 1;
  if (v4 > 9) {
    uint64_t v5 = &unk_1EEE97C10;
  }
  else {
    uint64_t v5 = (void *)qword_1E5929EA0[v4];
  }
  double v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v8 = (void *)MEMORY[0x1E4F28ED0];
    float v9 = v6;
    int v10 = [v8 numberWithInteger:a3];
    int v11 = 136315650;
    __int16 v12 = "-[AFMyriadCoordinator _triggerTypeForArbitrationParticipationFrom:]";
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback recordType: %@, type: %@", (uint8_t *)&v11, 0x20u);
  }
  return v5;
}

- (void)_updateArbitrationParticipationContextWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void (**)(void))a3;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v23 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", buf, 0xCu);
    }
    double v6 = objc_alloc_init(AFArbitrationParticipationContext);
    [(AFArbitrationParticipationContext *)v6 setOwnAdvertisement:self->_triggerRecord];
    if ([(NSMutableDictionary *)self->_repliesBeforeDecision count]) {
      [(AFMyriadCoordinator *)self _sortedReplies:self->_repliesBeforeDecision];
    }
    else {
    double v7 = [(AFMyriadCoordinator *)self _sortedReplies];
    }
    if (v7) {
      [(AFArbitrationParticipationContext *)v6 setAdvertisements:v7];
    }
    [(AFArbitrationParticipationContext *)v6 setRequestStartDate:self->_triggerTime];
    [(AFArbitrationParticipationContext *)v6 setDecisionIsWon:self->_lastDecision];
    [(AFMyriadGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator lastActivationTime];
    -[AFArbitrationParticipationContext setLastActivationTime:](v6, "setLastActivationTime:");
    int v8 = [(AFMyriadCoordinator *)self _triggerTypeForArbitrationParticipationFrom:self->_recordType];
    [(AFArbitrationParticipationContext *)v6 setTriggerType:v8];
    uint64_t v9 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    double v10 = *(double *)&_AFMachAbsoluteTimeRate_rate;
    if (self->_recordType == 10)
    {
      int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v9 / 1000000000.0- *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0)];
      if (v11) {
        [(AFArbitrationParticipationContext *)v6 setVoiceTriggerDate:v11];
      }
    }
    myriadSession = self->_myriadSession;
    if (myriadSession)
    {
      __int16 v13 = (void *)[(AFMyriadSession *)myriadSession copy];
      myriadInstrumentation = self->_myriadInstrumentation;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke;
      v17[3] = &unk_1E5929CE8;
      uint64_t v18 = v6;
      __int16 v19 = self;
      id v20 = v13;
      int v21 = v4;
      id v15 = v13;
      [(AFMyriadInstrumentation *)myriadInstrumentation getPreviousBoostsWithCompletion:v17];
    }
    else
    {
      __int16 v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v23 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]";
        _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s #myriad #feedback session is nil.", buf, 0xCu);
      }
      v4[2](v4);
    }
  }
}

void __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v16 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback getPreviousBoostsWithCompletion", buf, 0xCu);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = objc_alloc(MEMORY[0x1E4FA0290]);
  double v7 = [v3 data];
  int v8 = (void *)[v6 initWithData:v7];
  [v5 setScoreBoosters:v8];

  if (*(void *)(*(void *)(a1 + 40) + 632) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(*(void *)(a1 + 40) + 632);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke_487;
    v13[3] = &unk_1E592C360;
    uint64_t v11 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v10 arbitrationDidUpdateWithContext:v9 session:v11 completion:v13];
  }
  else
  {
    __int16 v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]_block_invoke_2";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s #myriad #feedback arbitration event delgate failed.", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke_487(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL clientIsDirectActivating = self->_clientIsDirectActivating;
  if (self->_clientIsDirectActivating || self->_clientIsInEarActivation)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      float v41 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
      __int16 v42 = 1024;
      *(_DWORD *)float v43 = 1;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = clientIsDirectActivating;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad Not pushing myriad advertisement context - HAL context donation enabled: %d, direct activation: %d", buf, 0x18u);
    }
  }
  else
  {
    uint64_t v9 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    double v10 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v9 / 1000000000.0
        - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0;
    if (v10 >= 0.0)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceReferenceDate];
      double v13 = v12;
      double v14 = v12 - v10;
      id v15 = [(AFMyriadSession *)self->_myriadSession currentElectionAdvertisementData];
      __int16 v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        unint64_t voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)buf = 136316674;
        float v41 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
        __int16 v42 = 2048;
        *(double *)float v43 = v13;
        *(_WORD *)&v43[8] = 2048;
        *(double *)&v43[10] = v14;
        *(_WORD *)&v43[18] = 2048;
        *(double *)&v43[20] = v10;
        __int16 v44 = 2048;
        unint64_t v45 = voiceTriggerTime;
        __int16 v46 = 2048;
        uint64_t v47 = v9;
        __int16 v48 = 2112;
        uint64_t v49 = v15;
        _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s #myriad adv dispatch time: %f, voice trigger end time: %f, time since voice trigger: %f (curr time: %llu, time since device boot: %llu), advertisement: %@", buf, 0x48u);
      }
      if (v15)
      {
        uint64_t v18 = [[AFMyriadAdvertisementContextRecord alloc] initWithAdvertisementRecordType:self->_recordType voiceTriggerEndTime:v15 advertisementPayload:self->_designatedSelfID deviceID:v14];
        contextRecord = self->_contextRecord;
        self->_contextRecord = v18;

        [(AFMyriadAdvertisementContextRecord *)self->_contextRecord setAdvertisementDispatchTime:v13];
        id v20 = [(AFMyriadAdvertisementContextRecord *)self->_contextRecord myriadAdvertisementContextAsData];
        if (AFIsInternalInstall_onceToken != -1) {
          dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
        }
        if (AFIsInternalInstall_isInternal)
        {
          int v21 = [(AFMyriadAdvertisementContextRecord *)self->_contextRecord description];
        }
        else
        {
          int v21 = 0;
        }
        uint64_t v24 = [(AFMyriadSession *)self->_myriadSession currentElectionAdvertisementId];
        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
        {
          __int16 v25 = +[AFAnalytics sharedAnalytics];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke;
          v35[3] = &unk_1E5929C70;
          double v38 = v14;
          double v39 = v13;
          id v36 = v24;
          id v37 = v21;
          [v25 logEventWithType:2013 contextProvider:v35];
        }
        double v26 = [AFMyriadAdvertisementContext alloc];
        [(AFMyriadCoordinator *)self _contextFetchDelayForAdvertimentInterval:a3 advertisementDelay:a4];
        __int16 v27 = -[AFMyriadAdvertisementContext initWithGeneration:contextData:contextFetchDelay:](v26, "initWithGeneration:contextData:contextFetchDelay:", 0, v20);
        advContextManager = self->_advContextManager;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2;
        v30[3] = &unk_1E5929CC0;
        v30[4] = self;
        id v31 = v24;
        double v33 = v14;
        double v34 = v13;
        id v32 = v15;
        id v29 = v24;
        [(AFMyriadAdvertisementContextManager *)advContextManager pushMyriadAdvertisementContext:v27 completionHandler:v30];
      }
      else
      {
        double v22 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          unint64_t v23 = self->_voiceTriggerTime;
          *(_DWORD *)buf = 136315906;
          float v41 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
          __int16 v42 = 1024;
          *(_DWORD *)float v43 = 1;
          *(_WORD *)&v43[4] = 2048;
          *(void *)&v43[6] = v23;
          *(_WORD *)&v43[14] = 2048;
          *(void *)&v43[16] = v9;
          _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad Not pushing myriad advertisement context - Valid voicetrigger endtime: %d (curr time: %llu, time since device boot: %llu)", buf, 0x26u);
        }
      }
    }
  }
}

id __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  [v2 setObject:v3 forKey:@"voiceTriggerEndTime"];

  unint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  [v2 setObject:v4 forKey:@"advertisementDispatchTime"];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = [v5 UUIDString];
    [v2 setObject:v6 forKey:@"contextAdvertisementId"];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [v2 setObject:v7 forKey:@"advertisementContext"];
  }
  int v8 = (void *)[v2 copy];

  return v8;
}

void __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_3;
  block[3] = &unk_1E5929C98;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  long long v17 = *(_OWORD *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_3(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
          "Delay:]_block_invoke_3";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad Pushing Myriad advertisement context is complete", buf, 0xCu);
  }
  id v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 512) currentElectionAdvertisementId];
    id v5 = (void *)v6;
    uint64_t v7 = *(void **)(a1 + 48);
    if (v7 && v6)
    {
      if ([*(id *)(a1 + 48) isEqual:v6])
      {
        if ([*(id *)(a1 + 40) _shouldUseContextCollector])
        {
          double v26 = v5;
          uint64_t v8 = [*(id *)(a1 + 56) count];
          if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
          {
            id v9 = +[AFAnalytics sharedAnalytics];
            id v32 = @"count";
            id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
            double v33 = v10;
            uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            [v9 logEventWithType:2015 context:v11];
          }
          id v12 = [*(id *)(a1 + 40) _testAndFilterAdvertisementsFromContextCollector:*(void *)(a1 + 56) voiceTriggerEndTime:*(void *)(a1 + 64) advertisementDispatchTime:*(double *)(a1 + 72) advertisement:*(double *)(a1 + 80)];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if ([*(id *)(a1 + 40) _testAndUpdateWedgeFilter:v17])
                {
                  uint64_t v18 = *(void **)(a1 + 40);
                  __int16 v19 = [v17 deviceID];
                  id v20 = [v19 UUIDString];
                  int v21 = [v17 asAdvertisementData];
                  [v18 _updateRepliesWith:v17 id:v20 data:v21];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
            }
            while (v14);
          }
          [*(id *)(a1 + 40) _suppressDeviceIfNeededWithVoiceTriggerEndTime:*(double *)(a1 + 72) adverisementDispatchTime:*(double *)(a1 + 80)];
          id v5 = v26;
        }
        else
        {
          if (+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
            goto LABEL_40;
          }
          id v12 = +[AFAnalytics sharedAnalytics];
          [v12 logEventWithType:2017 context:0];
        }
        goto LABEL_39;
      }
      uint64_t v7 = *(void **)(a1 + 48);
    }
    double v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertiseme"
            "ntDelay:]_block_invoke";
      __int16 v38 = 2112;
      double v39 = v7;
      __int16 v40 = 2112;
      float v41 = v5;
      _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad current advId: %@ is different from the advId for which the myriad context was dispatched: %@", buf, 0x20u);
      uint64_t v7 = *(void **)(a1 + 48);
    }
    v34[0] = @"contextAdvertisementId";
    if (v7)
    {
      unint64_t v23 = [v7 UUIDString];
    }
    else
    {
      unint64_t v23 = &stru_1EEE35D28;
    }
    v34[1] = @"currentAdvertisementId";
    v35[0] = v23;
    if (v5)
    {
      uint64_t v24 = [v5 UUIDString];
    }
    else
    {
      uint64_t v24 = &stru_1EEE35D28;
    }
    v35[1] = v24;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    if (v5) {

    }
    if (v7) {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    }
    {
      __int16 v25 = +[AFAnalytics sharedAnalytics];
      [v25 logEventWithType:2016 context:v12 contextNoCopy:0];
    }
LABEL_39:

    goto LABEL_40;
  }
  unint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
          "Delay:]_block_invoke";
    __int16 v38 = 2112;
    double v39 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s #myriad Error: %@", buf, 0x16u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    id v5 = +[AFAnalytics sharedAnalytics];
    [v5 logEventWithType:2014 context:0];
LABEL_40:
  }
}

- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  double v7 = a4 - a3;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_replies count];
  uint64_t v10 = v9;
  if (v8 > 1.45000005 && v9 != 0)
  {
    replies = self->_replies;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__AFMyriadCoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke;
    v23[3] = &unk_1E5929C48;
    *(double *)&v23[5] = a3;
    *(double *)&v23[6] = a4;
    *(double *)&v23[7] = v8;
    v23[8] = v10;
    v23[4] = self;
    [(NSMutableDictionary *)replies enumerateKeysAndObjectsUsingBlock:v23];
  }
  if (self->_suppressLateTrigger)
  {
    v24[0] = @"voiceTriggerEndTime";
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    v25[0] = v13;
    v24[1] = @"advertisementDispatchTime";
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
    v25[1] = v14;
    v24[2] = @"count";
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
    v25[2] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      long long v17 = +[AFAnalytics sharedAnalytics];
      [v17 logEventWithType:2018 context:v16];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v19 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      id v20 = [(AFMyriadSession *)self->_myriadSession sessionId];
      uint64_t v21 = mach_absolute_time();
      LODWORD(v22) = 0.75;
      [(AFMyriadInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingStarting:v19 withDelay:v20 withInterval:v21 withCdaId:0.0 withTimestamp:v22];
    }
  }
}

void __95__AFMyriadCoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([a3 isMe] & 1) == 0)
  {
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[7];
      uint64_t v10 = a1[8];
      int v11 = 136316162;
      id v12 = "-[AFMyriadCoordinator _suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:]_block_invoke";
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad Suppressing the current device due to late trigger (voicetrigger endtime: %f, advertisement dispatch time: %f, advertisement delay: %f, myriad record count: %ld)", (uint8_t *)&v11, 0x34u);
    }
    *(unsigned char *)(a1[4] + 417) = 1;
    *a4 = 1;
  }
}

- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (v9 && [v9 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __132__AFMyriadCoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke;
    v29[3] = &unk_1E5929C20;
    double v32 = a4;
    v29[4] = self;
    id v30 = v10;
    id v12 = v11;
    id v31 = v12;
    id v24 = v9;
    [v9 enumerateKeysAndObjectsUsingBlock:v29];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            *(_DWORD *)buf = 136315394;
            double v34 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertiseme"
                  "ntDispatchTime:advertisement:]";
            __int16 v35 = 2112;
            uint64_t v36 = v19;
            _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s #myriad %@", buf, 0x16u);
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v15);
    }

    uint64_t v20 = v31;
    id v21 = v13;

    id v9 = v24;
  }
  else
  {
    double v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v34 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDisp"
            "atchTime:advertisement:]";
      _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad Context collector returned 0 AFMyriadAdvertisementContextRecords instances", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

void __132__AFMyriadCoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 isSaneForVoiceTriggerEndTime:*(double *)(a1 + 56) endtimeDistanceThreshold:*(double *)(*(void *)(a1 + 32) + 144)])
  {
    uint64_t v7 = [v6 recordForDeviceId:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 deviceGroup] == *(unsigned __int8 *)(*(void *)(a1 + 32) + 168))
      {
        id v9 = [v8 deviceID];
        if ([v9 isEqual:*(void *)(*(void *)(a1 + 32) + 360)])
        {
        }
        else
        {
          char v15 = [v6 compareAdvertisementPayload:*(void *)(a1 + 40)];

          if ((v15 & 1) == 0) {
            [*(id *)(a1 + 48) addObject:v8];
          }
        }
      }
      else
      {
        id v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          id v11 = v10;
          int v12 = [v8 deviceGroup];
          id v13 = [v8 deviceID];
          uint64_t v14 = [v6 advertisementPayload];
          int v16 = 136315906;
          __int16 v17 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisement"
                "DispatchTime:advertisement:]_block_invoke";
          __int16 v18 = 1024;
          int v19 = v12;
          __int16 v20 = 2112;
          id v21 = v13;
          __int16 v22 = 2112;
          unint64_t v23 = v14;
          _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s #myriad ignoring advert from other deviceGroup %d: %@ data=%@", (uint8_t *)&v16, 0x26u);
        }
      }
    }
  }
}

- (BOOL)_shouldUseContextCollector
{
  unint64_t myriadState = self->_myriadState;
  return myriadState == 1 || myriadState == 14;
}

- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4
{
  return a3 + -0.2;
}

- (void)_handleStateMachineErrorIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_stateMachineEncounteredError)
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[AFMyriadCoordinator _handleStateMachineErrorIfNeeded]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify Myriad win due to state machine error", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v4 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    self->_lastDecisionTime = (unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4);
    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal) {
      [(AFMyriadCoordinator *)self _triggerABCForType:@"state_machine_error" context:0];
    }
    self->_lastDecision = 1;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      id v7 = objc_loadWeakRetained(&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&self->_delegate);
        [v9 shouldContinue:self];
      }
    }
    kdebug_trace();
    [(AFNotifyStatePublisher *)self->_electionWinPublisher publishState:[(AFMyriadCoordinator *)self _nextElectionPublisherState]];
    self->_stateMachineEncounteredError = 0;
  }
}

- (void)_unduck
{
  if (self->_coordinationEnabled)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = objc_loadWeakRetained(p_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained(p_delegate);
        [v8 shouldUnduck:self];
      }
    }
  }
}

- (void)_stopAdvertisingAndListening
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __51__AFMyriadCoordinator__stopAdvertisingAndListening__block_invoke;
  v13[3] = &unk_1E592C678;
  void v13[4] = self;
  [(AFMyriadCoordinator *)self _waitWiProx:2000 andExecute:v13];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained(&self->_delegate);
      [v7 advertisingDidEnd:self];
    }
  }
  id v8 = objc_loadWeakRetained(&self->_delegate);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_loadWeakRetained(&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained(&self->_delegate);
      [v12 listeningDidEnd:self];
    }
  }
}

void __51__AFMyriadCoordinator__stopAdvertisingAndListening__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[AFMyriadCoordinator _stopAdvertisingAndListening]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising and scanning of HeySiri advertisements", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopScanningAndAdvertising];
    *(unsigned char *)(*(void *)(a1 + 32) + 440) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 441) = 0;
  }
}

- (void)stopListening:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AFMyriadCoordinator_stopListening___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __37__AFMyriadCoordinator_stopListening___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListening:*(void *)(a1 + 40)];
}

- (void)stopListening
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AFMyriadCoordinator_stopListening__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __36__AFMyriadCoordinator_stopListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListening:0];
}

- (void)_stopListening:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[AFMyriadCoordinator _stopListening:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __38__AFMyriadCoordinator__stopListening___block_invoke;
  char v15 = &unk_1E592C6E8;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(AFMyriadCoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "listeningDidEnd:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __38__AFMyriadCoordinator__stopListening___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AFMyriadCoordinator _stopListening:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping to scan HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopScanning];
    *(unsigned char *)(*(void *)(a1 + 32) + 440) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_stopAdvertising:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[AFMyriadCoordinator _stopAdvertising:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __40__AFMyriadCoordinator__stopAdvertising___block_invoke;
  char v15 = &unk_1E592C6E8;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(AFMyriadCoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "advertisingDidEnd:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __40__AFMyriadCoordinator__stopAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AFMyriadCoordinator _stopAdvertising:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 319))
  {
    [*(id *)(v3 + 352) stopAdvertising];
    *(unsigned char *)(*(void *)(a1 + 32) + 441) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldStopListeningBeforeAdvertising
{
  return (self->_previousState < 0x12) & (0x37FFCu >> self->_previousState);
}

- (void)startListening:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator_startListening___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __38__AFMyriadCoordinator_startListening___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening:*(void *)(a1 + 40)];
}

- (void)startListening
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AFMyriadCoordinator_startListening__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __37__AFMyriadCoordinator_startListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening:0];
}

- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v6 && !self->_BTLEReady)
  {
    id v9 = AFSiriLogContextMyriad;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[AFMyriadCoordinator _startListeningAfterWiProxIsReady:inState:completion:]";
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s Waiting for wiprox to be ready in state: %lu", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__AFMyriadCoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke;
    v12[3] = &unk_1E5929BF8;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a4;
    id v13 = v8;
    char v10 = (void *)MEMORY[0x19F3A50D0](v12);
    id waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
    self->_id waitForWiproxReadinessToScan = v10;

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(AFMyriadCoordinator *)self _startListening:v8];
  }
}

void __76__AFMyriadCoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 1);
    if (v4 == *(void *)(a1 + 48))
    {
      int v5 = AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315394;
        uint64_t v7 = "-[AFMyriadCoordinator _startListeningAfterWiProxIsReady:inState:completion:]_block_invoke";
        __int16 v8 = 2048;
        uint64_t v9 = v4;
        _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s starting to scan in state: %lu", (uint8_t *)&v6, 0x16u);
      }
      [v3 _startListening:*(void *)(a1 + 32)];
    }
  }
}

- (void)_startListening:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[AFMyriadCoordinator _startListening:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  [(AFMyriadCoordinator *)self _enterBLEDiagnosticMode];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __39__AFMyriadCoordinator__startListening___block_invoke;
  char v15 = &unk_1E592C6E8;
  int v16 = self;
  id v6 = v4;
  id v17 = v6;
  [(AFMyriadCoordinator *)self _waitWiProxAndExecute:&v12];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "listeningDidBegin:", self, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __39__AFMyriadCoordinator__startListening___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 319))
  {
    [*(id *)(v2 + 352) startScanning];
    *(unsigned char *)(*(void *)(a1 + 32) + 440) = 1;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)resetReplies
{
  objc_storeStrong((id *)&self->_repliesBeforeDecision, self->_replies);
  uint64_t v3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  replies = self->_replies;
  self->_replies = v3;

  int v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  replyCounts = self->_replyCounts;
  self->_replyCounts = v5;
}

- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4
{
  if (a4 == 1)
  {
    self->_BOOL clientIsDeciding = 0;
    [(AFMyriadCoordinator *)self _resetAdvertisementTimings];
  }
}

- (id)_stateAsString:(unint64_t)a3
{
  if (a3 > 0x11) {
    return @"<AFMYR_State_ERROR>";
  }
  else {
    return off_1E5929E10[a3];
  }
}

- (id)_stateAsString
{
  return [(AFMyriadCoordinator *)self _stateAsString:self->_myriadState];
}

- (void)enterState:(unint64_t)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AFMyriadCoordinator_enterState___block_invoke;
  v4[3] = &unk_1E592B398;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __34__AFMyriadCoordinator_enterState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enterState:*(void *)(a1 + 40)];
}

- (void)_enterState:(unint64_t)a3
{
  v90[1] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [(AFMyriadCoordinator *)self _stateAsString];
    __int16 v8 = [(AFMyriadCoordinator *)self _stateAsString:a3];
    *(_DWORD *)buf = 136315650;
    v77 = "-[AFMyriadCoordinator _enterState:]";
    __int16 v78 = 2112;
    *(void *)v79 = v7;
    *(_WORD *)&v79[8] = 2112;
    double v80 = *(double *)&v8;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE Coordinator altered state: %@ -> %@", buf, 0x20u);
  }
  self->_unint64_t previousState = self->_myriadState;
  self->_unint64_t myriadState = a3;
  -[AFMyriadCoordinator _enteringIntoState:fromState:](self, "_enteringIntoState:fromState:", a3);
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v12 = objc_loadWeakRetained(&self->_delegate);
    [v12 myriadCoordinator:self didEnterState:self->_myriadState fromState:self->_previousState];
  }
  switch(a3)
  {
    case 0uLL:
      [(AFMyriadCoordinator *)self _leaveBLEDiagnosticMode];
      [(AFPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      overrideMyriadRecord = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      *(_WORD *)&self->_clientIsWatchActivation = 0;
      self->_clientIsInEarActivation = 0;
      *(_WORD *)&self->_clientRespondingToCarPlay = 0;
      [(AFMyriadCoordinator *)self _stopAdvertisingAndListening];
      [(AFMyriadCoordinator *)self _resetActionWindows];
      if (self->_ducking) {
        [(AFMyriadCoordinator *)self _unduck];
      }
      if ([(NSMutableDictionary *)self->_multipleContinuations count])
      {
        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
        {
          uint64_t v14 = +[AFAnalytics sharedAnalytics];
          v89 = @"count";
          char v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSMutableDictionary count](self->_multipleContinuations, "count"));
          v90[0] = v15;
          int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
          [v14 logEventWithType:2009 context:v16];
        }
        id v17 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
        multipleContinuations = self->_multipleContinuations;
        self->_multipleContinuations = v17;
      }
      [(AFMyriadCoordinator *)self _cancelTimer];
      [(AFMyriadCoordinator *)self _cancelOverallTimeout];
      [(AFMyriadCoordinator *)self _clearWiProxReadinessTimer];
      [(AFMyriadCoordinator *)self resetReplies];
      uint64_t v19 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
      repliesBeforeDecision = self->_repliesBeforeDecision;
      self->_repliesBeforeDecision = v19;

      [(AFMyriadCoordinator *)self _handleStateMachineErrorIfNeeded];
      eventToken = self->_eventToken;
      self->_eventToken = 0;

      self->_recordType = 0;
      self->_unint64_t previousState = 0;
      self->_suppressLateTrigger = 0;
      [(AFMyriadCoordinator *)self _resetAdvertisementTimings];
      [(AFMyriadCoordinator *)self _resetAudioData];
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
      {
        myriadInstrumentation = self->_myriadInstrumentation;
        uint64_t v23 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
        uint64_t v24 = [(AFMyriadSession *)self->_myriadSession sessionId];
        [(AFMyriadInstrumentation *)myriadInstrumentation logCDADeviceStateActivityEnded:v23 withCdaId:v24 withTimestamp:mach_absolute_time()];
      }
      [(AFMyriadCoordinator *)self _clearMyriadSession];
      [(AFMyriadAdvertisementContextManager *)self->_advContextManager reset];
      currentMyriadContext = self->_currentMyriadContext;
      self->_currentMyriadContext = 0;

      if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
      {
        long long v26 = +[AFAnalytics sharedAnalytics];
        v87 = @"state";
        long long v27 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_myriadState);
        v88 = v27;
        long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        [v26 logEventWithType:2012 context:v28];
      }
      id waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
      self->_id waitForWiproxReadinessToScan = 0;

      return;
    case 1uLL:
      id v30 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        BOOL coordinationEnabled = self->_coordinationEnabled;
        BOOL BLEActivityEnabled = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        __int16 v78 = 1024;
        *(_DWORD *)v79 = coordinationEnabled;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = BLEActivityEnabled;
        _os_log_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      if ([(AFMyriadCoordinator *)self _shouldStopListeningBeforeAdvertising])
      {
        double v33 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v77 = "-[AFMyriadCoordinator _enterState:]";
          _os_log_impl(&dword_19CF1D000, v33, OS_LOG_TYPE_INFO, "%s #myriad Force stopping BTLE scan", buf, 0xCu);
        }
        [(AFMyriadCoordinator *)self _stopListening:0];
      }
      if ([(AFMyriadContext *)self->_currentMyriadContext activationSource] != 13
        || self->_clientIsDirectActivating)
      {
        goto LABEL_30;
      }
      uint64_t v34 = mach_absolute_time();
      double TimeInterval = AFMachAbsoluteTimeGetTimeInterval(v34 - self->_voiceTriggerTime);
      uint64_t v36 = (void *)AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
      {
        unint64_t latestRecordReceivedTime = self->_latestRecordReceivedTime;
        uint64_t v38 = self->_currentMyriadContext;
        double v39 = v36;
        uint64_t v40 = [(AFMyriadContext *)v38 activationExpirationTime];
        *(_DWORD *)buf = 136316418;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        __int16 v78 = 2048;
        *(void *)v79 = 13;
        *(_WORD *)&v79[8] = 2048;
        double v80 = TimeInterval;
        __int16 v81 = 2048;
        unint64_t v82 = latestRecordReceivedTime;
        __int16 v83 = 2048;
        uint64_t v84 = v34;
        __int16 v85 = 2048;
        uint64_t v86 = v40;
        _os_log_impl(&dword_19CF1D000, v39, OS_LOG_TYPE_INFO, "%s Activation source: %ld, Time since activation: %f, last election record received time: %llu, current time: %llu, activation expiration time: %llu", buf, 0x3Eu);
      }
      if (TimeInterval > 0.949999988
        && v34 < [(AFMyriadContext *)self->_currentMyriadContext activationExpirationTime]
        && self->_latestRecordReceivedTime >= self->_voiceTriggerTime)
      {
        myriadWorkQueue = self->_myriadWorkQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __35__AFMyriadCoordinator__enterState___block_invoke;
        block[3] = &unk_1E592C678;
        void block[4] = self;
        dispatch_async(myriadWorkQueue, block);
      }
      else
      {
LABEL_30:
        self->_inTask = 1;
        self->_ducking = 1;
        self->_int nTimesContinued = 0;
        replies = self->_replies;
        triggerRecord = self->_triggerRecord;
        float v43 = [(AFMyriadRecord *)triggerRecord deviceID];
        __int16 v44 = [v43 UUIDString];
        [(NSMutableDictionary *)replies setObject:triggerRecord forKey:v44];

        self->_lastPHash = [(AFMyriadRecord *)self->_triggerRecord pHash];
        [(AFMyriadCoordinator *)self _createMyriadSessionIfRequired];
        unint64_t v45 = [(AFMyriadRecord *)self->_triggerRecord asAdvertisementData];
        [(AFMyriadCoordinator *)self _addElectionAdvertisementDataToMyriadSession:v45];

        [(AFMyriadCoordinator *)self _setupActionWindows];
        [(AFMyriadCoordinator *)self _setOverallTimeout];
        [(AFMyriadCoordinator *)self _advertiseTrigger];
      }
      return;
    case 2uLL:
      self->_int slowdownMsecs = 0;
      __int16 v46 = @"listen late";
      LODWORD(v11) = 1.0;
      uint64_t v47 = self;
      uint64_t v48 = 4;
      goto LABEL_77;
    case 3uLL:
      self->_recordType = 9;
      uint64_t v49 = [(AFMyriadCoordinator *)self lateSuppressionRecord];
      goto LABEL_51;
    case 4uLL:
      if (self->_nTimesContinued >= 5) {
        [(AFPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      }
      if (!self->_inSetupMode && !self->_inTask) {
        goto LABEL_43;
      }
      int nTimesContinued = self->_nTimesContinued;
      if (self->_clientRespondingToCarPlay && !nTimesContinued)
      {
        __int16 v51 = self->_currentMyriadContext;
        if (v51)
        {
          self->_currentMyriadContext = 0;
        }
        [(AFMyriadCoordinator *)self _resetAudioData];
        int nTimesContinued = self->_nTimesContinued;
      }
      self->_int nTimesContinued = nTimesContinued + 1;
      if (nTimesContinued < 20)
      {
        [(AFMyriadCoordinator *)self _stopAdvertisingAndListening];
        v56 = self;
        uint64_t v57 = 5;
LABEL_80:
        [(AFMyriadCoordinator *)v56 _duringNextWindowEnterState:v57];
      }
      else
      {
LABEL_43:
        [(AFMyriadCoordinator *)self _enterState:0];
      }
      return;
    case 5uLL:
      uint64_t v52 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v53 = self->_nTimesContinued;
        *(_DWORD *)buf = 136315394;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        __int16 v78 = 1024;
        *(_DWORD *)v79 = v53;
        _os_log_impl(&dword_19CF1D000, v52, OS_LOG_TYPE_INFO, "%s BTLE task continuation: %d", buf, 0x12u);
      }
      if (AFIsHorseman_onceToken != -1) {
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
      }
      if (!AFIsHorseman_isHorseman)
      {
        uint64_t v72 = self;
        uint64_t v73 = 4;
        goto LABEL_82;
      }
      self->_recordType = 2;
      uint64_t v49 = [(AFMyriadCoordinator *)self continuationRecord];
LABEL_51:
      v54 = (void *)v49;
      [(AFMyriadCoordinator *)self _advertise:v49 andMoveTo:4];
LABEL_69:

      break;
    case 6uLL:
      uint64_t v49 = [(AFMyriadCoordinator *)self directTriggerRecord];
      goto LABEL_51;
    case 7uLL:
      v55 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19CF1D000, v55, OS_LOG_TYPE_INFO, "%s BTLE task MYR_WAIT_EMERGENCY_OR_TASK only stopping advertising, not listening", buf, 0xCu);
      }
      [(AFMyriadCoordinator *)self _stopAdvertising:0];
      [(AFMyriadCoordinator *)self _startListening:0];
      [(AFPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
      self->_int slowdownMsecs = 0;
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      v56 = self;
      uint64_t v57 = 10;
      goto LABEL_80;
    case 8uLL:
      self->_recordType = 4;
      v58 = [(AFMyriadCoordinator *)self emergencyRecord];
      [(AFMyriadCoordinator *)self _advertise:v58 andMoveTo:11];

      id v59 = objc_loadWeakRetained(&self->_delegate);
      char v60 = objc_opt_respondsToSelector();

      if ((v60 & 1) == 0) {
        return;
      }
      v54 = objc_loadWeakRetained(&self->_delegate);
      [v54 myriadCoordinatorIsAdvertisingEmergency:self];
      goto LABEL_69;
    case 9uLL:
      uint64_t v61 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19CF1D000, v61, OS_LOG_TYPE_INFO, "%s BTLE emergency is being handled", buf, 0xCu);
      }
      self->_recordType = 5;
      v62 = [(AFMyriadCoordinator *)self emergencyHandledRecord];
      [(AFMyriadCoordinator *)self _advertise:v62 andMoveTo:4];

      [(AFMyriadEmergencyCallPunchout *)self->_callPunchout initiateEmergencyCallMyriad];
      id v63 = objc_loadWeakRetained(&self->_delegate);
      char v64 = objc_opt_respondsToSelector();

      if ((v64 & 1) == 0) {
        return;
      }
      v54 = objc_loadWeakRetained(&self->_delegate);
      [v54 myriadCoordinatorWillHandleEmergency:self];
      goto LABEL_69;
    case 0xAuLL:
      int nTimesExtended = self->_nTimesExtended;
      self->_int nTimesExtended = nTimesExtended + 1;
      if (nTimesExtended > 18) {
        goto LABEL_78;
      }
      [(AFMyriadCoordinator *)self _startListening:0];
      __int16 v46 = @"listen wait/emergency";
      LODWORD(v11) = 0.75;
      goto LABEL_76;
    case 0xBuLL:
      __int16 v66 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19CF1D000, v66, OS_LOG_TYPE_INFO, "%s BTLE task MYR_WAIT_EMERGENCY_HANDLED only stopping advertising, not listening", buf, 0xCu);
      }
      [(AFMyriadCoordinator *)self _stopAdvertising:0];
      v56 = self;
      uint64_t v57 = 12;
      goto LABEL_80;
    case 0xCuLL:
      int v67 = self->_nTimesExtended;
      self->_int nTimesExtended = v67 + 1;
      if (v67 > 18)
      {
LABEL_78:
        uint64_t v72 = self;
        uint64_t v73 = 0;
LABEL_82:
        [(AFMyriadCoordinator *)v72 enterState:v73];
      }
      else
      {
        [(AFMyriadCoordinator *)self _startListening:0];
        __int16 v46 = @"listen emergency handled";
        LODWORD(v11) = 0.75;
        uint64_t v47 = self;
        uint64_t v48 = 11;
LABEL_77:
        [(AFMyriadCoordinator *)v47 _startTimer:v46 for:v48 thenEnterState:v11];
      }
      break;
    case 0xDuLL:
      v54 = [(AFMyriadCoordinator *)self directTriggerRecord];
      [(AFMyriadCoordinator *)self _advertiseIndefinite:v54];
      goto LABEL_69;
    case 0xEuLL:
      __int16 v68 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        BOOL v69 = self->_coordinationEnabled;
        BOOL v70 = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        __int16 v78 = 1024;
        *(_DWORD *)v79 = v69;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v70;
        _os_log_impl(&dword_19CF1D000, v68, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.decision.won", 0, 0, 1u);
      [(AFMyriadCoordinator *)self _cancelOverallTimeout];
      [(AFMyriadCoordinator *)self _advertiseSuppressTriggerInOutput];
      return;
    case 0xFuLL:
      [(AFMyriadCoordinator *)self resetReplies];
      [(AFMyriadCoordinator *)self _createMyriadSessionIfRequired];
      [(AFMyriadCoordinator *)self _startListeningAfterWiProxIsReady:0 inState:15 completion:0];
      __int16 v46 = @"preheat timer";
      LODWORD(v11) = 2.0;
      goto LABEL_76;
    case 0x10uLL:
      self->_recordType = 8;
      [(AFMyriadCoordinator *)self _advertiseSlowdown];
      return;
    case 0x11uLL:
      [(AFMyriadCoordinator *)self _createMyriadSessionIfRequired];
      [(AFMyriadCoordinator *)self _startListening:0];
      __int16 v46 = @"filter initialization timer";
      LODWORD(v11) = 1.0;
LABEL_76:
      uint64_t v47 = self;
      uint64_t v48 = 0;
      goto LABEL_77;
    default:
      return;
  }
}

uint64_t __35__AFMyriadCoordinator__enterState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loseElection];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _enterState:0];
}

- (void)_cancelOverallTimeout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  overallTimeout = self->_overallTimeout;
  if (overallTimeout)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      char v10 = "-[AFMyriadCoordinator _cancelOverallTimeout]";
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s BTLE Coordinator cancelling overall timeout", (uint8_t *)&v9, 0xCu);
      overallTimeout = self->_overallTimeout;
    }
    [(AFWatchdogTimer *)overallTimeout cancelIfNotAlreadyCanceled];
    int v5 = self->_overallTimeout;
    self->_overallTimeout = 0;

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_delegate);
      [v8 myriadCoordinatorOverallTimerCancelled:self];
    }
  }
}

- (void)_setOverallTimeout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_overallTimeout) {
    [(AFMyriadCoordinator *)self _cancelOverallTimeout];
  }
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v10 = "-[AFMyriadCoordinator _setOverallTimeout]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE Coordinator setting overall timeout", buf, 0xCu);
  }
  id v4 = [AFWatchdogTimer alloc];
  myriadWorkQueue = self->_myriadWorkQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AFMyriadCoordinator__setOverallTimeout__block_invoke;
  v8[3] = &unk_1E592C678;
  v8[4] = self;
  id v6 = [(AFWatchdogTimer *)v4 initWithTimeoutInterval:myriadWorkQueue onQueue:v8 timeoutHandler:31.0];
  overallTimeout = self->_overallTimeout;
  self->_overallTimeout = v6;
}

uint64_t __41__AFMyriadCoordinator__setOverallTimeout__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AFMyriadCoordinator _setOverallTimeout]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE Coordinator hitting overall timeout, resetting to NoActivity and declaring loss", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3[1])
  {
    [v3 _loseElection];
    uint64_t v3 = *(void **)(a1 + 32);
  }
  return [v3 _enterState:0];
}

- (void)_cancelTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  timer = self->_timer;
  if (timer && !dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    dispatch_source_cancel(timer);
    id v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      timerLabel = self->_timerLabel;
      unint64_t myriadState = self->_myriadState;
      uint64_t v7 = v4;
      id v8 = [(AFMyriadCoordinator *)self _stateAsString:myriadState];
      int v9 = 136315650;
      char v10 = "-[AFMyriadCoordinator _cancelTimer]";
      __int16 v11 = 2112;
      id v12 = timerLabel;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s BTLE timer %@ cancelled (%@)", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AFMyriadCoordinator__startTimer_for_thenEnterState___block_invoke;
  v10[3] = &unk_1E5929BD0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  *(float *)&double v9 = a4;
  [(AFMyriadCoordinator *)self _startTimer:v8 for:v10 thenExecute:v9];
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __54__AFMyriadCoordinator__startTimer_for_thenEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enterState:*(void *)(a1 + 40)];
}

- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  id v9 = a5;
  char v10 = AFSiriLogContextConnection;
  double v11 = a4;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v18 = "-[AFMyriadCoordinator _startTimer:for:thenExecute:]";
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    double v22 = v11;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s BTLE starting %@ timer for %f secs", buf, 0x20u);
  }
  timerLabel = self->_timerLabel;
  self->_timerLabel = v8;
  __int16 v13 = v8;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __51__AFMyriadCoordinator__startTimer_for_thenExecute___block_invoke;
  v15[3] = &unk_1E592C6E8;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [(AFMyriadCoordinator *)self _createDispatchTimerFor:v15 toExecute:v11];
}

uint64_t __51__AFMyriadCoordinator__startTimer_for_thenExecute___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 192);
    int v5 = 136315394;
    id v6 = "-[AFMyriadCoordinator _startTimer:for:thenExecute:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE %@ timer fires", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_startListenTimer
{
  LODWORD(v2) = 0.5;
  [(AFMyriadCoordinator *)self _startTimer:@"listen" for:0 thenExecute:v2];
}

- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4
{
  id v6 = a4;
  [a3 timeIntervalSince1970];
  v8.tv_sec = (int)v7;
  v8.tv_nsec = (uint64_t)((v7 - (double)(int)v7) * 1000000000.0);
  [(AFMyriadCoordinator *)self _createDispatchTimerWithTime:dispatch_walltime(&v8, 0) toExecute:v6];
}

- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  int64_t v5 = (uint64_t)(a3 * 1000000000.0);
  id v6 = a4;
  [(AFMyriadCoordinator *)self _createDispatchTimerWithTime:dispatch_time(0, v5) toExecute:v6];
}

- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4
{
  id v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_timer);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  double v7 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_eventToken, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __62__AFMyriadCoordinator__createDispatchTimerWithTime_toExecute___block_invoke;
  v11[3] = &unk_1E592C598;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  char v10 = (void *)MEMORY[0x19F3A50D0](v11);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v10);
  dispatch_resume((dispatch_object_t)self->_timer);
}

void __62__AFMyriadCoordinator__createDispatchTimerWithTime_toExecute___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 208);
    int v6 = 136315650;
    double v7 = "-[AFMyriadCoordinator _createDispatchTimerWithTime:toExecute:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad Event token: %@, current event token: %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(void *)(*(void *)(a1 + 40) + 208) && objc_msgSend(*(id *)(a1 + 32), "isEqual:"))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

- (void)_initializeTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[AFMyriadCoordinator _initializeTimer]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  int v6 = self->_timer;
  self->_timer = v5;

  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_361);
  dispatch_resume((dispatch_object_t)self->_timer);
  eventToken = self->_eventToken;
  self->_eventToken = 0;
}

- (void)_clearMyriadSession
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_myriadSession)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained(p_delegate);
      [v6 willEndSession:self->_myriadSession];
    }
    double v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      myriadSession = self->_myriadSession;
      uint64_t v9 = v7;
      uint64_t v10 = [(AFMyriadSession *)myriadSession sessionId];
      int v13 = 136315394;
      id v14 = "-[AFMyriadCoordinator _clearMyriadSession]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s #myriad Clearing myriad session %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [(AFMyriadSession *)self->_myriadSession electionAdvertisementDataByIds];
    [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_359];

    uint64_t v12 = self->_myriadSession;
    self->_myriadSession = 0;
  }
}

void __42__AFMyriadCoordinator__clearMyriadSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    int v8 = "-[AFMyriadCoordinator _clearMyriadSession]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad Election advertisement %@ -> %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_createMyriadSessionIfRequired
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_myriadSession
    || ((v7 = self->_myriadState, BOOL v8 = v7 > 0x11, v9 = (1 << v7) & 0x2C003, !v8) ? (v10 = v9 == 0) : (v10 = 1), v10))
  {
    uint64_t v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      unint64_t myriadState = self->_myriadState;
      id v5 = v3;
      id v6 = [(AFMyriadCoordinator *)self _stateAsString:myriadState];
      int v21 = 136315394;
      double v22 = "-[AFMyriadCoordinator _createMyriadSessionIfRequired]";
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #myriad not initializing myriad session, myriad is in state %@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    __int16 v11 = +[AFMyriadSession newWithBuilder:&__block_literal_global_352];
    myriadSession = self->_myriadSession;
    self->_myriadSession = v11;

    uint64_t v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v14 = self->_myriadSession;
      __int16 v15 = v13;
      id v16 = [(AFMyriadSession *)v14 sessionId];
      uint64_t v17 = [(AFMyriadCoordinator *)self _stateAsString:self->_myriadState];
      int v21 = 136315650;
      double v22 = "-[AFMyriadCoordinator _createMyriadSessionIfRequired]";
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      long long v26 = v17;
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s #myriad Initialized myriad session %@ when myriad is in state %@", (uint8_t *)&v21, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained(&self->_delegate);
      [v20 willStartWithSession:self->_myriadSession];
    }
    if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
    {
      [(AFArbitrationEventUpdatesDelegate *)self->_arbitrationEventsDelegate arbitrationSessionWillStart:self->_myriadSession];
    }
  }
}

void __53__AFMyriadCoordinator__createMyriadSessionIfRequired__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 UUID];
  [v3 setSessionId:v4];
}

- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [(AFMyriadCoordinator *)self _myriadSession];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__AFMyriadCoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke;
    v18[3] = &unk_1E5929B68;
    v18[4] = self;
    id v7 = v4;
    id v19 = v7;
    id v8 = v5;
    id v20 = v8;
    uint64_t v9 = [v6 mutatedCopyWithMutator:v18];

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained(&self->_delegate);
      [v12 myriadCoordinator:self didAddAdvertisement:v7 toSession:self->_myriadSession];
    }
    p_myriadSession = &self->_myriadSession;
    objc_storeStrong((id *)p_myriadSession, v9);
    id v14 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = *p_myriadSession;
      id v16 = v14;
      uint64_t v17 = [(AFMyriadSession *)v15 sessionId];
      *(_DWORD *)buf = 136315650;
      double v22 = "-[AFMyriadCoordinator _addElectionAdvertisementDataToMyriadSession:]";
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      long long v26 = v17;
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s #myriad Election advertisement %@ added to myriad session %@", buf, 0x20u);
    }
  }
}

void __68__AFMyriadCoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 _myriadSession];
  id v7 = [v5 electionAdvertisementDataByIds];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v7];
  [v6 setObject:a1[5] forKey:a1[6]];
  [v4 setCurrentElectionAdvertisementId:a1[6]];
  [v4 setCurrentElectionAdvertisementData:a1[5]];
  [v4 setElectionAdvertisementDataByIds:v6];
}

- (id)_myriadSession
{
  return self->_myriadSession;
}

- (void)_loseElection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    id v16 = "-[AFMyriadCoordinator _loseElection]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad loss", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (id v5 = WeakRetained,
        id v6 = objc_loadWeakRetained(&self->_delegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
        id v8 = [(AFMyriadCoordinator *)self _endAdvertisingAnalyticsContext:0];
      }
    }
    else
    {
      id v12 = +[AFAnalytics sharedAnalytics];
      uint64_t v13 = [(AFMyriadCoordinator *)self _endAdvertisingAnalyticsContext:0];
      [v12 logEventWithType:2006 context:v13];
    }
    id v14 = objc_loadWeakRetained(&self->_delegate);
    [v14 shouldAbortAnotherDeviceBetter:self];

    self->_int nTimesExtended = 0;
  }
  else
  {
    uint64_t v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = v9;
      id v11 = objc_loadWeakRetained(&self->_delegate);
      int v15 = 136315394;
      id v16 = "-[AFMyriadCoordinator _loseElection]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s BTLE unable to cancel against: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  kdebug_trace();
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    [(AFMyriadCoordinator *)self _updateArbitrationParticipationContextWithCompletion:&__block_literal_global_32870];
  }
  [(AFNotifyStatePublisher *)self->_electionLossPublisher publishState:[(AFMyriadCoordinator *)self _nextElectionPublisherState]];
  [(AFMyriadGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:0.0];
  self->_lastDecision = 0;
  self->_inTask = 0;
  self->_ignoreInTaskTimer = 0;
}

- (void)_winElection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    id v16 = "-[AFMyriadCoordinator _winElection]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad won", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_delegate);
      [v8 shouldContinue:self];
    }
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
      id v9 = [(AFMyriadCoordinator *)self _endAdvertisingAnalyticsContext:1];
    }
  }
  else
  {
    BOOL v10 = +[AFAnalytics sharedAnalytics];
    id v11 = [(AFMyriadCoordinator *)self _endAdvertisingAnalyticsContext:1];
    [v10 logEventWithType:2006 context:v11];
  }
  self->_clientIsListeningAfterRecentWin = 1;
  kdebug_trace();
  id v12 = [MEMORY[0x1E4F28F80] processInfo];
  [v12 systemUptime];
  double v14 = v13;

  [(AFMyriadGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:v14];
  self->_lastDecision = 1;
}

- (BOOL)_deviceShouldContinue:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    int v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v20, 0xCu);
  }
  if (self->_coordinationEnabled)
  {
    if (self->_clientIsInEarActivation && [(AFMyriadRecord *)self->_triggerRecord isATrump]) {
      int v6 = ![(AFMyriadRecord *)self->_triggerRecord isInEarTrump];
    }
    else {
      int v6 = 0;
    }
    BOOL suppressLateTrigger = self->_suppressLateTrigger;
    BOOL v8 = [(AFMyriadCoordinator *)self _shouldContinueFor:v4];
    BOOL clientIsDirectActivating = self->_clientIsDirectActivating;
    if (self->_clientIsDirectActivating) {
      int v10 = 1;
    }
    else {
      int v10 = v6;
    }
    unsigned int v11 = v10 | v8;
    if (suppressLateTrigger) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      BOOL clientIsInEarActivation = self->_clientIsInEarActivation;
      int v20 = 136316418;
      int v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2048;
      BOOL v27 = clientIsDirectActivating;
      __int16 v28 = 2048;
      BOOL v29 = clientIsInEarActivation;
      __int16 v30 = 2048;
      BOOL v31 = suppressLateTrigger;
      int v15 = "%s BTLE deviceShouldContinue:%ld (coordinationDisabled:%ld, isDirectlyActivating:%ld, isInEarTrigger:%ld, su"
            "ppressLateTrigger:%ld.";
      id v16 = v13;
      uint32_t v17 = 62;
LABEL_18:
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, v17);
    }
  }
  else
  {
    uint64_t v18 = AFSiriLogContextConnection;
    LOBYTE(v12) = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      int v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
      int v15 = "%s Coordination disabled, continuing with the request)";
      LOBYTE(v12) = 1;
      id v16 = v18;
      uint32_t v17 = 12;
      goto LABEL_18;
    }
  }

  return v12;
}

- (void)_forceLocalWinner:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__AFMyriadCoordinator__forceLocalWinner___block_invoke;
  v7[3] = &unk_1E592C710;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __41__AFMyriadCoordinator__forceLocalWinner___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 240);
    int v15 = 136315650;
    id v16 = "-[AFMyriadCoordinator _forceLocalWinner:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad force win on this device with context: %@, triggerRecord: %@", (uint8_t *)&v15, 0x20u);
  }
  [*(id *)(a1 + 40) _winElection];
  *(unsigned char *)(*(void *)(a1 + 40) + 330) = 0;
  [*(id *)(a1 + 40) _setMyriadContext:*(void *)(a1 + 32)];
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = (void *)v5[76];
    uint64_t v7 = [v5 _myriadStateForSelf:v5[1]];
    id v8 = [*(id *)(*(void *)(a1 + 40) + 512) sessionId];
    [v6 logCDADeviceStateActivityStartedOrChanged:v7 withTrigger:5 withCdaId:v8 withTimestamp:mach_absolute_time()];

    [*(id *)(*(void *)(a1 + 40) + 608) updateIsTrump:1 withReason:5];
  }
  id v9 = *(id **)(a1 + 40);
  id v10 = v9[30];
  if (v10)
  {
    objc_msgSend(v10, "setRawAudioGoodnessScore:withBump:", objc_msgSend(v9[30], "rawAudioGoodnessScore"), 255);
  }
  else
  {
    uint64_t v11 = [v9 directTriggerRecord];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 240);
    *(void *)(v12 + 240) = v11;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 320) = 0;
  *(void *)(*(void *)(a1 + 40) + 248) = 3;
  return [*(id *)(a1 + 40) _enterState:14];
}

- (void)faceDetectedBoostWithMyriadContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AFMyriadCoordinator_faceDetectedBoostWithMyriadContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __58__AFMyriadCoordinator_faceDetectedBoostWithMyriadContext___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 418) = 1;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "rawAudioGoodnessScore"), 255);
  [*(id *)(*(void *)(a1 + 32) + 240) generateTiebreaker];
  double v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 240);
    id v5 = v2;
    LODWORD(v4) = [v4 rawAudioGoodnessScore];
    int v6 = [*(id *)(*(void *)(a1 + 32) + 240) goodness];
    int v7 = [*(id *)(*(void *)(a1 + 32) + 240) bump];
    int v8 = [*(id *)(*(void *)(a1 + 32) + 240) tieBreaker];
    id v9 = [*(id *)(a1 + 32) _stateAsString:*(void *)(*(void *)(a1 + 32) + 8)];
    int v10 = 136316418;
    uint64_t v11 = "-[AFMyriadCoordinator faceDetectedBoostWithMyriadContext:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s #myriad attention is boosting goodness score, rawAudioGoodnessScore %u, goodness:%u bump: %u, tieBreaker:%u, _myriadState: %@", (uint8_t *)&v10, 0x2Eu);
  }
  [*(id *)(a1 + 32) _forceLocalWinner:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:8];
}

- (void)setCurrentRequestId:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AFMyriadCoordinator_setCurrentRequestId___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __43__AFMyriadCoordinator_setCurrentRequestId___block_invoke(uint64_t a1)
{
}

- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (!myriadInstrumentation)
  {
    id v8 = objc_alloc_init(AFMyriadInstrumentation);
    id v9 = self->_myriadInstrumentation;
    self->_myriadInstrumentation = v8;

    myriadInstrumentation = self->_myriadInstrumentation;
  }
  [(AFMyriadInstrumentation *)myriadInstrumentation updateBoost:v5 value:v4];
}

- (void)requestWillPresentUsefulUserResult
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    uint64_t v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[AFMyriadCoordinator requestWillPresentUsefulUserResult]";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__AFMyriadCoordinator_requestWillPresentUsefulUserResult__block_invoke;
    v4[3] = &unk_1E592C678;
    v4[4] = self;
    [(AFMyriadCoordinator *)self _updateArbitrationParticipationContextWithCompletion:v4];
  }
}

uint64_t __57__AFMyriadCoordinator_requestWillPresentUsefulUserResult__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) requestWillPresentUsefulUserResult:*(void *)(*(void *)(a1 + 32) + 512)];
}

- (void)setupEnabled:(BOOL)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__AFMyriadCoordinator_setupEnabled___block_invoke;
  v4[3] = &unk_1E592AEA0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

void __36__AFMyriadCoordinator_setupEnabled___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 32);
    BOOL v5 = v2;
    id v6 = [v4 _stateAsString];
    int v8 = 136315650;
    id v9 = "-[AFMyriadCoordinator setupEnabled:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v3;
    __int16 v12 = 2112;
    int v13 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #myriad setupEnabled: %d, current state: %@", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(v7 + 318) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 314) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 318) = [*(id *)(v7 + 576) coordinationEnabled];
    *(unsigned char *)(*(void *)(a1 + 32) + 314) = 0;
    [*(id *)(a1 + 32) _enterState:0];
  }
}

- (void)setInTask:(BOOL)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__AFMyriadCoordinator_setInTask___block_invoke;
  v4[3] = &unk_1E592AEA0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

void __33__AFMyriadCoordinator_setInTask___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v4 = 136315394;
    BOOL v5 = "-[AFMyriadCoordinator setInTask:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s inTask=%d", (uint8_t *)&v4, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = *(unsigned char *)(a1 + 40);
}

- (BOOL)inTask
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  myriadWorkQueue = self->_myriadWorkQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__AFMyriadCoordinator_inTask__block_invoke;
  v5[3] = &unk_1E592C6C0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadWorkQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__AFMyriadCoordinator_inTask__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 313);
  return result;
}

- (void)endTask
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AFMyriadCoordinator_endTask__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __30__AFMyriadCoordinator_endTask__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[AFMyriadCoordinator endTask]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 418) = 0;
  [*(id *)(*(void *)(a1 + 32) + 224) releaseAllPowerAssertions];
  uint64_t result = +[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled];
  if (result)
  {
    int v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__AFMyriadCoordinator_endTask__block_invoke_342;
    v5[3] = &unk_1E592C678;
    void v5[4] = v4;
    return [v4 _updateArbitrationParticipationContextWithCompletion:v5];
  }
  return result;
}

uint64_t __30__AFMyriadCoordinator_endTask__block_invoke_342(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) arbitrationEndedTask:*(void *)(*(void *)(a1 + 32) + 512)];
}

- (void)endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFMyriadCoordinator_endAdvertisingWithDeviceProhibitions___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __60__AFMyriadCoordinator_endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAdvertisingWithDeviceProhibitions:*(void *)(a1 + 40)];
}

- (void)_endAdvertisingWithDeviceProhibitions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_coordinationEnabled)
  {
    BOOL v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v16 = "-[AFMyriadCoordinator _endAdvertisingWithDeviceProhibitions:]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s BTLE advertising is being ignored", buf, 0xCu);
    }
  }
  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord
    && (int v7 = [(AFMyriadRecord *)maxSlowdownRecord slowdownDelay]) != 0
    && self->_clientIsRespondingToSlowdown
    && !self->_clientDoneRespondingToSlowdown)
  {
    self->_int slowdownMsecs = v7;
    int v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "-[AFMyriadCoordinator _endAdvertisingWithDeviceProhibitions:]";
      __int16 v17 = 1024;
      int v18 = v7;
      _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s BTLE detected a slowdown signal for %d msecs, resetting election for later time", buf, 0x12u);
    }
    [(AFMyriadCoordinator *)self _advertiseTrigger];
  }
  else
  {
    self->_BOOL clientIsDeciding = 1;
    if ([(AFMyriadCoordinator *)self _deviceShouldContinue:v4])
    {
      if ((unint64_t)[(NSMutableDictionary *)self->_replies count] >= 2) {
        [(AFPowerAssertionManager *)self->_powerAssertionManager takePowerAssertionWithName:0];
      }
      [(AFMyriadCoordinator *)self _winElection];
      [(AFNotifyStatePublisher *)self->_electionWinPublisher publishState:[(AFMyriadCoordinator *)self _nextElectionPublisherState]];
      id v8 = @"listening late";
      float v9 = 0.0;
      uint64_t v10 = 2;
    }
    else
    {
      [(AFMyriadCoordinator *)self _loseElection];
      id v8 = @"wait until after suppress";
      float v9 = 1.0;
      uint64_t v10 = 7;
    }
    uint64_t v11 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    self->_lastDecisionTime = (unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11);
    self->_clientDoneRespondingToSlowdown = 0;
    [(AFMyriadCoordinator *)self _cancelOverallTimeout];
    [(AFMyriadCoordinator *)self _endAdvertising:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __61__AFMyriadCoordinator__endAdvertisingWithDeviceProhibitions___block_invoke;
    void v14[3] = &unk_1E592B398;
    v14[4] = self;
    v14[5] = v10;
    [(AFMyriadCoordinator *)self _startTimer:v8 for:v14 thenExecute:COERCE_DOUBLE((unint64_t)LODWORD(v9))];
    [(AFMyriadCoordinator *)self _ageWedgeFilter];
    [(AFMyriadCoordinator *)self resetReplies];
    [(AFMyriadCoordinator *)self _resetAudioData];
    *(_WORD *)&self->_BOOL clientIsDirectActivating = 0;
    __int16 v12 = self->_maxSlowdownRecord;
    self->_maxSlowdownRecord = 0;

    self->_clientIsRespondingToSlowdown = 0;
    self->_BOOL suppressLateTrigger = 0;
    [(AFMyriadCoordinator *)self _resetAdvertisementTimings];
    if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
    {
      [(AFArbitrationEventUpdatesDelegate *)self->_arbitrationEventsDelegate arbitrationEndedAdvertising:self->_myriadSession];
    }
  }
}

uint64_t __61__AFMyriadCoordinator__endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 330) = 0;
  return [*(id *)(a1 + 32) _enterState:*(void *)(a1 + 40)];
}

- (id)_endAdvertisingAnalyticsContext:(BOOL)a3
{
  BOOL v59 = a3;
  v85[2] = *MEMORY[0x1E4F143B8];
  char v60 = [(AFMyriadCoordinator *)self _sortedReplies];
  v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v60, "count"));
  if (v60 && [v60 count])
  {
    uint64_t v61 = [v60 firstObject];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke;
    v77[3] = &unk_1E5929AF0;
    id v78 = v58;
    [v60 enumerateObjectsUsingBlock:v77];
  }
  else
  {
    char v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[AFMyriadCoordinator _endAdvertisingAnalyticsContext:]";
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Myriad decision is based on 0 replies", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v61 = [(AFMyriadCoordinator *)self emptyRecord];
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  if (self->_lastDecision) {
    BOOL v5 = @"YES";
  }
  else {
    BOOL v5 = @"NO";
  }
  v84[1] = @"previous_decision_time";
  v85[0] = v5;
  v84[0] = @"previous_decision";
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_lastDecisionTime);
  v85[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  id v62 = (id)[v4 initWithDictionary:v7];

  [v62 setObject:v58 forKey:@"goodness_scores"];
  if (v59) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  [v62 setObject:v8 forKey:@"decision"];
  float v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v60, "count"));
  [v62 setObject:v9 forKey:@"device_count"];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%hhu", objc_msgSend(v61, "goodness"));
  [v62 setObject:v10 forKey:@"winner_goodness"];

  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord && self->_clientIsRespondingToSlowdown && !self->_clientDoneRespondingToSlowdown)
  {
    __int16 v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[AFMyriadRecord slowdownDelay](maxSlowdownRecord, "slowdownDelay"));
    [v62 setObject:v12 forKey:@"max_slowdown"];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_304;
  v76[3] = &unk_1E5929B18;
  v76[4] = &buf;
  [v60 enumerateObjectsUsingBlock:v76];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    int v13 = @"YES";
  }
  else {
    int v13 = @"NO";
  }
  [v62 setObject:v13 forKey:@"homepod_involved"];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v61, "deviceClass"));
  [v62 setObject:v14 forKey:@"winner_device_class"];

  int v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v61, "productType"));
  [v62 setObject:v15 forKey:@"winner_product_type"];

  if (!v59)
  {
    if ([v61 isATrump]) {
      __int16 v16 = @"YES";
    }
    else {
      __int16 v16 = @"NO";
    }
    [v62 setObject:v16 forKey:@"winner_sent_suppresssion"];
  }
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal
    || (+[AFPreferences sharedPreferences],
        __int16 v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 shouldLogForQA],
        v17,
        v18))
  {
    if (self->_coordinationEnabled) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    [v62 setObject:v19 forKey:@"coordination_allowed"];
    __int16 v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_deviceGroup];
    [v62 setObject:v20 forKey:@"device-group"];

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_2;
    v74[3] = &unk_1E5929B40;
    id v22 = v21;
    id v75 = v22;
    [v60 enumerateObjectsUsingBlock:v74];
    [v62 setObject:v22 forKey:@"election"];
    v56 = v22;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obj = self->_replyCounts;
    uint64_t v24 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v71 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          __int16 v28 = [(NSMutableDictionary *)self->_replyCounts objectForKeyedSubscript:v27];
          v79[0] = v28;
          BOOL v29 = [(NSMutableDictionary *)self->_replies objectForKeyedSubscript:v27];
          __int16 v30 = [v29 description];
          v79[1] = v30;
          BOOL v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
          [v23 setObject:v31 forKey:v27];
        }
        uint64_t v24 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v80 count:16];
      }
      while (v24);
    }

    [v62 setObject:v23 forKey:@"counts"];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4FA0288]);
    objc_msgSend(v32, "setDeviceClass:", objc_msgSend(v61, "deviceClass"));
    objc_msgSend(v32, "setProductType:", objc_msgSend(v61, "productType"));
    objc_msgSend(v32, "setGoodnessScore:", objc_msgSend(v61, "goodness"));
    id v33 = objc_alloc_init(MEMORY[0x1E4FA0288]);
    uint64_t v34 = v33;
    if (v59)
    {
      int v35 = [v61 rawAudioGoodnessScore];
      id v36 = v32;

      uint64_t v34 = v36;
    }
    else
    {
      [v33 setDeviceClass:self->_deviceClass];
      [v34 setProductType:self->_productType];
      objc_msgSend(v34, "setGoodnessScore:", -[AFMyriadRecord goodness](self->_triggerRecord, "goodness"));
      int v35 = 0;
    }
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_3;
    v68[3] = &unk_1E5929AF0;
    id v57 = v37;
    id v69 = v57;
    [v60 enumerateObjectsUsingBlock:v68];
    uint64_t v38 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    double v39 = *(double *)&_AFMachAbsoluteTimeRate_rate;
    unint64_t lastDecisionTime = self->_lastDecisionTime;
    id obja = (id)[(NSUUID *)self->_currentRequestId copy];
    myriadInstrumentation = self->_myriadInstrumentation;
    uint64_t v42 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
    if (v59) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = 2;
    }
    if (self->_lastDecision) {
      uint64_t v44 = 1;
    }
    else {
      uint64_t v44 = 2;
    }
    unint64_t v45 = [(AFMyriadSession *)self->_myriadSession sessionId];
    LODWORD(v55) = v35;
    [(AFMyriadInstrumentation *)myriadInstrumentation logCDAElectionDecisionMade:v42 withDecision:v43 withPreviousDecision:v44 timeSincePreviousDecision:((unint64_t)(v39 * (double)v38) - lastDecisionTime) / 0xF4240 withWinningDevice:v32 withThisDevice:v34 withParticipants:v57 withRawScore:v55 withBoost:0 withCdaId:v45 currentRequestId:obja withTimestamp:mach_absolute_time()];

    currentRequestId = self->_currentRequestId;
    self->_currentRequestId = 0;

    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal)
    {
      uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_4;
      v66[3] = &unk_1E5929AF0;
      id v48 = v47;
      id v67 = v48;
      [v60 enumerateObjectsUsingBlock:v66];
      uint64_t v49 = self->_myriadInstrumentation;
      uint64_t v50 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      BOOL coordinationEnabled = self->_coordinationEnabled;
      uint64_t deviceGroup = self->_deviceGroup;
      int v53 = [(AFMyriadSession *)self->_myriadSession sessionId];
      [(AFMyriadInstrumentation *)v49 logCDAElectionDecisionMadeDebug:v50 withCrossDeviceArbitrationAllowed:coordinationEnabled advertisementData:v48 withDeviceGroup:deviceGroup withCdaId:v53 withTimestamp:mach_absolute_time()];
    }
  }
  _Block_object_dispose(&buf, 8);

  return v62;
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke(uint64_t a1, void *a2)
{
  void v14[3] = *MEMORY[0x1E4F143B8];
  char v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = [v3 alloc];
  v13[0] = @"dc";
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "deviceClass"));
  v14[0] = v6;
  v13[1] = @"pt";
  int v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "productType"));
  v14[1] = v7;
  void v13[2] = @"goodness";
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  unsigned int v9 = [v4 goodness];

  uint64_t v10 = [v8 numberWithInteger:v9];
  id v14[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  __int16 v12 = (void *)[v5 initWithDictionary:v11];

  [*(id *)(a1 + 32) addObject:v12];
}

uint64_t __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_304(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 deviceClass];
  if (result == 7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_3(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  int v7 = (objc_class *)MEMORY[0x1E4FA0288];
  id v8 = a2;
  id v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setDeviceClass:", objc_msgSend(v8, "deviceClass"));
  objc_msgSend(v10, "setProductType:", objc_msgSend(v8, "productType"));
  uint64_t v9 = [v8 goodness];

  [v10 setGoodnessScore:v9];
  [*(id *)(a1 + 32) addObject:v10];
  if (a3 >= 9) {
    *a4 = 1;
  }
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_4(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  int v7 = (objc_class *)MEMORY[0x1E4FA0210];
  id v8 = a2;
  id v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setAudioHash:", objc_msgSend(v8, "pHash"));
  objc_msgSend(v10, "setGoodnessScore:", objc_msgSend(v8, "goodness"));
  objc_msgSend(v10, "setConfidenceScore:", objc_msgSend(v8, "userConfidence"));
  objc_msgSend(v10, "setDeviceClass:", objc_msgSend(v8, "deviceClass"));
  objc_msgSend(v10, "setDeviceGroup:", objc_msgSend(v8, "deviceGroup"));
  objc_msgSend(v10, "setProductType:", objc_msgSend(v8, "productType"));
  objc_msgSend(v10, "setTieBreaker:", objc_msgSend(v8, "tieBreaker"));
  objc_msgSend(v10, "setIsFromContextCollector:", objc_msgSend(v8, "isCollectedFromContextCollector") != 0);
  uint64_t v9 = [v8 isMe];

  [v10 setIsSelf:v9];
  [*(id *)(a1 + 32) addObject:v10];
  if (a3 >= 9) {
    *a4 = 1;
  }
}

- (void)endAdvertising:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator_endAdvertising___block_invoke;
  v7[3] = &unk_1E592C6E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __38__AFMyriadCoordinator_endAdvertising___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAdvertising:*(void *)(a1 + 40)];
}

- (void)_endAdvertising:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v17 = "-[AFMyriadCoordinator _endAdvertising:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      id v6 = +[AFAnalytics sharedAnalytics];
      __int16 v20 = @"state";
      int v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_myriadState);
      v21[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v6 logEventWithType:2004 context:v8];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v10 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      uint64_t v11 = [(AFMyriadSession *)self->_myriadSession sessionId];
      [(AFMyriadInstrumentation *)myriadInstrumentation logCDAElectionAdvertisingEnding:v10 withCdaId:v11 withTimestamp:mach_absolute_time()];
    }
  }
  [(AFMyriadCoordinator *)self _stopAdvertising:v4];
  if (self->_clientIsDirectActivating || self->_clientIsWatchActivation)
  {
    __int16 v12 = [MEMORY[0x1E4F28F80] processInfo];
    [v12 systemUptime];
    double v14 = v13;

    [(AFMyriadGoodnessScoreEvaluator *)self->_goodnessScoreEvaluator setLastActivationTime:v14];
    int v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[AFMyriadCoordinator _endAdvertising:]";
      __int16 v18 = 2048;
      double v19 = v14;
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s BTLE activation time %f", buf, 0x16u);
    }
  }
}

- (void)endAdvertisingAfterDelay:(float)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke;
  v4[3] = &unk_1E5929AC8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke_2;
  v4[3] = &unk_1E5929AC8;
  int v5 = v2;
  v4[4] = v1;
  return objc_msgSend(v1, "_startTimer:for:thenExecute:", @"end advert delay", v4);
}

uint64_t __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    double v3 = *(float *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[AFMyriadCoordinator endAdvertisingAfterDelay:]_block_invoke_2";
    __int16 v7 = 2048;
    double v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending advertising after %f secs delay", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 32) enterState:0];
}

- (void)startAdvertisingSlowdown:(unsigned __int16)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_startAdvertisingSlowdown___block_invoke;
  v4[3] = &unk_1E5929AA0;
  unsigned __int16 v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

uint64_t __48__AFMyriadCoordinator_startAdvertisingSlowdown___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int16 *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[AFMyriadCoordinator startAdvertisingSlowdown:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown: %d msecs", (uint8_t *)&v5, 0x12u);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  *(_DWORD *)(*(void *)(a1 + 32) + 296) = *(unsigned __int16 *)(a1 + 40);
  *(unsigned char *)(*(void *)(a1 + 32) + 327) = 1;
  return [*(id *)(a1 + 32) _enterState:16];
}

- (void)startResponseAdvertising:(unsigned __int16)a3
{
  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_startResponseAdvertising___block_invoke;
  v4[3] = &unk_1E5929AA0;
  v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

void __48__AFMyriadCoordinator_startResponseAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AFMyriadCoordinator startResponseAdvertising:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing stragglers", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  int v3 = [*(id *)(a1 + 32) responseObject:*(unsigned __int16 *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 324) = 0;
  LODWORD(v4) = 1.0;
  [*(id *)(a1 + 32) _startAdvertising:v3 afterDelay:0.0 maxInterval:v4];
}

- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__AFMyriadCoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __78__AFMyriadCoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v17 = "-[AFMyriadCoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE voice trigger during alert heard", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v14[0] = @"state";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v14[1] = @"trigger";
    v15[0] = v4;
    v15[1] = @"AlertFiringVoiceTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:8 withCdaId:v9 withTimestamp:mach_absolute_time()];

    [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:2];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromAlertFiringVoiceTrigger
{
}

- (void)startAdvertisingFromInTaskVoiceTrigger
{
}

- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = [v4 debugDescription];
    *(_DWORD *)long long buf = 136315394;
    double v13 = "-[AFMyriadCoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:]";
    __int16 v14 = 2112;
    int v15 = v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s BTLE voice trigger while inTask with context: %@", buf, 0x16u);
  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__AFMyriadCoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke;
  v10[3] = &unk_1E592C710;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(myriadWorkQueue, v10);
}

uint64_t __73__AFMyriadCoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateVoiceTriggerTimeFromFile];
  int v2 = *(void **)(a1 + 32);
  return [v2 _startAdvertisingFromInTaskVoiceTrigger];
}

- (void)_startAdvertisingFromInTaskVoiceTrigger
{
  v23[2] = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    double v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE in-task voice trigger heard", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    id v4 = +[AFAnalytics sharedAnalytics];
    v22[0] = @"state";
    int v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_myriadState);
    v22[1] = @"trigger";
    v23[0] = v5;
    v23[1] = @"InTaskVoiceTrigger";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v4 logEventWithType:2011 context:v6];
  }
  uint64_t v7 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
  }
  if (*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v7 / 1000000000.0
     - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0 > 1.45000005
    && [(AFMyriadCoordinator *)self _inTaskTriggerWasTooSoon])
  {
    uint64_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      double v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s BTLE ignoring in-task voice trigger and continuing with ongoing advertisement.", buf, 0xCu);
    }
  }
  else
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      [(AFMyriadCoordinator *)self _createMyriadSessionIfRequired];
      myriadInstrumentation = self->_myriadInstrumentation;
      uint64_t v10 = [(AFMyriadCoordinator *)self _myriadStateForSelf:self->_myriadState];
      id v11 = [(AFMyriadSession *)self->_myriadSession sessionId];
      [(AFMyriadInstrumentation *)myriadInstrumentation logCDADeviceStateActivityStartedOrChanged:v10 withTrigger:6 withCdaId:v11 withTimestamp:mach_absolute_time()];

      [(AFMyriadInstrumentation *)self->_myriadInstrumentation updateIsTrump:1 withReason:7];
    }
    if (self->_myriadState == 1 && self->_inTask && !self->_clientIsDirectActivating && !self->_clientIsDeciding)
    {
      [(AFMyriadRecord *)self->_triggerRecord generateTiebreaker];
      int v15 = self;
      uint64_t v16 = 1;
    }
    else
    {
      [(AFMyriadCoordinator *)self _initializeTimer];
      __int16 v12 = [(AFMyriadCoordinator *)self directTriggerRecord];
      triggerRecord = self->_triggerRecord;
      self->_triggerRecord = v12;

      self->_BOOL clientIsDirectActivating = 0;
      self->_recordType = 3;
      __int16 v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        unint64_t voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)long long buf = 136315394;
        double v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
        __int16 v20 = 2048;
        unint64_t v21 = voiceTriggerTime;
        _os_log_debug_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_DEBUG, "%s #myriad _voiceTriggerTime: %llu", buf, 0x16u);
      }
      int v15 = self;
      uint64_t v16 = 14;
    }
    [(AFMyriadCoordinator *)v15 _enterState:v16];
  }
}

- (void)startAdvertisingEmergency
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AFMyriadCoordinator_startAdvertisingEmergency__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __48__AFMyriadCoordinator_startAdvertisingEmergency__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[AFMyriadCoordinator startAdvertisingEmergency]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE sending emergency beacon", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v13[0] = @"state";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v13[1] = @"trigger";
    v14[0] = v4;
    v14[1] = @"Emergency";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:7 withCdaId:v9 withTimestamp:mach_absolute_time()];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 416) = 1;
  uint64_t v10 = [MEMORY[0x1E4F28F80] processInfo];
  [v10 systemUptime];
  *(void *)(*(void *)(a1 + 32) + 408) = v11;

  return [*(id *)(a1 + 32) _duringNextWindowEnterState:8];
}

- (void)startAdvertisingEmergencyHandled
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFMyriadCoordinator_startAdvertisingEmergencyHandled__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __55__AFMyriadCoordinator_startAdvertisingEmergencyHandled__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadCoordinator startAdvertisingEmergencyHandled]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE handling emergency beacon", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(a1 + 32) _initializeTimer];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 1;
  return [*(id *)(a1 + 32) _enterState:9];
}

- (void)startAdvertisingFromCarPlayTrigger
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AFMyriadCoordinator_startAdvertisingFromCarPlayTrigger__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __57__AFMyriadCoordinator_startAdvertisingFromCarPlayTrigger__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v18 = "-[AFMyriadCoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in CarPlay trigger", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v15[0] = @"state";
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v15[1] = @"trigger";
    v16[0] = v4;
    v16[1] = @"CarPlayTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:4 withCdaId:v9 withTimestamp:mach_absolute_time()];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:0 withBump:244];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 329) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 1;
  double v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v18 = "-[AFMyriadCoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s #myriad CarPlay override", buf, 0xCu);
  }
  return [*(id *)(a1 + 32) _forceLocalWinner:0];
}

- (void)startAdvertisingFromInEarTrigger
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFMyriadCoordinator_startAdvertisingFromInEarTrigger__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __55__AFMyriadCoordinator_startAdvertisingFromInEarTrigger__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v18 = "-[AFMyriadCoordinator startAdvertisingFromInEarTrigger]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in ear voice trigger", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v15[0] = @"state";
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v15[1] = @"trigger";
    v16[0] = v4;
    v16[1] = @"InEarTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:3 withCdaId:v9 withTimestamp:mach_absolute_time()];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  uint64_t v13 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v13 + 313))
  {
    [*(id *)(v13 + 240) setRawAudioGoodnessScore:0 withBump:248];
    uint64_t v13 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v13 + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 321) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 6;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__AFMyriadCoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __70__AFMyriadCoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[AFMyriadCoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing trigger in audio output", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v14[0] = @"state";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v14[1] = @"trigger";
    v15[0] = v4;
    v15[1] = @"OutgoingTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:5 withCdaId:v9 withTimestamp:mach_absolute_time()];

    [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:5];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:14];
}

- (void)startAdvertisingFromOutgoingTrigger
{
}

- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__AFMyriadCoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __68__AFMyriadCoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[AFMyriadCoordinator startAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v14[0] = @"state";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v14[1] = @"trigger";
    v15[0] = v4;
    v15[1] = @"DirectTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:1 withCdaId:v9 withTimestamp:mach_absolute_time()];

    [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:6];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startAdvertisingFromDirectTrigger
{
}

- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__AFMyriadCoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

uint64_t __73__AFMyriadCoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[AFMyriadCoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    int v3 = +[AFAnalytics sharedAnalytics];
    v14[0] = @"state";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
    v14[1] = @"trigger";
    v15[0] = v4;
    v15[1] = @"DirectTrigger";
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v3 logEventWithType:2011 context:v5];
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[76];
    uint64_t v8 = [v6 _myriadStateForSelf:v6[1]];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v7 logCDADeviceStateActivityStartedOrChanged:v8 withTrigger:1 withCdaId:v9 withTimestamp:mach_absolute_time()];

    [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:6];
  }
  [*(id *)(a1 + 32) _initializeTimer];
  uint64_t v10 = [*(id *)(a1 + 32) directTriggerRecord];
  uint64_t v11 = *(void *)(a1 + 32);
  __int16 v12 = *(void **)(v11 + 240);
  *(void *)(v11 + 240) = v10;

  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 325) = 1;
  *(void *)(*(void *)(a1 + 32) + 248) = 3;
  return [*(id *)(a1 + 32) _enterState:1];
}

- (void)startWatchAdvertisingFromDirectTrigger
{
}

- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__AFMyriadCoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __72__AFMyriadCoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  int v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) _inTaskTriggerWasTooSoon])
  {
    int v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE ignoring watch voice trigger and continuing with ongoing advertisement.", buf, 0xCu);
    }
    return;
  }
  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4[313])
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      id v9 = +[AFAnalytics sharedAnalytics];
      v35[0] = @"state";
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
      v35[1] = @"trigger";
      v36[0] = v10;
      v36[1] = @"VoiceTrigger";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
      [v9 logEventWithType:2011 context:v11];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
      __int16 v12 = *(void **)(a1 + 32);
      uint64_t v13 = (void *)v12[76];
      uint64_t v14 = [v12 _myriadStateForSelf:v12[1]];
      int v15 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
      [v13 logCDADeviceStateActivityStartedOrChanged:v14 withTrigger:2 withCdaId:v15 withTimestamp:mach_absolute_time()];
    }
    [*(id *)(a1 + 32) _initializeTimer];
    uint64_t v16 = [*(id *)(a1 + 32) voiceTriggerRecord];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 240);
    *(void *)(v17 + 240) = v16;

    uint64_t v19 = objc_alloc_init(AFMyriadGoodnessScoreContext);
    __int16 v20 = *(void **)(*(void *)(a1 + 32) + 624);
    if (v20)
    {
      [v20 timeIntervalSinceNow];
      if (v21 > -180.0) {
        [(AFMyriadGoodnessScoreContext *)v19 setRecentlyWonBySmallAmount:1];
      }
    }
    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 504) getMyriadAdjustedBoostForGoodnessScoreContext:v19];
    uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 240) rawAudioGoodnessScore];
    [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:v23 withBump:v22];
    *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
    if ((v23 - 25) > 0xE7u) {
      goto LABEL_26;
    }
    uint64_t v24 = AFSiriLogContextConnection;
    BOOL v25 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)long long buf = 136315650;
        __int16 v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
        __int16 v31 = 1024;
        int v32 = v23;
        __int16 v33 = 1024;
        int v34 = 25;
        __int16 v26 = "%s #myriad watch trumping due to threshold for rawAudioGoodnessScore: %u >= %u";
        uint64_t v27 = v24;
        uint32_t v28 = 24;
LABEL_22:
        _os_log_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      __int16 v26 = "%s #myriad watch trumping due to score being 0";
      uint64_t v27 = v24;
      uint32_t v28 = 12;
      goto LABEL_22;
    }
    [*(id *)(*(void *)(a1 + 32) + 240) setPHash:0xFFFFLL];
    [*(id *)(*(void *)(a1 + 32) + 240) setRawAudioGoodnessScore:0 withBump:244];
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
      [*(id *)(*(void *)(a1 + 32) + 608) updateIsTrump:1 withReason:3];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 326) = 1;
LABEL_26:
    *(unsigned char *)(*(void *)(a1 + 32) + 325) = 1;
    *(void *)(*(void *)(a1 + 32) + 248) = 10;
    [*(id *)(a1 + 32) _enterState:1];

    return;
  }
  [v4 _startAdvertisingFromInTaskVoiceTrigger];
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
    int v5 = *(void **)(a1 + 32);
    id v6 = (void *)v5[76];
    uint64_t v7 = [v5 _myriadStateForSelf:v5[1]];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
    [v6 logCDADeviceStateActivityStartedOrChanged:v7 withTrigger:6 withCdaId:v8 withTimestamp:mach_absolute_time()];
  }
}

- (void)startWatchAdvertisingFromVoiceTrigger
{
}

- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke;
  block[3] = &unk_1E592C338;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(myriadWorkQueue, block);
}

void __92__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke(id *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [a1[4] _setMyriadContext:a1[5]];
  int v2 = [a1[6] getOverridingContext];
  int v3 = v2;
  if (v2)
  {
    char v4 = [v2 overriddenAdjustedScore];
  }
  else
  {
    int v5 = (void *)*((void *)a1[4] + 78);
    if (v5)
    {
      [v5 timeIntervalSinceNow];
      if (v6 > -180.0) {
        [a1[6] setRecentlyWonBySmallAmount:1];
      }
    }
    char v4 = [*((id *)a1[4] + 63) getMyriadAdjustedBoostForGoodnessScoreContext:a1[6]];
  }
  *((unsigned char *)a1[4] + 280) = v4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = *((unsigned __int8 *)a1[4] + 280);
    *(_DWORD *)long long buf = 136315650;
    __int16 v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v47 = 2112;
    *(void *)id v48 = v3;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)uint64_t v49 = v8;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s #myriad overrideContext: %@, _incomingAdjustment %d", buf, 0x1Cu);
  }
  id v9 = a1[4];
  id v10 = (void *)v9[36];
  v9[36] = 0;

  uint64_t v11 = [a1[5] overrideState];
  if (v11)
  {
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
      __int16 v47 = 2112;
      *(void *)id v48 = v11;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s #myriad Goodness score override state %@", buf, 0x16u);
    }
    uint64_t v13 = [v11 overrideOption];
    if (v13 == 2)
    {
      [a1[4] startAdvertisingFromInEarTrigger];
    }
    else if (v13 == 1)
    {
      uint64_t v14 = [a1[4] directTriggerRecord];
      int v15 = a1[4];
      uint64_t v16 = (void *)v15[36];
      v15[36] = v14;

      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled]) {
        [*((id *)a1[4] + 76) updateIsTrump:1 withReason:6];
      }
    }
  }
  uint64_t v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = (unsigned __int8 *)a1[4];
    id v19 = a1[5];
    int v20 = v18[313];
    int v21 = v18[314];
    LODWORD(v18) = v18[280];
    id v22 = a1[6];
    *(_DWORD *)long long buf = 136316418;
    __int16 v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v47 = 1024;
    *(_DWORD *)id v48 = v20;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = v21;
    *(_WORD *)uint64_t v49 = 1024;
    *(_DWORD *)&v49[2] = v18;
    __int16 v50 = 2112;
    id v51 = v19;
    __int16 v52 = 2112;
    id v53 = v22;
    _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, incomingAdjustment=%d,  context=%@, goodnessScoreContext=%@", buf, 0x32u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    uint64_t v23 = +[AFAnalytics sharedAnalytics];
    v43[0] = @"state";
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *((void *)a1[4] + 1));
    v43[1] = @"trigger";
    v44[0] = v24;
    v44[1] = @"VoiceTrigger";
    BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v23 logEventWithType:2011 context:v25];
  }
  __int16 v26 = a1[4];
  if (v26[313] || v26[314])
  {
    [v26 _startAdvertisingFromInTaskVoiceTrigger];
    goto LABEL_24;
  }
  if (!v11 || !a1[5]) {
    goto LABEL_40;
  }
  int v35 = [v11 reason];
  char v36 = [v35 isEqualToString:@"CarPlay request"];

  if ((v36 & 1) == 0)
  {
    __int16 v26 = a1[4];
LABEL_40:
    [v26 _startAdvertisingFromVoiceTrigger];
    goto LABEL_24;
  }
  id v37 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    __int16 v47 = 2112;
    *(void *)id v48 = v11;
    _os_log_impl(&dword_19CF1D000, v37, OS_LOG_TYPE_INFO, "%s #myriad CarPlay override %@", buf, 0x16u);
  }
  [a1[4] _initializeTimer];
  uint64_t v38 = [a1[4] voiceTriggerRecord];
  double v39 = a1[4];
  uint64_t v40 = (void *)v39[30];
  v39[30] = v38;

  if (![*((id *)a1[4] + 30) pHash]) {
    [*((id *)a1[4] + 30) setPHash:0xFFFFLL];
  }
  [a1[4] _forceLocalWinner:a1[5]];
LABEL_24:
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    [a1[4] _createMyriadSessionIfRequired];
    uint64_t v27 = a1[4];
    if (*((unsigned char *)v27 + 313) || *((unsigned char *)v27 + 314))
    {
      uint32_t v28 = (void *)v27[76];
      uint64_t v29 = [v27 _myriadStateForSelf:v27[1]];
      __int16 v30 = [*((id *)a1[4] + 64) sessionId];
      uint64_t v31 = mach_absolute_time();
      int v32 = v28;
      uint64_t v33 = v29;
      uint64_t v34 = 6;
    }
    else
    {
      float v41 = (void *)v27[76];
      uint64_t v42 = [v27 _myriadStateForSelf:v27[1]];
      __int16 v30 = [*((id *)a1[4] + 64) sessionId];
      uint64_t v31 = mach_absolute_time();
      int v32 = v41;
      uint64_t v33 = v42;
      uint64_t v34 = 2;
    }
    [v32 logCDADeviceStateActivityStartedOrChanged:v33 withTrigger:v34 withCdaId:v30 withTimestamp:v31];
  }
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4
{
  int v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(AFMyriadGoodnessScoreOverrideContext);
  [(AFMyriadGoodnessScoreOverrideContext *)v7 setOverrideContext:1];
  int v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int deviceAdjust = self->_deviceAdjust;
    int v13 = 136315650;
    uint64_t v14 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
    __int16 v15 = 1024;
    int v16 = deviceAdjust;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s #myriad _deviceAdjust=%d, adjustment= %d", (uint8_t *)&v13, 0x18u);
  }
  if ([v6 activationSource] == 13 && self->_deviceClass == 3)
  {
    id v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v12 = self->_deviceAdjust;
      int v13 = 136315394;
      uint64_t v14 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s #myriad removing negative iPad device boost (adding %d back) due to activationSource", (uint8_t *)&v13, 0x12u);
    }
    LOBYTE(v4) = v4 - LOBYTE(self->_deviceAdjust);
  }
  [(AFMyriadGoodnessScoreOverrideContext *)v7 setOverriddenAdjustedScore:v4];
  id v10 = objc_alloc_init(AFMyriadGoodnessScoreContext);
  [(AFMyriadGoodnessScoreContext *)v10 setOverridingContext:v7];
  [(AFMyriadCoordinator *)self startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:v10 withContext:v6];
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3
{
}

- (void)resetStateMachine
{
}

- (void)_startAdvertisingFromVoiceTrigger
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_inTask || self->_inSetupMode)
  {
    [(AFMyriadCoordinator *)self _startAdvertisingFromInTaskVoiceTrigger];
  }
  else
  {
    [(AFMyriadCoordinator *)self _initializeTimer];
    int v3 = [(AFMyriadCoordinator *)self voiceTriggerRecord];
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v3;

    int v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      deviceClassName = self->_deviceClassName;
      productTypeName = self->_productTypeName;
      int deviceAdjust = self->_deviceAdjust;
      int incomingAdjustment = self->_incomingAdjustment;
      uint64_t v11 = self->_triggerRecord;
      int v12 = v5;
      int v29 = 136316418;
      __int16 v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
      __int16 v31 = 2112;
      double v32 = *(double *)&deviceClassName;
      __int16 v33 = 2112;
      uint64_t v34 = productTypeName;
      __int16 v35 = 1024;
      int v36 = deviceAdjust;
      __int16 v37 = 1024;
      int v38 = incomingAdjustment;
      __int16 v39 = 1024;
      int v40 = [(AFMyriadRecord *)v11 rawAudioGoodnessScore];
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s #myriad BTLE device class: %@ (%@) detected, adjusting goodness by %d incomingAdjustment %d, rawAudioGoodnessScore: %d", (uint8_t *)&v29, 0x32u);
    }
    LODWORD(v6) = 1.0;
    [(AFMyriadRecord *)self->_triggerRecord adjustByMultiplier:self->_deviceAdjust + self->_incomingAdjustment adding:v6];
    int constantGoodness = self->_constantGoodness;
    if ((constantGoodness & 0x80000000) == 0)
    {
      uint64_t v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v29 = 136315394;
        __int16 v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
        __int16 v31 = 1024;
        LODWORD(v32) = constantGoodness;
        _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s #myriad BTLE overriding to constant goodness %d", (uint8_t *)&v29, 0x12u);
        int constantGoodness = self->_constantGoodness;
      }
      [(AFMyriadRecord *)self->_triggerRecord setRawAudioGoodnessScore:0 withBump:constantGoodness];
    }
    if (self->_wasEmergency)
    {
      __int16 v15 = [MEMORY[0x1E4F28F80] processInfo];
      [v15 systemUptime];
      double v17 = v16 - self->_lastEmergencyAttempt;

      if (v17 < 70.0)
      {
        unsigned int v18 = [(AFMyriadRecord *)self->_triggerRecord goodness];
        uint64_t v19 = v18 >= 0xC ? 12 : v18;
        [(AFMyriadRecord *)self->_triggerRecord setRawAudioGoodnessScore:0 withBump:v19];
        int v20 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v21 = self->_triggerRecord;
          id v22 = v20;
          int v23 = [(AFMyriadRecord *)v21 goodness];
          int v29 = 136315650;
          __int16 v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
          __int16 v31 = 2048;
          double v32 = v17;
          __int16 v33 = 1024;
          LODWORD(v34) = v23;
          _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad Downgrading goodness as HS invocation too soon %f for score %d", (uint8_t *)&v29, 0x1Cu);
        }
      }
      self->_lastEmergencyAttempt = 0.0;
      self->_wasEmergency = 0;
    }
    overrideMyriadRecord = self->_overrideMyriadRecord;
    if (overrideMyriadRecord)
    {
      BOOL v25 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v29 = 136315394;
        __int16 v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
        __int16 v31 = 2112;
        double v32 = *(double *)&overrideMyriadRecord;
        _os_log_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_INFO, "%s #myriad BTLE overriding to goodness %@", (uint8_t *)&v29, 0x16u);
        overrideMyriadRecord = self->_overrideMyriadRecord;
      }
      __int16 v26 = overrideMyriadRecord;
      uint64_t v27 = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      uint32_t v28 = self->_triggerRecord;
      self->_triggerRecord = v26;
    }
    self->_BOOL clientIsDirectActivating = 0;
    self->_recordType = 10;
    [(AFMyriadCoordinator *)self _enterState:1];
  }
}

- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E592C710;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __67__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setMyriadContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateVoiceTriggerTimeFromFile];
  int v2 = *(unsigned __int8 **)(a1 + 32);
  if (v2[329])
  {
    v2[329] = 0;
  }
  else
  {
    int v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v4 = v2[313];
      int v5 = v2[314];
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136315906;
      uint64_t v24 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 1024;
      int v28 = v5;
      __int16 v29 = 2112;
      uint64_t v30 = v6;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, context=%@", buf, 0x22u);
    }
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      id v7 = +[AFAnalytics sharedAnalytics];
      v21[0] = @"state";
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(*(void *)(a1 + 32) + 8));
      v21[1] = @"trigger";
      v22[0] = v8;
      v22[1] = @"VoiceTrigger";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v7 logEventWithType:2011 context:v9];
    }
    id v10 = *(unsigned char **)(a1 + 32);
    if (v10[313] || v10[314]) {
      [v10 _startAdvertisingFromInTaskVoiceTrigger];
    }
    else {
      [v10 _startAdvertisingFromVoiceTrigger];
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      [*(id *)(a1 + 32) _createMyriadSessionIfRequired];
      uint64_t v11 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v11 + 313) || *(unsigned char *)(v11 + 314))
      {
        int v12 = *(void **)(v11 + 608);
        uint64_t v13 = [(id)v11 _myriadStateForSelf:*(void *)(v11 + 8)];
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
        uint64_t v15 = mach_absolute_time();
        double v16 = v12;
        uint64_t v17 = v13;
        uint64_t v18 = 6;
      }
      else
      {
        uint64_t v19 = *(void **)(v11 + 608);
        uint64_t v20 = [(id)v11 _myriadStateForSelf:*(void *)(v11 + 8)];
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 512) sessionId];
        uint64_t v15 = mach_absolute_time();
        double v16 = v19;
        uint64_t v17 = v20;
        uint64_t v18 = 2;
      }
      [v16 logCDADeviceStateActivityStartedOrChanged:v17 withTrigger:v18 withCdaId:v14 withTimestamp:v15];
    }
  }
}

- (void)startAdvertisingFromVoiceTrigger
{
}

- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[AFMyriadCoordinator startAdvertisingForPHSSetupAfterDelay:maxInterval:]";
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  id v8 = [(AFMyriadCoordinator *)self _phsSetupRecord];
  id v9 = [v8 asAdvertisementData];
  *(float *)&double v10 = a3;
  *(float *)&double v11 = a4;
  [(AFMyriadCoordinator *)self advertiseWith:v9 afterDelay:v10 maxInterval:v11];
}

- (void)preheatWiProx
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AFMyriadCoordinator_preheatWiProx__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __36__AFMyriadCoordinator_preheatWiProx__block_invoke(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 8))
  {
    uint64_t v2 = result;
    int v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v4 = *(_DWORD *)(v1 + 300);
      int v5 = 136315394;
      uint64_t v6 = "-[AFMyriadCoordinator preheatWiProx]_block_invoke";
      __int16 v7 = 1024;
      int v8 = v4;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Preheat shows slowdown for this device as %d msecs", (uint8_t *)&v5, 0x12u);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    if (*(_DWORD *)(v1 + 300))
    {
      return [(id)v1 startAdvertisingSlowdown:(unsigned __int16)*(_DWORD *)(v1 + 300)];
    }
    else
    {
      [(id)v1 _initializeTimer];
      return [*(id *)(v2 + 32) enterState:15];
    }
  }
  return result;
}

- (void)_updateVoiceTriggerTimeFromFile
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = safelyGetAudioData();
  unint64_t v11 = 0;
  if ((unint64_t)[v3 length] >= 0xC) {
    objc_msgSend(v3, "getBytes:range:", &v11, 4, 8);
  }
  uint64_t v4 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1) {
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
  }
  double v5 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
  uint64_t v6 = AFSiriLogContextConnection;
  double v7 = v5 - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v6;
    double v10 = [v3 debugDescription];
    *(_DWORD *)long long buf = 136315906;
    uint64_t v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
    __int16 v14 = 2112;
    double v15 = *(double *)&v10;
    __int16 v16 = 2048;
    unint64_t v17 = v11;
    __int16 v18 = 2048;
    double v19 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%llu, secondsSinceTrigger=%f", buf, 0x2Au);

    uint64_t v6 = AFSiriLogContextConnection;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v7 <= 2.0)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s #myriad endTime from a file is good, secondsSinceTrigger=%f", buf, 0x16u);
    }
    self->_unint64_t voiceTriggerTime = v11;
  }
  else if (v8)
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
    __int16 v14 = 2048;
    double v15 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s #myriad endTime from a file is too old, secondsSinceTrigger=%f", buf, 0x16u);
  }
}

- (void)_setMyriadContext:(id)a3
{
  uint64_t v4 = (AFMyriadContext *)[a3 copy];
  currentMyriadContext = self->_currentMyriadContext;
  self->_currentMyriadContext = v4;
}

- (void)_initDeviceClassAndAdjustments
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  self->_productType = 0;
  int v3 = (NSString *)MGCopyAnswer();
  productTypeName = self->_productTypeName;
  self->_productTypeName = v3;

  double v5 = (NSString *)MGCopyAnswer();
  deviceClassName = self->_deviceClassName;
  self->_deviceClassName = v5;

  *(_OWORD *)&self->_double deviceDelay = xmmword_19D0E2500;
  *(_OWORD *)&self->_double deviceInEarDelay = xmmword_19D0E2510;
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPhone"])
  {
    self->_uint64_t deviceAdjust = 0;
    unsigned __int8 v7 = 2;
LABEL_8:
    self->_uint64_t deviceClass = v7;
    goto LABEL_9;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPod"])
  {
    self->_uint64_t deviceAdjust = 0;
LABEL_7:
    unsigned __int8 v7 = 3;
    goto LABEL_8;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"iPad"])
  {
    self->_uint64_t deviceAdjust = -4;
    goto LABEL_7;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"AppleTV"])
  {
    self->_uint64_t deviceAdjust = 0;
    unsigned __int8 v18 = 4;
LABEL_18:
    self->_uint64_t deviceClass = v18;
    self->_double deviceTrumpDelay = 0.75;
    goto LABEL_9;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"Watch"])
  {
    self->_uint64_t deviceAdjust = 10;
    double v19 = (void *)MGCopyAnswer();
    if (([v19 isEqualToString:@"watch1,1"] & 1) == 0)
    {
      uint64_t v20 = AFProductType();
      [v20 isEqualToString:@"watch1,2"];
    }
    unsigned __int8 v18 = 6;
    goto LABEL_18;
  }
  if ([(NSString *)self->_deviceClassName isEqualToString:@"AudioAccessory"])
  {
    self->_uint64_t deviceAdjust = 0;
    self->_uint64_t deviceClass = 7;
    uint64_t v21 = MGGetProductType();
    if (v21 > 3348380075)
    {
      if (v21 != 3348380076)
      {
        if (v21 == 4240173202)
        {
          unsigned __int8 v22 = 1;
          goto LABEL_29;
        }
LABEL_34:
        self->_productType = 0;
        goto LABEL_35;
      }
      unsigned __int8 v24 = 3;
    }
    else
    {
      if (v21 != 1540760353)
      {
        if (v21 == 2702125347)
        {
          unsigned __int8 v22 = 2;
LABEL_29:
          self->_productType = v22;
LABEL_35:
          self->_uint64_t deviceAdjust = 0;
          goto LABEL_9;
        }
        goto LABEL_34;
      }
      unsigned __int8 v24 = 5;
    }
    self->_productType = v24;
    self->_uint64_t deviceAdjust = -2;
    goto LABEL_9;
  }
  BOOL v23 = [(NSString *)self->_deviceClassName isEqualToString:@"Bridge"];
  self->_uint64_t deviceAdjust = 0;
  if (v23)
  {
    unsigned __int8 v7 = 8;
    goto LABEL_8;
  }
  self->_uint64_t deviceClass = 0;
LABEL_9:
  self->_double deviceVTEndtimeDistanceThreshold = 0.5;
  [(AFMyriadCoordinator *)self _readDefaults];
  BOOL v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = self->_deviceClassName;
    double v10 = self->_productTypeName;
    uint64_t deviceClass = self->_deviceClass;
    uint64_t deviceAdjust = self->_deviceAdjust;
    double deviceDelay = self->_deviceDelay;
    double deviceTrumpDelay = self->_deviceTrumpDelay;
    double deviceInEarDelay = self->_deviceInEarDelay;
    double deviceInEarInterval = self->_deviceInEarInterval;
    double deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    int v25 = 136317442;
    int v26 = "-[AFMyriadCoordinator _initDeviceClassAndAdjustments]";
    __int16 v27 = 2112;
    int v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    __int16 v31 = 2048;
    uint64_t v32 = deviceClass;
    __int16 v33 = 2048;
    uint64_t v34 = deviceAdjust;
    __int16 v35 = 2048;
    double v36 = deviceDelay;
    __int16 v37 = 2048;
    double v38 = deviceTrumpDelay;
    __int16 v39 = 2048;
    double v40 = deviceInEarDelay;
    __int16 v41 = 2048;
    double v42 = deviceInEarInterval;
    __int16 v43 = 2048;
    double v44 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, in_ear delay %f interval %f vt_endtime threshold %f", (uint8_t *)&v25, 0x66u);
  }
}

- (void)_readDefaults
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    double v19 = "-[AFMyriadCoordinator _readDefaults]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad reading defaults", (uint8_t *)&v18, 0xCu);
  }
  self->_BOOL coordinationEnabled = [(AFMyriadPreferences *)self->_preferences coordinationEnabled];
  self->_BOOL BLEActivityEnabled = [(AFMyriadPreferences *)self->_preferences BLEActivityEnabled];
  self->_int constantGoodness = [(AFMyriadPreferences *)self->_preferences constantGoodnessScore];
  self->_uint64_t deviceGroup = [(AFMyriadPreferences *)self->_preferences deviceGroup];
  [(AFMyriadPreferences *)self->_preferences deviceSlowDown];
  self->_int testInducedSlowdownMsecs = (int)(v4 * 1000.0);
  if ([(AFMyriadPreferences *)self->_preferences myriadServerHasProvisioned])
  {
    double v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      double v19 = "-[AFMyriadCoordinator _readDefaults]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #myriad reading server provisioned defaults", (uint8_t *)&v18, 0xCu);
    }
    if ([(AFMyriadPreferences *)self->_preferences deviceClass]) {
      self->_uint64_t deviceClass = [(AFMyriadPreferences *)self->_preferences deviceClass];
    }
    [(AFMyriadPreferences *)self->_preferences deviceAdjust];
    self->_uint64_t deviceAdjust = (int)v6;
    [(AFMyriadPreferences *)self->_preferences deviceDelay];
    self->_double deviceDelay = v7;
    [(AFMyriadPreferences *)self->_preferences deviceTrumpDelay];
    self->_double deviceTrumpDelay = v8;
    [(AFMyriadPreferences *)self->_preferences voiceTriggerEndtimeDelayThreshold];
    self->_double deviceVTEndtimeDistanceThreshold = v9;
  }
  double v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    deviceClassName = self->_deviceClassName;
    productTypeName = self->_productTypeName;
    uint64_t deviceClass = self->_deviceClass;
    uint64_t deviceAdjust = self->_deviceAdjust;
    double deviceDelay = self->_deviceDelay;
    double deviceTrumpDelay = self->_deviceTrumpDelay;
    double deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    int v18 = 136316930;
    double v19 = "-[AFMyriadCoordinator _readDefaults]";
    __int16 v20 = 2112;
    uint64_t v21 = deviceClassName;
    __int16 v22 = 2112;
    BOOL v23 = productTypeName;
    __int16 v24 = 2048;
    uint64_t v25 = deviceClass;
    __int16 v26 = 2048;
    uint64_t v27 = deviceAdjust;
    __int16 v28 = 2048;
    double v29 = deviceDelay;
    __int16 v30 = 2048;
    double v31 = deviceTrumpDelay;
    __int16 v32 = 2048;
    double v33 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s #myriad reading defaults: BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, vt_endtime threshold %f", (uint8_t *)&v18, 0x52u);
  }
}

- (void)readDefaults
{
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AFMyriadCoordinator_readDefaults__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

uint64_t __35__AFMyriadCoordinator_readDefaults__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readDefaults];
}

- (void)updateRequestId:(id)a3
{
  id v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AFMyriadCoordinator_updateRequestId___block_invoke;
  v7[3] = &unk_1E592C710;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(myriadWorkQueue, v7);
}

void __39__AFMyriadCoordinator_updateRequestId___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 136315394;
    double v10 = "-[AFMyriadCoordinator updateRequestId:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad requestIdNotification: %@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [*(id *)(a1 + 32) userInfo];
  double v7 = [v6 objectForKeyedSubscript:@"requestId"];
  id v8 = (void *)[v5 initWithUUIDString:v7];
  [v4 setCurrentRequestId:v8];
}

- (void)dealloc
{
  [(AFMyriadCoordinator *)self _clearWiProxReadinessTimer];
  [(AFPowerAssertionManager *)self->_powerAssertionManager releaseAllPowerAssertions];
  arbitrationEventsDelegate = self->_arbitrationEventsDelegate;
  self->_arbitrationEventsDelegate = 0;

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  if (self->_BLEActivityEnabled)
  {
    [(WPHeySiri *)self->_heySiriBTLE stopScanningAndAdvertising];
    [(WPHeySiri *)self->_heySiriBTLE invalidate];
    self->_heySiriBTLEState = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AFMyriadCoordinator;
  [(AFMyriadCoordinator *)&v5 dealloc];
}

- (AFMyriadCoordinator)initWithDelegate:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)AFMyriadCoordinator;
  objc_super v5 = [(AFMyriadCoordinator *)&v91 init];
  if (!v5)
  {
LABEL_5:
    double v7 = 0;
    goto LABEL_22;
  }
  if (_currentCoordinator)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      v93 = "-[AFMyriadCoordinator initWithDelegate:]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Attempt to initialize MyriadCoordinator when one already exists.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  kdebug_trace();
  *((void *)v5 + 2) = 0;
  *((void *)v5 + 3) = 0;
  *((void *)v5 + 1) = 0;
  objc_storeWeak((id *)v5 + 11, v4);
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  int v9 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v8;

  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  __int16 v11 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v10;

  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  uint64_t v13 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v12;

  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  double v15 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v14;

  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  unint64_t v17 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v16;

  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  double v19 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v18;

  __int16 v20 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = 0;

  uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v23 = dispatch_queue_create((const char *)myriad_work_queue_label, v22);
  __int16 v24 = (void *)*((void *)v5 + 22);
  *((void *)v5 + 22) = v23;

  dispatch_queue_t v25 = dispatch_queue_create((const char *)myriad_context_queue_label, v22);
  __int16 v26 = (void *)*((void *)v5 + 23);
  *((void *)v5 + 23) = v25;

  if (*((void *)v5 + 23))
  {
    uint64_t v27 = [[AFMyriadAdvertisementContextManager alloc] initWithQueue:*((void *)v5 + 23)];
    __int16 v28 = (void *)*((void *)v5 + 61);
    *((void *)v5 + 61) = v27;
  }
  double v29 = +[AFInstanceContext defaultContext];
  __int16 v30 = objc_alloc_init(AFMyriadInstrumentation);
  double v31 = (void *)*((void *)v5 + 76);
  *((void *)v5 + 76) = v30;

  __int16 v32 = [AFMyriadGoodnessScoreEvaluator alloc];
  double v33 = +[AFPreferences sharedPreferences];
  uint64_t v34 = [(AFMyriadGoodnessScoreEvaluator *)v32 initWithDeviceInstanceContext:v29 preferences:v33 queue:*((void *)v5 + 22) instrumentation:*((void *)v5 + 76)];
  __int16 v35 = (void *)*((void *)v5 + 63);
  *((void *)v5 + 63) = v34;

  [*((id *)v5 + 63) setLastActivationTime:0.0];
  double v36 = [AFMyriadPreferences alloc];
  __int16 v37 = +[AFPreferences sharedPreferences];
  uint64_t v38 = [(AFMyriadPreferences *)v36 initWithDeviceInstanceContext:v29 preferences:v37];
  __int16 v39 = (void *)*((void *)v5 + 72);
  *((void *)v5 + 72) = v38;

  v5[318] = [*((id *)v5 + 72) coordinationEnabled];
  v5[319] = [*((id *)v5 + 72) BLEActivityEnabled];
  v5[168] = [*((id *)v5 + 72) deviceGroup];
  [*((id *)v5 + 72) deviceSlowDown];
  *((_DWORD *)v5 + 75) = (int)(v40 * 1000.0);
  *((_WORD *)v5 + 156) = 0;
  v5[418] = 0;
  v5[314] = 0;
  *(_WORD *)(v5 + 325) = 0;
  *((_WORD *)v5 + 164) = 0;
  *(_WORD *)(v5 + 321) = 0;
  v5[330] = 0;
  __int16 v41 = (void *)*((void *)v5 + 78);
  *((void *)v5 + 78) = 0;

  v5[280] = 0;
  *((_DWORD *)v5 + 74) = 0;
  double v42 = [[AFPowerAssertionManager alloc] initWithIdentifier:@"com.apple.assistant.myriad"];
  __int16 v43 = (void *)*((void *)v5 + 28);
  *((void *)v5 + 28) = v42;

  double v44 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v45 = v5[318];
    int v46 = v5[319];
    *(_DWORD *)long long buf = 136315650;
    v93 = "-[AFMyriadCoordinator initWithDelegate:]";
    __int16 v94 = 1024;
    int v95 = v45;
    __int16 v96 = 1024;
    int v97 = v46;
    _os_log_impl(&dword_19CF1D000, v44, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationCallback, @"com.apple.siri.myriad.apayload", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)outputTriggerSeenCallback, @"com.apple.siri.corespeech.selftrigger", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)emergencyCallback, @"com.apple.siri.myriad.falseemergency", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)myriadDecisionRequestCallback, @"com.apple.siri.myriad.get.decision", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)inEarTriggerSeenCallback, @"com.apple.siri.myriad.in.ear", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)carplayTriggerSeenCallback, @"com.apple.siri.myriad.jarvis", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v48 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v49 = (void *)*((void *)v5 + 45);
  *((void *)v5 + 45) = v48;

  __int16 v50 = (void *)*((void *)v5 + 30);
  *((void *)v5 + 30) = 0;

  *((void *)v5 + 31) = 0;
  *((void *)v5 + 32) = 0;
  *((void *)v5 + 33) = 0;
  objc_storeStrong((id *)&_currentCoordinator, v5);
  v5[320] = 0;
  v5[327] = 0;
  id v51 = (void *)*((void *)v5 + 24);
  *((void *)v5 + 24) = &stru_1EEE35D28;

  *((void *)v5 + 34) = 0;
  __int16 v52 = (void *)*((void *)v5 + 38);
  *((void *)v5 + 38) = 0;

  *((_WORD *)v5 + 201) = 0;
  id v53 = (void *)*((void *)v5 + 46);
  *((void *)v5 + 46) = 0;

  *((_DWORD *)v5 + 94) = 0;
  v5[417] = 0;
  *((void *)v5 + 49) = 0;
  v5[400] = 0;
  id v54 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v55 = (void *)*((void *)v5 + 43);
  *((void *)v5 + 43) = v54;

  [*((id *)v5 + 43) setDateFormat:@"hh:mm:ss.SSS"];
  v56 = objc_alloc_init(AFMyriadEmergencyCallPunchout);
  id v57 = (void *)*((void *)v5 + 48);
  *((void *)v5 + 48) = v56;

  [v5 _initDeviceClassAndAdjustments];
  *((void *)v5 + 29) = CFNotificationCenterGetDarwinNotifyCenter();
  v58 = (void *)*((void *)v5 + 26);
  *((void *)v5 + 26) = 0;

  BOOL v59 = (void *)*((void *)v5 + 64);
  *((void *)v5 + 64) = 0;

  [v5 _initializeTimer];
  *((_WORD *)v5 + 220) = 0;
  [v5 _initializeWiProxReadinessTimer];
  [v5 _resetAdvertisementTimings];
  if (v5[319])
  {
    uint64_t v60 = [objc_alloc((Class)getWPHeySiriClass()) initWithDelegate:v5 queue:*((void *)v5 + 22)];
    uint64_t v61 = (void *)*((void *)v5 + 44);
    *((void *)v5 + 44) = v60;
  }
  else
  {
    uint64_t v61 = (void *)*((void *)v5 + 44);
    *((void *)v5 + 44) = 0;
  }

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __40__AFMyriadCoordinator_initWithDelegate___block_invoke;
  v89[3] = &unk_1E592C678;
  id v62 = v5;
  v90 = v62;
  [v62 waitWiProx:2000 andExecute:v89];
  id v63 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v93 = "-[AFMyriadCoordinator initWithDelegate:]";
    _os_log_impl(&dword_19CF1D000, v63, OS_LOG_TYPE_INFO, "%s Initialized MyriadCoordinator", buf, 0xCu);
  }
  char v64 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v64 addObserver:v62 selector:sel_updateRequestId_ name:@"RequestIdForMyriad" object:0];

  objc_storeStrong((id *)&_currentCoordinator, v5);
  *((void *)v62 + 51) = 0;
  v65 = [AFNotifyStatePublisher alloc];
  __int16 v66 = [NSString stringWithCString:"com.apple.siri.myriad.decision.begin" encoding:4];
  uint64_t v67 = [(AFNotifyStatePublisher *)v65 initWithName:v66 queue:*((void *)v5 + 22)];
  __int16 v68 = (void *)*((void *)v62 + 65);
  *((void *)v62 + 65) = v67;

  id v69 = [AFNotifyStatePublisher alloc];
  long long v70 = [NSString stringWithCString:"com.apple.siri.myriad.decision.won" encoding:4];
  uint64_t v71 = [(AFNotifyStatePublisher *)v69 initWithName:v70 queue:*((void *)v5 + 22)];
  long long v72 = (void *)*((void *)v62 + 66);
  *((void *)v62 + 66) = v71;

  long long v73 = [AFNotifyStatePublisher alloc];
  v74 = [NSString stringWithCString:"com.apple.siri.myriad.decision.lost" encoding:4];
  uint64_t v75 = [(AFNotifyStatePublisher *)v73 initWithName:v74 queue:*((void *)v5 + 22)];
  v76 = (void *)*((void *)v62 + 67);
  *((void *)v62 + 67) = v75;

  v77 = [AFNotifyStatePublisher alloc];
  id v78 = [NSString stringWithCString:"com.apple.siri.myriad.repost.decision.won" encoding:4];
  uint64_t v79 = [(AFNotifyStatePublisher *)v77 initWithName:v78 queue:*((void *)v5 + 22)];
  double v80 = (void *)*((void *)v62 + 68);
  *((void *)v62 + 68) = v79;

  *((void *)v62 + 71) = 0;
  uint64_t v81 = observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", v29, 1, v62, *((void **)v5 + 22));
  uint64_t v82 = (void *)*((void *)v62 + 69);
  *((void *)v62 + 69) = v81;

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    uint64_t v83 = AFMyriadForceNoActivityNotifyStateObserver(v29, 1, v62, *((void **)v5 + 22));
    uint64_t v84 = (void *)*((void *)v62 + 70);
    *((void *)v62 + 70) = v83;
  }
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    __int16 v85 = objc_alloc_init(AFArbitrationParticipationController);
    uint64_t v86 = (void *)*((void *)v62 + 79);
    *((void *)v62 + 79) = v85;
  }
  v87 = (void *)*((void *)v62 + 77);
  *((void *)v62 + 77) = 0;

  kdebug_trace();
  double v7 = v62;

LABEL_22:
  return v7;
}

uint64_t __40__AFMyriadCoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 319))
  {
    [*(id *)(v2 + 352) stopScanningAndAdvertising];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 440) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 441) = 0;
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 enterState:17];
}

+ (void)clearCurrentCoordinator
{
  uint64_t v2 = (void *)_currentCoordinator;
  _currentCoordinator = 0;
}

+ (void)didChangeDefaults
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.readdefaults", 0, 0, 1u);
}

+ (id)currentCoordinator
{
  return (id)_currentCoordinator;
}

@end