@interface DKMotionMonitor
@end

@implementation DKMotionMonitor

uint64_t __23___DKMotionMonitor_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKMotionMonitor");
  return MEMORY[0x270F9A758]();
}

uint64_t __36___DKMotionMonitor_initForUnitTest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) computeDominantMotionState];
}

void __25___DKMotionMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(WeakRetained, "addMotionActivity:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [WeakRetained computeDominantMotionState];
}

void __25___DKMotionMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v5 = [v3 confidence];
    if (v5 < 3) {
      int v6 = v5 + 1;
    }
    else {
      int v6 = 0;
    }
    id v23 = objc_alloc(MEMORY[0x263F2A300]);
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "stationary"));
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "walking"));
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "running"));
    uint64_t v24 = a1;
    long long v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "automotive"));
    long long v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "cycling"));
    long long v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "unknown"));
    long long v13 = [v3 startDate];
    LODWORD(v22) = v6;
    v14 = (void *)[v23 initWithStationary:v7 walking:v8 running:v9 automotive:v10 cycling:v11 unknown:v12 startDate:v13 confidence:v22];

    uint64_t v15 = [WeakRetained source];
    [v15 sendEvent:v14];

    unint64_t v16 = +[_DKMotionMonitor _activityTypeToMotionState:v3];
    v17 = *(void **)(v24 + 32);
    if (v16 != v17[19])
    {
      v18 = [v17 queue];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __25___DKMotionMonitor_start__block_invoke_3;
      v25[3] = &unk_2647147D8;
      v25[4] = WeakRetained;
      id v26 = v3;
      v19 = v25;
      v20 = (void *)os_transaction_create();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke;
      block[3] = &unk_2647148A0;
      id v28 = v20;
      id v29 = v19;
      id v21 = v20;
      dispatch_async(v18, block);

      *(void *)(*(void *)(v24 + 32) + 152) = v16;
    }
  }
}

uint64_t __25___DKMotionMonitor_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addMotionActivity:*(void *)(a1 + 40)];
}

void __46___DKMotionMonitor_computeDominantMotionState__block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = [v21 timestamp];
  v4 = [v3 laterDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  unint64_t v5 = [v21 timestamp];

  if (v4 != v5)
  {
    int v6 = NSNumber;
    uint64_t v7 = [v21 state];
    uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedLongLongValue"));

    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v10 = [v21 timestamp];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    long long v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

    if (!v13) {
      [*(id *)(a1 + 32) setObject:&unk_26D86D8C0 forKeyedSubscript:v8];
    }
    v14 = NSNumber;
    uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    [v15 doubleValue];
    v17 = [v14 numberWithDouble:v12 + v16];
    [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v8];

    uint64_t v18 = [v21 timestamp];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

void __46___DKMotionMonitor_computeDominantMotionState__block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = (void *)MEMORY[0x22A629AA0]();
  [v5 doubleValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 > *(double *)(v8 + 24))
  {
    *(double *)(v8 + 24) = v7;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 unsignedIntegerValue];
  }
}

void __26___DKMotionMonitor_update__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) lastUpdate];
  if (!v2)
  {
    v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-21600.0];
  }
  id v3 = [MEMORY[0x263EFF910] date];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __26___DKMotionMonitor_update__block_invoke_2;
  long long v10 = &unk_264714878;
  objc_copyWeak(&v13, &location);
  id v4 = v3;
  id v11 = v4;
  id v12 = *(id *)(a1 + 40);
  id v5 = (void *)MEMORY[0x22A629CE0](&v7);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 144))
  {
    int v6 = +[_DKMotionMonitor log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v16 = v2;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_225002000, v6, OS_LOG_TYPE_DEFAULT, "Starting CoreMotion query for date range %@ - %@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 160) queryActivityStartingFromDate:v2 toDate:v4 toQueue:*(void *)(*(void *)(a1 + 32) + 168) withHandler:v5];
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __26___DKMotionMonitor_update__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v8 = (void *)MEMORY[0x22A629AA0]();
    id v9 = +[_DKMotionMonitor log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v42 = [v5 count];
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_225002000, v9, OS_LOG_TYPE_DEFAULT, "Completed CoreMotion query with %lu results, error %@", buf, 0x16u);
    }

    if (!v6)
    {
      if ((unint64_t)[v5 count] >= 2)
      {
        long long v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
        v40 = v10;
        id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
        id v12 = [v5 sortedArrayUsingDescriptors:v11];

        id v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = v12;
        uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          v34 = v13;
          id v29 = v8;
          uint64_t v30 = a1;
          id v31 = WeakRetained;
          id v32 = v5;
          id v16 = 0;
          uint64_t v17 = *(void *)v36;
          do
          {
            uint64_t v18 = 0;
            uint64_t v19 = v16;
            do
            {
              if (*(void *)v36 != v17) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
              if (v19)
              {
                id v21 = (void *)MEMORY[0x22A629AA0]();
                uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[_DKMotionMonitor _activityTypeToMotionState:](_DKMotionMonitor, "_activityTypeToMotionState:", v19));
                id v23 = [v19 startDate];
                uint64_t v24 = [v20 startDate];
                v25 = +[_DKMotionMonitor _eventWithState:v22 startDate:v23 endDate:v24];

                [v34 addObject:v25];
              }
              id v16 = v20;

              ++v18;
              uint64_t v19 = v16;
            }
            while (v15 != v18);
            uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v15);

          id v6 = 0;
          id v5 = v32;
          a1 = v30;
          id WeakRetained = v31;
          uint64_t v8 = v29;
          id v13 = v34;
        }

        id v26 = [WeakRetained historicalHandler];

        if (v26)
        {
          v27 = [WeakRetained historicalHandler];
          ((void (**)(void, void *))v27)[2](v27, v13);
        }
      }
      [WeakRetained setLastUpdate:*(void *)(a1 + 32)];
    }
    id v28 = +[_DKMotionMonitor log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v28, OS_LOG_TYPE_DEFAULT, "Periodic update finished", buf, 2u);
    }
  }
  else
  {
    id v28 = +[_DKMotionMonitor log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __26___DKMotionMonitor_update__block_invoke_2_cold_1(v28);
    }
  }
}

void __26___DKMotionMonitor_update__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Unable to complete update because _DKMotionMonitor is no longer around", v1, 2u);
}

@end