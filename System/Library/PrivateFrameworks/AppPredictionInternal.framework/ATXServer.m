@interface ATXServer
+ (id)consumerSubTypesToUpdate;
+ (id)sharedInstance;
- (ATXServer)initWithCacheFileBasePath:(id)a3 machServiceName:(id)a4 predictionContextBuilder:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)syncGenerateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7;
- (BOOL)updateAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4;
- (id)consumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5;
- (void)approvedSiriKitIntentsWithReply:(id)a3;
- (void)dealloc;
- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7 reply:(id)a8;
- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 reply:(id)a7;
- (void)getAppPredictorAssetMappingDescriptionWithReply:(id)a3;
- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4;
- (void)sendFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 reply:(id)a10;
- (void)shouldPredictAppBundleId:(id)a3 reply:(id)a4;
- (void)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5 reply:(id)a6;
- (void)sortAppsByLaunches:(id)a3 reply:(id)a4;
- (void)updateBlendingLayerForAllConsumerSubTypes;
@end

@implementation ATXServer

- (ATXServer)initWithCacheFileBasePath:(id)a3 machServiceName:(id)a4 predictionContextBuilder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXServer;
  v12 = [(ATXServer *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cacheFileBasePath, a3);
    objc_storeStrong((id *)&v13->_machServiceName, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.proactive.AppPrediction.ATXServer.queue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_contextBuilder, a5);
    if (v13->_machServiceName)
    {
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v13->_machServiceName];
      listener = v13->_listener;
      v13->_listener = (NSXPCListener *)v17;

      [(NSXPCListener *)v13->_listener setDelegate:v13];
      [(NSXPCListener *)v13->_listener resume];
    }
    uint64_t v19 = objc_opt_new();
    cacheFileDescriptors = v13->_cacheFileDescriptors;
    v13->_cacheFileDescriptors = (NSMutableDictionary *)v19;
  }
  return v13;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_187);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

void __27__ATXServer_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v2 = [v1 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  v3 = [v2 stringByDeletingLastPathComponent];
  [v0 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  v4 = [ATXServer alloc];
  id v10 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v5 = [v10 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  uint64_t v6 = *MEMORY[0x1E4F4B458];
  v7 = +[ATXPredictionContextBuilder sharedInstance];
  uint64_t v8 = [(ATXServer *)v4 initWithCacheFileBasePath:v5 machServiceName:v6 predictionContextBuilder:v7];
  id v9 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v8;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__ATXServer_dealloc__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXServer;
  [(ATXServer *)&v4 dealloc];
}

void __20__ATXServer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) intValue];
        if ((v7 & 0x80000000) == 0) {
          close(v7);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)syncGenerateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = +[_ATXAppPredictor sharedInstance];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __139__ATXServer_syncGenerateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache___block_invoke;
  v24[3] = &unk_1E68B4528;
  unsigned __int8 v31 = a3;
  v24[4] = self;
  id v25 = v16;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  v30 = &v32;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  dispatch_sync(queue, v24);
  LOBYTE(self) = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return (char)self;
}

void __139__ATXServer_syncGenerateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  uint64_t v3 = [v2 getFullCachePathWithBaseCachePath:*(void *)(*(void *)(a1 + 32) + 8) consumerSubType:*(unsigned __int8 *)(a1 + 88)];

  int v4 = [*(id *)(a1 + 40) predictAndWriteCacheFileWithLimit:0x7FFFFFFFLL consumerSubType:*(unsigned __int8 *)(a1 + 88) intent:*(void *)(a1 + 48) candidateBundleIdentifiers:*(void *)(a1 + 56) candidateActiontypes:*(void *)(a1 + 64) scoreLogger:0 path:v3 cacheFileDescriptors:*(void *)(*(void *)(a1 + 32) + 40) featureCache:*(void *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v4;
  uint64_t v5 = __atxlog_handle_default();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 88)];
      *(_DWORD *)buf = 138412546;
      long long v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      long long v8 = "Updating App Predictions: Finished app prediction refresh for %@ and writing cache to %@.";
LABEL_6:
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);
    }
  }
  else if (v6)
  {
    int v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 88)];
    *(_DWORD *)buf = 138412546;
    long long v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    long long v8 = "Updating App Predictions: App prediction refresh for %@ encountered issues writing cache to %@.";
    goto LABEL_6;
  }
}

- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 featureCache:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = +[_ATXAppPredictor sharedInstance];
  queue = self->_queue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __141__ATXServer_generateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache_reply___block_invoke;
  v27[3] = &unk_1E68B4550;
  unsigned __int8 v34 = a3;
  v27[4] = self;
  id v28 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  id v26 = v19;
  dispatch_async(queue, v27);
}

void __141__ATXServer_generateNewAppPredictionsForConsumerSubType_intent_candidateBundleIdentifiers_candidateIntentTypeIdentifiers_featureCache_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  uint64_t v3 = [v2 getFullCachePathWithBaseCachePath:*(void *)(*(void *)(a1 + 32) + 8) consumerSubType:*(unsigned __int8 *)(a1 + 88)];

  LODWORD(v2) = [*(id *)(a1 + 40) predictAndWriteCacheFileWithLimit:0x7FFFFFFFLL consumerSubType:*(unsigned __int8 *)(a1 + 88) intent:*(void *)(a1 + 48) candidateBundleIdentifiers:*(void *)(a1 + 56) candidateActiontypes:*(void *)(a1 + 64) scoreLogger:0 path:v3 cacheFileDescriptors:*(void *)(*(void *)(a1 + 32) + 40) featureCache:*(void *)(a1 + 72)];
  int v4 = __atxlog_handle_default();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 88)];
      *(_DWORD *)buf = 138412546;
      long long v9 = v6;
      __int16 v10 = 2112;
      __int16 v11 = v3;
      int v7 = "Updating App Predictions: Finished app prediction refresh for %@ and writing cache to %@.";
LABEL_6:
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
    }
  }
  else if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 88)];
    *(_DWORD *)buf = 138412546;
    long long v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = v3;
    int v7 = "Updating App Predictions: App prediction refresh for %@ encountered issues writing cache to %@.";
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)generateNewAppPredictionsForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 candidateIntentTypeIdentifiers:(id)a6 reply:(id)a7
{
}

- (void)updateBlendingLayerForAllConsumerSubTypes
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [&unk_1F27F3780 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(&unk_1F27F3780);
        }
        +[ATXAppBlendingUpdater updateBlendingLayerForConsumerSubType:](ATXAppBlendingUpdater, "updateBlendingLayerForConsumerSubType:", [*(id *)(*((void *)&v6 + 1) + 8 * v5++) unsignedIntValue]);
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F3780 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)consumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  id v8 = a4;
  long long v9 = [(id)objc_opt_class() consumerSubTypesToUpdate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __131__ATXServer_consumerSubTypesToUpdateWithRefreshRate_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke;
  v13[3] = &unk_1E68B4578;
  double v16 = a3;
  BOOL v17 = a5;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  uint64_t v11 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", v13);

  return v11;
}

BOOL __131__ATXServer_consumerSubTypesToUpdateWithRefreshRate_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 unsignedIntegerValue];
  double v4 = *(double *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    long long v6 = [NSNumber numberWithUnsignedChar:v3];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      long long v7 = +[_ATXGlobals sharedInstance];
      [v7 cacheRefreshIntervalForDisabledAppConsumerSubType];
      double v4 = v8;
    }
  }
  long long v9 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  id v10 = [v9 getFullCachePathWithBaseCachePath:*(void *)(*(void *)(a1 + 40) + 8) consumerSubType:v3];

  BOOL v11 = +[ATXFileUtil shouldUpdateCache:v10 withRefreshRate:v4];
  return v11;
}

- (BOOL)updateAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  sel_getName(a2);
  long long v9 = (void *)os_transaction_create();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    int v14 = 1;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        double v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        BOOL v17 = (void *)MEMORY[0x1D25F6CC0](v11);
        v14 &= -[ATXServer syncGenerateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:](self, "syncGenerateNewAppPredictionsForConsumerSubType:intent:candidateBundleIdentifiers:candidateIntentTypeIdentifiers:featureCache:", objc_msgSend(v16, "unsignedIntegerValue", (void)v19), 0, 0, 0, v8);
        ++v15;
      }
      while (v12 != v15);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

+ (id)consumerSubTypesToUpdate
{
  if (consumerSubTypesToUpdate_onceToken != -1) {
    dispatch_once(&consumerSubTypesToUpdate_onceToken, &__block_literal_global_39_0);
  }
  uint64_t v2 = (void *)consumerSubTypesToUpdate_consumerSubTypesToUpdate;
  return v2;
}

void __37__ATXServer_consumerSubTypesToUpdate__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25F6CC0]();
  v0 = objc_opt_new();
  v1 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [&unk_1F27F3798 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(&unk_1F27F3798);
        }
        long long v6 = *(void **)(*((void *)&v12 + 1) + 8 * v5);
        id v7 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
        id v8 = objc_msgSend(v7, "getAssetFileAndSubscoreForConsumerSubType:", objc_msgSend(v6, "intValue"));

        if (([v0 containsObject:v8] & 1) == 0)
        {
          [v1 addObject:v6];
          [v0 addObject:v8];
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F3798 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
  uint64_t v9 = [v1 copy];
  id v10 = (void *)consumerSubTypesToUpdate_consumerSubTypesToUpdate;
  consumerSubTypesToUpdate_consumerSubTypesToUpdate = v9;
}

- (void)sendFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 reply:(id)a10
{
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (__atx_xpc_private_queue_get_onceToken != -1) {
    dispatch_once(&__atx_xpc_private_queue_get_onceToken, &__block_literal_global_176_0);
  }
  long long v21 = __atx_xpc_private_queue_get_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke;
  block[3] = &unk_1E68B45A0;
  unsigned __int8 v36 = a4;
  id v28 = v18;
  id v29 = v16;
  unint64_t v34 = a3;
  unint64_t v35 = a6;
  id v30 = v17;
  id v31 = self;
  id v32 = v19;
  id v33 = v20;
  id v22 = v19;
  id v23 = v20;
  id v24 = v17;
  id v25 = v16;
  id v26 = v18;
  dispatch_async(v21, block);
}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_xpc();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = __atxlog_handle_xpc();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "sendFeedbackForConsumerType", " enableTelemetry=YES ", buf, 2u);
  }

  long long v6 = __atxlog_handle_default();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    id v8 = objc_opt_new();
    if ([*(id *)(a1 + 32) count])
    {
      unint64_t v9 = 0;
      do
      {
        if (v9) {
          [v8 appendString:@", "];
        }
        id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v9];
        [v8 appendString:v10];

        ++v9;
      }
      while ([*(id *)(a1 + 32) count] > v9);
    }
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_2(a1, (uint64_t)v8, v11);
    }
  }
  long long v12 = [*(id *)(*(void *)(a1 + 56) + 48) predictionContextForCurrentContext];
  if (v12)
  {
    long long v13 = +[_ATXAppPredictor sharedInstance];
    [v13 receiveFeedbackForConsumerType:*(void *)(a1 + 80) consumerSubType:*(unsigned __int8 *)(a1 + 96) atxResponse:*(void *)(a1 + 40) engagementType:*(void *)(a1 + 88) engagedBundleId:*(void *)(a1 + 48) bundleIdsShown:*(void *)(a1 + 32) explicitlyRejectedBundleIds:*(void *)(a1 + 64) context:v12];

    long long v14 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    long long v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_1(v15);
    }

    long long v14 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  v14();
  id v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v17, OS_SIGNPOST_INTERVAL_END, v3, "sendFeedbackForConsumerType", " enableTelemetry=YES ", v18, 2u);
  }
}

- (void)getAppPredictorAssetMappingDescriptionWithReply:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4AEE8];
  id v5 = a3;
  id v7 = [v4 sharedInstanceWithMobileAssets];
  long long v6 = [v7 getAtxToolDescription];
  (*((void (**)(id, void *, uint64_t))a3 + 2))(v5, v6, 1);
}

- (void)sortAppsByLaunches:(id)a3 reply:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = (void (**)(id, id))a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v6[2](v6, v5);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v20 = +[_ATXAppLaunchHistogramManager sharedInstance];
    id v8 = [v20 histogramForLaunchType:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v14 = NSNumber;
          uint64_t v28 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = v28;
          long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          [v8 totalLaunchesForBundleIds:v15];
          id v16 = objc_msgSend(v14, "numberWithDouble:");
          [v7 setObject:v16 forKeyedSubscript:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    id v17 = [v7 allKeys];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__ATXServer_sortAppsByLaunches_reply___block_invoke;
    v22[3] = &unk_1E68ACBF8;
    id v23 = v7;
    id v18 = v7;
    id v19 = [v17 sortedArrayUsingComparator:v22];

    v6[2](v6, v19);
  }
}

uint64_t __38__ATXServer_sortAppsByLaunches_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  [v10 doubleValue];
  if (v9 <= v11) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)approvedSiriKitIntentsWithReply:(id)a3
{
  id v4 = a3;
  id v6 = +[_ATXGlobals sharedInstance];
  id v5 = [v6 approvedSiriKitIntents];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)shouldPredictAppBundleId:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = +[ATXAppPredictionBlacklist sharedInstance];
  double v8 = [v10 disabledBundleIds];
  int v9 = [v8 containsObject:v7];

  (*((void (**)(id, void, void))a4 + 2))(v6, v9 ^ 1u, 0);
}

- (void)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, void))a6;
  id v9 = a4;
  id v10 = a3;
  double v11 = +[ATXActionPredictionBlacklist sharedInstanceWithoutAppPredictionBlacklist];
  uint64_t v12 = [v11 shouldPredictBundleIdForShortcuts:v10 action:v9 forPrimaryShortcuts:v6];

  v13[2](v13, v12, 0);
}

- (void)getWebsitePredictionsForContextType:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = [v9 websitePredictionsForContextType:v8 limit:a4];

  v7[2](v7, v10);
}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 overwriteWebsitePredictionsCacheWithWebsiteString:v6 contextType:v5];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F4B458];
  id v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F4B458]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    id v8 = ATXAppPredictionXPCInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_73_0];
    [v5 setInvalidationHandler:&__block_literal_global_76_2];
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v6, v10);
    }

    BOOL v9 = 0;
  }

  return v9;
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_74()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_74_cold_1(v0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextBuilder, 0);
  objc_storeStrong((id *)&self->_cacheFileDescriptors, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_cacheFileBasePath, 0);
}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Unable to process sendFeedbackForConsumerType because ATXPredictionContext is nil", v1, 2u);
}

void __149__ATXServer_sendFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_reply___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [MEMORY[0x1E4F4B680] stringForConsumerType:*(void *)(a1 + 80)];
  id v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 96)];
  uint64_t v8 = *(void *)(a1 + 40);
  BOOL v9 = [MEMORY[0x1E4F4B680] stringForEngagementType:*(void *)(a1 + 88)];
  uint64_t v10 = *(void *)(a1 + 48);
  int v11 = 138413570;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  long long v14 = v7;
  __int16 v15 = 2112;
  uint64_t v16 = v8;
  __int16 v17 = 2112;
  id v18 = v9;
  __int16 v19 = 2112;
  uint64_t v20 = v10;
  __int16 v21 = 2112;
  uint64_t v22 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "Feedback received:\n  consumerType: %@\n  consumerSubType: %@\n  atxResponse: %@\n  engagementType: %@\n  engagedBundleId: %@\n  itemsShown: %@\n", (uint8_t *)&v11, 0x3Eu);
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Unexpected interruption on App Prediction ATXServer XPC interface", v1, 2u);
}

void __48__ATXServer_listener_shouldAcceptNewConnection___block_invoke_74_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Connection invalidated on App Prediction ATXServer XPC interface. Client went away.", v1, 2u);
}

@end