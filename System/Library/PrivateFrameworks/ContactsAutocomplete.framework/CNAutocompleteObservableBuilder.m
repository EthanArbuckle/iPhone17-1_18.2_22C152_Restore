@interface CNAutocompleteObservableBuilder
+ (BOOL)supplementalResultsUseNetwork:(unint64_t)a3;
+ (id)builderWithSearchType:(unint64_t)a3 scheduler:(id)a4 probeProvider:(id)a5;
- (BOOL)supplementalResultsUseNetwork;
- (CNAutocompleteObservableBuilder)initWithBatchingHelper:(id)a3 probeProvider:(id)a4 scheduler:(id)a5;
- (CNAutocompleteObservableBuilderBatchingHelper)batchingHelper;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNScheduler)scheduler;
- (double)networkActivityStartDelay;
- (id)combineObservablesInBatch:(id)a3 scheduler:(id)a4;
- (id)makeObservable;
- (id)networkActivityDidStartHandler;
- (id)networkActivityDidStopHandler;
- (id)probeObservable:(id)a3 forPerformanceWithBlock:(id)a4;
- (void)addCachedCalendarServerObservable:(id)a3;
- (void)addCachedDirectoryServerObservable:(id)a3;
- (void)addCalendarServerObservable:(id)a3;
- (void)addContactsObservable:(id)a3;
- (void)addCoreRecentsObservable:(id)a3;
- (void)addDirectoryServerObservable:(id)a3;
- (void)addLocalExtensionObservable:(id)a3;
- (void)addPredictionObservable:(id)a3 doOnTimeout:(id)a4;
- (void)addStewieObservable:(id)a3;
- (void)addSuggestionsObservable:(id)a3;
- (void)addSupplementalObservable:(id)a3;
- (void)setNetworkActivityDidStartHandler:(id)a3;
- (void)setNetworkActivityDidStopHandler:(id)a3;
- (void)setNetworkActivityStartDelay:(double)a3;
- (void)setSupplementalResultsUseNetwork:(BOOL)a3;
@end

@implementation CNAutocompleteObservableBuilder

+ (id)builderWithSearchType:(unint64_t)a3 scheduler:(id)a4 probeProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[CNAutocompleteObservableBuilderBatchingHelperFactory batchingHelperForSearchType:a3];
  v11 = (void *)[objc_alloc((Class)a1) initWithBatchingHelper:v10 probeProvider:v8 scheduler:v9];

  objc_msgSend(v11, "setSupplementalResultsUseNetwork:", objc_msgSend(a1, "supplementalResultsUseNetwork:", a3));
  return v11;
}

+ (BOOL)supplementalResultsUseNetwork:(unint64_t)a3
{
  return 0;
}

- (CNAutocompleteObservableBuilder)initWithBatchingHelper:(id)a3 probeProvider:(id)a4 scheduler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteObservableBuilder;
  v12 = [(CNAutocompleteObservableBuilder *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_batchingHelper, a3);
    objc_storeStrong((id *)&v13->_probeProvider, a4);
    objc_storeStrong((id *)&v13->_scheduler, a5);
    v14 = v13;
  }

  return v13;
}

- (id)probeObservable:(id)a3 forPerformanceWithBlock:(id)a4
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A480];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke;
  v9[3] = &unk_1E63DE258;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  id v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E4F5A488];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_2;
  v17[3] = &unk_1E63DE230;
  v19 = v20;
  id v18 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_3;
  v15[3] = &unk_1E63DD9C0;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_4;
  v13 = &unk_1E63DDE50;
  id v6 = v16;
  id v14 = v6;
  v7 = [v5 observerWithResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  _Block_object_dispose(v20, 8);
  return v8;
}

void __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
  [*(id *)(a1 + 32) observerDidReceiveResult:v3];
}

uint64_t __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __75__CNAutocompleteObservableBuilder_probeObservable_forPerformanceWithBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (void)addContactsObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_18];
  v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v7 = [v4 localObservableWithScheduler:v5];

  id v6 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v6 addContactsObservable:v7];
}

uint64_t __57__CNAutocompleteObservableBuilder_addContactsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfContactResults:inTimeInterval:");
}

- (void)addCoreRecentsObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_8_0];
  v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v7 = [v4 localObservableWithScheduler:v5];

  id v6 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v6 addCoreRecentsObservable:v7];
}

uint64_t __60__CNAutocompleteObservableBuilder_addCoreRecentsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfRecentResults:inTimeInterval:");
}

- (void)addStewieObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_10_0];
  v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v7 = [v4 localObservableWithScheduler:v5];

  id v6 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v6 addStewieObservable:v7];
}

uint64_t __55__CNAutocompleteObservableBuilder_addStewieObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfStewieResults:inTimeInterval:");
}

- (void)addSuggestionsObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_12_0];
  v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v7 = [v4 localObservableWithScheduler:v5];

  id v6 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v6 addSuggestionsObservable:v7];
}

uint64_t __60__CNAutocompleteObservableBuilder_addSuggestionsObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfSuggestionResults:inTimeInterval:");
}

- (void)addLocalExtensionObservable:(id)a3
{
  id v4 = a3;
  v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v7 = [v4 localObservableWithScheduler:v5];

  id v6 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v6 addLocalExtensionObservable:v7];
}

- (void)addPredictionObservable:(id)a3 doOnTimeout:(id)a4
{
  id v6 = a4;
  id v7 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_14];
  id v8 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v10 = [v7 localObservableWithScheduler:v8 doOnTimeout:v6];

  id v9 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v9 addPredictionObservable:v10];
}

uint64_t __71__CNAutocompleteObservableBuilder_addPredictionObservable_doOnTimeout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfPredictionResults:inTimeInterval:");
}

- (void)addSupplementalObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_16_0];
  if ([(CNAutocompleteObservableBuilder *)self supplementalResultsUseNetwork])
  {
    v5 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStartHandler];
    uint64_t v6 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStopHandler];
    [(CNAutocompleteObservableBuilder *)self networkActivityStartDelay];
    double v8 = v7;
    id v9 = [(CNAutocompleteObservableBuilder *)self scheduler];
    id v11 = [v4 networkObservableWithActivityDidStartHandler:v5 activityDidStopHandler:v6 timeoutDelay:v9 subscriptionDelay:30.0 scheduler:v8];

    id v4 = (void *)v6;
  }
  else
  {
    v5 = [(CNAutocompleteObservableBuilder *)self scheduler];
    id v11 = [v4 localObservableWithScheduler:v5];
  }

  id v10 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v10 addSupplementalObservable:v11];
}

uint64_t __61__CNAutocompleteObservableBuilder_addSupplementalObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfSupplementalResults:inTimeInterval:");
}

- (void)addCachedDirectoryServerObservable:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v5 addCachedDirectoryServerObservable:v4];
}

- (void)addDirectoryServerObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_18_0];
  id v5 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStartHandler];
  uint64_t v6 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStopHandler];
  [(CNAutocompleteObservableBuilder *)self networkActivityStartDelay];
  double v8 = v7;
  id v9 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v11 = [v4 networkObservableWithActivityDidStartHandler:v5 activityDidStopHandler:v6 timeoutDelay:v9 subscriptionDelay:30.0 scheduler:v8];

  id v10 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v10 addDirectoryServerObservable:v11];
}

uint64_t __64__CNAutocompleteObservableBuilder_addDirectoryServerObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfDirectoryServerResults:inTimeInterval:");
}

- (void)addCachedCalendarServerObservable:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStartHandler];
  uint64_t v6 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStopHandler];
  [(CNAutocompleteObservableBuilder *)self networkActivityStartDelay];
  double v8 = v7;
  id v9 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v11 = [v4 networkObservableWithActivityDidStartHandler:v5 activityDidStopHandler:v6 timeoutDelay:v9 subscriptionDelay:2.0 scheduler:v8];

  id v10 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v10 addCachedCalendarServerObservable:v11];
}

- (void)addCalendarServerObservable:(id)a3
{
  id v4 = [(CNAutocompleteObservableBuilder *)self probeObservable:a3 forPerformanceWithBlock:&__block_literal_global_20_0];
  id v5 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStartHandler];
  uint64_t v6 = [(CNAutocompleteObservableBuilder *)self networkActivityDidStopHandler];
  [(CNAutocompleteObservableBuilder *)self networkActivityStartDelay];
  double v8 = v7;
  id v9 = [(CNAutocompleteObservableBuilder *)self scheduler];
  id v11 = [v4 networkObservableWithActivityDidStartHandler:v5 activityDidStopHandler:v6 timeoutDelay:v9 subscriptionDelay:30.0 scheduler:v8];

  id v10 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  [v10 addCalendarServerObservable:v11];
}

uint64_t __63__CNAutocompleteObservableBuilder_addCalendarServerObservable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordNumberOfCalendarServerResults:inTimeInterval:");
}

- (id)combineObservablesInBatch:(id)a3 scheduler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    double v7 = [MEMORY[0x1E4F5A480] forkJoin:v5 scheduler:v6];
    double v8 = [v7 map:&__block_literal_global_23];
  }
  else
  {
    double v8 = [MEMORY[0x1E4F5A480] emptyObservable];
  }

  return v8;
}

- (id)makeObservable
{
  id v3 = [(CNAutocompleteObservableBuilder *)self batchingHelper];
  id v4 = [v3 batchedObservables];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__CNAutocompleteObservableBuilder_makeObservable__block_invoke;
  v10[3] = &unk_1E63DE2C0;
  v10[4] = self;
  id v5 = objc_msgSend(v4, "_cn_map:", v10);

  id v6 = (void *)MEMORY[0x1E4F5A480];
  double v7 = [(CNAutocompleteObservableBuilder *)self scheduler];
  double v8 = [v6 progressiveForkJoin:v5 scheduler:v7];

  return v8;
}

id __49__CNAutocompleteObservableBuilder_makeObservable__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 scheduler];
  id v5 = [v2 combineObservablesInBatch:v3 scheduler:v4];

  return v5;
}

- (CNAutocompleteObservableBuilderBatchingHelper)batchingHelper
{
  return self->_batchingHelper;
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (double)networkActivityStartDelay
{
  return self->_networkActivityStartDelay;
}

- (void)setNetworkActivityStartDelay:(double)a3
{
  self->_networkActivityStartDelay = a3;
}

- (BOOL)supplementalResultsUseNetwork
{
  return self->_supplementalResultsUseNetwork;
}

- (void)setSupplementalResultsUseNetwork:(BOOL)a3
{
  self->_supplementalResultsUseNetwork = a3;
}

- (id)networkActivityDidStartHandler
{
  return self->_networkActivityDidStartHandler;
}

- (void)setNetworkActivityDidStartHandler:(id)a3
{
}

- (id)networkActivityDidStopHandler
{
  return self->_networkActivityDidStopHandler;
}

- (void)setNetworkActivityDidStopHandler:(id)a3
{
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_networkActivityDidStopHandler, 0);
  objc_storeStrong(&self->_networkActivityDidStartHandler, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_batchingHelper, 0);
}

@end