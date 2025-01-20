@interface ATXClient
+ (id)clientForConsumerType:(unint64_t)a3;
+ (id)clientForConsumerType:(unint64_t)a3 cacheBasePath:(id)a4;
+ (id)clientForConsumerType:(unint64_t)a3 cachePath:(const char *)a4;
+ (id)dayZeroBundleIdsAndScoresFromDayZeroParameters:(id)a3;
- (ATXClient)initWithConsumerType:(unint64_t)a3 cacheBasePath:(id)a4;
- (BOOL)forceCacheUpdateForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6;
- (BOOL)shouldPredictAppBundleId:(id)a3;
- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4;
- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5;
- (NSXPCConnection)xpcConnection;
- (id)_asyncProxy;
- (id)_getConnection;
- (id)_minuteZeroResponse;
- (id)_predicateForDenyList:(id)a3;
- (id)_simulatorResponse;
- (id)_syncProxy;
- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 blackList:(id)a4 limit:(int)a5 runningDiagnostics:(BOOL)a6;
- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4;
- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4 personaUID:(id)a5;
- (id)approvedSiriKitIntents;
- (id)atxResponseFromBlendingAppPredictionCacheForConsumerSubType:(unsigned __int8)a3 filterPredicate:(id)a4 limit:(int)a5;
- (id)getAppPredictorAssetMappingDescription;
- (void)dealloc;
- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)logUserFeedback:(id)a3 consumerSubType:(unsigned __int8)a4 engagementType:(unint64_t)a5 bundleIdentifier:(id)a6 bundleIdsShown:(id)a7 explicitlyRejectedIds:(id)a8;
- (void)logUserFeedback:(id)a3 consumerSubType:(unsigned __int8)a4 engagementType:(unint64_t)a5 bundleIdentifier:(id)a6 bundleIdsShown:(id)a7 explicitlyRejectedIds:(id)a8 personaUID:(id)a9;
- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4;
- (void)sortAppsByLaunches:(id)a3 reply:(id)a4;
@end

@implementation ATXClient

+ (id)clientForConsumerType:(unint64_t)a3 cachePath:(const char *)a4
{
  return +[ATXClient clientForConsumerType:](ATXClient, "clientForConsumerType:", a3, a4);
}

+ (id)clientForConsumerType:(unint64_t)a3
{
  v3 = [[ATXClient alloc] initWithConsumerType:a3 cacheBasePath:0];

  return v3;
}

+ (id)clientForConsumerType:(unint64_t)a3 cacheBasePath:(id)a4
{
  id v5 = a4;
  v6 = [[ATXClient alloc] initWithConsumerType:a3 cacheBasePath:v5];

  return v6;
}

- (ATXClient)initWithConsumerType:(unint64_t)a3 cacheBasePath:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXClient;
  v8 = [(ATXClient *)&v15 init];
  if (v8)
  {
    v9 = [[ATXCacheReader alloc] initWithCacheBasePath:v7];
    cacheReader = v8->_cacheReader;
    v8->_cacheReader = v9;

    objc_storeStrong((id *)&v8->_cacheBasePath, a4);
    v8->_consumerType = a3;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.proactive.AppPrediction.client.ATXClientQueue", v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXClient dealloc", v2, v3, v4, v5, v6);
}

- (id)_getConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.AppPrediction.predictions" options:0];
    uint64_t v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    uint8_t v6 = ATXAppPredictionXPCInterface();
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global_37];
    [(NSXPCConnection *)self->_xpcConnection resume];
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __27__ATXClient__getConnection__block_invoke()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __27__ATXClient__getConnection__block_invoke_cold_1();
  }
}

- (id)_asyncProxy
{
  uint64_t v3 = [(ATXClient *)self _getConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__ATXClient__asyncProxy__block_invoke;
  v6[3] = &unk_1E5D06F40;
  v6[4] = self;
  uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

void __24__ATXClient__asyncProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__ATXClient__asyncProxy__block_invoke_cold_1();
  }
}

- (id)_syncProxy
{
  id v2 = [(ATXClient *)self _getConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12_0];

  return v3;
}

void __23__ATXClient__syncProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__ATXClient__asyncProxy__block_invoke_cold_1();
  }
}

- (void)sortAppsByLaunches:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ATXClient *)self _getConnection];
  v8 = [v9 remoteObjectProxy];
  [v8 sortAppsByLaunches:v7 reply:v6];
}

- (id)approvedSiriKitIntents
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  id v2 = [(ATXClient *)self _getConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__ATXClient_approvedSiriKitIntents__block_invoke_15;
  v6[3] = &unk_1E5D07508;
  v6[4] = &v7;
  [v3 approvedSiriKitIntentsWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__ATXClient_approvedSiriKitIntents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1();
  }
}

void __35__ATXClient_approvedSiriKitIntents__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1();
    }
  }
  if ([v6 count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (BOOL)shouldPredictAppBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = [(ATXClient *)self _getConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ATXClient_shouldPredictAppBundleId___block_invoke_19;
  v8[3] = &unk_1E5D07530;
  v8[4] = &v9;
  [v6 shouldPredictAppBundleId:v4 reply:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1();
  }
}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke_19(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4
{
  return [(ATXClient *)self shouldPredictBundleIdForShortcuts:a3 action:a4 forPrimaryShortcuts:0];
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10 = [(ATXClient *)self _getConnection];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22_0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_23;
  v13[3] = &unk_1E5D07530;
  v13[4] = &v14;
  [v11 shouldPredictBundleIdForShortcuts:v8 action:v9 forPrimaryShortcuts:v5 reply:v13];

  LOBYTE(v5) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1();
  }
}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4
{
  return [(ATXClient *)self appPredictionsForConsumerSubType:a3 limit:*(void *)&a4 personaUID:0];
}

- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 limit:(int)a4 personaUID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = a3;
  id v8 = __atxlog_handle_metrics();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = __atxlog_handle_metrics();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ATXSpotlightClient.SuggestedApps", " enableTelemetry=YES ", buf, 2u);
  }

  char v12 = objc_opt_new();
  v13 = [(ATXClient *)self appPredictionsForConsumerSubType:v6 blackList:v12 limit:v5 runningDiagnostics:0];

  uint64_t v14 = __atxlog_handle_metrics();
  objc_super v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)char v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A790D000, v15, OS_SIGNPOST_INTERVAL_END, v9, "ATXSpotlightClient.SuggestedApps", " enableTelemetry=YES ", v17, 2u);
  }

  return v13;
}

- (id)_predicateForDenyList:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__ATXClient__predicateForDenyList___block_invoke;
  v8[3] = &unk_1E5D05B10;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 predicateWithBlock:v8];

  return v6;
}

uint64_t __35__ATXClient__predicateForDenyList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 predictedItem];
  BOOL v5 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:v4];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v3 predictedItem];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)appPredictionsForConsumerSubType:(unsigned __int8)a3 blackList:(id)a4 limit:(int)a5 runningDiagnostics:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v29[0] = 67109378;
    v29[1] = v8;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_INFO, "App predictions for subtype %i deny list: %@", (uint8_t *)v29, 0x12u);
  }

  if (a6)
  {
    char v12 = 0;
  }
  else
  {
    char v12 = [(ATXClient *)self _predicateForDenyList:v10];
  }
  if (v8 != 9)
  {
    v18 = [(ATXCacheReader *)self->_cacheReader readCacheFileForConsumerSubtype:v8];
    if (v18)
    {
      v19 = ATXCacheFileSplitChunks();
      if ([v19 count] == 2)
      {
        v20 = [v19 firstObject];
        v21 = +[ATXPredictionSetReader bundleIdReader:v20];
        v22 = [v21 readScoredPredictionsWithLimit:v7 filterPredicate:v12];
        v23 = [[ATXResponse alloc] initWithPredictions:v22 cacheFileData:v18 error:0];

        if (v23)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
        v25 = __atxlog_handle_default();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29[0]) = 0;
          _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "No chunks returned from cache. (this may be due to a cache file change)", (uint8_t *)v29, 2u);
        }
      }
    }
    v26 = [ATXResponse alloc];
    v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXClient" code:1 userInfo:0];
    v23 = [(ATXResponse *)v26 initWithPredictions:0 cacheFileData:0 error:v27];

    goto LABEL_24;
  }
  v13 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWEnabled", @"com.apple.suggestions");
  if (v13 && (v14 = v13, int v15 = [v13 BOOLValue], v14, !v15))
  {
    v24 = __atxlog_handle_blending();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "Siri setting 'Show Suggestions' turned off. -[ATXClient appPredictionsForConsumerSubType:blackList:limit:runningDiagnostics:] to return an empty ATXResponse", (uint8_t *)v29, 2u);
    }

    char v17 = [[ATXResponse alloc] initWithPredictions:0 cacheFileData:0 error:0];
  }
  else
  {
    uint64_t v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "Blending providing suggestions to ATXConsumerSubTypeSpotlightUnknown inside ATXClient...", (uint8_t *)v29, 2u);
    }

    char v17 = [(ATXClient *)self atxResponseFromBlendingAppPredictionCacheForConsumerSubType:9 filterPredicate:v12 limit:v7];
  }
  v23 = v17;
LABEL_25:

  return v23;
}

- (id)atxResponseFromBlendingAppPredictionCacheForConsumerSubType:(unsigned __int8)a3 filterPredicate:(id)a4 limit:(int)a5
{
  uint64_t v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [[ATXProactiveSuggestionClient alloc] initWithConsumerSubType:v6];
  id v10 = [(ATXProactiveSuggestionClient *)v9 suggestionLayoutFromCache];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    char v12 = objc_opt_new();
    v13 = [v10 allSuggestionsInLayout];
    uint64_t v14 = __atxlog_handle_blending();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v13 count];
      _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "Blending retrieved a layout with %lu bundleIds in it.", (uint8_t *)&buf, 0xCu);
    }

    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    int v32 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8;
    v38 = __Block_byref_object_dispose__8;
    id v39 = v8;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke;
    v25[3] = &unk_1E5D07558;
    int v30 = a5;
    v28 = v31;
    p_long long buf = &buf;
    id v15 = v11;
    id v26 = v15;
    id v16 = v12;
    id v27 = v16;
    [v13 enumerateObjectsUsingBlock:v25];
    char v17 = __atxlog_handle_blending();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v15 count];
      *(_DWORD *)v33 = 134217984;
      uint64_t v34 = v18;
      _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, "Blending created an ATXResponse that has %lu bundleIds in it.", v33, 0xCu);
    }

    v19 = [ATXResponse alloc];
    v20 = objc_opt_new();
    v21 = [v10 uuid];
    v22 = [(ATXResponse *)v19 initWithPredictions:v15 proactiveSuggestions:v16 uuid:v20 cacheFileData:0 blendingUICacheUpdateUUID:v21 error:0];

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    v23 = __atxlog_handle_blending();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "There was no cached suggestion layout, falling back to minute zero response", (uint8_t *)&buf, 2u);
    }

    v22 = [(ATXClient *)self _minuteZeroResponse];
  }

  return v22;
}

void __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = v6;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 64))
  {
    *a4 = 1;
  }
  else
  {
    id v8 = [v6 executableSpecification];
    id v9 = [v8 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [ATXScoredPrediction alloc];
      uint64_t v11 = [v7 scoreSpecification];
      [v11 rawScore];
      *(float *)&double v12 = v12;
      v13 = [(ATXScoredPrediction *)v10 initWithPredictedItem:v9 score:v12];

      if (v13
        && ((uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) == 0
         || [v14 evaluateWithObject:v13]))
      {
        [*(id *)(a1 + 32) addObject:v13];
        [*(id *)(a1 + 40) addObject:v7];
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      else
      {
        id v15 = __atxlog_handle_blending();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          char v17 = v9;
          _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_INFO, "%@ did not pass app prediction deny list filters", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    else
    {
      v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke_cold_1();
      }
    }
  }
}

- (void)logUserFeedback:(id)a3 consumerSubType:(unsigned __int8)a4 engagementType:(unint64_t)a5 bundleIdentifier:(id)a6 bundleIdsShown:(id)a7 explicitlyRejectedIds:(id)a8
{
}

- (void)logUserFeedback:(id)a3 consumerSubType:(unsigned __int8)a4 engagementType:(unint64_t)a5 bundleIdentifier:(id)a6 bundleIdsShown:(id)a7 explicitlyRejectedIds:(id)a8 personaUID:(id)a9
{
  uint64_t v13 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = __atxlog_handle_default();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

  if (v20)
  {
    unint64_t v33 = a5;
    v21 = objc_opt_new();
    if ([v17 count])
    {
      unint64_t v22 = 0;
      do
      {
        if (v22) {
          [v21 appendString:@", "];
        }
        v23 = [v17 objectAtIndexedSubscript:v22];
        [v21 appendString:v23];

        ++v22;
      }
      while ([v17 count] > v22);
    }
    v24 = __atxlog_handle_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      int v32 = [MEMORY[0x1E4F4B680] stringForConsumerType:self->_consumerType];
      int v30 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v13];
      [MEMORY[0x1E4F4B680] stringForEngagementType:v33];
      *(_DWORD *)long long buf = 138413570;
      v42 = v32;
      __int16 v43 = 2112;
      id v44 = v15;
      __int16 v45 = 2112;
      v46 = v30;
      v48 = __int16 v47 = 2112;
      id v31 = (void *)v48;
      __int16 v49 = 2112;
      id v50 = v16;
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_debug_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEBUG, "sending feedback for\n  consumerType:%@\n  atxResponse: ***(%@)***\n  consumerSubType:%@\n  engagementType:%@\n  bundleIdentifier:%@\n  bundleIdsShown:%@", buf, 0x3Eu);
    }
    a5 = v33;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds_personaUID___block_invoke;
  block[3] = &unk_1E5D075A0;
  char v40 = v13;
  block[4] = self;
  id v35 = v15;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  unint64_t v39 = a5;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async(queue, block);
}

void __125__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds_personaUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _asyncProxy];
  [v2 sendFeedbackForConsumerType:*(void *)(*(void *)(a1 + 32) + 24) consumerSubType:*(unsigned __int8 *)(a1 + 80) atxResponse:*(void *)(a1 + 40) engagementType:*(void *)(a1 + 72) engagedBundleId:*(void *)(a1 + 48) bundleIdsShown:*(void *)(a1 + 56) explicitlyRejectedBundleIds:*(void *)(a1 + 64) reply:&__block_literal_global_47_0];
}

void __125__ATXClient_logUserFeedback_consumerSubType_engagementType_bundleIdentifier_bundleIdsShown_explicitlyRejectedIds_personaUID___block_invoke_2(uint64_t a1, int a2)
{
  id v3 = __atxlog_handle_default();
  id v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = 0;
      BOOL v5 = "ATXClient logUserFeedback -- server returned SUCCESS";
      id v6 = (uint8_t *)&v10;
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A790D000, v7, v8, v5, v6, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = 0;
    BOOL v5 = "ATXClient logUserFeedback -- server returned FAILURE";
    id v6 = (uint8_t *)&v9;
    uint64_t v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }
}

- (BOOL)forceCacheUpdateForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke;
  v18[3] = &unk_1E5D075F0;
  unsigned __int8 v23 = a3;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  unint64_t v22 = &v24;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(queue, v18);
  LOBYTE(queue) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)queue;
}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _syncProxy];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2;
  v7[3] = &unk_1E5D075C8;
  uint64_t v6 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 64);
  [v2 generateNewAppPredictionsForConsumerSubType:v3 intent:v4 candidateBundleIdentifiers:v5 candidateIntentTypeIdentifiers:v6 reply:v7];
}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v3 = __atxlog_handle_default();
  uint64_t v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "ATXClient forceCacheUpdate -- server returned FAILURE", v5, 2u);
  }
}

- (id)getAppPredictorAssetMappingDescription
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = &stru_1EFD9B408;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke;
  v5[3] = &unk_1E5D06540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _syncProxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2;
  v3[3] = &unk_1E5D07618;
  v3[4] = *(void *)(a1 + 40);
  [v2 getAppPredictorAssetMappingDescriptionWithReply:v3];
}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = __atxlog_handle_default();
  uint64_t v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2_cold_1();
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = v5;
    uint64_t v7 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXClient getAppPredictorAssetMappingDescription -- server returned FAILURE", v10, 2u);
  }
}

- (id)_simulatorResponse
{
  v42[11] = *MEMORY[0x1E4F143B8];
  id v2 = [ATXScoredPrediction alloc];
  LODWORD(v3) = 11.0;
  char v40 = [(ATXScoredPrediction *)v2 initWithPredictedItem:@"com.apple.reminders" score:v3];
  v42[0] = v40;
  uint64_t v4 = [ATXScoredPrediction alloc];
  LODWORD(v5) = 10.0;
  unint64_t v39 = [(ATXScoredPrediction *)v4 initWithPredictedItem:@"com.apple.news" score:v5];
  v42[1] = v39;
  uint64_t v6 = [ATXScoredPrediction alloc];
  LODWORD(v7) = 9.0;
  uint64_t v8 = [(ATXScoredPrediction *)v6 initWithPredictedItem:@"com.apple.mobilecal" score:v7];
  v42[2] = v8;
  id v9 = [ATXScoredPrediction alloc];
  LODWORD(v10) = 8.0;
  id v11 = [(ATXScoredPrediction *)v9 initWithPredictedItem:@"com.apple.shortcuts" score:v10];
  v42[3] = v11;
  id v12 = [ATXScoredPrediction alloc];
  LODWORD(v13) = 7.0;
  id v14 = [(ATXScoredPrediction *)v12 initWithPredictedItem:@"com.apple.MobileSMS" score:v13];
  v42[4] = v14;
  id v15 = [ATXScoredPrediction alloc];
  LODWORD(v16) = 6.0;
  id v17 = [(ATXScoredPrediction *)v15 initWithPredictedItem:@"com.apple.mobileslideshow" score:v16];
  v42[5] = v17;
  id v18 = [ATXScoredPrediction alloc];
  LODWORD(v19) = 5.0;
  id v20 = [(ATXScoredPrediction *)v18 initWithPredictedItem:@"com.apple.mobilesafari" score:v19];
  v42[6] = v20;
  id v21 = [ATXScoredPrediction alloc];
  LODWORD(v22) = 4.0;
  unsigned __int8 v23 = [(ATXScoredPrediction *)v21 initWithPredictedItem:@"com.apple.MobileAddressBook" score:v22];
  v42[7] = v23;
  uint64_t v24 = [ATXScoredPrediction alloc];
  LODWORD(v25) = 3.0;
  uint64_t v26 = [(ATXScoredPrediction *)v24 initWithPredictedItem:@"com.apple.reminders" score:v25];
  v42[8] = v26;
  char v27 = [ATXScoredPrediction alloc];
  LODWORD(v28) = 2.0;
  id v29 = [(ATXScoredPrediction *)v27 initWithPredictedItem:@"com.apple.Maps" score:v28];
  v42[9] = v29;
  int v30 = [ATXScoredPrediction alloc];
  LODWORD(v31) = 1.0;
  int v32 = [(ATXScoredPrediction *)v30 initWithPredictedItem:@"com.apple.Preferences" score:v31];
  v42[10] = v32;
  unint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:11];

  uint64_t v34 = objc_opt_new();
  id v35 = [(ATXClient *)self _predicateForDenyList:v34];
  id v36 = [v33 filteredArrayUsingPredicate:v35];

  id v37 = [[ATXResponse alloc] initWithPredictions:v36 cacheFileData:0 error:0];

  return v37;
}

+ (id)dayZeroBundleIdsAndScoresFromDayZeroParameters:(id)a3
{
  double v3 = [a3 objectForKeyedSubscript:@"dayZero"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"dayZeroBumps"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[ATXClient dayZeroBundleIdsAndScoresFromDayZeroParameters:]();
    }

    id v5 = (id)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)_minuteZeroResponse
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = [[ATXAssetsABHelper alloc] initWithAssetsForResource:@"_ATXAppPredictorDayZero" ofType:@"plist" specifiedABGroup:0];
  double v25 = [(ATXAssetsABHelper *)v26 abGroupContents];
  id v2 = [(id)objc_opt_class() dayZeroBundleIdsAndScoresFromDayZeroParameters:v25];
  double v3 = [v2 allKeys];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __32__ATXClient__minuteZeroResponse__block_invoke;
  v33[3] = &unk_1E5D062D0;
  id v23 = v2;
  uint64_t v24 = v3;
  id v34 = v23;
  uint64_t v4 = [v3 sortedArrayUsingComparator:v33];
  double v28 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:@"app_zkw_minute_zero" clientModelVersion:@"1.0"];
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v10 executableDescription:v10 executableIdentifier:v10 suggestionExecutableType:1];
        id v13 = objc_alloc(MEMORY[0x1E4F93978]);
        LOWORD(v22) = 1;
        id v14 = objc_msgSend(v13, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v10, 0, 0, MEMORY[0x1E4F1CBF0], 0, 0, v22);
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:2 suggestedConfidenceCategory:0.0];
        double v16 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v11 executableSpecification:v12 uiSpecification:v14 scoreSpecification:v15];
        [v28 addObject:v16];
        id v17 = [[ATXScoredPrediction alloc] initWithPredictedItem:v10 score:0.0];
        [v5 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  id v18 = [ATXResponse alloc];
  double v19 = objc_opt_new();
  id v20 = [(ATXResponse *)v18 initWithPredictions:v5 proactiveSuggestions:v28 uuid:v19 cacheFileData:0 blendingUICacheUpdateUUID:0 error:0];

  return v20;
}

uint64_t __32__ATXClient__minuteZeroResponse__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v8 compare:v7];
  return v9;
}

- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [(ATXClient *)self _getConnection];
  uint64_t v10 = [v11 remoteObjectProxy];
  [v10 getWebsitePredictionsForContextType:v9 limit:a4 reply:v8];
}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ATXClient *)self _getConnection];
  id v8 = [v9 remoteObjectProxy];
  [v8 overwriteWebsitePredictionsCacheWithWebsiteString:v7 contextType:v6];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __27__ATXClient__getConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Connection to App Prediction server interrupted", v1, 2u);
}

void __24__ATXClient__asyncProxy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "ATXClient XPC error: %@", v2, v3, v4, v5, v6);
}

void __35__ATXClient_approvedSiriKitIntents__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not obtain SiriKit intents: %@", v2, v3, v4, v5, v6);
}

void __38__ATXClient_shouldPredictAppBundleId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not evaluate app prediction eligibility: %@", v2, v3, v4, v5, v6);
}

void __74__ATXClient_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not evaluate action prediction eligibility: %@", v2, v3, v4, v5, v6);
}

void __95__ATXClient_atxResponseFromBlendingAppPredictionCacheForConsumerSubType_filterPredicate_limit___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A790D000, v0, OS_LOG_TYPE_FAULT, "Could not unarchive executable object from app prediction cache", v1, 2u);
}

void __113__ATXClient_forceCacheUpdateForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXClient forceCacheUpdate -- server returned SUCCESS", v2, v3, v4, v5, v6);
}

void __51__ATXClient_getAppPredictorAssetMappingDescription__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "ATXClient getAppPredictorAssetMappingDescription -- server returned SUCCESS", v2, v3, v4, v5, v6);
}

+ (void)dayZeroBundleIdsAndScoresFromDayZeroParameters:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A790D000, v0, OS_LOG_TYPE_FAULT, "Day zero scores could not be loaded", v1, 2u);
}

@end