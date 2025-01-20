@interface MapsSuggestionsBiome
- (BOOL)_shouldAllowEventType:(int)a3;
- (BOOL)entriesFromFindMyWithCompletionHandler:(id)a3;
- (BOOL)entriesFromSmartRepliesWithCompletionHandler:(id)a3;
- (NSString)uniqueName;
- (id)_entriesFromFindMy:(id)a3;
- (id)_entriesFromSmartReplies:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (void)dealloc;
- (void)registerForUpdatesWithHandler:(id)a3;
@end

@implementation MapsSuggestionsBiome

void __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if ([v6 count])
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [v6 firstObject];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v11 = WeakRetained[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke_201;
      block[3] = &unk_1E5CB8930;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      dispatch_async(v11, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "MapsSuggestionsBiome.m";
        __int16 v19 = 1026;
        int v20 = 452;
        __int16 v21 = 2082;
        v22 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      v9 = 0;
    }
  }
}

void __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if ([v6 count])
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [v6 firstObject];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v11 = WeakRetained[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke_196;
      block[3] = &unk_1E5CB8930;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      dispatch_async(v11, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "MapsSuggestionsBiome.m";
        __int16 v19 = 1026;
        int v20 = 427;
        __int16 v21 = 2082;
        v22 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      v9 = 0;
    }
  }
}

void __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke_196(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"eventTimestampBegin" ascending:1];
    v31 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v6 = [v3 sortedArrayUsingDescriptors:v5];

    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      log = v7;
      id v26 = WeakRetained;
      v25 = v6;
      id v8 = v6;
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = [NSString alloc];
              [v15 actionType];
              v17 = BMFindMyContactActivityEventTypeAsString();
              v18 = [v15 handle];
              __int16 v19 = [v15 eventTimestampBegin];
              int v20 = (void *)[v16 initWithFormat:@"FindMy event ~%@~ occured with %@ at %@", v17, v18, v19];
              [v9 addObject:v20];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:buf count:16];
        }
        while (v12);
      }

      __int16 v21 = (char *)[v9 copy];
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      v7 = log;
      _os_log_impl(&dword_1A70DF000, log, OS_LOG_TYPE_DEBUG, "Received a Stream from FindMy: %@", buf, 0xCu);

      id WeakRetained = v26;
      v6 = v25;
    }

    v22 = [WeakRetained _entriesFromFindMy:v6];
    if (!v22)
    {
      uint64_t v23 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "Received a Stream from FindMy but could not make any viable entries out of it", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v33 = "MapsSuggestionsBiome.m";
      __int16 v34 = 1026;
      int v35 = 429;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v6 = v22;
  }
}

void __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke_201(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(v1 + 32);
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"predictionTimestamp" ascending:1];
    v41 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    v6 = [v3 sortedArrayUsingDescriptors:v5];

    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      log = v7;
      uint64_t v33 = v1;
      id v34 = WeakRetained;
      v32 = v6;
      id v8 = v6;
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:buf count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v38;
        int v35 = v9;
        uint64_t v36 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v38 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = [v15 contactInformation];
              v17 = [v16 friendlyName];
              v18 = v17;
              if (v17)
              {
                id v19 = v17;
              }
              else
              {
                id v20 = v10;
                __int16 v21 = [v16 emailAddress];
                v22 = [v21 componentsJoinedByString:@", "];
                uint64_t v23 = v22;
                if (v22)
                {
                  id v19 = v22;
                }
                else
                {
                  v24 = [v16 phoneNumber];
                  id v19 = [v24 componentsJoinedByString:@", "];

                  v9 = v35;
                }

                id v10 = v20;
                uint64_t v13 = v36;
              }

              id v25 = [NSString alloc];
              id v26 = [v15 predictionTimestamp];
              long long v27 = (void *)[v25 initWithFormat:@"Messages event occured with %@ at %@", v19, v26];
              [v9 addObject:v27];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:buf count:16];
        }
        while (v12);
      }

      long long v28 = (char *)[v9 copy];
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      v7 = log;
      _os_log_impl(&dword_1A70DF000, log, OS_LOG_TYPE_DEBUG, "Received a Stream from SmartReplies: %@", buf, 0xCu);

      uint64_t v1 = v33;
      id WeakRetained = v34;
      v6 = v32;
    }

    long long v29 = [WeakRetained _entriesFromSmartReplies:v6];
    if (!v29)
    {
      long long v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_ERROR, "Received a Stream from SmartReplies but could not make any viable entries out of it", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    long long v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v43 = "MapsSuggestionsBiome.m";
      __int16 v44 = 1026;
      int v45 = 454;
      __int16 v46 = 2082;
      v47 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v6 = v29;
  }
}

- (id)_entriesFromSmartReplies:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 count])
  {
    if (GEOConfigGetBOOL())
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v62 = v4;
      obuint64_t j = v4;
      uint64_t v5 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
      if (!v5)
      {
        v7 = 0;
        goto LABEL_60;
      }
      uint64_t v6 = v5;
      v7 = 0;
      uint64_t v8 = *(void *)v83;
      uint64_t v64 = *(void *)v83;
      while (1)
      {
        uint64_t v9 = 0;
        uint64_t v67 = v6;
        do
        {
          if (*(void *)v83 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v82 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_52;
          }
          uint64_t v11 = [v10 contactInformation];
          if (!v11) {
            goto LABEL_51;
          }
          v69 = v10;
          uint64_t v71 = v9;
          v72 = v7;
          id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
          uint64_t v13 = [v11 phoneNumber];
          id v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v73 = v11;
          id v15 = [v11 phoneNumber];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v78 objects:v89 count:16];
          if (!v16) {
            goto LABEL_22;
          }
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v79 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(id *)(*((void *)&v78 + 1) + 8 * i);
              __int16 v21 = v20;
              if (v20 && [v20 length])
              {
                v22 = objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_1EFC640F8;

                uint64_t v23 = objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_1EFC640F8);

                v24 = [v23 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EFC640F8];

                __int16 v21 = [v24 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EFC640F8];

                if (!v21) {
                  continue;
                }
                [v14 addObject:v21];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v78 objects:v89 count:16];
          }
          while (v17);
LABEL_22:

          id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v26 = [v73 emailAddress];
          long long v27 = objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));

          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v28 = [v73 emailAddress];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v74 objects:v88 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v75;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v75 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = *(id *)(*((void *)&v74 + 1) + 8 * j);
                if ([v33 containsString:@"@"]
                  && ([v33 containsString:@"."] & 1) != 0)
                {

                  [v27 addObject:v33];
                }
                else
                {
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v74 objects:v88 count:16];
            }
            while (v30);
          }

          if ([v14 count] || objc_msgSend(v27, "count"))
          {
            uint64_t v11 = v73;
            id v34 = [v73 identifier];

            if (v34)
            {
              int v35 = [v69 predictionTimestamp];
              uint64_t v36 = [v35 dateByAddingTimeInterval:v63->_expirationDuration];

              long long v37 = [v69 predictionExpiration];
              if (v37)
              {
                long long v38 = [v69 predictionExpiration];
                id v39 = [v38 earlierDate:v36];
              }
              else
              {
                id v39 = v36;
              }

              long long v40 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                v41 = [v73 phoneNumber];
                *(_DWORD *)buf = 138412290;
                v87 = v41;
                _os_log_impl(&dword_1A70DF000, v40, OS_LOG_TYPE_DEBUG, "All Phone Numbers: %@", buf, 0xCu);
              }
              v66 = v36;

              v42 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                v43 = [v73 emailAddress];
                *(_DWORD *)buf = 138412290;
                v87 = v43;
                _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_DEBUG, "All Email Addresses: %@", buf, 0xCu);
              }
              __int16 v44 = [MapsSuggestionsEntry alloc];
              GEOConfigGetDouble();
              int v45 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v44, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 24, @"Contact Activity", @"From Biome/SmartReplies", v39, 0, 0);
              __int16 v46 = [v73 fullDisplayName];
              [(MapsSuggestionsEntry *)v45 setString:v46 forKey:@"MapsSuggestionsContactDisplayNameKey"];

              v47 = [v73 identifier];
              [(MapsSuggestionsEntry *)v45 setString:v47 forKey:@"MapsSuggestionsContactActivityPK"];

              [(MapsSuggestionsEntry *)v45 setString:@"MapsSuggestionsContactActivityPK" forKey:@"MapsSuggestionsPrimaryKey"];
              uint64_t v48 = [v69 bundleID];
              [(MapsSuggestionsEntry *)v45 setString:v48 forKey:@"MapsSuggestionsOriginBundleIDKey"];

              v49 = (void *)[v27 copy];
              [(MapsSuggestionsEntry *)v45 setArray:v49 forKey:@"MapsSuggestionsContactAllEmailAddressesKey"];

              v50 = (void *)[v14 copy];
              [(MapsSuggestionsEntry *)v45 setArray:v50 forKey:@"MapsSuggestionsContactAllPhoneNumbersKey"];

              [(MapsSuggestionsEntry *)v45 setNumber:&unk_1EFC897B0 forKey:@"MapsSuggestionsContactActivityKey"];
              [(MapsSuggestionsEntry *)v45 setString:@"Messages" forKey:@"MapsSuggestionsOriginatingAppName"];
              id v51 = objc_alloc(MEMORY[0x1E4F1CA80]);
              v52 = objc_msgSend(v51, "initWithObjects:", MapsSuggestionsFindMyAppBundleID, 0);
              v53 = [v69 bundleID];

              if (v53)
              {
                v54 = [v69 bundleID];
                [v52 addObject:v54];
              }
              v70 = v39;
              v55 = (void *)[v52 copy];
              [(MapsSuggestionsEntry *)v45 setSet:v55 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];

              v56 = v72;
              v65 = v52;
              if (!v72) {
                v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(obj, "count"));
              }
              v57 = [v73 identifier];
              v58 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v57, @"BMMapsRecentConversationsIntentActionTypeMeetup"];

              [v56 setObject:v45 forKeyedSubscript:v58];
              uint64_t v11 = v73;
              v7 = v56;
            }
            else
            {
              v7 = v72;
            }
          }
          else
          {
            v7 = v72;
            uint64_t v11 = v73;
          }

          uint64_t v6 = v67;
          uint64_t v8 = v64;
          uint64_t v9 = v71;
LABEL_51:

LABEL_52:
          ++v9;
        }
        while (v9 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (!v6)
        {
LABEL_60:

          v60 = [v7 allValues];
          v59 = (void *)[v60 copy];

          id v4 = v62;
          goto LABEL_61;
        }
      }
    }
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Not processing DirectionsSuggestionsFromSmartReplies because the switch is off", buf, 2u);
    }
    v59 = 0;
LABEL_61:
  }
  else
  {
    v59 = 0;
  }

  return v59;
}

- (id)_entriesFromFindMy:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![v4 count])
  {
    v54 = 0;
    goto LABEL_49;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v66 objects:v74 count:16];
  id v57 = v4;
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_48;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v67;
  v58 = self;
  v59 = v5;
  uint64_t v63 = *(void *)v67;
  do
  {
    uint64_t v10 = 0;
    uint64_t v64 = v7;
    do
    {
      if (*(void *)v67 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v66 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 handle];
        if (v12)
        {
          if (-[MapsSuggestionsBiome _shouldAllowEventType:](self, "_shouldAllowEventType:", [v11 actionType]))
          {
            uint64_t v13 = [v11 eventTimestampBegin];
            id v14 = [v13 dateByAddingTimeInterval:self->_expirationDuration];

            id v15 = [v11 eventTimestampBegin];
            GEOConfigGetDouble();
            v65 = objc_msgSend(v15, "dateByAddingTimeInterval:");

            uint64_t v16 = [v11 eventTimestampEnd];
            if (v16)
            {
              uint64_t v17 = [v11 eventTimestampEnd];
              uint64_t v18 = [v17 earlierDate:v14];
            }
            else
            {
              uint64_t v18 = v14;
            }

            int v20 = [v11 actionType];
            if (v20 == 1)
            {
              uint64_t v25 = 1;
              goto LABEL_24;
            }
            uint64_t v9 = v63;
            uint64_t v7 = v64;
            if (v20 == 3)
            {

              uint64_t v18 = 0;
              uint64_t v62 = 3;
              goto LABEL_25;
            }
            if (v20 == 2)
            {
              __int16 v21 = [v11 eventTimestampEnd];
              if (v21)
              {
                [v11 eventTimestampEnd];
                uint64_t v23 = v22 = v8;
                v24 = [v23 earlierDate:v65];

                uint64_t v18 = v23;
                uint64_t v8 = v22;
                self = v58;
              }
              else
              {
                v24 = v65;
              }

              uint64_t v18 = v24;
              uint64_t v25 = 2;
LABEL_24:
              uint64_t v62 = v25;
              uint64_t v9 = v63;
              uint64_t v7 = v64;
              if (!MapsSuggestionsIsInThePast(v18))
              {
LABEL_25:
                id v26 = [MapsSuggestionsEntry alloc];
                GEOConfigGetDouble();
                v60 = v18;
                long long v27 = -[MapsSuggestionsEntry initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:](v26, "initWithType:title:subtitle:weight:expires:geoMapItem:sourceSpecificInfo:", 24, @"Contact Activity", @"From Biome/FindMy", v18, 0, 0);
                [(MapsSuggestionsEntry *)v27 setString:v12 forKey:@"MapsSuggestionsContactActivityPK"];
                [(MapsSuggestionsEntry *)v27 setString:@"MapsSuggestionsContactActivityPK" forKey:@"MapsSuggestionsPrimaryKey"];
                long long v28 = [v11 bundleID];
                [(MapsSuggestionsEntry *)v27 setString:v28 forKey:@"MapsSuggestionsOriginBundleIDKey"];

                id v29 = v12;
                if ([v29 containsString:@"@"]
                  && ([v29 containsString:@"."] & 1) != 0)
                {

                  id v71 = v29;
                  [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
                  v31 = uint64_t v30 = v8;
                  [(MapsSuggestionsEntry *)v27 setArray:v31 forKey:@"MapsSuggestionsContactAllEmailAddressesKey"];

                  uint64_t v8 = v30;
                }
                else
                {

                  [(MapsSuggestionsEntry *)v27 setArray:0 forKey:@"MapsSuggestionsContactAllEmailAddressesKey"];
                }
                v61 = v8;
                id v32 = v29;
                if ([v32 length])
                {
                  id v33 = objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_1EFC640F8;

                  id v34 = objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_1EFC640F8);

                  int v35 = [v34 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EFC640F8];

                  uint64_t v36 = [v35 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EFC640F8];

                  id v37 = v36;
                  long long v38 = v37;
                }
                else
                {
                  id v37 = 0;
                  long long v38 = v32;
                }

                id v39 = [v37 stringByReplacingOccurrencesOfString:@"+" withString:&stru_1EFC640F8];

                long long v40 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
                v41 = [v40 invertedSet];
                uint64_t v42 = [v39 rangeOfCharacterFromSet:v41];

                if (v42 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  id v70 = v32;
                  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
                  [(MapsSuggestionsEntry *)v27 setArray:v43 forKey:@"MapsSuggestionsContactAllPhoneNumbersKey"];
                }
                else
                {
                  [(MapsSuggestionsEntry *)v27 setArray:0 forKey:@"MapsSuggestionsContactAllPhoneNumbersKey"];
                }
                uint64_t v8 = v61;
                __int16 v44 = [NSNumber numberWithInteger:v62];
                [(MapsSuggestionsEntry *)v27 setNumber:v44 forKey:@"MapsSuggestionsContactActivityKey"];

                [(MapsSuggestionsEntry *)v27 setString:@"FindMy" forKey:@"MapsSuggestionsOriginatingAppName"];
                id v45 = objc_alloc(MEMORY[0x1E4F1CA80]);
                __int16 v46 = objc_msgSend(v45, "initWithObjects:", MapsSuggestionsFindMyAppBundleID, 0);
                v47 = [v11 bundleID];

                if (v47)
                {
                  uint64_t v48 = [v11 bundleID];
                  [v46 addObject:v48];
                }
                v49 = (void *)[v46 copy];
                [(MapsSuggestionsEntry *)v27 setSet:v49 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];

                if (!v61) {
                  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v59, "count"));
                }
                [v11 actionType];
                v50 = BMFindMyContactActivityEventTypeAsString();
                id v51 = (objc_class *)NSString;
                id v52 = v32;
                v53 = (void *)[[v51 alloc] initWithFormat:@"%@_%@", v52, v50];

                [v8 setObject:v27 forKey:v53];
                self = v58;
                id v5 = v59;
                uint64_t v9 = v63;
                uint64_t v7 = v64;
                uint64_t v18 = v60;
              }
            }
          }
          else
          {
            id v14 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              [v11 actionType];
              id v19 = BMFindMyContactActivityEventTypeAsString();
              *(_DWORD *)buf = 138412290;
              v73 = v19;
              _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "Not processing %@ because the switch is off", buf, 0xCu);
            }
          }
        }
      }
      ++v10;
    }
    while (v7 != v10);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v66 objects:v74 count:16];
  }
  while (v7);
LABEL_48:

  v55 = [v8 allValues];
  v54 = (void *)[v55 copy];

  id v4 = v57;
LABEL_49:

  return v54;
}

- (BOOL)entriesFromSmartRepliesWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__MapsSuggestionsBiome_entriesFromSmartRepliesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5CB8958;
    id v10 = v4;
    objc_copyWeak(&v11, (id *)location);
    char v6 = [(MapsSuggestionsBiomeConnector *)connector getSmartRepliesStreamsWithHandler:v9];
    objc_destroyWeak(&v11);

    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      __int16 v13 = 1024;
      int v14 = 446;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsBiome entriesFromSmartRepliesWithCompletionHandler:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)entriesFromFindMyWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    connector = self->_connector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MapsSuggestionsBiome_entriesFromFindMyWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5CB8958;
    id v10 = v4;
    objc_copyWeak(&v11, (id *)location);
    char v6 = [(MapsSuggestionsBiomeConnector *)connector getFindMyStreamsWithHandler:v9];
    objc_destroyWeak(&v11);

    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      __int16 v13 = 1024;
      int v14 = 421;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsBiome entriesFromFindMyWithCompletionHandler:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Handler cannot be nil", location, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    __int16 v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      __int16 v21 = 1024;
      int v22 = 113;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsBiome initFromResourceDepot:]";
      __int16 v25 = 2082;
      id v26 = "nil == (resourceDepot)";
      uint64_t v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x26u);
    }
LABEL_11:

    int v14 = 0;
    goto LABEL_12;
  }
  char v6 = [v4 oneBiomeConnector];

  if (!v6)
  {
    __int16 v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBiome.m";
      __int16 v21 = 1024;
      int v22 = 114;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsBiome initFromResourceDepot:]";
      __int16 v25 = 2082;
      id v26 = "nil == (resourceDepot.oneBiomeConnector)";
      uint64_t v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a BiomeConnector!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsBiome;
  uint64_t v7 = [(MapsSuggestionsBiome *)&v18 init];
  if (v7)
  {
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MapsSuggestionsBiomeQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [v5 oneBiomeConnector];
    connector = v7->_connector;
    v7->_connector = (MapsSuggestionsBiomeConnector *)v11;

    GEOConfigGetDouble();
    v7->_expirationDuration = v13;
  }
  self = v7;
  int v14 = self;
LABEL_12:

  return v14;
}

- (void)registerForUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke;
  block[3] = &unk_1E5CB8908;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(queue, block);
  if (!self->_registeredForFindMy || !self->_registeredForSmartReplies)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_175;
    v8[3] = &unk_1E5CB8058;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 24))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_2;
    aBlock[3] = &unk_1E5CB88E0;
    objc_copyWeak(&v15, &location);
    id v6 = _Block_copy(aBlock);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_destroyWeak(&v15);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v5 + 25))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_173;
    v12[3] = &unk_1E5CB88E0;
    objc_copyWeak(&v13, &location);
    id v9 = _Block_copy(v12);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = v9;

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (![v6 count])
    {
      uint64_t v10 = WeakRetained[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_170;
      block[3] = &unk_1E5CB8058;
      objc_copyWeak(&v12, v7);
      dispatch_async(v10, block);
      objc_destroyWeak(&v12);
      goto LABEL_10;
    }
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v14 = (char *)v6;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v14 = "MapsSuggestionsBiome.m";
      __int16 v15 = 1026;
      int v16 = 166;
      __int16 v17 = 2082;
      objc_super v18 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_10:
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_170(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 24) = 1;
    (*(void (**)(void))(*((void *)WeakRetained + 7) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsBiome.m";
      __int16 v6 = 1026;
      int v7 = 169;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (![v6 count])
    {
      uint64_t v10 = WeakRetained[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_174;
      block[3] = &unk_1E5CB8058;
      objc_copyWeak(&v12, v7);
      dispatch_async(v10, block);
      objc_destroyWeak(&v12);
      goto LABEL_10;
    }
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v14 = (char *)v6;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Error from X, %@", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v14 = "MapsSuggestionsBiome.m";
      __int16 v15 = 1026;
      int v16 = 178;
      __int16 v17 = 2082;
      objc_super v18 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_10:
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_174(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 25) = 1;
    (*(void (**)(void))(*((void *)WeakRetained + 7) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsBiome.m";
      __int16 v6 = 1026;
      int v7 = 181;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __54__MapsSuggestionsBiome_registerForUpdatesWithHandler___block_invoke_175(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] registerForFindMyUpdatesWithHandler:WeakRetained[6]];
    [v2[1] registerForSmartRepliesUpdatesWithHandler:v2[5]];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsBiome.m";
      __int16 v6 = 1026;
      int v7 = 192;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsBiome registerForUpdatesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (BOOL)_shouldAllowEventType:(int)a3
{
  if (a3 == 1 || (a3 & 0xFFFFFFFE) == 2) {
    return GEOConfigGetBOOL();
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  *(_WORD *)&self->_registeredForSmartReplies = 0;
  connector = self->_connector;
  if (connector)
  {
    [(MapsSuggestionsBiomeConnector *)connector unregisterFindMyUpdates];
    [(MapsSuggestionsBiomeConnector *)self->_connector unregisterSmartRepliesUpdates];
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsBiome;
  [(MapsSuggestionsBiome *)&v4 dealloc];
}

- (NSString)uniqueName
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_findMyUpdateHandler, 0);
  objc_storeStrong(&self->_smartRepliesUpdateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end