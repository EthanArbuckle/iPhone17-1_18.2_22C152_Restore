@interface HKWorkoutRouteStore
@end

@implementation HKWorkoutRouteStore

uint64_t __46___HKWorkoutRouteStore__setLocations_forUUID___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "_queue_checkAndReturnIfLocationsLoaded");
}

uint64_t __41___HKWorkoutRouteStore_setWorkoutRoutes___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_queue_addWorkoutRoutes:", v3);
}

uint64_t __41___HKWorkoutRouteStore_addWorkoutRoutes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addWorkoutRoutes:", *(void *)(a1 + 40));
}

void __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (v11)
  {
    _HKInitializeLogging();
    v12 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke_cold_1(a1, (uint64_t)v11, v12);
    }
  }
  [*(id *)(a1 + 40) addObjectsFromArray:v10];
  if (a4)
  {
    _HKInitializeLogging();
    v13 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v13;
      LODWORD(v14) = [v14 count];
      v16 = [*(id *)(a1 + 32) UUID];
      v20[0] = 67109378;
      v20[1] = v14;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, "[routes] Fetched %d locations for series: %@. ", (uint8_t *)v20, 0x12u);
    }
    uint64_t v18 = *(void *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v19 = [*(id *)(a1 + 32) UUID];
    [v17 _setLocations:v18 forUUID:v19];
  }
}

uint64_t __31___HKWorkoutRouteStore_samples__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __40___HKWorkoutRouteStore__queue_locations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __59___HKWorkoutRouteStore__fetchAllLocationsFromSeriesSample___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[routes] Error occurred while querying locations for series %@: %@", (uint8_t *)&v4, 0x16u);
}

@end