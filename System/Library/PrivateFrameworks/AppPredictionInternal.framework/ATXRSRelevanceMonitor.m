@interface ATXRSRelevanceMonitor
- (ATXRSRelevanceMonitor)init;
- (ATXRSRelevanceMonitorDelegate)delegate;
- (BOOL)_isBehavioralRelevanceSatisfiedForCandidate:(id)a3 currentMode:(unint64_t)a4;
- (BOOL)_isDateRelevantContextSatisfied:(id)a3;
- (id)_earliestFutureDateAmongDateRelevantContexts:(id)a3;
- (id)_nonnullEndDateOfDateRelevantContext:(id)a3;
- (void)_coalescedRefreshCurrentlyRelevantCandidates;
- (void)_queue_clearAllCurrentMonitoring;
- (void)_queue_refreshCurrentlyRelevantCandidates;
- (void)_queue_startMonitoringDateRelevantContexts:(id)a3;
- (void)_queue_startMonitoringModeChanges;
- (void)resetToMonitorForRelevantShortcutCandidates:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXRSRelevanceMonitor

- (ATXRSRelevanceMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXRSRelevanceMonitor;
  v2 = [(ATXRSRelevanceMonitor *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ATXRSRelevanceMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F93B98]);
    v7 = v2->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__ATXRSRelevanceMonitor_init__block_invoke;
    v11[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v6 initWithQueue:v7 operation:v11];
    coalescedRefreshCurrentlyRelevantCandidatesOperation = v2->_coalescedRefreshCurrentlyRelevantCandidatesOperation;
    v2->_coalescedRefreshCurrentlyRelevantCandidatesOperation = (_PASSimpleCoalescingTimer *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__ATXRSRelevanceMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue_refreshCurrentlyRelevantCandidates");
  }
  else
  {
    v3 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __29__ATXRSRelevanceMonitor_init__block_invoke_cold_1(v3);
    }
  }
}

- (void)_coalescedRefreshCurrentlyRelevantCandidates
{
}

- (void)_queue_refreshCurrentlyRelevantCandidates
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Refreshing currently relevant candidates...", buf, 2u);
  }

  v3 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: fetching current mode", buf, 2u);
  }

  dispatch_queue_t v4 = [MEMORY[0x1E4F93650] currentModeEvent];
  v5 = [v4 eventBody];
  int v6 = [v5 starting];

  if (v6)
  {
    v7 = [v4 eventBody];
    objc_msgSend(v7, "atx_dndModeSemanticType");

    DNDModeSemanticTypeToATXActivityType();
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:ATXModeFromActivityType()];
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 timestamp];
    v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    v11 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: using last computed mode", buf, 2u);
    }
  }
  else
  {
    v10 = 0;
    uint64_t v8 = 0;
  }
  id v12 = [MEMORY[0x1E4F93658] currentModeEvent];
  v13 = [v12 eventBody];
  int v14 = [v13 isStart];

  if (v14)
  {
    v15 = [v12 eventBody];
    [v15 modeType];
    BMUserFocusInferredModeTypeToActivity();

    id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v12 timestamp];
    v17 = objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
    v18 = v17;
    if (v8 && v10 && [v17 compare:v10] != 1) {
      goto LABEL_21;
    }
    id v19 = v18;

    uint64_t v20 = [NSNumber numberWithUnsignedInteger:ATXModeFromActivityType()];

    uint64_t v21 = [v19 compare:v19];
    v22 = __atxlog_handle_relevant_shortcut();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21 == 1)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        v24 = "ATXRSRelevanceMonitor: overriding computed mode with more recent inferred mode";
LABEL_19:
        _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "ATXRSRelevanceMonitor: using last inferred mode";
      goto LABEL_19;
    }

    v10 = v19;
    uint64_t v8 = (void *)v20;
LABEL_21:
  }
  if ([v8 isEqualToNumber:&unk_1F27F1908])
  {
    v25 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "ATXRSRelevanceMonitor: current mode is custom, returning nil mode";
LABEL_32:
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  v25 = __atxlog_handle_relevant_shortcut();
  BOOL v27 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!v8 || !v10)
  {
    if (v27)
    {
      *(_WORD *)buf = 0;
      v26 = "ATXRSRelevanceMonitor: no current mode";
      goto LABEL_32;
    }
LABEL_33:

    v29 = 0;
    goto LABEL_34;
  }
  if (v27)
  {
    [v8 unsignedIntegerValue];
    v28 = ATXModeToString();
    *(_DWORD *)buf = 138412290;
    uint64_t v93 = (uint64_t)v28;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: current mode is %@", buf, 0xCu);
  }
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v8 second:v10];
LABEL_34:

  v30 = [v29 first];
  uint64_t v73 = [v30 unsignedIntegerValue];

  v31 = [v29 second];
  v32 = +[_ATXGlobals sharedInstance];
  buf[0] = 0;
  double v33 = 0.0;
  if (!CFPreferencesGetAppBooleanValue(@"ATXModeRelevanceDelayDisabled", (CFStringRef)*MEMORY[0x1E4F4B688], buf))
  {
    [v32 behavioralModeRelevanceDelay];
    double v33 = v34;
  }
  [v32 behavioralModeRelevanceDuration];
  double v36 = v35;
  v37 = [v31 dateByAddingTimeInterval:v33];
  v38 = [v37 dateByAddingTimeInterval:v36];
  [v37 timeIntervalSinceNow];
  v72 = v29;
  if (v39 >= 0.0)
  {
    BOOL v81 = 0;
  }
  else
  {
    [v38 timeIntervalSinceNow];
    BOOL v81 = v40 > 0.0;
  }

  v79 = objc_opt_new();
  v78 = objc_opt_new();
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = self->_queue_candidates;
  uint64_t v82 = [(NSArray *)obj countByEnumeratingWithState:&v88 objects:v103 count:16];
  if (v82)
  {
    uint64_t v80 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v89 != v80) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if (v81
          && ([*(id *)(*((void *)&v88 + 1) + 8 * i) relevantContexts],
              v43 = objc_claimAutoreleasedReturnValue(),
              uint64_t v44 = [v43 count],
              v43,
              !v44)
          && [(ATXRSRelevanceMonitor *)self _isBehavioralRelevanceSatisfiedForCandidate:v42 currentMode:v73])
        {
          [v79 addObject:v42];
          v45 = __atxlog_handle_relevant_shortcut();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = [v42 widgetDescriptor];
            v47 = [v46 extensionBundleIdentifier];
            v48 = [v42 widgetDescriptor];
            v49 = [v48 kind];
            v50 = [v42 intent];
            v51 = [v50 intentDescription];
            ATXModeToString();
            id v52 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            uint64_t v93 = (uint64_t)v47;
            __int16 v94 = 2112;
            v95 = v49;
            __int16 v96 = 2112;
            v97 = v51;
            __int16 v98 = 2112;
            id v99 = v52;
            _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Candidate (%@ - %@ - %@) with no providers satisfied behavioral relevance for mode: %@", buf, 0x2Au);

LABEL_67:
          }
        }
        else
        {
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v45 = [v42 relevantContexts];
          uint64_t v53 = [v45 countByEnumeratingWithState:&v84 objects:v102 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v85;
            while (2)
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v85 != v55) {
                  objc_enumerationMutation(v45);
                }
                v57 = *(void **)(*((void *)&v84 + 1) + 8 * j);
                Class v58 = NSClassFromString(&cfstr_Atxdaterelevan.isa);
                id v59 = v57;
                if (v58)
                {
                  if (objc_opt_isKindOfClass()) {
                    v60 = v59;
                  }
                  else {
                    v60 = 0;
                  }
                }
                else
                {
                  v60 = 0;
                }
                id v52 = v60;

                if (v52
                  && [(ATXRSRelevanceMonitor *)self _isDateRelevantContextSatisfied:v52])
                {
                  [v79 addObject:v42];
                  [v78 setObject:v52 forKeyedSubscript:v42];
                  v61 = __atxlog_handle_relevant_shortcut();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    v77 = [v42 widgetDescriptor];
                    v62 = [v77 extensionBundleIdentifier];
                    v76 = [v42 widgetDescriptor];
                    v63 = [v76 kind];
                    v75 = [v42 intent];
                    v64 = [v75 intentDescription];
                    v65 = [v52 startDate];
                    v66 = [v52 endDate];
                    *(_DWORD *)buf = 138413314;
                    uint64_t v93 = (uint64_t)v62;
                    __int16 v94 = 2112;
                    v95 = v63;
                    __int16 v96 = 2112;
                    v97 = v64;
                    __int16 v98 = 2114;
                    id v99 = v65;
                    __int16 v100 = 2114;
                    v101 = v66;
                    _os_log_impl(&dword_1D0FA3000, v61, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Candidate (%@ - %@ - %@) has active date relevant context (start %{public}@, end %{public}@)", buf, 0x34u);
                  }
                  goto LABEL_67;
                }
              }
              uint64_t v54 = [v45 countByEnumeratingWithState:&v84 objects:v102 count:16];
              if (v54) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v82 = [(NSArray *)obj countByEnumeratingWithState:&v88 objects:v103 count:16];
    }
    while (v82);
  }

  v67 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v68 = [v79 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v93 = v68;
    _os_log_impl(&dword_1D0FA3000, v67, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: %lu candidates are currently relevant", buf, 0xCu);
  }

  v69 = [(ATXRSRelevanceMonitor *)self delegate];
  v70 = (void *)[v79 copy];
  v71 = (void *)[v78 copy];
  [v69 relevanceMonitorDidUpdateCurrentlyRelevantCandidates:v70 relevantContexts:v71];
}

- (void)resetToMonitorForRelevantShortcutCandidates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ATXRSRelevanceMonitor_resetToMonitorForRelevantShortcutCandidates___block_invoke;
  v7[3] = &unk_1E68AB870;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __69__ATXRSRelevanceMonitor_resetToMonitorForRelevantShortcutCandidates___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: Reset to monitor for %lu candidates", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_clearAllCurrentMonitoring");
  uint64_t v4 = [*(id *)(a1 + 32) copy];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  v7 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v22 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = [v11 relevantContexts];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
              Class v18 = NSClassFromString(&cfstr_Atxdaterelevan.isa);
              id v19 = v17;
              if (v18)
              {
                if (objc_opt_isKindOfClass()) {
                  uint64_t v20 = v19;
                }
                else {
                  uint64_t v20 = 0;
                }
              }
              else
              {
                uint64_t v20 = 0;
              }
              id v21 = v20;

              if (v21) {
                [v7 addObject:v21];
              }

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  objc_msgSend(*(id *)(v22 + 40), "_queue_startMonitoringDateRelevantContexts:", v7);
  objc_msgSend(*(id *)(v22 + 40), "_queue_startMonitoringModeChanges");
  [*(id *)(v22 + 40) _coalescedRefreshCurrentlyRelevantCandidates];
}

- (void)_queue_clearAllCurrentMonitoring
{
  xpc_activity_unregister("com.apple.duetexpertd.INDateRelevance");
  [(BPSSink *)self->_computedModeSink cancel];
  inferredModeSink = self->_inferredModeSink;
  [(BPSSink *)inferredModeSink cancel];
}

- (void)_queue_startMonitoringDateRelevantContexts:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(ATXRSRelevanceMonitor *)self _earliestFutureDateAmongDateRelevantContexts:a3];
  uint64_t v5 = __atxlog_handle_relevant_shortcut();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: scheduling refresh at %{public}@", buf, 0xCu);
    }

    uint64_t v5 = xpc_dictionary_create(0, 0, 0);
    v7 = (const char *)*MEMORY[0x1E4F14170];
    [v4 timeIntervalSinceNow];
    xpc_dictionary_set_int64(v5, v7, (uint64_t)v8);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], 300);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__ATXRSRelevanceMonitor__queue_startMonitoringDateRelevantContexts___block_invoke;
    v9[3] = &unk_1E68AB3F0;
    v9[4] = self;
    atxRegisterCTSJobHandler("com.apple.duetexpertd.INDateRelevance", v5, v9);
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: not scheduling refresh because all date relevance providers are expired", buf, 2u);
  }
}

uint64_t __68__ATXRSRelevanceMonitor__queue_startMonitoringDateRelevantContexts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _coalescedRefreshCurrentlyRelevantCandidates];
}

- (void)_queue_startMonitoringModeChanges
{
  objc_initWeak(&location, self);
  uint64_t v3 = BiomeLibrary();
  uint64_t v4 = [v3 UserFocus];
  uint64_t v5 = [v4 ComputedMode];
  BOOL v6 = objc_msgSend(v5, "atx_DSLPublisher");

  v7 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.proactive.ATXRSRelevanceMonitor.ComputedMode" targetQueue:self->_queue];
  computedModeScheduler = self->_computedModeScheduler;
  self->_computedModeScheduler = v7;

  uint64_t v9 = [v6 subscribeOn:self->_computedModeScheduler];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_31;
  v23[3] = &unk_1E68AE228;
  objc_copyWeak(&v24, &location);
  uint64_t v10 = [v9 sinkWithCompletion:&__block_literal_global_149 receiveInput:v23];
  computedModeSink = self->_computedModeSink;
  self->_computedModeSink = v10;

  uint64_t v12 = BiomeLibrary();
  uint64_t v13 = [v12 UserFocus];
  uint64_t v14 = [v13 InferredMode];
  uint64_t v15 = objc_msgSend(v14, "atx_DSLPublisher");

  uint64_t v16 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.proactive.ATXRSRelevanceMonitor.InferredMode" targetQueue:self->_queue];
  inferredModeScheduler = self->_inferredModeScheduler;
  self->_inferredModeScheduler = v16;

  Class v18 = [v15 subscribeOn:self->_inferredModeScheduler];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_39;
  v21[3] = &unk_1E68AE228;
  objc_copyWeak(&v22, &location);
  id v19 = [v18 sinkWithCompletion:&__block_literal_global_38_0 receiveInput:v21];
  inferredModeSink = self->_inferredModeSink;
  self->_inferredModeSink = v19;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_cold_1(v2);
    }
  }
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_31(uint64_t a1)
{
  id v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: new event in computed mode stream, refreshing candidates", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _coalescedRefreshCurrentlyRelevantCandidates];
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_36(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_relevant_shortcut();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_36_cold_1(v2);
    }
  }
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_39(uint64_t a1)
{
  id v2 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: new event in inferred mode stream, refreshing candidates", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _coalescedRefreshCurrentlyRelevantCandidates];
}

- (id)_earliestFutureDateAmongDateRelevantContexts:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    id v10 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "startDate", (void)v24);
        [v13 timeIntervalSinceNow];
        double v15 = v14;

        if (v15 > 0.0)
        {
          uint64_t v16 = [v12 startDate];
          uint64_t v17 = [v10 earlierDate:v16];

          id v10 = (id)v17;
        }
        Class v18 = [(ATXRSRelevanceMonitor *)self _nonnullEndDateOfDateRelevantContext:v12];
        [v18 timeIntervalSinceNow];
        if (v19 > 0.0)
        {
          uint64_t v20 = [v10 earlierDate:v18];

          id v10 = (id)v20;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);

    if (v10 != v5)
    {
      id v21 = v10;
      id v22 = v21;
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v22 = 0;
  id v21 = v5;
LABEL_16:

  return v22;
}

- (id)_nonnullEndDateOfDateRelevantContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 endDate];

  if (v4)
  {
    id v5 = [v3 endDate];
  }
  else
  {
    id v6 = [v3 startDate];

    id v5 = [v6 dateByAddingTimeInterval:1800.0];
    id v3 = v6;
  }

  return v5;
}

- (BOOL)_isDateRelevantContextSatisfied:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    uint64_t v9 = [(ATXRSRelevanceMonitor *)self _nonnullEndDateOfDateRelevantContext:v4];
    [v9 timeIntervalSinceNow];
    BOOL v8 = v10 > 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isBehavioralRelevanceSatisfiedForCandidate:(id)a3 currentMode:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 donationBundleIdentifier];
  uint64_t v6 = +[ATXRSWidgetSuggestionProducer replacementContainerBundleIdForDonationBundleId:v5];
  double v7 = (void *)v6;
  if (v6) {
    BOOL v8 = (void *)v6;
  }
  else {
    BOOL v8 = v5;
  }
  id v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v11 doubleForKey:@"ATXModeRelevanceScoreThresholdOverride"];
  double v40 = v11;
  if (v12 == 0.0)
  {
    uint64_t v13 = +[_ATXGlobals sharedInstance];
    [v13 scoreThresholdForBehavioralModeRelevance];
    double v15 = v14;
  }
  else
  {
    double v15 = v12;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F4B178]);
  uint64_t v17 = +[ATXModeEntityScorerServer sharedInstance];
  Class v18 = (void *)[v16 initWithModeEntityScorerClient:v17];

  [v18 rankedAppsForMode:a4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
LABEL_9:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v42 != v22) {
        objc_enumerationMutation(v19);
      }
      long long v24 = *(void **)(*((void *)&v41 + 1) + 8 * v23);
      long long v25 = [v24 bundleId];
      int v26 = [v25 isEqualToString:v9];

      if (v26) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v21) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
    long long v30 = [v24 scoreMetadata];
    [v30 score];
    double v32 = v31;

    double v33 = __atxlog_handle_relevant_shortcut();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    BOOL v28 = v32 > v15;
    if (v32 <= v15)
    {
      uint64_t v29 = v40;
      if (v34)
      {
        double v35 = [v24 scoreMetadata];
        [v35 score];
        *(_DWORD *)buf = 134218242;
        id v46 = v38;
        __int16 v47 = 2112;
        id v48 = v9;
        uint64_t v37 = "ATXRSRelevanceMonitor: score of %f is below threshold for candidate bundleId %@";
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v29 = v40;
      if (v34)
      {
        double v35 = [v24 scoreMetadata];
        [v35 score];
        *(_DWORD *)buf = 134218242;
        id v46 = v36;
        __int16 v47 = 2112;
        id v48 = v9;
        uint64_t v37 = "ATXRSRelevanceMonitor: score of %f is above threshold for candidate bundleId %@";
LABEL_23:
        _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);
      }
    }

    long long v27 = v19;
    goto LABEL_25;
  }
LABEL_15:

  long long v27 = __atxlog_handle_relevant_shortcut();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v9;
    _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "ATXRSRelevanceMonitor: candidate bundleId was not found in ranked entities list: %@", buf, 0xCu);
  }
  BOOL v28 = 0;
  uint64_t v29 = v40;
LABEL_25:

  return v28;
}

- (ATXRSRelevanceMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXRSRelevanceMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inferredModeSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_computedModeSink, 0);
  objc_storeStrong((id *)&self->_computedModeScheduler, 0);
  objc_storeStrong((id *)&self->_coalescedRefreshCurrentlyRelevantCandidatesOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_candidates, 0);
}

void __29__ATXRSRelevanceMonitor_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXRSRelevanceMonitor: couldn't perform update operation because swelf is nil", v1, 2u);
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXRSRelevanceMonitor: error subscribing to computed mode stream: %@", v4, v5, v6, v7, 2u);
}

void __58__ATXRSRelevanceMonitor__queue_startMonitoringModeChanges__block_invoke_36_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXRSRelevanceMonitor: error subscribing to inferred mode stream: %@", v4, v5, v6, v7, 2u);
}

@end