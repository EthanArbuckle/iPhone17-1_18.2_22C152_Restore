@interface CNAutocompleteRecentContactsLibrary
+ (id)addressKindsForSearchType:(unint64_t)a3;
+ (id)domainsForFetchRequest:(id)a3;
+ (id)domainsForSearchType:(unint64_t)a3;
+ (id)library:(id)a3 recentContactsWithRequest:(id)a4;
+ (id)queryForRequest:(id)a3;
+ (unint64_t)implicitGroupThresholdForSearchType:(unint64_t)a3;
+ (void)addLoggingHandlersToFuture:(id)a3 request:(id)a4;
@end

@implementation CNAutocompleteRecentContactsLibrary

+ (id)library:(id)a3 recentContactsWithRequest:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 queryForRequest:v7];
  v9 = CNALoggingContextDebug();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BEF57000, v9, OS_LOG_TYPE_DEFAULT, "Performing recents query: %@ against library: %@", (uint8_t *)&v15, 0x16u);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v11 = [v10 future];
  [a1 addLoggingHandlersToFuture:v11 request:v7];

  v12 = [v10 completionHandlerAdapter];
  [v6 performRecentsSearch:v8 queue:0 completion:v12];

  v13 = [v10 future];

  return v13;
}

+ (id)queryForRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 domainsForFetchRequest:v4];
  id v6 = objc_msgSend(a1, "addressKindsForSearchType:", objc_msgSend(v4, "searchType"));
  uint64_t v7 = objc_msgSend(a1, "implicitGroupThresholdForSearchType:", objc_msgSend(v4, "searchType"));
  uint64_t v8 = *MEMORY[0x1E4F5A298];
  v9 = [v4 searchString];
  int v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  v11 = (void *)MEMORY[0x1E4F5CCF0];
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F5CCF0]);
    v13 = [MEMORY[0x1E4F5CCE8] predicateForKey:*MEMORY[0x1E4F5CC98] inCollection:v6];
    [v12 setSearchPredicate:v13];
  }
  else
  {
    v13 = [v4 searchString];
    v14 = [v4 fetchContext];
    int v15 = [v14 sendingAddress];
    id v12 = [v11 searchQueryForSearchTerm:v13 preferredKinds:v6 sendingAddress:v15 recentsDomain:&stru_1F1A2F2D8];
  }
  [v12 setDomains:v5];
  [v12 setImplicitGroupThreshold:v7];
  [v12 setComparator:0];

  return v12;
}

+ (void)addLoggingHandlersToFuture:(id)a3 request:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 triageIdentifier];
  uint64_t v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  uint64_t v9 = v8;

  int v10 = CNALoggingContextTriage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Will search", buf, 0xCu);
  }

  v11 = CNALoggingContextTriage();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  v13 = CNALoggingContextPerformance();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Searching CoreRecents", "", buf, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke;
  v21[3] = &unk_1E63DD690;
  os_signpost_id_t v23 = v12;
  uint64_t v24 = v9;
  id v15 = v6;
  id v22 = v15;
  [v5 addSuccessBlock:v21];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke_9;
  v17[3] = &unk_1E63DD6B8;
  uint64_t v20 = v9;
  id v18 = v15;
  os_signpost_id_t v19 = v12;
  id v16 = v15;
  [v5 addFailureBlock:v17];
}

void __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CNALoggingContextPerformance();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Searching CoreRecents", "", (uint8_t *)&v22, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  double v9 = v8;

  int v10 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v9 - *(double *)(a1 + 48)];
  v11 = CNALoggingContextTriage();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v3 count];
    uint64_t v14 = [v3 count];
    id v15 = "results";
    int v22 = 138544130;
    os_signpost_id_t v23 = v12;
    __int16 v24 = 2048;
    if (v14 == 1) {
      id v15 = "result";
    }
    uint64_t v25 = v13;
    __int16 v26 = 2080;
    uint64_t v27 = v15;
    __int16 v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Search complete (%lu %s, %{public}@)", (uint8_t *)&v22, 0x2Au);
  }

  id v16 = CNALoggingContextPerformance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    int v22 = 138412546;
    os_signpost_id_t v23 = v17;
    __int16 v24 = 2114;
    uint64_t v25 = (uint64_t)v10;
    _os_log_impl(&dword_1BEF57000, v16, OS_LOG_TYPE_INFO, "Time to fetch %@ recent contacts: %{public}@", (uint8_t *)&v22, 0x16u);
  }
  id v18 = CNALoggingContextDebug();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    uint64_t v20 = objc_msgSend(v3, "_cn_take:", 200);
    v21 = objc_msgSend(v20, "_cn_map:", &__block_literal_global);
    int v22 = 138412546;
    os_signpost_id_t v23 = v19;
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v21;
    _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "CoreRecents results (first 200 out of %@): %@", (uint8_t *)&v22, 0x16u);
  }
}

void __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CNALoggingContextPerformance();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEF57000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Searching CoreRecents", "", (uint8_t *)&v15, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  double v9 = v8;

  int v10 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v9 - *(double *)(a1 + 48)];
  v11 = CNALoggingContextTriage();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v12 = *(void **)(a1 + 32);
    int v15 = 138543874;
    id v16 = v12;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Search failed (%{public}@): %{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v13 = CNALoggingContextPerformance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138543362;
    id v16 = v10;
    _os_log_impl(&dword_1BEF57000, v13, OS_LOG_TYPE_INFO, "Failure fetching recent contacts after %{public}@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v14 = CNALoggingContextDebug();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Failed to fetch recent contacts: %@", (uint8_t *)&v15, 0xCu);
  }
}

+ (id)domainsForFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fetchContext];
  os_signpost_id_t v6 = [v5 bundleIdentifiers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    double v8 = [v4 fetchContext];

    double v9 = [v8 bundleIdentifiers];
    int v10 = (void *)[v9 copy];
  }
  else
  {
    uint64_t v11 = [v4 searchType];

    int v10 = [a1 domainsForSearchType:v11];
  }
  return v10;
}

+ (id)domainsForSearchType:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
      v14[0] = *MEMORY[0x1E4F5CCB8];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = v14;
      goto LABEL_9;
    case 1uLL:
    case 4uLL:
    case 5uLL:
      uint64_t v13 = *MEMORY[0x1E4F5CCC8];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v13;
      goto LABEL_9;
    case 2uLL:
      uint64_t v12 = *MEMORY[0x1E4F5CCB0];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v12;
      goto LABEL_9;
    case 3uLL:
      uint64_t v11 = *MEMORY[0x1E4F5CCA8];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v11;
LABEL_9:
      uint64_t v7 = [v4 arrayWithObjects:v5 count:1];
      break;
    default:
      os_signpost_id_t v6 = CNALoggingContextDebug();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        unint64_t v10 = a3;
        _os_log_impl(&dword_1BEF57000, v6, OS_LOG_TYPE_DEFAULT, "No domain for searchType: %lu ", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v7 = 0;
      break;
  }
  return v7;
}

+ (id)addressKindsForSearchType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 - 4 < 2) {
    goto LABEL_4;
  }
  if (a3 == 2)
  {
    uint64_t v7 = *MEMORY[0x1E4F5CC80];
    uint64_t v13 = *MEMORY[0x1E4F5CC60];
    uint64_t v14 = v7;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v13;
  }
  else
  {
    if (a3 == 1)
    {
LABEL_4:
      uint64_t v3 = *MEMORY[0x1E4F5CC80];
      uint64_t v15 = *MEMORY[0x1E4F5CC60];
      uint64_t v16 = v3;
      uint64_t v17 = *MEMORY[0x1E4F5CC68];
      id v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = &v15;
      uint64_t v6 = 3;
      goto LABEL_8;
    }
    uint64_t v8 = *MEMORY[0x1E4F5CC68];
    uint64_t v11 = *MEMORY[0x1E4F5CC60];
    uint64_t v12 = v8;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v11;
  }
  uint64_t v6 = 2;
LABEL_8:
  int v9 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v11, v12, v13, v14, v15, v16, v17, v18);
  return v9;
}

+ (unint64_t)implicitGroupThresholdForSearchType:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return qword_1BEFB7260[a3];
  }
}

@end