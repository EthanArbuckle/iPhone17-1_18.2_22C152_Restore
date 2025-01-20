@interface CNAutocompleteLocalGroupsFetcher
- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6;
- (id)queryNameForLogging;
- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7;
@end

@implementation CNAutocompleteLocalGroupsFetcher

- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke;
  v17[3] = &unk_1E63DDFA0;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v10;
  v15 = objc_msgSend(a4, "_cn_compactMap:", v17);

  return v15;
}

id __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = a1[4];
  v8 = [v6 name];
  id v9 = [v6 identifier];
  id v10 = [v7 localGroupResultWithDisplayName:v8 groupIdentifier:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2;
  v13[3] = &unk_1E63DDF78;
  id v14 = v6;
  id v15 = a1[5];
  id v16 = a1[6];
  id v17 = a1[4];
  id v11 = v6;
  [v10 setMembersProvider:v13];

  return v10;
}

id __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B8F8];
  v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [v4 predicateForContactsInGroupWithIdentifier:v5];

  id v7 = objc_alloc_init(CNAutocompleteLocalContactsFetcher);
  v8 = CNALoggingContextDebug();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "About to fetch members for group: %@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [(CNAutocompleteLocalContactsFetcher *)v7 autocompleteResultsForProperties:*(void *)(a1 + 40) contactPredicate:v6 contactStore:*(void *)(a1 + 48) resultFactory:*(void *)(a1 + 56) error:a2];
  id v11 = CNALoggingContextDebug();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Did get members: %@", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7
{
  id v9 = (void *)MEMORY[0x1E4F1BA00];
  id v10 = a6;
  id v11 = [v9 predicateForGroupsWithNameMatching:a3];
  id v12 = [v10 groupsMatchingPredicate:v11 error:a7];

  return v12;
}

- (id)queryNameForLogging
{
  return @"Local Groups";
}

@end