@interface CNAutocompleteDirectoryServerSearch
- (CNAutocompleteDirectoryServerSearch)init;
- (CNAutocompleteDirectoryServerSearch)initWithContactStore:(id)a3;
- (CNContactStore)contactStore;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)setContactStore:(id)a3;
@end

@implementation CNAutocompleteDirectoryServerSearch

- (CNAutocompleteDirectoryServerSearch)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v4 = [(CNAutocompleteDirectoryServerSearch *)self initWithContactStore:v3];

  return v4;
}

- (CNAutocompleteDirectoryServerSearch)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteDirectoryServerSearch;
  v6 = [(CNAutocompleteDirectoryServerSearch *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  objc_super v9 = [v8 timeProvider];
  [v9 timestamp];
  uint64_t v11 = v10;

  v12 = CNALoggingContextTriage();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v6 triageIdentifier];
    v14 = [v6 searchString];
    *(_DWORD *)buf = 138543618;
    id v30 = v13;
    __int16 v31 = 2048;
    uint64_t v32 = [v14 length];
    _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Will search (%lu letters)", buf, 0x16u);
  }
  v15 = CNALoggingContextTriage();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  v17 = CNALoggingContextPerformance();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Searching Directory Servers", "", buf, 2u);
  }

  v19 = CNALoggingContextDebug();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v30 = v6;
    _os_log_impl(&dword_1BEF57000, v19, OS_LOG_TYPE_DEFAULT, "Executing request %p against directory servers", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__CNAutocompleteDirectoryServerSearch_executeRequest_completionHandler___block_invoke;
  v24[3] = &unk_1E63DE018;
  id v26 = v7;
  os_signpost_id_t v27 = v16;
  uint64_t v28 = v11;
  id v25 = v6;
  id v20 = v7;
  id v21 = v6;
  v22 = [(CNAutocompleteDirectoryServerSearch *)self fetchContactsForFetchRequest:v21 completionHandler:v24];

  return v22;
}

void __72__CNAutocompleteDirectoryServerSearch_executeRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = CNALoggingContextPerformance();
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Searching Directory Servers", "", (uint8_t *)&v26, 2u);
  }

  uint64_t v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v11 = [v10 timeProvider];
  [v11 timestamp];
  double v13 = v12;

  v14 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v13 - *(double *)(a1 + 56)];
  v15 = CNALoggingContextPerformance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    os_signpost_id_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v26 = 138412546;
    os_signpost_id_t v27 = v16;
    __int16 v28 = 2114;
    uint64_t v29 = (uint64_t)v14;
    _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_INFO, "Time to fetch %@ contacts on directory servers: %{public}@", (uint8_t *)&v26, 0x16u);
  }
  v17 = CNALoggingContextTriage();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v18)
    {
      v19 = [*(id *)(a1 + 32) triageIdentifier];
      int v26 = 138543874;
      os_signpost_id_t v27 = v19;
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)v14;
      __int16 v30 = 2114;
      __int16 v31 = v6;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Search failed (%{public}@): %{public}@", (uint8_t *)&v26, 0x20u);
    }
  }
  else
  {
    if (v18)
    {
      id v20 = [*(id *)(a1 + 32) triageIdentifier];
      uint64_t v21 = [v5 count];
      uint64_t v22 = [v5 count];
      v23 = "results";
      int v26 = 138544130;
      __int16 v28 = 2048;
      os_signpost_id_t v27 = v20;
      if (v22 == 1) {
        v23 = "result";
      }
      uint64_t v29 = v21;
      __int16 v30 = 2080;
      __int16 v31 = v23;
      __int16 v32 = 2114;
      uint64_t v33 = v14;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Directory Servers: Search complete (%lu %s, %{public}@)", (uint8_t *)&v26, 0x2Au);
    }
    v17 = CNALoggingContextDebug();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      id v25 = objc_msgSend(v5, "_cn_take:", 200);
      int v26 = 138412546;
      os_signpost_id_t v27 = v24;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v25;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "Directory Server results (first 200 out of %@): %@", (uint8_t *)&v26, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchContactsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  os_signpost_id_t v9 = [v8 schedulerProvider];
  uint64_t v10 = [v9 backgroundScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__CNAutocompleteDirectoryServerSearch_fetchContactsForFetchRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E63DE040;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  double v13 = [v10 performCancelableBlock:v15];

  return v13;
}

void __86__CNAutocompleteDirectoryServerSearch_fetchContactsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [CNADirectoryServerSearchTask alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) contactStore];
  id v11 = [(CNADirectoryServerSearchTask *)v4 initWithRequest:v5 contactStore:v6 cancelationToken:v3];

  id v7 = [(CNADirectoryServerSearchTask *)v11 run];
  uint64_t v8 = *(void *)(a1 + 48);
  os_signpost_id_t v9 = [v7 value];
  uint64_t v10 = [v7 error];
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end