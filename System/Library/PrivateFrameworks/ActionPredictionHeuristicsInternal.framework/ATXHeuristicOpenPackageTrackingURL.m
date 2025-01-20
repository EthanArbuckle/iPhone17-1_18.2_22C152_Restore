@interface ATXHeuristicOpenPackageTrackingURL
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)packageTrackingNumbersFromDataDetectorResults:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicOpenPackageTrackingURL

- (id)permanentRefreshTriggers
{
  v2 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXLocalPasteboardDidChangeNotification" type:0];
  v3 = (void *)MEMORY[0x1D25F43D0]();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, 0);

  return v4;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [ATXHeuristicClipboardUtilities alloc];
  v6 = [v4 heuristicDevice];

  v7 = [(ATXHeuristicClipboardUtilities *)v5 initWithDevice:v6];
  [(ATXHeuristicClipboardUtilities *)v7 fetchContents];
  v8 = [(ATXHeuristicClipboardUtilities *)v7 dataDetectors];
  v9 = [(ATXHeuristicClipboardUtilities *)v7 appName];
  int v10 = [v9 isEqualToString:@"Safari"];

  if (v10)
  {
    v11 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action for package tracking number copied from Safari.", buf, 2u);
    }

    v12 = objc_opt_new();
  }
  else
  {
    v13 = [(ATXHeuristicOpenPackageTrackingURL *)self packageTrackingNumbersFromDataDetectorResults:v8];

    v14 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_impl(&dword_1D0F43000, v14, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: results:%@", buf, 0xCu);
    }

    if ([v13 count] == 1)
    {
      v15 = [v13 firstObject];
      v16 = [v15 objectForKeyedSubscript:@"trackingNumber"];
      uint64_t v17 = [v15 objectForKeyedSubscript:@"urlEncodedTrackingNumber"];
      v18 = [v15 objectForKeyedSubscript:@"companyName"];
      v33 = (void *)v17;
      v19 = [NSString stringWithFormat:@"https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@", v18, v17];
      v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v21 = NSString;
      v32 = v20;
      v22 = [v20 localizedStringForKey:@"OPEN_PACKAGE_TRACKING_LINK_TITLE" value:&stru_1F2719D20 table:0];
      v23 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v18);

      v24 = (void *)MEMORY[0x1E4F4AE38];
      uint64_t v25 = *MEMORY[0x1E4F28AC0];
      v26 = objc_opt_new();
      v27 = objc_msgSend(v24, "atx_userActivityActionWithTitle:subtitle:bundleID:activityType:urlString:userInfo:heuristicName:", v23, v16, @"com.apple.mobilesafari", v25, v19, v26, @"openPackageTrackingUrl");

      if (v27)
      {
        v34 = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        v12 = [(ATXHeuristicClipboardUtilities *)v7 resultWithActions:v28 predictionReasons:0x4000000];
      }
      else
      {
        v30 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[ATXHeuristicOpenPackageTrackingURL heuristicResultWithEnvironment:]((uint64_t)v19, v30);
        }

        v12 = objc_opt_new();
      }
    }
    else
    {
      v29 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0F43000, v29, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Suppressing action prediction for package tracking number because did not detect exactly 1 URL.", buf, 2u);
      }

      v12 = objc_opt_new();
    }
    v8 = v13;
  }

  return v12;
}

- (id)packageTrackingNumbersFromDataDetectorResults:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_6);
}

uint64_t __84__ATXHeuristicOpenPackageTrackingURL_packageTrackingNumbersFromDataDetectorResults___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"type"];
  uint64_t v3 = [v2 isEqualToString:@"TrackingNumber"];

  return v3;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicOpenPackageTrackingURL heuristicResultWithEnvironment: Action created from URL %@ is nil. No results returned", (uint8_t *)&v2, 0xCu);
}

@end