@interface DKMonitor
@end

@implementation DKMonitor

void __26___DKMonitor_currentEvent__block_invoke(uint64_t a1)
{
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_2(uint64_t a1)
{
}

void __23___DKMonitor_saveState__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = [MEMORY[0x263F34FD0] sharedInstance];
    v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:*(void *)(*(void *)v1 + 8) requiringSecureCoding:1 error:0];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [v2 setData:v3 forKey:v5];

    v6 = [MEMORY[0x263F34FB8] instrumentationChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __23___DKMonitor_saveState__block_invoke_cold_1(v1, v6);
    }
  }
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(v2 + 128);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_2;
  v22 = &unk_2647147D8;
  uint64_t v23 = v2;
  id v24 = *(id *)(a1 + 40);
  dispatch_sync(v4, &v19);
  if (!*(void *)(v3 + 8))
  {
    objc_msgSend(*(id *)(*(void *)v3 + 64), "removeObjectForKey:", @"kCurrentEvent", v19, v20, v21, v22, v23);
LABEL_19:
    v16 = [*(id *)v3 instantHandler];

    if (v16)
    {
      v17 = [*(id *)v3 instantHandler];
      v18 = [*(id *)v3 currentEvent];
      ((void (**)(void, void *))v17)[2](v17, v18);
    }
    goto LABEL_21;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    int v12 = 1;
    goto LABEL_16;
  }
  v5 = objc_msgSend(*(id *)(*(void *)v3 + 64), "objectForKeyedSubscript:", @"kCurrentEvent", v19, v20, v21, v22, v23);
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_cold_1();
    }
    goto LABEL_12;
  }
  if (!(*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))())
  {
    int v12 = 0;
    goto LABEL_15;
  }
  v6 = [*(id *)v3 filter];
  char v7 = ((uint64_t (**)(void, void *))v6)[2](v6, v5);

  if ((v7 & 1) == 0)
  {
    v8 = [*(id *)(a1 + 40) startDate];
    [v5 setEndDate:v8];

    v9 = [*(id *)(a1 + 32) historicalHandler];

    if (v9)
    {
      uint64_t v10 = [*(id *)v3 historicalHandler];
      v25[0] = v5;
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

LABEL_12:
    }
  }
  int v12 = 1;
LABEL_15:
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  v14 = *(void **)(*(void *)v3 + 48);
  *(void *)(*(void *)v3 + 48) = v13;

LABEL_16:
  char v15 = [(id)objc_opt_class() shouldMergeUnchangedEvents];
  if (v12 || (v15 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(void *)v3 + 64), "setObject:forKeyedSubscript:", *(void *)(*(void *)v3 + 56), @"kCurrentEvent", v19, v20, v21, v22, v23);
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_21:
  objc_msgSend(*(id *)v3, "saveState", v19, v20, v21, v22, v23);
}

uint64_t __18___DKMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareValue:");
}

uint64_t __18___DKMonitor_init__block_invoke_2()
{
  return 0;
}

void __23___DKMonitor_loadState__block_invoke(uint64_t a1)
{
  v31[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A629AA0]();
  uint64_t v3 = [MEMORY[0x263F34FD0] sharedInstance];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 dataForKey:v5];

  if (v6)
  {
    char v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v14 = [*(id *)(a1 + 32) classesForSecureStateDecoding];
    char v15 = [v13 setByAddingObjectsFromSet:v14];

    id v29 = 0;
    uint64_t v16 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v15 fromData:v6 error:&v29];
    id v17 = v29;
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v16;

    if (v17)
    {
      uint64_t v20 = [MEMORY[0x263F34FB8] knowledgeChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __23___DKMonitor_loadState__block_invoke_cold_1((uint64_t)v17, v20);
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v21 = NSDictionary;
    v22 = [MEMORY[0x263EFF9A0] dictionary];
    v31[0] = v22;
    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    v31[1] = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    v30[0] = @"kInstantState";
    v30[1] = @"kHistoricalState";
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    uint64_t v26 = [v21 dictionaryWithObjects:v24 forKeys:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

uint64_t __43___DKMonitor_instantMonitorNeedsActivation__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _instantMonitorNeedsActivation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45___DKMonitor_instantMonitorNeedsDeactivation__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _instantMonitorNeedsDeactivation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __35___DKMonitor_systemClockDidChange___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&systemClockDidChange__timebaseInfo);
}

void __35___DKMonitor_systemClockDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = mach_continuous_time();
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [*(id *)(a1 + 32) machTimeAtLastClockChange];
  unint64_t v5 = (v2 - v4) * systemClockDidChange__timebaseInfo / *(unsigned int *)algn_26AC1F45C / 0x3B9ACA00;
  v6 = [*(id *)(a1 + 32) dateAtLastClockChange];
  [v3 timeIntervalSinceDate:v6];
  double v8 = v7;

  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v5];
  [v9 doubleValue];
  double v11 = v8 - v10;

  uint64_t v12 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [NSNumber numberWithDouble:v11];
    int v15 = 138412290;
    uint64_t v16 = v13;
    _os_log_impl(&dword_225002000, v12, OS_LOG_TYPE_INFO, "Time changed by %@ seconds.", (uint8_t *)&v15, 0xCu);
  }
  if (fabs(v11) > 60.0)
  {
    v14 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __35___DKMonitor_systemClockDidChange___block_invoke_2_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  [*(id *)(a1 + 32) setMachTimeAtLastClockChange:v2];
  [*(id *)(a1 + 32) setDateAtLastClockChange:v3];
}

void __23___DKMonitor_loadState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving state: %@", (uint8_t *)&v2, 0xCu);
}

void __23___DKMonitor_saveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 136446466;
  unint64_t v5 = "-[_DKMonitor saveState]_block_invoke";
  __int16 v6 = 2114;
  id v7 = (id)objc_opt_class();
  id v3 = v7;
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "%{public}s did _CDSharedMemoryKeyValueStore for %{public}@.", (uint8_t *)&v4, 0x16u);
}

void __51___DKMonitor_setCurrentEvent_inferHistoricalState___block_invoke_cold_1()
{
  v0 = [(id)objc_opt_class() eventStream];
  OUTLINED_FUNCTION_0_0(&dword_225002000, v1, v2, "Requested the previousEvent from instantState in setCurrentEvent, but received nil in stream: %@.", v3, v4, v5, v6, 2u);
}

void __35___DKMonitor_systemClockDidChange___block_invoke_2_cold_1()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_0_0(&dword_225002000, v1, v2, "Time changed by %@ seconds. Invalidating current event states.", v3, v4, v5, v6, 2u);
}

@end