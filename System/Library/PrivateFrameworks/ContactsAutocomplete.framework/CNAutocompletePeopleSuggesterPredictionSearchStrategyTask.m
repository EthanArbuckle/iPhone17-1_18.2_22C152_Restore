@interface CNAutocompletePeopleSuggesterPredictionSearchStrategyTask
@end

@implementation CNAutocompletePeopleSuggesterPredictionSearchStrategyTask

NSObject *__76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v7 = [v3 recipients];
    v6 = [v7 firstObject];

    v8 = [v6 displayName];
    v9 = v8;
    if (!v8 || ![v8 length])
    {
      v11 = CNALoggingContextDebug();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v3;
        _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Predictions: Invalid result: no display name for %@", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_31;
    }
    v10 = [v6 handle];
    v11 = v10;
    if (v10 && [v10 length])
    {
      uint64_t v12 = [(id)objc_opt_class() _addressTypeFromHandle:v11];
      if (v12)
      {
        uint64_t v13 = v12;
        if (![*(id *)(a1 + 40) containsObject:v11])
        {
          [*(id *)(a1 + 40) addObject:v11];
          v27 = objc_alloc_init(CNAutocompleteResultValue);
          [(CNAutocompleteResultValue *)v27 setAddress:v11];
          [(CNAutocompleteResultValue *)v27 setAddressType:v13];
          v28 = [*(id *)(a1 + 48) duetResultWithDisplayName:v9 value:v27 contactIdentifier:0];
          [v28 setPsSuggestion:v3];
          v29 = [v6 contact];
          v14 = v29;
          if (v29)
          {
            v30 = [v29 identifier];
            v37 = v28;
            id v31 = *(id *)(*(void *)(a1 + 32) + 32);
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_73;
            v45[3] = &unk_1E63DE7B0;
            id v46 = v31;
            id v47 = v30;
            id v32 = v30;
            id v33 = v31;
            [v37 setContactProvider:v45];

            v28 = v37;
          }
          v34 = CNALoggingContextDebug();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v49 = v9;
            __int16 v50 = 2112;
            v51 = v11;
            __int16 v52 = 2112;
            v53 = v28;
            _os_log_impl(&dword_1BEF57000, v34, OS_LOG_TYPE_DEFAULT, "Predictions: %@ <%@>: %@", buf, 0x20u);
          }

          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_75;
          v41[3] = &unk_1E63DE938;
          char v44 = *(unsigned char *)(a1 + 64);
          id v42 = *(id *)(a1 + 56);
          v43 = v27;
          v35 = v27;
          [v28 addDiagnosticLog:v41];
          v36 = v43;
          v18 = v28;

          goto LABEL_30;
        }
        v14 = CNALoggingContextDebug();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v11;
          __int16 v50 = 2112;
          v51 = v3;
          v15 = "Predictions: Duplicate identifier %@. Skipping %@.";
          v16 = v14;
          uint32_t v17 = 22;
LABEL_28:
          _os_log_impl(&dword_1BEF57000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
LABEL_29:
        v18 = 0;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      v14 = CNALoggingContextDebug();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138412290;
      v49 = v3;
      v15 = "Predictions: Invalid result: no handle type for %@";
    }
    else
    {
      v14 = CNALoggingContextDebug();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138412290;
      v49 = v3;
      v15 = "Predictions: Invalid result: no handle for %@";
    }
    v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_28;
  }
  if (!v5)
  {
    v6 = CNALoggingContextDebug();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEF57000, v6, OS_LOG_TYPE_DEFAULT, "Predictions: No recipient included in returned _PSSuggestion", buf, 2u);
    }
    goto LABEL_24;
  }
  v6 = [(id)objc_opt_class() _identifierForGroupResultSuggestion:v3];
  if ([*(id *)(a1 + 40) containsObject:v6])
  {
    v9 = CNALoggingContextDebug();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v6;
      __int16 v50 = 2112;
      v51 = v3;
      _os_log_impl(&dword_1BEF57000, v9, OS_LOG_TYPE_DEFAULT, "Predictions: Duplicate group identifier %@. Skipping %@.", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v6];
    if (![*(id *)(*(void *)(a1 + 32) + 24) shouldIncludeGroupResults])
    {
LABEL_24:
      v18 = 0;
      goto LABEL_33;
    }
    uint64_t v19 = objc_opt_class();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_102;
    aBlock[3] = &unk_1E63DE960;
    v20 = v3;
    v39 = v20;
    uint64_t v40 = v19;
    v21 = _Block_copy(aBlock);
    v22 = *(void **)(a1 + 48);
    v23 = [v20 groupName];
    v18 = [v22 duetResultWithDisplayName:v23 value:0 contactIdentifier:0];

    [v18 setResultType:1];
    [v18 setIdentifier:v6];
    [v18 setMembersProvider:v21];
    [v18 setPsSuggestion:v20];
    v24 = CNALoggingContextDebug();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v20 groupName];
      *(_DWORD *)buf = 138412802;
      v49 = v18;
      __int16 v50 = 2112;
      v51 = v25;
      __int16 v52 = 2112;
      v53 = v6;
      _os_log_impl(&dword_1BEF57000, v24, OS_LOG_TYPE_DEFAULT, "Predictions: %@ for displayName:%@ and identifier %@", buf, 0x20u);
    }
    v9 = v39;
  }
LABEL_32:

LABEL_33:
  return v18;
}

uint64_t __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_73(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) unifiedContactWithIdentifier:*(void *)(a1 + 40) keysToFetch:a2 error:a3];
}

id __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_75(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28E78] string];
  [v2 appendString:@"=== Important Instructions for Collecting Duet Logs ===\n"];
  [v2 appendString:@"This result includes predictive information contributed by CoreDuet. To collect information on why this result was predicted:\n\n"];
  [v2 appendString:@"1. Run the following command on the machine that has the issue:\n\n"];
  if (*(unsigned char *)(a1 + 48))
  {
    [v2 appendFormat:@"pstool zkw_suggestion -b %@\n\n", *(void *)(a1 + 32)];
  }
  else
  {
    v3 = [*(id *)(a1 + 40) address];
    v4 = [*(id *)(a1 + 40) address];
    [v2 appendFormat:@"cdinteracttool query -predicate \"sender.identifier == '%@' OR (ANY recipients.identifier == '%@')\"\n\n", v3, v4];
  }
  [v2 appendString:@"2. Review the output of this command, checking for any privacy concerns.\n\n"];
  [v2 appendString:@"3. If there are no privacy concerns with the output, attach it to a radar filed against CoreDuet | PeopleSuggester (rdar://new/problem/component=CoreDuet&version=PeopleSuggester).\n"];
  [v2 appendString:@"=======================================================\n"];
  return v2;
}

id __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_102(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [*(id *)(a1 + 32) recipients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v9 = [v8 displayName];
        v10 = *(void **)(a1 + 40);
        v11 = [v8 handle];
        uint64_t v12 = [v10 _addressTypeFromHandle:v11];

        if (v12)
        {
          uint64_t v13 = [v8 handle];
          v14 = +[CNAutocompleteResult messagesResultWithAddress:v13 displayName:v9 nameComponents:0 resultType:0 addressType:v12 identifier:0 contactProvider:0 groupMembersProvider:0 userInfo:0];

          [v2 addObject:v14];
        }
        else
        {
          v14 = CNALoggingContextDebug();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v8 handle];
            *(_DWORD *)buf = 138412290;
            v22 = v15;
            _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "Predictions: Unknown addressType for groupMember handle: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t __133___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask__fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handle];
}

@end