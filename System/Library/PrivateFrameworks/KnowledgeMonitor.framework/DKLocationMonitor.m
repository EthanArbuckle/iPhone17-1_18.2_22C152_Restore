@interface DKLocationMonitor
@end

@implementation DKLocationMonitor

void __26___DKLocationMonitor_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  id v8 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/SystemCustomization.bundle"];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 queue];
  uint64_t v5 = [v2 initWithEffectiveBundle:v8 delegate:v3 onQueue:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v5;
}

uint64_t __27___DKLocationMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) startMonitoringVisits];
}

uint64_t __26___DKLocationMonitor_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) stopMonitoringVisits];
}

void __35___DKLocationMonitor__handleVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __35___DKLocationMonitor__handleVisit___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  else
  {
    uint64_t v5 = [a2 valueForKey:@"identifier"];
    uint64_t v6 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_225002000, v6, OS_LOG_TYPE_INFO, "_DKLocationMonitor LOIs nearby %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = [MEMORY[0x263F351B8] userContext];
    id v8 = [MEMORY[0x263F351D0] keyPathForNearbyLOIIdentifiers];
    [v7 setObject:v5 forKeyedSubscript:v8];
  }
}

void __35___DKLocationMonitor__handleVisit___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "_DKLocationMonitor CoreRoutine Fetch LOIs error: %@", (uint8_t *)&v2, 0xCu);
}

@end