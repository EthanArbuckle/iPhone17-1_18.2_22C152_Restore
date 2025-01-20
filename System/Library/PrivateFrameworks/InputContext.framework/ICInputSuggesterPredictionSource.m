@interface ICInputSuggesterPredictionSource
@end

@implementation ICInputSuggesterPredictionSource

void __41___ICInputSuggesterPredictionSource_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] lock];
    uint64_t v3 = [MEMORY[0x263F618C8] sharedInstance];
    id v4 = v2[5];
    v2[5] = (id)v3;

    [v2[1] broadcast];
    [v2[1] unlock];
  }
  v5 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __41___ICInputSuggesterPredictionSource_init__block_invoke_cold_1(v5);
  }
}

void __69___ICInputSuggesterPredictionSource__populateError_withExplanations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F618D0] stringFromExplanationCode:a2];
  if ([v3 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __128___ICInputSuggesterPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __70___ICInputSuggesterPredictionSource_requestFromTrigger_searchContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (objc_class *)MEMORY[0x263F64248];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = (id)[[v7 alloc] initWithString:v10 senderID:v8 timestamp:v9];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v11];
}

void __41___ICInputSuggesterPredictionSource_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_235496000, log, OS_LOG_TYPE_DEBUG, "People Suggester shared instance retrieved", v1, 2u);
}

@end