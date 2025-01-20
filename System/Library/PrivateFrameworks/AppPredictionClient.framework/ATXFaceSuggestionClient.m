@interface ATXFaceSuggestionClient
+ (id)sharedInstance;
- (ATXFaceSuggestionClient)init;
- (void)_logEvent:(id)a3;
- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3;
- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3;
- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4;
- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4;
- (void)fetchMetricsDescriptionWithCompletion:(id)a3;
- (void)fetchPosterConfigurationsWithCompletion:(id)a3;
- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3;
- (void)fetchRankedPosterDescriptors:(id)a3;
- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3;
- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4;
- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4;
- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3;
- (void)logFaceGalleryDidDisappear;
- (void)logFaceGalleryItemsDidAppear:(id)a3;
- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4;
- (void)logPosterEdit:(id)a3 completion:(id)a4;
- (void)logPosterEditUIViewedWithCompletion:(id)a3;
- (void)logPosterSwitch:(id)a3 completion:(id)a4;
- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4;
- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4;
- (void)refreshComplicationsCacheWithCompletion:(id)a3;
- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3;
- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3;
- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3;
@end

@implementation ATXFaceSuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __41__ATXFaceSuggestionClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (ATXFaceSuggestionClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionClient;
  v2 = [(ATXFaceSuggestionClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.FaceSuggestions.xpc" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = ATXFaceSuggestionClientXPCInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_22];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_25];
    [(NSXPCConnection *)v2->_connection resume];
    uint64_t v6 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXFaceGalleryBiomeStream *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.proactive.ATXFaceSuggestionClient.logging", v8);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

void __31__ATXFaceSuggestionClient_init__block_invoke()
{
  v0 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__ATXFaceSuggestionClient_init__block_invoke_cold_1(v0);
  }
}

void __31__ATXFaceSuggestionClient_init__block_invoke_23()
{
  v0 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__ATXFaceSuggestionClient_init__block_invoke_23_cold_1(v0);
  }
}

- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXFaceSuggestionClient regenerateFaceGalleryConfigurationWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = __atxlog_handle_lock_screen();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = __atxlog_handle_lock_screen();
  dispatch_queue_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RegenerateLockScreenGalleryConfiguration", " enableTelemetry=YES ", buf, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke;
  v23[3] = &__block_descriptor_40_e5_v8__0l;
  v23[4] = v7;
  v10 = (void *)MEMORY[0x1AD0D3E40](v23);
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_28;
  v20[3] = &unk_1E5D04F00;
  id v12 = v10;
  id v21 = v12;
  id v13 = v4;
  id v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_30;
  v17[3] = &unk_1E5D04F28;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 regenerateFaceGalleryConfigurationWithCompletion:v17];
}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_lock_screen();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RegenerateLockScreenGalleryConfiguration", " enableTelemetry=YES ", v5, 2u);
  }
}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[ATXFaceSuggestionClient regenerateFaceGalleryConfigurationWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__ATXFaceSuggestionClient_regenerateFaceGalleryConfigurationWithCompletion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];
  [v5 reloadLockScreenSuggestionsWithCompletion:v4];
}

- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXFaceSuggestionClient fetchFaceGalleryConfigurationWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = __atxlog_handle_lock_screen();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = __atxlog_handle_lock_screen();
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchLockScreenGalleryConfiguration", " enableTelemetry=YES ", buf, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke;
  v23[3] = &__block_descriptor_40_e5_v8__0l;
  v23[4] = v7;
  v10 = (void *)MEMORY[0x1AD0D3E40](v23);
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_32;
  v20[3] = &unk_1E5D04F00;
  id v12 = v10;
  id v21 = v12;
  id v13 = v4;
  id v22 = v13;
  v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_33;
  v17[3] = &unk_1E5D04F28;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 fetchFaceGalleryConfigurationWithCompletion:v17];
}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_lock_screen();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FetchLockScreenGalleryConfiguration", " enableTelemetry=YES ", v5, 2u);
  }
}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[ATXFaceSuggestionClient fetchFaceGalleryConfigurationWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__ATXFaceSuggestionClient_fetchFaceGalleryConfigurationWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke;
  block[3] = &unk_1E5D04FA0;
  v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = [v2 length];

  if (!v3)
  {
    id v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "%s: no UUID, can't do a cache lookup; doing full query",
        buf,
        0xCu);
    }
    goto LABEL_11;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v5 = [*(id *)(a1 + 32) uuid];
  id v6 = [v4 initWithUUIDString:v5];

  id v7 = objc_alloc_init(ATXModeFaceSuggestionsCache);
  id v8 = [(ATXModeFaceSuggestionsCache *)v7 cachedSuggestedFacesForModeUUID:v6];
  if (![v8 count])
  {
    id v10 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: no cached items for %{public}@; doing fully query",
        buf,
        0x16u);
    }

LABEL_11:
    id v11 = *(void **)(*(void *)(a1 + 40) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_36;
    v16[3] = &unk_1E5D04F50;
    v17 = *(id *)(a1 + 48);
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v16];
    uint64_t v13 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_37;
    v14[3] = &unk_1E5D04F78;
    id v15 = *(id *)(a1 + 48);
    [v12 fetchFaceSuggestionsForFocusMode:v13 completion:v14];

    id v6 = v17;
    goto LABEL_12;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v9 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "%s: using cached items for: %{public}@", buf, 0x16u);
  }

LABEL_12:
}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__ATXFaceSuggestionClient_fetchFaceSuggestionsForFocusMode_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  __int16 v7 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ATXFaceSuggestionClient fetchFaceSuggestionsForFocusMode:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient fetchPosterDescriptorsAndSuggestionDataWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__ATXFaceSuggestionClient_fetchPosterDescriptorsAndSuggestionDataWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  int v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchPosterDescriptorsAndSuggestionDataWithCompletion:v7];
}

void __81__ATXFaceSuggestionClient_fetchPosterDescriptorsAndSuggestionDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchPosterDescriptorsAndSuggestionDataWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRankedPosterDescriptors:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient fetchRankedPosterDescriptors:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ATXFaceSuggestionClient_fetchRankedPosterDescriptors___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchRankedPosterDescriptors:v7];
}

void __56__ATXFaceSuggestionClient_fetchRankedPosterDescriptors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchRankedPosterDescriptors:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPosterConfigurationsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient fetchPosterConfigurationsWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ATXFaceSuggestionClient_fetchPosterConfigurationsWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchPosterConfigurationsWithCompletion:v7];
}

void __67__ATXFaceSuggestionClient_fetchPosterConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchPosterConfigurationsWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient fetchComplicationSetsForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ATXFaceSuggestionClient_fetchComplicationSetsForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 fetchComplicationSetsForFaceGalleryItem:v7 completion:v10];
}

void __78__ATXFaceSuggestionClient_fetchComplicationSetsForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchComplicationSetsForFaceGalleryItem:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient fetchLandscapeComplicationSetsForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__ATXFaceSuggestionClient_fetchLandscapeComplicationSetsForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 fetchLandscapeComplicationSetsForFaceGalleryItem:v7 completion:v10];
}

void __87__ATXFaceSuggestionClient_fetchLandscapeComplicationSetsForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchLandscapeComplicationSetsForFaceGalleryItem:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__ATXFaceSuggestionClient_posterBoardDidUpdateDescriptors_completion___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 posterBoardDidUpdateDescriptors:v9 completion:v8];
}

void __70__ATXFaceSuggestionClient_posterBoardDidUpdateDescriptors_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient posterBoardDidUpdateDescriptors:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__ATXFaceSuggestionClient_posterBoardDidUpdateConfigurations_completion___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 posterBoardDidUpdateConfigurations:v9 completion:v8];
}

void __73__ATXFaceSuggestionClient_posterBoardDidUpdateConfigurations_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient posterBoardDidUpdateConfigurations:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__ATXFaceSuggestionClient_inputDescriptionForComplicationSuggestionSignal_completion___block_invoke;
  v11[3] = &unk_1E5D04F50;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 inputDescriptionForComplicationSuggestionSignal:v9 completion:v8];
}

void __86__ATXFaceSuggestionClient_inputDescriptionForComplicationSuggestionSignal_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient inputDescriptionForComplicationSuggestionSignal:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__ATXFaceSuggestionClient_fetchComplicationSuggestionsModelDescriptionWithCompletion___block_invoke;
  v8[3] = &unk_1E5D04F50;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 fetchComplicationSuggestionsModelDescriptionWithCompletion:v6];
}

void __86__ATXFaceSuggestionClient_fetchComplicationSuggestionsModelDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchComplicationSuggestionsModelDescriptionWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient fetchInlineComplicationSetForFaceGalleryItem:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_fetchInlineComplicationSetForFaceGalleryItem_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 fetchInlineComplicationSetForFaceGalleryItem:v7 completion:v10];
}

void __83__ATXFaceSuggestionClient_fetchInlineComplicationSetForFaceGalleryItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchInlineComplicationSetForFaceGalleryItem:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshComplicationsCacheWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient refreshComplicationsCacheWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ATXFaceSuggestionClient_refreshComplicationsCacheWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 refreshComplicationsCacheWithCompletion:v7];
}

void __67__ATXFaceSuggestionClient_refreshComplicationsCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient refreshComplicationsCacheWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient fetchScoredComplicationDescriptionWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__ATXFaceSuggestionClient_fetchScoredComplicationDescriptionWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchScoredComplicationDescriptionWithCompletion:v7];
}

void __76__ATXFaceSuggestionClient_fetchScoredComplicationDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchScoredComplicationDescriptionWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchMetricsDescriptionWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient fetchMetricsDescriptionWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ATXFaceSuggestionClient_fetchMetricsDescriptionWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 fetchMetricsDescriptionWithCompletion:v7];
}

void __65__ATXFaceSuggestionClient_fetchMetricsDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient fetchMetricsDescriptionWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logPosterEdit:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient logPosterEdit:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ATXFaceSuggestionClient_logPosterEdit_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 logPosterEdit:v7 completion:v10];
}

void __52__ATXFaceSuggestionClient_logPosterEdit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient logPosterEdit:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logPosterEditUIViewedWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient logPosterEditUIViewedWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ATXFaceSuggestionClient_logPosterEditUIViewedWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 logPosterEditUIViewedWithCompletion:v7];
}

void __63__ATXFaceSuggestionClient_logPosterEditUIViewedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient logPosterEditUIViewedWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logPosterSwitch:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient logPosterSwitch:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__ATXFaceSuggestionClient_logPosterSwitch_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 logPosterSwitch:v7 completion:v10];
}

void __54__ATXFaceSuggestionClient_logPosterSwitch_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient logPosterSwitch:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ATXFaceSuggestionClient synchronousDateOfLastGalleryAppearanceWithCompletion:]";
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__ATXFaceSuggestionClient_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke;
  v9[3] = &unk_1E5D04F50;
  id v10 = v4;
  id v7 = v4;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  [v8 synchronousDateOfLastGalleryAppearanceWithCompletion:v7];
}

void __80__ATXFaceSuggestionClient_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient synchronousDateOfLastGalleryAppearanceWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching synchronous remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient logComplicationsSeenInGalleryWithEngagements:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_logComplicationsSeenInGalleryWithEngagements_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 logComplicationsSeenInGalleryWithEngagements:v7 completion:v10];
}

void __83__ATXFaceSuggestionClient_logComplicationsSeenInGalleryWithEngagements_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient logComplicationsSeenInGalleryWithEngagements:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ATXFaceSuggestionClient logFaceGalleryItemsSeenInGalleryWithOutcomes:completion:]";
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXFaceSuggestionClient_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion___block_invoke;
  v12[3] = &unk_1E5D04F50;
  id v13 = v6;
  id v10 = v6;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v11 logFaceGalleryItemsSeenInGalleryWithOutcomes:v7 completion:v10];
}

void __83__ATXFaceSuggestionClient_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[ATXFaceSuggestionClient logFaceGalleryItemsSeenInGalleryWithOutcomes:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_logEvent:(id)a3
{
  id v4 = a3;
  loggingQueue = self->_loggingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATXFaceSuggestionClient__logEvent___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(loggingQueue, v7);
}

void __37__ATXFaceSuggestionClient__logEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) source];
  [v2 sendEvent:*(void *)(a1 + 40)];
}

- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[ATXFaceSuggestionClient logFaceGalleryDidAppearWithFaceGalleryConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_40];
  [v6 logFaceGalleryDidAppearWithFaceGalleryConfiguration:v4];

  __int16 v7 = +[ATXFaceGalleryEvent galleryDidAppearEventWithConfiguration:v4];
  [(ATXFaceSuggestionClient *)self _logEvent:v7];
}

void __79__ATXFaceSuggestionClient_logFaceGalleryDidAppearWithFaceGalleryConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[ATXFaceSuggestionClient logFaceGalleryDidAppearWithFaceGalleryConfiguration:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: error fetching remote object proxy: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)logFaceGalleryDidDisappear
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[ATXFaceSuggestionClient logFaceGalleryDidDisappear]";
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = +[ATXFaceGalleryEvent galleryDidDisappearEvent];
  [(ATXFaceSuggestionClient *)self _logEvent:v4];
}

- (void)logFaceGalleryItemsDidAppear:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[ATXFaceSuggestionClient logFaceGalleryItemsDidAppear:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  __int16 v6 = +[ATXFaceGalleryEvent itemsDidAppearEventWithItems:v4];
  [(ATXFaceSuggestionClient *)self _logEvent:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __31__ATXFaceSuggestionClient_init__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[ATXFaceSuggestionClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: connection interrupted", (uint8_t *)&v1, 0xCu);
}

void __31__ATXFaceSuggestionClient_init__block_invoke_23_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[ATXFaceSuggestionClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: connection invalidated", (uint8_t *)&v1, 0xCu);
}

@end