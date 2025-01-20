@interface SGMISpotlightUtility
+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 handler:(id)a7;
+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 simulatedCSSIs:(id)a7 handler:(id)a8;
+ (id)defaultCSSearchQueryContextFetchAttributes;
+ (id)findDeletedEmailAddresses:(id)a3 mdSearchableItemAttribute:(id)a4 fromDaysAgo:(unint64_t)a5 error:(id *)a6;
+ (id)itemWithUniqueIdentifier:(id)a3 error:(id *)a4;
+ (id)nicknameCSSearchQueryContextFetchAttributes;
+ (id)queryEmailsFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 fetchAttributes:(id)a5 filterQuery:(id)a6 queryString:(id)a7 bundleIds:(id)a8 spotlightTimeOut:(unint64_t)a9 withError:(id *)a10;
+ (void)querySentMailsForNicknameMatchingFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 handler:(id)a6;
@end

@implementation SGMISpotlightUtility

+ (id)queryEmailsFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 fetchAttributes:(id)a5 filterQuery:(id)a6 queryString:(id)a7 bundleIds:(id)a8 spotlightTimeOut:(unint64_t)a9 withError:(id *)a10
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = objc_opt_new();
  [v17 setFetchAttributes:v13];
  [v17 setFilterQuery:v14];
  [v17 setLowPriority:1];
  [v17 setReason:@"reason:MailIntelligence-5; code:1"];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 context:v17];
  [v18 setBundleIDs:v16];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__29531;
  v36 = __Block_byref_object_dispose__29532;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke;
  v31[3] = &unk_1E65BB6A8;
  v31[4] = &v32;
  [v18 setFoundItemsHandler:v31];
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__29531;
  v29[4] = __Block_byref_object_dispose__29532;
  id v30 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke_2;
  v26[3] = &unk_1E65BB608;
  v20 = v19;
  v27 = v20;
  v28 = v29;
  [v18 setCompletionHandler:v26];
  [v18 start];
  if (a9)
  {
    if (a9 <= 0x225C17D04) {
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)((double)a9 * 1000000000.0));
    }
    else {
      dispatch_time_t v21 = -1;
    }
  }
  else
  {
    dispatch_time_t v21 = 0;
  }
  if (dispatch_semaphore_wait(v20, v21))
  {
    v22 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v25 = 0;
      _os_log_debug_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEBUG, "SGMISpotlightUtility: Query by item timed out.", v25, 2u);
    }

    [v18 cancel];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v23 = (id)v33[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __139__SGMISpotlightUtility_queryEmailsFromDaysAgo_throughDaysAgo_fetchAttributes_filterQuery_queryString_bundleIds_spotlightTimeOut_withError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (id)findDeletedEmailAddresses:(id)a3 mdSearchableItemAttribute:(id)a4 fromDaysAgo:(unint64_t)a5 error:(id *)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_INFO, "SGMISpotlightUtility: Finding email addresses to delete", buf, 2u);
  }

  v12 = objc_opt_new();
  id v13 = objc_opt_new();
  v47[0] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  [v12 setFetchAttributes:v14];

  [v12 setMaxCount:10000];
  [v12 setLowPriority:1];
  [v12 setReason:@"reason:MailIntelligence-4; code:1"];
  id v15 = (void *)[[NSString alloc] initWithFormat:@"%@ == * && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now)", v10, a5];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 context:v12];
  uint64_t v46 = *MEMORY[0x1E4F5DC28];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [v16 setBundleIDs:v17];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke;
  v41[3] = &unk_1E65BB658;
  id v18 = v10;
  id v42 = v18;
  id v19 = v13;
  id v43 = v19;
  [v16 setFoundItemsHandler:v41];
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v36 = buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__29531;
  v39 = __Block_byref_object_dispose__29532;
  id v40 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke_2;
  v31[3] = &unk_1E65BB680;
  dispatch_time_t v21 = v20;
  uint64_t v32 = v21;
  id v22 = v18;
  id v33 = v22;
  uint64_t v34 = buf;
  [v16 setCompletionHandler:v31];
  [v16 start];
  dispatch_time_t v23 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v21, v23))
  {
    v24 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138412290;
      uint64_t v45 = (uint64_t)v22;
      _os_log_error_impl(&dword_1CA650000, v24, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility: Query existence as %@ timed out.", v44, 0xCu);
    }

    [v16 cancel];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a6)
  {
    v25 = (void *)*((void *)v36 + 5);
    if (v25) {
      *a6 = v25;
    }
  }
  v26 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v19 count];
    *(_DWORD *)v44 = 134217984;
    uint64_t v45 = v27;
    _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_INFO, "SGMISpotlightUtility: Addresses found in Spotlight: %lu", v44, 0xCu);
  }

  v28 = (void *)[v9 mutableCopy];
  v29 = [v19 allObjects];
  [v28 removeObjectsInArray:v29];

  _Block_object_dispose(buf, 8);
  return v28;
}

void __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * v6);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v8 = [v7 attributeSet];
        id v9 = [v8 attributeForKey:*(void *)(a1 + 32)];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(a1 + 40);
              id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) lowercaseString];
              [v14 addObject:v15];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
}

void __94__SGMISpotlightUtility_findDeletedEmailAddresses_mdSearchableItemAttribute_fromDaysAgo_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight while querying existence as %@: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

+ (id)itemWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  int v7 = +[SGMISpotlightUtility defaultCSSearchQueryContextFetchAttributes];
  [v6 setFetchAttributes:v7];

  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"_kMDItemExternalID == \"%@\"", v5];
  [v6 setFilterQuery:v8];

  [v6 setLowPriority:1];
  [v6 setReason:@"reason:MailIntelligence-3; code:1"];
  __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:@"contentType == 'public.email-message'" context:v6];
  v42[0] = *MEMORY[0x1E4F5DC28];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  [v9 setBundleIDs:v10];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__29531;
  v38 = __Block_byref_object_dispose__29532;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke;
  v29[3] = &unk_1E65BB630;
  v29[4] = &v30;
  void v29[5] = &v34;
  [v9 setFoundItemsHandler:v29];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__29531;
  uint64_t v27 = __Block_byref_object_dispose__29532;
  id v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke_2;
  v20[3] = &unk_1E65BB608;
  uint64_t v12 = v11;
  long long v21 = v12;
  long long v22 = &v23;
  [v9 setCompletionHandler:v20];
  [v9 start];
  dispatch_time_t v13 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    id v14 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGMISpotlightUtility: Query by item timed out.", buf, 2u);
    }

    [v9 cancel];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v15 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v31[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = v16;
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "SGMISpotlightUtility: Found item count was %lu", buf, 0xCu);
  }

  if (a4)
  {
    long long v17 = (void *)v24[5];
    if (v17) {
      *a4 = v17;
    }
  }
  id v18 = (id)v35[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __55__SGMISpotlightUtility_itemWithUniqueIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (void)querySentMailsForNicknameMatchingFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 handler:(id)a6
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v10 = (void *)[[NSString alloc] initWithFormat:@"contentType == \"public.email-message\" && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now(-%lu)) && kMDItemMailboxes == \"mailbox.sent\"", 86400 * a3, 86400 * a4];
  dispatch_semaphore_t v11 = objc_opt_new();
  uint64_t v12 = +[SGMISpotlightUtility nicknameCSSearchQueryContextFetchAttributes];
  [v11 setFetchAttributes:v12];

  [v11 setLowPriority:1];
  [v11 setReason:@"reason:MailIntelligence-2; code:1"];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  [v11 setMaxCount:a5];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v10 context:v11];
  v35[0] = *MEMORY[0x1E4F5DC28];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v14 setBundleIDs:v15];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke;
  v28[3] = &unk_1E65BB5E0;
  id v16 = v9;
  id v29 = v16;
  uint64_t v30 = &v31;
  [v14 setFoundItemsHandler:v28];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__29531;
  void v26[4] = __Block_byref_object_dispose__29532;
  id v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke_2;
  v23[3] = &unk_1E65BB608;
  long long v17 = v13;
  long long v24 = v17;
  uint64_t v25 = v26;
  [v14 setCompletionHandler:v23];
  [v14 start];
  unsigned int v18 = 0;
  while ([MEMORY[0x1E4F93B18] waitForSemaphore:v17 timeoutSeconds:1.0] == 1)
  {
    if (*((unsigned char *)v32 + 24))
    {
      long long v19 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        long long v20 = v19;
        long long v21 = "SGMISpotlightUtility got signal to exit";
LABEL_9:
        _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 2u);
      }
    }
    else
    {
      if (v18 < 0x258) {
        goto LABEL_11;
      }
      long long v19 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        long long v20 = v19;
        long long v21 = "SGMISpotlightUtility Query by time range timed out";
        goto LABEL_9;
      }
    }

    [v14 cancel];
LABEL_11:
    ++v18;
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v31, 8);
}

void __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) standardizeCSPersons];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __98__SGMISpotlightUtility_querySentMailsForNicknameMatchingFromDaysAgo_throughDaysAgo_limit_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 simulatedCSSIs:(id)a7 handler:(id)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  id v14 = (void (**)(id, void, uint64_t))a8;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  if (v13)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v45;
      BOOL v18 = 1;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v15);
        }
        v14[2](v14, *(void *)(*((void *)&v44 + 1) + 8 * v19), (uint64_t)(v49 + 3));
        if (*((unsigned char *)v49 + 24)) {
          break;
        }
        if (v16 == ++v19)
        {
          uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_25;
        }
      }
    }
    BOOL v18 = 1;
  }
  else
  {
    id v15 = (id)[[NSString alloc] initWithFormat:@"contentType == \"public.email-message\" && InRange(kMDItemContentCreationDate, $time.now(-%lu), $time.now(-%lu))", 86400 * a3, 86400 * a4];
    long long v20 = objc_opt_new();
    long long v21 = +[SGMISpotlightUtility defaultCSSearchQueryContextFetchAttributes];
    [v20 setFetchAttributes:v21];

    [v20 setLowPriority:1];
    [v20 setReason:@"reason:MailIntelligence-1; code:1"];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    [v20 setMaxCount:a5];
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 context:v20];
    uint64_t v52 = *MEMORY[0x1E4F5DC28];
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    [v23 setBundleIDs:v24];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke;
    v41[3] = &unk_1E65BB5E0;
    id v42 = v14;
    id v43 = &v48;
    [v23 setFoundItemsHandler:v41];
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__29531;
    id v39 = __Block_byref_object_dispose__29532;
    id v40 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke_18;
    v32[3] = &unk_1E65BB608;
    uint64_t v25 = v22;
    uint64_t v33 = v25;
    char v34 = &v35;
    [v23 setCompletionHandler:v32];
    [v23 start];
    int v26 = 601;
    while ([MEMORY[0x1E4F93B18] waitForSemaphore:v25 timeoutSeconds:1.0] == 1)
    {
      if (*((unsigned char *)v49 + 24))
      {
        id v27 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          id v28 = "SGMISpotlightUtility got signal to exit";
LABEL_27:
          _os_log_debug_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEBUG, v28, buf, 2u);
        }
LABEL_22:

        [v23 cancel];
        goto LABEL_23;
      }
      if (!--v26)
      {
        id v27 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          id v28 = "SGMISpotlightUtility Query by time range timed out";
          goto LABEL_27;
        }
        goto LABEL_22;
      }
    }
    if (a6)
    {
      id v29 = (void *)v36[5];
      if (v29)
      {
        BOOL v18 = 0;
        *a6 = v29;
        goto LABEL_24;
      }
    }
LABEL_23:
    BOOL v18 = 1;
LABEL_24:

    _Block_object_dispose(&v35, 8);
  }
LABEL_25:

  _Block_object_dispose(&v48, 8);
  return v18;
}

void __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) standardizeCSPersons];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __95__SGMISpotlightUtility_queryFromDaysAgo_throughDaysAgo_limit_withError_simulatedCSSIs_handler___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMISpotlightUtility got an error from Spotlight: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (BOOL)queryFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withError:(id *)a6 handler:(id)a7
{
  return [a1 queryFromDaysAgo:a3 throughDaysAgo:a4 limit:a5 withError:a6 simulatedCSSIs:0 handler:a7];
}

+ (id)nicknameCSSearchQueryContextFetchAttributes
{
  v9[11] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F235C0];
  v9[0] = *MEMORY[0x1E4F22C38];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22A48];
  v9[2] = *MEMORY[0x1E4F233D8];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F234A8];
  v9[4] = *MEMORY[0x1E4F234B0];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F233C8];
  v9[6] = *MEMORY[0x1E4F233E0];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F23140];
  v9[8] = *MEMORY[0x1E4F22A38];
  v9[9] = v6;
  v9[10] = *MEMORY[0x1E4F23598];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];
  return v7;
}

+ (id)defaultCSSearchQueryContextFetchAttributes
{
  v11[17] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F235C0];
  v11[0] = *MEMORY[0x1E4F22C38];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F233D8];
  v11[2] = *MEMORY[0x1E4F22B28];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22B30];
  v11[4] = *MEMORY[0x1E4F22A48];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F234B0];
  v11[6] = *MEMORY[0x1E4F22B18];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F233E0];
  v11[8] = *MEMORY[0x1E4F234A8];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22A38];
  v11[10] = *MEMORY[0x1E4F233C8];
  v11[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F236F0];
  v11[12] = *MEMORY[0x1E4F23140];
  v11[13] = v8;
  v11[14] = @"com_apple_mail_repliedTo";
  v11[15] = @"com_apple_mail_messageID";
  v11[16] = @"com_apple_mail_conversationID";
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:17];
  return v9;
}

@end