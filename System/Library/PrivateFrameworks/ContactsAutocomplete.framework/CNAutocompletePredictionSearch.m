@interface CNAutocompletePredictionSearch
+ (unint64_t)predictedResultLimit;
+ (unint64_t)predictionStrategyForRequest:(id)a3;
- (CNAutocompletePredictionSearch)init;
- (CNAutocompletePredictionSearch)initWithContactStore:(id)a3;
- (CNContactStore)contactStore;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)strategyForRequest:(id)a3;
- (id)suggestionsForRequest:(id)a3;
@end

@implementation CNAutocompletePredictionSearch

- (CNAutocompletePredictionSearch)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v4 = [(CNAutocompletePredictionSearch *)self initWithContactStore:v3];

  return v4;
}

- (CNAutocompletePredictionSearch)initWithContactStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNAutocompletePredictionSearch;
  v6 = [(CNAutocompletePredictionSearch *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v9 = [v8 schedulerProvider];
    uint64_t v10 = [v9 backgroundSchedulerWithQualityOfService:4];
    scheduler = v7->_scheduler;
    v7->_scheduler = (CNScheduler *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v23 = v6;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against predictions CoreDuet/PeopleSuggester", buf, 0xCu);
  }

  v9 = [(CNAutocompletePredictionSearch *)self suggestionsForRequest:v6];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E63DDC28;
  id v10 = v7;
  id v21 = v10;
  [v9 addSuccessBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_2;
  v18[3] = &unk_1E63DDC50;
  id v19 = v10;
  id v11 = v10;
  [v9 addFailureBlock:v18];
  v12 = (void *)MEMORY[0x1E4F5A368];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_3;
  v16[3] = &unk_1E63DD9C0;
  id v17 = v9;
  id v13 = v9;
  objc_super v14 = [v12 tokenWithCancelationBlock:v16];

  return v14;
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__CNAutocompletePredictionSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)suggestionsForRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v6 = [(CNAutocompletePredictionSearch *)self strategyForRequest:v4];
  id v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  uint64_t v9 = v8;

  id v10 = CNALoggingContextTriage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v4 triageIdentifier];
    v12 = [v6 descriptionForLogging];
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    __int16 v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Will search %{public}@", buf, 0x16u);
  }
  scheduler = self->_scheduler;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __56__CNAutocompletePredictionSearch_suggestionsForRequest___block_invoke;
  v22 = &unk_1E63DDC78;
  id v23 = v6;
  id v24 = v4;
  uint64_t v26 = v9;
  id v25 = v5;
  id v14 = v5;
  id v15 = v4;
  id v16 = v6;
  [(CNScheduler *)scheduler performBlock:&v19];
  id v17 = objc_msgSend(v14, "future", v19, v20, v21, v22);

  return v17;
}

void __56__CNAutocompletePredictionSearch_suggestionsForRequest___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) searchResultsForFetchRequest:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v3 timestamp];
  double v5 = v4;

  id v6 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v5 - *(double *)(a1 + 56)];
  id v7 = CNALoggingContextTriage();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 40) triageIdentifier];
    uint64_t v9 = [v2 count];
    uint64_t v10 = [v2 count];
    id v11 = "results";
    int v18 = 138544130;
    __int16 v20 = 2048;
    uint64_t v19 = (uint64_t)v8;
    if (v10 == 1) {
      id v11 = "result";
    }
    uint64_t v21 = v9;
    __int16 v22 = 2080;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_1BEF57000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Search complete (%lu %s, %{public}@)", (uint8_t *)&v18, 0x2Au);
  }
  v12 = CNALoggingContextPerformance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v2 count];
    id v14 = [*(id *)(a1 + 32) descriptionForLogging];
    int v18 = 134218498;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v14;
    __int16 v22 = 2114;
    id v23 = (const char *)v6;
    _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_INFO, "Time to fetch %lu predictions results from %@: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  id v15 = CNALoggingContextDebug();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    id v17 = objc_msgSend(v2, "_cn_take:", 200);
    int v18 = 138412546;
    uint64_t v19 = (uint64_t)v16;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v17;
    _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_DEFAULT, "Predicted results (first 200 out of %@): %@", (uint8_t *)&v18, 0x16u);
  }
  [*(id *)(a1 + 48) finishWithResult:v2];
}

- (id)strategyForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() predictionStrategyForRequest:v4];

  contactStore = self->_contactStore;
  if (v5 == 1) {
    +[CNAutocompletePredictionSearchStrategy peopleSuggesterStrategyWithContactStore:contactStore];
  }
  else {
  id v7 = +[CNAutocompletePredictionSearchStrategy coreDuetStrategyWithContactStore:contactStore];
  }
  return v7;
}

+ (unint64_t)predictionStrategyForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v5 = [v4 userDefaults];
  char v6 = [v5 userHasOptedInToPreference:@"CNAlwaysUsePeopleSuggesterForPredictions"];

  unint64_t v7 = (v6 & 1) != 0 || [v3 searchType] == 2 || objc_msgSend(v3, "searchType") == 1;
  return v7;
}

+ (unint64_t)predictedResultLimit
{
  char v5 = 0;
  v2 = [MEMORY[0x1E4F5A568] standardPreferences];
  unint64_t v3 = [v2 integerForKey:@"CNAutocompleteDefaultsPredictedResultLimit" keyExists:&v5];

  if (v5) {
    return v3;
  }
  else {
    return 8;
  }
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end