@interface ATXHeuristicClipboardUtilities
- (ATXHeuristicClipboardUtilities)initWithDevice:(id)a3;
- (NSArray)dataDetectors;
- (NSString)appName;
- (NSString)content;
- (id)_appNameFromBundleID:(id)a3;
- (id)_dataDetectorsWithContent:(id)a3;
- (id)resultWithActions:(id)a3 predictionReasons:(unint64_t)a4;
- (void)_resetContents;
- (void)fetchContents;
- (void)setAppName:(id)a3;
- (void)setContent:(id)a3;
- (void)setDataDetectors:(id)a3;
@end

@implementation ATXHeuristicClipboardUtilities

- (ATXHeuristicClipboardUtilities)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicClipboardUtilities;
  v6 = [(ATXHeuristicClipboardUtilities *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heuristicDevice, a3);
  }

  return v7;
}

- (void)fetchContents
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [[ATXClipboardContents alloc] initWithDevice:self->_heuristicDevice];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke;
  v26[3] = &unk_1E68A4E68;
  v26[4] = &v39;
  v26[5] = &v27;
  v26[6] = &v33;
  [(ATXClipboardContents *)v3 contentsWithCallback:v26];
  v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v28[5];
    uint64_t v6 = v34[5];
    *(_DWORD *)buf = 138478083;
    uint64_t v46 = v5;
    __int16 v47 = 2113;
    uint64_t v48 = v6;
    _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities: Clipboard provided creationDate : %{private}@ originatorBundleID; %{private}@",
      buf,
      0x16u);
  }

  v7 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v40[5];
    *(_DWORD *)buf = 138739971;
    uint64_t v46 = v8;
    _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities content: %{sensitive}@", buf, 0xCu);
  }

  uint64_t v9 = [(ATXHeuristicClipboardUtilities *)self _resetContents];
  if (v40[5] && v28[5] && v34[5])
  {
    v10 = (void *)MEMORY[0x1D25F43D0](v9);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.Spotlight", @"com.apple.SafariViewService", @"com.apple.mobilesms.compose", @"com.apple.InCallService", 0);
    LODWORD(v10) = [v11 containsObject:v34[5]];

    if (v10)
    {
      v12 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v34[5];
        *(_DWORD *)buf = 138477827;
        uint64_t v46 = v13;
        v14 = "ATXHeuristicClipboardUtilities: Bundle ID blacklisted %{private}@";
        v15 = v12;
        uint32_t v16 = 12;
LABEL_13:
        _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      if ((unint64_t)[(id)v40[5] length] >= 0x201)
      {
        v12 = __atxlog_handle_context_heuristic();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        uint64_t v17 = [(id)v40[5] length];
        *(_DWORD *)buf = 134218240;
        uint64_t v46 = v17;
        __int16 v47 = 2048;
        uint64_t v48 = 512;
        v14 = "Clipboard too long, length = %lu exceeds max of %lu";
        v15 = v12;
        uint32_t v16 = 22;
        goto LABEL_13;
      }
      v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v28[5] sinceDate:600.0];
      v18 = [MEMORY[0x1E4F1C9C8] date];
      BOOL v19 = [v18 compare:v12] == 1;

      if (v19)
      {
        v20 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = (uint64_t)v12;
          _os_log_impl(&dword_1D0F43000, v20, OS_LOG_TYPE_DEFAULT, "Clipboard content expired at %@", buf, 0xCu);
        }
      }
      else
      {
        [(ATXHeuristicClipboardUtilities *)self setContent:v40[5]];
        v21 = [(ATXHeuristicClipboardUtilities *)self _appNameFromBundleID:v34[5]];
        [(ATXHeuristicClipboardUtilities *)self setAppName:v21];

        v22 = [(ATXHeuristicClipboardUtilities *)self _dataDetectorsWithContent:v40[5]];
        [(ATXHeuristicClipboardUtilities *)self setDataDetectors:v22];

        v20 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [(ATXHeuristicClipboardUtilities *)self content];
          v24 = [(ATXHeuristicClipboardUtilities *)self dataDetectors];
          v25 = [(ATXHeuristicClipboardUtilities *)self appName];
          *(_DWORD *)buf = 138740483;
          uint64_t v46 = (uint64_t)v23;
          __int16 v47 = 2112;
          uint64_t v48 = (uint64_t)v24;
          __int16 v49 = 2112;
          v50 = v25;
          _os_log_impl(&dword_1D0F43000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicClipboardUtilities: content %{sensitive}@ dataDetectors:%@ appName:%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "ATXHeuristicClipboardUtilities: no clipboard data";
      v15 = v12;
      uint32_t v16 = 2;
      goto LABEL_13;
    }
  }
LABEL_14:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

void __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (a5)
  {
    uint64_t v13 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
}

- (void)_resetContents
{
  [(ATXHeuristicClipboardUtilities *)self setContent:0];
  [(ATXHeuristicClipboardUtilities *)self setDataDetectors:0];

  [(ATXHeuristicClipboardUtilities *)self setAppName:0];
}

- (id)_appNameFromBundleID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.Pasteboard.pbutil"])
  {
    v4 = @"pbutil";
    goto LABEL_19;
  }
  uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v6 = [v5 applicationIsInstalled:v3];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_INFO, "bundleID has no installed application: %@", buf, 0xCu);
    }
    v4 = 0;
    goto LABEL_18;
  }
  id v20 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v20];
  uint64_t v8 = v20;
  if (v8)
  {
    uint64_t v9 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ATXHeuristicClipboardUtilities *)(uint64_t)v3 _appNameFromBundleID:v9];
    }
  }
  else
  {
    if (v7) {
      goto LABEL_12;
    }
    uint64_t v9 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicClipboardUtilities _appNameFromBundleID:]((uint64_t)v3, v9, v14, v15, v16, v17, v18, v19);
    }
  }

LABEL_12:
  id v10 = [v7 localizedName];
  v4 = v10;
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_INFO, "LSApplicationRecord cannot find localizedName for bundleID even though it is installed: %@", buf, 0xCu);
    }
  }
LABEL_18:

LABEL_19:

  return v4;
}

- (id)_dataDetectorsWithContent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length])
  {
LABEL_11:
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138739971;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "Running data detectors on: %{sensitive}@", buf, 0xCu);
  }

  *(void *)buf = 0;
  uint64_t v5 = DDScannerCreate();
  if (!v5)
  {
    id v10 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicClipboardUtilities _dataDetectorsWithContent:]((uint64_t)buf, v10, v11, v12, v13, v14, v15, v16);
    }

    goto LABEL_11;
  }
  char v6 = (const void *)v5;
  if (!DDScannerScanString())
  {
    uint64_t v17 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      uint64_t v18 = "ScanString returned no results";
LABEL_16:
      _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, v18, v20, 2u);
    }
LABEL_17:

    uint64_t v9 = 0;
    goto LABEL_18;
  }
  CFArrayRef v7 = (const __CFArray *)DDScannerCopyResultsWithOptions();
  if (!v7)
  {
    uint64_t v17 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      uint64_t v18 = "No detector results to copy";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  CFArrayRef v8 = v7;
  uint64_t v9 = dataDetectorResultsToPlist(v7, v3, 0);
  CFRelease(v8);
LABEL_18:
  CFRelease(v6);
LABEL_19:

  return v9;
}

- (id)resultWithActions:(id)a3 predictionReasons:(unint64_t)a4
{
  id v5 = a3;
  char v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "heuristicResultWithEnvironment: Generating NSUA for URL from clipboard", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ATXHeuristicClipboardUtilities_resultWithActions_predictionReasons___block_invoke;
  v11[3] = &__block_descriptor_40_e43___ATXProactiveSuggestion_16__0__ATXAction_8l;
  v11[4] = a4;
  CFArrayRef v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);

  CFArrayRef v8 = objc_opt_new();
  uint64_t v9 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v7 additionalRefreshTriggers:v8];

  return v9;
}

id __70__ATXHeuristicClipboardUtilities_resultWithActions_predictionReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 date];
  char v6 = [v5 dateByAddingTimeInterval:1800.0];
  CFArrayRef v7 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v5 endDate:v6 lockScreenEligible:0 predicate:0];
  [v4 setCriteria:v7];
  CFArrayRef v8 = +[ATXContextHeuristicSuggestionProducer suggestionWithAction:v4 predictionReasons:*(void *)(a1 + 32) localizedReason:0 score:0 dateInterval:70.0];

  return v8;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSArray)dataDetectors
{
  return self->_dataDetectors;
}

- (void)setDataDetectors:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_heuristicDevice, 0);
}

void __47__ATXHeuristicClipboardUtilities_fetchContents__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_appNameFromBundleID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_appNameFromBundleID:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "Couldn't fetch record for bundle %@, error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_dataDetectorsWithContent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end