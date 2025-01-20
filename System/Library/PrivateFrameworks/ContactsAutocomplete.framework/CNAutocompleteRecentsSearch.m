@interface CNAutocompleteRecentsSearch
- (CNAutocompleteRecentsSearch)init;
- (CNAutocompleteRecentsSearch)initWithCoreRecentContactsLibrary:(id)a3;
- (CRRecentContactsLibrary)library;
- (id)autocompleteResultsForRecentContacts:(id)a3 request:(id)a4;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (void)setLibrary:(id)a3;
@end

@implementation CNAutocompleteRecentsSearch

- (CNAutocompleteRecentsSearch)init
{
  v3 = [MEMORY[0x1E4F5CCE0] defaultInstance];
  v4 = [(CNAutocompleteRecentsSearch *)self initWithCoreRecentContactsLibrary:v3];

  return v4;
}

- (CNAutocompleteRecentsSearch)initWithCoreRecentContactsLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteRecentsSearch;
  v6 = [(CNAutocompleteRecentsSearch *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v28 = v6;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Executing request %p against recent contacts", buf, 0xCu);
  }

  v9 = [(CNAutocompleteRecentsSearch *)self library];
  objc_super v10 = +[CNAutocompleteRecentContactsLibrary library:v9 recentContactsWithRequest:v6];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke;
  v25[3] = &unk_1E63DEC08;
  v25[4] = self;
  id v26 = v6;
  id v11 = v6;
  v12 = [v10 flatMap:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_2;
  v23[3] = &unk_1E63DDC28;
  id v13 = v7;
  id v24 = v13;
  [v12 addSuccessBlock:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_3;
  v21[3] = &unk_1E63DDC50;
  id v22 = v13;
  id v14 = v13;
  [v12 addFailureBlock:v21];
  v15 = (void *)MEMORY[0x1E4F5A368];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_4;
  v19[3] = &unk_1E63DD9C0;
  id v20 = v12;
  id v16 = v12;
  v17 = [v15 tokenWithCancelationBlock:v19];

  return v17;
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) autocompleteResultsForRecentContacts:a2 request:*(void *)(a1 + 40)];
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__CNAutocompleteRecentsSearch_executeRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)autocompleteResultsForRecentContacts:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNAutocompleteRecentsSearch *)self library];
  v9 = +[CNAutocompleteRecentContactsTransform transformForRequest:v6 library:v8];

  objc_super v10 = objc_msgSend(v7, "_cn_map:", v9);

  id v11 = objc_msgSend(v10, "_cn_filter:", *MEMORY[0x1E4F5A280]);

  v12 = [CNAutocompleteResultTokenMatcher alloc];
  id v13 = [v6 searchString];

  id v14 = [(CNAutocompleteResultTokenMatcher *)v12 initWithSearchString:v13];
  v15 = [(CNAutocompleteResultTokenMatcher *)v14 filterAdapter];
  id v16 = objc_msgSend(v11, "_cn_filter:", v15);

  v17 = [MEMORY[0x1E4F5A408] futureWithResult:v16];

  return v17;
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end