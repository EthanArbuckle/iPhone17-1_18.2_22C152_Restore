@interface CDMNLv4ProtoService
+ (id)assetsPathURLForModelBundle:(id)a3;
+ (id)buildEmptyNLv4ResponseCommand:(id)a3;
+ (id)getCDMServiceAssetConfig;
+ (id)getParserEnum;
+ (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5;
+ (id)xpcActivitySupported;
+ (id)xpcEventStreamsSupported;
+ (void)handleTrialAssetUpdate:(id)a3 selfMetadata:(id)a4;
+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5;
+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6;
- (id)assetsPathURLForModelBundle:(id)a3;
- (id)buildNLv4ResponseCommand:(id)a3 requestId:(id)a4;
- (id)doNLv4Inference:(id)a3 outError:(id *)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
@end

@implementation CDMNLv4ProtoService

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

+ (id)xpcEventStreamsSupported
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.notifyd.matching" eventName:@"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL" dagServiceClass:objc_opt_class()];
  v4 = +[XPCStreamEventRegistration registrationWithStream:@"com.apple.notifyd.matching" eventName:@"com.apple.siri.uaf.com.apple.siri.understanding" dagServiceClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "arrayWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)xpcActivitySupported
{
  v2 = [MEMORY[0x263EFF9C0] set];
  [v2 addObject:@"com.apple.siri.cdm.xpc_activity.post_install"];
  [v2 addObject:@"com.apple.siri.cdm.xpc_activity.maintenance"];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (id)assetsPathURLForModelBundle:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() assetsPathURLForModelBundle:v3];

  return v4;
}

- (id)doNLv4Inference:(id)a3 outError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Start NLv4 Inference", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  parser = v8->_parser;
  id v16 = 0;
  v10 = [(SNLPNaturalLanguageParser *)parser inferenceResponseForRequest:v6 error:&v16];
  id v11 = v16;
  if (!v10)
  {
    v12 = (id)CDMLogContext;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = [v11 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
      __int16 v19 = 2112;
      v20 = @"nlv4";
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-%@]:\nNLv4 inference error: %@", buf, 0x20u);
    }
    *a4 = v11;
  }

  objc_sync_exit(v8);
  v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CDMNLv4ProtoService doNLv4Inference:outError:]";
    _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s CDMNLv4ProtoService::doNLv4Inference finished", buf, 0xCu);
  }

  return v10;
}

- (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(id)objc_opt_class() parserFromAssetDirectory:v7 selfMetadata:v8 error:a5];

  return v9;
}

- (id)buildNLv4ResponseCommand:(id)a3 requestId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 hypotheses];
  id v8 = +[CDMNLv4ProtoService getParserEnum];
  +[CDMNLServiceUtils populateParser:v7 parserToSet:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F71CB0]);
  [v9 setRequestId:v6];
  v10 = [v5 hypotheses];
  [v9 setParses:v10];

  id v11 = [[CDMNLv4ProtoResponseCommand alloc] initWithParserResponse:v5 nluResponse:v9];
  return v11;
}

- (id)handle:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[CDMNLv4ProtoService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s calling NLv4 Inference", buf, 0xCu);
  }

  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    id v6 = [v4 parserRequest];
    uint64_t v41 = 0;
    id v7 = +[CDMNluLogUtil writeNlv4RequestToDisk:v6 error:&v41];
  }
  if (self->super.super._serviceState == 2)
  {
    id v8 = self;
    objc_sync_enter(v8);
    if (v8->_parser)
    {
      objc_sync_exit(v8);

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v9 = [v4 parserRequest];
      v10 = [v9 tokenisedUtterance];
      id v11 = [v10 tokenChain];
      v12 = [v11 tokens];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v38 != v14) {
              objc_enumerationMutation(v12);
            }
            if (([*(id *)(*((void *)&v37 + 1) + 8 * i) isWhitespace] & 1) == 0)
            {

              v20 = [v4 parserRequest];
              id v36 = 0;
              __int16 v21 = [(CDMNLv4ProtoService *)v8 doNLv4Inference:v20 outError:&v36];
              v22 = (CDMNLv4ProtoService *)v36;

              if (v22)
              {
                v17 = objc_alloc_init(CDMNLv4ProtoResponseCommand);
                [(CDMBaseCommand *)v17 setCmdError:v22];
              }
              else
              {
                if (+[CDMFeatureFlags isLogNluEnabled])
                {
                  uint64_t v35 = 0;
                  id v24 = +[CDMNluLogUtil writeNlv4ResponseToDisk:v21 error:&v35];
                }
                v25 = [v21 hypotheses];
                unint64_t v26 = [v25 count];
                v27 = [v4 parserRequest];
                LODWORD(v26) = v26 > [v27 maxNumParses];

                if (v26)
                {
                  v28 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    v31 = [v21 hypotheses];
                    uint64_t v32 = [v31 count];
                    v33 = [v4 parserRequest];
                    uint64_t v34 = [v33 maxNumParses];
                    *(_DWORD *)buf = 136315650;
                    v43 = "-[CDMNLv4ProtoService handle:]";
                    __int16 v44 = 2048;
                    v45 = (__CFString *)v32;
                    __int16 v46 = 2048;
                    uint64_t v47 = v34;
                    _os_log_error_impl(&dword_2263A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: The number of parses in the response (%lu) is greater than the max num parses in the request (%llu)", buf, 0x20u);
                  }
                }
                v29 = [v4 requestId];
                v17 = [(CDMNLv4ProtoService *)v8 buildNLv4ResponseCommand:v21 requestId:v29];
              }
              id v8 = v22;
              goto LABEL_34;
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v48 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v16 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CDMNLv4ProtoService handle:]";
        __int16 v44 = 2112;
        v45 = @"nlv4";
        _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nNo non whitespace tokens found. Skipping call to the model.", buf, 0x16u);
      }
      id v8 = [v4 requestId];
      v17 = +[CDMNLv4ProtoService buildEmptyNLv4ResponseCommand:v8];
    }
    else
    {
      uint64_t v23 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CDMNLv4ProtoService handle:]";
        _os_log_error_impl(&dword_2263A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: _parser not initialized", buf, 0xCu);
      }

      objc_sync_exit(v8);
      v17 = 0;
    }
  }
  else
  {
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int64_t serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v43 = "-[CDMNLv4ProtoService handle:]";
      __int16 v44 = 2048;
      v45 = (__CFString *)serviceState;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v17 = objc_alloc_init(CDMNLv4ProtoResponseCommand);
    id v8 = [(CDMBaseService *)self createErrorWithCode:1 description:&stru_26DA24FF0];
    [(CDMBaseCommand *)v17 setCmdError:v8];
  }
LABEL_34:

  return v17;
}

- (id)warmup:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDMNLv4ProtoService warmup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm NLv4 model", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels])
  {
    id v6 = [v4 dynamicConfig];
    id v7 = [v6 embeddingConfigs];

    id v8 = [v7 getEmbeddingConfigForFactor:@"com.apple.siri.nl.nlv4"];
    id v9 = [v8 embeddingModelDimension];
    v10 = +[CDMNLServiceUtils buildSetupNLv4ProtoRequest:v9];
    id v11 = self;
    objc_sync_enter(v11);
    if (v11->_parser)
    {
      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[CDMNLv4ProtoService warmup:]";
        _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Performing NLv4 warmup request", buf, 0xCu);
      }

      id v23 = 0;
      uint64_t v13 = [(CDMNLv4ProtoService *)v11 doNLv4Inference:v10 outError:&v23];
      id v14 = v23;
      if (!v13)
      {
        v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [v14 localizedDescription];
          *(_DWORD *)buf = 136315394;
          v25 = "-[CDMNLv4ProtoService warmup:]";
          __int16 v26 = 2112;
          uint64_t v27 = v16;
          v22 = (void *)v16;
          _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Warmup NLv4 request failed: %@", buf, 0x16u);
        }
      }
    }
    objc_sync_exit(v11);
  }
  else
  {
    id v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CDMNLv4ProtoService warmup:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. NLv4 will not prewarm.", buf, 0xCu);
    }
  }

  v17 = [CDMWarmupResponseCommand alloc];
  int64_t v18 = [(CDMBaseService *)self serviceState];
  __int16 v19 = [(CDMBaseService *)self serviceName];
  v20 = [(CDMWarmupResponseCommand *)v17 initWithServiceState:v18 serviceName:v19];

  return v20;
}

- (id)setup:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s NLv4 model setup...", buf, 0xCu);
  }

  id v6 = [v4 dynamicConfig];
  id v7 = [v6 getAssetForFactorName:@"com.apple.siri.nl.nlv4"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v7;

  id v9 = [v4 dynamicConfig];
  v10 = [v9 getAssetBundlePathForFactorName:@"com.apple.siri.nl.nlv4"];

  if (v10)
  {
    id v11 = [(CDMNLv4ProtoService *)self assetsPathURLForModelBundle:v10];
    if (v11)
    {
      v12 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
        __int16 v33 = 2112;
        uint64_t v34 = v11;
        _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s NLv4 proto service passing assets path to NLv4IO: %@", buf, 0x16u);
      }

      uint64_t v13 = self;
      objc_sync_enter(v13);
      id v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
        _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s Creating _parser", buf, 0xCu);
      }

      v15 = [v4 selfMetadata];
      id v30 = 0;
      uint64_t v16 = [(CDMNLv4ProtoService *)v13 parserFromAssetDirectory:v11 selfMetadata:v15 error:&v30];
      id v17 = v30;
      parser = v13->_parser;
      v13->_parser = (SNLPNaturalLanguageParser *)v16;

      __int16 v19 = v13->_parser;
      if (!v19)
      {
        v13->super.super._int64_t serviceState = 3;
        v15 = [(CDMBaseService *)v13 createSetupResponseCommand];
        v20 = NSString;
        __int16 v21 = [v17 localizedDescription];
        v22 = [v20 stringWithFormat:@"Error during NLv4 parser init: %@", v21];

        id v23 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
          __int16 v33 = 2112;
          uint64_t v34 = v22;
          _os_log_error_impl(&dword_2263A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
        }

        id v24 = [(CDMBaseService *)v13 createErrorWithCode:1 description:v22];
        [v15 setCmdError:v24];
      }
      objc_sync_exit(v13);

      if (v19)
      {
        v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
          _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s NLv4 model loaded during setup", buf, 0xCu);
        }

        v13->super.super._int64_t serviceState = 2;
        v15 = [(CDMBaseService *)v13 createSetupResponseCommand];
      }
    }
    else
    {
      self->super.super._int64_t serviceState = 3;
      v15 = [(CDMBaseService *)self createSetupResponseCommand];
      __int16 v26 = [NSString stringWithFormat:@"Could not look up NLv4 assets path"];
      uint64_t v27 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "-[CDMNLv4ProtoService setup:]";
        __int16 v33 = 2112;
        uint64_t v34 = v26;
        _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      uint64_t v28 = [(CDMBaseService *)self createErrorWithCode:1 description:v26];
      [v15 setCmdError:v28];

      id v11 = 0;
    }
  }
  else
  {
    self->super.super._int64_t serviceState = 3;
    v15 = [(CDMBaseService *)self createSetupResponseCommand];
    id v11 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Not able to find/load NLv4 model bundle directory"];
    [v15 setCmdError:v11];
  }

  return v15;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v6 = @"temp_model";
  id v7 = @"com.apple.siri.nl.nlv4";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

+ (id)assetsPathURLForModelBundle:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 resourcePath];
  id v5 = [v4 stringByAppendingPathComponent:@"model_bundle/v3/"];

  char v12 = 0;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5 isDirectory:&v12];

  if (v12) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  if (v8)
  {
    id v9 = [NSURL fileURLWithPath:v5 isDirectory:1];
  }
  else
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "+[CDMNLv4ProtoService assetsPathURLForModelBundle:]";
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: NLv4 assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)parserFromAssetDirectory:(id)a3 selfMetadata:(id)a4 error:(id *)a5
{
  id v5 = [MEMORY[0x263F71FB0] parserFromAssetDirectory:a3 metadata:a4 error:a5];
  return v5;
}

+ (id)getParserEnum
{
  id v2 = objc_alloc_init(MEMORY[0x263F71D00]);
  [v2 setAlgorithm:2];
  [v2 setParserId:3];
  return v2;
}

+ (id)buildEmptyNLv4ResponseCommand:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F71E68]);
  id v5 = objc_alloc_init(MEMORY[0x263F71CB0]);
  [v5 setRequestId:v3];
  id v6 = [[CDMNLv4ProtoResponseCommand alloc] initWithParserResponse:v4 nluResponse:v5];

  return v6;
}

+ (void)handleTrialAssetUpdate:(id)a3 selfMetadata:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Pre-compiling NLv4 mil assets to E5RT.", buf, 0xCu);
  }

  id v9 = [v6 getAssetBundlePathForFactorName:@"com.apple.siri.nl.nlv4"];
  v10 = +[CDMNLv4ProtoService assetsPathURLForModelBundle:v9];
  if (v10)
  {
    id v11 = a1;
    objc_sync_enter(v11);
    char v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Triggering on-device E5RT compilation of NLv4 model assets.", buf, 0xCu);
    }

    id v21 = 0;
    uint64_t v13 = [v11 parserFromAssetDirectory:v10 selfMetadata:v7 error:&v21];
    id v14 = v21;
    __int16 v15 = v14;
    if (!v13)
    {
      uint64_t v16 = NSString;
      uint64_t v17 = [v14 localizedDescription];
      int64_t v18 = [v16 stringWithFormat:@"Error during NLv4 parser init: %@", v17];

      __int16 v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
        __int16 v24 = 2112;
        id v25 = v18;
        _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }
    }
    objc_sync_exit(v11);
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Could not look up NLv4 assets path"];
    v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CDMNLv4ProtoService(SystemEvent) handleTrialAssetUpdate:selfMetadata:]";
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_error_impl(&dword_2263A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }
  }
}

+ (void)handleXPCActivity:(id)a3 withAssets:(id)a4 withSelfMetadata:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 == @"com.apple.siri.cdm.xpc_activity.post_install"
    || v8 == @"com.apple.siri.cdm.xpc_activity.maintenance")
  {
    [a1 handleTrialAssetUpdate:v9 selfMetadata:v10];
  }
  else
  {
    id v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCActivity:withAssets:withSelfMetadata:]";
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled activity type: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

+ (void)handleXPCEvent:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = +[XPCStreamEventUtils getXPCEventName:v10];
  if (!v14)
  {
    __int16 v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      v20 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      __int16 v21 = 2048;
      id v22 = v10;
      uint64_t v16 = "%s [ERR]: Could not extract XPC event name for event %p";
      uint64_t v17 = v15;
      uint32_t v18 = 22;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (![@"com.apple.notifyd.matching" isEqualToString:v11]
    || ([@"com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL" isEqualToString:v14] & 1) == 0
    && ![@"com.apple.siri.uaf.com.apple.siri.understanding" isEqualToString:v14])
  {
    __int16 v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      v20 = "+[CDMNLv4ProtoService(SystemEvent) handleXPCEvent:fromStream:withAssets:withSelfMetadata:]";
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      uint64_t v16 = "%s [ERR]: Unhandled XPC event with streamName=%@, eventName=%@";
      uint64_t v17 = v15;
      uint32_t v18 = 32;
LABEL_12:
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, v18);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  [a1 handleTrialAssetUpdate:v12 selfMetadata:v13];
LABEL_10:
}

@end