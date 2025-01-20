@interface CDMSNLCProtoService
+ (id)_stockServerResponse;
+ (id)getCDMServiceAssetConfig;
+ (id)getParserEnum;
- (id)assetsPathURLForModelBundle:(id)a3;
- (id)doInference:(id)a3 error:(id *)a4;
- (id)getSNLPServerNLClassifierPath:(id)a3 error:(id *)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
@end

@implementation CDMSNLCProtoService

- (id)handleRequestCommandTypeNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->_snlcOrchestrator, 0);
}

- (id)getSNLPServerNLClassifierPath:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = "-[CDMSNLCProtoService getSNLPServerNLClassifierPath:error:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s creating _snlcInferenceOrchestrator", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x263F71FE0] classifierWithPathURL:v6 error:a4];
  p_snlcOrchestrator = (id *)&self->_snlcOrchestrator;
  id v10 = *p_snlcOrchestrator;
  id *p_snlcOrchestrator = (id)v8;

  id v11 = *p_snlcOrchestrator;
  return v11;
}

- (id)assetsPathURLForModelBundle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 resourcePath];
  char v11 = 0;
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  if (v11) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = [NSURL fileURLWithPath:v4 isDirectory:1];
  }
  else
  {
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v13 = "-[CDMSNLCProtoService assetsPathURLForModelBundle:]";
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SNLC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)doInference:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[CDMSNLCProtoService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Start SNLC", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = [(SNLPServerNLClassifier *)self->_snlcOrchestrator responseForRequest:v6 error:a4];
  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[CDMSNLCProtoService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s SNLC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

- (id)warmup:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMSNLCProtoService warmup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm SNLC model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels])
  {
    id v6 = [v4 dynamicConfig];
    char v7 = [v6 embeddingConfigs];

    uint64_t v8 = [v7 getEmbeddingConfigForFactor:@"com.apple.siri.nl.snlc"];
    v9 = [v8 embeddingModelDimension];
    id v10 = +[CDMNLServiceUtils buildSetupSNLCProtoRequest:v9];
    int v11 = self;
    objc_sync_enter(v11);
    id v22 = 0;
    v12 = [(CDMSNLCProtoService *)v11 doInference:v10 error:&v22];
    id v13 = v22;
    if (!v12)
    {
      __int16 v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v13 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v24 = "-[CDMSNLCProtoService warmup:]";
        __int16 v25 = 2112;
        uint64_t v26 = v20;
        v21 = (void *)v20;
        _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: SNLC inference failed with error: %@", buf, 0x16u);
      }
    }

    objc_sync_exit(v11);
  }
  else
  {
    char v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[CDMSNLCProtoService warmup:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. SNLC will not prewarm.", buf, 0xCu);
    }
  }

  uint64_t v15 = [CDMWarmupResponseCommand alloc];
  int64_t v16 = [(CDMBaseService *)self serviceState];
  v17 = [(CDMBaseService *)self serviceName];
  v18 = [(CDMWarmupResponseCommand *)v15 initWithServiceState:v16 serviceName:v17];

  return v18;
}

- (id)setup:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v25 = "-[CDMSNLCProtoService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s SNLC model setup", buf, 0xCu);
  }

  id v6 = [v4 dynamicConfig];
  char v7 = [v6 getAssetForFactorName:@"com.apple.siri.nl.snlc"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v7;

  v9 = [v4 dynamicConfig];
  id v10 = [v9 getAssetBundlePathForFactorName:@"com.apple.siri.nl.snlc"];

  if (v10)
  {
    int v11 = [(CDMSNLCProtoService *)self assetsPathURLForModelBundle:v10];
    if (v11)
    {
      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v25 = "-[CDMSNLCProtoService setup:]";
        __int16 v26 = 2112;
        uint64_t v27 = v11;
        _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s SNLC proto service passing assets path to SNLPServerNLClassifier: %@", buf, 0x16u);
      }

      id v13 = self;
      objc_sync_enter(v13);
      id v23 = 0;
      __int16 v14 = [(CDMSNLCProtoService *)v13 getSNLPServerNLClassifierPath:v11 error:&v23];
      id v15 = v23;

      if (!v14)
      {
        int64_t v16 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v15 localizedDescription];
          *(_DWORD *)buf = 136315394;
          __int16 v25 = "-[CDMSNLCProtoService setup:]";
          __int16 v26 = 2112;
          uint64_t v27 = v22;
          _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create SNLC Orchestrator: %@", buf, 0x16u);
        }
        v13->super.super._serviceState = 3;
        v12 = [(CDMBaseService *)v13 createSetupResponseCommand];
        [v12 setCmdError:v15];
      }

      objc_sync_exit(v13);
      if (v14)
      {
        v17 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v25 = "-[CDMSNLCProtoService setup:]";
          _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s SNLC model loaded", buf, 0xCu);
        }

        v13->super.super._serviceState = 2;
        v12 = [(CDMBaseService *)v13 createSetupResponseCommand];
      }
    }
    else
    {
      self->super.super._serviceState = 3;
      v12 = [(CDMBaseService *)self createSetupResponseCommand];
      v18 = [NSString stringWithFormat:@"Could not look up SNLC assets path"];
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v25 = "-[CDMSNLCProtoService setup:]";
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      uint64_t v20 = [(CDMBaseService *)self createErrorWithCode:1 description:v18];
      [v12 setCmdError:v20];

      int v11 = 0;
    }
  }
  else
  {
    self->super.super._serviceState = 3;
    v12 = [(CDMBaseService *)self createSetupResponseCommand];
    int v11 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Not able to find/load SNLC model bundle directory"];
    [v12 setCmdError:v11];
  }

  return v12;
}

- (id)handle:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[CDMSNLCProtoService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Running SNLC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    id v6 = self;
    objc_sync_enter(v6);
    if (!v6->_snlcOrchestrator)
    {
      char v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: _snlcOrchestrator not initialized", buf, 0xCu);
      }
    }
    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v4 parserRequest];
      id v10 = [v9 tokenisedUtterance];
      id v11 = [v10 originalUtterance];
      uint64_t v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315394;
      v57 = "-[CDMSNLCProtoService handle:]";
      __int16 v58 = 2080;
      v59 = (__CFString *)v12;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s SNLC Request for utterance: %s", buf, 0x16u);
    }
    id v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMSNLCProtoService handle:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s Handling SNLC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      __int16 v14 = [v4 parserRequest];
      uint64_t v55 = 0;
      id v15 = +[CDMNluLogUtil writeSNLCRequestToDisk:v14 error:&v55];
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    int64_t v16 = [v4 parserRequest];
    v17 = [v16 tokenisedUtterance];
    v18 = [v17 tokenChain];
    v19 = [v18 tokens];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v52;
LABEL_16:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v19);
        }
        if (([*(id *)(*((void *)&v51 + 1) + 8 * v22) isWhitespace] & 1) == 0) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v20) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }

      uint64_t v28 = v6;
      objc_sync_enter(v28);
      v29 = [v4 parserRequest];
      id v50 = 0;
      double v27 = [(CDMSNLCProtoService *)v28 doInference:v29 error:&v50];
      id v30 = v50;

      objc_sync_exit(v28);
      if (v27 == 0.0) {
        goto LABEL_31;
      }
      v31 = [*(id *)&v27 hypotheses];
      v32 = [v31 objectAtIndexedSubscript:0];
      [v32 probability];
      float v34 = v33;
      v35 = [*(id *)&v27 hypotheses];
      v36 = [v35 objectAtIndexedSubscript:1];
      [v36 probability];
      if (v34 > v37)
      {
        v38 = [*(id *)&v27 hypotheses];
        [v38 objectAtIndexedSubscript:0];
      }
      else
      {
        v38 = [*(id *)&v27 hypotheses];
        [v38 objectAtIndexedSubscript:1];
      v40 = };

      v41 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        int v46 = [v40 label];
        [v40 probability];
        v48 = "Device";
        if (!v46) {
          v48 = "Server";
        }
        *(_DWORD *)buf = 136315650;
        v57 = "-[CDMSNLCProtoService handle:]";
        __int16 v58 = 2080;
        v59 = (__CFString *)v48;
        __int16 v60 = 2048;
        double v61 = v47;
        _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s SNLC delegated this request to %s with probability %f", buf, 0x20u);
      }
    }
    else
    {
LABEL_22:

      id v23 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to SNLC model inference.", buf, 0xCu);
      }

LABEL_31:
      v39 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CDMSNLCProtoService handle:]";
        _os_log_impl(&dword_2263A0000, v39, OS_LOG_TYPE_INFO, "%s Given that SNLC model call has been incomplete, returning the default SERVER response.", buf, 0xCu);
      }

      double v27 = [(id)objc_opt_class() _stockServerResponse];
    }
    v42 = +[CDMSNLCProtoService getParserEnum];
    __int16 v26 = +[CDMNLServiceUtils buildSNLCProtoResponse:*(void *)&v27 snlcRequest:v4 parserToSet:v42];

    v43 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[CDMSNLCProtoService handle:]";
      __int16 v58 = 2112;
      v59 = @"snlc";
      __int16 v60 = 2112;
      double v61 = v27;
      _os_log_debug_impl(&dword_2263A0000, v43, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSNLCParserResponse: %@", buf, 0x20u);
    }
    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      uint64_t v49 = 0;
      id v44 = +[CDMNluLogUtil writeSNLCResponseToDisk:*(void *)&v27 error:&v49];
    }
    objc_sync_exit(v6);
  }
  else
  {
    v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int64_t serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v57 = "-[CDMSNLCProtoService handle:]";
      __int16 v58 = 2048;
      v59 = (__CFString *)serviceState;
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    __int16 v26 = objc_alloc_init(CDMSNLCProtoResponseCommand);
    double v27 = [(CDMBaseService *)self createErrorWithCode:1 description:&stru_26DA24FF0];
    [(CDMBaseCommand *)v26 setCmdError:*(void *)&v27];
  }

  return v26;
}

+ (id)getParserEnum
{
  id v2 = objc_alloc_init(MEMORY[0x263F71D00]);
  [v2 setAlgorithm:2];
  [v2 setParserId:2];
  return v2;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v6 = @"model_bundle_snlc";
  char v7 = @"com.apple.siri.nl.snlc";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

+ (id)_stockServerResponse
{
  id v2 = objc_alloc_init(MEMORY[0x263F71E28]);
  id v3 = objc_alloc_init(MEMORY[0x263F71E18]);
  LODWORD(v4) = 1.0;
  [v3 setProbability:v4];
  [v3 setLabel:0];
  id v5 = objc_alloc_init(MEMORY[0x263F71E18]);
  [v5 setProbability:0.0];
  [v5 setLabel:1];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v3, v5, 0);
  [v2 setHypotheses:v6];

  return v2;
}

@end