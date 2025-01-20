@interface CDMMDSServiceGraph
+ (BOOL)requiresAssets;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMMDSServiceGraph

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
  return 0;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 3;
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
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__3256;
  v74[4] = __Block_byref_object_dispose__3257;
  id v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__3256;
  v72[4] = __Block_byref_object_dispose__3257;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__3256;
  v70[4] = __Block_byref_object_dispose__3257;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__3256;
  v68[4] = __Block_byref_object_dispose__3257;
  id v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__3256;
  v66[4] = __Block_byref_object_dispose__3257;
  id v67 = 0;
  v6 = [MEMORY[0x263F089D8] stringWithString:@"\n*** ✅ FOR DEBUGGING (start) ***"];
  v7 = [(CDMServiceGraph *)self getGraphInput];
  v8 = [v7 siriNLUTypeObj];
  v9 = [(CDMServiceGraph *)self getLanguage];
  v10 = [(CDMServiceGraph *)self validateRequest:v8];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__3256;
  v64[4] = __Block_byref_object_dispose__3257;
  [v10 utterance];
  v31 = v10;
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  [(CDMServiceGraph *)self populateRequesterEnumForNluRequest:v8];
  v11 = [v8 requestId];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke;
  v57[3] = &unk_2647A49E0;
  id v12 = v8;
  id v58 = v12;
  id v13 = v9;
  id v59 = v13;
  v63 = v74;
  id v60 = v3;
  id v14 = v6;
  id v61 = v14;
  id v15 = v7;
  id v62 = v15;
  id v30 = v60;
  v32 = [(CDMServiceGraph *)self addNodeWithName:@"doCurrentTokenize" bindService:v60 requestId:v11 block:v57];

  v16 = [v12 requestId];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_585;
  v50[3] = &unk_2647A4A08;
  v52 = v74;
  v53 = v64;
  id v17 = v4;
  id v51 = v17;
  v54 = v70;
  v55 = v68;
  v56 = v72;
  v18 = [(CDMServiceGraph *)self addNodeWithName:@"doEmbedding" bindService:v17 requestId:v16 block:v50];
  v29 = v17;

  v19 = [v12 requestId];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_589;
  v40[3] = &unk_2647A4A30;
  id v20 = v5;
  id v41 = v20;
  id v21 = v12;
  id v42 = v21;
  v44 = v64;
  id v28 = v13;
  id v43 = v28;
  v45 = v74;
  v46 = v70;
  v47 = v68;
  v48 = v66;
  objc_copyWeak(&v49, location);
  v22 = [(CDMServiceGraph *)self addNodeWithName:@"doMDSUaaPNLInference" bindService:v20 requestId:v19 block:v40];

  v23 = [v21 requestId];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __32__CDMMDSServiceGraph_buildGraph__block_invoke_2;
  v33[3] = &unk_2647A4A58;
  v37 = v66;
  v38 = v74;
  id v24 = v21;
  id v34 = v24;
  id v25 = v15;
  id v35 = v25;
  id v26 = v14;
  id v36 = v26;
  objc_copyWeak(&v39, location);
  v27 = [(CDMServiceGraph *)self addNodeWithName:@"doPostProcess" requestId:v23 block:v33];

  [v18 addDependency:v32];
  [v22 addDependency:v18];
  [v27 addDependency:v22];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v49);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);

  objc_destroyWeak(location);
}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    id v13 = "-[CDMMDSServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v12, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) currentTurnInput];
  v4 = [v3 asrOutputs];
  v5 = +[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:v4 locale:*(void *)(a1 + 40)];

  uint64_t v6 = [*(id *)(a1 + 48) handle:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  +[CDMServiceGraphUtil addDebugInfo:*(void *)(a1 + 56) nluRequest:*(void *)(a1 + 32) responseObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v10 = [*(id *)(a1 + 32) requestId];
  v11 = [*(id *)(a1 + 64) dataDispatcherContext];
  +[CDMDataDispatcher dispatchCurrentTurnTokenizationData:v9 requestId:v10 dataDispatcherContext:v11];
}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_585(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    v18 = "-[CDMMDSServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v17, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71E00]);
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) response];
  v5 = [v4 tokenChain];
  [v3 setTokenChain:v5];

  [v3 setText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v6 = [[CDMEmbeddingProtoRequestCommand alloc] initWithRequest:v3];
  uint64_t v7 = [*(id *)(a1 + 32) handle:v6];
  uint64_t v8 = [v7 response];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [v7 embeddingConfigs];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = +[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_589(uint64_t a1)
{
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) requestId];
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  v5 = [v4 tokenChain];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) embeddingTensorOutputs];
  uint64_t v7 = +[CDMServiceGraphUtil embeddingsOutput:v6 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forFactor:@"com.apple.siri.nl.uaap.mds"];
  uint64_t v8 = [*(id *)(a1 + 40) currentTurnInput];
  uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
  id obj = *(id *)(v9 + 40);
  id v20 = 0;
  id v18 = 0;
  v10 = (void *)v2;
  LOBYTE(v3) = +[CDMServiceGraphUtil runUaaPNLProtoService:v17 requestId:v2 utterance:v3 locale:v16 tokenChain:v5 matchingSpans:MEMORY[0x263EFFA68] embeddingTensor:v7 currentTurn:v8 outUaapProtoRequest:&v20 outUaapProtoResponse:&obj outError:&v18];
  id v11 = v20;
  objc_storeStrong((id *)(v9 + 40), obj);
  id v12 = v18;

  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    [WeakRetained failedWithError:v12];
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v15 = [*(id *)(a1 + 40) requestId];
  +[CDMDataDispatcher dispatchUaaPData:v11 withResponse:v14 requestId:v15];
}

void __32__CDMMDSServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  +[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:](CDMPostProcessUtils, "runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:", 0, 0, 0, 0, 0, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40),
    0,
    0,
    0,
    *(void *)(a1 + 32),
    *(void *)(a1 + 40),
  uint64_t v3 = *(void *)(a1 + 48));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setGraphOutput:v3];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end