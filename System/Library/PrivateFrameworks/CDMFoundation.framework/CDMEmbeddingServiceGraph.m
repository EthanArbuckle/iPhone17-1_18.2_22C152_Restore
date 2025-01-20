@interface CDMEmbeddingServiceGraph
+ (BOOL)requiresAssets;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (id)responseFeatureStoreStreamId;
+ (id)serializeFeatureStoreWithResponseCmd:(id)a3;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMEmbeddingServiceGraph

+ (id)requiredDAGServices
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v10[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v8 = [v2 setWithArray:v7];

  return v8;
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
      v10 = "+[CDMEmbeddingServiceGraph getUsageForAssetSetName:withLocale:]";
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v9, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    v6 = +[CDMAssetsUtils getNLUsages:a4];
  }
  return v6;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 4;
}

+ (id)serializeFeatureStoreWithResponseCmd:(id)a3
{
  v3 = [a3 convertResponseToSubwordResponse];
  v4 = +[CDMProtobufConverter serializeExternalSubwordEmbeddingResponseWithResponse:v3 formatType:@"json"];

  return v4;
}

+ (id)responseFeatureStoreStreamId
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!+[CDMPlatformUtils isInternalInstall])
  {
    v4 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v7 = 136315138;
    v8 = "+[CDMEmbeddingServiceGraph responseFeatureStoreStreamId]";
    v5 = "%s Device not on internal build. Not inserting SubwordEmbeddingResponse to FeatureStore.";
LABEL_12:
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v7, 0xCu);
    goto LABEL_7;
  }
  if (+[CDMUserDefaultsUtils isInsertEmbeddingOutputsToFeatureStoreEnabled])
  {
    v2 = @"SubwordEmbeddingResponse";
    v3 = @"SubwordEmbeddingResponse";
    goto LABEL_8;
  }
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    v8 = "+[CDMEmbeddingServiceGraph responseFeatureStoreStreamId]";
    v5 = "%s UserDefault for inserting CDMEmbeddingGraph outputs to FeatureStore is not enabled. Not inserting SubwordEmb"
         "eddingResponse to FeatureStore.";
    goto LABEL_12;
  }
LABEL_7:

  v2 = 0;
LABEL_8:
  return v2;
}

+ (BOOL)requiresAssets
{
  return 1;
}

- (void)buildGraph
{
  objc_initWeak(&location, self);
  v3 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v4 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__10300;
  v32[4] = __Block_byref_object_dispose__10301;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__10300;
  v30[4] = __Block_byref_object_dispose__10301;
  id v31 = 0;
  v5 = [(CDMServiceGraph *)self getGraphInput];
  v6 = [(CDMServiceGraph *)self getLanguage];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__10300;
  v28[4] = __Block_byref_object_dispose__10301;
  id v29 = [v5 text];
  int v7 = [v5 requestId];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke;
  v23[3] = &unk_2647A5740;
  v26 = v28;
  id v8 = v6;
  id v24 = v8;
  v27 = v32;
  id v9 = v3;
  id v25 = v9;
  v10 = [(CDMServiceGraph *)self addNodeWithName:@"doCurrentTokenize" bindService:v9 requestId:v7 block:v23];

  __int16 v11 = [v5 requestId];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke_506;
  v17 = &unk_2647A5770;
  v19 = v32;
  v20 = v28;
  v21 = v30;
  id v12 = v4;
  id v18 = v12;
  objc_copyWeak(&v22, &location);
  uint64_t v13 = [(CDMServiceGraph *)self addNodeWithName:@"doEmbedding" bindService:v12 requestId:v11 block:&v14];

  objc_msgSend(v13, "addDependency:", v10, v14, v15, v16, v17);
  objc_destroyWeak(&v22);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  objc_destroyWeak(&location);
}

void __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[CDMEmbeddingServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v7, 0xCu);
  }

  v3 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) locale:*(void *)(a1 + 32)];
  uint64_t v4 = [*(id *)(a1 + 40) handle:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __38__CDMEmbeddingServiceGraph_buildGraph__block_invoke_506(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMEmbeddingServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v12, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71E00]);
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) response];
  uint64_t v5 = [v4 tokenChain];
  [v3 setTokenChain:v5];

  [v3 setText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v6 = [[CDMEmbeddingProtoRequestCommand alloc] initWithRequest:v3];
  uint64_t v7 = [*(id *)(a1 + 32) handle:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [[CDMEmbeddingGraphResponseCommand alloc] initWithEmbeddingProtoResponseCommand:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained setGraphOutput:v10];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end