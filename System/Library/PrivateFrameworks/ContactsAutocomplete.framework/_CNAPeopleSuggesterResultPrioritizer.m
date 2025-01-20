@interface _CNAPeopleSuggesterResultPrioritizer
+ (id)bundleIdentifierOfCurrentProcess;
+ (id)makeBundleIdentifierOfCurrentProcess;
+ (id)os_log;
- (BOOL)resultIdentifierIsValidMessagesChatGuid:(id)a3;
- (BOOL)resultMatchesPrefix:(id)a3 inNameComponentsOfResult:(id)a4;
- (_CNAPeopleSuggesterResultPrioritizer)init;
- (id)applyPriorityOrderToResults:(id)a3 fetchRequest:(id)a4 andCompletePriorityResultsPromise:(id)a5;
- (id)partitionCandidatesForRanking:(id)a3 givenPrefixes:(id)a4;
- (id)partitionStewieResults:(id)a3;
@end

@implementation _CNAPeopleSuggesterResultPrioritizer

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_23);
  }
  v2 = (void *)os_log_cn_once_object_1;
  return v2;
}

- (_CNAPeopleSuggesterResultPrioritizer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNAPeopleSuggesterResultPrioritizer;
  v2 = [(_CNAPeopleSuggesterResultPrioritizer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F5A410]) initWithClassificationQuality:0];
    handleStringClassifier = v2->_handleStringClassifier;
    v2->_handleStringClassifier = (CNHandleStringClassifier *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)applyPriorityOrderToResults:(id)a3 fetchRequest:(id)a4 andCompletePriorityResultsPromise:(id)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v83 = a4;
  id v79 = a5;
  objc_super v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v7 timestamp];
  double v9 = v8;

  v10 = CNALoggingContextTriage();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v83 triageIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v11;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will sort", buf, 0xCu);
  }
  v87 = [MEMORY[0x1E4F1CA70] orderedSet];
  v12 = [v83 searchNames];
  v82 = [(_CNAPeopleSuggesterResultPrioritizer *)self partitionCandidatesForRanking:v80 givenPrefixes:v12];

  v13 = [v82 first];
  v81 = [v82 second];
  v92 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v87, "count"));
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v13;
  uint64_t v91 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v91)
  {
    uint64_t v89 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v91; ++i)
      {
        if (*(void *)v106 != v89) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v16 = [v15 value];
        if ([(_CNAPeopleSuggesterResultPrioritizer *)self resultIdentifierIsValidMessagesChatGuid:v15])
        {
          v17 = [v15 identifier];
          id v104 = 0;
          v18 = [v15 members:&v104];
          id v19 = v104;
          if (v18)
          {
            v20 = objc_msgSend(v18, "_cn_compactMap:", &__block_literal_global_12_1);
          }
          else
          {
            v25 = CNALoggingContextDebug();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v19;
              _os_log_impl(&dword_1BEF57000, v25, OS_LOG_TYPE_DEFAULT, "Error retrieving chat recipients from %@ : %@", buf, 0x16u);
            }

            v20 = 0;
          }

          v24 = 0;
        }
        else
        {
          if ([v16 addressType] == 2)
          {
            v21 = (void *)MEMORY[0x1E4F1BA70];
            v22 = [v16 address];
            v23 = [v21 phoneNumberWithStringValue:v22];

            v24 = [v23 unformattedInternationalStringValue];
          }
          else
          {
            v24 = [v16 address];
          }
          v20 = 0;
          v17 = 0;
        }
        if (v17) {
          v26 = v17;
        }
        else {
          v26 = v24;
        }
        id v27 = v26;
        if (v27) {
          [v92 setObject:v15 forKeyedSubscript:v27];
        }
        id v28 = objc_alloc(get_PSAutocompleteSuggestionClass());
        v29 = [v15 displayName];
        v30 = [v15 identifier];
        v31 = objc_msgSend(v28, "initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:", v17, v20, v29, v24, v30, objc_msgSend(v15, "sourceType"), 0);

        if (v31)
        {
          [v87 addObject:v31];
        }
        else
        {
          v32 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v15;
            _os_log_error_impl(&dword_1BEF57000, v32, OS_LOG_TYPE_ERROR, "Could not create suggestion from result: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v91 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v91);
  }

  v33 = CNALoggingContextTriage();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [v83 triageIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v34;
    _os_log_impl(&dword_1BEF57000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will re-rank with PSSuggester", buf, 0xCu);
  }
  v35 = [(id)objc_opt_class() bundleIdentifierOfCurrentProcess];
  v36 = [v83 fetchContext];
  v37 = [v36 sendingAddressAccountIdentifier];

  if ([v83 shouldIncludeGroupResults])
  {
    v38 = [v83 searchString];
  }
  else
  {
    v38 = 0;
  }
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke_14;
  v98[3] = &unk_1E63DE6F0;
  id v84 = v35;
  id v99 = v84;
  id v85 = v37;
  id v100 = v85;
  id v90 = v38;
  id v101 = v90;
  id v88 = v87;
  id v102 = v88;
  v103 = self;
  v39 = v98;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v115 = __Block_byref_object_copy__2;
  *(void *)&long long v116 = __Block_byref_object_dispose__2;
  *((void *)&v116 + 1) = 0;
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __CNResultWithQoS_block_invoke;
  v109[3] = &unk_1E63DE788;
  v111 = buf;
  v40 = v39;
  id v110 = v40;
  v41 = v109;
  dispatch_block_t v42 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, v41);
  self;
  v43 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  v43[2](v43);
  id v44 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  v45 = CNALoggingContextTriage();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [v83 triageIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v46;
    _os_log_impl(&dword_1BEF57000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Will convert to autocomplete results", buf, 0xCu);
  }
  v47 = [MEMORY[0x1E4F1CA70] orderedSet];
  v48 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v49 = v44;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v94 objects:v112 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v95 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = *(void **)(*((void *)&v94 + 1) + 8 * j);
        v54 = [v53 chatGuid];
        v55 = v54;
        if (v54)
        {
          id v56 = v54;
        }
        else
        {
          id v56 = [v53 handle];
        }
        v57 = v56;

        v58 = [v92 objectForKeyedSubscript:v57];
        v59 = v58;
        if (v58)
        {
          objc_msgSend(v58, "setSourceType:", objc_msgSend(v53, "resultSourceType") | objc_msgSend(v58, "sourceType"));
          [v47 addObject:v59];
          if (([v59 sourceType] & 0x10) != 0) {
            [v48 addObject:v59];
          }
        }
        else
        {
          v60 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v53;
            _os_log_error_impl(&dword_1BEF57000, v60, OS_LOG_TYPE_ERROR, "Suggestion from PS has no identifier; this result may be ranked lower than it should be: %{public}@",
              buf,
              0xCu);
          }
        }
      }
      uint64_t v50 = [v49 countByEnumeratingWithState:&v94 objects:v112 count:16];
    }
    while (v50);
  }

  v61 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:]();
  }

  v62 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:]();
  }

  v63 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
    -[_CNAPeopleSuggesterResultPrioritizer applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:]();
  }

  [v47 addObjectsFromArray:obj];
  [v47 addObjectsFromArray:v81];
  v64 = [MEMORY[0x1E4F1CA48] array];
  v65 = [v47 array];
  v66 = [(_CNAPeopleSuggesterResultPrioritizer *)self partitionStewieResults:v65];

  v67 = [v66 first];
  [v64 addObjectsFromArray:v67];

  v68 = [v66 second];
  [v64 addObjectsFromArray:v68];

  [v79 finishWithResult:v48];
  v69 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v69 timestamp];
  double v71 = v70;

  v72 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v71 - v9];
  v73 = CNALoggingContextTriage();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    v74 = [v83 triageIdentifier];
    uint64_t v75 = [v64 count];
    uint64_t v76 = [v64 count];
    v77 = "results";
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v74;
    *(_WORD *)&buf[12] = 2048;
    if (v76 == 1) {
      v77 = "result";
    }
    *(void *)&buf[14] = v75;
    *(_WORD *)&buf[22] = 2080;
    v115 = (uint64_t (*)(uint64_t, uint64_t))v77;
    LOWORD(v116) = 2114;
    *(void *)((char *)&v116 + 2) = v72;
    _os_log_impl(&dword_1BEF57000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] PeopleSuggester: Sort complete (%lu %s, %{public}@)", buf, 0x2Au);
  }
  return v64;
}

- (id)partitionCandidatesForRanking:(id)a3 givenPrefixes:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke;
  v10[3] = &unk_1E63DE740;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  double v8 = objc_msgSend(a3, "_cn_partition:", v10);

  return v8;
}

- (id)partitionStewieResults:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_partition:", &__block_literal_global_26);
}

- (BOOL)resultMatchesPrefix:(id)a3 inNameComponentsOfResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    double v8 = [v6 firstName];
    if (objc_msgSend(v8, "_cn_hasPrefix:", v5))
    {
      char v9 = 1;
    }
    else
    {
      v10 = [v7 lastName];
      if (objc_msgSend(v10, "_cn_hasPrefix:", v5))
      {
        char v9 = 1;
      }
      else
      {
        id v11 = [v7 nickname];
        if (objc_msgSend(v11, "_cn_hasPrefix:", v5))
        {
          char v9 = 1;
        }
        else
        {
          v12 = [v7 nameSuffix];
          char v9 = objc_msgSend(v12, "_cn_hasPrefix:", v5);
        }
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)resultIdentifierIsValidMessagesChatGuid:(id)a3
{
  id v3 = a3;
  if ([v3 resultType] == 1)
  {
    v4 = [v3 identifier];
    if ([v4 containsString:@"iMessage"])
    {
LABEL_5:

LABEL_10:
      BOOL v8 = 1;
      goto LABEL_11;
    }
    id v5 = [v3 identifier];
    if ([v5 containsString:@"SMS"])
    {

      goto LABEL_5;
    }
    id v6 = [v3 identifier];
    char v7 = [v6 containsString:@"urn:biz:"];

    if (v7) {
      goto LABEL_10;
    }
  }
  if ([v3 resultType] == 1 && (objc_msgSend(v3, "sourceType") & 0x10) != 0) {
    goto LABEL_10;
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

+ (id)bundleIdentifierOfCurrentProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___CNAPeopleSuggesterResultPrioritizer_bundleIdentifierOfCurrentProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bundleIdentifierOfCurrentProcess_cn_once_token_20 != -1) {
    dispatch_once(&bundleIdentifierOfCurrentProcess_cn_once_token_20, block);
  }
  v2 = (void *)bundleIdentifierOfCurrentProcess_cn_once_object_20;
  return v2;
}

+ (id)makeBundleIdentifierOfCurrentProcess
{
  v2 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 bundleIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Final assembly 3. nonCandidates: %{private}@", v2, v3, v4, v5, v6);
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Final assembly 2. candidatesToRank: %{private}@", v2, v3, v4, v5, v6);
}

- (void)applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Final assembly 1. finalResults: %{private}@", v2, v3, v4, v5, v6);
}

@end