@interface DKLocationCoordinatesMonitor
@end

@implementation DKLocationCoordinatesMonitor

uint64_t __36___DKLocationCoordinatesMonitor_log__block_invoke()
{
  log_log_1 = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKLocationCoordinatesMonitor");
  return MEMORY[0x270F9A758]();
}

uint64_t __37___DKLocationCoordinatesMonitor_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F00A60]);
  v3 = *(void **)(a1 + 32);
  v4 = [v3 queue];
  uint64_t v5 = [v2 initWithEffectiveBundlePath:@"/System/Library/LocationBundles/SystemCustomization.bundle" delegate:v3 onQueue:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v5;

  double v8 = *MEMORY[0x263F00B38];
  v9 = *(void **)(*(void *)(a1 + 32) + 152);
  return [v9 setDesiredAccuracy:v8];
}

uint64_t __37___DKLocationCoordinatesMonitor_init__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAndCacheLOIs];
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  v7 = +[_DKLocationCoordinatesMonitor log];
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_INFO, "Cached Routine Home LOI", v10, 2u);
    }

    double v8 = [v6 location];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setHome:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_cold_1();
  }
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  v7 = +[_DKLocationCoordinatesMonitor log];
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_INFO, "Cached Routine Work LOI", v10, 2u);
    }

    double v8 = [v6 location];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setWork:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_21_cold_1();
  }
}

uint64_t __38___DKLocationCoordinatesMonitor_start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) startUpdatingLocation];
}

void __37___DKLocationCoordinatesMonitor_stop__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) stopUpdatingLocation];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  dispatch_suspend(v2);
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_225002000, v0, v1, "No Routine Home LOIs: %{public}@", v2, v3, v4, v5, v6);
}

void __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_225002000, v0, v1, "No Routine Work LOIs: %{public}@", v2, v3, v4, v5, v6);
}

@end