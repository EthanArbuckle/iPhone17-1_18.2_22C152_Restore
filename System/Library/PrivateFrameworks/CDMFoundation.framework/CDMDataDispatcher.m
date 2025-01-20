@interface CDMDataDispatcher
+ (void)dispatchCdmPreprocessingWrapperData:(id)a3 requestId:(id)a4;
+ (void)dispatchCdmRequestData:(id)a3 requestId:(id)a4 withCurrentServiceGraph:(id)a5 dataDispatcherContext:(id)a6;
+ (void)dispatchCdmResponseData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchContextUpdateData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchCorrectedUtteranceTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchCurrentTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchLVCData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchMDData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchMRData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchNLv4Data:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchPSCData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchPreviousTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchSELFRequestLink:(id)a3 dataDispatcherContext:(id)a4;
+ (void)dispatchSNLCData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)dispatchServiceSetupMetrics:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchSpanizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5;
+ (void)dispatchUaaPData:(id)a3 withResponse:(id)a4 requestId:(id)a5;
+ (void)insertFeatureStore:(id)a3 requester:(id)a4 debugLog:(id)a5;
+ (void)waitForQueueCompletion;
@end

@implementation CDMDataDispatcher

+ (void)dispatchServiceSetupMetrics:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM service setup metrics data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__331;
  v25 = __Block_byref_object_dispose__332;
  id v26 = [v7 allValues];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__331;
  v18[4] = __Block_byref_object_dispose__332;
  id v11 = v8;
  id v19 = v11;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__331;
  v16[4] = __Block_byref_object_dispose__332;
  id v12 = v9;
  id v17 = v12;
  v13 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CDMDataDispatcher_dispatchServiceSetupMetrics_selfMetadata_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  block[4] = &buf;
  block[5] = v18;
  block[6] = v16;
  dispatch_async(v13, block);

  v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v20 = 136315138;
    v21 = "+[CDMDataDispatcher dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM service setup metrics data for SELF asynchronously.", v20, 0xCu);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&buf, 8);
}

void __84__CDMDataDispatcher_dispatchServiceSetupMetrics_selfMetadata_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmServiceSetupMetricsData", buf, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263F6E5E0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(*(void *)(a1[4] + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addSetupMetrics:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F6E5F8]);
  [v11 setCdmServiceSetupMetricsReported:v5];
  [v11 setEventMetadata:*(void *)(*(void *)(a1[5] + 8) + 40)];
  id v12 = objc_alloc_init(MEMORY[0x263F71F40]);
  [v12 setMainEvent:v11];
  +[CDMSELFLogUtil emitEventsFromContainer:v12 mainEventLogMessage:@"Emitting CDMServiceSetupMetricsReported event" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];
  v13 = (id)CDMLogContext;
  v14 = v13;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", buf, 2u);
  }
}

+ (void)dispatchUaaPData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch UaaP data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__331;
  v29 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v30 = v11;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__331;
  v24[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v25 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke;
  block[3] = &unk_2647A4C50;
  block[4] = &buf;
  block[5] = v24;
  dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v14 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  dispatch_async(v14, v13);

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    long long v15 = [v9 idA];
  }
  else
  {
    long long v15 = 0;
  }
  id v22 = v15;
  long long v16 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  long long v17 = v16;
  if (v16)
  {
    long long v18 = [v16 targetName];
  }
  else
  {
    long long v18 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke_423;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v21;
  aBlock[6] = v24;
  id v19 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v19 requester:v18 debugLog:@"CDMDataDispatcher dispatched UaaP data for FeatureStore asynchronously."];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&buf, 8);
}

void __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of UaaP data to disk", buf, 0xCu);
    }

    v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) parserRequest];
    id v12 = 0;
    v4 = +[CDMNluLogUtil writeUaaPRequestToDisk:v3 error:&v12];
    id v5 = v12;

    if (!v4)
    {
      id v6 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging UaaP request to file: %@", buf, 0x16u);
      }
    }
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) parserResponse];
    id v11 = 0;
    id v8 = +[CDMNluLogUtil writeUaaPResponseToDisk:v7 error:&v11];
    id v9 = v11;

    if (!v8)
    {
      v10 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        v14 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging UaaP response to file: %@", buf, 0x16u);
      }
    }
  }
}

void __61__CDMDataDispatcher_dispatchUaaPData_withResponse_requestId___block_invoke_423(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of UaaP data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertUaaPDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) parserRequest];
  +[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) parserResponse];
  +[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:v7 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v10, 2u);
  }
}

+ (void)dispatchMRData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch mentionResolver data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    dispatch_block_t v13 = [v9 idA];
  }
  else
  {
    dispatch_block_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDMDataDispatcher_dispatchMRData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched mentionResolver data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __59__CDMDataDispatcher_dispatchMRData_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    id v12 = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of MR data to FeatureStore", (uint8_t *)&v11, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertMRDataToFeatureStore", (uint8_t *)&v11, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) mrRequest];
  +[CDMFeatureStoreUtils insertMRRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) response];

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) response];
    +[CDMFeatureStoreUtils insertMRResponseToFeatureStore:v8 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];
  }
  else
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315138;
      id v12 = "+[CDMDataDispatcher dispatchMRData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s MR Service predicts nil response, no need to dispatch MRResponse", (uint8_t *)&v11, 0xCu);
    }
  }

  id v9 = (id)CDMLogContext;
  int v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v10, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v11, 2u);
  }
}

+ (void)dispatchMDData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch mentionDetector data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    uint64_t v13 = [v9 idA];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDMDataDispatcher_dispatchMDData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched mentionDetector data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __59__CDMDataDispatcher_dispatchMDData_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    id v12 = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of MD data to FeatureStore", (uint8_t *)&v11, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertMDDataToFeatureStore", (uint8_t *)&v11, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) mdRequest];
  +[CDMFeatureStoreUtils insertMDRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) response];

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) response];
    +[CDMFeatureStoreUtils insertMDResponseToFeatureStore:v8 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];
  }
  else
  {
    id v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315138;
      id v12 = "+[CDMDataDispatcher dispatchMDData:withResponse:requestId:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s MD Service predicts nil response, no need to dispatch MDResponse", (uint8_t *)&v11, 0xCu);
    }
  }

  id v9 = (id)CDMLogContext;
  int v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v10, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v11, 2u);
  }
}

+ (void)dispatchLVCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchLVCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch LVC data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    uint64_t v13 = [v9 idA];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CDMDataDispatcher_dispatchLVCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched LVC data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __60__CDMDataDispatcher_dispatchLVCData_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMDataDispatcher dispatchLVCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of LVC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertLVCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) parserRequest];
  +[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) itfmResponse];
  +[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:v7 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v10, 2u);
  }
}

+ (void)dispatchPSCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchPSCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch PSC data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    uint64_t v13 = [v9 idA];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CDMDataDispatcher_dispatchPSCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched PSC data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __60__CDMDataDispatcher_dispatchPSCData_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMDataDispatcher dispatchPSCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of PSC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertPSCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) parserRequest];
  +[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) pscResponse];
  +[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:v7 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v10, 2u);
  }
}

+ (void)dispatchNLv4Data:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchNLv4Data:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch NLv4 data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    uint64_t v13 = [v9 idA];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchNLv4Data_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched NLv4 data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __61__CDMDataDispatcher_dispatchNLv4Data_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMDataDispatcher dispatchNLv4Data:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of NLv4 data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertNLv4DataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) parserRequest];
  +[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) parserResponse];
  +[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:v7 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v10, 2u);
  }
}

+ (void)dispatchSNLCData:(id)a3 withResponse:(id)a4 requestId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSNLCData:withResponse:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch SNLC data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__331;
  id v26 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v27 = v11;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__331;
  v21[4] = __Block_byref_object_dispose__332;
  id v12 = v8;
  id v22 = v12;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__331;
  v19[4] = __Block_byref_object_dispose__332;
  if (v9)
  {
    uint64_t v13 = [v9 idA];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v20 = v13;
  v14 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = [v14 targetName];
  }
  else
  {
    id v16 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDMDataDispatcher_dispatchSNLCData_withResponse_requestId___block_invoke;
  aBlock[3] = &unk_2647A4450;
  aBlock[4] = &buf;
  aBlock[5] = v19;
  aBlock[6] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v17 requester:v16 debugLog:@"CDMDataDispatcher dispatched SNLC data for FeatureStore asynchronously."];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&buf, 8);
}

void __61__CDMDataDispatcher_dispatchSNLCData_withResponse_requestId___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "+[CDMDataDispatcher dispatchSNLCData:withResponse:requestId:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of SNLC data to FeatureStore", (uint8_t *)&v10, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertSNLCDataToFeatureStore", (uint8_t *)&v10, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) parserRequest];
  +[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:v6 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) snlcResponse];
  +[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:v7 interactionId:*(void *)(*(void *)(a1[5] + 8) + 40)];

  id v8 = (id)CDMLogContext;
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v10, 2u);
  }
}

+ (void)dispatchSpanizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch spanization data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__331;
  v38 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v39 = v11;
  uint64_t v12 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v13 = v12;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__331;
  v31[4] = __Block_byref_object_dispose__332;
  if (v12)
  {
    v14 = [v12 nlId];
    __int16 v15 = [v13 trpId];
    id v16 = [v13 targetUUID];
    uint64_t v17 = [v13 resultCandidateId];
    long long v18 = [v13 targetName];
    id v32 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v14 andWithTrpId:v15 andWithRequestId:v16 andWithResultCandidateId:v17 andWithConnectionId:v18];
  }
  else
  {
    id v32 = 0;
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__331;
  v29[4] = __Block_byref_object_dispose__332;
  if (v8)
  {
    id v19 = [v8 idA];
  }
  else
  {
    id v19 = 0;
  }
  id v30 = v19;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__331;
  v27[4] = __Block_byref_object_dispose__332;
  id v20 = v9;
  id v28 = v20;
  uint64_t v21 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A44F0;
  block[4] = &buf;
  block[5] = v31;
  void block[6] = v27;
  void block[7] = v29;
  dispatch_async(v21, block);

  id v22 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v33 = 136315138;
    v34 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched spanization data for SELF asynchronously.", v33, 0xCu);
  }

  if (v13)
  {
    uint64_t v23 = [v13 targetName];
  }
  else
  {
    uint64_t v23 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke_401;
  aBlock[3] = &unk_2647A4C50;
  aBlock[4] = &buf;
  aBlock[5] = v29;
  uint64_t v24 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v24 requester:v23 debugLog:@"CDMDataDispatcher dispatched spanization data for FeatureStore asynchronously."];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&buf, 8);
}

void __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of Spanization data to SELF", buf, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchSpanizationData", buf, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) spanMatchResponse];
  +[CDMSELFLogUtil matchingSpanEnded:v6 metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF MatchingSpan response message emitted" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];

  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    id v7 = [NSString stringWithFormat:@"cdm_span_match_response_%@.json", *(void *)(*(void *)(a1[7] + 8) + 40)];
    uint64_t v8 = +[CDMNluLogUtil getLogBasePath];
    id v9 = [(id)v8 stringByAppendingPathComponent:v7];

    int v10 = [*(id *)(*(void *)(a1[4] + 8) + 40) spanMatchResponse];
    id v15 = 0;
    LOBYTE(v8) = +[CDMNluLogUtil saveSpanMatchResponseToProtobuf:v10 protobufFile:v9 error:&v15];
    id v11 = v15;

    if ((v8 & 1) == 0)
    {
      uint64_t v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v17 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging span match result to file: %@", buf, 0x16u);
      }
    }
  }
  uint64_t v13 = (id)CDMLogContext;
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", "", buf, 2u);
  }
}

void __77__CDMDataDispatcher_dispatchSpanizationData_requestId_dataDispatcherContext___block_invoke_401(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    int v10 = "+[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of Spanization data to FeatureStore", (uint8_t *)&v9, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertSpanMatchResponseToFeatureStore", (uint8_t *)&v9, 2u);
  }

  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) spanMatchResponse];
  +[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:v6 interactionId:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  id v7 = (id)CDMLogContext;
  uint64_t v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v9, 2u);
  }
}

+ (void)dispatchContextUpdateData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch contextUpdate data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__331;
  id v32 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v33 = v11;
  uint64_t v12 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__331;
  v25[4] = __Block_byref_object_dispose__332;
  if (v12)
  {
    v14 = [v12 nlId];
    id v15 = [v13 trpId];
    id v16 = [v13 targetUUID];
    uint64_t v17 = [v13 resultCandidateId];
    __int16 v18 = [v13 targetName];
    id v26 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v14 andWithTrpId:v15 andWithRequestId:v16 andWithResultCandidateId:v17 andWithConnectionId:v18];
  }
  else
  {
    id v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__331;
  v23[4] = __Block_byref_object_dispose__332;
  id v19 = v9;
  id v24 = v19;
  uint64_t v20 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CDMDataDispatcher_dispatchContextUpdateData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  block[4] = &buf;
  block[5] = v25;
  void block[6] = v23;
  dispatch_async(v20, block);

  uint64_t v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 136315138;
    id v28 = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched contextUpdate data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

void __79__CDMDataDispatcher_dispatchContextUpdateData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    int v10 = "+[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of ContextUpdate data to SELF", (uint8_t *)&v9, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchContextUpdateData", (uint8_t *)&v9, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) ctxUpdateResponse];
  +[CDMSELFLogUtil contextUpdateEnded:v6 metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF ContextUpdate response message emitted" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];

  id v7 = (id)CDMLogContext;
  id v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", "", (uint8_t *)&v9, 2u);
  }
}

+ (void)dispatchCorrectedUtteranceTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch correctedUtteranceTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__331;
  id v32 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v33 = v11;
  uint64_t v12 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__331;
  v25[4] = __Block_byref_object_dispose__332;
  if (v12)
  {
    v14 = [v12 nlId];
    id v15 = [v13 trpId];
    id v16 = [v13 targetUUID];
    uint64_t v17 = [v13 resultCandidateId];
    __int16 v18 = [v13 targetName];
    id v26 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v14 andWithTrpId:v15 andWithRequestId:v16 andWithResultCandidateId:v17 andWithConnectionId:v18];
  }
  else
  {
    id v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__331;
  v23[4] = __Block_byref_object_dispose__332;
  id v19 = v9;
  id v24 = v19;
  uint64_t v20 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CDMDataDispatcher_dispatchCorrectedUtteranceTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  block[4] = &buf;
  block[5] = v25;
  void block[6] = v23;
  dispatch_async(v20, block);

  uint64_t v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 136315138;
    id v28 = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched correctedUtteranceTokenization data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

void __96__CDMDataDispatcher_dispatchCorrectedUtteranceTokenizationData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    int v10 = "+[CDMDataDispatcher dispatchCorrectedUtteranceTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CorrectedUtteranceTokenization data to SELF", (uint8_t *)&v9, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchCorrectedUtteranceTokenizationData", (uint8_t *)&v9, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) responses];
  +[CDMSELFLogUtil tokenizationEndedWithMultiResponses:v6 inputType:3 metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF corrected user utterance Tokenization response message emitted" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];

  id v7 = (id)CDMLogContext;
  id v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", "", (uint8_t *)&v9, 2u);
  }
}

+ (void)dispatchPreviousTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch previousTurnTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__331;
  id v32 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v33 = v11;
  uint64_t v12 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v13 = v12;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__331;
  v25[4] = __Block_byref_object_dispose__332;
  if (v12)
  {
    v14 = [v12 nlId];
    id v15 = [v13 trpId];
    id v16 = [v13 targetUUID];
    uint64_t v17 = [v13 resultCandidateId];
    __int16 v18 = [v13 targetName];
    id v26 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v14 andWithTrpId:v15 andWithRequestId:v16 andWithResultCandidateId:v17 andWithConnectionId:v18];
  }
  else
  {
    id v26 = 0;
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__331;
  v23[4] = __Block_byref_object_dispose__332;
  id v19 = v9;
  id v24 = v19;
  uint64_t v20 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__CDMDataDispatcher_dispatchPreviousTurnTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  block[4] = &buf;
  block[5] = v25;
  void block[6] = v23;
  dispatch_async(v20, block);

  uint64_t v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 136315138;
    id v28 = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched previousTurnTokenization data for SELF asynchronously.", v27, 0xCu);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&buf, 8);
}

void __90__CDMDataDispatcher_dispatchPreviousTurnTokenizationData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v24 = "+[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of PreviousTurnTokenization data to SELF", buf, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchPreviousTurnTokenizationData", buf, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) previousSiriResponseTokenResponses];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(*(void *)(a1[4] + 8) + 40) previousSiriResponseTokenResponses];
    id v9 = [v8 lastObject];

    if (v9)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      int v10 = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "previousSiriResponseTokenResponses", 0);
      id v11 = [v10 lastObject];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            +[CDMSELFLogUtil tokenizationEnded:*(void *)(*((void *)&v18 + 1) + 8 * i) inputType:2 metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF previous turn Siri response Tokenization response message emitted" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
  }
  id v16 = (id)CDMLogContext;
  uint64_t v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", "", buf, 2u);
  }
}

+ (void)dispatchCurrentTurnTokenizationData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch currentTurnTokenization data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__331;
  id v39 = __Block_byref_object_dispose__332;
  id v11 = v7;
  id v40 = v11;
  uint64_t v12 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v13 = v12;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__331;
  v29[4] = __Block_byref_object_dispose__332;
  if (v12)
  {
    uint64_t v14 = [v12 nlId];
    id v15 = [v13 trpId];
    id v16 = [v13 targetUUID];
    uint64_t v17 = [v13 resultCandidateId];
    long long v18 = [v13 targetName];
    id v30 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v14 andWithTrpId:v15 andWithRequestId:v16 andWithResultCandidateId:v17 andWithConnectionId:v18];
  }
  else
  {
    id v30 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__331;
  uint8_t v27[4] = __Block_byref_object_dispose__332;
  id v19 = v9;
  id v28 = v19;
  long long v20 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  block[4] = &buf;
  block[5] = v29;
  void block[6] = v27;
  dispatch_async(v20, block);

  long long v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v31) = 136315138;
    *(void *)((char *)&v31 + 4) = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched currentTurnTokenization data for SELF asynchronously.", (uint8_t *)&v31, 0xCu);
  }

  *(void *)&long long v31 = 0;
  *((void *)&v31 + 1) = &v31;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__331;
  uint64_t v34 = __Block_byref_object_dispose__332;
  if (v8)
  {
    id v22 = [v8 idA];
  }
  else
  {
    id v22 = 0;
  }
  id v35 = v22;
  if (v13)
  {
    uint64_t v23 = [v13 targetName];
  }
  else
  {
    uint64_t v23 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke_379;
  aBlock[3] = &unk_2647A4C50;
  aBlock[4] = &buf;
  aBlock[5] = &v31;
  id v24 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v24 requester:v23 debugLog:@"CDMDataDispatcher dispatched currentTurnTokenization data for FeatureStore asynchronously."];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&buf, 8);
}

void __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    int v10 = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CurrentTurnTokenization data to SELF", (uint8_t *)&v9, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-SELF", "dispatchCurrentTurnTokenizationData", (uint8_t *)&v9, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(a1[4] + 8) + 40) responses];
  +[CDMSELFLogUtil tokenizationEndedWithMultiResponses:v6 inputType:1 metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF current turn user utterance Tokenization response message emitted" dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];

  id v7 = (id)CDMLogContext;
  id v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-SELF", "", (uint8_t *)&v9, 2u);
  }
}

void __89__CDMDataDispatcher_dispatchCurrentTurnTokenizationData_requestId_dataDispatcherContext___block_invoke_379(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_signpost_id_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    int v10 = "+[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher starting dispatch of CurrentTurnTokenization data to FeatureStore", (uint8_t *)&v9, 0xCu);
  }

  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMDataDispatcher-FS", "insertTokenizerResponseToFeatureStore", (uint8_t *)&v9, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) response];
  +[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:v6 interactionId:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  id v7 = (id)CDMLogContext;
  id v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CDMDataDispatcher-FS", "", (uint8_t *)&v9, 2u);
  }
}

+ (void)dispatchCdmPreprocessingWrapperData:(id)a3 requestId:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCdmPreprocessingWrapperData:requestId:]";
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM PreprocessingWrapper data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__331;
  id v19 = __Block_byref_object_dispose__332;
  id v8 = v5;
  id v20 = v8;
  int v9 = [MEMORY[0x263F71F68] extractRequestLinkData:v6];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__331;
  v14[4] = __Block_byref_object_dispose__332;
  if (v6)
  {
    int v10 = [v6 idA];
  }
  else
  {
    int v10 = 0;
  }
  id v15 = v10;
  if (v9)
  {
    uint64_t v11 = [v9 targetName];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CDMDataDispatcher_dispatchCdmPreprocessingWrapperData_requestId___block_invoke;
  v13[3] = &unk_2647A4C50;
  v13[4] = &buf;
  v13[5] = v14;
  uint64_t v12 = _Block_copy(v13);
  [(id)objc_opt_class() insertFeatureStore:v12 requester:v11 debugLog:@"CDMDataDispatcher dispatched CDM PreprocessingWrapper data for FeatureStore asynchronously."];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&buf, 8);
}

void __67__CDMDataDispatcher_dispatchCdmPreprocessingWrapperData_requestId___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertPreprocessingWrapperToFeatureStore", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) interactionId:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", "", v7, 2u);
  }
}

+ (void)dispatchCdmResponseData:(id)a3 requestId:(id)a4 dataDispatcherContext:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchCdmResponseData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Response data.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__331;
  id v35 = __Block_byref_object_dispose__332;
  id v36 = (id)[v7 copy];
  uint64_t v11 = [MEMORY[0x263F71F68] extractRequestLinkData:v8];
  uint64_t v12 = v11;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__331;
  v28[4] = __Block_byref_object_dispose__332;
  if (v11)
  {
    uint64_t v13 = [v11 nlId];
    uint64_t v14 = [v12 trpId];
    id v15 = [v12 targetUUID];
    id v16 = [v12 resultCandidateId];
    uint64_t v17 = [v12 targetName];
    id v29 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v13 andWithTrpId:v14 andWithRequestId:v15 andWithResultCandidateId:v16 andWithConnectionId:v17];
  }
  else
  {
    id v29 = 0;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__331;
  v26[4] = __Block_byref_object_dispose__332;
  id v18 = v9;
  id v27 = v18;
  uint64_t v19 = mach_absolute_time();
  id v20 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A44C8;
  block[4] = &buf;
  block[5] = v28;
  void block[6] = v26;
  void block[7] = v19;
  dispatch_async(v20, block);

  uint64_t v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v30 = 136315138;
    long long v31 = "+[CDMDataDispatcher dispatchCdmResponseData:requestId:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM Response data for SELF asynchronously.", v30, 0xCu);
  }

  if (v12)
  {
    id v22 = [v12 targetName];
  }
  else
  {
    id v22 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke_369;
  aBlock[3] = &unk_2647A44A0;
  aBlock[4] = &buf;
  uint64_t v23 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v23 requester:v22 debugLog:@"CDMDataDispatcher dispatched CDM Response data for FeatureStore asynchronously."];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(&buf, 8);
}

void __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke(void *a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmResponseData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmEnded:*(void *)(*(void *)(a1[4] + 8) + 40) metadata:*(void *)(*(void *)(a1[5] + 8) + 40) logMessage:@"SELF CDM Request ended message emitted" machAbsoluteTime:a1[7] dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", v7, 2u);
  }
}

void __77__CDMDataDispatcher_dispatchCdmResponseData_requestId_dataDispatcherContext___block_invoke_369(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertResponseToFeatureStoreAsJson", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", "", v7, 2u);
  }
}

+ (void)dispatchCdmRequestData:(id)a3 requestId:(id)a4 withCurrentServiceGraph:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v56 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch CDM Request data.", buf, 0xCu);
  }

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__331;
  v53[4] = __Block_byref_object_dispose__332;
  id v54 = (id)[v41 copy];
  uint64_t v13 = [MEMORY[0x263F71F68] extractRequestLinkData:v9];
  uint64_t v14 = v13;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__331;
  v51[4] = __Block_byref_object_dispose__332;
  if (v13)
  {
    id v15 = v9;
    id v16 = v10;
    uint64_t v17 = [v13 nlId];
    id v18 = [v14 trpId];
    uint64_t v19 = [v14 targetUUID];
    id v20 = [v14 resultCandidateId];
    uint64_t v21 = [v14 targetName];
    id v52 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v17 andWithTrpId:v18 andWithRequestId:v19 andWithResultCandidateId:v20 andWithConnectionId:v21];

    id v10 = v16;
    id v9 = v15;
  }
  else
  {
    id v52 = 0;
  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__331;
  v49[4] = __Block_byref_object_dispose__332;
  id v22 = v11;
  id v50 = v22;
  uint64_t v23 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    id v30 = (void *)MEMORY[0x263F71F68];
    id v39 = [v14 nlId];
    v38 = [v30 convertUUID:v39];
    id v40 = [v38 toSafeNSUUID];
    id v31 = [v14 resultCandidateId];
    uint64_t v32 = (void *)MEMORY[0x263F71F68];
    uint64_t v37 = [v14 trpId];
    uint64_t v33 = [v32 convertUUID:v37];
    id v34 = [v33 toSafeNSUUID];
    id v35 = [v14 targetName];
    id v36 = [v14 targetUUID];
    *(_DWORD *)long long buf = 136316418;
    v56 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    __int16 v57 = 2112;
    id v58 = v40;
    __int16 v59 = 2112;
    id v60 = v31;
    __int16 v61 = 2112;
    id v62 = v34;
    __int16 v63 = 2112;
    id v64 = v35;
    __int16 v65 = 2112;
    v66 = v36;
    _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s SELF RequestLinkData for dispatchCdmRequestData: \n RequestLinkData.nlId: %@ \n RequestLinkData.resultCandidateId: %@ \n RequestLinkData.trpId: %@ \n RequestLinkData.tragetName: %@ \n RequestLinkData.targetUUID: %@", buf, 0x3Eu);
  }
  uint64_t v24 = mach_absolute_time();
  uint64_t v25 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4478;
  id v26 = v10;
  id v44 = v26;
  v45 = v53;
  v46 = v51;
  v47 = v49;
  uint64_t v48 = v24;
  dispatch_async(v25, block);

  id v27 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    v56 = "+[CDMDataDispatcher dispatchCdmRequestData:requestId:withCurrentServiceGraph:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched CDM Request data for SELF asynchronously.", buf, 0xCu);
  }

  if (v14)
  {
    id v28 = [v14 targetName];
  }
  else
  {
    id v28 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke_361;
  aBlock[3] = &unk_2647A44A0;
  aBlock[4] = v53;
  id v29 = _Block_copy(aBlock);
  [(id)objc_opt_class() insertFeatureStore:v29 requester:v28 debugLog:@"CDMDataDispatcher dispatched CDM Request data for FeatureStore asynchronously."];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
}

void __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchCdmRequestData", buf, 2u);
  }

  +[CDMSELFLogUtil cdmStarted:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadata:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) logMessage:@"SELF CDM Request started message emitted" machAbsoluteTime:*(void *)(a1 + 64) currentServiceGraph:[NSClassFromString(*(NSString **)(a1 + 32)) getNLXSchemaCDMServiceGraphName] dataDispatcherContext:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", v7, 2u);
  }
}

void __100__CDMDataDispatcher_dispatchCdmRequestData_requestId_withCurrentServiceGraph_dataDispatcherContext___block_invoke_361(uint64_t a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-FS", "insertRequestToFeatureStoreAsJson", buf, 2u);
  }

  +[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-FS", "", v7, 2u);
  }
}

+ (void)dispatchSELFRequestLink:(id)a3 dataDispatcherContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[CDMDataDispatcher dispatchSELFRequestLink:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher is about to dispatch SELF RequestLink.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__331;
  id v27 = __Block_byref_object_dispose__332;
  id v28 = [MEMORY[0x263F71F68] extractRequestLinkData:v5];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__331;
  uint8_t v20[4] = __Block_byref_object_dispose__332;
  id v8 = *(void **)(*((void *)&buf + 1) + 40);
  if (v8)
  {
    id v9 = [v8 nlId];
    id v10 = [*(id *)(*((void *)&buf + 1) + 40) trpId];
    id v11 = [*(id *)(*((void *)&buf + 1) + 40) targetUUID];
    uint64_t v12 = [*(id *)(*((void *)&buf + 1) + 40) resultCandidateId];
    uint64_t v13 = [*(id *)(*((void *)&buf + 1) + 40) targetName];
    id v21 = +[CDMSELFLogUtil createSELFMetadataWithNlId:v9 andWithTrpId:v10 andWithRequestId:v11 andWithResultCandidateId:v12 andWithConnectionId:v13];
  }
  else
  {
    id v21 = 0;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__331;
  v18[4] = __Block_byref_object_dispose__332;
  id v14 = v6;
  id v19 = v14;
  id v15 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CDMDataDispatcher_dispatchSELFRequestLink_dataDispatcherContext___block_invoke;
  block[3] = &unk_2647A4450;
  void block[4] = &buf;
  block[5] = v20;
  void block[6] = v18;
  dispatch_async(v15, block);

  id v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v22 = 136315138;
    uint64_t v23 = "+[CDMDataDispatcher dispatchSELFRequestLink:dataDispatcherContext:]";
    _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s CDMDataDispatcher dispatched SELF RequestLink asynchronously.", v22, 0xCu);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(&buf, 8);
}

void __67__CDMDataDispatcher_dispatchSELFRequestLink_dataDispatcherContext___block_invoke(void *a1)
{
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)CDMLogContext);
  os_signpost_id_t v3 = (id)CDMLogContext;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "CDMDataDispatcher-SELF", "dispatchSELFRequestLink", buf, 2u);
  }

  +[CDMSELFLogUtil emitRequestLink:*(void *)(*(void *)(a1[4] + 8) + 40) metadata:*(void *)(*(void *)(a1[5] + 8) + 40) dataDispatcherContext:*(void *)(*(void *)(a1[6] + 8) + 40)];
  id v5 = (id)CDMLogContext;
  id v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v6, OS_SIGNPOST_INTERVAL_END, v2, "CDMDataDispatcher-SELF", "", v7, 2u);
  }
}

+ (void)waitForQueueCompletion
{
  os_signpost_id_t v2 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  dispatch_barrier_async_and_wait(v2, &__block_literal_global_443);
}

void __43__CDMDataDispatcher_waitForQueueCompletion__block_invoke()
{
}

+ (void)insertFeatureStore:(id)a3 requester:(id)a4 debugLog:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __59__CDMDataDispatcher_insertFeatureStore_requester_debugLog___block_invoke;
  id v20 = &unk_2647A4ED8;
  id v11 = v7;
  id v22 = v11;
  uint64_t v12 = v10;
  id v21 = v12;
  dispatch_block_t v13 = dispatch_block_create((dispatch_block_flags_t)0, &v17);
  id v14 = +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue];
  dispatch_async(v14, v13);

  id v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v24 = "+[CDMDataDispatcher insertFeatureStore:requester:debugLog:]";
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  if (([v8 isEqualToString:@"CURARE"] & 1) != 0
    || [v8 isEqualToString:@"LIGHTHOUSE"])
  {
    dispatch_time_t v16 = dispatch_time(0, 3000000000);
    dispatch_group_wait(v12, v16);
  }
}

void __59__CDMDataDispatcher_insertFeatureStore_requester_debugLog___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_signpost_id_t v2 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v2);
}

@end