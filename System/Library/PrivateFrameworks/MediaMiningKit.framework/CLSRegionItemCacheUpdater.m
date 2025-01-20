@interface CLSRegionItemCacheUpdater
+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4;
- (BOOL)createCacheForRegions:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (BOOL)isSimulatingTimeout;
- (CLSRegionItemCacheUpdater)initWithQueryPerformers:(id)a3;
- (NSArray)queryPerformers;
- (OS_os_log)loggingConnection;
- (double)timeoutInterval;
- (unint64_t)numberOfRetries;
- (void)setLoggingConnection:(id)a3;
- (void)setNumberOfRetries:(unint64_t)a3;
- (void)setSimulatesTimeout:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation CLSRegionItemCacheUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPerformers, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (NSArray)queryPerformers
{
  return self->_queryPerformers;
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  self->_numberOfRetries = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (BOOL)isSimulatingTimeout
{
  return self->_simulatesTimeout;
}

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (BOOL)createCacheForRegions:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  dispatch_group_t v9 = dispatch_group_create();
  dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
  v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v12 = objc_alloc_init(CLSGeoServiceThread);
  [(CLSGeoServiceThread *)v12 setName:@"GeoService thread Run Loop"];
  [(CLSGeoServiceThread *)v12 start];
  [v11 addObject:v12];

  uint64_t v102 = 0;
  v103 = (unsigned __int8 *)&v102;
  uint64_t v104 = 0x2020000000;
  char v105 = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__1090;
  v100 = __Block_byref_object_dispose__1091;
  id v101 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  int v95 = 0;
  uint64_t v13 = [v6 count];
  NSUInteger v14 = [(NSArray *)self->_queryPerformers count];
  v15 = objc_opt_new();
  float v16 = (float)(v14 * v13);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke;
  v83[3] = &unk_1E690EEA8;
  dispatch_group_t group = v9;
  dispatch_group_t v84 = group;
  v90 = &v102;
  v51 = v10;
  v85 = v51;
  v86 = self;
  id v53 = v15;
  id v87 = v53;
  id v52 = v11;
  id v88 = v52;
  id v56 = v7;
  id v89 = v56;
  v91 = v94;
  float v93 = v16;
  v92 = &v96;
  v57 = (void *)MEMORY[0x1D2602540](v83);
  v17 = [MEMORY[0x1E4F1CA48] array];
  v18 = [MEMORY[0x1E4F1CA48] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v111 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v80 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1E4F8A930];
        [v23 clsHorizontalAccuracy];
        if (objc_msgSend(v24, "horizontalAccuracyIsCoarse:")) {
          v25 = v18;
        }
        else {
          v25 = v17;
        }
        [v25 addObject:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v111 count:16];
    }
    while (v20);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = self->_queryPerformers;
  uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v75 objects:v110 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v76;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v76 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        uint64_t v30 = [(id)objc_opt_class() numberOfRegionsPerBatch];
        [v29 setLoggingConnection:self->_loggingConnection];
        id v31 = v29;
        objc_sync_enter(v31);
        uint64_t v109 = 0;
        long long buf = 0u;
        long long v108 = 0u;
        if (v31) {
          [v31 statistics];
        }
        *(void *)&long long buf = [v19 count];
        uint64_t v74 = v109;
        v73[0] = buf;
        v73[1] = v108;
        [v31 setStatistics:v73];
        objc_sync_exit(v31);

        v32 = self->_loggingConnection;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_4;
        v64[3] = &unk_1E690EEF8;
        v33 = v32;
        v65 = v33;
        id v66 = v31;
        uint64_t v71 = v30;
        id v67 = v57;
        v69 = &v102;
        id v68 = v56;
        v70 = v94;
        float v72 = v16;
        v34 = (void (**)(void, void, void))MEMORY[0x1D2602540](v64);
        ((void (**)(void, void *, __CFString *))v34)[2](v34, v17, @"precise");
        unsigned __int8 v35 = atomic_load(v103 + 24);
        if ((v35 & 1) != 0
          || (((void (**)(void, void *, __CFString *))v34)[2](v34, v18, @"coarse"),
              unsigned __int8 v36 = atomic_load(v103 + 24),
              (v36 & 1) != 0))
        {

          goto LABEL_24;
        }
        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v75 objects:v110 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  unsigned __int8 v37 = atomic_load(v103 + 24);
  if (v37)
  {
    id v38 = v53;
    objc_sync_enter(v38);
    v39 = (void *)[v38 copy];
    objc_sync_exit(v38);

    [v39 enumerateObjectsUsingBlock:&__block_literal_global_1094];
    if (a5) {
      *a5 = (id) v97[5];
    }
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v40 = v52;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v106 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(v40);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * k) cancel];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v106 count:16];
    }
    while (v41);
  }

  v44 = [(CLSRegionItemCacheUpdater *)self loggingConnection];

  if (v44)
  {
    queryPerformers = self->_queryPerformers;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2_174;
    v59[3] = &unk_1E690EF40;
    v59[4] = self;
    [(NSArray *)queryPerformers enumerateObjectsUsingBlock:v59];
  }
  double v46 = CFAbsoluteTimeGetCurrent();
  v47 = [(CLSRegionItemCacheUpdater *)self loggingConnection];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v46 - Current;
    _os_log_impl(&dword_1D2150000, v47, OS_LOG_TYPE_INFO, "[GEO] Location Cache Creation took %.2f s", (uint8_t *)&buf, 0xCu);
  }

  BOOL v48 = v97[5] == 0;
  _Block_object_dispose(v94, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&v102, 8);
  return v48;
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
  if (v7)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v8 = [(id)objc_opt_class() queryWithTemplate:v5 forRegions:v6];
    [v8 setLoggingConnection:*(void *)(*(void *)(a1 + 48) + 16)];
    id v9 = *(id *)(a1 + 56);
    objc_sync_enter(v9);
    dispatch_semaphore_t v10 = [*(id *)(a1 + 64) lastObject];
    [*(id *)(a1 + 64) removeLastObject];
    objc_sync_exit(v9);

    v11 = [[CLSQueryHandler alloc] initWithQueryPerformer:v8 geoServiceThread:v10 loggingConnection:*(void *)(*(void *)(a1 + 48) + 16)];
    -[CLSQueryHandler setSimulatesTimeout:](v11, "setSimulatesTimeout:", [*(id *)(a1 + 48) isSimulatingTimeout]);
    [*(id *)(a1 + 48) timeoutInterval];
    [(CLSQueryHandler *)v11 setTimeoutInterval:"setTimeoutInterval:"];
    -[CLSQueryHandler setNumberOfRetries:](v11, "setNumberOfRetries:", [*(id *)(a1 + 48) numberOfRetries]);
    v12 = *(void **)(a1 + 72);
    if (v12)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2;
      v33[3] = &unk_1E690EE58;
      uint64_t v35 = *(void *)(a1 + 88);
      int v37 = *(_DWORD *)(a1 + 104);
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 80);
      id v34 = v13;
      uint64_t v36 = v14;
      [(CLSQueryHandler *)v11 setProgressBlock:v33];
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, v11);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_3;
    v23 = &unk_1E690EE80;
    objc_copyWeak(v31, &location);
    id v24 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 64);
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 80);
    id v26 = v16;
    uint64_t v18 = *(void *)(a1 + 96);
    uint64_t v29 = v17;
    uint64_t v30 = v18;
    v31[1] = *(id *)&Current;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 32);
    [(CLSQueryHandler *)v11 setCompletionBlock:&v20];
    id v19 = *(id *)(a1 + 56);
    objc_sync_enter(v19);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11, v20, v21, v22, v23);
    objc_sync_exit(v19);

    [(CLSQueryHandler *)v11 cacheItems];
    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = [v5 lastObject];
  v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v10 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)long long buf = 67109634;
    int v28 = [v5 count];
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    uint64_t v32 = objc_opt_class();
    _os_log_impl(&dword_1D2150000, v11, OS_LOG_TYPE_DEFAULT, "[CLSRegionItemCacheUpdater] Starting to process %d %@ regions with %@", buf, 0x1Cu);

    dispatch_semaphore_t v10 = *(NSObject **)(a1 + 32);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_159;
  v17[3] = &unk_1E690EED0;
  v17[4] = *(void *)(a1 + 40);
  id v18 = v8;
  uint64_t v25 = *(void *)(a1 + 80);
  id v19 = v9;
  id v20 = v7;
  uint64_t v21 = v10;
  id v22 = *(id *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v12 = (id)v16;
  long long v23 = v16;
  uint64_t v24 = *(void *)(a1 + 72);
  int v26 = *(_DWORD *)(a1 + 88);
  id v13 = v7;
  id v14 = v9;
  id v15 = v8;
  [v5 enumerateObjectsUsingBlock:v17];
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2_174(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (v3)
  {
    [v3 statistics];
    uint64_t v7 = *((void *)&v13 + 1);
    uint64_t v6 = v13;
    uint64_t v9 = *((void *)&v14 + 1);
    uint64_t v8 = v14;
    uint64_t v10 = v15;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  v11 = [NSString stringWithFormat:@"[GEO] %@ | [Locations]: %lu | [Cached Locations]: %lu | [Resolved Locations]: %lu | [Requests]: %lu | [Batch Size]: %lu", v5, v6, v8, v7, v9, v10, v13, v14, v15];
  id v12 = [*(id *)(a1 + 32) loggingConnection];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1D2150000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

uint64_t __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_172(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_159(uint64_t a1, void *a2, uint64_t a3, uint8_t *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x1D2602300]();
  if (![*(id *)(a1 + 32) shouldQueryItemsForRegion:v6 selectedRegions:*(void *)(a1 + 40)])
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    uint64_t v34 = 0;
    memset(buf, 0, sizeof(buf));
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9)
    {
      [v9 statistics];
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)&buf[16] + 1;
    }
    else
    {
      uint64_t v10 = 1;
    }
    *(void *)&buf[16] = v10;
    uint64_t v32 = v34;
    v31[0] = *(_OWORD *)buf;
    v31[1] = *(_OWORD *)&buf[16];
    [v9 setStatistics:v31];
    objc_sync_exit(v8);

LABEL_8:
    if (*(id *)(a1 + 56) != v6 || ![*(id *)(a1 + 48) count]) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  [*(id *)(a1 + 48) addObject:v6];
  [*(id *)(a1 + 40) addObject:v6];
  if ((unint64_t)[*(id *)(a1 + 48) count] < *(void *)(a1 + 104)) {
    goto LABEL_8;
  }
LABEL_10:
  v11 = *(id *)(a1 + 64);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  long long v13 = v11;
  long long v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2150000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CLSRegionItemCacheUpdater", (const char *)&unk_1D21C5D8A, buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v29 = mach_absolute_time();
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = (void *)[*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v16, v17);

  uint64_t v18 = mach_absolute_time();
  mach_timebase_info v19 = info;
  id v20 = v14;
  uint64_t v21 = v20;
  if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
  {
    int v22 = [*(id *)(a1 + 48) count];
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v22;
    _os_signpost_emit_with_name_impl(&dword_1D2150000, v21, OS_SIGNPOST_INTERVAL_END, v12, "CLSRegionItemCacheUpdater", "Processed batch of %d regions", buf, 8u);
  }

  long long v23 = v21;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Processed batch of %d regions", objc_msgSend(*(id *)(a1 + 48), "count"));
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "CLSRegionItemCacheUpdater";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (float)((float)((float)((float)(v18 - v29) * (float)v19.numer) / (float)v19.denom) / 1000000.0);
    _os_log_impl(&dword_1D2150000, v23, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  [*(id *)(a1 + 48) removeAllObjects];
  unsigned __int8 v25 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
  *a4 = v25 & 1;

LABEL_19:
  if (*(void *)(a1 + 80))
  {
    int v26 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
    float v27 = *(float *)(a1 + 112);
    buf[0] = 0;
    (*(void (**)(double))(*(void *)(a1 + 80) + 16))((float)((float)v26 / v27));
    uint8_t v28 = buf[0];
    atomic_store(buf[0], (unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
    *a4 = v28;
  }
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1u);
}

uint64_t __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2(uint64_t a1, unsigned __int8 *a2)
{
  int v4 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  float v5 = *(float *)(a1 + 56);
  unsigned __int8 v8 = 0;
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))((float)((float)v4 / v5));
  unsigned __int8 v7 = v8;
  atomic_store(v8, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *a2 = v7;
  return result;
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_3(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    int v11 = [*(id *)(a1 + 32) containsObject:WeakRetained];
    objc_sync_exit(v10);

    if (v11)
    {
      id v12 = *(id *)(a1 + 32);
      objc_sync_enter(v12);
      [*(id *)(a1 + 32) removeObject:WeakRetained];
      long long v13 = *(void **)(a1 + 40);
      long long v14 = [WeakRetained geoServiceThread];
      [v13 addObject:v14];

      objc_sync_exit(v12);
      id v15 = *(id *)(a1 + 48);
      objc_sync_enter(v15);
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v16 = *(void **)(a1 + 48);
      if (v16)
      {
        [v16 statistics];
        uint64_t v17 = *((void *)&v25 + 1);
        uint64_t v16 = *(void **)(a1 + 48);
        uint64_t v18 = *((void *)&v26 + 1) + 1;
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v18 = 1;
      }
      *((void *)&v25 + 1) = v17 + a3;
      *((void *)&v26 + 1) = v18;
      uint64_t v24 = v27;
      v23[0] = v25;
      v23[1] = v26;
      [v16 setStatistics:v23];
      objc_sync_exit(v15);

      unsigned __int8 v19 = a2 ^ 1;
      atomic_store(v19, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
      double Current = CFAbsoluteTimeGetCurrent();
      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 48), "logGeoLookupFailureResult", Current);
      }
      else
      {
        uint64_t v21 = *(void **)(a1 + 48);
        int v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:Current - *(double *)(a1 + 96)];
        [v21 logGeoLookupCounterAndDurationWithLookupDuration:v22];
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (CLSRegionItemCacheUpdater)initWithQueryPerformers:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSRegionItemCacheUpdater;
  id v6 = [(CLSRegionItemCacheUpdater *)&v11 init];
  unsigned __int8 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryPerformers, a3);
    v7->_simulatesTimeout = 0;
    v7->_timeoutInterval = 20.0;
    v7->_numberOfRetries = 0;
    os_log_t v8 = os_log_create("com.apple.mediaminingkit", "default");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;
  }
  return v7;
}

+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4
{
  return +[CLSNewLocationInformant businessItemsForRegion:a3 poiCache:a4];
}

@end