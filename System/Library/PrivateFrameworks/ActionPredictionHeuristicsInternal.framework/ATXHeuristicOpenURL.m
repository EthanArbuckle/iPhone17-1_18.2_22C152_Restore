@interface ATXHeuristicOpenURL
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (id)urlsFromDataDetectorResults:(id)a3;
@end

@implementation ATXHeuristicOpenURL

- (id)permanentRefreshTriggers
{
  v2 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXLocalPasteboardDidChangeNotification" type:0];
  v3 = (void *)MEMORY[0x1D25F43D0]();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, 0);

  return v4;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  v6 = [v4 heuristicDevice];

  v7 = [(ATXHeuristicClipboardUtilities *)v5 initWithDevice:v6];
  [(ATXHeuristicClipboardUtilities *)v7 fetchContents];
  v8 = [(ATXHeuristicClipboardUtilities *)v7 dataDetectors];
  v9 = [(ATXHeuristicOpenURL *)self urlsFromDataDetectorResults:v8];
  v10 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    v34 = v9;
    _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: urls:%{sensitive}@", buf, 0xCu);
  }

  if ([v9 count] == 1)
  {
    v11 = [v9 firstObject];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];
    v13 = [v12 host];

    v14 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2727260];
    v15 = v14;
    if (v13 && [v14 containsObject:v13])
    {
      v16 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v11;
        _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action prediction for URL that will not actually open in Safari but punch out to an app immediately: %@", buf, 0xCu);
      }

      v17 = objc_opt_new();
    }
    else
    {
      v31 = v15;
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v20 = NSString;
      v21 = [v19 localizedStringForKey:@"OPEN_CLIPBOARD_LINK_TITLE" value:&stru_1F2719D20 table:0];
      v22 = [(ATXHeuristicClipboardUtilities *)v7 appName];
      v23 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);

      v24 = (void *)MEMORY[0x1E4F4AE38];
      uint64_t v25 = *MEMORY[0x1E4F28AC0];
      v26 = objc_opt_new();
      v27 = objc_msgSend(v24, "atx_userActivityActionWithTitle:subtitle:bundleID:activityType:urlString:userInfo:heuristicName:", v23, 0, @"com.apple.mobilesafari", v25, v11, v26, @"openUrl");

      if (v27)
      {
        v32 = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        v17 = [(ATXHeuristicClipboardUtilities *)v7 resultWithActions:v28 predictionReasons:0x8000000];
      }
      else
      {
        v29 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ATXHeuristicOpenURL heuristicResultWithEnvironment:]((uint64_t)v11, v29);
        }

        v17 = objc_opt_new();
      }
      v15 = v31;
    }
  }
  else
  {
    v18 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: action prediction for URL because did not detect exactly 1 URL.", buf, 2u);
    }

    v17 = objc_opt_new();
  }

  return v17;
}

- (id)urlsFromDataDetectorResults:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:@"value"];

        if (v11)
        {
          v12 = [v10 objectForKeyedSubscript:@"type"];
          int v13 = [v12 isEqualToString:@"HttpURL"];

          if (v13)
          {
            v14 = [v10 objectForKeyedSubscript:@"value"];
            [v4 addObject:v14];
          }
          else
          {
            v15 = [v10 objectForKeyedSubscript:@"type"];
            int v16 = [v15 isEqualToString:@"WebURL"];

            if (!v16) {
              continue;
            }
            v17 = NSString;
            v14 = [v10 objectForKeyedSubscript:@"value"];
            v18 = [v17 stringWithFormat:@"http://%@", v14];
            [v4 addObject:v18];
          }
        }
        else
        {
          v14 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            [(ATXHeuristicOpenURL *)&buf urlsFromDataDetectorResults:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicOpenURL heuristicResultWithEnvironment: Action created from URL %@ is nil. No results returned", (uint8_t *)&v2, 0xCu);
}

- (void)urlsFromDataDetectorResults:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXHeuristicOpenURL urlsFromDataDetectorResults: nil value in result", buf, 2u);
}

@end