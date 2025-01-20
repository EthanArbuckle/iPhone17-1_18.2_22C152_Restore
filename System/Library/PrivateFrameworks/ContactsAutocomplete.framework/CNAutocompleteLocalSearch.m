@interface CNAutocompleteLocalSearch
+ (BOOL)shouldIncludeGroupResultsForRequest:(id)a3;
- (CNAutocompleteLocalSearch)init;
- (CNAutocompleteLocalSearch)initWithContactStore:(id)a3 contactFetcherStore:(id)a4;
- (CNContactStore)contactFetcherStore;
- (CNContactStore)contactStore;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)groupsForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5;
- (id)peopleForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5;
- (void)setContactFetcherStore:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNAutocompleteLocalSearch

- (CNAutocompleteLocalSearch)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v4 setIncludeLocalContacts:1];
  [v4 setIncludeSuggestedContacts:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v4];
  v6 = [(CNAutocompleteLocalSearch *)self initWithContactStore:v3 contactFetcherStore:v5];

  return v6;
}

- (CNAutocompleteLocalSearch)initWithContactStore:(id)a3 contactFetcherStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteLocalSearch;
  v9 = [(CNAutocompleteLocalSearch *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contactFetcherStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v9 = [v8 schedulerProvider];
  v10 = [v9 backgroundScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E63DE040;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  objc_super v13 = [v10 performCancelableBlock:v15];

  return v13;
}

void __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CNALoggingContextDebug();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v25 = v5;
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Executing request %p against local contacts", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  if (([v3 isCanceled] & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    v10 = [v8 contactStore];
    id v11 = [*(id *)(a1 + 40) contactFetcherStore];
    id v12 = [v8 groupsForRequest:v9 contactStore:v10 contactFetcherStore:v11];
    [v6 addObjectsFromArray:v12];

    if (([v3 isCanceled] & 1) == 0)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      objc_super v13 = *(void **)(a1 + 40);
      v15 = [v13 contactStore];
      id v16 = [*(id *)(a1 + 40) contactFetcherStore];
      v17 = [v13 peopleForRequest:v14 contactStore:v15 contactFetcherStore:v16];
      [v6 addObjectsFromArray:v17];

      id v18 = CNALoggingContextPerformance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        [v7 timeIntervalSinceNow];
        *(_DWORD *)buf = 138412546;
        v25 = v19;
        __int16 v26 = 2048;
        double v27 = v20 * -1000.0;
        _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_INFO, "Time to fetch %@ local contacts and groups: %.3fms", buf, 0x16u);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke_6;
      v21[3] = &unk_1E63DE0B0;
      id v23 = *(id *)(a1 + 48);
      id v22 = v6;
      [v3 performBlock:v21];
    }
  }
}

uint64_t __62__CNAutocompleteLocalSearch_executeRequest_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)peopleForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[CNAutocompleteLocalQuery peopleQuery];
  [v10 setRequest:v9];

  [v10 setContactStore:v8];
  [v10 setContactFetcherStore:v7];

  id v11 = [v10 run];

  return v11;
}

- (id)groupsForRequest:(id)a3 contactStore:(id)a4 contactFetcherStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(id)objc_opt_class() shouldIncludeGroupResultsForRequest:v7])
  {
    v10 = +[CNAutocompleteLocalQuery groupsQuery];
    [v10 setRequest:v7];
    [v10 setContactStore:v8];
    [v10 setContactFetcherStore:v9];
    id v11 = [v10 run];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (BOOL)shouldIncludeGroupResultsForRequest:(id)a3
{
  id v3 = a3;
  if ([v3 searchType] == 1 || objc_msgSend(v3, "searchType") == 2) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 shouldIncludeGroupResults];
  }

  return v4;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactFetcherStore
{
  return self->_contactFetcherStore;
}

- (void)setContactFetcherStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFetcherStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end