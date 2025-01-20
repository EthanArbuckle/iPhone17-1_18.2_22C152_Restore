@interface ATXActionPredictionClient
- (ATXActionPredictionClient)init;
- (ATXActionPredictionClient)initWithCacheBasePath:(id)a3;
- (id)_atxActionFromProactiveSuggestion:(id)a3;
- (id)actionPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4;
- (id)atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:(unsigned __int8)a3 limit:(int)a4;
- (void)dealloc;
- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8;
- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9;
- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4;
- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4;
@end

@implementation ATXActionPredictionClient

- (ATXActionPredictionClient)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  v5 = [(ATXActionPredictionClient *)self initWithCacheBasePath:v4];

  return v5;
}

- (ATXActionPredictionClient)initWithCacheBasePath:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXActionPredictionClient;
  v6 = [(ATXActionPredictionClient *)&v18 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.proactive.AppPrediction.ATXActionPredictionClient.xpc", v7);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_cacheBasePath, a3);
    v10 = [[ATXCacheReader alloc] initWithCacheBasePath:v6->_cacheBasePath];
    cacheReader = v6->_cacheReader;
    v6->_cacheReader = v10;

    uint64_t v12 = +[ATXEngagementRecordManager sharedInstance];
    engagementRecordManager = v6->_engagementRecordManager;
    v6->_engagementRecordManager = (ATXEngagementRecordManager *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.ActionPrediction.predictions" options:0];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v14;

    v16 = ATXActionPredictionInterface();
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v16];

    [(NSXPCConnection *)v6->_xpcConnection setInterruptionHandler:&__block_literal_global_1];
    [(NSXPCConnection *)v6->_xpcConnection resume];
  }

  return v6;
}

void __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXActionPredictionClient;
  [(ATXActionPredictionClient *)&v3 dealloc];
}

- (id)actionPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 == 46)
  {
    v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v18 = 0;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeActionSettings inside ATXActionPredictionClient...", v18, 2u);
    }

    dispatch_queue_t v8 = self;
    uint64_t v9 = 46;
  }
  else
  {
    uint64_t v6 = a3;
    if (a3 != 21)
    {
      uint64_t v12 = [(ATXCacheReader *)self->_cacheReader readCacheFileForConsumerSubtype:a3];
      if (v12)
      {
        v13 = (void *)MEMORY[0x1AD0D3C30]();
        uint64_t v14 = [[ATXActionCacheClientReader alloc] initWithData:v12];
        v15 = [(ATXActionCacheClientReader *)v14 actionsWithConsumerSubType:v6 limit:(int)v4];
        v16 = [[ATXActionResponse alloc] initWithScoredActions:v15 cacheFileData:v12 consumerSubType:v6 error:0];
      }
      else
      {
        v16 = 0;
      }
      v11 = v16;

      goto LABEL_14;
    }
    v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeActionSpotlightUnknown inside ATXActionPredictionClient...", buf, 2u);
    }

    dispatch_queue_t v8 = self;
    uint64_t v9 = 21;
  }
  v11 = [(ATXActionPredictionClient *)v8 atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:v9 limit:v4];
LABEL_14:

  return v11;
}

- (id)atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  uint64_t v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v7 = [[ATXProactiveSuggestionClient alloc] initWithConsumerSubType:a3];
  dispatch_queue_t v8 = [(ATXProactiveSuggestionClient *)v7 suggestionLayoutFromCache];
  uint64_t v9 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:35 queryOptions:1];
  v10 = [v8 allSuggestionsInLayout];
  v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v10 count];
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "Blending retrieved a layout with %lu actions in it.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __104__ATXActionPredictionClient_atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType_limit___block_invoke;
  v23 = &unk_1E5D051E8;
  int v27 = a4;
  p_long long buf = &buf;
  v24 = self;
  id v12 = v9;
  id v25 = v12;
  v13 = objc_msgSend(v10, "_pas_filteredArrayWithIndexedTest:", &v20);
  uint64_t v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend(v13, "count", v20, v21, v22, v23, v24);
    *(_DWORD *)v28 = 134217984;
    uint64_t v29 = v15;
    _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "Blending created an ATXActionResponse that has %lu actions in it.", v28, 0xCu);
  }

  v16 = [ATXActionResponse alloc];
  v17 = [v8 uuid];
  objc_super v18 = [(ATXActionResponse *)v16 initWithProactiveSuggestions:v13 blendingModelUICacheUpdateUUID:v17 consumerSubType:v5 error:0];

  _Block_object_dispose(&buf, 8);

  return v18;
}

uint64_t __104__ATXActionPredictionClient_atxActionResponseFromBlendingActionPredictionCacheForConsumerSubType_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < (unint64_t)*(int *)(a1 + 56))
  {
    if (![*(id *)(*(void *)(a1 + 32) + 32) hasEngagedWithSuggestion:v3 engagedExecutables:*(void *)(a1 + 40)])
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v7 = 1;
      goto LABEL_8;
    }
    uint64_t v4 = __atxlog_handle_blending();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 executableSpecification];
      uint64_t v6 = [v5 executableDescription];
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_INFO, "recently engaged cache filtered action prediction %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (id)_atxActionFromProactiveSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableClassString];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    int v9 = (void *)MEMORY[0x1AD0D3C30]();
    v10 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v11 = objc_opt_class();
    id v12 = [v3 executableSpecification];
    v13 = [v12 executable];
    id v18 = 0;
    uint64_t v14 = [v10 unarchivedObjectOfClass:v11 fromData:v13 error:&v18];
    id v15 = v18;

    id v16 = 0;
    if (v14 && !v15) {
      id v16 = v14;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)getActionPredictionsForCandidateBundleIdentifiers:(id)a3 candidateActionTypes:(id)a4 consumerType:(unint64_t)a5 consumerSubType:(unsigned __int8)a6 limit:(int)a7 reply:(id)a8
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (+[ATXDeviceClass shouldComputeActions])
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke;
    block[3] = &unk_1E5D05238;
    id v24 = v16;
    block[4] = self;
    id v22 = v14;
    id v23 = v15;
    unint64_t v25 = a5;
    unsigned __int8 v27 = a6;
    int v26 = a7;
    dispatch_async(serialQueue, block);

    id v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29[0] = @"Action predictions not supported on this constrained device class";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v18 = [v19 errorWithDomain:@"ATXActionPredictionClient" code:2 userInfo:v20];

    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v18);
  }
}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2;
  v14[3] = &unk_1E5D05210;
  id v3 = *(id *)(a1 + 56);
  dispatch_semaphore_t v15 = v2;
  id v16 = v3;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v4 = v2;
  uint64_t v5 = (void *)MEMORY[0x1AD0D3E40](v14);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3;
  id v12 = &unk_1E5D04F50;
  id v13 = v5;
  id v7 = v5;
  int v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];
  objc_msgSend(v8, "getActionPredictionsForCandidateBundleIdentifiers:candidateActionTypes:consumerType:consumerSubType:limit:reply:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), v7, v9, v10, v11, v12);

  [MEMORY[0x1E4F93B18] waitForSemaphore:v4 timeoutSeconds:5.0];
}

intptr_t __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = self;
  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeActionPredictionNotificationsMatchingSuggestion:(id)a3 reply:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[ATXDeviceClass shouldComputeActions])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke;
    v13[3] = &unk_1E5D05260;
    v13[4] = self;
    id v14 = v7;
    int v8 = (void *)MEMORY[0x1AD0D3E40](v13);
    uint64_t v9 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_39];
    [v9 removeActionPredictionNotificationsMatchingSuggestion:v6 reply:v8];

    uint64_t v10 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"Action predictions not supported on this constrained device class";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v11 errorWithDomain:@"ATXActionPredictionClient" code:2 userInfo:v12];

    (*((void (**)(id, void *))v7 + 2))(v7, v10);
    goto LABEL_5;
  }
LABEL_6:
}

id __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return self;
}

void __89__ATXActionPredictionClient_removeActionPredictionNotificationsMatchingSuggestion_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();
  }
}

- (void)shouldDisplayDailyRoutineForContext:(id)a3 reply:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[ATXDeviceClass shouldComputeActions])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke;
    v20[3] = &unk_1E5D05288;
    v20[4] = self;
    id v21 = v7;
    int v8 = (void *)MEMORY[0x1AD0D3E40](v20);
    xpcConnection = self->_xpcConnection;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke_2;
    id v18 = &unk_1E5D04F50;
    id v19 = v8;
    id v10 = v8;
    uint64_t v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&v15];
    objc_msgSend(v11, "shouldDisplayDailyRoutineForContext:reply:", v6, v10, v15, v16, v17, v18);

    id v12 = v21;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"Action predictions not supported on this constrained device class";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v12 = [v13 errorWithDomain:@"ATXActionPredictionClient" code:2 userInfo:v14];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

id __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke(uint64_t a1)
{
  return self;
}

void __71__ATXActionPredictionClient_shouldDisplayDailyRoutineForContext_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8 reply:(id)a9
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (+[ATXDeviceClass shouldComputeActions])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke;
    v30[3] = &unk_1E5D052B0;
    v30[4] = self;
    id v31 = v20;
    id v21 = (void *)MEMORY[0x1AD0D3E40](v30);
    xpcConnection = self->_xpcConnection;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2;
    v28[3] = &unk_1E5D04F50;
    id v29 = v21;
    id v23 = v21;
    id v24 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v28];
    [v24 getActionPredictionsForContext:v15 includeBundleIds:v16 excludeBundleIds:v17 includeActionTypes:v18 excludeActionTypes:v19 limit:a8 reply:v23];

    unint64_t v25 = v31;
  }
  else
  {
    int v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    v33[0] = @"Action predictions not supported on this constrained device class";
    unsigned __int8 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    unint64_t v25 = [v26 errorWithDomain:@"ATXActionPredictionClient" code:2 userInfo:v27];

    (*((void (**)(id, void, void *))v20 + 2))(v20, 0, v25);
  }
}

id __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke(uint64_t a1)
{
  return self;
}

void __144__ATXActionPredictionClient_getActionPredictionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_limit_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __51__ATXActionPredictionClient_initWithCacheBasePath___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Connection to Action Prediction inspection server interrupted", v1, 2u);
}

void __141__ATXActionPredictionClient_getActionPredictionsForCandidateBundleIdentifiers_candidateActionTypes_consumerType_consumerSubType_limit_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ERROR: %@", v2, v3, v4, v5, v6);
}

@end