@interface CNAutocompleteLocalContactsFetcher
- (BOOL)doesMatchInfo:(id)a3 matchProperties:(id)a4;
- (id)autocompleteResultsForProperties:(id)a3 contactPredicate:(id)a4 contactStore:(id)a5 resultFactory:(id)a6 error:(id *)a7;
- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6;
- (id)contactsForPredicate:(id)a3 properties:(id)a4 contactStore:(id)a5 error:(id *)a6;
- (id)keysToFetchForProperties:(id)a3;
- (id)queryNameForLogging;
- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7;
- (id)transformWithProperties:(id)a3 factory:(id)a4;
@end

@implementation CNAutocompleteLocalContactsFetcher

- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = objc_msgSend(a4, "_cn_filter:", &__block_literal_global_9);
  v14 = [(CNAutocompleteLocalContactsFetcher *)self transformWithProperties:v12 factory:v11];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke;
  v24 = &unk_1E63DDD90;
  id v25 = v10;
  id v26 = v14;
  id v15 = v10;
  id v16 = v14;
  v17 = objc_msgSend(v13, "_cn_map:", &v21);
  v18 = objc_msgSend(v17, "_cn_filter:", *MEMORY[0x1E4F5A280], v21, v22, v23, v24);
  v19 = objc_msgSend(v18, "_cn_flatten");

  return v19;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2;
  v8[3] = &unk_1E63DDD68;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = (id)objc_msgSend(v4, "_cn_map:", v8);

  return v4;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_3;
  v5[3] = &unk_1E63DDD40;
  objc_copyWeak(&v8, &location);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v3 setContactProvider:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v3;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = CNALoggingContextDebug();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    int v14 = 138412546;
    id v15 = WeakRetained;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1BEF57000, v6, OS_LOG_TYPE_DEFAULT, "About to fetch full contact for autocomplete result: %@ contact: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = *(void **)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) identifier];
  id v11 = [v9 unifiedContactWithIdentifier:v10 keysToFetch:v5 error:a3];

  id v12 = CNALoggingContextDebug();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v11;
    _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, "Got full contact: %@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (id)transformWithProperties:(id)a3 factory:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[CNAutocompleteLocalContactResultTransformBuilder localContactBuilderWithResultFactory:a4];
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

- (id)autocompleteResultsForProperties:(id)a3 contactPredicate:(id)a4 contactStore:(id)a5 resultFactory:(id)a6 error:(id *)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = [(CNAutocompleteLocalContactsFetcher *)self contactsForPredicate:a4 properties:v12 contactStore:v13 error:a7];
  if (v15)
  {
    long long v16 = [(CNAutocompleteLocalContactsFetcher *)self autocompleteResultsForProperties:v12 fetchResults:v15 resultFactory:v14 contactStore:v13];
  }
  else
  {
    long long v17 = CNALoggingContextDebug();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a7) {
        id v18 = *a7;
      }
      else {
        id v18 = 0;
      }
      int v20 = 138412290;
      id v21 = v18;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "Got nil contacts from Contacts, error: %@", (uint8_t *)&v20, 0xCu);
    }

    long long v16 = 0;
  }

  return v16;
}

- (id)queryNameForLogging
{
  return @"Local Contacts";
}

- (id)contactsForPredicate:(id)a3 properties:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(CNAutocompleteLocalContactsFetcher *)self keysToFetchForProperties:a4];
  id v13 = [v10 unifiedContactsMatchingPredicate:v11 keysToFetch:v12 error:a6];

  return v13;
}

- (id)keysToFetchForProperties:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = (void *)MEMORY[0x1E4F1B910];
  id v5 = a3;
  id v6 = [v4 descriptorForRequiredKeysForStyle:0];
  id v7 = [v3 setWithObject:v6];

  [v7 addObjectsFromArray:v5];
  [v7 addObject:*MEMORY[0x1E4F1AE88]];
  uint64_t v8 = +[CNAutocompleteNameComponents contactKeys];
  [v7 addObjectsFromArray:v8];

  uint64_t v9 = [v7 allObjects];

  return v9;
}

- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7
{
  v38[11] = *MEMORY[0x1E4F143B8];
  id v11 = (objc_class *)MEMORY[0x1E4F1B908];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [v11 alloc];
  long long v16 = [(CNAutocompleteLocalContactsFetcher *)self keysToFetchForProperties:v13];
  long long v17 = (void *)[v15 initWithKeysToFetch:v16];

  id v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingFullTextSearch:v14 containerIdentifiers:0 groupIdentifiers:0];

  [v17 setPredicate:v18];
  [v17 setUnifyResults:0];
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = *MEMORY[0x1E4F1AEA0];
  v38[0] = *MEMORY[0x1E4F1ADF0];
  v38[1] = v20;
  uint64_t v21 = *MEMORY[0x1E4F1AEF8];
  v38[2] = *MEMORY[0x1E4F1ADE0];
  v38[3] = v21;
  uint64_t v22 = *MEMORY[0x1E4F1AEF0];
  v38[4] = *MEMORY[0x1E4F1AF00];
  v38[5] = v22;
  uint64_t v23 = *MEMORY[0x1E4F1AED8];
  v38[6] = *MEMORY[0x1E4F1AEC0];
  v38[7] = v23;
  uint64_t v24 = *MEMORY[0x1E4F1AEB0];
  v38[8] = *MEMORY[0x1E4F1AF30];
  v38[9] = v24;
  v38[10] = *MEMORY[0x1E4F1AEB8];
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:11];
  id v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];

  v27 = [v26 setByAddingObjectsFromArray:v25];

  id v28 = objc_alloc_init(MEMORY[0x1E4F5A558]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __97__CNAutocompleteLocalContactsFetcher_resultsForSearchString_terms_properties_contactStore_error___block_invoke;
  v34[3] = &unk_1E63DDDD8;
  v34[4] = self;
  id v35 = v27;
  id v36 = v28;
  id v29 = v19;
  id v37 = v29;
  id v30 = v28;
  id v31 = v27;
  LODWORD(v26) = [v12 enumerateContactsAndMatchInfoWithFetchRequest:v17 error:a7 usingBlock:v34];

  v32 = 0;
  if (v26) {
    v32 = (void *)[v29 copy];
  }

  return v32;
}

void __97__CNAutocompleteLocalContactsFetcher_resultsForSearchString_terms_properties_contactStore_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) doesMatchInfo:a3 matchProperties:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) lock];
    [*(id *)(a1 + 56) addObject:v5];
    [*(id *)(a1 + 48) unlock];
  }
}

- (BOOL)doesMatchInfo:(id)a3 matchProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 matchedNameProperty];
  uint64_t v8 = [v6 matchedProperties];

  uint64_t v9 = [v8 allKeys];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CNAutocompleteLocalContactsFetcher_doesMatchInfo_matchProperties___block_invoke;
  v13[3] = &unk_1E63DD9E8;
  id v14 = v5;
  id v10 = v5;
  int v11 = v7 | objc_msgSend(v9, "_cn_any:", v13);

  return v11;
}

uint64_t __68__CNAutocompleteLocalContactsFetcher_doesMatchInfo_matchProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

@end