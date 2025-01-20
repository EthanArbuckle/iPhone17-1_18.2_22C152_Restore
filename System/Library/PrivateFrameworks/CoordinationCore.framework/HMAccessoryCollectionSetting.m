@interface HMAccessoryCollectionSetting
@end

@implementation HMAccessoryCollectionSetting

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_setAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_, v2, (void *)1);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    dispatch_time_t v4 = dispatch_time(0, 90000000);
    v5 = dispatch_get_global_queue(25, 0);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_2;
    v18 = &unk_2645CB8D8;
    objc_copyWeak(v20, &location);
    uint64_t v19 = *(void *)(a1 + 32);
    v20[1] = v3;
    dispatch_after(v4, v5, &v15);

    v6 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v7;
      _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "Preparing coalesced writes for %p", buf, 0xCu);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v2, "addObject:", *(void *)(a1 + 40), v15, v16, v17, v18);
  v8 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 40);
    v9 = (id *)(a1 + 40);
    uint64_t v11 = (uint64_t)*(v9 - 1);
    uint64_t v12 = [v10 type];
    v13 = [*v9 alarm];
    v14 = [v13 alarmID];
    *(_DWORD *)buf = 134218498;
    uint64_t v23 = v11;
    __int16 v24 = 2048;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p enqueued %ld for %@", buf, 0x20u);
  }
}

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_2(id *a1)
{
  id v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    dispatch_time_t v4 = objc_msgSend(a1[4], "co_cachedWrite");

    if (v4)
    {
      dispatch_time_t v5 = dispatch_time(0, 90000000);
      v6 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_3;
      block[3] = &unk_2645CB8D8;
      objc_copyWeak(v8, v2);
      v8[1] = a1[6];
      block[4] = WeakRetained;
      dispatch_after(v5, v6, block);

      objc_destroyWeak(v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "co_flushQueue");
    }
  }
}

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    AnalyticsSendEventLazy();
    objc_msgSend(*(id *)(a1 + 32), "co_flushQueue");
  }
}

id __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_4(uint64_t a1)
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = @"duration";
  v1 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 32) / 1000000000.0];
  v4[1] = @"items";
  v4[2] = @"replacements";
  v5[0] = v1;
  v5[1] = &unk_26D3EB7E8;
  v5[2] = &unk_26D3EB7E8;
  v5[3] = @"delayed";
  v4[3] = @"domain";
  v4[4] = @"code";
  v5[4] = &unk_26D3EB800;
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

void __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_time_t v5 = *(void **)(a1 + 32);
  objc_setAssociatedObject(v5, sel_co_enqueueOperation_, 0, (void *)1);
}

uint64_t __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 performOperationWithMappedAlarms:*(void *)(a1 + 32)] ^ 1;
}

void __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_time_t v4 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v5;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "%p completed coalesced writes", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "completion", (void)v12);
        uint64_t v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id))v11)[2](v11, v3);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

uint64_t __73__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_cachedWrite__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_cachedWrite);
  return MEMORY[0x270F9A758]();
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  objc_setAssociatedObject(*(id *)(a1 + 32), sel_co_cachedWrite, *(id *)(a1 + 40), (void *)3);
  uint64_t v2 = objc_getAssociatedObject(*(id *)v1, "co_observer");
  id v3 = (void *)v2;
  if (*(void *)(v1 + 8))
  {
    dispatch_time_t v4 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_3(v1, v4, v5, v6, v7, v8, v9, v10);
    }

    if (!v3)
    {
      uint64_t v11 = COCoreLogForCategory(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_2(v1, v11, v12, v13, v14, v15, v16, v17);
      }

      objc_initWeak(&location, *(id *)v1);
      uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
      id v19 = *(id *)v1;
      v20 = [MEMORY[0x263F08A48] currentQueue];
      uint64_t v21 = *MEMORY[0x263F0B5B0];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_54;
      v30[3] = &unk_2645CB950;
      objc_copyWeak(&v31, &location);
      id v3 = [v18 addObserverForName:v21 object:v19 queue:v20 usingBlock:v30];

      objc_setAssociatedObject(*(id *)v1, "co_observer", v3, (void *)1);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (v2)
    {
      v22 = [MEMORY[0x263F08A00] defaultCenter];
      [v22 removeObserver:v3];
    }
    objc_setAssociatedObject(*(id *)v1, "co_observer", 0, (void *)1);
    uint64_t v23 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_1(v1, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "co_setCachedWrite:", 0);
    id WeakRetained = v2;
  }
}

void __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a1 + 64);
  if (v3)
  {
    __uint64_t v12 = v4;
    uint64_t v5 = &v9;
    id v9 = *(id *)(a1 + 32);
    uint64_t v6 = &v10;
    id v10 = *(id *)(a1 + 40);
    id v11 = v3;
    AnalyticsSendEventLazy();
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_2;
    uint64_t v16 = &unk_2645CB978;
    v18[1] = v4;
    uint64_t v5 = &v17;
    id v17 = *(id *)(a1 + 32);
    uint64_t v6 = (id *)v18;
    v18[0] = *(id *)(a1 + 40);
    AnalyticsSendEventLazy();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v7 = WeakRetained;
    if (WeakRetained) {
      objc_msgSend(WeakRetained, "co_setCachedWrite:", *(void *)(a1 + 40));
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_2(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"duration";
  id v2 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 48) / 1000000000.0];
  v8[0] = v2;
  v7[1] = @"items";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v8[1] = v3;
  v7[2] = @"replacements";
  __uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  id v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

id __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_3(uint64_t a1)
{
  v10[5] = *MEMORY[0x263EF8340];
  v9[0] = @"duration";
  id v2 = [NSNumber numberWithDouble:(double)*(unint64_t *)(a1 + 56) / 1000000000.0];
  v10[0] = v2;
  v9[1] = @"items";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v10[1] = v3;
  v9[2] = @"replacements";
  __uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v10[2] = v4;
  v9[3] = @"domain";
  uint64_t v5 = [*(id *)(a1 + 48) domain];
  v10[3] = v5;
  v9[4] = @"code";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
  v10[4] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end