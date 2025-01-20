@interface ICPredictionManager
@end

@implementation ICPredictionManager

uint64_t __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _quickTypePredictionWithTrigger:*(void *)(a1 + 40) searchContext:*(void *)(a1 + 48) timeoutInMilliseconds:*(int *)(a1 + 56) error:a2];
}

id __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke_2(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98___ICPredictionManager__quickTypePredictionWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __98___ICPredictionManager__quickTypePredictionWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke_cold_1((uint64_t)v7, v8, v9);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    v11 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained[4] addResults:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __46___ICPredictionManager_searchForMeCardRegions__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53___ICPredictionManager_searchForMeCardEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42___ICPredictionManager_setLastUsedSource___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    WeakRetained = v3;
  }
}

void __60___ICPredictionManager_provideFeedbackForString_type_style___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *((id *)WeakRetained + 1);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "name", (void)v12);
          int v11 = [v10 isEqualToString:v3[2]];

          if (v11) {
            [v9 provideFeedbackForString:*(void *)(a1 + 32) type:*(unsigned __int8 *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 49)];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

void __46___ICPredictionManager_propogateMetrics_data___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *((id *)WeakRetained + 1);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "name", (void)v12);
          int v11 = [v10 isEqualToString:v3[2]];

          if (v11) {
            [v9 propogateMetrics:*(void *)(a1 + 32) data:*(void *)(a1 + 40)];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

void __98___ICPredictionManager__quickTypePredictionWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2(&dword_235496000, a2, a3, "Error during quickTypePredictionWithTrigger: %@", (uint8_t *)&v3);
}

@end