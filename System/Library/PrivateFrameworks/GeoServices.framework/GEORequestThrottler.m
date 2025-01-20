@interface GEORequestThrottler
+ (id)sharedThrottler;
- (GEORequestThrottler)init;
- (void)_scheduleTimer:(double)a3;
- (void)cancelTicket:(id)a3;
- (void)enqueueTicket:(id)a3 submissionHandler:(id)a4;
- (void)submitTickets;
@end

@implementation GEORequestThrottler

+ (id)sharedThrottler
{
  if (qword_1EB29F718 != -1) {
    dispatch_once(&qword_1EB29F718, &__block_literal_global_36);
  }
  v2 = (void *)_MergedGlobals_202;

  return v2;
}

void __38__GEORequestThrottler_sharedThrottler__block_invoke()
{
  v0 = objc_alloc_init(GEORequestThrottler);
  v1 = (void *)_MergedGlobals_202;
  _MergedGlobals_202 = (uint64_t)v0;
}

- (GEORequestThrottler)init
{
  v15.receiver = self;
  v15.super_class = (Class)GEORequestThrottler;
  id v2 = [(GEORequestThrottler *)&v15 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    *((void *)v2 + 4) = 0x7FEFFFFFFFFFFFFFLL;
    global_workloop = geo_get_global_workloop();
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_workloop);
    v9 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v2);
    v10 = *((void *)v2 + 5);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__GEORequestThrottler_init__block_invoke;
    v12[3] = &unk_1E53D7B90;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (GEORequestThrottler *)v2;
}

void __27__GEORequestThrottler_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained submitTickets];
}

- (void)enqueueTicket:(id)a3 submissionHandler:(id)a4
{
  uint64_t v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 dataRequestKind];
  v9 = [v5 numberWithInt:HIDWORD(v8) | v8];
  v10 = +[_GEOThrottledTicket ticket:v7 withHandler:v6];

  id v13 = v9;
  id v11 = v10;
  id v12 = v9;
  geo_isolate_sync_data();
}

void __55__GEORequestThrottler_enqueueTicket_submissionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    [v6 addObject:*(void *)(a1 + 48)];
    goto LABEL_5;
  }
  id v6 = v2;
  uint64_t v3 = [v2 lastObject];
  [v3 safeTime];
  double v5 = v4;

  [*(id *)(a1 + 48) setSafeTime:v5];
  [v6 addObject:*(void *)(a1 + 48)];
  if (v5 == 0.0) {
LABEL_5:
  }
    [*(id *)(a1 + 32) _scheduleTimer:0.0];
}

- (void)cancelTicket:(id)a3
{
  id v3 = a3;
  double v4 = NSNumber;
  uint64_t v5 = [v3 dataRequestKind];
  id v6 = [v4 numberWithInt:HIDWORD(v5) | v5];
  v9 = v3;
  id v7 = v3;
  id v8 = v6;
  geo_isolate_sync_data();
}

void __36__GEORequestThrottler_cancelTicket___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) conformsToProtocol:&unk_1ED77B068]) {
    [*(id *)(a1 + 48) cancel];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__GEORequestThrottler_cancelTicket___block_invoke_2;
  v4[3] = &unk_1E53DD3D0;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v4];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    [v2 removeObjectAtIndex:v3];
  }
}

BOOL __36__GEORequestThrottler_cancelTicket___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 ticket];
  id v7 = *(void **)(a1 + 32);

  if (v6 != v7) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (void)_scheduleTimer:(double)a3
{
  geo_assert_isolated();
  CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() + a3;
  if (self->_nextSubmissionTime >= v5)
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_submissionTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    self->_nextSubmissionTime = v5;
  }
}

- (void)submitTickets
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__13;
  v56 = __Block_byref_object_dispose__13;
  id v57 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __36__GEORequestThrottler_submitTickets__block_invoke;
  v44 = &unk_1E53D89E8;
  v45 = self;
  v46 = &v48;
  v47 = &v52;
  geo_isolate_sync_data();
  if (!*((unsigned char *)v49 + 24) && [(id)v53[5] count])
  {
    v30 = [MEMORY[0x1E4F1CA48] array];
    double Current = CFAbsoluteTimeGetCurrent();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    id v3 = (id)v53[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v58 count:16];
    if (!v4) {
      goto LABEL_25;
    }
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v38;
    double v9 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v11 safeTime];
        if (v12 > Current) {
          goto LABEL_18;
        }
        id v13 = [v11 ticket];
        uint64_t v14 = [v13 dataRequestKind];

        if (v14 == v5 && v6 == 0)
        {
          [v11 safeTime];
          if (v28 < v9) {
            [v11 setSafeTime:v9];
          }
          int v6 = 0;
LABEL_18:
          uint64_t v7 = 1;
          continue;
        }
        double v36 = 0.0;
        int v35 = 0;
        v16 = +[GEOThrottlerRequester sharedRequester];
        id v34 = 0;
        v17 = [v16 getTokenOrInfoFor:v14 nextSafeRequestTime:&v36 availableRequestCount:&v35 error:&v34];
        id v18 = v34;

        if (v17)
        {
          v19 = [v11 ticket];
          [v19 setThrottlerToken:v17];

          global_workloop = geo_get_global_workloop();
          dispatch_qos_class_t v21 = [v11 qos];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __36__GEORequestThrottler_submitTickets__block_invoke_2;
          block[3] = &unk_1E53D79D8;
          block[4] = v11;
          v31 = v17;
          id v22 = v18;
          uint64_t v23 = v4;
          uint64_t v24 = v8;
          uint64_t v25 = v7;
          id v26 = v3;
          dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
          dispatch_async(global_workloop, v27);

          id v3 = v26;
          uint64_t v7 = v25;
          uint64_t v8 = v24;
          uint64_t v4 = v23;
          id v18 = v22;
          v17 = v31;

          [v30 addObject:v11];
        }
        else
        {
          if (!v18) {
            [v11 setSafeTime:v36];
          }
          uint64_t v7 = 1;
        }
        int v6 = v35;
        double v9 = v36;

        uint64_t v5 = v14;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v58 count:16];
      if (!v4)
      {
LABEL_25:

        id v32 = v30;
        geo_isolate_sync_data();

        break;
      }
    }
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
}

void __36__GEORequestThrottler_submitTickets__block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 24);
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = objc_msgSend(*(id *)(a1[4] + 16), "allValues", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    if ([*(id *)(*(void *)(a1[6] + 8) + 40) count]) {
      *(unsigned char *)(a1[4] + 24) = 1;
    }
    *(void *)(a1[4] + 32) = 0x7FEFFFFFFFFFFFFFLL;
    dispatch_source_set_timer(*(dispatch_source_t *)(a1[4] + 40), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void __36__GEORequestThrottler_submitTickets__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) submissionHandler];
  id v2 = [*(id *)(a1 + 32) ticket];
  v3[2](v3, v2);
}

void __36__GEORequestThrottler_submitTickets__block_invoke_3(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v8 = NSNumber;
        long long v9 = [v7 ticket];
        uint64_t v10 = [v9 dataRequestKind];
        id v11 = [v8 numberWithInt:HIDWORD(v10) | v10];

        uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v11];
        [v12 removeObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = [*(id *)(*(void *)(a1 + 40) + 16) allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      double v17 = 1.79769313e308;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v30;
            do
            {
              for (uint64_t k = 0; k != v22; ++k)
              {
                if (*(void *)v30 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void **)(*((void *)&v29 + 1) + 8 * k);
                [v25 safeTime];
                if (v26 > 0.0)
                {
                  [v25 safeTime];
                  if (v17 >= v27)
                  {
                    [v25 safeTime];
                    double v17 = v28;
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v22);
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v15);

      if (v17 < 1.79769313e308) {
        [*(id *)(a1 + 40) _scheduleTimer:v17 - CFAbsoluteTimeGetCurrent()];
      }
    }
    else
    {
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_enqueuedTickets, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end