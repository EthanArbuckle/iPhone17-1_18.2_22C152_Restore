@interface ARPRoutePredictor
+ (NSString)defaultFile;
+ (double)defaultMicroLocationSimilarityThreshold;
+ (id)routePredictor;
- (ARPRoutePredictor)initWithmicroLocationSimilarityThreshold:(double)a3 file:(id)a4 knowledgeStore:(id)a5;
- (BOOL)hasLoadedMicroLocation;
- (NSArray)sessions;
- (NSSet)knownOutputDeviceIDs;
- (NSString)file;
- (OS_dispatch_queue)queue;
- (_DKEvent)latestMicroLocationEvent;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)microLocationSimilarityThreshold;
- (double)routingSessionTimeout;
- (id)description;
- (id)longFormVideoFilter;
- (id)predictionsForContext:(id)a3;
- (id)predictionsForCurrentContext;
- (id)predictionsWithCurrentContext:(id *)a3;
- (int)token;
- (void)_reloadLatestMicroLocationEvent;
- (void)_reloadPersistedSessions;
- (void)dealloc;
- (void)setHasLoadedMicroLocation:(BOOL)a3;
- (void)setKnownOutputDeviceIDs:(id)a3;
- (void)setLatestMicroLocationEvent:(id)a3;
- (void)setLongFormVideoFilter:(id)a3;
- (void)setRoutingSessionTimeout:(double)a3;
- (void)setSessions:(id)a3;
@end

@implementation ARPRoutePredictor

+ (NSString)defaultFile
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = [v3 stringByAppendingPathComponent:@"AirPlayRoutePrediction/correlations.archive"];

  return (NSString *)v4;
}

+ (double)defaultMicroLocationSimilarityThreshold
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AirPlayRoutePrediction"];
  [v2 doubleForKey:@"MicroLocationSimilarityThreshold"];
  if (v3 <= 0.0) {
    double v4 = 0.75;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

+ (id)routePredictor
{
  double v3 = [MEMORY[0x263F350B8] knowledgeStore];
  id v4 = objc_alloc((Class)objc_opt_class());
  [a1 defaultMicroLocationSimilarityThreshold];
  double v6 = v5;
  v7 = [a1 defaultFile];
  v8 = (void *)[v4 initWithmicroLocationSimilarityThreshold:v7 file:v3 knowledgeStore:v6];

  return v8;
}

- (ARPRoutePredictor)initWithmicroLocationSimilarityThreshold:(double)a3 file:(id)a4 knowledgeStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)ARPRoutePredictor;
  v10 = [(ARPRoutePredictor *)&v32 init];
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v24 = v11;
    goto LABEL_8;
  }
  v10->_microLocationSimilarityThreshold = a3;
  v10->_token = -1;
  uint64_t v12 = [v8 copy];
  file = v11->_file;
  v11->_file = (NSString *)v12;

  objc_storeStrong((id *)&v11->_knowledgeStore, a5);
  uint64_t v14 = [MEMORY[0x263EFFA08] set];
  knownOutputDeviceIDs = v11->_knownOutputDeviceIDs;
  v11->_knownOutputDeviceIDs = (NSSet *)v14;

  v11->_routingSessionTimeout = 10800.0;
  v11->_hasLoadedMicroLocation = 0;
  [(ARPRoutePredictor *)v11 _reloadPersistedSessions];
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.AirPlayRoutePrediction.ARPRoutePredictor", v16);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v17;

  v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.AirPlayRoutePrediction:%s", objc_msgSend(v8, "fileSystemRepresentation"));
  objc_initWeak(&location, v11);
  id v20 = v19;
  v21 = (const char *)[v20 UTF8String];
  v22 = v11->_queue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __82__ARPRoutePredictor_initWithmicroLocationSimilarityThreshold_file_knowledgeStore___block_invoke;
  handler[3] = &unk_2640B42F0;
  objc_copyWeak(&v30, &location);
  uint32_t v23 = notify_register_dispatch(v21, &v11->_token, v22, handler);
  objc_destroyWeak(&v30);
  if (!v23)
  {
    if (v11->_knowledgeStore)
    {
      v25 = [MEMORY[0x263F087C8] defaultCenter];
      v26 = [MEMORY[0x263F35148] microLocationVisitStream];
      v27 = [v26 name];
      [v25 addObserver:v11 selector:sel__reloadLatestMicroLocationEvent name:*MEMORY[0x263F35190] object:v27];
    }
    objc_destroyWeak(&location);

    goto LABEL_7;
  }
  objc_destroyWeak(&location);

  v24 = 0;
LABEL_8:

  return v24;
}

void __82__ARPRoutePredictor_initWithmicroLocationSimilarityThreshold_file_knowledgeStore___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 _reloadPersistedSessions];

  objc_destroyWeak(&to);
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1) {
    notify_cancel(token);
  }
  if (self->_knowledgeStore)
  {
    id v4 = [MEMORY[0x263F087C8] defaultCenter];
    uint64_t v5 = *MEMORY[0x263F35190];
    double v6 = [MEMORY[0x263F35148] microLocationVisitStream];
    v7 = [v6 name];
    [v4 removeObserver:self name:v5 object:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)ARPRoutePredictor;
  [(ARPRoutePredictor *)&v8 dealloc];
}

- (void)_reloadLatestMicroLocationEvent
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20BE41000, v0, OS_LOG_TYPE_ERROR, "Error fetching latest microlocation %@", v1, 0xCu);
}

uint64_t __52__ARPRoutePredictor__reloadLatestMicroLocationEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_reloadPersistedSessions
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20BE41000, v0, OS_LOG_TYPE_ERROR, "Error reading persisted routing sessions: %@", v1, 0xCu);
}

BOOL __45__ARPRoutePredictor__reloadPersistedSessions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 outputDeviceID];
  if (v3)
  {
    id v4 = [v2 interval];
    if (v4)
    {
      uint64_t v5 = [v2 microLocationProbabilityVector];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)predictionsForContext:(id)a3
{
  v111[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_20BE41000, "Duet: ARPRoutePredictor predictionsForContext:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)&state[8] = 0;
  *(void *)state = 0;
  os_activity_scope_enter(v5, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  context = (void *)MEMORY[0x210540040]();
  BOOL v6 = ARPLog();
  oslog = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ARPRoutePredictor predictionsForContext:].cold.4();
  }

  v7 = [(ARPRoutePredictor *)self sessions];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    id v9 = [(ARPRoutePredictor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke;
    block[3] = &unk_2640B4220;
    block[4] = self;
    dispatch_sync(v9, block);
  }
  v10 = [(ARPRoutePredictor *)self sessions];
  v11 = (void *)MEMORY[0x263F08A98];
  v95[0] = MEMORY[0x263EF8330];
  v95[1] = 3221225472;
  v95[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_2;
  v95[3] = &unk_2640B4338;
  id v12 = v4;
  id v96 = v12;
  v13 = [v11 predicateWithBlock:v95];
  v66 = [v10 filteredArrayUsingPredicate:v13];

  [(ARPRoutePredictor *)self routingSessionTimeout];
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_3;
  v81[3] = &unk_2640B4360;
  uint64_t v86 = v14;
  id v68 = v12;
  id v82 = v68;
  v83 = self;
  v84 = &v87;
  v85 = &v91;
  [v66 enumerateObjectsUsingBlock:v81];
  v15 = v6;
  if (v92[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[ARPRoutePredictor predictionsForContext:](v6);
      v15 = v6;
    }

    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v17 = objc_alloc_init(MEMORY[0x263F08760]);
    v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v18 = v88[3];
    if (v18 >= [v66 count])
    {
      unint64_t v22 = 0;
    }
    else
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v19 = v88[3];
      uint64_t v20 = [v66 count];
      v21 = objc_msgSend(v66, "subarrayWithRange:", v19, v20 - v88[3]);
      unint64_t v22 = 0;
      uint64_t v23 = [v21 countByEnumeratingWithState:&v77 objects:v110 count:16];
      if (v23)
      {
        uint64_t v67 = *(void *)v78;
        *(void *)&long long v24 = 138413826;
        long long v59 = v24;
        id v60 = v17;
        v61 = self;
        id obj = v21;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v78 != v67) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v77 + 1) + 8 * v25);
            v27 = objc_msgSend(v68, "microLocationProbabilityVector", v59);
            v28 = [v26 microLocationProbabilityVector];
            double v29 = ARPMicroLocationSimilarity(v27, v28);

            [(ARPRoutePredictor *)self microLocationSimilarityThreshold];
            double v31 = v30;
            objc_super v32 = oslog;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              v63 = [v26 interval];
              v62 = [v26 outputDeviceID];
              if (v29 < v31) {
                v38 = @"not ";
              }
              else {
                v38 = &stru_26C0FD7D0;
              }
              v39 = [NSNumber numberWithDouble:v29];
              if (v29 < v31) {
                v40 = @"less";
              }
              else {
                v40 = @"greater";
              }
              v41 = NSNumber;
              [(ARPRoutePredictor *)v61 microLocationSimilarityThreshold];
              v42 = objc_msgSend(v41, "numberWithDouble:");
              v43 = [v26 microLocationProbabilityVector];
              *(_DWORD *)state = v59;
              *(void *)&state[4] = v63;
              *(_WORD *)&state[12] = 2112;
              *(void *)&state[14] = v62;
              __int16 v100 = 2112;
              v101 = v38;
              __int16 v102 = 2112;
              v103 = v39;
              __int16 v104 = 2112;
              v105 = v40;
              __int16 v106 = 2112;
              v107 = v42;
              __int16 v108 = 2112;
              v109 = v43;
              _os_log_debug_impl(&dword_20BE41000, oslog, OS_LOG_TYPE_DEBUG, "Session from %@ with route %@ is %@included in predictions because microlocation similarity %@ is %@ than threshold (%@), microLocationProbabilityVector: %@", state, 0x48u);

              id v17 = v60;
              self = v61;

              objc_super v32 = oslog;
            }

            if (v29 >= v31)
            {
              v33 = [v26 outputDeviceID];
              [v17 addObject:v33];
              v34 = [v70 objectForKey:v33];
              BOOL v35 = v34 == 0;

              if (v35)
              {
                v36 = [v26 interval];
                v37 = [v36 endDate];
                [v70 setObject:v37 forKeyedSubscript:v33];
              }
              ++v22;
            }
            if (v22 == 2)
            {
              if ([v17 count] == 1)
              {
                unint64_t v22 = 2;
LABEL_37:
                v21 = obj;
                goto LABEL_38;
              }
            }
            else if (v22 > 4)
            {
              goto LABEL_37;
            }
            ++v25;
          }
          while (v23 != v25);
          v21 = obj;
          uint64_t v44 = [obj countByEnumeratingWithState:&v77 objects:v110 count:16];
          uint64_t v23 = v44;
        }
        while (v44);
      }
LABEL_38:
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v47 = (ARPRoutePrediction *)v17;
    uint64_t v49 = [(ARPRoutePrediction *)v47 countByEnumeratingWithState:&v73 objects:v98 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v74;
      unint64_t v51 = 2;
      if (v22 > 2) {
        unint64_t v51 = v22;
      }
      double v52 = (double)v51;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v74 != v50) {
            objc_enumerationMutation(v47);
          }
          v54 = [[ARPRoutePrediction alloc] initWithOutputDeviceID:*(void *)(*((void *)&v73 + 1) + 8 * i) confidence:(double)(unint64_t)[(ARPRoutePrediction *)v47 countForObject:*(void *)(*((void *)&v73 + 1) + 8 * i)]/ v52];
          uint64_t v55 = [v16 count];
          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v71[2] = __43__ARPRoutePredictor_predictionsForContext___block_invoke_111;
          v71[3] = &unk_2640B4388;
          v72 = v70;
          uint64_t v56 = objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v54, 0, v55, 1024, v71);
          if (v56 != 0x7FFFFFFFFFFFFFFFLL) {
            [v16 insertObject:v54 atIndex:v56];
          }
        }
        uint64_t v49 = [(ARPRoutePrediction *)v47 countByEnumeratingWithState:&v73 objects:v98 count:16];
      }
      while (v49);
    }

    v57 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      -[ARPRoutePredictor predictionsForContext:]();
      v57 = oslog;
    }

    v48 = (void *)[v16 copy];
    BOOL v6 = v70;
  }
  else
  {
    objc_msgSend(v66, "objectAtIndexedSubscript:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v45 = [ARPRoutePrediction alloc];
    v46 = [v16 outputDeviceID];
    v47 = [(ARPRoutePrediction *)v45 initWithOutputDeviceID:v46 confidence:1.0];

    v111[0] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ARPRoutePredictor predictionsForContext:]();
    }
  }

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);

  return v48;
}

uint64_t __43__ARPRoutePredictor_predictionsForContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPersistedSessions];
}

BOOL __43__ARPRoutePredictor_predictionsForContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 predictionDate];
  uint64_t v5 = [v3 interval];

  BOOL v6 = [v5 endDate];
  BOOL v7 = [v4 compare:v6] == 1;

  return v7;
}

void __43__ARPRoutePredictor_predictionsForContext___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a2;
  BOOL v8 = [*(id *)(a1 + 32) predictionDate];
  id v9 = [v7 interval];
  v10 = [v9 endDate];
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;
  double v13 = *(double *)(a1 + 64);

  if (v12 > v13) {
    goto LABEL_5;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + 1;
  uint64_t v14 = [v7 microLocationProbabilityVector];
  v15 = [*(id *)(a1 + 32) microLocationProbabilityVector];
  double v16 = ARPMicroLocationSimilarity(v14, v15);

  [*(id *)(a1 + 40) microLocationSimilarityThreshold];
  double v18 = v17;
  uint64_t v19 = ARPLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v7 interval];
    double v29 = [v7 outputDeviceID];
    v21 = [NSNumber numberWithDouble:v16];
    unint64_t v22 = @"less";
    if (v16 < v18) {
      uint64_t v23 = @"not ";
    }
    else {
      uint64_t v23 = &stru_26C0FD7D0;
    }
    if (v16 >= v18) {
      unint64_t v22 = @"greater";
    }
    v27 = v23;
    v28 = v22;
    long long v24 = NSNumber;
    [*(id *)(a1 + 40) microLocationSimilarityThreshold];
    uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
    v26 = [v7 microLocationProbabilityVector];
    *(_DWORD *)buf = 138413826;
    double v31 = v20;
    __int16 v32 = 2112;
    v33 = v29;
    __int16 v34 = 2112;
    BOOL v35 = v27;
    __int16 v36 = 2112;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v28;
    __int16 v40 = 2112;
    v41 = v25;
    __int16 v42 = 2112;
    v43 = v26;
    _os_log_debug_impl(&dword_20BE41000, v19, OS_LOG_TYPE_DEBUG, "Session from %@ with route %@ is %@eligible for session continuity because microlocation similarity %@ is %@ than threshold (%@), microLocationProbabilityVector: %@", buf, 0x48u);
  }
  if (v16 >= v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
LABEL_5:
    *a4 = 1;
  }
}

uint64_t __43__ARPRoutePredictor_predictionsForContext___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NSNumber;
  [v6 confidence];
  BOOL v8 = objc_msgSend(v7, "numberWithDouble:");
  id v9 = NSNumber;
  [v5 confidence];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = [v8 compare:v10];

  if (!v11)
  {
    double v12 = *(void **)(a1 + 32);
    double v13 = [v5 outputDeviceID];
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];

    v15 = *(void **)(a1 + 32);
    double v16 = [v6 outputDeviceID];
    double v17 = [v15 objectForKeyedSubscript:v16];

    uint64_t v11 = [v17 compare:v14];
  }

  return v11;
}

- (id)predictionsWithCurrentContext:(id *)a3
{
  if (![(ARPRoutePredictor *)self hasLoadedMicroLocation]) {
    [(ARPRoutePredictor *)self _reloadLatestMicroLocationEvent];
  }
  id v5 = [(ARPRoutePredictor *)self latestMicroLocationEvent];
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF910] date];
    id v7 = [v5 startDate];
    BOOL v8 = [v5 metadata];
    id v9 = [MEMORY[0x263F350D8] probabilityVector];
    v10 = [v8 objectForKeyedSubscript:v9];

    uint64_t v11 = [[ARPPredictionContext alloc] initWithPredictionDate:v6 microLocationEventDate:v7 microLocationProbabilityVector:v10];
    double v12 = v11;
    if (a3) {
      *a3 = v11;
    }
    double v13 = [(ARPRoutePredictor *)self predictionsForContext:v12];
  }
  else
  {
    uint64_t v14 = ARPLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl(&dword_20BE41000, v14, OS_LOG_TYPE_DEFAULT, "No microlocation event to predict airplay routes", v16, 2u);
    }

    double v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (id)predictionsForCurrentContext
{
  return [(ARPRoutePredictor *)self predictionsWithCurrentContext:0];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(ARPRoutePredictor *)self file];
  id v6 = [(ARPRoutePredictor *)self knownOutputDeviceIDs];
  id v7 = [v3 stringWithFormat:@"<%@ %p> file: %@, knownOutputDeviceIDs: %@", v4, self, v5, v6];

  return v7;
}

- (NSSet)knownOutputDeviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKnownOutputDeviceIDs:(id)a3
{
}

- (id)longFormVideoFilter
{
  return self->_longFormVideoFilter;
}

- (void)setLongFormVideoFilter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)token
{
  return self->_token;
}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_DKEvent)latestMicroLocationEvent
{
  return (_DKEvent *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLatestMicroLocationEvent:(id)a3
{
}

- (NSArray)sessions
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessions:(id)a3
{
}

- (double)routingSessionTimeout
{
  return self->_routingSessionTimeout;
}

- (void)setRoutingSessionTimeout:(double)a3
{
  self->_routingSessionTimeout = a3;
}

- (BOOL)hasLoadedMicroLocation
{
  return self->_hasLoadedMicroLocation;
}

- (void)setHasLoadedMicroLocation:(BOOL)a3
{
  self->_hasLoadedMicroLocation = a3;
}

- (double)microLocationSimilarityThreshold
{
  return self->_microLocationSimilarityThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_latestMicroLocationEvent, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_longFormVideoFilter, 0);
  objc_storeStrong((id *)&self->_knownOutputDeviceIDs, 0);
}

- (void)predictionsForContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20BE41000, v0, v1, "Predicted AirPlay routes: %@", v2, v3, v4, v5, v6);
}

- (void)predictionsForContext:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20BE41000, log, OS_LOG_TYPE_DEBUG, "No previous routing session matched for session continuity.", v1, 2u);
}

- (void)predictionsForContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20BE41000, v0, v1, "Predicted AirPlay routes based on session continuity: %@", v2, v3, v4, v5, v6);
}

- (void)predictionsForContext:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20BE41000, v0, v1, "Predicting airplay routes for context: %@", v2, v3, v4, v5, v6);
}

@end