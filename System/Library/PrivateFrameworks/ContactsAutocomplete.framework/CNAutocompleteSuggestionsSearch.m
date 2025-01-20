@interface CNAutocompleteSuggestionsSearch
+ (unint64_t)charactersThreshold;
- (CNAutocompleteSuggestionsSearch)init;
- (CNAutocompleteSuggestionsSearch)initWithContactStore:(id)a3;
- (CNContactStore)contactStore;
- (id)convertContacts:(id)a3 request:(id)a4;
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
- (id)keysToFetchForRequest:(id)a3;
- (id)resultTransformWithFactory:(id)a3 properties:(id)a4;
- (id)resultTransformWithRequest:(id)a3;
- (id)suggestedContactsWithRequest:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
@end

@implementation CNAutocompleteSuggestionsSearch

+ (unint64_t)charactersThreshold
{
  char v5 = 0;
  v2 = [MEMORY[0x1E4F5A568] standardPreferences];
  unint64_t v3 = [v2 integerForKey:@"CNSuggestionsCharactersThresholdInAutocomplete" keyExists:&v5];

  if (v5) {
    return v3;
  }
  else {
    return 1;
  }
}

- (CNAutocompleteSuggestionsSearch)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v3 setIncludeSuggestedContacts:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v3];
  char v5 = [(CNAutocompleteSuggestionsSearch *)self initWithContactStore:v4];

  return v5;
}

- (CNAutocompleteSuggestionsSearch)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteSuggestionsSearch;
  v6 = [(CNAutocompleteSuggestionsSearch *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v9 = [v8 schedulerProvider];
  objc_super v10 = [v9 backgroundScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E63DE040;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  v13 = [v10 performCancelableBlock:v15];

  return v13;
}

void __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [(id)objc_opt_class() charactersThreshold];
  id v5 = [a1[5] searchString];
  unint64_t v6 = [v5 length];

  if (v6 >= v4)
  {
    v9 = [a1[4] keysToFetchForRequest:a1[5]];
    id v10 = a1[4];
    id v11 = a1[5];
    id v20 = 0;
    id v12 = [v10 suggestedContactsWithRequest:v11 keysToFetch:v9 error:&v20];
    id v13 = v20;
    if (v12)
    {
      v14 = [a1[4] convertContacts:v12 request:a1[5]];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke_4;
      v17[3] = &unk_1E63DE0B0;
      id v15 = a1[6];
      id v18 = v14;
      id v19 = v15;
      id v16 = v14;
      [v3 performBlock:v17];
    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }
  }
  else
  {
    id v7 = CNALoggingContextDebug();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = a1[5];
      *(_DWORD *)buf = 134218240;
      id v22 = v8;
      __int16 v23 = 2048;
      unint64_t v24 = v4;
      _os_log_impl(&dword_1BEF57000, v7, OS_LOG_TYPE_DEFAULT, "Skipping request %p against suggestion because search string is smaller than %lu chars", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)keysToFetchForRequest:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v4 = (void *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  unint64_t v6 = [v4 descriptorForRequiredKeysForStyle:0];
  id v7 = [v3 arrayWithObject:v6];

  id v8 = [v5 searchableProperties];

  [v7 addObjectsFromArray:v8];
  v9 = +[CNAutocompleteNameComponents contactKeys];
  [v7 addObjectsFromArray:v9];

  return v7;
}

- (id)suggestedContactsWithRequest:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = CNALoggingContextTriage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 triageIdentifier];
    int v45 = 138543362;
    id v46 = v11;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Will search", (uint8_t *)&v45, 0xCu);
  }
  id v12 = CNALoggingContextDebug();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 134217984;
    id v46 = v8;
    _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Executing request %p against suggested contacts", (uint8_t *)&v45, 0xCu);
  }

  id v13 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v13 timestamp];
  double v15 = v14;

  id v16 = CNALoggingContextTriage();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  id v18 = CNALoggingContextPerformance();
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Searching CoreSuggestions", "", (uint8_t *)&v45, 2u);
  }

  id v20 = (void *)MEMORY[0x1E4F1B8F8];
  v21 = [v8 searchString];
  id v22 = [v20 predicateForContactsMatchingName:v21];

  __int16 v23 = [(CNAutocompleteSuggestionsSearch *)self contactStore];
  unint64_t v24 = [v23 unifiedContactsMatchingPredicate:v22 keysToFetch:v9 error:a5];

  uint64_t v25 = CNALoggingContextPerformance();
  v26 = v25;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v26, OS_SIGNPOST_INTERVAL_END, v17, "Searching CoreSuggestions", "", (uint8_t *)&v45, 2u);
  }

  v27 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v27 timestamp];
  double v29 = v28;

  v30 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v29 - v15];
  if (v24)
  {
    v31 = CNALoggingContextPerformance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      int v45 = 138412546;
      id v46 = v32;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v30;
      _os_log_impl(&dword_1BEF57000, v31, OS_LOG_TYPE_INFO, "Time to fetch %@ suggested contacts: %@", (uint8_t *)&v45, 0x16u);
    }
    v33 = CNALoggingContextDebug();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      v35 = objc_msgSend(v24, "_cn_take:", 200);
      int v45 = 138412547;
      id v46 = v34;
      __int16 v47 = 2113;
      uint64_t v48 = (uint64_t)v35;
      _os_log_impl(&dword_1BEF57000, v33, OS_LOG_TYPE_DEFAULT, "Suggestions results (first 200 out of %@): %{private}@", (uint8_t *)&v45, 0x16u);
    }
    v36 = CNALoggingContextTriage();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v8 triageIdentifier];
      uint64_t v38 = [v24 count];
      int v45 = 138543874;
      id v46 = v37;
      __int16 v47 = 2048;
      uint64_t v48 = v38;
      __int16 v49 = 2114;
      id v50 = v30;
      _os_log_impl(&dword_1BEF57000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Search complete (%ld result(s), %{public}@)", (uint8_t *)&v45, 0x20u);
    }
    id v39 = v24;
  }
  else
  {
    if (a5) {
      id v40 = *a5;
    }
    else {
      id v40 = 0;
    }
    id v41 = v40;
    v42 = CNALoggingContextTriage();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v8 triageIdentifier];
      int v45 = 138543874;
      id v46 = v43;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v30;
      __int16 v49 = 2114;
      id v50 = v41;
      _os_log_impl(&dword_1BEF57000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Search failed (%{public}@): %{public}@", (uint8_t *)&v45, 0x20u);
    }
  }

  return v24;
}

- (id)convertContacts:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAutocompleteSuggestionsSearch *)self resultTransformWithRequest:v6];
  id v9 = objc_msgSend(v7, "_cn_flatMap:", v8);

  id v10 = [CNAutocompleteResultTokenMatcher alloc];
  id v11 = [v6 searchString];

  id v12 = [(CNAutocompleteResultTokenMatcher *)v10 initWithSearchString:v11];
  id v13 = [(CNAutocompleteResultTokenMatcher *)v12 filterAdapter];
  double v14 = objc_msgSend(v9, "_cn_filter:", v13);

  return v14;
}

- (id)resultTransformWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 priorityDomainForSorting];
  id v6 = [v4 fetchContext];
  id v7 = [v6 sendingAddress];
  id v8 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v5 sendingAddress:v7];

  id v9 = [v4 searchableProperties];
  id v10 = [(CNAutocompleteSuggestionsSearch *)self resultTransformWithFactory:v8 properties:v9];

  id v11 = self->_contactStore;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke;
  v17[3] = &unk_1E63DEBE0;
  void v17[4] = self;
  id v18 = v4;
  id v19 = v11;
  id v20 = v10;
  id v12 = v11;
  id v13 = v4;
  id v14 = v10;
  double v15 = (void *)[v17 copy];

  return v15;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2;
        v24[3] = &unk_1E63DEB90;
        id v8 = v15;
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        id v25 = v8;
        uint64_t v26 = v9;
        id v27 = v10;
        [v7 setContactProvider:v24];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_17;
        v22[3] = &unk_1E63DE3B0;
        id v11 = v8;
        id v23 = v11;
        [v7 addDiagnosticLog:v22];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2_21;
        v19[3] = &unk_1E63DEBB8;
        id v20 = *(id *)(a1 + 48);
        id v12 = v11;
        id v21 = v12;
        [v7 addDiagnosticLog:v19];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3_41;
        v16[3] = &unk_1E63DE128;
        id v17 = v12;
        id v18 = *(id *)(a1 + 48);
        [v7 setIgnoreResultBlock:v16];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }

  return obj;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a1[4] areKeysAvailable:v5])
  {
    id v6 = a1[4];
  }
  else
  {
    id v7 = [a1[5] suggestedContactsWithRequest:a1[6] keysToFetch:v5 error:a3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3;
    v13[3] = &unk_1E63DEB68;
    id v14 = a1[4];
    id v8 = objc_msgSend(v7, "_cn_firstObjectPassingTest:", v13);
    id v9 = v8;
    if (!v8)
    {
      id v10 = CNALoggingContextTriage();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [a1[6] triageIdentifier];
        *(_DWORD *)buf = 138543362;
        id v16 = v11;
        _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CNAutocompleteSuggestionsSearch: Contact provider failed to refetch contact, returning internally fetched contact.", buf, 0xCu);
      }
      id v9 = a1[4];
    }
    id v6 = v9;
  }
  return v6;
}

uint64_t __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_17(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) suggestionRecordId];
  id v3 = objc_msgSend(v1, "stringWithFormat:", @"Suggestion record id: %lld", objc_msgSend(v2, "numericValue"));

  return v3;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2_21(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) originForSuggestion:*(void *)(a1 + 40) error:a2];
  id v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [v2 title];
  [v3 appendFormat:@"Title: %@\n", v4];

  id v5 = [v2 fromPerson];
  [v3 appendFormat:@"From: %@\n", v5];

  uint64_t v6 = [v2 to];
  [v3 appendFormat:@"To: %@\n", v6];

  id v7 = [v2 cc];
  [v3 appendFormat:@"CC: %@\n", v7];

  id v8 = [v2 date];
  [v3 appendFormat:@"Date: %@\n", v8];

  id v9 = [v2 contextSnippet];
  [v3 appendFormat:@"Context:\n=====\n%@\n=====", v9];

  return v3;
}

uint64_t __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3_41(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BAC8]);
  [v4 rejectSuggestion:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);
  id v11 = 0;
  uint64_t v6 = [v5 executeSaveRequest:v4 error:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    id v8 = CNALoggingContextDebug();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "Can't ignore suggestion: %@, with error: %@", buf, 0x16u);
    }

    if (a2) {
      *a2 = v7;
    }
  }

  return v6;
}

- (id)resultTransformWithFactory:(id)a3 properties:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[CNAutocompleteLocalContactResultTransformBuilder suggestedContactBuilderWithResultFactory:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addTransformForProperty:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  id v12 = [v6 build];

  return v12;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end