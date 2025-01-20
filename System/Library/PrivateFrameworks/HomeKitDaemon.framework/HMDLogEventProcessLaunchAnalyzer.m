@interface HMDLogEventProcessLaunchAnalyzer
+ (id)logCategory;
+ (id)managedEventCounterRequestGroups;
- (BOOL)isIdleExitJetsamForExitContext:(id)a3;
- (HMDEventCountersManager)eventCountersManager;
- (HMDHomeManager)homeManager;
- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5;
- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5 lastExitContextBlock:(id)a6;
- (HMDMetricsPreferencesDebugManager)preferencesDebugManager;
- (HMFTimer)submitProcessLaunchInfoTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUserDefaults)userDefaults;
- (double)processRelaunchEventTimeIntervalThreshold;
- (id)lastExitContextBlock;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handleAccountResolvedEvent:(id)a3;
- (void)handleArchiveReplayLogEvent:(id)a3;
- (void)handleDataSyncStateUpdateLogEvent:(id)a3;
- (void)handleExitContextForHomed:(id)a3 firstLaunchAfterBoot:(BOOL)a4;
- (void)handleProcessLaunchLogEvent:(id)a3;
- (void)handleXPCMessageTransportStartedEvent:(id)a3;
- (void)homeKitConfigurationChangedWithHomeManager:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
- (void)setHomeManager:(id)a3;
- (void)submitMigrationLogEvent;
- (void)submitProcessLaunchEventWithCurrentAnalysis;
- (void)submitProcessLaunchInfoEventPendingAllConditions;
- (void)timerDidFire:(id)a3;
- (void)updateProcessLaunchInfoFromDisk;
@end

@implementation HMDLogEventProcessLaunchAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastExitContextBlock, 0);
  objc_storeStrong((id *)&self->_preferencesDebugManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_submitProcessLaunchInfoTimer, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_dataSyncStateAsString, 0);
  objc_storeStrong((id *)&self->_processExitReason, 0);
  objc_storeStrong((id *)&self->_processExitType, 0);
  objc_storeStrong((id *)&self->_processLaunchTime, 0);
}

- (double)processRelaunchEventTimeIntervalThreshold
{
  return self->_processRelaunchEventTimeIntervalThreshold;
}

- (id)lastExitContextBlock
{
  return self->_lastExitContextBlock;
}

- (HMDMetricsPreferencesDebugManager)preferencesDebugManager
{
  return self->_preferencesDebugManager;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  return (HMMLogEventSubmitting *)WeakRetained;
}

- (HMFTimer)submitProcessLaunchInfoTimer
{
  return self->_submitProcessLaunchInfoTimer;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  [v2 resetEventCountersForRequestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  id v10 = [v8 counterGroupForName:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  objc_msgSend(v7, "setProcessLaunchCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter", v6));
  objc_msgSend(v7, "setProcessAbnormalExitCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"processExit", v6));
  objc_msgSend(v7, "setProcessCrashCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter", v6));
  objc_msgSend(v7, "setProcessJetsamCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter", v6));
  objc_msgSend(v7, "setJetsamReasonHighwaterCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessLaunchAnalyzerJetsamReasonHighwaterEventCounter", v6));
  objc_msgSend(v7, "setJetsamReasonProcessLimitCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"HMDLogEventProcessLaunchAnalyzerJetsamReasonProcessLimitCountEventCounter", v6));
  uint64_t v9 = [v10 fetchEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerJetsamReasonOtherEventCounter" forDate:v6];

  [v7 setJetsamReasonOtherCount:v9];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoTimer];

  if (v5 == v4)
  {
    self->_launchInfoSubmissionState = 2;
    [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchEventWithCurrentAnalysis];
    self->_launchInfoSubmissionState = 3;
  }
}

- (void)submitProcessLaunchEventWithCurrentAnalysis
{
  v3 = [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoTimer];
  [v3 suspend];

  id v4 = [(HMDLogEventProcessLaunchAnalyzer *)self homeManager];
  id v22 = v4;
  if (v4) {
    char v5 = [v4 areThereAnyTTSUSessionsOngoing];
  }
  else {
    char v5 = 0;
  }
  id v6 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v7 = [v6 fetchEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  v8 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v9 = [v8 fetchEventCounterForEventName:@"processExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  id v10 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v11 = [v10 fetchEventCounterForEventName:@"voluntaryExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  v12 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v13 = [v12 fetchEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  v14 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v15 = [v14 fetchEventCounterForEventName:@"idleExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  v16 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  uint64_t v17 = [v16 fetchEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  v18 = [HMDProcessLaunchInfoLogEvent alloc];
  BYTE1(v21) = v5;
  LOBYTE(v21) = self->_configurationLoaded;
  v19 = -[HMDProcessLaunchInfoLogEvent initWithSubmissionState:dataSyncState:timeIntervalSincePreviousProcessLaunch:millisecondsToHomeDataLoad:millisecondsToXPCMessageTransportReady:millisecondsSinceLaunchToDataSyncStateGood:millisecondsToAccountResolved:numUncommittedRecords:numUncommittedAndPushedRecords:processExitType:processExitReason:processLaunchCount:processAbnormalExitCount:processVoluntaryExitCount:processJetsamCount:processIdleExitCount:processCrashCount:isConfigurationLoaded:isTTSUInProgress:](v18, "initWithSubmissionState:dataSyncState:timeIntervalSincePreviousProcessLaunch:millisecondsToHomeDataLoad:millisecondsToXPCMessageTransportReady:millisecondsSinceLaunchToDataSyncStateGood:millisecondsToAccountResolved:numUncommittedRecords:numUncommittedAndPushedRecords:processExitType:processExitReason:processLaunchCount:processAbnormalExitCount:processVoluntaryExitCount:processJetsamCount:processIdleExitCount:processCrashCount:isConfigurationLoaded:isTTSUInProgress:", self->_launchInfoSubmissionState, self->_dataSyncStateAsString, self->_homeDataLoadedMilliseconds, self->_xpcMessageTransportReadyMilliseconds, self->_millisecondsSinceLaunchToDataSyncStateGood, self->_accountResolvedMilliseconds, self->_timeIntervalSincePreviousProcessLaunch, self->_numUncommittedRecords, self->_numUncommittedAndPushedRecords, self->_processExitType, self->_processExitReason, v7, v9,
          v11,
          v13,
          v15,
          v17,
          v21);
  v20 = [(HMDLogEventProcessLaunchAnalyzer *)self logEventSubmitter];
  [v20 submitLogEvent:v19];
}

- (BOOL)isIdleExitJetsamForExitContext:(id)a3
{
  v3 = [a3 status];
  if ([v3 isJetsam]) {
    BOOL v4 = [v3 code] == 9;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)handleExitContextForHomed:(id)a3 firstLaunchAfterBoot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v6 = [v46 status];
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Last exit context: first launch after reboot", buf, 0xCu);
    }
  }
  else
  {
    if ([v6 isJetsam])
    {
      v12 = @"Jetsam";
    }
    else if ([v7 isCrash])
    {
      v12 = @"Crash";
    }
    else if ([v7 isSignal])
    {
      v12 = @"Signal";
    }
    else if ([v7 isFairPlayFailure])
    {
      v12 = @"FairPlayFailure";
    }
    else if ([v7 isValid])
    {
      v12 = @"Other";
    }
    else
    {
      v12 = @"Invalid";
    }
    v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v45 = [v46 type];
      uint64_t v15 = [v46 timestamp];
      v16 = &stru_26E2EB898;
      if (!v7) {
        v16 = @" exit status = nil,";
      }
      v44 = v16;
      int v17 = [v7 domain];
      uint64_t v18 = [v7 code];
      uint64_t v19 = [v7 error];
      v20 = v12;
      uint64_t v21 = (void *)v19;
      *(_DWORD *)buf = 138545154;
      v48 = v14;
      __int16 v49 = 2048;
      uint64_t v50 = v45;
      __int16 v51 = 2114;
      v52 = v15;
      __int16 v53 = 2114;
      v54 = v44;
      __int16 v55 = 1024;
      int v56 = v17;
      __int16 v57 = 2048;
      uint64_t v58 = v18;
      __int16 v59 = 2114;
      v60 = v20;
      __int16 v61 = 2112;
      uint64_t v62 = v19;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Last exit context: type = %ld, timestamp = %{public}@,%{public}@ domain = %d, code = %ld, flag = %{public}@, error = %@", buf, 0x4Eu);
    }
  }

  id v22 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  [v22 incrementEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerProcessLaunchEventCounter" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

  if (!v4
    && [v46 type] != 1
    && ![(HMDLogEventProcessLaunchAnalyzer *)self isIdleExitJetsamForExitContext:v46])
  {
    v23 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
    [v23 incrementEventCounterForEventName:@"processExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];
  }
  if ([v46 type] == 1)
  {
    v24 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
    [v24 incrementEventCounterForEventName:@"voluntaryExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];
  }
  v25 = [(HMDLogEventProcessLaunchAnalyzer *)self logEventSubmitter];
  if ([v7 isJetsam])
  {
    processExitType = self->_processExitType;
    self->_processExitType = (NSString *)@"Jetsam";

    v27 = [v7 error];
    v28 = [v27 userInfo];
    v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F08338]];
    processExitReason = self->_processExitReason;
    self->_processExitReason = v29;

    v31 = [[HMDProcessExitInfoLogEvent alloc] initWithExitType:self->_processExitType reason:self->_processExitReason];
    [v25 submitLogEvent:v31];

    v32 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
    [v32 incrementEventCounterForEventName:@"HMDLogEventProcessLaunchAnalyzerProcessJetsamCountEventCounter" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];

    uint64_t v33 = [v7 code];
    switch(v33)
    {
      case 9:
        v34 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
        v35 = v34;
        v36 = @"idleExit";
        break;
      case 7:
        v34 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
        v35 = v34;
        v36 = @"HMDLogEventProcessLaunchAnalyzerJetsamReasonProcessLimitCountEventCounter";
        break;
      case 2:
        v34 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
        v35 = v34;
        v36 = @"HMDLogEventProcessLaunchAnalyzerJetsamReasonHighwaterEventCounter";
        break;
      default:
        v34 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
        v35 = v34;
        v36 = @"HMDLogEventProcessLaunchAnalyzerJetsamReasonOtherEventCounter";
        break;
    }
    goto LABEL_35;
  }
  if ([v7 isCrash])
  {
    v37 = self->_processExitType;
    self->_processExitType = (NSString *)@"Crash";

    v38 = [v7 error];
    v39 = [v38 userInfo];
    v40 = [v39 objectForKeyedSubscript:*MEMORY[0x263F08338]];
    v41 = self->_processExitReason;
    self->_processExitReason = v40;

    v42 = [[HMDProcessExitInfoLogEvent alloc] initWithExitType:self->_processExitType reason:self->_processExitReason];
    [v25 submitLogEvent:v42];

    v34 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
    v35 = v34;
    v36 = @"HMDLogEventProcessLaunchAnalyzerProcessCrashCountEventCounter";
LABEL_35:
    [v34 incrementEventCounterForEventName:v36 requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];
  }
  v43 = [(HMDLogEventProcessLaunchAnalyzer *)self eventCountersManager];
  [v43 forceSave];
}

- (void)updateProcessLaunchInfoFromDisk
{
  v3 = [(HMDLogEventProcessLaunchAnalyzer *)self preferencesDebugManager];
  [v3 submitPreferencesSizeLogEventsForApplicationID:@"com.apple.homed" submissionTrigger:1];

  BOOL v4 = [(HMDLogEventProcessLaunchAnalyzer *)self userDefaults];
  id v14 = [v4 objectForKey:@"homedLaunchTime"];

  char v5 = [(HMDLogEventProcessLaunchAnalyzer *)self userDefaults];
  [v5 setObject:self->_processLaunchTime forKey:@"homedLaunchTime"];

  id v6 = v14;
  if (v14)
  {
    [(NSDate *)self->_processLaunchTime timeIntervalSinceDate:v14];
    double v8 = v7;
    self->_timeIntervalSincePreviousProcessLaunch = v7;
    [(HMDLogEventProcessLaunchAnalyzer *)self processRelaunchEventTimeIntervalThreshold];
    id v6 = v14;
    if (v8 < v9)
    {
      id v10 = [(HMDLogEventProcessLaunchAnalyzer *)self logEventSubmitter];
      uint64_t v11 = [HMDProcessRelaunchThresholdLogEvent alloc];
      v12 = [NSNumber numberWithDouble:self->_timeIntervalSincePreviousProcessLaunch];
      uint64_t v13 = [(HMDProcessRelaunchThresholdLogEvent *)v11 initWithTimeSincePreviousLaunch:v12];
      [v10 submitLogEvent:v13];

      id v6 = v14;
    }
  }
}

- (void)submitProcessLaunchInfoEventPendingAllConditions
{
  if (self->_millisecondsSinceLaunchToDataSyncStateGood
    && self->_accountResolvedMilliseconds
    && self->_configurationLoaded
    && !self->_processLaunchInfoEventSubmitted)
  {
    v3 = [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoTimer];
    int v4 = [v3 isRunning];

    if (v4) {
      self->_launchInfoSubmissionState = 1;
    }
    self->_processLaunchInfoEventSubmitted = 1;
    [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchEventWithCurrentAnalysis];
  }
}

- (void)handleArchiveReplayLogEvent:(id)a3
{
  id v4 = a3;
  self->_numUncommittedRecords = [v4 numUncommittedRecords];
  int64_t v5 = [v4 numUncommittedAndPushedRecords];

  self->_numUncommittedAndPushedRecords = v5;
}

- (void)handleAccountResolvedEvent:(id)a3
{
  if (!self->_accountResolvedMilliseconds)
  {
    [a3 startTime];
    self->_accountResolvedMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
}

- (void)handleXPCMessageTransportStartedEvent:(id)a3
{
  if (!self->_xpcMessageTransportReadyMilliseconds)
  {
    [a3 startTime];
    self->_xpcMessageTransportReadyMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
}

- (void)handleDataSyncStateUpdateLogEvent:(id)a3
{
  id v9 = a3;
  [v9 dataSyncState];
  HMHomeManagerDataSyncStateToString();
  double v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  dataSyncStateAsString = self->_dataSyncStateAsString;
  self->_dataSyncStateAsString = v4;

  if (!self->_millisecondsSinceLaunchToDataSyncStateGood)
  {
    id v6 = self->_dataSyncStateAsString;
    double v7 = HMHomeManagerDataSyncStateToString();
    LODWORD(v6) = [(NSString *)v6 isEqualToString:v7];

    if (v6)
    {
      [v9 startTime];
      self->_millisecondsSinceLaunchToDataSyncStateGood = (uint64_t)((v8 - self->_launchTime) * 1000.0);
      [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoEventPendingAllConditions];
    }
  }
}

- (void)submitMigrationLogEvent
{
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  double v4 = objc_alloc_init(HMDHH2MigrationStateLogger);
  if ([(HMDHH2MigrationStateLogger *)v4 shouldSubmitLogEvent])
  {
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__HMDLogEventProcessLaunchAnalyzer_submitMigrationLogEvent__block_invoke;
    v7[3] = &unk_264A2F820;
    v7[4] = self;
    double v8 = v4;
    dispatch_after(v5, v6, v7);
  }
}

void __59__HMDLogEventProcessLaunchAnalyzer_submitMigrationLogEvent__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) logEventSubmitter];
  id v2 = [*(id *)(a1 + 40) migrationEndLogEventFromDisk];
  [v4 submitLogEvent:v2];

  v3 = [*(id *)(a1 + 40) migrationDetailsLogEventFromDisk];
  [v4 submitLogEvent:v3];
}

- (void)handleProcessLaunchLogEvent:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [v4 startDate];
  processLaunchTime = self->_processLaunchTime;
  self->_processLaunchTime = v5;

  [v4 startTime];
  self->_launchTime = v7;
  [(HMDLogEventProcessLaunchAnalyzer *)self updateProcessLaunchInfoFromDisk];
  [(HMDLogEventProcessLaunchAnalyzer *)self submitMigrationLogEvent];
  double v8 = [(HMDLogEventProcessLaunchAnalyzer *)self lastExitContextBlock];
  id v9 = v8[2]();
  uint64_t v10 = [v4 isFirstLaunchAfterBoot];

  [(HMDLogEventProcessLaunchAnalyzer *)self handleExitContextForHomed:v9 firstLaunchAfterBoot:v10];
  id v11 = [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoTimer];
  [v11 resume];
}

- (void)homeKitConfigurationChangedWithHomeManager:(id)a3
{
  [(HMDLogEventProcessLaunchAnalyzer *)self setHomeManager:a3];
  self->_configurationLoaded = 1;
  if (self->_launchTime > 0.0 && !self->_homeDataLoadedMilliseconds)
  {
    [MEMORY[0x263F499B8] currentTime];
    self->_homeDataLoadedMilliseconds = (uint64_t)((v4 - self->_launchTime) * 1000.0);
  }
  [(HMDLogEventProcessLaunchAnalyzer *)self submitProcessLaunchInfoEventPendingAllConditions];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    dispatch_time_t v5 = v4;
  }
  else {
    dispatch_time_t v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    [(HMDLogEventProcessLaunchAnalyzer *)self handleDataSyncStateUpdateLogEvent:v6];
  }
  id v7 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    [(HMDLogEventProcessLaunchAnalyzer *)self handleProcessLaunchLogEvent:v9];
  }
  id v10 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12) {
    [(HMDLogEventProcessLaunchAnalyzer *)self handleXPCMessageTransportStartedEvent:v12];
  }
  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (v15) {
    [(HMDLogEventProcessLaunchAnalyzer *)self handleAccountResolvedEvent:v15];
  }
  id v18 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v18;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17) {
    [(HMDLogEventProcessLaunchAnalyzer *)self handleArchiveReplayLogEvent:v17];
  }
}

- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5 lastExitContextBlock:(id)a6
{
  v34[6] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMDLogEventProcessLaunchAnalyzer;
  id v15 = [(HMDLogEventProcessLaunchAnalyzer *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_submitProcessLaunchInfoTimer, a3);
    uint64_t v17 = [v12 legacyCountersManager];
    eventCountersManager = v16->_eventCountersManager;
    v16->_eventCountersManager = (HMDEventCountersManager *)v17;

    uint64_t v19 = [v12 logEventSubmitter];
    objc_storeWeak((id *)&v16->_logEventSubmitter, v19);

    uint64_t v20 = [v12 userDefaults];
    userDefaults = v16->_userDefaults;
    v16->_userDefaults = (NSUserDefaults *)v20;

    objc_storeStrong((id *)&v16->_preferencesDebugManager, a5);
    id v22 = _Block_copy(v14);
    id lastExitContextBlock = v16->_lastExitContextBlock;
    v16->_id lastExitContextBlock = v22;

    v16->_processRelaunchEventTimeIntervalThreshold = 600.0;
    v24 = [v12 logEventDispatcher];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    v34[5] = objc_opt_class();
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:6];
    [v24 addObserver:v16 forEventClasses:v25];

    [v12 addThresholdTrigger:@"homedExitCount" forEventName:@"processExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup" atThreshold:10];
    v26 = [v12 radarInitiator];

    if (v26)
    {
      v27 = [v12 legacyCountersManager];
      v28 = [HMDCounterThresholdTTRTrigger alloc];
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Excessive homed abnormal exits (>=%d)", 10);
      v30 = [v12 radarInitiator];
      v31 = [(HMDCounterThresholdTTRTrigger *)v28 initWithThreshold:10 displayReason:@"homed exited abnormally" radarTitle:v29 componentName:@"HomeKit" componentVersion:@"New Bugs" componentID:590644 radarInitiator:v30];
      [v27 addObserver:v31 forEventName:@"processExit" requestGroup:@"HMDLogEventProcessLaunchAnalyzerRequestGroup"];
    }
  }

  return v16;
}

- (HMDLogEventProcessLaunchAnalyzer)initWithProcessLaunchInfoTimer:(id)a3 dataSource:(id)a4 preferencesDebugManager:(id)a5
{
  return [(HMDLogEventProcessLaunchAnalyzer *)self initWithProcessLaunchInfoTimer:a3 dataSource:a4 preferencesDebugManager:a5 lastExitContextBlock:&__block_literal_global_186361];
}

id __102__HMDLogEventProcessLaunchAnalyzer_initWithProcessLaunchInfoTimer_dataSource_preferencesDebugManager___block_invoke()
{
  v0 = [MEMORY[0x263F64570] currentProcess];
  v1 = [v0 lastExitContext];

  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_186369 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_186369, &__block_literal_global_85_186370);
  }
  id v2 = (void *)logCategory__hmf_once_v8_186371;
  return v2;
}

void __47__HMDLogEventProcessLaunchAnalyzer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_186371;
  logCategory__hmf_once_v8_186371 = v0;
}

+ (id)managedEventCounterRequestGroups
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"HMDLogEventProcessLaunchAnalyzerRequestGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end