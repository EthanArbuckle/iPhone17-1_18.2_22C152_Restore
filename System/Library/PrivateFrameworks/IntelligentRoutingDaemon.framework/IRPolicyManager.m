@interface IRPolicyManager
- (BOOL)isLowLatencyMiLo;
- (IRCandidateManager)candidateManager;
- (IRHistoryManager)historyManager;
- (IRMediaRemoteProvider)saredLocalEndpointProvider;
- (IRPolicyEngine)policyEngine;
- (IRPolicyManager)initWithService:(id)a3 queue:(id)a4 delegate:(id)a5 avOutputDeviceProvider:(id)a6 biomeProvider:(id)a7 miloProvider:(id)a8 rapportProvider:(id)a9 proximityProvider:(id)a10 serviceStore:(id)a11 displayMonitor:(id)a12 audioAVOutputContextController:(id)a13 isLowLatencyMiLo:(BOOL)a14;
- (IRPolicyManagerDelegate)delegate;
- (IRReplayWriter)replayWriter;
- (IRServiceDO)service;
- (IRSessionAnalytics)sessionAnalytics;
- (IRStatisticsManager)statisticsManager;
- (IRSystemStateManager)systemStateManager;
- (IRTimer)spotOnTimeout;
- (NSMutableSet)spotOnPendingClientIDs;
- (OS_dispatch_queue)queue;
- (id)_createContextOverrdiesForBundleIDIfNeeded:(id)a3;
- (id)getStatistics;
- (id)requestCurrentContextWithBundleID:(id)a3;
- (int64_t)mode;
- (void)_checkAndStartLowLatencyMiLoIfNeededWithForce:(BOOL)a3 historyEventsContainer:(id)a4;
- (void)_checkAndUpdateBundlesForEventIfNeeded:(id)a3;
- (void)_sendSessionAnalyticsEvent:(id)a3 forCandidate:(id)a4;
- (void)addEvent:(id)a3 forCandidate:(id)a4;
- (void)clearStatistics;
- (void)dealloc;
- (void)deallocSync;
- (void)deleteCandidate:(id)a3;
- (void)didSpotOnLocationComplete:(id)a3;
- (void)didUpdateContextWithReason:(id)a3 andOverrides:(id)a4;
- (void)requestUpdatedBundlesWithSignificantInteraction;
- (void)restartLowLatencyMiLo:(BOOL)a3;
- (void)run;
- (void)setCandidateManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHistoryManager:(id)a3;
- (void)setIsLowLatencyMiLo:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setPolicyEngine:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplayWriter:(id)a3;
- (void)setSaredLocalEndpointProvider:(id)a3;
- (void)setService:(id)a3;
- (void)setSessionAnalytics:(id)a3;
- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4;
- (void)setSpotOnPendingClientIDs:(id)a3;
- (void)setSpotOnTimeout:(id)a3;
- (void)setStatisticsManager:(id)a3;
- (void)setSystemStateManager:(id)a3;
- (void)setUpdateMode:(int64_t)a3;
- (void)synchronizeAndFetchFromDBOnDisk;
- (void)updateCandidates:(id)a3;
@end

@implementation IRPolicyManager

- (void)didUpdateContextWithReason:(id)a3 andOverrides:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [MEMORY[0x263EFF910] now];
  v10 = [(IRPolicyManager *)self systemStateManager];
  v11 = [v10 systemState];
  v59 = [v11 overrideSystemStateIfNeeded:v7];

  v12 = [(IRPolicyManager *)self statisticsManager];
  int64_t v13 = [(IRPolicyManager *)self mode];
  v14 = [(IRPolicyManager *)self systemStateManager];
  v15 = [v14 miloProviderLslPredictionResults];
  [v12 contextChangedWithReason:v6 mode:v13 miloPrediction:v15 date:v9];

  v16 = [(IRPolicyManager *)self sessionAnalytics];
  v17 = [(IRPolicyManager *)self systemStateManager];
  v18 = [v17 systemState];
  [v16 contextChangedWithReason:v6 systemState:v18];

  if ([(IRPolicyManager *)self mode] != 1
    && ([v6 isEqual:@"Request current context"] & 1) == 0)
  {
    v53 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v54 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v61 = "#policy-manager, ";
      __int16 v62 = 2112;
      v63 = v53;
      __int16 v64 = 2112;
      *(void *)v65 = v6;
      _os_log_impl(&dword_25418E000, v54, OS_LOG_TYPE_INFO, "%s[%@], didUpdateContextWithReason was triggered with reason: %@, but service is not in updates mode", buf, 0x20u);
    }
    goto LABEL_18;
  }
  v19 = [(IRPolicyManager *)self policyEngine];
  v56 = [(IRPolicyManager *)self candidateManager];
  v20 = [v56 candidatesContainer];
  [(IRPolicyManager *)self historyManager];
  v21 = v58 = v6;
  [v21 historyEventsContainer];
  v23 = v22 = v9;
  v24 = [(IRPolicyManager *)self systemStateManager];
  v25 = [v24 miloProviderLslPredictionResults];
  v26 = [(IRPolicyManager *)self systemStateManager];
  v27 = [v26 nearbyDeviceContainer];
  LOBYTE(v55) = 1;
  int v57 = [v19 updateContextWithDate:v22 candidatesContainer:v20 historyEventsContainer:v23 systemState:v59 miloProviderLslPredictionResults:v25 nearbyDeviceContainer:v27 fillInspection:v55];

  v9 = v22;
  id v6 = v58;

  v28 = [(IRPolicyManager *)self replayWriter];
  v29 = [(IRPolicyManager *)self systemStateManager];
  v30 = [v29 miloProviderLslPredictionResults];
  v31 = [(IRPolicyManager *)self candidateManager];
  v32 = [v31 candidatesContainer];
  v33 = [(IRPolicyManager *)self systemStateManager];
  v34 = [v33 nearbyDeviceContainer];
  [v28 writeReplayEventWithReason:v58 SystemState:v59 miloLslPrediction:v30 candidatesContainerDO:v32 nearbyDeviceContainerDO:v34 date:v9];

  if ((v57 & 1) != 0 || [v58 isEqual:@"Run"])
  {
    v35 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v36 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      v38 = [(IRPolicyManager *)self policyEngine];
      v39 = [v38 lastEventsString];
      *(_DWORD *)buf = 136315650;
      v61 = "#policy-manager, ";
      __int16 v62 = 2112;
      v63 = v35;
      __int16 v64 = 2112;
      *(void *)v65 = v39;
      _os_log_impl(&dword_25418E000, v37, OS_LOG_TYPE_INFO, "%s[%@], %@", buf, 0x20u);
    }
    v40 = [(IRPolicyManager *)self systemStateManager];
    [v40 logProviderState];
  }
  if ([v58 isEqual:@"Run"]) {
    unsigned int v41 = 1;
  }
  else {
    unsigned int v41 = v57 & ~[v58 isEqual:@"Request current context"];
  }
  v42 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v43 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v61 = "#policy-manager, ";
    __int16 v62 = 2112;
    v63 = v42;
    __int16 v64 = 1024;
    *(_DWORD *)v65 = v41;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = v57;
    __int16 v66 = 2112;
    v67 = v58;
    _os_log_impl(&dword_25418E000, v43, OS_LOG_TYPE_INFO, "%s[%@], sendContextToClient: %d, context updated: %d, reason: %@", buf, 0x2Cu);
  }

  if (v41)
  {
    v44 = [(IRPolicyManager *)self delegate];
    v45 = [(IRPolicyManager *)self policyEngine];
    v46 = [v45 contexts];
    [v44 policyManager:self didUpdateContexts:v46 withReason:v58];

    v47 = [(IRPolicyManager *)self policyEngine];
    v48 = [v47 contexts];
    v49 = [v48 objectForKeyedSubscript:*MEMORY[0x263F50080]];
    v50 = [v49 candidateResults];
    v51 = [v50 firstWhere:&__block_literal_global_8];

    if (v51)
    {
      v52 = [(IRPolicyManager *)self systemStateManager];
      [v52 endAppInFocusWindow];

      v53 = [(IRPolicyManager *)self statisticsManager];
      [v53 bannerContextWithDate:v9];
LABEL_18:
    }
  }
}

- (IRSystemStateManager)systemStateManager
{
  return self->_systemStateManager;
}

- (int64_t)mode
{
  return self->_mode;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRStatisticsManager)statisticsManager
{
  return self->_statisticsManager;
}

- (IRSessionAnalytics)sessionAnalytics
{
  return self->_sessionAnalytics;
}

- (IRServiceDO)service
{
  return self->_service;
}

- (IRPolicyEngine)policyEngine
{
  return self->_policyEngine;
}

- (IRCandidateManager)candidateManager
{
  return self->_candidateManager;
}

- (void)setUpdateMode:(int64_t)a3
{
  v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(IRPolicyManager *)self setMode:a3];
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)run
{
  v3 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v3);

  [(IRPolicyManager *)self didUpdateContextWithReason:@"Run" andOverrides:0];
}

- (IRReplayWriter)replayWriter
{
  return self->_replayWriter;
}

- (IRHistoryManager)historyManager
{
  return self->_historyManager;
}

- (IRPolicyManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IRPolicyManagerDelegate *)WeakRetained;
}

- (IRPolicyManager)initWithService:(id)a3 queue:(id)a4 delegate:(id)a5 avOutputDeviceProvider:(id)a6 biomeProvider:(id)a7 miloProvider:(id)a8 rapportProvider:(id)a9 proximityProvider:(id)a10 serviceStore:(id)a11 displayMonitor:(id)a12 audioAVOutputContextController:(id)a13 isLowLatencyMiLo:(BOOL)a14
{
  id v59 = a3;
  v19 = a4;
  id v20 = a5;
  id v60 = a6;
  id v61 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v25 = v21;
  id v26 = a12;
  id v27 = a13;
  __int16 v62 = v19;
  dispatch_assert_queue_V2(v19);
  v63.receiver = self;
  v63.super_class = (Class)IRPolicyManager;
  v28 = [(IRPolicyManager *)&v63 init];
  v29 = v28;
  if (v28)
  {
    [(IRPolicyManager *)v28 setQueue:v19];
    id v58 = v20;
    [(IRPolicyManager *)v29 setDelegate:v20];
    [(IRPolicyManager *)v29 setService:v59];
    id v30 = v26;
    v31 = -[IRPolicyEngine initWithServicePackage:]([IRPolicyEngine alloc], "initWithServicePackage:", [v59 servicePackage]);
    [(IRPolicyManager *)v29 setPolicyEngine:v31];

    v32 = [[IRReplayWriter alloc] initWithServiceStore:v24];
    [(IRPolicyManager *)v29 setReplayWriter:v32];

    v33 = [IRCandidateManager alloc];
    v34 = [(IRPolicyManager *)v29 queue];
    v35 = [(IRCandidateManager *)v33 initWithQueue:v34 contextObserver:v29 avOutputDeviceProvider:v60 rapportDeviceProvider:v22 store:v24];
    [(IRPolicyManager *)v29 setCandidateManager:v35];

    v36 = [[IRStatisticsManager alloc] initWithStore:v24];
    [(IRPolicyManager *)v29 setStatisticsManager:v36];

    [(IRPolicyManager *)v29 setIsLowLatencyMiLo:a14];
    v37 = [[IRHistoryManager alloc] initWithStore:v24 miloFeedback:v25];
    [(IRPolicyManager *)v29 setHistoryManager:v37];

    v38 = [IRSystemStateManager alloc];
    v39 = [(IRPolicyManager *)v29 queue];
    LOBYTE(v52) = [(IRPolicyManager *)v29 isLowLatencyMiLo];
    id v54 = v27;
    uint64_t v55 = v30;
    id v56 = v23;
    v40 = [(IRSystemStateManager *)v38 initWithQueue:v39 contextObserver:v29 biomeProvider:v61 miloProvider:v25 proximityProvider:v23 serviceStore:v24 displayMonitor:v30 audioAVOutputContextController:v27 isLowLatencyMiLo:v52];
    [(IRPolicyManager *)v29 setSystemStateManager:v40];

    unsigned int v41 = [MEMORY[0x263EFF9C0] set];
    [(IRPolicyManager *)v29 setSpotOnPendingClientIDs:v41];

    v42 = +[IRPreferences shared];
    v43 = [v42 coreAnalyticsSessionEnable];
    if (![v43 BOOLValue])
    {
LABEL_7:
      id v27 = v54;
      id v26 = v55;

      id v20 = v58;
      id v23 = v56;
      goto LABEL_8;
    }
    v53 = v25;
    v44 = [(IRPolicyManager *)v29 service];
    v45 = [v44 clientIdentifier];
    if ([v45 containsString:@"com.apple.mediaremoted"])
    {

      v25 = v53;
LABEL_6:
      v49 = [IRSessionAnalytics alloc];
      v42 = [(IRPolicyManager *)v29 queue];
      v43 = [(IRPolicyManager *)v29 service];
      v50 = [(IRSessionAnalytics *)v49 initWithQueue:v42 service:v43];
      [(IRPolicyManager *)v29 setSessionAnalytics:v50];

      goto LABEL_7;
    }
    v46 = [(IRPolicyManager *)v29 service];
    v47 = [v46 clientIdentifier];
    char v48 = [v47 isEqual:@"com.apple.intelligentroutingclient.Media"];

    id v20 = v58;
    v25 = v53;
    id v27 = v54;
    id v26 = v55;
    id v23 = v56;
    if (v48) {
      goto LABEL_6;
    }
  }
LABEL_8:

  return v29;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IRPolicyManager;
  [(IRPolicyManager *)&v2 dealloc];
}

- (void)deallocSync
{
  v3 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IRPolicyManager *)self candidateManager];
  [v4 deallocSync];

  v5 = [(IRPolicyManager *)self systemStateManager];
  [v5 deallocSync];

  id v6 = [(IRPolicyManager *)self replayWriter];
  [v6 deallocSync];
}

- (id)requestCurrentContextWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IRPolicyManager *)self _createContextOverrdiesForBundleIDIfNeeded:v4];

  [(IRPolicyManager *)self didUpdateContextWithReason:@"Request current context" andOverrides:v6];
  id v7 = [(IRPolicyManager *)self policyEngine];
  v8 = [v7 contexts];

  return v8;
}

- (void)updateCandidates:(id)a3
{
  id v4 = a3;
  v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IRPolicyManager *)self candidateManager];
  id v7 = [(IRPolicyManager *)self historyManager];
  v8 = [v7 historyEventsContainer];
  [v6 updateCandidates:v4 withHistoryEventsContainer:v8];

  id v10 = [(IRPolicyManager *)self historyManager];
  v9 = [v10 historyEventsContainer];
  [(IRPolicyManager *)self _checkAndStartLowLatencyMiLoIfNeededWithForce:0 historyEventsContainer:v9];
}

- (void)deleteCandidate:(id)a3
{
  id v4 = a3;
  v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(IRPolicyManager *)self candidateManager];
  [v6 deleteCandidate:v4];
}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [MEMORY[0x263EFF910] date];
  uint64_t v10 = [v7 candidateIdentifier];
  [(IRPolicyManager *)self _sendSessionAnalyticsEvent:v6 forCandidate:v7];
  v11 = [(IRPolicyManager *)self policyEngine];
  v12 = [(IRPolicyManager *)self historyManager];
  int64_t v13 = [v12 historyEventsContainer];
  v14 = [(IRPolicyManager *)self systemStateManager];
  v15 = [v14 systemState];
  id v59 = (void *)v9;
  LODWORD(v9) = [v11 shouldRejectEvent:v6 withHistoryEventsContainer:v13 withSystemState:v15 forCandidate:v7 date:v9];

  if (v9)
  {
    v16 = (void *)v10;
    v17 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v18 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      v19 = NSNumber;
      id v20 = v18;
      id v21 = objc_msgSend(v19, "numberWithLongLong:", objc_msgSend(v6, "eventType"));
      id v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "eventSubType"));
      id v23 = NSNumber;
      id v24 = [(IRPolicyManager *)self systemStateManager];
      v25 = [v24 systemState];
      id v26 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v25, "displayOn"));
      *(_DWORD *)buf = 136316418;
      __int16 v62 = "#policy-manager, ";
      __int16 v63 = 2112;
      __int16 v64 = v17;
      __int16 v65 = 2112;
      __int16 v66 = v21;
      __int16 v67 = 2112;
      uint64_t v68 = v22;
      __int16 v69 = 2112;
      v70 = v16;
      __int16 v71 = 2112;
      v72 = v26;
      _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_INFO, "%s[%@], Event rejected, type: %@, subtype: %@, for candidateIdentifier: %@, displayOn: %@", buf, 0x3Eu);
    }
  }
  else
  {
    id v27 = [(IRPolicyManager *)self candidateManager];
    v28 = [v27 candidatesContainer];
    uint64_t v29 = [v28 candidateForCandidateIdentifier:v10];

    id v30 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v31 = (void *)*MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = +[IRLogQEUtility getEventAsString:v6];
      v34 = +[IRLogQEUtility getCandidateAsString:v29];
      *(_DWORD *)buf = 136315906;
      __int16 v62 = "#policy-manager, ";
      __int16 v63 = 2112;
      __int16 v64 = v30;
      __int16 v65 = 2112;
      __int16 v66 = v33;
      __int16 v67 = 2112;
      uint64_t v68 = v34;
      _os_log_impl(&dword_25418E000, v32, OS_LOG_TYPE_DEFAULT, "%s[%@], Adding event:\n %@\n for candidate:\n %@", buf, 0x2Au);
    }
    v35 = [(IRPolicyManager *)self candidateManager];
    v16 = (void *)v10;
    [v35 notifyAddEventForCandidateIdentifier:v10];

    v36 = [(IRPolicyManager *)self systemStateManager];
    v37 = [v36 systemState];
    uint64_t v57 = +[IRHistoryEventDO historyEventDOWithDate:v59 candidateIdentifier:v10 event:v6 miloPredictionEvent:0 systemState:v37 sharingPolicy:0];

    uint64_t v60 = v57;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    id v56 = +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:v38];

    [(IRPolicyManager *)self _checkAndStartLowLatencyMiLoIfNeededWithForce:0 historyEventsContainer:v56];
    v39 = [(IRPolicyManager *)self historyManager];
    v40 = [(IRPolicyManager *)self systemStateManager];
    [v40 systemState];
    unsigned int v41 = v58 = (void *)v29;
    v42 = [(IRPolicyManager *)self systemStateManager];
    v43 = [v42 miloProviderLslPredictionResults];
    [v39 addEvent:v6 forCandidateIdentifier:v10 withSystemState:v41 andMiloPrediction:v43];

    [(IRPolicyManager *)self _checkAndUpdateBundlesForEventIfNeeded:v6];
    v44 = [(IRPolicyManager *)self policyEngine];
    uint64_t v55 = [v44 policyInspections];

    v45 = [(IRPolicyManager *)self systemStateManager];
    [v45 addEvent:v6 forCandidate:v58];

    id v54 = [(IRPolicyManager *)self service];
    v46 = [(IRPolicyManager *)self systemStateManager];
    v47 = [(IRPolicyManager *)self candidateManager];
    char v48 = [v47 candidatesContainer];
    [(IRPolicyManager *)self statisticsManager];
    v50 = id v49 = v6;
    v51 = [(IRPolicyManager *)self historyManager];
    uint64_t v52 = [v51 historyEventsContainer];
    +[IRAnalyticsManager logUiEvent:v49 withService:v54 forCandidateIdentifier:v16 systemStateManager:v46 candidatesContainer:v48 inspections:v55 statisticsManager:v50 historyEventsContainer:v52];

    id v6 = v49;
    id v7 = v58;
    v53 = [(IRPolicyManager *)self statisticsManager];
    [v53 event:v49 forCandidate:v58 inspections:v55 date:v59];

    v17 = (void *)v57;
  }
}

- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (const void **)MEMORY[0x263F50120];
  uint64_t v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v11 = (os_log_t *)MEMORY[0x263F50090];
  v12 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int64_t v13 = NSNumber;
    v14 = v12;
    v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v6, "resetAllBrokerDiscoveredCandidates"));
    *(_DWORD *)buf = 136315906;
    v40 = "#policy-manager, ";
    __int16 v41 = 2112;
    v42 = v10;
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_INFO, "%s[%@], Set Spot On for clientId: %@, shouldResetBrokeredDevices: %@", buf, 0x2Au);
  }
  if ([v6 resetAllBrokerDiscoveredCandidates])
  {
    v16 = [(IRPolicyManager *)self candidateManager];
    [v16 deleteBrokerCandidates];
  }
  v17 = [(IRPolicyManager *)self spotOnPendingClientIDs];
  [v17 addObject:v7];

  v18 = [(IRPolicyManager *)self spotOnPendingClientIDs];
  BOOL v19 = (unint64_t)[v18 count] > 1;

  if (v19)
  {
    id v20 = dispatch_get_specific(*v9);
    os_log_t v21 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      id v22 = v21;
      id v23 = [(IRPolicyManager *)self spotOnPendingClientIDs];
      *(_DWORD *)buf = 136315906;
      v40 = "#policy-manager, ";
      __int16 v41 = 2112;
      v42 = v20;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_25418E000, v22, OS_LOG_TYPE_INFO, "%s[%@], Set Spot On for clientId: %@, there is already a pending request for: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v24 = [(IRPolicyManager *)self spotOnTimeout];

    if (v24)
    {
      v25 = dispatch_get_specific(*v9);
      id v26 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "#policy-manager, ";
        __int16 v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_25418E000, v26, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - spot on timer conflict] Spot on timer retriggered while is still ongoing", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    id v27 = [IRTimer alloc];
    v28 = +[IRPreferences shared];
    uint64_t v29 = [v28 miloTimeoutForSetSpotOnRequestSeconds];
    uint64_t v30 = [v29 integerValue];
    v31 = [(IRPolicyManager *)self queue];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __63__IRPolicyManager_setSpotOnLocationWithParameters_andClientID___block_invoke;
    v37[3] = &unk_26539FA70;
    objc_copyWeak(&v38, (id *)buf);
    v32 = [(IRTimer *)v27 initWithInterval:0 repeats:v31 queue:v37 block:(double)v30];
    [(IRPolicyManager *)self setSpotOnTimeout:v32];

    v33 = [(IRPolicyManager *)self historyManager];
    v34 = [v33 historyEventsContainer];
    [(IRPolicyManager *)self _checkAndStartLowLatencyMiLoIfNeededWithForce:1 historyEventsContainer:v34];

    v35 = [(IRPolicyManager *)self systemStateManager];
    v36 = [v35 miloProvider];
    [v36 setSpotOnLocation];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
}

void __63__IRPolicyManager_setSpotOnLocationWithParameters_andClientID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v3 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v13 = "#policy-manager, ";
      __int16 v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_25418E000, v3, OS_LOG_TYPE_INFO, "%s[%@], spot on milo request timeout, returning error", buf, 0x16u);
    }

    id v4 = [WeakRetained systemStateManager];
    v5 = [v4 miloProvider];
    [v5 resetSpotOnLocationRequest];

    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F50088];
    uint64_t v10 = *MEMORY[0x263F08338];
    v11 = @"timeout";
    v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:-12898 userInfo:v8];
    [WeakRetained didSpotOnLocationComplete:v9];
  }
}

- (void)requestUpdatedBundlesWithSignificantInteraction
{
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  v3 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IRPolicyManager *)self candidateManager];
  [v4 synchronizeAndFetchFromDBOnDisk];

  v5 = [(IRPolicyManager *)self historyManager];
  [v5 synchronizeAndFetchFromDBOnDisk];

  [(IRPolicyManager *)self _checkAndUpdateBundlesForEventIfNeeded:0];
}

- (id)getStatistics
{
  v3 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IRPolicyManager *)self statisticsManager];
  v5 = [v4 statistics];

  return v5;
}

- (void)clearStatistics
{
  v3 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(IRPolicyManager *)self statisticsManager];
  id v4 = [MEMORY[0x263EFF910] date];
  [v5 clearStatistics:v4];
}

- (void)_checkAndStartLowLatencyMiLoIfNeededWithForce:(BOOL)a3 historyEventsContainer:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (![(IRPolicyManager *)self isLowLatencyMiLo])
  {
    if (a3) {
      goto LABEL_4;
    }
    uint64_t v7 = [(IRPolicyManager *)self policyEngine];
    v8 = [(IRPolicyManager *)self candidateManager];
    uint64_t v9 = [v8 candidatesContainer];
    int v10 = [v7 shouldAskForLowLatencyMiLo:v9 historyEventsContainer:v6];

    if (v10)
    {
LABEL_4:
      v11 = [(IRPolicyManager *)self systemStateManager];
      -[IRPolicyManager setIsLowLatencyMiLo:](self, "setIsLowLatencyMiLo:", [v11 startLowLatencyMiLo]);

      v12 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      int64_t v13 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        __int16 v14 = v13;
        BOOL v15 = [(IRPolicyManager *)self isLowLatencyMiLo];
        uint64_t v16 = @"No";
        v18 = "#policy-manager, ";
        int v17 = 136315650;
        __int16 v19 = 2112;
        id v20 = v12;
        if (v15) {
          uint64_t v16 = @"Yes";
        }
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_INFO, "%s[%@], Low Latency MiLo started: %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (id)_createContextOverrdiesForBundleIDIfNeeded:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[IRContextRequestOverrides alloc] initWithOverrideAppInFocusWindow:1 overrideBundleId:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_checkAndUpdateBundlesForEventIfNeeded:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = [(IRPolicyManager *)self policyEngine];
  id v6 = [v5 bundlesWithSignificantInteraction];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__IRPolicyManager__checkAndUpdateBundlesForEventIfNeeded___block_invoke;
  v21[3] = &unk_2653A0030;
  id v22 = v4;
  char v7 = [v6 containsObjectPassingTest:v21];

  if ((v7 & 1) == 0)
  {
LABEL_3:
    v8 = [(IRPolicyManager *)self policyEngine];
    uint64_t v9 = [(IRPolicyManager *)self candidateManager];
    int v10 = [v9 candidatesContainer];
    v11 = [(IRPolicyManager *)self historyManager];
    v12 = [v11 historyEventsContainer];
    int v13 = [v8 updateBundlesWithSignificantInteractionForEvent:v4 candidatesContainer:v10 historyEventsContainer:v12];

    __int16 v14 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    BOOL v15 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = @"NO";
      *(_DWORD *)buf = 136315650;
      id v24 = "#policy-manager, ";
      __int16 v25 = 2112;
      id v26 = v14;
      if (v13) {
        uint64_t v16 = @"YES";
      }
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_25418E000, v15, OS_LOG_TYPE_INFO, "%s[%@], _checkAndUpdateBundlesForEventIfNeeded bundlesUpdated: %@", buf, 0x20u);
    }

    char v17 = v13 ^ 1;
    if (!v4) {
      char v17 = 0;
    }
    if ((v17 & 1) == 0)
    {
      v18 = [(IRPolicyManager *)self delegate];
      __int16 v19 = [(IRPolicyManager *)self policyEngine];
      id v20 = [v19 bundlesWithSignificantInteraction];
      [v18 policyManager:self didUpdateBundlesWithSignificantInteractionPattern:v20];
    }
  }
}

BOOL __58__IRPolicyManager__checkAndUpdateBundlesForEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) bundleID];
  BOOL v5 = v3 == v4;

  return v5;
}

- (void)_sendSessionAnalyticsEvent:(id)a3 forCandidate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isMediaRemoteLocal])
  {
    id v16 = +[IRCandidateDO mediaRemoteSpeakerCandidate];
  }
  else
  {
    v8 = [(IRPolicyManager *)self candidateManager];
    uint64_t v9 = [v8 candidatesContainer];
    int v10 = [v6 candidateIdentifier];
    id v16 = [v9 candidateForCandidateIdentifier:v10];

    id v6 = v8;
  }

  v11 = [(IRPolicyManager *)self sessionAnalytics];
  v12 = [(IRPolicyManager *)self systemStateManager];
  int v13 = [v12 miloProviderLslPredictionResults];
  __int16 v14 = [(IRPolicyManager *)self systemStateManager];
  BOOL v15 = [v14 systemState];
  [v11 event:v7 forCandidate:v16 miloPrediction:v13 systemState:v15];
}

BOOL __59__IRPolicyManager_didUpdateContextWithReason_andOverrides___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 classification] == 3 || objc_msgSend(v2, "classification") == 4;

  return v3;
}

- (void)didSpotOnLocationComplete:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v7 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    __int16 v14 = "#policy-manager, ";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_INFO, "%s[%@], got call for didSpotOnLocationComplete with error: %@, answering relevant clients and removing all spotOnPendingClients", (uint8_t *)&v13, 0x20u);
  }

  v8 = [(IRPolicyManager *)self delegate];
  uint64_t v9 = [(IRPolicyManager *)self spotOnPendingClientIDs];
  int v10 = (void *)[v9 copy];
  [v8 policyManager:self didSpotOnLocationCompleteForClientIds:v10 withError:v4];

  v11 = [(IRPolicyManager *)self spotOnPendingClientIDs];
  [v11 removeAllObjects];

  v12 = [(IRPolicyManager *)self spotOnTimeout];
  [v12 invalidate];

  [(IRPolicyManager *)self setSpotOnTimeout:0];
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v5 = [(IRPolicyManager *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(IRPolicyManager *)self isLowLatencyMiLo];
  id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v8 = (void *)*MEMORY[0x263F50090];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO);
  if (v6 == v3)
  {
    if (v9)
    {
      __int16 v14 = NSNumber;
      __int16 v15 = v8;
      id v16 = [v14 numberWithBool:v3];
      int v17 = 136315650;
      id v18 = "#policy-manager, ";
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_25418E000, v15, OS_LOG_TYPE_INFO, "%s[%@], restartLowLatencyMiLo: %@, nothing to do", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (v9)
    {
      int v10 = NSNumber;
      v11 = v8;
      v12 = objc_msgSend(v10, "numberWithBool:", -[IRPolicyManager isLowLatencyMiLo](self, "isLowLatencyMiLo"));
      int v13 = [NSNumber numberWithBool:v3];
      int v17 = 136315906;
      id v18 = "#policy-manager, ";
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_INFO, "%s[%@], restartLowLatencyMiLo: prev %@, current %@", (uint8_t *)&v17, 0x2Au);
    }
    [(IRPolicyManager *)self setIsLowLatencyMiLo:v3];
    id v7 = [(IRPolicyManager *)self systemStateManager];
    [v7 restartLowLatencyMiLo:v3];
  }
}

- (void)setQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCandidateManager:(id)a3
{
}

- (void)setSystemStateManager:(id)a3
{
}

- (void)setHistoryManager:(id)a3
{
}

- (void)setPolicyEngine:(id)a3
{
}

- (void)setReplayWriter:(id)a3
{
}

- (void)setStatisticsManager:(id)a3
{
}

- (IRMediaRemoteProvider)saredLocalEndpointProvider
{
  return self->_saredLocalEndpointProvider;
}

- (void)setSaredLocalEndpointProvider:(id)a3
{
}

- (NSMutableSet)spotOnPendingClientIDs
{
  return self->_spotOnPendingClientIDs;
}

- (void)setSpotOnPendingClientIDs:(id)a3
{
}

- (IRTimer)spotOnTimeout
{
  return self->_spotOnTimeout;
}

- (void)setSpotOnTimeout:(id)a3
{
}

- (BOOL)isLowLatencyMiLo
{
  return self->_isLowLatencyMiLo;
}

- (void)setIsLowLatencyMiLo:(BOOL)a3
{
  self->_isLowLatencyMiLo = a3;
}

- (void)setService:(id)a3
{
}

- (void)setSessionAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_spotOnTimeout, 0);
  objc_storeStrong((id *)&self->_spotOnPendingClientIDs, 0);
  objc_storeStrong((id *)&self->_saredLocalEndpointProvider, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_replayWriter, 0);
  objc_storeStrong((id *)&self->_policyEngine, 0);
  objc_storeStrong((id *)&self->_historyManager, 0);
  objc_storeStrong((id *)&self->_systemStateManager, 0);
  objc_storeStrong((id *)&self->_candidateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end