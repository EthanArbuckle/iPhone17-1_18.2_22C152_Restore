@interface CNAutocompleteCalendarServerSearch
+ (BOOL)isSupported;
- (CNAutocompleteCalendarServerOperationFactory)operationFactory;
- (CNAutocompleteCalendarServerSearch)init;
- (CNAutocompleteCalendarServerSearch)initWithEventStoreProvider:(id)a3 operationFactory:(id)a4;
- (CNStringTokenizer)tokenizer;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)executeRequest:(id)a3 source:(id)a4 resultsFactory:(id)a5 withCompletionHandler:(id)a6;
- (id)queryForFetchRequest:(id)a3;
- (id)resultTransformWithFactory:(id)a3;
- (void)setTokenizer:(id)a3;
@end

@implementation CNAutocompleteCalendarServerSearch

+ (BOOL)isSupported
{
  Class EKDirectorySearchOperationClass_0 = getEKDirectorySearchOperationClass_0();
  return [(objc_class *)EKDirectorySearchOperationClass_0 isSupported];
}

- (CNAutocompleteCalendarServerSearch)init
{
  v3 = (void *)[objc_alloc(getEKEphemeralCacheEventStoreProviderClass()) initWithCreationBlock:&__block_literal_global_28];
  v4 = objc_alloc_init(CNAutocompleteCalendarServerOperationFactory);
  v5 = [(CNAutocompleteCalendarServerSearch *)self initWithEventStoreProvider:v3 operationFactory:v4];

  return v5;
}

id __42__CNAutocompleteCalendarServerSearch_init__block_invoke()
{
  id v0 = objc_alloc_init(getEKEventStoreClass_0());
  return v0;
}

- (CNAutocompleteCalendarServerSearch)initWithEventStoreProvider:(id)a3 operationFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteCalendarServerSearch;
  v9 = [(CNAutocompleteCalendarServerSearch *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v10->_operationFactory, a4);
    v11 = (CNStringTokenizer *)objc_alloc_init(MEMORY[0x1E4F5A518]);
    tokenizer = v10->_tokenizer;
    v10->_tokenizer = v11;

    v13 = v10;
  }

  return v10;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 fetchContext];
  v9 = [v8 sendingAddressAccountIdentifier];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v10 = CNALoggingContextDebug();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Will not run a calendar server search because there's no sending account identifier", buf, 2u);
    }

    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28588];
    v32[0] = @"Missing sending account identifier";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v13 = [v11 errorWithDomain:@"CNContactAutocompleteErrorDomain" code:0 userInfo:v12];

    v7[2](v7, 0, v13);
    id v14 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  }
  else
  {
    objc_super v15 = [(EKEphemeralCacheEventStoreProvider *)self->_eventStoreProvider eventStore];
    v13 = [v15 sourceWithIdentifier:v9];

    v16 = CNALoggingContextDebug();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl(&dword_1BEF57000, v16, OS_LOG_TYPE_DEFAULT, "Using source: %@", buf, 0xCu);
      }

      v18 = [v6 priorityDomainForSorting];
      v19 = [v6 fetchContext];
      v20 = [v19 sendingAddress];
      v21 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v18 sendingAddress:v20];

      id v22 = [(CNAutocompleteCalendarServerSearch *)self executeRequest:v6 source:v13 resultsFactory:v21 withCompletionHandler:v7];
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_1BEF57000, v16, OS_LOG_TYPE_DEFAULT, "No source found for sending account identifier %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28588];
      v24 = [NSString stringWithFormat:@"Could not get a source from EventKit with account identifier: %@", v9];
      v28 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v21 = [v23 errorWithDomain:@"CNContactAutocompleteErrorDomain" code:0 userInfo:v25];

      v7[2](v7, 0, v21);
      id v22 = objc_alloc_init(MEMORY[0x1E4F5A368]);
    }
    id v14 = v22;
  }
  return v14;
}

- (id)executeRequest:(id)a3 source:(id)a4 resultsFactory:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  id v42 = a5;
  id v41 = a6;
  v11 = [(CNAutocompleteCalendarServerSearch *)self queryForFetchRequest:v10];
  v12 = CNALoggingContextDebug();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 terms];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Using query: %@ terms: %@", buf, 0x16u);
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = objc_alloc_init(MEMORY[0x1E4F5A558]);
  v16 = [(CNAutocompleteCalendarServerSearch *)self operationFactory];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke;
  v56[3] = &unk_1E63DEA90;
  id v17 = v15;
  id v57 = v17;
  id v18 = v14;
  id v58 = v18;
  v19 = [v16 eventKitDirectorySearchOperationForSource:v43 query:v11 resultsBlock:v56];

  v20 = CNALoggingContextTriage();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v10 triageIdentifier];
    id v22 = [v10 searchString];
    uint64_t v23 = [v22 length];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_1BEF57000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Will search (%lu letters)", buf, 0x16u);
  }
  v24 = CNALoggingContextTriage();
  v25 = (char *)os_signpost_id_generate(v24);

  v26 = CNALoggingContextPerformance();
  uint64_t v27 = v26;
  if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v25, "Searching Calendar Servers", "", buf, 2u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__3;
  v61 = __Block_byref_object_dispose__3;
  id v62 = 0;
  v28 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v28 timestamp];
  v30 = v29;

  objc_initWeak(&location, v19);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_16;
  v46[3] = &unk_1E63DEAE0;
  objc_copyWeak(v54, &location);
  v54[1] = v25;
  v54[2] = v30;
  id v31 = v10;
  id v47 = v31;
  id v32 = v41;
  id v52 = v32;
  id v33 = v17;
  id v48 = v33;
  id v34 = v18;
  v53 = buf;
  id v49 = v34;
  v50 = self;
  id v35 = v42;
  id v51 = v35;
  [v19 setCompletionBlock:v46];
  id v36 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_22;
  v44[3] = &unk_1E63DD9C0;
  id v37 = v19;
  id v45 = v37;
  [v36 addCancelationBlock:v44];
  uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
  v39 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v38;

  [v37 start];
  objc_destroyWeak(v54);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v36;
}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  CNRunWithLock();
}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) people];
  v2 = [v3 allObjects];
  [v1 addObjectsFromArray:v2];
}

void __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = CNALoggingContextPerformance();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 96);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Searching Directory Servers", "", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v6 timestamp];
  double v8 = v7;

  v9 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v8 - *(double *)(a1 + 104)];
  id v10 = [WeakRetained error];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    id v41 = 0;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    id v29 = *(id *)(a1 + 48);
    CNRunWithLock();
    id v17 = CNALoggingContextTriage();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_msgSend(*(id *)(a1 + 32), "triageIdentifier", v28, 3221225472, __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_18, &unk_1E63DEAB8, v29, buf);
      *(double *)&uint64_t v19 = COERCE_DOUBLE([*(id *)(*(void *)&buf[8] + 40) count]);
      uint64_t v20 = [*(id *)(*(void *)&buf[8] + 40) count];
      v21 = "results";
      *(_DWORD *)v30 = 138544130;
      id v31 = v18;
      __int16 v32 = 2048;
      if (v20 == 1) {
        v21 = "result";
      }
      double v33 = *(double *)&v19;
      __int16 v34 = 2080;
      id v35 = v21;
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Search complete (%lu %s, %{public}@)", v30, 0x2Au);
    }
    id v22 = CNALoggingContextPerformance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "count"));
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) timeIntervalSinceNow];
      *(_DWORD *)v30 = 138412546;
      id v31 = v23;
      __int16 v32 = 2048;
      double v33 = v24 * -1000.0;
      _os_log_impl(&dword_1BEF57000, v22, OS_LOG_TYPE_INFO, "Time to fetch Calendar Server: %@ results, in %.3fms", v30, 0x16u);
    }
    v25 = *(void **)(*(void *)&buf[8] + 40);
    v26 = [*(id *)(a1 + 56) resultTransformWithFactory:*(void *)(a1 + 64)];
    uint64_t v27 = objc_msgSend(v25, "_cn_map:", v26);

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = CNALoggingContextTriage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 32) triageIdentifier];
      id v14 = [WeakRetained error];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v39 = v14;
      _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calendar Servers: Search failed (%{public}@): %{public}@", buf, 0x20u);
    }
    uint64_t v15 = *(void *)(a1 + 72);
    v16 = [WeakRetained error];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
  }
}

uint64_t __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_18(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t __97__CNAutocompleteCalendarServerSearch_executeRequest_source_resultsFactory_withCompletionHandler___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)queryForFetchRequest:(id)a3
{
  id v4 = (Class (__cdecl *)())getEKDirectorySearchQueryClass;
  id v5 = a3;
  id v6 = objc_alloc_init(v4());
  double v7 = (void *)MEMORY[0x1E4F1CAD0];
  double v8 = [(CNAutocompleteCalendarServerSearch *)self tokenizer];
  v9 = [v5 searchString];

  id v10 = [v8 tokenizeString:v9];
  BOOL v11 = [v7 setWithArray:v10];

  [v6 setTerms:v11];
  [v6 setFindGroups:0];
  [v6 setFindLocations:0];
  [v6 setFindResources:0];
  [v6 setFindUsers:1];

  return v6;
}

- (id)resultTransformWithFactory:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CNAutocompleteCalendarServerSearch_resultTransformWithFactory___block_invoke;
  aBlock[3] = &unk_1E63DEB08;
  id v9 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);
  id v6 = (void *)[v5 copy];

  return v6;
}

id __65__CNAutocompleteCalendarServerSearch_resultTransformWithFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNAutocompleteResultValue);
  uint64_t v5 = *MEMORY[0x1E4F5A1F0];
  id v6 = [v3 preferredAddress];
  double v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  [(CNAutocompleteResultValue *)v4 setAddress:v7];

  [(CNAutocompleteResultValue *)v4 setAddressType:1];
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v3 userInfo];
  }
  else
  {
    double v8 = 0;
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [v3 displayName];
  BOOL v11 = [v9 calendarServerResultWithDisplayName:v10 value:v4 nameComponents:0 userInfo:v8];

  return v11;
}

- (CNAutocompleteCalendarServerOperationFactory)operationFactory
{
  return self->_operationFactory;
}

- (CNStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

@end