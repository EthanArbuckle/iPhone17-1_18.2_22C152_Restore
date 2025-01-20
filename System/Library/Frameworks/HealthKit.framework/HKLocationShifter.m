@interface HKLocationShifter
@end

@implementation HKLocationShifter

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(a2, a3);
  id v5 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [*(id *)(a1 + 32) altitude];
  double v7 = v6;
  [*(id *)(a1 + 32) horizontalAccuracy];
  double v9 = v8;
  [*(id *)(a1 + 32) verticalAccuracy];
  double v11 = v10;
  [*(id *)(a1 + 32) course];
  double v13 = v12;
  [*(id *)(a1 + 32) speed];
  double v15 = v14;
  v16 = [*(id *)(a1 + 32) timestamp];
  id v17 = (id)objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v16, v4.latitude, v4.longitude, v7, v9, v11, v13, v15);

  [*(id *)(a1 + 40) replaceObjectAtIndex:*(void *)(a1 + 56) withObject:v17];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  CLLocationCoordinate2D v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = [MEMORY[0x1E4F1CA98] null];
  [v5 replaceObjectAtIndex:v6 withObject:v7];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_14(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v12);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  if ((double)(unint64_t)[v2 count] >= ceilf((float)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count")* 0.5))
  {
    _HKInitializeLogging();
    double v9 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = v9;
      int v11 = [v2 count];
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[routes] Shifted %d valid locations", buf, 8u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "[routes] Error shifting coordinate at index %d: %{public}@", (uint8_t *)v4, 0x12u);
}

@end