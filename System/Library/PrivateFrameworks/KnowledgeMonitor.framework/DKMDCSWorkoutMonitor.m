@interface DKMDCSWorkoutMonitor
@end

@implementation DKMDCSWorkoutMonitor

void __30___DKMDCSWorkoutMonitor_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F35258]];

  v7 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (void *)MEMORY[0x263F351D0];
    id v9 = v7;
    v10 = [v8 sessionState];
    v11 = [v9 objectForKeyedSubscript:v10];

    v12 = __HKWorkoutSessionStateName(2);
    [v11 isEqualToString:v12];
  }
  else
  {
    v13 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __30___DKMDCSWorkoutMonitor_start__block_invoke_cold_1((uint64_t)v6, v13);
    }
  }
}

void __30___DKMDCSWorkoutMonitor_start__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "MDCS Workout payload is not dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end