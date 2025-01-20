@interface CNAutocompleteCoreDuetPredictionSearchStrategyTask
@end

@implementation CNAutocompleteCoreDuetPredictionSearchStrategyTask

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [a2 contact];
  v4 = [v3 displayName];
  v5 = v4;
  if (!v4 || ![v4 length])
  {
    v12 = CNALoggingContextDebug();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Invalid result: no display name";
      goto LABEL_12;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [v3 identifier];
  if (!v6
    || (v7 = (void *)v6,
        [v3 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v7,
        !v9))
  {
    v12 = CNALoggingContextDebug();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Invalid result: no identifier";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = *(void **)(a1 + 32);
  v11 = [v3 identifier];
  LODWORD(v10) = [v10 containsObject:v11];

  if (v10)
  {
    v12 = CNALoggingContextDebug();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Identifier already in use";
LABEL_12:
      _os_log_impl(&dword_1BEF57000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v16 = *(id *)(*(void *)(a1 + 40) + 32);
  uint64_t v17 = *MEMORY[0x1E4F5A298];
  v18 = [v3 personId];
  LOBYTE(v17) = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  if (v17) {
    goto LABEL_18;
  }
  uint64_t v20 = [v3 personIdType];
  if (v20 == 1)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_86;
    v27[3] = &unk_1E63DE7B0;
    v28 = v3;
    id v29 = v16;
    v19 = _Block_copy(v27);

    v12 = 0;
    v21 = v28;
LABEL_27:

    goto LABEL_28;
  }
  if (v20 != 2)
  {
    if (v20 == 3)
    {
      v12 = [v3 personId];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_84;
      aBlock[3] = &unk_1E63DE7B0;
      v31 = v16;
      id v32 = v3;
      v19 = _Block_copy(aBlock);

      v21 = v31;
    }
    else
    {
      v21 = CNALoggingContextDebug();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v34 = [v3 personIdType];
        _os_log_impl(&dword_1BEF57000, v21, OS_LOG_TYPE_DEFAULT, "No identifier for personIdType: %lu", buf, 0xCu);
      }
      v12 = 0;
      v19 = 0;
    }
    goto LABEL_27;
  }
LABEL_18:
  v12 = 0;
  v19 = 0;
LABEL_28:
  v22 = [*(id *)(a1 + 40) resultValueForCDContact:v3];
  v14 = [*(id *)(a1 + 48) duetResultWithDisplayName:v5 value:v22 contactIdentifier:v12];
  v23 = CNALoggingContextDebug();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = (uint64_t)v14;
    __int16 v35 = 2112;
    v36 = v5;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1BEF57000, v23, OS_LOG_TYPE_DEFAULT, "Created result: %@ for displayName:%@, identifier:%@", buf, 0x20u);
  }

  [v14 setContactProvider:v19];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_88;
  v25[3] = &unk_1E63DE3B0;
  id v26 = v22;
  id v24 = v22;
  [v14 addDiagnosticLog:v25];

LABEL_14:
  return v14;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  v7 = [v5 personId];
  id v12 = 0;
  v8 = [v4 unifiedContactWithIdentifier:v7 keysToFetch:v6 error:&v12];

  id v9 = v12;
  v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Did fetch full contact: %@, err: %@", buf, 0x16u);
  }

  if (a3) {
    *a3 = v9;
  }

  return v8;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 personId];
  uint64_t v8 = [v7 intValue];

  id v9 = [MEMORY[0x1E4F1B8F8] predicateForLegacyIdentifier:v8];
  v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Fetching full contact from AB legacy ID with predicate %@", buf, 0xCu);
  }

  v11 = *(void **)(a1 + 40);
  id v19 = 0;
  id v12 = [v11 unifiedContactsMatchingPredicate:v9 keysToFetch:v6 error:&v19];

  id v13 = v19;
  if (v12)
  {
    if ([v12 count] != 1)
    {
      v14 = CNALoggingContextDebug();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Expecting one contact, will take the last one", buf, 2u);
      }
    }
    __int16 v15 = CNALoggingContextDebug();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_1BEF57000, v15, OS_LOG_TYPE_DEFAULT, "Got contacts: %@", buf, 0xCu);
    }

    id v16 = [v12 lastObject];
  }
  else
  {
    uint64_t v17 = CNALoggingContextDebug();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_1BEF57000, v17, OS_LOG_TYPE_DEFAULT, "Error fetching: %@", buf, 0xCu);
    }

    id v16 = 0;
    if (a3) {
      *a3 = v13;
    }
  }

  return v16;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_88(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28E78] string];
  [v2 appendString:@"=== Important Instructions for Collecting Duet Logs ===\n"];
  [v2 appendString:@"This result includes predictive information contributed by CoreDuet. To collect information on why this result was predicted:\n\n"];
  [v2 appendString:@"1. Run the following command on the machine that has the issue:\n\n"];
  v3 = [*(id *)(a1 + 32) address];
  v4 = [*(id *)(a1 + 32) address];
  [v2 appendFormat:@"cdinteracttool query -predicate \"sender.identifier == '%@' OR (ANY recipients.identifier == '%@')\"\n\n", v3, v4];

  [v2 appendString:@"2. Review the output of this command, checking for any privacy concerns.\n\n"];
  [v2 appendString:@"3. If there are no privacy concerns with the output, attach it to a radar filed against CoreDuet | PeopleSuggester (rdar://new/problem/component=CoreDuet&version=PeopleSuggester).\n"];
  [v2 appendString:@"=======================================================\n"];
  return v2;
}

@end