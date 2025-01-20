@interface CDMSsuInferenceServiceGraph
+ (BOOL)requiresAssets;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMSsuInferenceServiceGraph

+ (id)requiredDAGServices
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v12 = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v13 = v6;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v14 = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:3];
  v10 = objc_msgSend(v2, "setWithArray:", v9, v12, v13);

  return v10;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = [NSNumber numberWithInteger:a3];
      int v9 = 136315394;
      v10 = "+[CDMSsuInferenceServiceGraph getUsageForAssetSetName:withLocale:]";
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v9, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    v6 = +[CDMAssetsUtils getSsuUsages:a4];
  }
  return v6;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 5;
}

+ (BOOL)requiresAssets
{
  return 1;
}

- (void)buildGraph
{
  objc_initWeak(location, self);
  v3 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v4 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v5 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__2077;
  v47[4] = __Block_byref_object_dispose__2078;
  id v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2077;
  v45[4] = __Block_byref_object_dispose__2078;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__2077;
  v43[4] = __Block_byref_object_dispose__2078;
  id v44 = 0;
  v6 = [(CDMServiceGraph *)self getGraphInput];
  v7 = [(CDMServiceGraph *)self getLanguage];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__2077;
  v41[4] = __Block_byref_object_dispose__2078;
  v8 = [v6 ssuRequest];
  id v42 = [v8 utterance];

  int v9 = [v6 ssuRequest];
  v10 = [v9 requestId];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke;
  v36[3] = &unk_2647A5740;
  v39 = v41;
  id v11 = v7;
  id v37 = v11;
  v40 = v47;
  id v12 = v3;
  id v38 = v12;
  uint64_t v13 = [(CDMServiceGraph *)self addNodeWithName:@"doCurrentTokenize" bindService:v12 requestId:v10 block:v36];

  v14 = [v6 ssuRequest];
  uint64_t v15 = [v14 requestId];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_576;
  v32[3] = &unk_2647A4940;
  v34 = v47;
  v35 = v45;
  id v16 = v4;
  id v33 = v16;
  v17 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanization" bindService:v16 requestId:v15 block:v32];

  v18 = [v6 ssuRequest];
  v19 = [v18 requestId];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_580;
  v24[3] = &unk_2647A4968;
  id v20 = v6;
  id v25 = v20;
  id v21 = v11;
  id v26 = v21;
  v28 = v45;
  v29 = v41;
  v30 = v43;
  id v22 = v5;
  id v27 = v22;
  objc_copyWeak(&v31, location);
  v23 = [(CDMServiceGraph *)self addNodeWithName:@"doSSUMatching" bindService:v22 requestId:v19 block:v24];

  [v17 addDependency:v13];
  [v23 addDependency:v17];

  objc_destroyWeak(&v31);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  objc_destroyWeak(location);
}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v7, 0xCu);
  }

  v3 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) locale:*(void *)(a1 + 32)];
  uint64_t v4 = [*(id *)(a1 + 40) handle:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_576(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSiriVocabularySpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71CF0]);
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) responses];
  uint64_t v5 = +[CDMBaseSpanMatchService convertToSpanMatchRequests:v4 nlContext:v3];

  v6 = [[CDMSpanMatcherRequestCommand alloc] initWithRequests:v5];
  uint64_t v7 = [*(id *)(a1 + 32) handle:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v12 = 136315394;
    uint64_t v13 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s SiriVocabularySpanMatchResponse: %@", (uint8_t *)&v12, 0x16u);
  }
}

void __41__CDMSsuInferenceServiceGraph_buildGraph__block_invoke_580(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315138;
    id v27 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Building SSU request for use in CDMSSUService", (uint8_t *)&v26, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71EF8]);
  uint64_t v4 = [*(id *)(a1 + 32) ssuRequest];
  uint64_t v5 = [v4 requestId];
  [v3 setNluRequestId:v5];

  v6 = (void *)MEMORY[0x263F71F48];
  id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
  uint64_t v8 = [v6 convertFromUUID:v7];
  [v3 setAsrId:v8];

  [v3 setLocale:*(void *)(a1 + 40)];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) spanMatchResponse];
  v10 = [v9 matchingSpans];
  uint64_t v11 = (void *)[v10 mutableCopy];

  [v3 setMatchingSpans:v11];
  [v3 setUtterance:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  int v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  [v3 setSalientEntities:v12];
  uint64_t v13 = [[CDMSSURequestCommand alloc] initWithParserRequest:v3];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    __assert_rtn("-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke", "CDMSsuInferenceServiceGraph.m", 129, "ssuResponseCommand == nil");
  }
  __int16 v14 = v13;
  uint64_t v15 = [*(id *)(a1 + 48) handle:v13];
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = objc_alloc_init(MEMORY[0x263F71D38]);
  id v19 = objc_alloc(MEMORY[0x263EFF980]);
  id v20 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) ssuResponse];
  id v21 = [v20 hypotheses];
  id v22 = (void *)[v19 initWithArray:v21];
  [v18 setParses:v22];

  v23 = [[CDMSsuInferenceGraphResponseCommand alloc] initWithSsuResponse:v18];
  v24 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    id v27 = "-[CDMSsuInferenceServiceGraph buildGraph]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v18;
    _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMSsuInferenceGraphResponse: ssuResponse=%@", (uint8_t *)&v26, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained setGraphOutput:v23];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end