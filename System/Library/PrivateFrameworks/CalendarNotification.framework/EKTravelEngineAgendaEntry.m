@interface EKTravelEngineAgendaEntry
+ (double)fuzzyMaximumInitialUpdateIntervalBeforeStartDate;
- (BOOL)dismissed;
- (BOOL)geocodedEventEncountered;
- (BOOL)hypothesizerSentAtLeastOneHypothesis;
- (BOOL)receivedAlarmNamed:(id)a3;
- (CALNRouteHypothesizer)hypothesizer;
- (CALNRouteHypothesizerProvider)hypothesizerProvider;
- (CLLocation)geoLocation;
- (CalGeocoder)geocoder;
- (EKTravelEngineAgendaEntry)initWithRouteHypothesizerProvider:(id)a3;
- (EKTravelEngineHypothesis)latestHypothesis;
- (EKTravelEngineOriginalEvent)originalEvent;
- (EKTravelEngineOriginalEvent)originalEventInternal;
- (EKTravelEngineThrottle)throttle;
- (NSData)mapKitHandle;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (double)maximumTravelDurationEncountered;
- (id)_createSyntheticHypothesis;
- (id)_generateDestination;
- (id)emissionHypothesisRefreshAlarmName;
- (id)entrySignificantlyChangedBlock;
- (id)requestHypothesisRefreshAlarmName;
- (id)updateBlock;
- (int64_t)travelTimeThresholdExceededState;
- (void)_accountForGeocodedEventEncounter;
- (void)_clearEverything;
- (void)_createEmissionHypothesisRefreshTimerWithDate:(id)a3;
- (void)_createHypothesisRequestRefreshTimerWithDate:(id)a3;
- (void)_createHypothesizerForDestination:(id)a3;
- (void)_emissionHypothesisRefreshTimerFired;
- (void)_enhanceLocation;
- (void)_hypothesisRefreshTimerFired;
- (void)_performAnalyticsPostProcessing;
- (void)_requestHypothesisRefreshTimerFired;
- (void)_sendFeedbackToHypothesizerForPostingNotification:(unint64_t)a3;
- (void)_setUpRouteMonitoring;
- (void)_trackTTLCandidateEvent:(id)a3;
- (void)_uninstallEmissionHypothesisRefreshTimer;
- (void)_uninstallRequestHypothesisRefreshTimer;
- (void)_updateTravelTimeExceededThresholdStateUsingExceededValue:(BOOL)a3;
- (void)_updateWithHypothesis:(id)a3;
- (void)createAlarmWithName:(id)a3 atDate:(id)a4;
- (void)dealloc;
- (void)removeAlarmWithName:(id)a3;
- (void)requestHypothesisRefreshAtDate:(id)a3;
- (void)reset;
- (void)sendFeedbackForPostingLeaveByNotification;
- (void)sendFeedbackForPostingLeaveNowNotification;
- (void)setCallbackQueue:(id)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setEntrySignificantlyChangedBlock:(id)a3;
- (void)setGeoLocation:(id)a3;
- (void)setGeocodedEventEncountered:(BOOL)a3;
- (void)setGeocoder:(id)a3;
- (void)setHypothesizer:(id)a3;
- (void)setHypothesizerSentAtLeastOneHypothesis:(BOOL)a3;
- (void)setLatestHypothesis:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setMaximumTravelDurationEncountered:(double)a3;
- (void)setOriginalEventInternal:(id)a3;
- (void)setThrottle:(id)a3;
- (void)setTravelTimeThresholdExceededState:(int64_t)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateHypothesizerIfNecessaryWithOriginalEvent:(id)a3;
@end

@implementation EKTravelEngineAgendaEntry

- (EKTravelEngineAgendaEntry)initWithRouteHypothesizerProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKTravelEngineAgendaEntry;
  v6 = [(EKTravelEngineAgendaEntry *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hypothesizerProvider, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];

    dispatch_queue_t v10 = dispatch_queue_create(v9, 0);
    [(EKTravelEngineAgendaEntry *)v7 setWorkQueue:v10];

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];

    dispatch_queue_t v13 = dispatch_queue_create(v12, 0);
    [(EKTravelEngineAgendaEntry *)v7 setCallbackQueue:v13];

    [(EKTravelEngineAgendaEntry *)v7 setTravelTimeThresholdExceededState:0];
  }

  return v7;
}

- (void)dealloc
{
  [(EKTravelEngineAgendaEntry *)self _uninstallRequestHypothesisRefreshTimer];
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngineAgendaEntry;
  [(EKTravelEngineAgendaEntry *)&v3 dealloc];
}

- (void)updateHypothesizerIfNecessaryWithOriginalEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Update with original event requested: [%@]. This checks if the event has changed enough to qualify generating another hypothesis.", buf, 0xCu);
  }
  v6 = [(EKTravelEngineAgendaEntry *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke;
  v8[3] = &unk_2645C0DC0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  objc_super v3 = [*(id *)(a1 + 32) originalEventInternal];
  [*v2 setOriginalEventInternal:*(void *)(a1 + 40)];
  id v4 = (os_log_t *)MEMORY[0x263F04B08];
  id v5 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v64 = v6;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Latest Hypothesis [%@]", buf, 0xCu);
  }
  if (v3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(void *)(v7 + 16) || (id v8 = *(void **)(v7 + 88)) == 0 || [v8 state] == 2)
    {
      os_log_t v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(v10 + 16);
        uint64_t v12 = *(void **)(v10 + 88);
        dispatch_queue_t v13 = v9;
        uint64_t v14 = [v12 state];
        *(_DWORD *)buf = 138412802;
        v64 = v11;
        __int16 v65 = 2112;
        v66 = v12;
        __int16 v67 = 2048;
        uint64_t v68 = v14;
        _os_log_impl(&dword_2216BB000, v13, OS_LOG_TYPE_DEFAULT, "There is no hypothesis, or non-functional hypothesizer. Regenerating a new hypothesizer. latestHypothesis:[%@] hypothesizer:[%@] hypothesizer state:[%ld]", buf, 0x20u);
      }
      goto LABEL_12;
    }
    v28 = [*(id *)(*(void *)(a1 + 32) + 16) creationDate];
    if (!v28) {
      goto LABEL_20;
    }
    v29 = [MEMORY[0x263EFF910] date];
    v30 = [*(id *)(*(void *)(a1 + 32) + 16) creationDate];
    [v29 timeIntervalSinceDate:v30];
    BOOL v32 = v31 > 1800.0;

    if (v32)
    {
LABEL_20:
      os_log_t v33 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(void **)(*(void *)(a1 + 32) + 16);
        v35 = v33;
        v36 = [v34 creationDate];
        v37 = *(void **)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138412546;
        v64 = v36;
        __int16 v65 = 2112;
        v66 = v37;
        _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, "Last generated hypothesis is too old. Should hypothesize again. _latestHypothesis.creationDate = %@. _latestHypothesis = %@.", buf, 0x16u);
      }
      goto LABEL_12;
    }
    int v38 = [v3 isEqualToOriginalEvent:*(void *)(a1 + 40)];
    os_log_t v39 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v40 = NSNumber;
      v41 = v39;
      v42 = [v40 numberWithBool:v38 ^ 1u];
      v43 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v64 = v42;
      __int16 v65 = 2112;
      v66 = v43;
      _os_log_impl(&dword_2216BB000, v41, OS_LOG_TYPE_DEFAULT, "Event has significantly changed: [%@].  Original event: [%@]", buf, 0x16u);
    }
    if ((v38 & 1) == 0)
    {
      v44 = [*(id *)(a1 + 32) entrySignificantlyChangedBlock];
      if (v44)
      {
        v45 = [*(id *)(a1 + 32) callbackQueue];
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_10;
        v61[3] = &unk_2645C1220;
        id v46 = v44;
        v61[4] = *(void *)(a1 + 32);
        id v62 = v46;
        dispatch_async(v45, v61);
      }
    }
    v47 = [MEMORY[0x263F04B80] shared];
    int v48 = [v47 performAgendaEntryEqualityChecksInTravelEngine];

    if (v48)
    {
      if (v38) {
        goto LABEL_17;
      }
      goto LABEL_12;
    }
    os_log_t v49 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v64 = v50;
      v16 = "No equality check was performed.  Original event: [%@]";
      v17 = v49;
      uint32_t v18 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    os_log_t v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "There was no previous original event, so event has significantly changed. Should attempt to hypothesize.";
      v17 = v15;
      uint32_t v18 = 2;
LABEL_11:
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
LABEL_12:
  v19 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v64 = v3;
    __int16 v65 = 2112;
    v66 = v20;
    _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Will attempt to hypothesize.  Previous original event: [%@] Original event: [%@]", buf, 0x16u);
  }
  if (v3) {
    [*(id *)(a1 + 32) _clearEverything];
  }
  v21 = objc_alloc_init(EKTravelEngineThrottle);
  [*(id *)(a1 + 32) setThrottle:v21];

  v22 = [*(id *)(a1 + 40) eventExternalURL];
  v23 = [*(id *)(a1 + 32) throttle];
  [v23 setEventExternalURL:v22];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_14;
  v58[3] = &unk_2645C1790;
  objc_copyWeak(&v60, (id *)buf);
  id v59 = *(id *)(a1 + 40);
  v24 = [*(id *)(a1 + 32) throttle];
  [v24 setRequestHypothesisRefreshBlock:v58];

  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2;
  v55[3] = &unk_2645C17B8;
  objc_copyWeak(&v57, (id *)buf);
  id v56 = *(id *)(a1 + 40);
  v25 = [*(id *)(a1 + 32) throttle];
  [v25 setCancelHypothesisRequestRefreshBlock:v55];

  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_18;
  v52[3] = &unk_2645C17B8;
  objc_copyWeak(&v54, (id *)buf);
  id v53 = *(id *)(a1 + 40);
  v26 = [*(id *)(a1 + 32) throttle];
  [v26 setEmissionBlock:v52];

  v27 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_3;
  block[3] = &unk_2645C0D98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v27, block);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v60);
  objc_destroyWeak((id *)buf);
LABEL_17:
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Firing request hypothesis refresh block in travel engine for [%@]", buf, 0xCu);
    }
    uint64_t v7 = [WeakRetained workQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_15;
    v8[3] = &unk_2645C0DC0;
    v8[4] = WeakRetained;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createEmissionHypothesisRefreshTimerWithDate:*(void *)(a1 + 40)];
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Firing cancel hypothesis request block in travel engine for [%@]", buf, 0xCu);
    }
    id v5 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_17;
    block[3] = &unk_2645C0D98;
    block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelEmissionHypothesisRefresh];
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_18(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Firing emission block in travel engine for [%@]", buf, 0xCu);
    }
    id v5 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_19;
    block[3] = &unk_2645C0D98;
    block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_19(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateBlock];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) callbackQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_20;
    v5[3] = &unk_2645C1220;
    id v4 = v2;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(v3, v5);
  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enhanceLocation];
}

- (void)_hypothesisRefreshTimerFired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(EKTravelEngineAgendaEntry *)self hypothesizer];

  if (v3)
  {
    id v4 = (void *)*MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(EKTravelEngineAgendaEntry *)self hypothesizer];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Requesting refresh for hypothesizer, %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [(EKTravelEngineAgendaEntry *)self hypothesizer];
    [v7 requestRefresh];
  }
}

- (void)_requestHypothesisRefreshTimerFired
{
  id v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Request hypothesis refresh timer fired", v4, 2u);
  }
  [(EKTravelEngineAgendaEntry *)self _hypothesisRefreshTimerFired];
  [(EKTravelEngineAgendaEntry *)self _uninstallRequestHypothesisRefreshTimer];
}

- (void)_emissionHypothesisRefreshTimerFired
{
  id v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Emission hypothesis refresh timer fired", v4, 2u);
  }
  [(EKTravelEngineAgendaEntry *)self _hypothesisRefreshTimerFired];
  [(EKTravelEngineAgendaEntry *)self _uninstallEmissionHypothesisRefreshTimer];
}

- (void)requestHypothesisRefreshAtDate:(id)a3
{
  id v5 = a3;
  id v4 = [(EKTravelEngineAgendaEntry *)self hypothesizer];

  if (v4) {
    [(EKTravelEngineAgendaEntry *)self _createHypothesisRequestRefreshTimerWithDate:v5];
  }
}

- (void)createAlarmWithName:(id)a3 atDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 timeIntervalSinceNow];
  if (v7 >= 0.0)
  {
    int64_t v9 = (unint64_t)((ceil(v7) + (double)time(0)) * 1000000000.0);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_date(v10, (const char *)*MEMORY[0x263F300A8], v9);
    [v5 UTF8String];
    xpc_set_event();
  }
  else
  {
    int v8 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_ERROR)) {
      -[EKTravelEngineAgendaEntry createAlarmWithName:atDate:]((uint64_t)v5, (uint64_t)v6, v8);
    }
  }
}

- (void)removeAlarmWithName:(id)a3
{
  [a3 UTF8String];
  xpc_set_event();
}

- (void)_createHypothesisRequestRefreshTimerWithDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(EKTravelEngineAgendaEntry *)self requestHypothesisRefreshAlarmName];
  [(EKTravelEngineAgendaEntry *)self createAlarmWithName:v5 atDate:v4];

  id v6 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    xpc_object_t v10 = self;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Created a new request refresh timer that will fire at: [%@] for entry: [%@]", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_uninstallRequestHypothesisRefreshTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling request refresh timer for agenda entry: [%@].", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(EKTravelEngineAgendaEntry *)self requestHypothesisRefreshAlarmName];
  [(EKTravelEngineAgendaEntry *)self removeAlarmWithName:v4];
}

- (void)_createEmissionHypothesisRefreshTimerWithDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(EKTravelEngineAgendaEntry *)self emissionHypothesisRefreshAlarmName];
  [(EKTravelEngineAgendaEntry *)self createAlarmWithName:v5 atDate:v4];

  id v6 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    xpc_object_t v10 = self;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Created a new emission refresh timer that will fire at: [%@] for entry: [%@]", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_uninstallEmissionHypothesisRefreshTimer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling emission refresh timer for agenda entry: [%@].", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(EKTravelEngineAgendaEntry *)self emissionHypothesisRefreshAlarmName];
  [(EKTravelEngineAgendaEntry *)self removeAlarmWithName:v4];
}

- (void)reset
{
  id v3 = [(EKTravelEngineAgendaEntry *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__EKTravelEngineAgendaEntry_reset__block_invoke;
  block[3] = &unk_2645C0D98;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __34__EKTravelEngineAgendaEntry_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performAnalyticsPostProcessing];
  v2 = *(void **)(a1 + 32);
  return [v2 _clearEverything];
}

- (EKTravelEngineHypothesis)latestHypothesis
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  xpc_object_t v10 = __Block_byref_object_copy__9;
  uint64_t v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  id v3 = [(EKTravelEngineAgendaEntry *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__EKTravelEngineAgendaEntry_latestHypothesis__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EKTravelEngineHypothesis *)v4;
}

void __45__EKTravelEngineAgendaEntry_latestHypothesis__block_invoke(uint64_t a1)
{
}

- (EKTravelEngineOriginalEvent)originalEvent
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  xpc_object_t v10 = __Block_byref_object_copy__9;
  uint64_t v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  id v3 = [(EKTravelEngineAgendaEntry *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__EKTravelEngineAgendaEntry_originalEvent__block_invoke;
  v6[3] = &unk_2645C0FA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EKTravelEngineOriginalEvent *)v4;
}

uint64_t __42__EKTravelEngineAgendaEntry_originalEvent__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) originalEventInternal];
  return MEMORY[0x270F9A758]();
}

+ (double)fuzzyMaximumInitialUpdateIntervalBeforeStartDate
{
  [MEMORY[0x263F04C18] maximumAllowableTravelTime];
  double v3 = v2;
  +[EKTravelEngineThrottle emissionThresholdTimeInterval];
  return v3 + v4;
}

- (void)sendFeedbackForPostingLeaveByNotification
{
}

- (void)sendFeedbackForPostingLeaveNowNotification
{
}

- (void)_accountForGeocodedEventEncounter
{
  if (![(EKTravelEngineAgendaEntry *)self geocodedEventEncountered])
  {
    [(EKTravelEngineAgendaEntry *)self setGeocodedEventEncountered:1];
    CalAnalyticsSendEvent();
    id v3 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    [(EKTravelEngineAgendaEntry *)self _trackTTLCandidateEvent:v3];
  }
}

- (void)_trackTTLCandidateEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 hasPredictedLocation];
  uint64_t v5 = [v3 isOnSharedCalendar];

  id v6 = (void *)MEMORY[0x263F30098];
  [v6 trackTTLCandidateEventHasSuggestedLocation:v4 isOnSharedCalendar:v5];
}

- (void)_updateTravelTimeExceededThresholdStateUsingExceededValue:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(EKTravelEngineAgendaEntry *)self travelTimeThresholdExceededState];
  if (v5 == 3)
  {
    if (v3) {
      return;
    }
  }
  else
  {
    if (v5 != 1)
    {
      if (v5) {
        return;
      }
      if (v3) {
        uint64_t v6 = 3;
      }
      else {
        uint64_t v6 = 1;
      }
      goto LABEL_11;
    }
    if (!v3) {
      return;
    }
  }
  uint64_t v6 = 2;
LABEL_11:
  [(EKTravelEngineAgendaEntry *)self setTravelTimeThresholdExceededState:v6];
}

- (void)_performAnalyticsPostProcessing
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"hypothesizerActivated";
  BOOL v3 = NSNumber;
  uint64_t v4 = [(EKTravelEngineAgendaEntry *)self hypothesizer];
  int64_t v5 = [v3 numberWithInt:v4 != 0];
  v12[0] = v5;
  v11[1] = @"hypothesizerSentHypothesis";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[EKTravelEngineAgendaEntry hypothesizerSentAtLeastOneHypothesis](self, "hypothesizerSentAtLeastOneHypothesis"));
  v12[1] = v6;
  v11[2] = @"travelTimeThresholdExceededState";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[EKTravelEngineAgendaEntry travelTimeThresholdExceededState](self, "travelTimeThresholdExceededState"));
  v12[2] = v7;
  v11[3] = @"maximumTravelDurationEncountered";
  id v8 = NSNumber;
  [(EKTravelEngineAgendaEntry *)self maximumTravelDurationEncountered];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  v12[3] = v9;
  xpc_object_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  CalAnalyticsSendEvent();
}

- (id)requestHypothesisRefreshAlarmName
{
  double v2 = NSNumber;
  BOOL v3 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  uint64_t v4 = [v3 eventExternalURL];
  int64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  uint64_t v6 = [v5 stringValue];

  uint64_t v7 = [NSString stringWithFormat:@"%@agendaEntry-%@", @"com.apple.calaccessd.travelEngine.", v6];

  return v7;
}

- (id)emissionHypothesisRefreshAlarmName
{
  double v2 = NSNumber;
  BOOL v3 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  uint64_t v4 = [v3 eventExternalURL];
  int64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  uint64_t v6 = [v5 stringValue];

  uint64_t v7 = [NSString stringWithFormat:@"%@agendaEntry-emi-%@", @"com.apple.calaccessd.travelEngine.", v6];

  return v7;
}

- (BOOL)receivedAlarmNamed:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(EKTravelEngineAgendaEntry *)self requestHypothesisRefreshAlarmName];
  int v6 = [v4 isEqualToString:v5];

  uint64_t v7 = [(EKTravelEngineAgendaEntry *)self emissionHypothesisRefreshAlarmName];
  int v8 = [v4 isEqualToString:v7];

  if (v6)
  {
    uint64_t v9 = [(EKTravelEngineAgendaEntry *)self workQueue];
    xpc_object_t v10 = v9;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke;
    v14[3] = &unk_2645C0D98;
    v14[4] = self;
    uint64_t v11 = v14;
LABEL_5:
    dispatch_sync(v9, v11);

    return 1;
  }
  if (v8)
  {
    uint64_t v9 = [(EKTravelEngineAgendaEntry *)self workQueue];
    xpc_object_t v10 = v9;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke_2;
    v13[3] = &unk_2645C0D98;
    v13[4] = self;
    uint64_t v11 = v13;
    goto LABEL_5;
  }
  return 0;
}

uint64_t __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestHypothesisRefreshTimerFired];
}

uint64_t __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _emissionHypothesisRefreshTimerFired];
}

- (void)_sendFeedbackToHypothesizerForPostingNotification:(unint64_t)a3
{
  int64_t v5 = [(EKTravelEngineAgendaEntry *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__EKTravelEngineAgendaEntry__sendFeedbackToHypothesizerForPostingNotification___block_invoke;
  v6[3] = &unk_2645C17E0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __79__EKTravelEngineAgendaEntry__sendFeedbackToHypothesizerForPostingNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) hypothesizer];
  if (v2)
  {
    BOOL v3 = (void *)*MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSNumber;
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = v3;
      uint64_t v7 = [v4 numberWithUnsignedInteger:v5];
      int v8 = [*(id *)(a1 + 32) originalEventInternal];
      int v9 = 138412546;
      xpc_object_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Sending UI feedback to the hypothesizer.  Notification type: [%@].  Original event: [%@]", (uint8_t *)&v9, 0x16u);
    }
    [v2 didPostUINotification:*(void *)(a1 + 40)];
  }
}

- (void)_clearEverything
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    int v12 = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Clearing all state in the agenda entry for original event: [%@]", (uint8_t *)&v12, 0xCu);
  }
  [(EKTravelEngineAgendaEntry *)self setLatestHypothesis:0];
  [(EKTravelEngineAgendaEntry *)self setGeoLocation:0];
  [(EKTravelEngineAgendaEntry *)self setMapKitHandle:0];
  [(EKTravelEngineAgendaEntry *)self setTravelTimeThresholdExceededState:0];
  [(EKTravelEngineAgendaEntry *)self setHypothesizerSentAtLeastOneHypothesis:0];
  [(EKTravelEngineAgendaEntry *)self setMaximumTravelDurationEncountered:0.0];
  int v6 = [(EKTravelEngineAgendaEntry *)self geocoder];
  [v6 cancel];

  [(EKTravelEngineAgendaEntry *)self setGeocoder:0];
  uint64_t v7 = [(EKTravelEngineAgendaEntry *)self hypothesizer];
  [v7 stopHypothesizing];

  [(EKTravelEngineAgendaEntry *)self setHypothesizer:0];
  int v8 = [(EKTravelEngineAgendaEntry *)self hypothesizerProvider];
  int v9 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  xpc_object_t v10 = [v9 eventExternalURL];
  [v8 removedRouteHypothesizerForEventExternalURL:v10];

  __int16 v11 = [(EKTravelEngineAgendaEntry *)self throttle];
  [v11 tearDown];

  [(EKTravelEngineAgendaEntry *)self setThrottle:0];
  [(EKTravelEngineAgendaEntry *)self _uninstallRequestHypothesisRefreshTimer];
}

- (void)_enhanceLocation
{
  v41[4] = *MEMORY[0x263EF8340];
  double v2 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  BOOL v3 = [v2 locationMapKitHandle];
  BOOL v4 = v3 != 0;

  uint64_t v5 = [v2 geoLocation];

  uint64_t v6 = [v2 locationIsAConferenceRoom];
  uint64_t v7 = [v2 automaticGeocodingAllowed];
  v40[0] = @"hasLocationMapKitHandle";
  int v8 = [NSNumber numberWithBool:v4];
  v41[0] = v8;
  v40[1] = @"hasGeoLocation";
  int v9 = [NSNumber numberWithBool:v5 != 0];
  v41[1] = v9;
  v40[2] = @"locationIsAConferenceRoom";
  xpc_object_t v10 = [NSNumber numberWithBool:v6];
  v41[2] = v10;
  v40[3] = @"automaticGeocodingAllowed";
  __int16 v11 = [NSNumber numberWithBool:v7];
  v41[3] = v11;
  int v12 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
  uint64_t v13 = (void *)[v12 mutableCopy];

  uint64_t v14 = (os_log_t *)MEMORY[0x263F04B08];
  os_log_t v15 = *MEMORY[0x263F04B08];
  BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      os_log_t v39 = v2;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "A map handle already exists on the event.  Will not enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    v17 = [v2 locationMapKitHandle];
    [(EKTravelEngineAgendaEntry *)self setMapKitHandle:v17];

    [(EKTravelEngineAgendaEntry *)self _setUpRouteMonitoring];
    CalAnalyticsSendEvent();
  }
  else if (v5)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      os_log_t v39 = v2;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "A geolocation already exists on the event.  Will not enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    uint32_t v18 = [v2 geoLocation];
    [(EKTravelEngineAgendaEntry *)self setGeoLocation:v18];

    [(EKTravelEngineAgendaEntry *)self _setUpRouteMonitoring];
    CalAnalyticsSendEvent();
  }
  else if (v6)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      os_log_t v39 = v2;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "The location is a conference room without structured location information.  Will not proceed to monitor route.  Original event: [%@].", buf, 0xCu);
    }
    CalAnalyticsSendEvent();
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      os_log_t v39 = v2;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "No map handle or geolocation exists on the event.  Will enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    if ([v2 automaticGeocodingAllowed])
    {
      id v19 = objc_alloc_init(MEMORY[0x263F30070]);
      [v19 start];
      v20 = [v2 locationString];
      if ([v2 hasPredictedLocation])
      {
        uint64_t v21 = [v2 locationStringWithoutPrediction];

        v20 = (void *)v21;
      }
      id v22 = objc_alloc(MEMORY[0x263F30038]);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke;
      v30[3] = &unk_2645C1830;
      id v23 = v19;
      id v31 = v23;
      objc_copyWeak(&v36, &location);
      id v32 = v2;
      id v33 = v13;
      v34 = @"travelEngine.enhanceLocation";
      id v24 = v20;
      id v35 = v24;
      v25 = (void *)[v22 initWithLocationString:v24 andCompletionBlock:v30];
      [(EKTravelEngineAgendaEntry *)self setGeocoder:v25];

      v26 = [(EKTravelEngineAgendaEntry *)self geocoder];
      [v26 startGeocoding];

      objc_destroyWeak(&v36);
      v27 = v13;
    }
    else
    {
      v27 = v13;
      v28 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_log_t v39 = v2;
        _os_log_impl(&dword_2216BB000, v28, OS_LOG_TYPE_DEFAULT, "Automatic geocoding is not allowed yet. We will not attempt to geocode for this event [%@]", buf, 0xCu);
      }
    }
    objc_destroyWeak(&location);
    uint64_t v13 = v27;
  }
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [a1[4] stop];
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2;
    v10[3] = &unk_2645C1808;
    id v11 = a1[4];
    id v12 = a1[5];
    id v13 = v6;
    id v14 = v5;
    id v15 = a1[6];
    id v16 = a1[7];
    id v17 = a1[8];
    uint32_t v18 = v8;
    dispatch_async(v9, v10);
  }
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  unint64_t v2 = [*(id *)(a1 + 32) elapsedTimeAsNumber:2];
  BOOL v3 = (os_log_t *)MEMORY[0x263F04B08];
  BOOL v4 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSNumber;
    id v6 = v4;
    uint64_t v7 = [v5 numberWithDouble:(double)v2 / 1000.0];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v41 = v7;
    __int16 v42 = 2112;
    uint64_t v43 = v8;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Geocoding complete.  Elapsed time: [%@] ms.  Original event: [%@]", buf, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v11 = [NSNumber numberWithBool:v10 != 0];
  [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:@"gotError"];

  id v12 = [NSNumber numberWithBool:v9 != 0];
  [*(id *)(a1 + 64) setObject:v12 forKeyedSubscript:@"gotResult"];

  if (v10)
  {
    id v13 = [*(id *)(a1 + 48) domain];
    [*(id *)(a1 + 64) setObject:v13 forKeyedSubscript:@"errorDomain"];

    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
    [*(id *)(a1 + 64) setObject:v14 forKeyedSubscript:@"errorCode"];

    CalAnalyticsSendEvent();
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_1();
    }
    return;
  }
  CalAnalyticsSendEvent();
  id v15 = *v3;
  BOOL v16 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v16)
    {
      id v17 = *(void **)(a1 + 80);
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v41 = v17;
      __int16 v42 = 2112;
      uint64_t v43 = v18;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Map item found after geocoding.  Location string: [%@].  Map item: [%@]", buf, 0x16u);
    }
    id v19 = [*(id *)(a1 + 56) _handle];
    [*(id *)(a1 + 88) setMapKitHandle:v19];

    v20 = [*(id *)(a1 + 56) placemark];
    uint64_t v21 = [v20 location];
    [*(id *)(a1 + 88) setGeoLocation:v21];

    id v22 = (void **)(a1 + 40);
    id v23 = [*(id *)(a1 + 40) eventExternalURL];
    if (v23)
    {
      id v24 = [MEMORY[0x263F04B80] shared];
      char v25 = [v24 saveGeocodedLocationsInTravelEngine];

      if (v25)
      {
        v26 = [NSURL URLWithString:v23];
        id v27 = objc_alloc_init(MEMORY[0x263F04B98]);
        v28 = [v27 _eventWithURI:v26 checkValid:0];
        uint64_t v29 = *(void *)(a1 + 56);
        id v39 = 0;
        int v30 = [v28 updateWithGeocodedMapItemAndSaveWithCommit:v29 eventStore:v27 error:&v39];
        id v31 = v39;
        id v32 = *v3;
        if (v30)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = *v22;
            *(_DWORD *)buf = 138412290;
            v41 = v33;
            _os_log_impl(&dword_2216BB000, v32, OS_LOG_TYPE_DEFAULT, "Saved geocoding result to the database successfully. Original event: [%@].", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_2();
        }

        goto LABEL_25;
      }
      id v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = *v22;
        *(_DWORD *)buf = 138412290;
        v41 = v38;
        v37 = "'saveGeocodedLocationsInTravelEngine' set to 'NO.'  Will not save geocoding result to the database. Original event: [%@].";
        goto LABEL_21;
      }
    }
    else
    {
      id v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = *v22;
        *(_DWORD *)buf = 138412290;
        v41 = v36;
        v37 = "No event external URL found.  Will not save geocoding result to the database. Original event: [%@].";
LABEL_21:
        _os_log_impl(&dword_2216BB000, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
      }
    }
LABEL_25:
    [*(id *)(a1 + 88) _setUpRouteMonitoring];

    return;
  }
  if (v16)
  {
    v34 = *(void **)(a1 + 80);
    *(_DWORD *)buf = 138412290;
    v41 = v34;
    _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "No geocoding results found.  Will not proceed to monitor route.  Location string: [%@].", buf, 0xCu);
  }
  [*(id *)(a1 + 88) setDismissed:1];
}

- (void)_setUpRouteMonitoring
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = (os_log_t *)MEMORY[0x263F04B08];
  BOOL v4 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Setting up route monitoring.  Original event: [%@]", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v7 = [(EKTravelEngineAgendaEntry *)self _generateDestination];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F04B80] shared];
    int v9 = [v8 overrideTravelAdvisoryHypothesis];

    if (!v9)
    {
      [(EKTravelEngineAgendaEntry *)self _accountForGeocodedEventEncounter];
      [(EKTravelEngineAgendaEntry *)self _createHypothesizerForDestination:v7];
      goto LABEL_10;
    }
    uint64_t v10 = [(EKTravelEngineAgendaEntry *)self _createSyntheticHypothesis];
    [(EKTravelEngineAgendaEntry *)self _updateWithHypothesis:v10];
    goto LABEL_8;
  }
  os_log_t v11 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v11;
    id v12 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    int v13 = 138412290;
    id v14 = v12;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "No map handle or geolocation found.  Will not monitor routing for event.  Original event: [%@]", (uint8_t *)&v13, 0xCu);

LABEL_8:
  }
LABEL_10:
}

- (id)_generateDestination
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(EKTravelEngineAgendaEntry *)self mapKitHandle];

  if (v3)
  {
    BOOL v4 = (void *)*MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
      int v24 = 138412290;
      char v25 = v6;
      _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Found map handle.  Will use to generate destination.  Original event: [%@]", (uint8_t *)&v24, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x263F41B88]);
    uint64_t v8 = [(EKTravelEngineAgendaEntry *)self mapKitHandle];
    int v9 = (void *)[v7 initWithMapItemHandle:v8];

    if (!v9) {
      goto LABEL_11;
    }
LABEL_10:
    v20 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    uint64_t v21 = [v20 startDate];
    [v9 setArrivalDate:v21];

    id v22 = [v20 endDate];
    [v9 setExpirationDate:v22];

    objc_msgSend(v9, "setTransportType:", objc_msgSend(v20, "transportTypeOverride"));
    goto LABEL_11;
  }
  int v9 = [(EKTravelEngineAgendaEntry *)self geoLocation];

  if (v9)
  {
    uint64_t v10 = [(EKTravelEngineAgendaEntry *)self geoLocation];
    [v10 coordinate];
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = (void *)*MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = v15;
      id v17 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
      uint64_t v18 = [NSNumber numberWithDouble:v12];
      id v19 = [NSNumber numberWithDouble:v14];
      int v24 = 138412802;
      char v25 = v17;
      __int16 v26 = 2112;
      id v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_2216BB000, v16, OS_LOG_TYPE_DEFAULT, "Found geolocation.  Will use for route monitoring.  Original event: [%@].  Geocoordinates - Latitude: [%@], Longitude: [%@]", (uint8_t *)&v24, 0x20u);
    }
    int v9 = objc_msgSend(objc_alloc(MEMORY[0x263F41B88]), "initWithCoordinate:", v12, v14);
    if (v9) {
      goto LABEL_10;
    }
  }
LABEL_11:
  return v9;
}

- (id)_createSyntheticHypothesis
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    id v5 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    *(_DWORD *)buf = 138412290;
    id v36 = v5;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Creating a synthetic hypothesis.  Original event: [%@]", buf, 0xCu);
  }
  id v6 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  id v7 = [v6 startDate];

  uint64_t v8 = [MEMORY[0x263F04B80] shared];
  [v8 overriddenTravelAdvisoryHypothesisConservativeTravelTime];
  double v10 = v9;

  double v11 = [MEMORY[0x263F04B80] shared];
  [v11 overriddenTravelAdvisoryHypothesisEstimatedTravelTime];
  double v13 = v12;

  double v14 = [MEMORY[0x263F04B80] shared];
  [v14 overriddenTravelAdvisoryHypothesisAggressiveTravelTime];
  double v16 = v15;

  id v17 = [MEMORY[0x263F04C10] syntheticHypothesisWithStartDate:v7 conservativeTravelTime:v10 estimatedTravelTime:v13 aggressiveTravelTime:v16];
  uint64_t v18 = (void *)[v17 mutableCopy];

  id v19 = [MEMORY[0x263F04B80] shared];
  v20 = [v19 overriddenTravelAdvisoryHypothesisTransportType];

  uint64_t v21 = [MEMORY[0x263F04C18] geoTransportTypeForString:v20];
  id v22 = [MEMORY[0x263F04B80] shared];
  id v23 = [v22 overriddenTravelAdvisoryHypothesisRouteName];

  int v24 = [MEMORY[0x263F04B80] shared];
  uint64_t v25 = [v24 overriddenTravelAdvisoryHypothesisSupportsLiveTraffic];

  __int16 v26 = [MEMORY[0x263F04B80] shared];
  id v27 = [v26 overriddenTravelAdvisoryHypothesisCurrentTrafficDensity];

  uint64_t v28 = [MEMORY[0x263F04C18] geoTrafficDensityForString:v27];
  uint64_t v29 = [MEMORY[0x263F04B80] shared];
  uint64_t v30 = [v29 overriddenTravelAdvisoryHypothesisTravelState];

  uint64_t v31 = [MEMORY[0x263F04C18] geoRouteHypothesisTravelStateForString:v30];
  [v18 setTransportType:v21];
  [v18 setRouteName:v23];
  [v18 setSupportsLiveTraffic:v25];
  [v18 setCurrentTrafficDensity:v28];
  [v18 setTravelState:v31];
  id v32 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v18;
    _os_log_impl(&dword_2216BB000, v32, OS_LOG_TYPE_DEFAULT, "Created a synthetic hypothesis: [%@]", buf, 0xCu);
  }
  id v33 = (void *)[v18 copy];

  return v33;
}

- (void)_createHypothesizerForDestination:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(EKTravelEngineAgendaEntry *)self hypothesizerProvider];
  id v6 = [v5 hypothesizerForPlannedDestination:v4];

  [(EKTravelEngineAgendaEntry *)self setHypothesizer:v6];
  id v7 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    double v9 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
    *(_DWORD *)buf = 138412802;
    id v22 = v4;
    __int16 v23 = 2112;
    int v24 = v9;
    __int16 v25 = 2112;
    __int16 v26 = v6;
    _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "Creating hypothesizer to monitor routing.  Destination: [%@] Original event: [%@] Hypothesizer: [%@]", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  double v15 = __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke;
  double v16 = &unk_2645C1880;
  objc_copyWeak(&v18, (id *)buf);
  objc_copyWeak(&v19, &location);
  id v17 = self;
  [v6 startHypothesizingWithUpdateHandler:&v13];
  double v10 = [(EKTravelEngineAgendaEntry *)self hypothesizerProvider];
  double v11 = [(EKTravelEngineAgendaEntry *)self originalEventInternal];
  double v12 = [v11 eventExternalURL];
  [v10 createdRouteHypothesizer:v6 forEventExternalURL:v12];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v4 = [WeakRetained state];
    id v5 = [v3 currentHypothesis];
    id v6 = (os_log_t *)MEMORY[0x263F04B08];
    id v7 = (id)*MEMORY[0x263F04B08];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v4);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v8 = off_2645C18A0[v4];
      }
      double v10 = v8;
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      double v12 = [v11 originalEventInternal];
      *(_DWORD *)buf = 138412802;
      __int16 v26 = v8;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v5;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Hypothesizer updated to state: [%@].  Original event: [%@]. Hypothesis: [%@]", buf, 0x20u);
    }
    if (v4 == 4)
    {
      os_log_t v13 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        id v15 = objc_loadWeakRetained((id *)(a1 + 48));
        double v16 = [v15 originalEventInternal];
        *(_DWORD *)buf = 138412290;
        __int16 v26 = v16;
        _os_log_impl(&dword_2216BB000, v14, OS_LOG_TYPE_DEFAULT, "Done hypothesizing for original event: [%@]", buf, 0xCu);
      }
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)(a1 + 48));
      id v18 = [v17 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke_83;
      block[3] = &unk_2645C1858;
      objc_copyWeak(&v24, (id *)(a1 + 48));
      id v19 = v5;
      uint64_t v20 = *(void *)(a1 + 32);
      id v22 = v19;
      uint64_t v23 = v20;
      dispatch_async(v18, block);

      objc_destroyWeak(&v24);
    }
  }
  else
  {
    double v9 = *MEMORY[0x263F04B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Hypothesizer is gone.  Returning early.", buf, 2u);
    }
  }
}

void __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke_83(id *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v2 = (os_log_t *)MEMORY[0x263F04B08];
  BOOL v3 = (void *)*MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = v3;
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v6 = [WeakRetained originalEventInternal];
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_2216BB000, v4, OS_LOG_TYPE_DEFAULT, "Analyzing hypothesis for original event: [%@]", (uint8_t *)&v17, 0xCu);
  }
  if (a1[4])
  {
    id v7 = objc_loadWeakRetained(a1 + 6);
    [v7 setHypothesizerSentAtLeastOneHypothesis:1];

    [a1[4] conservativeTravelTime];
    double v9 = v8;
    [MEMORY[0x263F04C18] maximumAllowableTravelTime];
    BOOL v11 = v9 > v10;
    double v12 = (void *)[a1[4] copy];
    [a1[5] maximumTravelDurationEncountered];
    if (v13 < v9) {
      double v13 = v9;
    }
    [a1[5] setMaximumTravelDurationEncountered:v13];
    id v14 = objc_loadWeakRetained(a1 + 6);
    [v14 _updateTravelTimeExceededThresholdStateUsingExceededValue:v11];
  }
  else
  {
    id v15 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_2216BB000, v15, OS_LOG_TYPE_DEFAULT, "Not updating the latestHypothesis because the hypothesis is nil.", (uint8_t *)&v17, 2u);
    }
    double v12 = 0;
  }
  id v16 = objc_loadWeakRetained(a1 + 6);
  [v16 _updateWithHypothesis:v12];
}

- (void)_updateWithHypothesis:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = (EKTravelEngineHypothesis *)a3;
  id v6 = *MEMORY[0x263F04B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F04B08], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    double v13 = v5;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Updating agenda entry with hypothesis: [%@]. Agenda entry: [%@].", (uint8_t *)&v12, 0x16u);
  }
  if (self->_latestHypothesis != v5)
  {
    objc_storeStrong((id *)&self->_latestHypothesis, a3);
    id v7 = [(EKTravelEngineAgendaEntry *)self throttle];
    double v8 = [(EKTravelEngineHypothesis *)v5 conservativeDepartureDate];
    [v7 updatePredictedDepartureDate:v8];

    if (!v5) {
      goto LABEL_8;
    }
    double v9 = [(EKTravelEngineHypothesis *)v5 conservativeDepartureDate];
    if (v9
      || ([(EKTravelEngineHypothesis *)v5 suggestedDepartureDate],
          (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_10:

      goto LABEL_11;
    }
    double v10 = [(EKTravelEngineHypothesis *)v5 aggressiveDepartureDate];

    if (!v10)
    {
LABEL_8:
      uint64_t v11 = [(EKTravelEngineAgendaEntry *)self updateBlock];
      double v9 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, EKTravelEngineAgendaEntry *))(v11 + 16))(v11, self);
      }
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)setLatestHypothesis:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)entrySignificantlyChangedBlock
{
  return self->_entrySignificantlyChangedBlock;
}

- (void)setEntrySignificantlyChangedBlock:(id)a3
{
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (EKTravelEngineOriginalEvent)originalEventInternal
{
  return self->_originalEventInternal;
}

- (void)setOriginalEventInternal:(id)a3
{
}

- (EKTravelEngineThrottle)throttle
{
  return self->_throttle;
}

- (void)setThrottle:(id)a3
{
}

- (CalGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
}

- (CALNRouteHypothesizerProvider)hypothesizerProvider
{
  return self->_hypothesizerProvider;
}

- (CALNRouteHypothesizer)hypothesizer
{
  return self->_hypothesizer;
}

- (void)setHypothesizer:(id)a3
{
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setGeoLocation:(id)a3
{
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
}

- (BOOL)geocodedEventEncountered
{
  return self->_geocodedEventEncountered;
}

- (void)setGeocodedEventEncountered:(BOOL)a3
{
  self->_geocodedEventEncountered = a3;
}

- (BOOL)hypothesizerSentAtLeastOneHypothesis
{
  return self->_hypothesizerSentAtLeastOneHypothesis;
}

- (void)setHypothesizerSentAtLeastOneHypothesis:(BOOL)a3
{
  self->_hypothesizerSentAtLeastOneHypothesis = a3;
}

- (int64_t)travelTimeThresholdExceededState
{
  return self->_travelTimeThresholdExceededState;
}

- (void)setTravelTimeThresholdExceededState:(int64_t)a3
{
  self->_travelTimeThresholdExceededState = a3;
}

- (double)maximumTravelDurationEncountered
{
  return self->_maximumTravelDurationEncountered;
}

- (void)setMaximumTravelDurationEncountered:(double)a3
{
  self->_maximumTravelDurationEncountered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_hypothesizer, 0);
  objc_storeStrong((id *)&self->_hypothesizerProvider, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
  objc_storeStrong((id *)&self->_originalEventInternal, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_entrySignificantlyChangedBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_latestHypothesis, 0);
}

- (void)createAlarmWithName:(NSObject *)a3 atDate:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)BOOL v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, a2, a3, "Ignoring attempt to set alarm named %{public}@ for a date in the past (%{public}@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Encountered error while geocoding.  Will not proceed to monitor route.  Location string: [%@] Error: [%@].");
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_0(&dword_2216BB000, v0, v1, "Failed to save the geocoding result to the database successfully. Original event: [%@].  Error: [%@]");
}

@end