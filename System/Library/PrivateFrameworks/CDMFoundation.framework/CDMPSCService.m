@interface CDMPSCService
+ (BOOL)isEnabled;
+ (id)_emptyResponse;
+ (id)getCDMServiceAssetConfig;
- (id)assetsPathURLForModelBundle:(id)a3;
- (id)doInference:(id)a3 error:(id *)a4;
- (id)getSNLPPommesServerClassifierPath:(id)a3 error:(id *)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
@end

@implementation CDMPSCService

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

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isPSCEnabled];
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = @"model_bundle_psc";
  v7 = @"com.apple.siri.nl.psc";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

+ (id)_emptyResponse
{
  id v2 = objc_alloc_init(MEMORY[0x263F71E28]);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->_pscOrchestrator, 0);
}

- (id)getSNLPPommesServerClassifierPath:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[CDMPSCService getSNLPPommesServerClassifierPath:error:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s creating SNLPPommesServerClassifier: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = [MEMORY[0x263F71FB8] classifierWithPathURL:v6 error:a4];
  p_pscOrchestrator = (id *)&self->_pscOrchestrator;
  id v10 = *p_pscOrchestrator;
  id *p_pscOrchestrator = (id)v8;

  id v11 = *p_pscOrchestrator;
  return v11;
}

- (id)doInference:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[CDMPSCService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Start PSC", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = [(SNLPPommesServerClassifier *)self->_pscOrchestrator responseForRequest:v6 error:a4];
  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[CDMPSCService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s PSC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
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
      uint64_t v13 = "-[CDMPSCService assetsPathURLForModelBundle:]";
      __int16 v14 = 2112;
      __int16 v15 = v4;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: PSC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)warmup:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDMPSCService warmup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm PSC model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels])
  {
    char v6 = [v4 dynamicConfig];
    char v7 = [v6 embeddingConfigs];

    uint64_t v8 = [v7 getEmbeddingConfigForFactor:@"com.apple.siri.nl.psc"];
    v9 = [v8 embeddingModelDimension];
    id v10 = +[CDMNLServiceUtils buildSetupITFMRequest:v9];
    char v11 = self;
    objc_sync_enter(v11);
    pscOrchestrator = v11->_pscOrchestrator;
    id v23 = 0;
    uint64_t v13 = [(SNLPPommesServerClassifier *)pscOrchestrator responseForRequest:v10 error:&v23];
    id v14 = v23;
    if (!v13)
    {
      __int16 v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v14 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v25 = "-[CDMPSCService warmup:]";
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        v22 = (void *)v21;
        _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to run warm-up inference call: %@", buf, 0x16u);
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
      v25 = "-[CDMPSCService warmup:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. PSC will not prewarm.", buf, 0xCu);
    }
  }

  uint64_t v16 = [CDMWarmupResponseCommand alloc];
  int64_t v17 = [(CDMBaseService *)self serviceState];
  v18 = [(CDMBaseService *)self serviceName];
  v19 = [(CDMWarmupResponseCommand *)v16 initWithServiceState:v17 serviceName:v18];

  return v19;
}

- (id)setup:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDMPSCService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s PSC model setup", buf, 0xCu);
  }

  char v6 = [v4 dynamicConfig];
  char v7 = [v6 getAssetForFactorName:@"com.apple.siri.nl.psc"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v7;

  v9 = [v4 dynamicConfig];
  id v10 = [v9 getAssetBundlePathForFactorName:@"com.apple.siri.nl.psc"];

  if (v10)
  {
    char v11 = [(CDMPSCService *)self assetsPathURLForModelBundle:v10];
    if (v11)
    {
      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[CDMPSCService setup:]";
        __int16 v26 = 2112;
        uint64_t v27 = v11;
        _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s PSC proto service passing assets path to SNLPPommesServerClassifier: %@", buf, 0x16u);
      }

      uint64_t v13 = self;
      objc_sync_enter(v13);
      id v23 = 0;
      id v14 = [(CDMPSCService *)v13 getSNLPPommesServerClassifierPath:v11 error:&v23];
      id v15 = v23;

      if (!v14)
      {
        uint64_t v16 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v22 = [v15 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v25 = "-[CDMPSCService setup:]";
          __int16 v26 = 2112;
          uint64_t v27 = v22;
          _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create PSC Orchestrator: %@", buf, 0x16u);
        }
        v13->super.super._serviceState = 3;
        v12 = [(CDMBaseService *)v13 createSetupResponseCommand];
        [v12 setCmdError:v15];
      }

      objc_sync_exit(v13);
      if (v14)
      {
        int64_t v17 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v25 = "-[CDMPSCService setup:]";
          _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s PSC model loaded", buf, 0xCu);
        }

        v13->super.super._serviceState = 2;
        v12 = [(CDMBaseService *)v13 createSetupResponseCommand];
      }
    }
    else
    {
      self->super.super._serviceState = 4;
      v12 = [(CDMBaseService *)self createSetupResponseCommand];
      v18 = [NSString stringWithFormat:@"Could not look up PSC assets path"];
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[CDMPSCService setup:]";
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      v20 = [(CDMBaseService *)self createErrorWithCode:1 description:v18];
      [v12 setCmdError:v20];

      char v11 = 0;
    }
  }
  else
  {
    self->super.super._serviceState = 4;
    v12 = [(CDMBaseService *)self createSetupResponseCommand];
    char v11 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Not able to find/load PSC model bundle directory"];
    [v12 setCmdError:v11];
  }

  return v12;
}

- (id)handle:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CDMPSCService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Running PSC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    char v6 = self;
    objc_sync_enter(v6);
    if (!v6->_pscOrchestrator)
    {
      char v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CDMPSCService handle:]";
        _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: _pscOrchestrator not initialized", buf, 0xCu);
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
      v45 = "-[CDMPSCService handle:]";
      __int16 v46 = 2080;
      v47 = (__CFString *)v12;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s PSC Request for utterance: %s", buf, 0x16u);
    }
    uint64_t v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CDMPSCService handle:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s Handling PSC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      id v14 = [v4 parserRequest];
      uint64_t v43 = 0;
      id v15 = +[CDMNluLogUtil writePSCRequestToDisk:v14 error:&v43];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v16 = [v4 parserRequest];
    int64_t v17 = [v16 tokenisedUtterance];
    v18 = [v17 tokenChain];
    v19 = [v18 tokens];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v40;
LABEL_16:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v19);
        }
        if (([*(id *)(*((void *)&v39 + 1) + 8 * v22) isWhitespace] & 1) == 0) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v20) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }

      uint64_t v28 = v6;
      objc_sync_enter(v28);
      v29 = [v4 parserRequest];
      id v38 = 0;
      uint64_t v27 = [(CDMPSCService *)v28 doInference:v29 error:&v38];
      id v30 = v38;

      if (v27)
      {
        v31 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "-[CDMPSCService handle:]";
          __int16 v46 = 2112;
          v47 = @"psc";
          __int16 v48 = 2112;
          v49 = v27;
          _os_log_debug_impl(&dword_2263A0000, v31, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nPSC Response: %@", buf, 0x20u);
        }
      }
      else
      {
        v32 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v36 = [v30 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMPSCService handle:]";
          __int16 v46 = 2112;
          v47 = v36;
          _os_log_error_impl(&dword_2263A0000, v32, OS_LOG_TYPE_ERROR, "%s [ERR]: PSC inference failed with error: %@", buf, 0x16u);
        }
      }

      objc_sync_exit(v28);
      if (v27) {
        goto LABEL_38;
      }
    }
    else
    {
LABEL_22:

      id v23 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CDMPSCService handle:]";
        _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to PSC model inference.", buf, 0xCu);
      }
    }
    v33 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CDMPSCService handle:]";
      _os_log_impl(&dword_2263A0000, v33, OS_LOG_TYPE_INFO, "%s Given that PSC model call has been incomplete, returning an empty response.", buf, 0xCu);
    }

    uint64_t v27 = [(id)objc_opt_class() _emptyResponse];
LABEL_38:
    __int16 v26 = +[CDMNLServiceUtils buildPSCResponse:v27 pscRequest:v4];
    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      uint64_t v37 = 0;
      id v34 = +[CDMNluLogUtil writePSCResponseToDisk:v27 error:&v37];
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
      v45 = "-[CDMPSCService handle:]";
      __int16 v46 = 2048;
      v47 = (__CFString *)serviceState;
      _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    __int16 v26 = objc_alloc_init(CDMPSCResponseCommand);
    uint64_t v27 = [(CDMBaseService *)self createErrorWithCode:1 description:&stru_26DA24FF0];
    [(CDMBaseCommand *)v26 setCmdError:v27];
  }

  return v26;
}

@end