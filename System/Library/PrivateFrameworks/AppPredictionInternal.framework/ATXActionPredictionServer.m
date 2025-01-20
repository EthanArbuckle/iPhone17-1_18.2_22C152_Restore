@interface ATXActionPredictionServer
+ (id)sharedInstance;
- (ATXActionPredictionServer)init;
- (ATXActionPredictionServer)initWithListener:(id)a3 checkEntitlements:(BOOL)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (id)behavioralModelSuggestionsForRequest:(id)a3;
- (id)filteredCachedIntentSuggestionsForClientModelId:(id)a3 request:(id)a4;
- (id)initAnonymousListener;
- (void)dealloc;
- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8;
- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9;
- (void)pingWithCompletion:(id)a3;
- (void)registerForRealTimeRequestsWithBlendingLayerServer:(id)a3;
- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4;
- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4;
- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
@end

@implementation ATXActionPredictionServer

- (ATXActionPredictionServer)initWithListener:(id)a3 checkEntitlements:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATXActionPredictionServer.mm", 47, @"Invalid parameter not satisfying: %@", @"listener" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)ATXActionPredictionServer;
  v9 = [(ATXActionPredictionServer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_checkEntitlements = a4;
    objc_storeStrong((id *)&v9->_listener, a3);
    [(NSXPCListener *)v10->_listener setDelegate:v10];
    [(NSXPCListener *)v10->_listener resume];
  }

  return v10;
}

- (ATXActionPredictionServer)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F29290]);
  v4 = (void *)[v3 initWithMachServiceName:*MEMORY[0x1E4F4B460]];
  v5 = [(ATXActionPredictionServer *)self initWithListener:v4 checkEntitlements:1];

  return v5;
}

- (id)initAnonymousListener
{
  id v3 = [MEMORY[0x1E4F29290] anonymousListener];
  v4 = [(ATXActionPredictionServer *)self initWithListener:v3 checkEntitlements:0];

  return v4;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXActionPredictionServer;
  [(ATXActionPredictionServer *)&v3 dealloc];
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

+ (id)sharedInstance
{
  if (+[ATXActionPredictionServer sharedInstance]::_pasOnceToken2 != -1) {
    dispatch_once(&+[ATXActionPredictionServer sharedInstance]::_pasOnceToken2, &__block_literal_global_167);
  }
  v2 = (void *)+[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult;
  return v2;
}

void __43__ATXActionPredictionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)+[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult;
  +[ATXActionPredictionServer sharedInstance]::_pasExprOnceResult = v1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_checkEntitlements) {
    goto LABEL_6;
  }
  uint64_t v9 = *MEMORY[0x1E4F4B460];
  v10 = [v7 valueForEntitlement:*MEMORY[0x1E4F4B460]];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0 && ([v10 BOOLValue] & 1) != 0)
  {

LABEL_6:
    v11 = ATXActionPredictionInterface();
    [v8 setExportedInterface:v11];

    [v8 setExportedObject:self];
    [v8 setInterruptionHandler:&__block_literal_global_30_2];
    [v8 setInvalidationHandler:&__block_literal_global_33];
    [v8 resume];
    BOOL v12 = 1;
    goto LABEL_10;
  }
  objc_super v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v8, v9, v13);
  }

  BOOL v12 = 0;
LABEL_10:

  return v12;
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_31()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_31_cold_1(v0);
  }
}

- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a8;
  v14 = __atxlog_handle_xpc();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  v16 = __atxlog_handle_xpc();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "getActionPredictionsForCandidateBundleIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  v18 = (void *)MEMORY[0x1E4F93B10];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke;
  v22[3] = &unk_1E68B3CA0;
  id v19 = v11;
  id v23 = v19;
  id v20 = v12;
  unsigned __int8 v27 = a6;
  id v24 = v20;
  os_signpost_id_t v26 = v15;
  id v21 = v13;
  id v25 = v21;
  [v18 runBlockWhenDeviceIsClassCUnlocked:v22];
}

void __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke(uint64_t a1)
{
  v2 = __atx_xpc_private_queue_get();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2;
  block[3] = &unk_1E68B3CA0;
  id v7 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 64);
  v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v8 = v3;
  uint64_t v10 = v4;
  id v9 = v5;
  dispatch_async(v2, block);
}

void __141__ATXActionPredictionServer_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2(uint64_t a1)
{
  v2 = +[ATXActionPredictions predictionsWithCandidateBundleIdentifiers:*(void *)(a1 + 32) candidateActiontypes:*(void *)(a1 + 40) consumerSubType:*(unsigned __int8 *)(a1 + 64) firstStageScoreLogger:0 secondStageScoreLogger:0 thirdStageScoreLogger:0 multiStageScoreLogger:0];
  id v3 = __atxlog_handle_xpc();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v4, OS_SIGNPOST_INTERVAL_END, v5, "getActionPredictionsForCandidateBundleIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v2 first];
  id v8 = [v2 second];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
}

- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = __atxlog_handle_xpc();
  char v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "removeActionPredictionNotificationsMatchingSuggestion", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = (void *)MEMORY[0x1E4F93B10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke;
  v15[3] = &unk_1E68B3CC8;
  id v13 = v6;
  id v16 = v13;
  v17 = self;
  os_signpost_id_t v19 = v9;
  id v14 = v7;
  id v18 = v14;
  [v12 runBlockWhenDeviceIsClassCUnlocked:v15];
}

void __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke(uint64_t a1)
{
  v2 = __atx_xpc_private_queue_get();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2;
  v6[3] = &unk_1E68B3CC8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  os_signpost_id_t v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v10 = *(void *)(a1 + 56);
  id v9 = v5;
  dispatch_async(v2, v6);
}

void __89__ATXActionPredictionServer_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) atxActionExecutableObject];
  if (v2)
  {
    id v3 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      os_signpost_id_t v5 = NSStringFromClass(v4);
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v2;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - removeActionPredictionNotificationsMatchingSuggestion attempting to remove any lockscreen action predictions matching: %@", (uint8_t *)&v13, 0x16u);
    }
    id v6 = +[ATXActionNotificationServer sharedInstance];
    [v6 removeActionPredictionNotificationsMatchingAction:v2];
  }
  else
  {
    id v6 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - removeActionPredictionNotificationsMatchingSuggestion did not find an ATXAction executable object", (uint8_t *)&v13, 0xCu);
    }
  }

  id v9 = __atxlog_handle_xpc();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v10, OS_SIGNPOST_INTERVAL_END, v11, "removeActionPredictionNotificationsMatchingSuggestion", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
  }
}

- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = __atxlog_handle_xpc();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = __atxlog_handle_xpc();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "shouldDisplayDailyRoutineForContext", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v11 = (void *)MEMORY[0x1E4F93B10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke;
  v14[3] = &unk_1E68B3CF0;
  id v12 = v5;
  id v15 = v12;
  os_signpost_id_t v17 = v8;
  id v13 = v6;
  id v16 = v13;
  [v11 runBlockWhenDeviceIsClassCUnlocked:v14];
}

void __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke(uint64_t a1)
{
  v2 = __atx_xpc_private_queue_get();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke_2;
  block[3] = &unk_1E68B3CF0;
  id v3 = *(id *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v9 = v4;
  id v8 = v5;
  dispatch_async(v2, block);
}

void __71__ATXActionPredictionServer_shouldDisplayDailyRoutineForContext_reply___block_invoke_2(void *a1)
{
  v2 = +[ATXDailyRoutinesPersonalizationManager sharedInstance];
  [v2 shouldDisplayDailyRoutineForContext:a1[4]];
  id v3 = __atxlog_handle_xpc();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v4, OS_SIGNPOST_INTERVAL_END, v5, "shouldDisplayDailyRoutineForContext", " enableTelemetry=YES ", v6, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v33 = a9;
  os_signpost_id_t v19 = __atxlog_handle_xpc();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  id v21 = __atxlog_handle_xpc();
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "getActionPredictionsForContext", " enableTelemetry=YES ", buf, 2u);
  }

  id v23 = (void *)MEMORY[0x1E4F93B10];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke;
  v34[3] = &unk_1E68B3D18;
  id v32 = v14;
  id v24 = v14;
  id v35 = v24;
  id v31 = v15;
  id v25 = v15;
  id v36 = v25;
  id v26 = v16;
  id v37 = v26;
  id v30 = v17;
  id v27 = v17;
  id v38 = v27;
  id v28 = v18;
  id v39 = v28;
  unint64_t v41 = a8;
  os_signpost_id_t v42 = v20;
  id v29 = v33;
  id v40 = v29;
  objc_msgSend(v23, "runBlockWhenDeviceIsClassCUnlocked:", v34, v30, v31, v32);
}

void __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke(uint64_t a1)
{
  v2 = __atx_xpc_private_queue_get();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2;
  v3[3] = &unk_1E68B3D18;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 80);
  id v9 = *(id *)(a1 + 72);
  dispatch_async(v2, v3);
}

void __144__ATXActionPredictionServer_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2(void *a1)
{
  v2 = +[ATXDailyRoutinesPersonalizationManager sharedInstance];
  id v3 = [v2 getActionPredictionsForContext:a1[4] includeBundleIds:a1[5] excludeBundleIds:a1[6] includeActionTypes:a1[7] excludeActionTypes:a1[8] limit:a1[10]];
  id v4 = __atxlog_handle_xpc();
  id v5 = v4;
  os_signpost_id_t v6 = a1[11];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v5, OS_SIGNPOST_INTERVAL_END, v6, "getActionPredictionsForContext", " enableTelemetry=YES ", v7, 2u);
  }

  (*(void (**)(void))(a1[9] + 16))();
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = __atxlog_handle_xpc();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = __atxlog_handle_xpc();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "suggestionsForIntentSuggestionRequest", " enableTelemetry=YES ", buf, 2u);
  }

  id v15 = (void *)MEMORY[0x1E4F93B10];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke;
  v19[3] = &unk_1E68B3D40;
  id v16 = v9;
  id v20 = v16;
  id v21 = self;
  id v17 = v8;
  id v22 = v17;
  os_signpost_id_t v24 = v12;
  id v18 = v10;
  id v23 = v18;
  [v15 runBlockWhenDeviceIsClassCUnlocked:v19];
}

void __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke(uint64_t a1)
{
  v2 = __atx_xpc_private_queue_get();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke_2;
  block[3] = &unk_1E68B3D40;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v4;
  id v6 = v5;
  id v8 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v12 = v6;
  uint64_t v14 = v7;
  id v13 = v8;
  dispatch_async(v2, block);
}

void __87__ATXActionPredictionServer_suggestionsForIntentSuggestionRequest_clientModelId_reply___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F93940] clientModelTypeFromClientModelId:*(void *)(a1 + 32)];
  if (v2 == 1 || v2 == 3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) filteredCachedIntentSuggestionsForClientModelId:*(void *)(a1 + 32) request:*(void *)(a1 + 48)];
  }
  else
  {
    if (v2 != 6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v11 = [NSString stringWithFormat:@"Wrong delegate for request. Expected %@ but found ATXActionPredictionServer, which only support SpotlightUnknown / AnchorModel / Heuristics.", *(void *)(a1 + 32)];
      v19[0] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v6 = [v8 errorWithDomain:v10 code:5 userInfo:v12];

      id v5 = 0;
      uint64_t v7 = 3;
      goto LABEL_11;
    }
    uint64_t v4 = [*(id *)(a1 + 40) behavioralModelSuggestionsForRequest:*(void *)(a1 + 48)];
  }
  id v5 = (void *)v4;
  id v6 = 0;
  uint64_t v7 = 2;
LABEL_11:
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F939D0]) initWithSuggestions:v5 feedbackMetadata:0 originalRequest:*(void *)(a1 + 48) responseCode:v7 error:v6];
  uint64_t v14 = __atxlog_handle_xpc();
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v15, OS_SIGNPOST_INTERVAL_END, v16, "suggestionsForIntentSuggestionRequest", " enableTelemetry=YES ", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)registerForRealTimeRequestsWithBlendingLayerServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [&unk_1F27F36F0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(&unk_1F27F36F0);
        }
        id v8 = objc_msgSend(MEMORY[0x1E4F93940], "clientModelIdFromClientModelType:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "integerValue"));
        [v4 registerRealTimeSuggestionProviderDelegate:self clientModelId:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_1F27F36F0 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)behavioralModelSuggestionsForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIds];
  uint64_t v5 = [v3 intentClassNames];
  uint64_t v6 = [v3 limit];
  uint64_t v7 = +[ATXActionPredictions actionResultsForCandidateBundleIdentifiers:v4 candidateActiontypes:v5 consumerSubType:21 firstStageScoreLogger:0 secondStageScoreLogger:0 thirdStageScoreLogger:0 multiStageScoreLogger:0 predictionsPerAppActionLimit:v6];

  id v8 = objc_msgSend(v7, "_pas_filteredArrayWithTest:", &__block_literal_global_53_0);

  long long v9 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:6];
  long long v10 = +[_ATXGlobals sharedInstance];
  long long v11 = [v10 actionPredictionBlendingModelVersion];

  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v9 clientModelVersion:v11];
  id v13 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromActionResults:v8 clientModelSpec:v12];

  return v13;
}

uint64_t __66__ATXActionPredictionServer_behavioralModelSuggestionsForRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSampledResultForLoggingOnly] ^ 1;
}

- (id)filteredCachedIntentSuggestionsForClientModelId:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [v7 cachedSuggestionsForClientModel:v5];
  long long v9 = (objc_class *)objc_opt_class();
  long long v10 = NSStringFromClass(v9);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  long long v11 = [v8 suggestions];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__ATXActionPredictionServer_filteredCachedIntentSuggestionsForClientModelId_request___block_invoke;
  v16[3] = &unk_1E68B3D68;
  id v12 = v6;
  id v17 = v12;
  os_signpost_id_t v19 = v20;
  id v13 = v10;
  id v18 = v13;
  uint64_t v14 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v16);

  _Block_object_dispose(v20, 8);
  return v14;
}

uint64_t __85__ATXActionPredictionServer_filteredCachedIntentSuggestionsForClientModelId_request___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) limit];
  if (!v4
    || (unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
        [*(id *)(a1 + 32) limit],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 unsignedIntegerValue],
        v6,
        v4,
        v5 < v7))
  {
    id v8 = [v3 executableSpecification];
    uint64_t v9 = [v8 executableType];

    if (v9 == 2)
    {
      long long v10 = [v3 executableSpecification];
      long long v11 = [v10 executableClassString];
      char v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

      if (v12)
      {
        id v13 = [v3 executableSpecification];
        uint64_t v14 = [v13 executableObject];

        if (v14)
        {
          id v15 = [*(id *)(a1 + 32) bundleIds];
          if ([v15 count])
          {
            os_signpost_id_t v16 = [*(id *)(a1 + 32) bundleIds];
            id v17 = [v14 bundleId];
            char v18 = [v16 containsObject:v17];

            if ((v18 & 1) == 0) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          id v21 = [*(id *)(a1 + 32) intentClassNames];
          uint64_t v22 = [v21 count];

          if (!v22) {
            goto LABEL_15;
          }
          id v23 = [v14 intent];
          os_signpost_id_t v24 = [v23 _className];

          if (v24)
          {
            id v25 = [*(id *)(a1 + 32) intentClassNames];
            char v26 = [v25 containsObject:v24];

            if (v26)
            {
LABEL_15:
              ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              uint64_t v19 = 1;
LABEL_17:

              goto LABEL_10;
            }
          }
        }
LABEL_16:
        uint64_t v19 = 0;
        goto LABEL_17;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

- (void).cxx_destruct
{
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Unexpected interruption on App Preference client interface", v1, 2u);
}

void __64__ATXActionPredictionServer_listener_shouldAcceptNewConnection___block_invoke_31_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Connection invalidated on App Preference client interface. Client went away.", v1, 2u);
}

@end