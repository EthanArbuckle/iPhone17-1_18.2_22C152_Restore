@interface CNAutocompleteSearchObservableProvider
+ (id)providerWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5;
- (BOOL)shouldAllowPredictionSearchToSourceResults;
- (CNAutocompleteFetchRequest)fetchRequest;
- (CNAutocompleteSearchObservableProvider)initWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5;
- (CNAutocompleteSearchProvider)searchProvider;
- (CNScheduler)scheduler;
- (OS_os_log)log;
- (id)calendarServersSearchObservable;
- (id)directoryServersSearchObservable;
- (id)localExtensionSearchObservables;
- (id)localSearchObservable;
- (id)observableWithWrappedSearchProviderGetter:(id)a3 name:(id)a4;
- (id)predictionsSearchObservableWithUnfilteredResultPromise:(id)a3;
- (id)recentsSearchObservable;
- (id)stewieSearchObservable;
- (id)suggestionsSearchObservable;
@end

@implementation CNAutocompleteSearchObservableProvider

+ (id)providerWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithSearchProvider:v10 fetchRequest:v9 scheduler:v8];

  return v11;
}

- (CNAutocompleteSearchObservableProvider)initWithSearchProvider:(id)a3 fetchRequest:(id)a4 scheduler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNAutocompleteSearchObservableProvider;
  v12 = [(CNAutocompleteSearchObservableProvider *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchProvider, a3);
    objc_storeStrong((id *)&v13->_fetchRequest, a4);
    objc_storeStrong((id *)&v13->_scheduler, a5);
    os_log_t v14 = os_log_create("com.apple.contacts.autocomplete", "debug");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    v16 = v13;
  }

  return v13;
}

- (id)localSearchObservable
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNAutocompleteSearchObservableProvider_localSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Local Contacts"];

  return v5;
}

uint64_t __63__CNAutocompleteSearchObservableProvider_localSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) localSearch];
}

- (id)recentsSearchObservable
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CNAutocompleteSearchObservableProvider_recentsSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Recent Contacts"];

  return v5;
}

uint64_t __65__CNAutocompleteSearchObservableProvider_recentsSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsSearch];
}

- (id)stewieSearchObservable
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CNAutocompleteSearchObservableProvider_stewieSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Stewie"];

  return v5;
}

uint64_t __64__CNAutocompleteSearchObservableProvider_stewieSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stewieSearch];
}

- (id)suggestionsSearchObservable
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CNAutocompleteSearchObservableProvider_suggestionsSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Suggested Contacts"];

  return v5;
}

uint64_t __69__CNAutocompleteSearchObservableProvider_suggestionsSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) suggestionsSearch];
}

- (id)predictionsSearchObservableWithUnfilteredResultPromise:(id)a3
{
  id v4 = a3;
  v5 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke;
  v18[3] = &unk_1E63DDE00;
  id v19 = v5;
  id v6 = v5;
  v7 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v18 name:@"Predictions"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_2;
  v16[3] = &unk_1E63DDE28;
  id v8 = v4;
  id v17 = v8;
  id v9 = [v7 doOnNext:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_3;
  v14[3] = &unk_1E63DDE50;
  id v15 = v8;
  id v10 = v8;
  id v11 = [v9 doOnError:v14];

  if (![(CNAutocompleteSearchObservableProvider *)self shouldAllowPredictionSearchToSourceResults])
  {
    uint64_t v12 = [v11 filter:&__block_literal_global_10];

    id v11 = (void *)v12;
  }

  return v11;
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) predictionSearch];
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __97__CNAutocompleteSearchObservableProvider_predictionsSearchObservableWithUnfilteredResultPromise___block_invoke_4()
{
  return 0;
}

- (BOOL)shouldAllowPredictionSearchToSourceResults
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self fetchRequest];
  if ([v3 searchType] == 2)
  {
    BOOL v4 = 1;
LABEL_9:

    return v4;
  }
  v5 = [(CNAutocompleteSearchObservableProvider *)self fetchRequest];
  uint64_t v6 = [v5 searchType];

  if (v6 != 1)
  {
    v3 = [(CNAutocompleteSearchObservableProvider *)self fetchRequest];
    v7 = [v3 searchString];
    if (v7)
    {
      id v8 = [(CNAutocompleteSearchObservableProvider *)self fetchRequest];
      id v9 = [v8 searchString];
      BOOL v4 = [v9 length] == 0;
    }
    else
    {
      BOOL v4 = 1;
    }

    goto LABEL_9;
  }
  return 1;
}

- (id)localExtensionSearchObservables
{
  v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  BOOL v4 = [v3 localExtensionSearches];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke;
  v7[3] = &unk_1E63DDE98;
  void v7[4] = self;
  v5 = objc_msgSend(v4, "_cn_map:", v7);

  return v5;
}

id __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke_2;
  v8[3] = &unk_1E63DDE00;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 observableWithWrappedSearchProviderGetter:v8 name:@"Local Extensions"];

  return v6;
}

id __73__CNAutocompleteSearchObservableProvider_localExtensionSearchObservables__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)directoryServersSearchObservable
{
  id v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CNAutocompleteSearchObservableProvider_directoryServersSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  id v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Directory Servers"];

  return v5;
}

uint64_t __74__CNAutocompleteSearchObservableProvider_directoryServersSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) directoryServerSearch];
}

- (id)calendarServersSearchObservable
{
  id v3 = [(CNAutocompleteSearchObservableProvider *)self searchProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CNAutocompleteSearchObservableProvider_calendarServersSearchObservable__block_invoke;
  v7[3] = &unk_1E63DDE00;
  id v8 = v3;
  id v4 = v3;
  id v5 = [(CNAutocompleteSearchObservableProvider *)self observableWithWrappedSearchProviderGetter:v7 name:@"Calendar Server"];

  return v5;
}

uint64_t __73__CNAutocompleteSearchObservableProvider_calendarServersSearchObservable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) calendarServerSearch];
}

- (id)observableWithWrappedSearchProviderGetter:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNAutocompleteSearchObservableProvider *)self log];
  id v9 = [CNAutocompleteObservable alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke;
  objc_super v18 = &unk_1E63DDEE8;
  id v19 = self;
  id v20 = v8;
  id v21 = v7;
  id v22 = v6;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  v13 = [(CNAutocompleteObservable *)v9 initWithBlock:&v15];
  -[CNAutocompleteObservable setDebugDescription:](v13, "setDebugDescription:", v10, v15, v16, v17, v18, v19);

  return v13;
}

id __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) scheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2;
  v10[3] = &unk_1E63DDEC0;
  id v15 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = [v4 performCancelableBlock:v10];

  return v8;
}

void __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) fetchRequest];
    id v6 = CNObserverCancelableCompletionHandler();
    id v7 = [v4 executeRequest:v5 completionHandler:v6];

    if (v7)
    {
      [v3 addCancelable:v7];
    }
    else
    {
      id v8 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2_cold_1(a1, v8);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) observerDidComplete];
  }
}

- (CNAutocompleteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
}

void __89__CNAutocompleteSearchObservableProvider_observableWithWrappedSearchProviderGetter_name___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEF57000, a2, OS_LOG_TYPE_ERROR, "searchToken (%{public}@) cannot be nil", (uint8_t *)&v3, 0xCu);
}

@end