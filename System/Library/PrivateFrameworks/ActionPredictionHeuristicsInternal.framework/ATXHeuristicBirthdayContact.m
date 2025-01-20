@interface ATXHeuristicBirthdayContact
- (id)_spotlightActionWithName:(id)a3 email:(id)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 subtitle:(id)a8;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicBirthdayContact

- (id)permanentRefreshTriggers
{
  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v2 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v4 = (void *)MEMORY[0x1D25F43D0]();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, 0);

  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [ATXBirthdaysDataSource alloc];
  v35 = v3;
  v5 = [v3 heuristicDevice];
  v6 = [(ATXBirthdaysDataSource *)v4 initWithDevice:v5];

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  id v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__3;
  v52[4] = __Block_byref_object_dispose__3;
  id v53 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __62__ATXHeuristicBirthdayContact_heuristicResultWithEnvironment___block_invoke;
  v51[3] = &unk_1E68A4F18;
  v51[4] = &v54;
  v51[5] = v52;
  [(ATXBirthdaysDataSource *)v6 birthdaysWithCallback:v51];
  v7 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(id)v55[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v63 = v8;
    _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicBirthdayContact: heuristicResultWithEnvironment %lu birthdays", buf, 0xCu);
  }
  v34 = v6;

  v36 = objc_opt_new();
  v40 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = (id)v55[5];
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v9)
  {
    uint64_t v39 = *(void *)v48;
    do
    {
      uint64_t v41 = v9;
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v12 = [v11 objectForKeyedSubscript:@"birthdayContact"];
        v13 = [v11 objectForKeyedSubscript:@"EKEvent"];
        v42 = [v12 objectForKeyedSubscript:@"emailAddresses"];
        v14 = [v13 obj];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v16 = [v13 obj];
          v17 = [v12 objectForKeyedSubscript:@"fullName"];
          v18 = [v42 firstObject];
          v19 = [v12 objectForKeyedSubscript:@"identifier"];
          v20 = [v16 startDate];
          v21 = [v16 endDate];
          v22 = [(ATXHeuristicBirthdayContact *)self _spotlightActionWithName:v17 email:v18 identifier:v19 startDate:v20 endDate:v21 subtitle:0];

          if (v22) {
            [v36 addObject:v22];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v9);
  }

  v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"CONTEXT_TITLE_BIRTHDAYS" value:&stru_1F2719D20 table:0];
  if ([v36 count] == 1)
  {
    uint64_t v25 = [v23 localizedStringForKey:@"CONTEXT_TITLE_BIRTHDAY" value:&stru_1F2719D20 table:0];

    v24 = (void *)v25;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v36;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:*(void *)(*((void *)&v43 + 1) + 8 * j) predictionReasons:0x20000000 localizedReason:v24 score:0 dateInterval:40.0];
        [v40 addObject:v30];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v27);
  }

  v31 = objc_opt_new();
  v32 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v40 additionalRefreshTriggers:v31];

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);

  return v32;
}

void __62__ATXHeuristicBirthdayContact_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_spotlightActionWithName:(id)a3 email:(id)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 subtitle:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138740995;
    id v25 = v13;
    __int16 v26 = 2117;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2117;
    id v31 = v16;
    __int16 v32 = 2117;
    id v33 = v17;
    _os_log_impl(&dword_1D0F43000, v19, OS_LOG_TYPE_DEFAULT, "ATXHeuristicBirthdayContact: _spotlightActionWithName name %{sensitive}@, email %{sensitive}@, identifier %@, startDate %{sensitive}@, endDate %{sensitive}@", (uint8_t *)&v24, 0x34u);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v16 endDate:v17 lockScreenEligible:0 predicate:0];
  if (v13 && v15)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithContactName:v13 contactIdentifier:v15 subtitle:v18 criteria:v20];
    goto LABEL_14;
  }
  if (v13 && v14)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithContactName:v13 contactEmail:v14 subtitle:v18 criteria:v20];
    if (v21) {
      goto LABEL_14;
    }
    v22 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Updated api to create participant using email not available", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    v22 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicBirthdayContact _spotlightActionWithName:email:identifier:startDate:endDate:subtitle:](v22);
    }
  }

  v21 = 0;
LABEL_14:

  return v21;
}

- (void)_spotlightActionWithName:(os_log_t)log email:identifier:startDate:endDate:subtitle:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "participant not found", v1, 2u);
}

@end