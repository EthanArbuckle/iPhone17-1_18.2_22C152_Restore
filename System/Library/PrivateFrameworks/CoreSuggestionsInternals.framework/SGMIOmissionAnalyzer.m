@interface SGMIOmissionAnalyzer
+ (BOOL)matchRecentContact:(id)a3 store:(id)a4;
+ (id)_identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14;
+ (id)filterOutOrConvertMatches:(id)a3 visibleFlatRecipientEmailsList:(id)a4 visibleFlatRecipientList:(id)a5 bccFlatRecipientList:(id)a6 contactMatchRequired:(BOOL)a7 textContent:(id)a8 regexLanguage:(id)a9 detectedLanguage:(id)a10 store:(id)a11;
+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11;
+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14;
+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4;
+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 store:(id)a5;
@end

@implementation SGMIOmissionAnalyzer

+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 store:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  v9 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = @"negative";
    if (v6) {
      v10 = @"positive";
    }
    int v17 = 138412290;
    v18 = v10;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGMI received %@ feedback for missing entity warning", (uint8_t *)&v17, 0xCu);
  }

  v11 = [v7 sgmiFeatureStore];

  v12 = [v11 incrementUserEngagement:v6 forWarning:v8];

  v13 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v12 BOOLValue];
    v15 = @"not";
    if (v14) {
      v15 = @"still";
    }
    int v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGMI will %@ trigger a warning for such signature", (uint8_t *)&v17, 0xCu);
  }

  return v12;
}

+ (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  BOOL v6 = +[SGSqlEntityStore defaultStore];
  id v7 = +[SGMIOmissionAnalyzer reportUserEngagement:v4 forWarning:v5 store:v6];

  return v7;
}

+ (BOOL)matchRecentContact:(id)a3 store:(id)a4
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  char v78 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  char v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  char v72 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke;
  v61[3] = &unk_1E65BE808;
  v63 = v77;
  v64 = v75;
  v65 = v73;
  v66 = v71;
  id v8 = v7;
  v62 = v8;
  v9 = (void *)MEMORY[0x1CB79B4C0](v61);
  v10 = objc_opt_new();
  [v10 setName:@"Mail Previous Recipients for omittedRecipient Queue"];
  [v10 setQualityOfService:25];
  v11 = (void *)MEMORY[0x1E4F5CCF0];
  v83[0] = *MEMORY[0x1E4F5CC60];
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
  v13 = [v11 searchQueryForSearchTerm:v5 preferredKinds:v12 sendingAddress:0 recentsDomain:*MEMORY[0x1E4F5CCB8]];

  int v14 = [MEMORY[0x1E4F5CCE0] defaultInstance];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_2;
  v55[3] = &unk_1E65BE830;
  v59 = &v67;
  v60 = v77;
  id v15 = v5;
  id v56 = v15;
  v16 = v8;
  v57 = v16;
  id v17 = v9;
  id v58 = v17;
  [v14 performRecentsSearch:v13 operationQueue:v10 completion:v55];

  v18 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_155;
  block[3] = &unk_1E65BE858;
  id v19 = v15;
  id v50 = v19;
  v53 = &v67;
  v54 = v75;
  v20 = v16;
  v51 = v20;
  id v21 = v17;
  id v52 = v21;
  dispatch_async(v18, block);

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_158;
  v42[3] = &unk_1E65BE880;
  id v22 = v6;
  id v43 = v22;
  id v23 = v19;
  id v44 = v23;
  v47 = &v67;
  v48 = v73;
  v24 = v20;
  v45 = v24;
  id v25 = v21;
  id v46 = v25;
  dispatch_async(v18, v42);

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_159;
  v35[3] = &unk_1E65BE880;
  id v26 = v22;
  id v36 = v26;
  id v27 = v23;
  id v37 = v27;
  v40 = &v67;
  v41 = v71;
  v28 = v24;
  v38 = v28;
  id v29 = v25;
  id v39 = v29;
  dispatch_async(v18, v35);

  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v28 timeoutSeconds:0.1] == 1)
  {
    v30 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      id v80 = v27;
      _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "SGMIOmissionAnalyzer: Attempt to match %{sensitive}@ against the various sources of contacts timed out.", buf, 0xCu);
    }

    BOOL v31 = 0;
  }
  else
  {
    v32 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v68 + 24)) {
        v33 = @"found a match";
      }
      else {
        v33 = @"did not find any match";
      }
      *(_DWORD *)buf = 138740227;
      id v80 = v27;
      __int16 v81 = 2112;
      v82 = v33;
      _os_log_impl(&dword_1CA650000, v32, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer Attempt to match %{sensitive}@ against the various sources of contacts %@.", buf, 0x16u);
    }

    BOOL v31 = *((unsigned char *)v68 + 24) != 0;
  }

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v77, 8);

  return v31;
}

intptr_t __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke(intptr_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24)) {
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
    }
  }
  return result;
}

intptr_t __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= [v3 count] != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138739971;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a contact match for %{sensitive}@ in CoreRecents", (uint8_t *)&v9, 0xCu);
    }

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_155(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:*(void *)(a1 + 32)];
  v14[0] = *MEMORY[0x1E4F1AE08];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v5 = [v2 unifiedContactsMatchingPredicate:v3 keysToFetch:v4 error:0];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= [v5 count] != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if ([v5 count])
  {
    uint64_t v6 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v5 firstObject];
      int v9 = [v8 identifier];
      int v10 = 138740227;
      uint64_t v11 = v7;
      __int16 v12 = 2117;
      v13 = v9;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a contact match: %{sensitive}@ ->  %{sensitive}@ in Contacts", (uint8_t *)&v10, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_158(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) suggestContactMatchesWithMessagingPrefix:*(void *)(a1 + 40) limitTo:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v2 count] != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  if ([v2 count])
  {
    id v3 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [v2 firstObject];
      uint64_t v6 = [v5 contact];
      uint64_t v7 = [v6 name];
      int v8 = 138740227;
      uint64_t v9 = v4;
      __int16 v10 = 2117;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a pseudo contact match: %{sensitive}@ ->  %{sensitive}@", (uint8_t *)&v8, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __49__SGMIOmissionAnalyzer_matchRecentContact_store___block_invoke_159(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sgmiFeatureStore];
  id v3 = [v2 knownEmailAddressesForNickname:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v3 count] != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  if ([v3 count])
  {
    uint64_t v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [v3 firstObject];
      int v7 = 138740227;
      uint64_t v8 = v5;
      __int16 v9 = 2117;
      __int16 v10 = v6;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer found a nickname match: %{sensitive}@ ->  %{sensitive}@", (uint8_t *)&v7, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

+ (id)filterOutOrConvertMatches:(id)a3 visibleFlatRecipientEmailsList:(id)a4 visibleFlatRecipientList:(id)a5 bccFlatRecipientList:(id)a6 contactMatchRequired:(BOOL)a7 textContent:(id)a8 regexLanguage:(id)a9 detectedLanguage:(id)a10 store:(id)a11
{
  BOOL v103 = a7;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v110 = a6;
  id v116 = a8;
  id v109 = a9;
  id v108 = a10;
  id v112 = a11;
  v105 = objc_opt_new();
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obuint64_t j = v15;
  uint64_t v114 = [obj countByEnumeratingWithState:&v139 objects:v152 count:16];
  if (v114)
  {
    uint64_t v113 = *(void *)v140;
    id v106 = v16;
    id v107 = v17;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v140 != v113) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v139 + 1) + 8 * v18);
        if ([v19 coreRange] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v99 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
          {
            v101 = +[SGMITrialClientWrapper sharedInstance];
            v102 = [v101 trialMetadataString];
            *(_DWORD *)buf = 138412290;
            v147 = v102;
            _os_log_fault_impl(&dword_1CA650000, v99, OS_LOG_TYPE_FAULT, "SGMI inconsistent recipient detection. Likely an issue in assets: %@", buf, 0xCu);
          }
          v96 = obj;

          id v98 = (id)MEMORY[0x1E4F1CBF0];
          v97 = v105;
          goto LABEL_95;
        }
        v115 = v19;
        uint64_t v20 = [v19 coreRange];
        id v22 = objc_msgSend(v116, "substringWithRange:", v20, v21);
        long long v135 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        uint64_t v23 = [&unk_1F2536BF0 countByEnumeratingWithState:&v135 objects:v151 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v136;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v136 != v25) {
                objc_enumerationMutation(&unk_1F2536BF0);
              }
              id v27 = *(void **)(*((void *)&v135 + 1) + 8 * i);
              if ([v22 hasSuffix:v27])
              {
                uint64_t v28 = objc_msgSend(v22, "substringToIndex:", objc_msgSend(v22, "length") - objc_msgSend(v27, "length"));

                id v22 = (void *)v28;
              }
            }
            uint64_t v24 = [&unk_1F2536BF0 countByEnumeratingWithState:&v135 objects:v151 count:16];
          }
          while (v24);
        }
        if ((unint64_t)[v22 length] < 2) {
          goto LABEL_18;
        }
        id v29 = [v22 substringFromIndex:1];
        v30 = [v22 lowercaseString];
        BOOL v31 = [v30 substringFromIndex:1];
        int v32 = [v29 isEqualToString:v31];

        if (v32)
        {
LABEL_18:
          uint64_t v118 = v18;
          v33 = [v112 sgmiFeatureStore];
          v34 = [v33 knownEmailAddressesForNickname:v22];

          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          id v35 = v34;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v131 objects:v150 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v132;
            while (2)
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v132 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = *(void **)(*((void *)&v131 + 1) + 8 * j);
                if ([v16 containsObject:v40])
                {
                  v66 = sgMailIntelligenceLogHandle();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138740227;
                    v147 = v22;
                    __int16 v148 = 2117;
                    v149 = v40;
                    _os_log_impl(&dword_1CA650000, v66, OS_LOG_TYPE_DEFAULT, "SGMIOmissionAnalyzer identified \"%{sensitive}@\" as a nickname used in the past for %{sensitive}@.", buf, 0x16u);
                  }
                  uint64_t v61 = (uint64_t)v35;
                  uint64_t v18 = v118;
                  goto LABEL_60;
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v131 objects:v150 count:16];
              if (v37) {
                continue;
              }
              break;
            }
          }

          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v41 = v17;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v127 objects:v145 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v128;
            while (2)
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v128 != v44) {
                  objc_enumerationMutation(v41);
                }
                if ([*(id *)(*((void *)&v127 + 1) + 8 * k) rangeOfString:v22 options:129] != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v18 = v118;
                  goto LABEL_62;
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v127 objects:v145 count:16];
              if (v43) {
                continue;
              }
              break;
            }
          }

          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          id v117 = v110;
          uint64_t v46 = [v117 countByEnumeratingWithState:&v123 objects:v144 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v124;
            while (2)
            {
              for (uint64_t m = 0; m != v47; ++m)
              {
                if (*(void *)v124 != v48) {
                  objc_enumerationMutation(v117);
                }
                uint64_t v50 = [*(id *)(*((void *)&v123 + 1) + 8 * m) rangeOfString:v22 options:129];
                if (v50 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v70 = v50;
                  uint64_t v71 = v51;
                  char v72 = (void *)MEMORY[0x1E4F5DA98];
                  uint64_t v73 = [v115 range];
                  v66 = objc_msgSend(v72, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v116, v73, v74, 16);
                  id v104 = objc_alloc(MEMORY[0x1E4F5DA78]);
                  id v75 = [NSString alloc];
                  char v76 = [v115 signature];
                  v77 = (void *)[v75 initWithFormat:@"%@-%@", v109, v76];
                  char v78 = objc_msgSend(v116, "substringWithRange:", v70, v71);
                  uint64_t v79 = [v104 initWithSnippet:v66 core:v22 handle:0 signature:v77 detectedLanguage:v108 isIncomingMessage:0 score:&unk_1F25363F0 matchFoundInBCC:v78];

                  id v80 = [v112 sgmiFeatureStore];
                  __int16 v81 = [v80 shouldExposeWarning:v79];

                  if ([v81 BOOLValue])
                  {
                    [v105 addObject:v79];
                    v82 = (void *)v79;
                    id v16 = v106;
                    uint64_t v61 = (uint64_t)v117;
                    uint64_t v18 = v118;
                  }
                  else
                  {
                    v82 = (void *)v79;
                    v83 = sgMailIntelligenceLogHandle();
                    id v16 = v106;
                    uint64_t v61 = (uint64_t)v117;
                    uint64_t v18 = v118;
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1CA650000, v83, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
                    }
                  }
                  id v17 = v107;
                  goto LABEL_60;
                }
              }
              uint64_t v47 = [v117 countByEnumeratingWithState:&v123 objects:v144 count:16];
              if (v47) {
                continue;
              }
              break;
            }
          }

          id v16 = v106;
          id v17 = v107;
          uint64_t v18 = v118;
          if (objc_msgSend(v116, "characterAtIndex:", objc_msgSend(v115, "range")) == 64)
          {
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            id v52 = v41;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v119 objects:v143 count:16];
            if (v53)
            {
              uint64_t v54 = v53;
              uint64_t v55 = *(void *)v120;
              while (2)
              {
                for (uint64_t n = 0; n != v54; ++n)
                {
                  if (*(void *)v120 != v55) {
                    objc_enumerationMutation(v52);
                  }
                  v57 = *(void **)(*((void *)&v119 + 1) + 8 * n);
                  if ([v57 rangeOfString:@"group"] != 0x7FFFFFFFFFFFFFFFLL
                    || [v57 rangeOfString:@"list"] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v66 = sgMailIntelligenceLogHandle();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138740227;
                      v147 = v22;
                      __int16 v148 = 2117;
                      v149 = v57;
                      _os_log_impl(&dword_1CA650000, v66, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning for %{sensitive}@ but blocked it because one recipient address (%{sensitive}@) seems to be a group.", buf, 0x16u);
                    }
                    uint64_t v61 = (uint64_t)v52;
                    id v16 = v106;
                    id v17 = v107;
                    goto LABEL_60;
                  }
                }
                uint64_t v54 = [v52 countByEnumeratingWithState:&v119 objects:v143 count:16];
                id v16 = v106;
                if (v54) {
                  continue;
                }
                break;
              }
            }

            id v17 = v107;
          }
          if (!v103
            || +[SGMIOmissionAnalyzer matchRecentContact:v22 store:v112])
          {
            id v58 = (void *)MEMORY[0x1E4F5DA98];
            uint64_t v59 = [v115 range];
            uint64_t v61 = objc_msgSend(v58, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v116, v59, v60, 16);
            id v62 = objc_alloc(MEMORY[0x1E4F5DA78]);
            id v63 = [NSString alloc];
            v64 = [v115 signature];
            v65 = (void *)[v63 initWithFormat:@"%@-%@", v109, v64];
            v66 = [v62 initWithSnippet:v61 core:v22 handle:0 signature:v65 detectedLanguage:v108 isIncomingMessage:0 score:&unk_1F25363F0 matchFoundInBCC:0];

            uint64_t v67 = [v112 sgmiFeatureStore];
            v68 = [v67 shouldExposeWarning:v66];

            uint64_t v69 = v68;
            if ([v68 BOOLValue])
            {
              [v105 addObject:v66];
              id v17 = v107;
            }
            else
            {
              if (v103)
              {
                v84 = sgMailIntelligenceLogHandle();
                id v17 = v107;
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CA650000, v84, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
                }
              }
              else
              {
                v85 = v68;
                id v86 = objc_alloc(MEMORY[0x1E4F5DA78]);
                id v87 = [NSString alloc];
                v88 = [v115 signature];
                v89 = (void *)[v87 initWithFormat:@"%@-0000%@", v109, v88];
                uint64_t v90 = [v86 initWithSnippet:v61 core:v22 handle:0 signature:v89 detectedLanguage:v108 isIncomingMessage:0 score:&unk_1F25363F0 matchFoundInBCC:0];

                v66 = v90;
                v91 = [v112 sgmiFeatureStore];
                v92 = [v91 shouldExposeWarning:v66];

                id v17 = v107;
                if ([v92 BOOLValue]
                  && +[SGMIOmissionAnalyzer matchRecentContact:v22 store:v112])
                {
                  v93 = sgMailIntelligenceLogHandle();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138739971;
                    v147 = v22;
                    _os_log_impl(&dword_1CA650000, v93, OS_LOG_TYPE_DEFAULT, "SGMI created a second chance recipient warning for %{sensitive}@.", buf, 0xCu);
                  }

                  [v105 addObject:v66];
                }
                else
                {
                  v94 = sgMailIntelligenceLogHandle();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1CA650000, v94, OS_LOG_TYPE_DEFAULT, "SGMI identified a recipient warning from a conservative regex which user engagement was poor, even with contact match.", buf, 2u);
                  }
                }
                uint64_t v69 = v92;
              }
              uint64_t v18 = v118;
            }

LABEL_60:
            id v41 = (id)v61;
LABEL_62:
          }
        }

        ++v18;
      }
      while (v18 != v114);
      uint64_t v95 = [obj countByEnumeratingWithState:&v139 objects:v152 count:16];
      uint64_t v114 = v95;
      if (v95) {
        continue;
      }
      break;
    }
  }
  v96 = obj;

  v97 = v105;
  id v98 = v105;
LABEL_95:

  return v98;
}

+ (id)_identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14
{
  uint64_t v245 = *MEMORY[0x1E4F143B8];
  id v197 = a3;
  id v196 = a4;
  id v180 = a5;
  id v19 = a6;
  id v204 = a7;
  id v195 = a8;
  id v193 = a9;
  id v194 = a10;
  id v20 = a11;
  uint64_t v21 = (__CFString *)a12;
  id v205 = a13;
  LODWORD(a7) = [MEMORY[0x1E4F5DAF0] mailIntelligenceSPILogging];
  id v22 = sgMailIntelligenceLogHandle();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  v184 = v19;
  v185 = v20;
  v181 = v21;
  if (a7)
  {
    id v24 = v197;
    if (v23)
    {
      uint64_t v25 = [v196 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v190 = [v180 description];
      uint64_t v26 = [v190 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v188 = [v19 description];
      uint64_t v27 = [v188 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v186 = [v204 description];
      v202 = [v186 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v182 = [v195 description];
      [v182 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v198 = (void *)v27;
      id v200 = (id)objc_claimAutoreleasedReturnValue();
      if (v193)
      {
        uint64_t v28 = [v193 description];
      }
      else
      {
        uint64_t v28 = @"(null)";
      }
      v176 = v28;
      v178 = (void *)v26;
      id v29 = [(__CFString *)v28 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      if (v194)
      {
        v30 = [v194 description];
      }
      else
      {
        v30 = @"(null)";
      }
      BOOL v31 = [(__CFString *)v30 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      int v32 = [v185 description];
      uint64_t v33 = [v32 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      v34 = (void *)v33;
      id v35 = v181;
      *(_DWORD *)buf = 138742275;
      if (!v181) {
        id v35 = @"(null)";
      }
      uint64_t v226 = (uint64_t)v197;
      __int16 v227 = 2117;
      v228 = v25;
      __int16 v229 = 2117;
      v230 = v178;
      __int16 v231 = 2117;
      v232 = v198;
      __int16 v233 = 2117;
      v234 = v202;
      __int16 v235 = 2117;
      id v236 = v200;
      __int16 v237 = 2117;
      id v238 = v29;
      __int16 v239 = 2117;
      v240 = v31;
      __int16 v241 = 2117;
      uint64_t v242 = v33;
      __int16 v243 = 2112;
      v244 = v35;
      _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "SGMI-SPI (input)identifyComposeWarningsFromSubject:%{sensitive}@ content:%{sensitive}@ attributes:%{sensitive}@ toRecipients:%{sensitive}@ ccRecipients:%{sensitive}@ bccRecipients:%{sensitive}@ originalToRecipients:%{sensitive}@ originalCcRecipients:%{sensitive}@ attachments:%{sensitive}@ language:%@", buf, 0x66u);

      if (v194) {
      if (v193)
      }

      id v19 = v184;
      id v20 = v185;
      uint64_t v21 = v181;
      id v24 = v197;
    }
  }
  else
  {
    id v24 = v197;
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "SGMI started omission analysis", buf, 2u);
    }
  }

  uint64_t v36 = [v19 arrayByAddingObjectsFromArray:v204];
  uint64_t v37 = [v196 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  if (v21)
  {
    uint64_t v38 = v21;
  }
  else
  {
    id v39 = (void *)MEMORY[0x1E4F89D60];
    v40 = +[SGMessage preferredLanguages];
    id v41 = [v39 detectLanguageFromTextHeuristicallyWithLanguages:v37 languages:v40 defaultLanguage:0];
    uint64_t v42 = v41;
    if (v41)
    {
      uint64_t v38 = v41;
    }
    else
    {
      uint64_t v43 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v38 = [v43 languageCode];

      id v19 = v184;
    }
  }
  uint64_t v44 = v38;
  v189 = +[SGMIConfig defaultConfig];
  v45 = [v189 objectForKeyedSubscript:v44];
  v201 = v44;
  v203 = v44;
  if (!v45)
  {

    v201 = @"en";
    v45 = objc_msgSend(v189, "objectForKeyedSubscript:");
  }
  v183 = v45;
  if ([v19 count] == 1 && !objc_msgSend(v204, "count"))
  {
    uint64_t v46 = [v19 firstObject];
    uint64_t v47 = [v46 handles];
    uint64_t v48 = [v47 count];

    if (v48 == 1)
    {
      v49 = [v45 nickname];
      uint64_t v50 = [v49 body];
      uint64_t v51 = [v50 matchForString:v37];

      if (v51)
      {
        id v52 = [v205 sgmiFeatureStore];
        uint64_t v53 = [v51 coreRange];
        uint64_t v55 = objc_msgSend(v37, "substringWithRange:", v53, v54);
        id v56 = [v19 firstObject];
        v57 = [v56 handles];
        id v58 = [v57 firstObject];
        [v52 recordMappingFromNickname:v55 toEmailAddress:v58];

        v45 = v183;
      }
    }
  }
  v199 = v37;
  v179 = v36;
  if ([v20 count])
  {
    v187 = objc_opt_new();
  }
  else
  {
    uint64_t v59 = [v189 attachmentLinkDetectionRegex];
    uint64_t v60 = objc_msgSend(v59, "firstMatchInString:options:range:", v37, 0, 0, objc_msgSend(v37, "length"));

    if (v60)
    {
      uint64_t v61 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = [v60 range];
        v64 = objc_msgSend(v37, "substringWithRange:", v62, v63);
        *(_DWORD *)buf = 138739971;
        uint64_t v226 = (uint64_t)v64;
        _os_log_impl(&dword_1CA650000, v61, OS_LOG_TYPE_DEFAULT, "SGMI identified a file-sharing link in the body: %{sensitive}@ and therefore consider it as an attachment.", buf, 0xCu);
      }
    }

    v187 = objc_opt_new();
    if (!v60)
    {
      int v191 = 0;
      goto LABEL_43;
    }
  }
  int v65 = 1;
  if (![MEMORY[0x1E4F93B08] isDNUEnabled])
  {
    uint64_t v66 = 0;
    goto LABEL_95;
  }
  int v191 = 1;
LABEL_43:
  uint64_t v67 = [v45 attachment];
  v68 = [v67 subject];
  uint64_t v69 = [v68 matchForString:v24];

  BOOL v177 = v69 != 0;
  if (v69)
  {
    id v70 = objc_alloc(MEMORY[0x1E4F5DA70]);
    uint64_t v71 = [v69 range];
    uint64_t v73 = v72;
    id v74 = [NSString alloc];
    id v75 = [v69 signature];
    char v76 = (void *)[v74 initWithFormat:@"%@-%@", v201, v75];
    LOBYTE(v165) = 0;
    v77 = objc_msgSend(v70, "initFromString:coreRange:signature:maxWindowSizeAroundCore:detectedLanguage:isIncomingMessage:score:", v24, v71, v73, v76, 16, v203, v165, &unk_1F25363F0);

    if (v77)
    {
      char v78 = [v205 sgmiFeatureStore];
      uint64_t v79 = [v78 shouldExposeWarning:v77];

      if (![v79 BOOLValue])
      {
        id v80 = sgMailIntelligenceLogHandle();
        v45 = v183;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v80, OS_LOG_TYPE_DEFAULT, "SGMI identified a subject warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
        }

        goto LABEL_55;
      }
      [v187 addObject:v77];
    }
    else
    {
      uint64_t v79 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v79, OS_LOG_TYPE_FAULT, "SGMI failed to create a warning from a match.", buf, 2u);
      }
      v77 = 0;
    }
    v45 = v183;
LABEL_55:

    goto LABEL_56;
  }
  v77 = 0;
LABEL_56:
  __int16 v81 = [v45 attachment];
  v82 = [v81 body];
  v83 = [v82 matchForString:v37];

  if (v83)
  {
    uint64_t v84 = [v83 range];
    uint64_t v86 = v84 + v85;
    uint64_t v87 = [v37 length];
    uint64_t v88 = [v83 range];
    if ((unint64_t)(v87 - (v89 + v88)) >= 0xC) {
      uint64_t v90 = 12;
    }
    else {
      uint64_t v90 = v87 - (v89 + v88);
    }
    v91 = objc_msgSend(v37, "substringWithRange:", v86, v90);
    if ([v91 rangeOfString:@"http"] == 0x7FFFFFFFFFFFFFFFLL
      && [v91 rangeOfString:@"www"] == 0x7FFFFFFFFFFFFFFFLL)
    {

      long long v220 = 0u;
      long long v221 = 0u;
      long long v218 = 0u;
      long long v219 = 0u;
      v92 = [v83 wildcardsMatches];
      uint64_t v93 = [v92 countByEnumeratingWithState:&v218 objects:v224 count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v219;
        v171 = v77;
        v175 = v92;
        uint64_t v167 = *(void *)v219;
        do
        {
          uint64_t v95 = 0;
          uint64_t v168 = v93;
          do
          {
            if (*(void *)v219 != v94) {
              objc_enumerationMutation(v92);
            }
            uint64_t v170 = v95;
            v96 = *(void **)(*((void *)&v218 + 1) + 8 * v95);
            long long v214 = 0u;
            long long v215 = 0u;
            long long v216 = 0u;
            long long v217 = 0u;
            v97 = [v96 componentsSeparatedByString:@" "];
            uint64_t v174 = [v97 countByEnumeratingWithState:&v214 objects:v223 count:16];
            if (v174)
            {
              uint64_t v98 = *(void *)v215;
              v172 = v97;
              uint64_t v169 = *(void *)v215;
              do
              {
                for (uint64_t i = 0; i != v174; ++i)
                {
                  if (*(void *)v215 != v98) {
                    objc_enumerationMutation(v97);
                  }
                  v100 = *(void **)(*((void *)&v214 + 1) + 8 * i);
                  if ((unint64_t)[v100 length] >= 4)
                  {
                    long long v212 = 0u;
                    long long v213 = 0u;
                    long long v210 = 0u;
                    long long v211 = 0u;
                    id v101 = v179;
                    uint64_t v102 = [v101 countByEnumeratingWithState:&v210 objects:v222 count:16];
                    if (v102)
                    {
                      uint64_t v103 = v102;
                      uint64_t v104 = *(void *)v211;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v103; ++j)
                        {
                          if (*(void *)v211 != v104) {
                            objc_enumerationMutation(v101);
                          }
                          id v106 = *(void **)(*((void *)&v210 + 1) + 8 * j);
                          uint64_t v107 = [v106 displayName];
                          if (v107)
                          {
                            id v108 = (void *)v107;
                            id v109 = [v106 displayName];
                            uint64_t v110 = [v109 rangeOfString:v100 options:129];

                            if (v110 != 0x7FFFFFFFFFFFFFFFLL)
                            {
                              v160 = sgMailIntelligenceLogHandle();
                              uint64_t v37 = v199;
                              if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                              {
                                uint64_t v161 = [v83 range];
                                v163 = objc_msgSend(v199, "substringWithRange:", v161, v162);
                                *(_DWORD *)buf = 138740227;
                                uint64_t v226 = (uint64_t)v163;
                                __int16 v227 = 2117;
                                v228 = v100;
                                _os_log_impl(&dword_1CA650000, v160, OS_LOG_TYPE_DEFAULT, "SGMI identified potential missing attachment in '%{sensitive}@',however, given '%{sensitive}@' is in the recipients, this warning got disqualified...", buf, 0x16u);
                              }
                              id v20 = v185;
                              uint64_t v36 = v179;
                              v45 = v183;
                              uint64_t v66 = v177;
                              v77 = v171;
                              v83 = v172;
                              goto LABEL_92;
                            }
                          }
                        }
                        uint64_t v103 = [v101 countByEnumeratingWithState:&v210 objects:v222 count:16];
                        if (v103) {
                          continue;
                        }
                        break;
                      }
                    }

                    id v20 = v185;
                    uint64_t v37 = v199;
                    v77 = v171;
                    v97 = v172;
                    v92 = v175;
                    uint64_t v98 = v169;
                  }
                }
                uint64_t v36 = v179;
                uint64_t v94 = v167;
                uint64_t v174 = [v97 countByEnumeratingWithState:&v214 objects:v223 count:16];
              }
              while (v174);
            }

            uint64_t v95 = v170 + 1;
          }
          while (v170 + 1 != v168);
          uint64_t v93 = [v92 countByEnumeratingWithState:&v218 objects:v224 count:16];
        }
        while (v93);
      }

      id v111 = objc_alloc(MEMORY[0x1E4F5DA70]);
      uint64_t v112 = [v83 range];
      uint64_t v114 = v113;
      v115 = v37;
      id v116 = [NSString alloc];
      id v117 = [v83 signature];
      uint64_t v118 = (void *)[v116 initWithFormat:@"%@-%@", v201, v117];
      LOBYTE(v166) = 0;
      uint64_t v119 = objc_msgSend(v111, "initFromString:coreRange:signature:maxWindowSizeAroundCore:detectedLanguage:isIncomingMessage:score:", v115, v112, v114, v118, 16, v203, v166, &unk_1F25363F0);

      long long v120 = [v205 sgmiFeatureStore];
      long long v121 = [v120 shouldExposeWarning:v119];

      long long v122 = v121;
      if ([v121 BOOLValue])
      {
        [v187 addObject:v119];
        uint64_t v66 = 1;
        v175 = v83;
        v77 = (void *)v119;
        uint64_t v37 = v199;
        v45 = v183;
      }
      else
      {
        v164 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v164, OS_LOG_TYPE_DEFAULT, "SGMI identified a body warning but blocked it because of a poor user engagement on the pattern.", buf, 2u);
        }

        uint64_t v66 = 1;
        v175 = v83;
        v77 = (void *)v119;
        uint64_t v37 = v199;
        v45 = v183;
      }
      v83 = v122;
    }
    else
    {
      v175 = v91;
      long long v123 = sgMailIntelligenceLogHandle();
      uint64_t v66 = v177;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v124 = [v83 range];
        long long v126 = objc_msgSend(v37, "substringWithRange:", v124, v125);
        *(_DWORD *)buf = 138740227;
        uint64_t v226 = (uint64_t)v126;
        __int16 v227 = 2117;
        v228 = v175;
        _os_log_impl(&dword_1CA650000, v123, OS_LOG_TYPE_DEFAULT, "SGMI identified potential missing attachment in '%{sensitive}@',however, given a link seems to be present in the following characters: '%{sensitive}@', this warning got disqualified...", buf, 0x16u);
      }
    }
LABEL_92:

    int v65 = v191;
  }
  else
  {
    int v65 = v191;
    uint64_t v66 = v69 != 0;
  }

LABEL_95:
  long long v127 = [v205 sgmiFeatureStore];
  [v127 updateAttachmentDetectionStatsOnMailWithTextContent:v37 attachments:v20 warningRaised:v66 & (v65 ^ 1) attachmentPredicted:v66 isIncomingMail:0];

  if (v65) {
    id v128 = (id)objc_opt_new();
  }
  else {
    id v128 = v187;
  }
  long long v129 = v128;
  v192 = objc_opt_new();
  long long v130 = [v45 recipientConservative];
  long long v131 = [v130 body];
  long long v132 = [v131 matchesForString:v37];

  long long v133 = [v45 recipient];
  long long v134 = [v133 body];
  long long v135 = [v134 matchesForString:v37];

  v208[0] = MEMORY[0x1E4F143A8];
  v208[1] = 3221225472;
  v208[2] = __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke;
  v208[3] = &unk_1E65BE7C0;
  id v136 = v132;
  id v209 = v136;
  long long v137 = objc_msgSend(v135, "_pas_filteredArrayWithTest:", v208);

  uint64_t v138 = [v136 count];
  unint64_t v139 = [v137 count] + v138;
  if (v139)
  {
    if (v193 && v194 && (uint64_t v140 = [v193 count], v140 + objc_msgSend(v194, "count")))
    {
      v144 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v193];
      [v144 addObjectsFromArray:v194];
      v145 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v184];
      [v145 addObjectsFromArray:v204];
      [v145 minusSet:v144];
      if ([v145 count] >= v139)
      {

        id v136 = (id)MEMORY[0x1E4F1CBF0];
        long long v137 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v206[0] = MEMORY[0x1E4F143A8];
      v206[1] = 3221225472;
      v206[2] = __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2;
      v206[3] = &unk_1E65BE7C0;
      id v207 = v199;
      long long v141 = (void *)MEMORY[0x1CB79B4C0](v206);
      uint64_t v142 = objc_msgSend(v136, "_pas_filteredArrayWithTest:", v141);

      uint64_t v143 = objc_msgSend(v137, "_pas_filteredArrayWithTest:", v141);

      v144 = v207;
      id v136 = (id)v142;
      long long v137 = (void *)v143;
    }
    v173 = v137;
  }
  else
  {
    v173 = v137;
  }
  v146 = objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_55_35286);
  v147 = objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_60_35287);
  __int16 v148 = objc_msgSend(v195, "_pas_mappedArrayWithTransform:", &__block_literal_global_65_35288);
  v149 = +[SGMIOmissionAnalyzer filterOutOrConvertMatches:v136 visibleFlatRecipientEmailsList:v146 visibleFlatRecipientList:v147 bccFlatRecipientList:v148 contactMatchRequired:0 textContent:v199 regexLanguage:v201 detectedLanguage:v203 store:v205];
  [v192 addObjectsFromArray:v149];

  v150 = +[SGMIOmissionAnalyzer filterOutOrConvertMatches:v173 visibleFlatRecipientEmailsList:v146 visibleFlatRecipientList:v147 bccFlatRecipientList:v148 contactMatchRequired:!a14 textContent:v199 regexLanguage:v201 detectedLanguage:v203 store:v205];
  [v192 addObjectsFromArray:v150];

  v151 = [v205 sgmiFeatureStore];
  objc_msgSend(v151, "updateRecipientDetectionStatsWarningRaised:", objc_msgSend(v192, "count") != 0);

  [v129 addObjectsFromArray:v192];
  int v152 = [MEMORY[0x1E4F5DAF0] mailIntelligenceSPILogging];
  uint64_t v153 = sgMailIntelligenceLogHandle();
  BOOL v154 = os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT);
  if (v152)
  {
    if (v154)
    {
      v155 = [v129 description];
      v156 = [v155 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      *(_DWORD *)buf = 138739971;
      uint64_t v226 = (uint64_t)v156;
      _os_log_impl(&dword_1CA650000, v153, OS_LOG_TYPE_DEFAULT, "SGMI-SPI (output compose warnings) %{sensitive}@", buf, 0xCu);
    }
  }
  else if (v154)
  {
    uint64_t v157 = [v129 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v226 = v157;
    _os_log_impl(&dword_1CA650000, v153, OS_LOG_TYPE_DEFAULT, "SGMI ended omission analysis and returned %tu results", buf, 0xCu);
  }

  id v158 = v129;
  return v158;
}

uint64_t __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        NSUInteger v10 = objc_msgSend(v3, "coreRange", (void)v16);
        NSUInteger v12 = v11;
        v23.locatiouint64_t n = [v9 coreRange];
        v23.length = v13;
        v22.locatiouint64_t n = v10;
        v22.length = v12;
        if (NSIntersectionRange(v22, v23).length)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

BOOL __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(a2, "range")) == 64;
}

id __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 displayName];
  uint64_t v6 = [v3 handles];

  uint64_t v7 = [v6 componentsJoinedByString:@" "];
  uint64_t v8 = (void *)[v4 initWithFormat:@"%@ %@", v5, v7];

  return v8;
}

id __224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 displayName];
  uint64_t v6 = [v3 handles];

  uint64_t v7 = [v6 componentsJoinedByString:@" "];
  uint64_t v8 = (void *)[v4 initWithFormat:@"%@ %@", v5, v7];

  return v8;
}

__CFString *__224__SGMIOmissionAnalyzer__identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 handles];
  if ([v3 count] == 1)
  {
    id v4 = [v2 handles];
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = &stru_1F24EEF20;
  }

  return v5;
}

+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 language:(id)a12 store:(id)a13 disableConservativeCheckRequirement:(BOOL)a14
{
  id v45 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v43 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  if (identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken2 != -1) {
    dispatch_once(&identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken2, &__block_literal_global_35318);
  }
  uint64_t v28 = (id)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult;
  uint64_t v69 = 0;
  id v70 = &v69;
  uint64_t v71 = 0x3032000000;
  uint64_t v72 = __Block_byref_object_copy__35319;
  uint64_t v73 = __Block_byref_object_dispose__35320;
  id v74 = (id)MEMORY[0x1E4F1CBF0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_7;
  block[3] = &unk_1E65BE798;
  uint64_t v66 = &v69;
  id v67 = a1;
  id v48 = v45;
  id v55 = v48;
  id v29 = v19;
  id v56 = v29;
  id v46 = v20;
  id v57 = v46;
  id v42 = v21;
  id v58 = v42;
  id v41 = v22;
  id v59 = v41;
  id v44 = v43;
  id v60 = v44;
  id v30 = v23;
  id v61 = v30;
  id v31 = v24;
  id v62 = v31;
  id v32 = v25;
  id v63 = v32;
  id v33 = v26;
  id v64 = v33;
  id v34 = v27;
  id v65 = v34;
  BOOL v68 = a14;
  dispatch_block_t v35 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v49 = v28;
  dispatch_async(v28, v35);
  if ([MEMORY[0x1E4F93B18] waitForBlock:v35 timeoutSeconds:0.25] == 1)
  {
    uint64_t v36 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v36, OS_LOG_TYPE_ERROR, "SGMIOmissionAnalyzer: Mail Intelligence's SPI back end timed out", buf, 2u);
    }

    if (identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken4 != -1) {
      dispatch_once(&identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasOnceToken4, &__block_literal_global_12_35322);
    }
    id v37 = (id)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_9;
    uint64_t v38 = (void *)MEMORY[0x1E4F93B18];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2;
    v50[3] = &unk_1E65C0440;
    id v52 = v35;
    id v51 = v29;
    objc_msgSend(v38, "runAsyncOnQueue:afterDelaySeconds:block:", v37, v50, 5.0, v41, v42, v44, v46, v48, v28);

    id v39 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v39 = (id)v70[5];
  }

  _Block_object_dispose(&v69, 8);
  return v39;
}

uint64_t __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_7(uint64_t a1)
{
  LOBYTE(v3) = *(unsigned char *)(a1 + 136);
  *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) = [*(id *)(a1 + 128) _identifyComposeWarningsFromSubject:*(void *)(a1 + 32) content:*(void *)(a1 + 40) attributes:*(void *)(a1 + 48) toRecipients:*(void *)(a1 + 56) ccRecipients:*(void *)(a1 + 64) bccRecipients:*(void *)(a1 + 72) originalToRecipients:*(void *)(a1 + 80) originalCcRecipients:*(void *)(a1 + 88) attachments:*(void *)(a1 + 96) language:*(void *)(a1 + 104) store:*(void *)(a1 + 112) disableConservativeCheckRequirement:v3];
  return MEMORY[0x1F41817F8]();
}

uint64_t __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = [MEMORY[0x1E4F93B18] waitForBlock:*(void *)(a1 + 40) timeoutSeconds:0.0];
  if (result == 1)
  {
    uint64_t v3 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) length];
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_fault_impl(&dword_1CA650000, v3, OS_LOG_TYPE_FAULT, "SGMIOmissionAnalyzer: Mail Intelligence's SPI back took over 5 seconds on a %tu-lengthed content: we have to xpc_transaction_exit_clean", (uint8_t *)&v5, 0xCu);
    }

    return xpc_transaction_exit_clean();
  }
  return result;
}

void __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke_10()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  dispatch_queue_t v1 = dispatch_queue_create("SGMIOmissionAnalyzer-timeout", 0);
  id v2 = (void *)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_9;
  identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult_9 = (uint64_t)v1;
}

void __223__SGMIOmissionAnalyzer_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  dispatch_queue_t v1 = dispatch_queue_create("SGMIOmissionAnalyzer-processing", 0);
  id v2 = (void *)identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult;
  identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_language_store_disableConservativeCheckRequirement___pasExprOnceResult = (uint64_t)v1;
}

+ (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = +[SGSqlEntityStore defaultStore];
  LOBYTE(v28) = 0;
  id v29 = +[SGMIOmissionAnalyzer identifyComposeWarningsFromSubject:v25 content:v24 attributes:v23 toRecipients:v22 ccRecipients:v21 bccRecipients:v20 originalToRecipients:v19 originalCcRecipients:v18 attachments:v17 language:0 store:v26 disableConservativeCheckRequirement:v28];

  return v29;
}

@end