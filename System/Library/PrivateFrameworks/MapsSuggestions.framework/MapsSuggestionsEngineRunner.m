@interface MapsSuggestionsEngineRunner
- (MapsSuggestionsEngine)engine;
- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 maxEntries:(unint64_t)a9;
- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12;
- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13;
- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13 stopRunTimerClass:(Class)a14;
- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 runTimeLeeway:(double)a8 sleepTimeLeeway:(double)a9 maxEntries:(unint64_t)a10 nilledWhenAsleep:(BOOL)a11;
- (MapsSuggestionsTimer)wakeUpTimer;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)nameForJSON;
- (id)objectForJSON;
- (uint64_t)_q_passedAllConditions;
- (void)_q_fetchEntries;
- (void)_q_scheduleWakeUp;
- (void)_q_sendStateForStep:(uint64_t)a1;
- (void)_q_startRunBecauseOfTrigger:(uint64_t)a1;
- (void)_q_updateMinSleep;
- (void)addCondition:(id)a3;
- (void)addConditions:(id)a3;
- (void)addPostFilter:(id)a3;
- (void)addTrigger:(id)a3;
- (void)addTriggers:(id)a3;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeCondition:(id)a3;
- (void)removeConditions:(id)a3;
- (void)removeTrigger:(id)a3;
- (void)removeTriggers:(id)a3;
- (void)runASAP;
- (void)scheduleNextRun;
- (void)triggerFired:(id)a3;
@end

@implementation MapsSuggestionsEngineRunner

void __51__MapsSuggestionsEngineRunner__q_sendStateForStep___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [v3 engineRunner:WeakRetained step:*(void *)(a1 + 32) jsonDict:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      v7 = "MapsSuggestionsEngineRunner.mm";
      __int16 v8 = 1026;
      int v9 = 749;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsEngineRunner _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __44__MapsSuggestionsEngineRunner_triggerFired___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    v4 = [v3 uniqueName];
    uint64_t v5 = [v4 copy];
    int v6 = *(void **)(a2 + 168);
    *(void *)(a2 + 168) = v5;

    if (MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160)))
    {
      if (GEOConfigGetBOOL())
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
        if (*(double *)(a2 + 80) != 0.0)
        {
          BOOL v7 = MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160));
          GEOFindOrCreateLog();
          double v8 = (double)v7;
          int v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            __int16 v10 = [(id)a2 uniqueName];
            v11 = *(void **)(a2 + 104);
            int v22 = 138412802;
            v23 = v10;
            __int16 v24 = 2048;
            double v25 = v8;
            __int16 v26 = 2048;
            v27 = v11;
            _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_scheduleASAPWakeUp in %.3f sec (+ %.3f sec)", (uint8_t *)&v22, 0x20u);
          }
          [*(id *)(a2 + 192) scheduleWithInterval:(uint64_t)(v8 * 1000000000.0) leeway:(uint64_t)(*(double *)(a2 + 104) * 1000000000.0)];
          -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a2, @"willSleep");
        }
        GEOFindOrCreateLog();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = [(id)a2 uniqueName];
          double v18 = *(double *)(a2 + 160);
          v19 = [v3 uniqueName];
          int v22 = 138412802;
          v23 = v17;
          __int16 v24 = 2112;
          double v25 = v18;
          __int16 v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{%@} is within the minSleepTime window. Will run after %@. Ignoring Trigger: %@", (uint8_t *)&v22, 0x20u);
        }
      }
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a2, @"ignoredTrigger");
LABEL_19:
      v20 = *(void **)(a2 + 168);
      *(void *)(a2 + 168) = 0;

      v21 = *(void **)(a2 + 176);
      *(void *)(a2 + 176) = 0;

      goto LABEL_20;
    }
    if ((-[MapsSuggestionsEngineRunner _q_passedAllConditions](a2) & 1) == 0)
    {
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(id)a2 uniqueName];
        int v22 = 138412290;
        v23 = v15;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Continuing sleep.", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_19;
    }
    -[MapsSuggestionsEngineRunner _q_updateMinSleep](a2);
    GEOFindOrCreateLog();
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [(id)a2 uniqueName];
      int v22 = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", (uint8_t *)&v22, 0xCu);
    }
    -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:](a2, v3);
  }
LABEL_20:
}

- (void)_q_sendStateForStep:(uint64_t)a1
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  id v36 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v76[0] = @"now";
  MapsSuggestionsNow();
  val = (void *)a1;
  v40 = (MSg *)objc_claimAutoreleasedReturnValue();
  uint64_t v77 = MSg::jsonFor(v40, v3);
  v76[1] = @"location";
  uint64_t v38 = v77;
  MapsSuggestionsCurrentBestLocation();
  v42 = (MSg *)objc_claimAutoreleasedReturnValue();
  uint64_t v78 = MSg::jsonFor(v42, v4);
  v76[2] = @"minSilenceDate";
  v32 = v64;
  uint64_t v44 = v78;
  uint64_t v79 = MSg::jsonFor(v64, v5);
  v76[3] = @"earliestRunDate";
  v30 = v65;
  uint64_t v46 = v79;
  uint64_t v7 = MSg::jsonFor(v65, v6);
  uint64_t v80 = v7;
  v76[4] = @"stopRunTimer";
  id v8 = v68;
  uint64_t v48 = v7;
  v57 = v8;
  if (v8) {
    [v8 objectForJSON];
  }
  else {
  v58 = [MEMORY[0x1E4F1CA98] null];
  }

  v81 = v58;
  v76[5] = @"wakeUpTimer";
  id v9 = v69;
  __int16 v10 = v9;
  if (v9) {
    [v9 objectForJSON];
  }
  else {
  v59 = [MEMORY[0x1E4F1CA98] null];
  }

  v82 = v59;
  v76[6] = @"entries";
  v34 = v70;
  uint64_t v50 = MSg::jsonFor(v70);
  uint64_t v83 = v50;
  v76[7] = @"firedTriggerName";
  uint64_t v28 = v66;
  uint64_t v52 = MSg::jsonFor(v66);
  uint64_t v84 = v52;
  v76[8] = @"failedConditionName";
  __int16 v26 = v67;
  uint64_t v54 = MSg::jsonFor(v67);
  uint64_t v85 = v54;
  v76[9] = @"conditions";
  id v11 = v71[11];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count", v26, v28, v30, v32, v34, v36, v38, v40, v42, v44, v46, v48, v50, v52,
                      v54));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v72 objects:location count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v73 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v72 + 1) + 8 * i);
          double v18 = v17;
          if (v17) {
            [v17 objectForJSON];
          }
          else {
          v19 = [MEMORY[0x1E4F1CA98] null];
          }

          v20 = [v18 nameForJSON];
          [v12 setObject:v19 forKeyedSubscript:v20];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v72 objects:location count:16];
      }
      while (v14);
    }

    v21 = (void *)[v12 copy];
  }
  else
  {
    v21 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v26, v28, v30, v32, v34, v36, v38, v40, v42, v44, v46, v48, v50, v52, v54);
  }

  v86 = v21;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:v76 count:10];

  objc_initWeak(location, val);
  v23 = (void *)val[6];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __51__MapsSuggestionsEngineRunner__q_sendStateForStep___block_invoke;
  v60[3] = &unk_1E5CBA9E0;
  objc_copyWeak(&v63, location);
  id v24 = v37;
  id v61 = v24;
  id v62 = v22;
  id v25 = v22;
  [v23 callBlock:v60];

  objc_destroyWeak(&v63);
  objc_destroyWeak(location);
}

- (void)triggerFired:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    uint64_t v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} fired TRIGGER{%@}!", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MapsSuggestionsEngineRunner_triggerFired___block_invoke;
  v9[3] = &unk_1E5CBA968;
  id v8 = v4;
  id v10 = v8;
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, v9);
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13 stopRunTimerClass:(Class)a14
{
  id v26 = a3;
  id v27 = a4;
  v79.receiver = self;
  v79.super_class = (Class)MapsSuggestionsEngineRunner;
  uint64_t v28 = [(MapsSuggestionsEngineRunner *)&v79 init];
  if (v28)
  {
    id v71 = v26;
    id v72 = v27;
    v29 = (void *)[[NSString alloc] initWithFormat:@"%@Queue", v27];
    unint64_t v69 = a11;
    BOOL v70 = a12;
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)&location, v29, v30);
    v31 = (OS_dispatch_queue *)location;
    id location = 0;
    innerQueue = v28->_queue._innerQueue;
    v28->_queue._innerQueue = v31;

    v33 = v78;
    uint64_t v78 = 0;
    name = v28->_queue._name;
    v28->_queue._name = v33;

    uint64_t v35 = [v27 copy];
    id v68 = a14;
    id v36 = (NSArray *)v26;
    v37 = [MapsSuggestionsObservers alloc];
    uint64_t v38 = v28->_queue._innerQueue;
    v39 = (void *)[[NSString alloc] initWithFormat:@"%@Observers", v27];
    uint64_t v40 = [(MapsSuggestionsObservers *)v37 initWithCallbackQueue:v38 name:v39];
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v42 = a13;
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    circuits = v28->_config.circuits;
    v28->_config.circuits = (NSArray *)v35;

    triggers = v28->_config.triggers;
    v28->_config.triggers = v36;

    conditions = v28->_config.conditions;
    v28->_config.conditions = (NSArray *)v40;

    uint64_t v48 = *(void **)v28->_anon_38;
    *(void *)v28->_anon_38 = 0;

    *(double *)&v28->_anon_38[8] = a5;
    *(double *)&v28->_anon_38[16] = a6;
    *(double *)&v28->_anon_38[24] = a7;
    *(double *)&v28->_anon_38[32] = a8;
    *(double *)&v28->_anon_38[40] = a9;
    *(double *)&v28->_anon_38[48] = a10;
    v49 = *(void **)&v28->_anon_38[56];
    *(void *)&v28->_anon_38[56] = v41;

    uint64_t v50 = *(void **)&v28->_anon_38[64];
    *(void *)&v28->_anon_38[64] = v43;

    v51 = *(void **)&v28->_anon_38[72];
    *(void *)&v28->_anon_38[72] = v44;

    *(void *)&v28->_anon_38[80] = v69;
    v28->_anon_38[88] = v70;

    objc_initWeak(&location, v28);
    uint64_t v52 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v53 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v54 = [v68 alloc];
    v55 = v28->_queue._innerQueue;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke;
    v75[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v76, &location);
    uint64_t v56 = [v54 initWithName:@"MapsSuggestionsEngineRunnerRunTimer" queue:v55 block:v75];
    id v57 = [v42 alloc];
    v58 = v28->_queue._innerQueue;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke_26;
    v73[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v74, &location);
    uint64_t v59 = [v57 initWithName:@"MapsSuggestionsEngineRunnerSleepTimer" queue:v58 block:v73];
    firedTriggerName = v28->_state.firedTriggerName;
    v28->_state.firedTriggerName = (NSString *)v52;

    failedConditionName = v28->_state.failedConditionName;
    v28->_state.failedConditionName = (NSString *)v53;

    lastError = v28->_state.lastError;
    v28->_state.lastError = 0;

    id v63 = *(void **)&v28->_state.active;
    *(void *)&v28->_state.active = 0;

    v64 = *(void **)v28->_anon_b8;
    *(void *)v28->_anon_b8 = v56;

    v65 = *(void **)&v28->_anon_b8[8];
    *(void *)&v28->_anon_b8[8] = v59;

    v66 = *(void **)&v28->_anon_b8[16];
    *(void *)&v28->_anon_b8[16] = 0;

    objc_destroyWeak(&v74);
    objc_destroyWeak(&v76);
    objc_destroyWeak(&location);
    id v26 = v71;
    id v27 = v72;
  }

  return v28;
}

void __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke(uint64_t a1)
{
  v21[2] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[MapsSuggestionsEngineRunner _q_stopRun]";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);
    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    id v4 = (void *)[*((id *)WeakRetained + 25) copy];
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} detaching Engine", buf, 0xCu);
    }
    [*((id *)WeakRetained + 3) detachSink:WeakRetained];
    -[MapsSuggestionsEngineRunner _q_sendStateForStep:]((uint64_t)WeakRetained, @"didRunEngine");
    objc_initWeak(&location, WeakRetained);
    uint64_t v7 = (void *)*((void *)WeakRetained + 6);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __41__MapsSuggestionsEngineRunner__q_stopRun__block_invoke;
    *(void *)&buf[24] = &unk_1E5CBA920;
    objc_copyWeak(v21, &location);
    id v8 = v4;
    id v20 = v8;
    [v7 callBlock:buf];
    if (*((unsigned char *)WeakRetained + 144))
    {
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:]((uint64_t)WeakRetained, @"willDestroyEngine");
      GEOFindOrCreateLog();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [WeakRetained uniqueName];
        *(_DWORD *)id v17 = 138412290;
        double v18 = v10;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{%@} destroying Engine", v17, 0xCu);
      }
      id v11 = (void *)*((void *)WeakRetained + 3);
      *((void *)WeakRetained + 3) = 0;
    }
    uint64_t v12 = (void *)*((void *)WeakRetained + 25);
    *((void *)WeakRetained + 25) = 0;

    __int16 v13 = (void *)*((void *)WeakRetained + 21);
    *((void *)WeakRetained + 21) = 0;

    uint64_t v14 = (void *)*((void *)WeakRetained + 22);
    *((void *)WeakRetained + 22) = 0;

    -[MapsSuggestionsEngineRunner _q_scheduleWakeUp]((uint64_t)WeakRetained);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsEngineRunner.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 186;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:"
                            "maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stop"
                            "RunTimerClass:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke_26(uint64_t a1)
{
  *(void *)&v12[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [(dispatch_queue_t *)WeakRetained uniqueName];
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2080;
      *(void *)uint64_t v12 = "-[MapsSuggestionsEngineRunner _q_wakeUp]";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v9, 0x16u);
    }
    dispatch_assert_queue_V2(WeakRetained[1]);
    if (-[MapsSuggestionsEngineRunner _q_passedAllConditions]((uint64_t)WeakRetained))
    {
      -[MapsSuggestionsEngineRunner _q_updateMinSleep]((uint64_t)WeakRetained);
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = [(dispatch_queue_t *)WeakRetained uniqueName];
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{%@} successfully woke up! Starting run...", (uint8_t *)&v9, 0xCu);
      }
      -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]((uint64_t)WeakRetained, 0);
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [(dispatch_queue_t *)WeakRetained uniqueName];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Rescheduling.", (uint8_t *)&v9, 0xCu);
      }
      -[MapsSuggestionsEngineRunner _q_scheduleWakeUp]((uint64_t)WeakRetained);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "MapsSuggestionsEngineRunner.mm";
      __int16 v11 = 1026;
      *(_DWORD *)uint64_t v12 = 192;
      v12[2] = 2082;
      *(void *)&v12[3] = "-[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:m"
                           "axSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRu"
                           "nTimerClass:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 runTimeLeeway:(double)a8 sleepTimeLeeway:(double)a9 maxEntries:(unint64_t)a10 nilledWhenAsleep:(BOOL)a11
{
  BOOL v11 = a11;
  id v20 = a3;
  id v21 = a4;
  GEOConfigGetDouble();
  double v23 = v22;
  uint64_t v24 = objc_opt_class();
  id v25 = [(MapsSuggestionsEngineRunner *)self initWithEngineBuilder:v20 name:v21 minRunTime:a10 maxRunTime:v11 minSleepTime:v24 maxSleepTime:objc_opt_class() runTimeLeeway:a5 sleepTimeLeeway:a6 maxEntries:a7 nilledWhenAsleep:v23 wakeUpTimerClass:a8 stopRunTimerClass:a9];

  return v25;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13
{
  BOOL v14 = a12;
  id v24 = a3;
  id v25 = a4;
  id v26 = [(MapsSuggestionsEngineRunner *)self initWithEngineBuilder:v24 name:v25 minRunTime:a11 maxRunTime:v14 minSleepTime:a13 maxSleepTime:objc_opt_class() runTimeLeeway:a5 sleepTimeLeeway:a6 maxEntries:a7 nilledWhenAsleep:a8 wakeUpTimerClass:a9 stopRunTimerClass:a10];

  return v26;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12
{
  BOOL v12 = a12;
  id v22 = a3;
  id v23 = a4;
  id v24 = [(MapsSuggestionsEngineRunner *)self initWithEngineBuilder:v22 name:v23 minRunTime:a11 maxRunTime:v12 minSleepTime:objc_opt_class() maxSleepTime:a5 runTimeLeeway:a6 sleepTimeLeeway:a7 maxEntries:a8 nilledWhenAsleep:a9 wakeUpTimerClass:a10];

  return v24;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 maxEntries:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  double v18 = [(MapsSuggestionsEngineRunner *)self initWithEngineBuilder:v16 name:v17 minRunTime:a9 maxRunTime:1 minSleepTime:objc_opt_class() maxSleepTime:a5 runTimeLeeway:a6 sleepTimeLeeway:a7 maxEntries:a8 nilledWhenAsleep:1.0 wakeUpTimerClass:1.0];

  return v18;
}

- (MapsSuggestionsEngine)engine
{
  return self->_engine;
}

- (void)registerObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    uint64_t v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412802;
    BOOL v14 = v6;
    __int16 v15 = 2080;
    id v16 = "-[MapsSuggestionsEngineRunner registerObserver:]";
    __int16 v17 = 2112;
    double v18 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  [(NSArray *)self->_config.conditions registerObserver:v4 handler:0];
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MapsSuggestionsEngineRunner_registerObserver___block_invoke;
  v10[3] = &unk_1E5CB85B8;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v4;
  innerQueue = self->_queue._innerQueue;
  id v9 = v4;
  dispatch_async(innerQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __48__MapsSuggestionsEngineRunner_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v44 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (id *)WeakRetained;
    id v4 = *(void **)(a1 + 32);
    v57[0] = @"now";
    MapsSuggestionsNow();
    v33 = (MSg *)objc_claimAutoreleasedReturnValue();
    uint64_t v58 = MSg::jsonFor(v33, v5);
    v57[1] = @"location";
    v32 = (void *)v58;
    MapsSuggestionsCurrentBestLocation();
    v34 = (MSg *)objc_claimAutoreleasedReturnValue();
    MSg::jsonFor(v34, v6);
    uint64_t v59 = v31 = v4;
    v57[2] = @"minSilenceDate";
    v29 = v45;
    uint64_t v35 = (void *)v59;
    uint64_t v60 = MSg::jsonFor(v45, v7);
    v57[3] = @"earliestRunDate";
    uint64_t v28 = v46;
    id v36 = (void *)v60;
    uint64_t v9 = MSg::jsonFor(v46, v8);
    uint64_t v61 = v9;
    v57[4] = @"stopRunTimer";
    id v10 = v49;
    v37 = (void *)v9;
    id v41 = v10;
    if (v10) {
      [v10 objectForJSON];
    }
    else {
    v42 = [MEMORY[0x1E4F1CA98] null];
    }

    id v62 = v42;
    v57[5] = @"wakeUpTimer";
    id v12 = v50;
    __int16 v13 = v12;
    if (v12) {
      [v12 objectForJSON];
    }
    else {
    id v43 = [MEMORY[0x1E4F1CA98] null];
    }

    id v63 = v43;
    v57[6] = @"entries";
    v30 = v51;
    uint64_t v38 = MSg::jsonFor(v51);
    v64 = v38;
    v57[7] = @"firedTriggerName";
    id v27 = v47;
    v39 = MSg::jsonFor(v47);
    v65 = v39;
    v57[8] = @"failedConditionName";
    id v26 = v48;
    uint64_t v40 = MSg::jsonFor(v48);
    v66 = v40;
    v57[9] = @"conditions";
    id v14 = v52[11];
    if (v14)
    {
      __int16 v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v54 != v18) {
              objc_enumerationMutation(v16);
            }
            id v20 = *(id *)(*((void *)&v53 + 1) + 8 * i);
            id v21 = v20;
            if (v20) {
              [v20 objectForJSON];
            }
            else {
            id v22 = [MEMORY[0x1E4F1CA98] null];
            }

            id v23 = [v21 nameForJSON];
            [v15 setObject:v22 forKeyedSubscript:v23];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:buf count:16];
        }
        while (v17);
      }

      id v24 = (void *)[v15 copy];
    }
    else
    {
      id v24 = [MEMORY[0x1E4F1CA98] null];
    }

    v67 = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:v57 count:10];

    [v31 engineRunner:v44 step:@"observing" jsonDict:v25];
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      unint64_t v69 = "MapsSuggestionsEngineRunner.mm";
      __int16 v70 = 1026;
      int v71 = 316;
      __int16 v72 = 2082;
      long long v73 = "-[MapsSuggestionsEngineRunner registerObserver:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)addTrigger:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [(MapsSuggestionsEngineRunner *)self addTriggers:v6];
  }
  else
  {
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      __int16 v10 = 1024;
      int v11 = 326;
      __int16 v12 = 2082;
      __int16 v13 = "-[MapsSuggestionsEngineRunner addTrigger:]";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (trigger)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Trigger cannot be nil", buf, 0x26u);
    }
  }
}

- (void)addTriggers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 2080;
    __int16 v15 = "-[MapsSuggestionsEngineRunner addTriggers:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MapsSuggestionsEngineRunner_addTriggers___block_invoke;
  v9[3] = &unk_1E5CB9548;
  id v10 = v4;
  int v11 = self;
  innerQueue = self->_queue._innerQueue;
  id v8 = v4;
  dispatch_sync(innerQueue, v9);
}

void __43__MapsSuggestionsEngineRunner_addTriggers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "addObject:", v6, (void)v7);
        [v6 registerObserver:*(void *)(a1 + 40)];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)removeTrigger:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MapsSuggestionsEngineRunner *)self removeTriggers:v5];
}

- (void)removeTriggers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    __int16 v14 = "-[MapsSuggestionsEngineRunner removeTriggers:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__MapsSuggestionsEngineRunner_removeTriggers___block_invoke;
  v8[3] = &unk_1E5CB9548;
  id v7 = v4;
  id v9 = v7;
  long long v10 = self;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v8);
}

void __46__MapsSuggestionsEngineRunner_removeTriggers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "unregisterObserver:", *(void *)(a1 + 40), (void)v7);
        [*(id *)(*(void *)(a1 + 40) + 112) removeObject:v6];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)addCondition:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [(MapsSuggestionsEngineRunner *)self addConditions:v6];
  }
  else
  {
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      long long v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      __int16 v10 = 1024;
      int v11 = 359;
      __int16 v12 = 2082;
      __int16 v13 = "-[MapsSuggestionsEngineRunner addCondition:]";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (condition)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Condition cannot be nil", buf, 0x26u);
    }
  }
}

- (void)addConditions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 2080;
    __int16 v15 = "-[MapsSuggestionsEngineRunner addConditions:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsEngineRunner_addConditions___block_invoke;
  v9[3] = &unk_1E5CB9548;
  id v10 = v4;
  int v11 = self;
  innerQueue = self->_queue._innerQueue;
  id v8 = v4;
  dispatch_sync(innerQueue, v9);
}

void __45__MapsSuggestionsEngineRunner_addConditions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 120), "addObject:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)addPostFilter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    long long v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    long long v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 2080;
    __int16 v15 = "-[MapsSuggestionsEngineRunner addPostFilter:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__MapsSuggestionsEngineRunner_addPostFilter___block_invoke;
  v10[3] = &unk_1E5CB9548;
  void v10[4] = self;
  id v11 = v4;
  innerQueue = self->_queue._innerQueue;
  id v9 = v4;
  dispatch_sync(innerQueue, v10);
}

void *__45__MapsSuggestionsEngineRunner_addPostFilter___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 128) addObject:*(void *)(a1 + 40)];
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return objc_msgSend(result, "addAdditionalFilter:forSink:", v3);
  }
  return result;
}

- (void)removeCondition:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
    long long v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [(MapsSuggestionsEngineRunner *)self removeConditions:v6];
  }
  else
  {
    long long v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      __int16 v10 = 1024;
      int v11 = 386;
      __int16 v12 = 2082;
      __int16 v13 = "-[MapsSuggestionsEngineRunner removeCondition:]";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (condition)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Condition cannot be nil", buf, 0x26u);
    }
  }
}

- (void)removeConditions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    long long v6 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    __int16 v12 = v6;
    __int16 v13 = 2080;
    __int16 v14 = "-[MapsSuggestionsEngineRunner removeConditions:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MapsSuggestionsEngineRunner_removeConditions___block_invoke;
  v8[3] = &unk_1E5CB9548;
  id v7 = v4;
  id v9 = v7;
  __int16 v10 = self;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v8);
}

void __48__MapsSuggestionsEngineRunner_removeConditions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 120), "removeObject:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (uint64_t)_q_passedAllConditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    id v24 = v3;
    __int16 v25 = 2080;
    id v26 = "-[MapsSuggestionsEngineRunner _q_passedAllConditions]";
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v4 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = 0;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"willCheckConditions");
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Checking all Conditions...", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = *(id *)(a1 + 120);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        __int16 v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isTrue", (void)v18) & 1) == 0)
        {
          GEOFindOrCreateLog();
          __int16 v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            __int16 v14 = [v10 uniqueName];
            *(_DWORD *)buf = 138412290;
            id v24 = v14;
            _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "RUNCONDITION{%@} failed", buf, 0xCu);
          }
          __int16 v15 = [v10 uniqueName];
          uint64_t v16 = [v15 copy];
          uint64_t v17 = *(void **)(a1 + 176);
          *(void *)(a1 + 176) = v16;

          -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"didFailConditions");
          return 0;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Passed all Conditions!", buf, 2u);
  }

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"didPassConditions");
  return 1;
}

- (void)_q_startRunBecauseOfTrigger:(uint64_t)a1
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [(id)a1 uniqueName];
    id v6 = [v3 uniqueName];
    *(_DWORD *)buf = 138412802;
    id v68 = v5;
    __int16 v69 = 2080;
    __int16 v70 = "-[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]";
    __int16 v71 = 2112;
    __int16 v72 = v6;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v7 = [v3 uniqueName];
  uint64_t v8 = [v7 copy];
  long long v9 = *(void **)(a1 + 168);
  *(void *)(a1 + 168) = v8;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"didWakeUp");
  if (!*(void *)(a1 + 24))
  {
    GEOFindOrCreateLog();
    __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412290;
      id v68 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{%@} Building Engine", buf, 0xCu);
    }
    -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"willBuildEngine");
    uint64_t v12 = [*(id *)(a1 + 40) build];
    __int16 v13 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v12;

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    __int16 v14 = *(void **)(a1 + 56);
    if (!v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F64410]);
      uint64_t v16 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v15;

      __int16 v14 = *(void **)(a1 + 56);
    }
    if (([v14 hasUserPreferences] & 1) == 0)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F64B88]);
      [*(id *)(a1 + 56) setUserPreferences:v17];
    }
    long long v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v19 = [v18 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    long long v20 = [v19 path];
    BOOL v21 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;

    if (v21) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = 1;
    }
    [*(id *)(a1 + 56) setTrafficType:v22];
    id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v24 = [v23 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    __int16 v25 = [v24 path];
    int AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

    uint64_t v27 = [*(id *)(a1 + 56) userPreferences];
    [v27 setAvoidTolls:AppBooleanValueWithContainer != 0];

    GEOFindOrCreateLog();
    uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(id)a1 uniqueName];
      v30 = [*(id *)(a1 + 56) userPreferences];
      int v31 = [v30 avoidTolls];
      v32 = @"NO";
      if (v31) {
        v32 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v68 = v29;
      __int16 v69 = 2112;
      __int16 v70 = (const char *)v32;
      _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "Avoid Tolls on the %@EngineRunner: %@", buf, 0x16u);
    }
    v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    v34 = [v33 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    uint64_t v35 = [v34 path];
    int v36 = _CFPreferencesGetAppBooleanValueWithContainer();

    v37 = [*(id *)(a1 + 56) userPreferences];
    [v37 setAvoidHighways:v36 != 0];

    GEOFindOrCreateLog();
    uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v39 = [*(id *)(a1 + 56) userPreferences];
      int v40 = [v39 avoidHighways];
      id v41 = @"NO";
      if (v40) {
        id v41 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v68 = v41;
      _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_DEBUG, "Avoid Highways:%@", buf, 0xCu);
    }
    [*(id *)(a1 + 24) setAutomobileOptions:*(void *)(a1 + 56)];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v42 = *(id *)(a1 + 128);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v63 != v44) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(a1 + 24) addAdditionalFilter:*(void *)(*((void *)&v62 + 1) + 8 * i) forSink:a1];
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v43);
    }

    -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"didBuildEngine");
  }
  uint64_t v46 = MapsSuggestionsNowWithOffset(*(double *)(a1 + 64));
  v47 = *(void **)(a1 + 152);
  *(void *)(a1 + 152) = v46;

  GEOFindOrCreateLog();
  uint64_t v48 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    id v49 = [(id)a1 uniqueName];
    id v50 = *(const char **)(a1 + 152);
    *(_DWORD *)buf = 138412546;
    id v68 = v49;
    __int16 v69 = 2112;
    __int16 v70 = v50;
    _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_DEBUG, "{%@} will be silent until %@", buf, 0x16u);
  }
  GEOFindOrCreateLog();
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v52 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412290;
    id v68 = v52;
    _os_log_impl(&dword_1A70DF000, v51, OS_LOG_TYPE_DEBUG, "{%@} attaching Engine", buf, 0xCu);
  }
  GEOFindOrCreateLog();
  long long v53 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    long long v54 = [(id)a1 uniqueName];
    long long v55 = *(const char **)(a1 + 72);
    long long v56 = *(void **)(a1 + 96);
    *(_DWORD *)buf = 138412802;
    id v68 = v54;
    __int16 v69 = 2048;
    __int16 v70 = v55;
    __int16 v71 = 2048;
    __int16 v72 = v56;
    _os_log_impl(&dword_1A70DF000, v53, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_stopRun in %.3f sec (+ %.3f sec)", buf, 0x20u);
  }
  [*(id *)(a1 + 184) scheduleWithInterval:(uint64_t)(*(double *)(a1 + 72) * 1000000000.0) leeway:(uint64_t)(*(double *)(a1 + 96) * 1000000000.0)];
  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"willRunEngine");
  [*(id *)(a1 + 24) attachSink:a1];
  -[MapsSuggestionsEngineRunner _q_fetchEntries](a1);
  objc_initWeak((id *)buf, (id)a1);
  id v57 = *(void **)(a1 + 48);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __59__MapsSuggestionsEngineRunner__q_startRunBecauseOfTrigger___block_invoke;
  v59[3] = &unk_1E5CBA920;
  objc_copyWeak(&v61, (id *)buf);
  id v58 = v3;
  id v60 = v58;
  [v57 callBlock:v59];

  objc_destroyWeak(&v61);
  objc_destroyWeak((id *)buf);
}

- (void)_q_fetchEntries
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    GEOFindOrCreateLog();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      long long v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[MapsSuggestionsEngineRunner _q_fetchEntries]";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_initWeak((id *)buf, (id)a1);
    uint64_t v4 = *(void **)(a1 + 24);
    uint64_t v5 = *(void *)(a1 + 136);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke;
    v6[3] = &unk_1E5CBA9B8;
    objc_copyWeak(&v7, (id *)buf);
    [v4 topSuggestionsForSink:a1 count:v5 transportType:4 callback:v6 onQueue:*(void *)(a1 + 8)];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __59__MapsSuggestionsEngineRunner__q_startRunBecauseOfTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v3 engineRunner:WeakRetained startedBecauseOfTrigger:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsEngineRunner.mm";
      __int16 v8 = 1026;
      int v9 = 479;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __41__MapsSuggestionsEngineRunner__q_stopRun__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F1CBF0];
    }
    [v3 engineRunner:WeakRetained stoppedWithEntries:v5];
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "MapsSuggestionsEngineRunner.mm";
      __int16 v9 = 1026;
      int v10 = 499;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsEngineRunner _q_stopRun]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)_q_scheduleWakeUp
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(double *)(a1 + 88) != 0.0)
    {
      GEOFindOrCreateLog();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        id v3 = [(id)a1 uniqueName];
        uint64_t v4 = *(void *)(a1 + 88);
        uint64_t v5 = *(void *)(a1 + 104);
        int v6 = 138412802;
        int v7 = v3;
        __int16 v8 = 2048;
        uint64_t v9 = v4;
        __int16 v10 = 2048;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_wakeUp in %.3f sec (+ %.3f sec)", (uint8_t *)&v6, 0x20u);
      }
      [*(id *)(a1 + 192) scheduleWithInterval:(uint64_t)(*(double *)(a1 + 88) * 1000000000.0) leeway:(uint64_t)(*(double *)(a1 + 104) * 1000000000.0)];
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"willSleep");
    }
  }
}

- (void)_q_updateMinSleep
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [(id)a1 uniqueName];
    uint64_t v4 = *(void *)(a1 + 80);
    int v7 = 138412546;
    __int16 v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{%@} sleeping for at least %.3f sec", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = MapsSuggestionsNowWithOffset(*(double *)(a1 + 80));
  int v6 = *(void **)(a1 + 160);
  *(void *)(a1 + 160) = v5;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, @"didUpdateMinSleep");
}

- (void)scheduleNextRun
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    int v5 = 138412546;
    int v6 = v4;
    __int16 v7 = 2080;
    __int16 v8 = "-[MapsSuggestionsEngineRunner scheduleNextRun]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v5, 0x16u);
  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_33);
}

void __46__MapsSuggestionsEngineRunner_scheduleNextRun__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)runASAP
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    int v5 = 138412546;
    int v6 = v4;
    __int16 v7 = 2080;
    __int16 v8 = "-[MapsSuggestionsEngineRunner runASAP]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v5, 0x16u);
  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_88);
}

void __38__MapsSuggestionsEngineRunner_runASAP__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [(id)a2 uniqueName];
      int v12 = 138412546;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      id v15 = "-[MapsSuggestionsEngineRunner _q_runASAP]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v12, 0x16u);
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    if (MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160)))
    {
      GEOFindOrCreateLog();
      int v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v6 = [(id)a2 uniqueName];
        __int16 v7 = *(const char **)(a2 + 160);
        int v12 = 138412546;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} needs to sleep until at least %@. Ignoring runASAP.", (uint8_t *)&v12, 0x16u);
      }
    }
    else if (-[MapsSuggestionsEngineRunner _q_passedAllConditions](a2))
    {
      -[MapsSuggestionsEngineRunner _q_updateMinSleep](a2);
      GEOFindOrCreateLog();
      __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = [(id)a2 uniqueName];
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", (uint8_t *)&v12, 0xCu);
      }
      -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:](a2, 0);
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [(id)a2 uniqueName];
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Scheduling normal wakeup.", (uint8_t *)&v12, 0xCu);
      }
      -[MapsSuggestionsEngineRunner _q_scheduleWakeUp](a2);
    }
  }
}

- (NSString)uniqueName
{
  return (NSString *)self->_config.circuits;
}

void __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v19 = "MapsSuggestionsEngineRunner.mm";
      __int16 v20 = 1026;
      *(_DWORD *)BOOL v21 = 680;
      v21[2] = 2082;
      *(void *)&id v21[3] = "-[MapsSuggestionsEngineRunner _q_fetchEntries]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_12;
  }
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      long long v19 = v13;
      __int16 v20 = 2112;
      *(void *)BOOL v21 = v6;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%@: Error fetching Entries: %@", buf, 0x16u);
    }
LABEL_12:

    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [WeakRetained uniqueName];
    *(_DWORD *)buf = 138412546;
    long long v19 = v9;
    __int16 v20 = 1024;
    *(_DWORD *)BOOL v21 = [v5 count];
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{%@} received %u Entries", buf, 0x12u);
  }
  uint64_t v10 = [v5 copy];
  objc_storeStrong(WeakRetained + 25, v10);
  if (MapsSuggestionsIsInTheFuture(WeakRetained[19]))
  {
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412290;
      long long v19 = v12;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{%@} is not telling anyone what it knows yet...", buf, 0xCu);
    }
  }
  else
  {
    __int16 v14 = WeakRetained[6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke_92;
    v16[3] = &unk_1E5CBA990;
    v16[4] = WeakRetained;
    id v15 = v10;
    id v17 = v15;
    [v14 callBlock:v16];

    uint64_t v10 = v15;
  }
LABEL_17:
}

uint64_t __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke_92(uint64_t a1, void *a2)
{
  return [a2 engineRunner:*(void *)(a1 + 32) receivedEntries:*(void *)(a1 + 40)];
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(MapsSuggestionsEngineRunner *)self uniqueName];
    int v6 = 138412546;
    __int16 v7 = v5;
    __int16 v8 = 2080;
    uint64_t v9 = "-[MapsSuggestionsEngineRunner invalidateForMapsSuggestionsManager:]";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v6, 0x16u);
  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_95);
}

void __67__MapsSuggestionsEngineRunner_invalidateForMapsSuggestionsManager___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)nameForJSON
{
  return self->_config.circuits;
}

- (id)objectForJSON
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MapsSuggestionsEngineRunner_objectForJSON__block_invoke;
  v4[3] = &unk_1E5CB7EA0;
  v4[4] = self;
  id v2 = MSg::Queue::syncIfDifferent<NSDictionary<NSString *,objc_object  {objcproto22MapsSuggestionsAnyJSON}*> * {__strong}>((NSObject **)&self->_queue, v4);
  return v2;
}

id __44__MapsSuggestionsEngineRunner_objectForJSON__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  v51[0] = @"now";
  MapsSuggestionsNow();
  uint64_t v28 = (MSg *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = MSg::jsonFor(v28, v2);
  v51[1] = @"location";
  uint64_t v27 = (void *)v52;
  MapsSuggestionsCurrentBestLocation();
  v29 = (MSg *)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = MSg::jsonFor(v29, v3);
  v51[2] = @"minSilenceDate";
  id v24 = v39;
  v30 = (void *)v53;
  uint64_t v54 = MSg::jsonFor(v39, v4);
  v51[3] = @"earliestRunDate";
  __int16 v25 = v40;
  int v31 = (void *)v54;
  v32 = MSg::jsonFor(v40, v5);
  long long v55 = v32;
  v51[4] = @"stopRunTimer";
  id v6 = v43;
  int v36 = v6;
  if (v6) {
    [v6 objectForJSON];
  }
  else {
  v37 = [MEMORY[0x1E4F1CA98] null];
  }

  long long v56 = v37;
  v51[5] = @"wakeUpTimer";
  id v7 = v44;
  __int16 v8 = v7;
  if (v7) {
    [v7 objectForJSON];
  }
  else {
  uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }

  id v57 = v38;
  v51[6] = @"entries";
  id v26 = v45;
  v33 = MSg::jsonFor(v45);
  id v58 = v33;
  v51[7] = @"firedTriggerName";
  id v23 = v41;
  v34 = MSg::jsonFor(v41);
  uint64_t v59 = v34;
  v51[8] = @"failedConditionName";
  uint64_t v22 = v42;
  uint64_t v35 = MSg::jsonFor(v42);
  id v60 = v35;
  v51[9] = @"conditions";
  id v9 = v46[11];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(id *)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v16 = v15;
          if (v15) {
            [v15 objectForJSON];
          }
          else {
          id v17 = [MEMORY[0x1E4F1CA98] null];
          }

          long long v18 = [v16 nameForJSON];
          [v10 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v62 count:16];
      }
      while (v12);
    }

    long long v19 = (void *)[v10 copy];
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F1CA98] null];
  }

  id v61 = v19;
  __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:v51 count:10];

  return v20;
}

- (MapsSuggestionsTimer)wakeUpTimer
{
  return self->_wakeUpTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeUpTimer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  self->_queue._innerQueue = 0;
  self->_queue._name = 0;
  *(_OWORD *)&self->_config.circuits = 0u;
  *(_OWORD *)&self->_config.conditions = 0u;
  *(void *)&self->_anon_38[64] = 0;
  *(void *)&self->_anon_38[72] = 0;
  *(void *)&self->_anon_38[56] = 0;
  self->_state.firedTriggerName = [MEMORY[0x1E4F1C9C8] distantPast];
  self->_state.failedConditionName = [MEMORY[0x1E4F1C9C8] distantPast];
  *(_OWORD *)&self->_state.lastError = 0u;
  *(_OWORD *)self->_anon_b8 = 0u;
  *(void *)&self->_anon_b8[16] = 0;
  return self;
}

@end