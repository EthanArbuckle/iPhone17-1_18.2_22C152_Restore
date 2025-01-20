@interface ICPortraitPredictionSource
@end

@implementation ICPortraitPredictionSource

void __37___ICPortraitPredictionSource_warmUp__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_INFO, "_ICPPSource warmed up %@", (uint8_t *)&v4, 0xCu);
  }
}

void __35___ICPortraitPredictionSource_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] lock];
    int v4 = [*(id *)(a1 + 32) _makePPQuickTypeBroker];
    [v3 setPpBroker:v4];

    [v3[1] broadcast];
    [v3[1] unlock];
  }
  uint64_t v5 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __35___ICPortraitPredictionSource_init__block_invoke_cold_1();
  }
}

uint64_t __53___ICPortraitPredictionSource__makePPQuickTypeBroker__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F5D4D0] sharedInstance];
  v1 = (void *)_makePPQuickTypeBroker_broker;
  _makePPQuickTypeBroker_broker = v0;

  v2 = (void *)_makePPQuickTypeBroker_broker;
  return [v2 setClientIdentifier:@"ICPred"];
}

void __63___ICPortraitPredictionSource__populateError_withExplanations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F5D4D8] uniqueKeycodeFromExplanation:a2];
  if ([v3 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __84___ICPortraitPredictionSource__quickTypeQueryWithQuery_limit_timeoutInMilliseconds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (![v6 count])
  {
    v8 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_235496000, v8, OS_LOG_TYPE_INFO, "Portrait returned no results for Me card regions: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (![v6 count])
  {
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    [v8 _populateError:&obj withExplanations:v7];
    objc_storeStrong((id *)(v9 + 40), obj);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (![v6 count])
  {
    v8 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_235496000, v8, OS_LOG_TYPE_INFO, "Portrait returned no results for Me card regions: %@", buf, 0xCu);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v10 + 40);
    [v9 _populateError:&obj withExplanations:v7];
    objc_storeStrong((id *)(v10 + 40), obj);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __35___ICPortraitPredictionSource_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "PP Broker shared instance retrieved", v2, v3, v4, v5, v6);
}

@end