@interface ATXSettingsActionsServer
+ (id)sharedInstance;
- (ATXSettingsActionsServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_dummyDayZeroSettingsActionsForDeduping;
- (id)_suggestedActionsWithDayZeroBackfillForDeduping:(id)a3;
- (id)_suggestedActionsWithRequest:(id)a3;
- (void)recentActionsWithRequest:(id)a3 completionHandler:(id)a4;
- (void)suggestedActionsWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXSettingsActionsServer

- (void)recentActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = __atxlog_handle_settings_actions();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = __atxlog_handle_settings_actions();
  v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RetrieveRecentActions", " enableTelemetry=YES ", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  uint64_t v12 = [v5 limit];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 10;
  }
  *(void *)buf = 0;
  v59[0] = buf;
  v59[1] = 0x3032000000;
  v59[2] = __Block_byref_object_copy__109;
  v59[3] = __Block_byref_object_dispose__109;
  id v60 = 0;
  id v14 = objc_alloc_init(MEMORY[0x1E4F72DF0]);
  v15 = [MEMORY[0x1E4F1C9C8] now];
  v16 = [v5 startDate];
  v17 = (id *)(v59[0] + 40);
  id obj = *(id *)(v59[0] + 40);
  v18 = [v14 transcriptPublisherWithStreamName:0 fromDate:v15 toDate:v16 maxEvents:0 reversed:1 error:&obj];
  objc_storeStrong(v17, obj);

  if (v18 && !*(void *)(v59[0] + 40))
  {
    v30 = objc_opt_new();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke;
    v55[3] = &unk_1E68AC060;
    v55[4] = buf;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke_2;
    v52[3] = &unk_1E68B65F0;
    v29 = v30;
    v53 = v29;
    uint64_t v54 = v13;
    id v31 = (id)[v18 sinkWithCompletion:v55 shouldContinue:v52];
    if (*(void *)(v59[0] + 40))
    {
      v32 = __atxlog_handle_settings_actions();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[ATXSettingsActionsServer recentActionsWithRequest:completionHandler:]((uint64_t)v59, v32, v33, v34, v35, v36, v37, v38);
      }

      v39 = *(void **)(v59[0] + 40);
      v40 = v39;
      if (!v39)
      {
        v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXSettingsActionsServer" code:-2 userInfo:0];
      }
      v6[2](v6, 0, v40);
      if (!v39) {

      }
      v41 = __atxlog_handle_settings_actions();
      v42 = v41;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        *(_WORD *)v56 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v42, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v56, 2u);
      }
    }
    else
    {
      v43 = objc_opt_new();
      v44 = [(ATXSettingsActionsServer *)self _suggestedActionsWithRequest:v43];
      v45 = [(ATXSettingsActionsServer *)self _suggestedActionsWithDayZeroBackfillForDeduping:v44];
      [v29 minusSet:v45];

      id v46 = objc_alloc(MEMORY[0x1E4F4B2D0]);
      v47 = [v29 array];
      v42 = [v46 initWithActions:v47];

      ((void (**)(id, NSObject *, void *))v6)[2](v6, v42, 0);
      v48 = __atxlog_handle_settings_actions();
      v49 = v48;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)v56 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v49, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v56, 2u);
      }
    }
  }
  else
  {
    v19 = __atxlog_handle_settings_actions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXSettingsActionsServer recentActionsWithRequest:completionHandler:]((uint64_t)v59, v19, v20, v21, v22, v23, v24, v25);
    }

    v26 = *(void **)(v59[0] + 40);
    v27 = v26;
    if (!v26)
    {
      v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXSettingsActionsServer" code:-1 userInfo:0];
    }
    v6[2](v6, 0, v27);
    if (!v26) {

    }
    v28 = __atxlog_handle_settings_actions();
    v29 = v28;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)v56 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v29, OS_SIGNPOST_INTERVAL_END, spid, "RetrieveRecentActions", " enableTelemetry=YES ", v56, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = __atxlog_handle_settings_actions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Connection attempted", buf, 2u);
  }

  v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F4ADE8]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    os_signpost_id_t v8 = __atxlog_handle_settings_actions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "Connection established", v19, 2u);
    }

    v9 = ATXSettingsActionsInterface();
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_12_2];
    [v5 setInvalidationHandler:&__block_literal_global_15_8];
    [v5 resume];
    BOOL v10 = 1;
  }
  else
  {
    unint64_t v11 = __atxlog_handle_settings_actions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXSettingsActionsServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (id)_suggestedActionsWithRequest:(id)a3
{
  uint64_t v3 = [a3 limit];
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 4;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4B298]) initWithConsumerSubType:46];
  v6 = [v5 suggestionLayoutFromCache];
  v7 = [v6 allSuggestionsInLayout];
  uint64_t v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_19_5);
  v9 = (void *)v8;
  BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    BOOL v10 = (void *)v8;
  }
  id v11 = v10;

  unint64_t v12 = [v11 count];
  if (v4 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v4;
  }
  uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);

  return v14;
}

- (void)suggestedActionsWithRequest:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  uint64_t v8 = __atxlog_handle_settings_actions();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  BOOL v10 = __atxlog_handle_settings_actions();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RetrieveSuggestedActions", " enableTelemetry=YES ", buf, 2u);
  }

  unint64_t v12 = [(ATXSettingsActionsServer *)self _suggestedActionsWithRequest:v7];

  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F4B2D0]) initWithActions:v12];
  v6[2](v6, v13, 0);

  uint64_t v14 = __atxlog_handle_settings_actions();
  uint64_t v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v15, OS_SIGNPOST_INTERVAL_END, v9, "RetrieveSuggestedActions", " enableTelemetry=YES ", v16, 2u);
  }
}

- (id)_suggestedActionsWithDayZeroBackfillForDeduping:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
  v6 = [(ATXSettingsActionsServer *)self _dummyDayZeroSettingsActionsForDeduping];
  if ((unint64_t)[v5 count] <= 3)
  {
    do
    {
      if (![v6 count]) {
        break;
      }
      id v7 = [v6 objectAtIndexedSubscript:0];
      [v6 removeObjectAtIndex:0];
      [v5 addObject:v7];
    }
    while ((unint64_t)[v5 count] < 4);
  }

  return v5;
}

- (id)_dummyDayZeroSettingsActionsForDeduping
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc(MEMORY[0x1E4F4B2B8]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"settings-navigation://com.apple.Settings.Sounds"];
  id v5 = (void *)[v3 initWithNavigationLink:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F4B2B8]);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"settings-navigation://com.apple.Settings.Notifications"];
  uint64_t v8 = (void *)[v6 initWithNavigationLink:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F4B2B8]);
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"settings-navigation://com.apple.Settings.Focus"];
  id v11 = (void *)[v9 initWithNavigationLink:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F4B2B8]);
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"settings-navigation://com.apple.Settings.ScreenTime"];
  uint64_t v14 = (void *)[v12 initWithNavigationLink:v13];
  uint64_t v15 = objc_msgSend(v2, "initWithObjects:", v5, v8, v11, v14, 0);

  return v15;
}

BOOL __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  id v5 = [v4 action];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v3 eventBody];
  id v7 = [v6 predictions];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_5;
  }
  id v9 = (void *)MEMORY[0x1E4F4B2B8];
  BOOL v10 = [v3 eventBody];
  id v11 = [v10 bundleIdentifier];
  id v12 = [v3 eventBody];
  unint64_t v13 = [v12 action];
  uint64_t v14 = [v13 identifier];
  LODWORD(v9) = [v9 isActionEligibleForSettingsSuggestionsWithBundleIdentifier:v11 actionIdentifier:v14];

  if (v9)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = objc_alloc(MEMORY[0x1E4F4B2B8]);
    uint64_t v17 = [v3 eventBody];
    v18 = [v17 action];
    v19 = [v3 eventBody];
    uint64_t v20 = [v19 executionDate];
    uint64_t v21 = (void *)[v16 initWithAction:v18 date:v20];
    [v15 addObject:v21];

    BOOL v22 = (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 40);
  }
  else
  {
LABEL_5:
    BOOL v22 = 1;
  }

  return v22;
}

void __71__ATXSettingsActionsServer_recentActionsWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 error];

  if (v3)
  {
    uint64_t v4 = [v7 error];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_43 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_43, &__block_literal_global_252);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_58;
  return v2;
}

void __42__ATXSettingsActionsServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult_58;
  sharedInstance__pasExprOnceResult_58 = v1;
}

- (ATXSettingsActionsServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsServer;
  id v2 = [(ATXSettingsActionsServer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4ADE8]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    id v6 = __atxlog_handle_settings_actions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Listening for connections", v8, 2u);
    }
  }
  return v2;
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_settings_actions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_13()
{
  v0 = __atxlog_handle_settings_actions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_13_cold_1(v0);
  }
}

id __57__ATXSettingsActionsServer__suggestedActionsWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F4B2B8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithProactiveSuggestion:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Unexpected interruption", v1, 2u);
}

void __63__ATXSettingsActionsServer_listener_shouldAcceptNewConnection___block_invoke_13_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Connection invalidated", v1, 2u);
}

- (void)recentActionsWithRequest:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recentActionsWithRequest:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end