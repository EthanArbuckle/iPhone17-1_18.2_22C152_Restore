@interface ATXAppLaunchLocation
@end

@implementation ATXAppLaunchLocation

void __51___ATXAppLaunchLocation_resetAppIntentLocationData__block_invoke(uint64_t a1, void *a2)
{
  v10 = a2;
  uint64_t v2 = objc_opt_new();
  v3 = (void *)v10[3];
  v10[3] = v2;

  uint64_t v4 = objc_opt_new();
  v5 = (void *)v10[4];
  v10[4] = v4;

  uint64_t v6 = objc_opt_new();
  v7 = (void *)v10[5];
  v10[5] = v6;

  uint64_t v8 = objc_opt_new();
  v9 = (void *)v10[7];
  v10[7] = v8;

  [(id)objc_opt_class() writeModel:v10];
}

void __57___ATXAppLaunchLocation_launchProbabilityAtLOI_bundleId___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[2];
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = a2;
  uint64_t v6 = [v4 uuid];
  v7 = [v3 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (double)(int)[v8 intValue];

  v9 = (void *)v5[6];
  id v11 = [*(id *)(a1 + 32) uuid];
  v10 = [v9 objectForKeyedSubscript:v11];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (double)(int)[v10 intValue];
}

void __51___ATXAppLaunchLocation_launchCountAtLOI_bundleId___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 16);
  id v6 = [*(id *)(a1 + 32) uuid];
  uint64_t v4 = [v3 objectForKeyedSubscript:v6];
  v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 intValue];
}

void __58___ATXAppLaunchLocation_launchProbabilityAtLOI_appIntent___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[3];
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = a2;
  id v6 = [v4 uuid];
  v7 = [v3 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (double)(int)[v8 intValue];

  v9 = (void *)v5[7];
  id v11 = [*(id *)(a1 + 32) uuid];
  v10 = [v9 objectForKeyedSubscript:v11];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (double)(int)[v10 intValue];
}

void __73___ATXAppLaunchLocation_launchProbabilityAtLOI_appForAllIntentsBundleId___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[5];
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = a2;
  id v6 = [v4 uuid];
  v7 = [v3 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (double)(int)[v8 intValue];

  v9 = (void *)v5[7];
  id v11 = [*(id *)(a1 + 32) uuid];
  v10 = [v9 objectForKeyedSubscript:v11];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (double)(int)[v10 intValue];
}

void __43___ATXAppLaunchLocation_trainWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
    [*(id *)(a1 + 32) _trainModelWithLOI:v5 startDate:v7];
  }
  else
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43___ATXAppLaunchLocation_trainWithCallback___block_invoke_cold_1();
    }
  }

  uint64_t v8 = __atxlog_handle_default();
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v13 = 136446210;
    v14 = "_ATXAppLaunchLocation";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v9, OS_SIGNPOST_INTERVAL_END, v10, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
  id v12 = self;
}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = v20;
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];

    if (!v8)
    {
      v9 = objc_opt_new();
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
    }
    os_signpost_id_t v10 = NSNumber;
    uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    id v12 = [v7 bundleId];
    int v13 = [v11 objectForKeyedSubscript:v12];
    v14 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
    uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v16 = [v7 bundleId];

    [v15 setObject:v14 forKeyedSubscript:v16];
    v17 = NSNumber;
    v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v5];
  }
}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"_ATXAppLaunchLocation.m" lineNumber:218 description:@"Expected ATXIntentEvent class"];
  }
  id v7 = *(void **)(a1 + 40);
  id v41 = v5;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v9 = objc_opt_new();
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];
  }
  os_signpost_id_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];

  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v6];
  }
  id v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];

  if (!v12)
  {
    int v13 = objc_opt_new();
    [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:v6];
  }
  v14 = (void *)MEMORY[0x1E4F4AE38];
  uint64_t v15 = [v41 bundleId];
  v16 = [v41 intentType];
  v17 = [v14 getActionKeyForBundleId:v15 actionType:v16];

  v18 = NSNumber;
  v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
  id v20 = [v19 objectForKeyedSubscript:v17];
  v21 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v20, "integerValue") + 1);
  v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
  [v22 setObject:v21 forKeyedSubscript:v17];

  v23 = NSNumber;
  v24 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
  v25 = [v41 intentType];
  v26 = [v24 objectForKeyedSubscript:v25];
  v27 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v26, "integerValue") + 1);
  v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
  v29 = [v41 intentType];
  [v28 setObject:v27 forKeyedSubscript:v29];

  v30 = NSNumber;
  v31 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
  v32 = [v41 bundleId];
  v33 = [v31 objectForKeyedSubscript:v32];
  v34 = objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
  v35 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
  v36 = [v41 bundleId];

  [v35 setObject:v34 forKeyedSubscript:v36];
  v37 = NSNumber;
  v38 = [*(id *)(a1 + 64) objectForKeyedSubscript:v6];
  v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue") + 1);
  [*(id *)(a1 + 64) setObject:v39 forKeyedSubscript:v6];
}

void __54___ATXAppLaunchLocation__trainModelWithLOI_startDate___block_invoke_3(id *a1, id *a2)
{
  objc_storeStrong(a2 + 2, a1[4]);
  uint64_t v4 = a2;
  objc_storeStrong(v4 + 3, a1[5]);
  objc_storeStrong(v4 + 4, a1[6]);
  objc_storeStrong(v4 + 5, a1[7]);
  objc_storeStrong(v4 + 6, a1[8]);
  objc_storeStrong(v4 + 7, a1[9]);
  [(id)objc_opt_class() writeModel:v4];
}

uint64_t __43___ATXAppLaunchLocation_sortTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3[1])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = (void *)MEMORY[0x1E4F93B10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_2;
    v7[3] = &unk_1E68B0380;
    objc_copyWeak(&v9, &location);
    id v8 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 registerForLockStateChangeNotifications:v7];
    unint64_t v6 = (void *)v3[1];
    v3[1] = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 3 || !a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v4 = __atxlog_handle_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_INFO, "Model data unlocked! Loading...", v5, 2u);
      }

      [WeakRetained[3] runWithLockAcquired:&__block_literal_global_83];
      [WeakRetained loadModelAtPath:*(void *)(a1 + 32)];
    }
  }
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_81(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F93B10];
  uint64_t v4 = a2[1];
  uint64_t v5 = a2;
  [v3 unregisterForLockStateChangeNotifications:v4];
  id v6 = (id)a2[1];
  a2[1] = 0;
}

void __41___ATXAppLaunchLocation_loadModelAtPath___block_invoke_91(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"appLaunchCountMapKey"];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appIntentLaunchCountMapKey"];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"intentLaunchCountMapKey"];
  os_signpost_id_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appForAllIntentsLaunchCountMapKey"];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"totalLaunchCountMapKey"];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"totalIntentLaunchCountMapKey"];
  id v16 = (id)v4[7];
  v4[7] = v15;
}

void __43___ATXAppLaunchLocation_trainWithCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error fetching locations: %@", v2, v3, v4, v5, v6);
}

@end