@interface CNAutocompleteLocalQuery
+ (id)groupsQuery;
+ (id)peopleQuery;
+ (id)queryWithDelegate:(id)a3;
- (CNAutocompleteFetchRequest)request;
- (CNContactStore)contactFetcherStore;
- (CNContactStore)contactStore;
- (id)autocompleteResultsForFetchResults:(id)a3 resultFactory:(id)a4;
- (id)fetchResultsForString:(id)a3;
- (id)makeResultFactory;
- (id)run;
- (id)searchableProperties;
- (void)cancel;
- (void)setContactFetcherStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CNAutocompleteLocalQuery

+ (id)peopleQuery
{
  v3 = objc_alloc_init(CNAutocompleteLocalContactsFetcher);
  v4 = [a1 queryWithDelegate:v3];

  return v4;
}

+ (id)groupsQuery
{
  v3 = objc_alloc_init(CNAutocompleteLocalGroupsFetcher);
  v4 = [a1 queryWithDelegate:v3];

  return v4;
}

+ (id)queryWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)run
{
  v3 = [(CNAutocompleteLocalQuery *)self request];
  id v4 = [v3 searchNames];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__CNAutocompleteLocalQuery_run__block_invoke;
  v9[3] = &unk_1E63DDD18;
  v9[4] = self;
  v5 = objc_msgSend(v4, "_cn_flatMap:", v9);

  v6 = [(CNAutocompleteLocalQuery *)self makeResultFactory];
  v7 = [(CNAutocompleteLocalQuery *)self autocompleteResultsForFetchResults:v5 resultFactory:v6];

  return v7;
}

uint64_t __31__CNAutocompleteLocalQuery_run__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchResultsForString:a2];
}

- (id)fetchResultsForString:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "_cn_tokens");
  v6 = [(CNAutocompleteLocalQuery *)self searchableProperties];
  v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  double v9 = v8;

  v10 = CNALoggingContextTriage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [(CNAutocompleteFetchRequest *)self->_request triageIdentifier];
    v11 = v6;
    v12 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
    v13 = [(CNAutocompleteLocalQueryDelegate *)self->_delegate queryNameForLogging];
    *(_DWORD *)buf = 138543618;
    v54 = v12;
    __int16 v55 = 2114;
    v56 = v13;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Will search", buf, 0x16u);

    v6 = v11;
  }

  v14 = CNALoggingContextTriage();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  v16 = CNALoggingContextPerformance();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Searching Contacts", "", buf, 2u);
  }

  delegate = self->_delegate;
  contactStore = self->_contactStore;
  id v52 = 0;
  v20 = [(CNAutocompleteLocalQueryDelegate *)delegate resultsForSearchString:v4 terms:v5 properties:v6 contactStore:contactStore error:&v52];
  id v51 = v52;
  v21 = CNALoggingContextPerformance();
  v22 = v21;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v22, OS_SIGNPOST_INTERVAL_END, v15, "Searching Contacts", "", buf, 2u);
  }

  v23 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v23 timestamp];
  double v25 = v24;

  v26 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v25 - v9];
  v27 = CNALoggingContextTriage();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v28)
    {
      v29 = [(CNAutocompleteFetchRequest *)self->_request triageIdentifier];
      v30 = [(CNAutocompleteLocalQueryDelegate *)self->_delegate queryNameForLogging];
      uint64_t v31 = [v20 count];
      uint64_t v32 = [v20 count];
      *(_DWORD *)buf = 138544386;
      v33 = "results";
      v54 = v29;
      __int16 v55 = 2114;
      if (v32 == 1) {
        v33 = "result";
      }
      v56 = v30;
      __int16 v57 = 2048;
      uint64_t v58 = v31;
      __int16 v59 = 2080;
      uint64_t v60 = (uint64_t)v33;
      __int16 v61 = 2114;
      id v62 = v26;
      _os_log_impl(&dword_1BEF57000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Search complete (%lu %s, %{public}@)", buf, 0x34u);
    }
    v34 = CNALoggingContextDebug();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [(CNAutocompleteLocalQueryDelegate *)self->_delegate queryNameForLogging];
      v50 = self->_delegate;
      unint64_t v36 = [v20 count];
      v37 = v26;
      id v38 = v4;
      v39 = v6;
      v40 = v5;
      if (v36 >= 0xC8) {
        uint64_t v41 = 200;
      }
      else {
        uint64_t v41 = v36;
      }
      uint64_t v42 = [v20 count];
      v43 = objc_msgSend(v20, "_cn_take:", 200);
      *(_DWORD *)buf = 138544387;
      v54 = v35;
      __int16 v55 = 2112;
      v56 = v50;
      __int16 v57 = 2048;
      uint64_t v58 = v41;
      v5 = v40;
      v6 = v39;
      id v4 = v38;
      v26 = v37;
      __int16 v59 = 2048;
      uint64_t v60 = v42;
      __int16 v61 = 2113;
      id v62 = v43;
      _os_log_impl(&dword_1BEF57000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ results with delegate %@ (first %lu out of %lu): %{private}@", buf, 0x34u);
    }
    v44 = v51;
  }
  else
  {
    v44 = v51;
    if (v28)
    {
      v45 = [(CNAutocompleteFetchRequest *)self->_request triageIdentifier];
      v46 = [(CNAutocompleteLocalQueryDelegate *)self->_delegate queryNameForLogging];
      *(_DWORD *)buf = 138544130;
      v54 = v45;
      __int16 v55 = 2114;
      v56 = v46;
      __int16 v57 = 2114;
      uint64_t v58 = (uint64_t)v26;
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)v51;
      _os_log_impl(&dword_1BEF57000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Search failed (%{public}@): %@", buf, 0x2Au);
    }
    v34 = CNALoggingContextDebug();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v47 = self->_delegate;
      v48 = self->_contactStore;
      *(_DWORD *)buf = 138413314;
      v54 = v47;
      __int16 v55 = 2112;
      v56 = (CNAutocompleteLocalQueryDelegate *)v4;
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v5;
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)v48;
      __int16 v61 = 2112;
      id v62 = v51;
      _os_log_impl(&dword_1BEF57000, v34, OS_LOG_TYPE_DEFAULT, "Got nil results when asking: %@ for: %@, terms: %@, contactStore: %@, error: %@", buf, 0x34u);
    }
  }

  return v20;
}

- (id)makeResultFactory
{
  v3 = [(CNAutocompleteFetchRequest *)self->_request priorityDomainForSorting];
  id v4 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
  v5 = [v4 sendingAddress];
  v6 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v3 sendingAddress:v5];

  return v6;
}

- (id)autocompleteResultsForFetchResults:(id)a3 resultFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CNAutocompleteLocalQuery *)self searchableProperties];
  double v9 = [(CNAutocompleteLocalQueryDelegate *)self->_delegate autocompleteResultsForProperties:v8 fetchResults:v7 resultFactory:v6 contactStore:self->_contactFetcherStore];

  return v9;
}

- (id)searchableProperties
{
  return [(CNAutocompleteFetchRequest *)self->_request searchableProperties];
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = CNALoggingContextDebug();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1BEF57000, v3, OS_LOG_TYPE_DEFAULT, "Cancel: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (CNAutocompleteFetchRequest)request
{
  return (CNAutocompleteFetchRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactFetcherStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactFetcherStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_contactFetcherStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end