@interface CNAPeopleSuggesterResultPrioritizer
@end

@implementation CNAPeopleSuggesterResultPrioritizer

uint64_t __46___CNAPeopleSuggesterResultPrioritizer_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "ranking");
  return MEMORY[0x1F41817F8]();
}

id __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 address];

  return v3;
}

id __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke_14(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(get_PSSuggesterClass_1());
  id v3 = objc_alloc_init(get_PSPredictionContextClass());
  [v3 setBundleID:*(void *)(a1 + 32)];
  [v3 setAccountIdentifier:*(void *)(a1 + 40)];
  [v3 setSearchPrefix:*(void *)(a1 + 48)];
  v4 = [*(id *)(a1 + 56) array];
  v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1BEF57000, v5, OS_LOG_TYPE_INFO, "Suggestion ranking input: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  v6 = [*(id *)(a1 + 56) array];
  v7 = [v2 rankedAutocompleteSuggestionsFromContext:v3 candidates:v6];

  v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138477827;
    v11 = v7;
    _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_INFO, "Suggestion ranking output: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) resultIdentifierIsValidMessagesChatGuid:v3])
  {
    v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_1();
    }
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [v3 value];
    v7 = [v6 address];

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_20;
      v26[3] = &unk_1E63DD9E8;
      v9 = v3;
      v27 = v9;
      if (objc_msgSend(v8, "_cn_any:", v26))
      {
        int v10 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_3();
        }
        uint64_t v5 = 1;
      }
      else
      {
        v11 = *(void **)(a1 + 40);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_22;
        v24[3] = &unk_1E63DD9E8;
        uint64_t v12 = v9;
        v25 = v12;
        if (objc_msgSend(v11, "_cn_any:", v24))
        {
          v13 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_4();
          }

          uint64_t v5 = 1;
        }
        else
        {
          uint64_t v18 = MEMORY[0x1E4F143A8];
          uint64_t v19 = 3221225472;
          v20 = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_23;
          v21 = &unk_1E63DE718;
          v14 = *(void **)(a1 + 40);
          uint64_t v22 = *(void *)(a1 + 32);
          v23 = v12;
          uint64_t v5 = objc_msgSend(v14, "_cn_any:", &v18);
          v15 = objc_msgSend((id)objc_opt_class(), "os_log", v18, v19, v20, v21, v22);
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if (v5)
          {
            if (v16) {
              __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_5();
            }
          }
          else if (v16)
          {
            __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_6();
          }
        }
        int v10 = v25;
      }

      v4 = v27;
    }
    else
    {
      v4 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_2();
      }
      uint64_t v5 = 0;
    }
  }

  return v5;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 displayName];
  uint64_t v5 = objc_msgSend(v4, "_cn_hasPrefix:", v3);

  return v5;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 value];
  uint64_t v5 = [v4 address];
  uint64_t v6 = objc_msgSend(v5, "_cn_hasPrefix:", v3);

  return v6;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 nameComponents];
  uint64_t v6 = [v2 resultMatchesPrefix:v4 inNameComponentsOfResult:v5];

  return v6;
}

uint64_t __63___CNAPeopleSuggesterResultPrioritizer_partitionStewieResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __72___CNAPeopleSuggesterResultPrioritizer_bundleIdentifierOfCurrentProcess__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeBundleIdentifierOfCurrentProcess];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)bundleIdentifierOfCurrentProcess_cn_once_object_20;
  bundleIdentifierOfCurrentProcess_cn_once_object_20 = v1;
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will be ranked (group chat): %{private}@", v2, v3, v4, v5, v6);
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will NOT be ranked (no address): %{private}@", v2, v3, v4, v5, v6);
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will be ranked (display name prefix match): %{private}@", v2, v3, v4, v5, v6);
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will be ranked (address prefix match): %{private}@", v2, v3, v4, v5, v6);
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will be ranked (inner prefix match): %{private}@", v2, v3, v4, v5, v6);
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Result will NOT be ranked (default): %{private}@", v2, v3, v4, v5, v6);
}

@end