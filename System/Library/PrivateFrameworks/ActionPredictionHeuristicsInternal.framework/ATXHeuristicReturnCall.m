@interface ATXHeuristicReturnCall
- (id)_actionWithCall:(id)a3 contactDict:(id)a4 contactId:(id)a5 handle:(id)a6 service:(id)a7;
- (id)_bestContactHandleFromDataSourceWithContact:(id)a3 service:(id)a4 environment:(id)a5;
- (id)_contactsDataSourceWithIdentifiers:(id)a3 environment:(id)a4;
- (id)_duetInteractionCountFromDataSourceWithHandles:(id)a3 date:(id)a4 environment:(id)a5;
- (id)_interactionCountAfterCall:(id)a3 contactDict:(id)a4 environment:(id)a5;
- (id)_serviceWithCall:(id)a3;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (void)_addActionWithContactId:(id)a3 toActions:(id)a4 environment:(id)a5 lastCallDict:(id)a6;
@end

@implementation ATXHeuristicReturnCall

- (id)permanentRefreshTriggers
{
  v2 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"com.apple.CallHistoryPluginHelper.launchnotification" type:1];
  v3 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForActiveCall];
  v5 = [(ATXInformationHeuristicRefreshContextChangeTrigger *)v3 initWithCDContextualKeyPath:v4];

  v6 = (void *)MEMORY[0x1D25F43D0]();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, v5, 0);

  return v7;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [ATXCallHistoryDataSource alloc];
  v39 = v3;
  v5 = [v3 heuristicDevice];
  v6 = [(ATXCallHistoryDataSource *)v4 initWithDevice:v5];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__15;
  v53 = __Block_byref_object_dispose__15;
  id v54 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke;
  v48[3] = &unk_1E68A5648;
  v48[4] = &v49;
  v36 = v6;
  [(ATXCallHistoryDataSource *)v6 callNewerThan:1 showIncoming:1 showOutgoing:0 missedOnly:v48 callback:3600.0];
  v7 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(id)v50[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v57 = v8;
    _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment %lu calls", buf, 0xCu);
  }

  v9 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)v50[5];
  uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v14 = [v13 objectForKeyedSubscript:@"contactIdentifier"];
        if (v14)
        {
          v15 = [v9 objectForKeyedSubscript:v14];
          v16 = v15;
          if (v15)
          {
            v17 = [v15 objectForKeyedSubscript:@"date"];
            v18 = [v13 objectForKeyedSubscript:@"date"];
            v19 = v18;
            if (v18) {
              BOOL v20 = v17 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (!v20)
            {
              [v18 doubleValue];
              double v22 = v21;
              [v17 doubleValue];
              if (v22 > v23) {
                [v9 setValue:v13 forKey:v14];
              }
            }
            v24 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = (uint64_t)v14;
              __int16 v58 = 2112;
              v59 = v19;
              _os_log_impl(&dword_1D0F43000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@, callDate:%@", buf, 0x16u);
            }
          }
          else
          {
            [v9 setValue:v13 forKey:v14];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v10);
  }

  v25 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v9;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v26);
        }
        [(ATXHeuristicReturnCall *)self _addActionWithContactId:*(void *)(*((void *)&v40 + 1) + 8 * j) toActions:v25 environment:v39 lastCallDict:v26];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v55 count:16];
    }
    while (v27);
  }

  v30 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v25 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v57 = v31;
    _os_log_impl(&dword_1D0F43000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment %lu actions", buf, 0xCu);
  }

  v32 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  v33 = objc_opt_new();
  v34 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v32 additionalRefreshTriggers:v33];

  _Block_object_dispose(&v49, 8);

  return v34;
}

void __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
}

id __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke_29(uint64_t a1, uint64_t a2)
{
  return +[ATXContextHeuristicSuggestionProducer suggestionWithAction:a2 predictionReasons:0x40000000 localizedReason:0 score:0 dateInterval:70.0];
}

- (void)_addActionWithContactId:(id)a3 toActions:(id)a4 environment:(id)a5 lastCallDict:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a6 objectForKeyedSubscript:v10];
  v14 = [v13 objectForKeyedSubscript:@"missed"];
  if ([v14 BOOLValue])
  {
    v15 = [v13 objectForKeyedSubscript:@"remoteParticipantHandles"];
    if ([v15 count] == 1)
    {
      v16 = [v15 firstObject];
      v17 = [v16 objectForKeyedSubscript:@"value"];

      v18 = [(ATXHeuristicReturnCall *)self _serviceWithCall:v13];
      if ([v18 length])
      {
        v24 = v18;
        id v25 = v10;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        BOOL v20 = [(ATXHeuristicReturnCall *)self _contactsDataSourceWithIdentifiers:v19 environment:v12];

        if ([v20 count] == 1)
        {
          double v21 = [v20 firstObject];
          double v23 = [(ATXHeuristicReturnCall *)self _interactionCountAfterCall:v13 contactDict:v21 environment:v12];
          if ([v23 integerValue] < 1)
          {
            double v22 = [(ATXHeuristicReturnCall *)self _actionWithCall:v13 contactDict:v21 contactId:v10 handle:v17 service:v24];
            if (v22) {
              [v11 addObject:v22];
            }
          }
          else
          {
            double v22 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v23;
              _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Skipping contact that has already been interacted with %@ times after the missed call", buf, 0xCu);
            }
          }
        }
        else
        {
          double v21 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v10;
            _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ Could not find exactly 1 CNContact for identifier", buf, 0xCu);
          }
        }

        v18 = v24;
      }
    }
    else
    {
      v17 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ Cannot find exactly 1 remote participant handle", buf, 0xCu);
      }
    }
  }
  else
  {
    v15 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ last call was not missed. Skipping", buf, 0xCu);
    }
  }
}

- (id)_serviceWithCall:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"serviceProvider"];
  v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"com.apple.Telephony"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"com.apple.FaceTime"])
    {
      v5 = @"facetime";
      goto LABEL_10;
    }
    v6 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing action since third party calls are not supported", v8, 2u);
    }

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = @"phone";
LABEL_10:

  return v5;
}

- (id)_duetInteractionCountFromDataSourceWithHandles:(id)a3 date:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = [ATXDuetInteractionDataSource alloc];
    id v11 = [v9 heuristicDevice];
    id v12 = [(ATXDuetInteractionDataSource *)v10 initWithDevice:v11];

    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__15;
    uint64_t v28 = __Block_byref_object_dispose__15;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    double v21 = __Block_byref_object_copy__15;
    double v22 = __Block_byref_object_dispose__15;
    id v23 = 0;
    v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__ATXHeuristicReturnCall__duetInteractionCountFromDataSourceWithHandles_date_environment___block_invoke;
    v17[3] = &unk_1E68A4F40;
    v17[4] = &v24;
    v17[5] = &v18;
    [(ATXDuetInteractionDataSource *)v12 duetInteractionCountForHandles:v13 sinceDate:v8 callback:v17];

    if (v19[5])
    {
      v14 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicReturnCall _duetInteractionCountFromDataSourceWithHandles:date:environment:]();
      }

      id v15 = 0;
    }
    else
    {
      id v15 = (id)v25[5];
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __90__ATXHeuristicReturnCall__duetInteractionCountFromDataSourceWithHandles_date_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_contactsDataSourceWithIdentifiers:(id)a3 environment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [ATXContactsDataSource alloc];
  id v8 = [v6 heuristicDevice];
  uint64_t v9 = [(ATXContactsDataSource *)v7 initWithDevice:v8];

  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__15;
  uint64_t v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ATXHeuristicReturnCall__contactsDataSourceWithIdentifiers_environment___block_invoke;
  v13[3] = &unk_1E68A4F18;
  v13[4] = &v20;
  v13[5] = &v14;
  [(ATXContactsDataSource *)v9 contactsWithIdentifiers:v5 callback:v13];
  if (v15[5])
  {
    id v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicReturnCall _contactsDataSourceWithIdentifiers:environment:]();
    }

    id v11 = 0;
  }
  else
  {
    id v11 = (id)v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __73__ATXHeuristicReturnCall__contactsDataSourceWithIdentifiers_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_interactionCountAfterCall:(id)a3 contactDict:(id)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 objectForKeyedSubscript:@"CNContact"];
  id v11 = [(ATXHeuristicReturnCall *)self _bestContactHandleFromDataSourceWithContact:v10 service:*MEMORY[0x1E4F6AA50] environment:v9];
  id v12 = [(ATXHeuristicReturnCall *)self _bestContactHandleFromDataSourceWithContact:v10 service:*MEMORY[0x1E4F6AA48] environment:v9];
  v13 = [(ATXHeuristicReturnCall *)self _bestContactHandleFromDataSourceWithContact:v10 service:*MEMORY[0x1E4F6AA78] environment:v9];
  uint64_t v14 = objc_opt_new();
  id v15 = v14;
  if (v11) {
    [v14 addObject:v11];
  }
  if (v12) {
    [v15 addObject:v12];
  }
  if (v13) {
    [v15 addObject:v13];
  }
  uint64_t v16 = [v8 objectForKeyedSubscript:@"date"];
  v17 = (void *)MEMORY[0x1E4F1C9C8];
  [v16 doubleValue];
  id v19 = [v17 dateWithTimeIntervalSinceReferenceDate:v18 + 1.0];
  uint64_t v20 = [(ATXHeuristicReturnCall *)self _duetInteractionCountFromDataSourceWithHandles:v15 date:v19 environment:v9];

  return v20;
}

- (id)_bestContactHandleFromDataSourceWithContact:(id)a3 service:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && v8)
  {
    id v10 = [ATXBestContactHandleForServiceDataSource alloc];
    id v11 = [v9 heuristicDevice];
    id v12 = [(ATXBestContactHandleForServiceDataSource *)v10 initWithDevice:v11];

    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__15;
    id v27 = __Block_byref_object_dispose__15;
    id v28 = 0;
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__15;
    double v21 = __Block_byref_object_dispose__15;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__ATXHeuristicReturnCall__bestContactHandleFromDataSourceWithContact_service_environment___block_invoke;
    v16[3] = &unk_1E68A5440;
    v16[4] = &v23;
    v16[5] = &v17;
    [v12 bestHandleForContact:v7 service:v8 callback:v16];
    if (v18[5])
    {
      v13 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:]();
      }

      id v14 = 0;
    }
    else
    {
      id v14 = (id)v24[5];
    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:]((uint64_t)v7, (uint64_t)v8, v12);
    }
    id v14 = 0;
  }

  return v14;
}

void __90__ATXHeuristicReturnCall__bestContactHandleFromDataSourceWithContact_service_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_actionWithCall:(id)a3 contactDict:(id)a4 contactId:(id)a5 handle:(id)a6 service:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x1E4F28B50];
  id v16 = a4;
  uint64_t v17 = [v15 bundleForClass:objc_opt_class()];
  double v18 = [v16 objectForKeyedSubscript:@"displayName"];

  if ([v18 length])
  {
    id v44 = v12;
    uint64_t v19 = NSString;
    [v17 localizedStringForKey:@"RETURN_CALL_TITLE" value:&stru_1F2719D20 table:0];
    uint64_t v20 = v46 = v11;
    long long v43 = v18;
    double v21 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v18);

    id v22 = [v46 objectForKeyedSubscript:@"date"];
    uint64_t v23 = (void *)MEMORY[0x1E4F1C9C8];
    long long v42 = v22;
    [v22 doubleValue];
    uint64_t v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v25 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v24 dateStyle:0 timeStyle:1];
    BOOL v26 = +[ATXHeuristicEventUtilities isEventAtOneWithDate:v24];
    id v27 = NSString;
    if (v26) {
      id v28 = @"RETURN_CALL_SUBTITLE_(hour is 1)";
    }
    else {
      id v28 = @"RETURN_CALL_SUBTITLE";
    }
    long long v45 = v17;
    id v29 = [v17 localizedStringForKey:v28 value:&stru_1F2719D20 table:0];
    long long v41 = (void *)v25;
    uint64_t v30 = objc_msgSend(v27, "localizedStringWithFormat:", v29, v25);

    uint64_t v31 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413059;
      id v48 = v13;
      __int16 v49 = 2112;
      id v50 = v14;
      __int16 v51 = 2117;
      v52 = v21;
      __int16 v53 = 2112;
      uint64_t v54 = v30;
      _os_log_impl(&dword_1D0F43000, v31, OS_LOG_TYPE_DEFAULT, "Action with handle %@ service %@ title %{sensitive}@, subtitle %@", buf, 0x2Au);
    }

    v32 = (void *)MEMORY[0x1E4F4AE38];
    v33 = [v46 objectForKeyedSubscript:@"mediaType"];
    v34 = objc_msgSend(v32, "atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:", v21, v30, v43, v13, v14, v44, 0, @"returnCall", v33);

    v35 = [v24 dateByAddingTimeInterval:120.0];
    v36 = [v35 dateByAddingTimeInterval:1800.0];
    v37 = v24;
    v38 = (void *)v30;
    v39 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v35 endDate:v36 lockScreenEligible:0 predicate:0];
    [v34 setCriteria:v39];

    id v12 = v44;
    id v11 = v46;

    uint64_t v17 = v45;
    double v18 = v43;
  }
  else
  {
    double v21 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall _actionWithCall null recipient name dropping action", buf, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (void)_duetInteractionCountFromDataSourceWithHandles:date:environment:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2(&dword_1D0F43000, v0, v1, "_duetInteractionCountFromDataSourceWithHandles error querying data source %@: %@");
}

- (void)_contactsDataSourceWithIdentifiers:environment:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2(&dword_1D0F43000, v0, v1, "_contactsDataSourceWithIdentifiers error querying contacts data source %@: %@");
}

- (void)_bestContactHandleFromDataSourceWithContact:service:environment:.cold.1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2(&dword_1D0F43000, v0, v1, "_bestContactHandleFromDataSourceWithContact Error querying data source %@: %@");
}

- (void)_bestContactHandleFromDataSourceWithContact:(uint64_t)a1 service:(uint64_t)a2 environment:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_1D0F43000, a2, a3, "Contact %@ or service %@ from is invalid", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end