@interface MKAutocompleteAnalyticsProvider
- (MKAutocompleteAnalyticsProvider)init;
- (MKAutocompleteAnalyticsState)currentState;
- (OS_dispatch_queue)isolationQueue;
- (id)captureNewMetrics;
- (void)setCurrentState:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)updateStateWithQuery:(id)a3 queryTokens:(id)a4 visibleSuggestionEntries:(id)a5;
@end

@implementation MKAutocompleteAnalyticsProvider

- (MKAutocompleteAnalyticsProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)MKAutocompleteAnalyticsProvider;
  v2 = [(MKAutocompleteAnalyticsProvider *)&v13 init];
  if (v2)
  {
    v3 = NSString;
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    v6 = [v3 stringWithFormat:@"%@.%@.isolationQueue.%p", v5, objc_opt_class(), v2];

    id v7 = v6;
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)updateStateWithQuery:(id)a3 queryTokens:(id)a4 visibleSuggestionEntries:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MKAutocompleteAnalyticsProvider *)self isolationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__MKAutocompleteAnalyticsProvider_updateStateWithQuery_queryTokens_visibleSuggestionEntries___block_invoke;
  v15[3] = &unk_1E54B9D00;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __93__MKAutocompleteAnalyticsProvider_updateStateWithQuery_queryTokens_visibleSuggestionEntries___block_invoke(uint64_t a1)
{
  v2 = [[MKAutocompleteAnalyticsState alloc] initWithQuery:*(void *)(a1 + 40) queryTokens:*(void *)(a1 + 48) suggestionEntries:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setCurrentState:v2];
}

- (id)captureNewMetrics
{
  v3 = [(MKAutocompleteAnalyticsProvider *)self isolationQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__27;
  id v12 = __Block_byref_object_dispose__27;
  id v13 = 0;
  v4 = [(MKAutocompleteAnalyticsProvider *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MKAutocompleteAnalyticsProvider_captureNewMetrics__block_invoke;
  v7[3] = &unk_1E54B8310;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__MKAutocompleteAnalyticsProvider_captureNewMetrics__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentState];

  if (v2)
  {
    v3 = [MKLocalSearchKeypressMetrics alloc];
    id v12 = [*(id *)(a1 + 32) currentState];
    v4 = [v12 query];
    id v5 = [*(id *)(a1 + 32) currentState];
    v6 = [v5 queryTokens];
    id v7 = [*(id *)(a1 + 32) currentState];
    uint64_t v8 = [v7 suggestionEntries];
    uint64_t v9 = [(MKLocalSearchKeypressMetrics *)v3 initWithQuery:v4 queryTokens:v6 suggestionEntries:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (MKAutocompleteAnalyticsState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end