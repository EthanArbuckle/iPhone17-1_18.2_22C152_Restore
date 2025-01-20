@interface CNAutocompleteLocalExtensionSearch
- (CLSDataStore)dataStore;
- (CNAutocompleteLocalExtensionSearch)init;
- (CNAutocompleteLocalExtensionSearch)initWithDataStore:(id)a3;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation CNAutocompleteLocalExtensionSearch

- (CNAutocompleteLocalExtensionSearch)init
{
  v3 = [MEMORY[0x1E4F195F8] shared];
  v4 = [(CNAutocompleteLocalExtensionSearch *)self initWithDataStore:v3];

  return v4;
}

- (CNAutocompleteLocalExtensionSearch)initWithDataStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteLocalExtensionSearch;
  v6 = [(CNAutocompleteLocalExtensionSearch *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v19 = v6;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against local extensions", buf, 0xCu);
  }

  v9 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v9 timestamp];
  uint64_t v11 = v10;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__CNAutocompleteLocalExtensionSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E63DDFC8;
  uint64_t v17 = v11;
  id v16 = v7;
  id v12 = v7;
  v13 = [(CNAutocompleteLocalExtensionSearch *)self fetchContactsForFetchRequest:v6 completionHandler:v15];

  return v13;
}

void __71__CNAutocompleteLocalExtensionSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F5A530] sharedFormatter];
  v8 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v8 timestamp];
  uint64_t v10 = [v7 stringForTimeInterval:v9 - *(double *)(a1 + 40)];

  uint64_t v11 = CNALoggingContextPerformance();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v12)
    {
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_INFO, "Fetching from local extensions failed after %@. Error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      int v16 = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_INFO, "Time to fetch %@ contacts from local extensions: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v11 = CNALoggingContextDebug();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v15 = objc_msgSend(v5, "_cn_take:", 200);
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Local Extensions results (first 200 out of %@): %@", (uint8_t *)&v16, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  if (([v8 isCanceled] & 1) == 0)
  {
    if ([v6 shouldIncludeGroupResults])
    {
      if ([v6 addressableGroupResultStyle] == 1) {
        uint64_t v9 = 51;
      }
      else {
        uint64_t v9 = 19;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    if ([v6 includeDirectoryServers]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
    uint64_t v11 = self->_dataStore;
    id v12 = objc_alloc(MEMORY[0x1E4F19610]);
    v13 = [v6 searchString];
    v14 = (void *)[v12 initWithOptions:v9 behaviors:v10 searchString:v13];

    v15 = [(CLSDataStore *)self->_dataStore _cna_objectsMatching:v14];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke;
    v21[3] = &unk_1E63DDFF0;
    id v22 = v6;
    v23 = v11;
    id v16 = v7;
    id v24 = v16;
    uint64_t v17 = v11;
    [v15 addSuccessBlock:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke_10;
    v19[3] = &unk_1E63DDC50;
    id v20 = v16;
    [v15 addFailureBlock:v19];
  }
  return v8;
}

void __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CNALoggingContextDebug();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = [v3 count];
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Count of MAID objects: %lu", (uint8_t *)&v12, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) priorityDomainForSorting];
  id v6 = [*(id *)(a1 + 32) sendingAddress];
  id v7 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v5 sendingAddress:v6];

  id v8 = -[CNAClassKitResultTransformVisitor initWithFactory:dataStore:searchType:addressableGroupResultStyle:]([CNAClassKitResultTransformVisitor alloc], "initWithFactory:dataStore:searchType:addressableGroupResultStyle:", v7, *(void *)(a1 + 40), [*(id *)(a1 + 32) searchType], objc_msgSend(*(id *)(a1 + 32), "addressableGroupResultStyle"));
  uint64_t v9 = [(CNAClassKitResultTransformVisitor *)v8 reduceCollection:v3];
  uint64_t v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    int v12 = 134217984;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Count of converted MAID results: %lu", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __85__CNAutocompleteLocalExtensionSearch_fetchContactsForFetchRequest_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CNALoggingContextDebug();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "MAID search failure: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CLSDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
}

@end