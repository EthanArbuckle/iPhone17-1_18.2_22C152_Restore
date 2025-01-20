@interface CDMLVCService
+ (BOOL)isEnabled;
+ (id)assetsPathURLForModelBundle:(id)a3;
+ (id)buildMultiLingualVariant:(id)a3;
+ (id)getCDMServiceAssetConfig;
- (BOOL)initializeLVCOverrides:(id)a3;
- (id)doInference:(id)a3 error:(id *)a4;
- (id)getSNLPLanguageVariantClassifierPath:(id)a3 error:(id *)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
- (void)_prewarmModelWithEmbeddingConfigItem:(id)a3;
@end

@implementation CDMLVCService

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
  return +[CDMFeatureFlags isLVCEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->_overrideProxy, 0);
  objc_storeStrong((id *)&self->_lvcOrchestrator, 0);
}

- (BOOL)initializeLVCOverrides:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (char *)a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    v6 = [[SiriNLUOverrideProxy alloc] initWithUseTrie:1 useMemory:0];
    overrideProxy = self->_overrideProxy;
    self->_overrideProxy = v6;

    BOOL v8 = [(SiriNLUOverrideProxy *)self->_overrideProxy loadComponentOverrideTrieStoreWithTrieFilePath:v4];
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "NO";
      if (v8) {
        v10 = "YES";
      }
      int v12 = 136315394;
      v13 = "-[CDMLVCService initializeLVCOverrides:]";
      __int16 v14 = 2080;
      v15 = v10;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Override proxy returned the following for loading LVC overrides: %s", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[CDMLVCService initializeLVCOverrides:]";
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to initialize LVC override from path %@", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)getSNLPLanguageVariantClassifierPath:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    __int16 v14 = "-[CDMLVCService getSNLPLanguageVariantClassifierPath:error:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s creating SNLPLanguageVariantClassifier: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = [MEMORY[0x263F71FA8] classifierWithPathURL:v6 error:a4];
  p_lvcOrchestrator = (id *)&self->_lvcOrchestrator;
  id v10 = *p_lvcOrchestrator;
  id *p_lvcOrchestrator = (id)v8;

  id v11 = *p_lvcOrchestrator;
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
    int v12 = "-[CDMLVCService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Start LVC", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = [(SNLPLanguageVariantClassifier *)self->_lvcOrchestrator responseForRequest:v6 error:a4];
  v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    int v12 = "-[CDMLVCService doInference:error:]";
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s LVC finished", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

- (void)_prewarmModelWithEmbeddingConfigItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [a3 embeddingModelDimension];
  v5 = +[CDMNLServiceUtils buildSetupITFMRequest:v4];

  id v6 = self;
  objc_sync_enter(v6);
  lvcOrchestrator = v6->_lvcOrchestrator;
  id v12 = 0;
  uint64_t v8 = [(SNLPLanguageVariantClassifier *)lvcOrchestrator responseForRequest:v5 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    id v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[CDMLVCService _prewarmModelWithEmbeddingConfigItem:]";
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to run warm-up inference call: %@", buf, 0x16u);
    }
  }

  objc_sync_exit(v6);
}

- (id)warmup:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    __int16 v15 = "-[CDMLVCService warmup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Prewarm LVC model", (uint8_t *)&v14, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels])
  {
    id v6 = [v4 dynamicConfig];
    v7 = [v6 embeddingConfigs];

    uint64_t v8 = [v7 getEmbeddingConfigForFactor:@"com.apple.siri.nl.lvc"];
    [(CDMLVCService *)self _prewarmModelWithEmbeddingConfigItem:v8];
  }
  else
  {
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      __int16 v15 = "-[CDMLVCService warmup:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. LVC will not prewarm.", (uint8_t *)&v14, 0xCu);
    }
  }

  id v9 = [CDMWarmupResponseCommand alloc];
  int64_t v10 = [(CDMBaseService *)self serviceState];
  int v11 = [(CDMBaseService *)self serviceName];
  id v12 = [(CDMWarmupResponseCommand *)v9 initWithServiceState:v10 serviceName:v11];

  return v12;
}

- (id)setup:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[CDMLVCService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s LVC model setup", buf, 0xCu);
  }

  id v6 = [v4 dynamicConfig];
  v7 = [v6 getAssetForFactorName:@"com.apple.siri.nl.lvc"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v7;

  id v9 = [v4 dynamicConfig];
  int64_t v10 = [v9 getAssetBundlePathForFactorName:@"com.apple.siri.nl.lvc"];

  if (!v10)
  {
    v22 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CDMLVCService setup:]";
      v23 = "%s Bundle not found for the LVC service";
LABEL_16:
      _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
    }
LABEL_17:

    v24 = 0;
    self->super.super._serviceState = 4;
    v18 = [(CDMBaseService *)self createSetupResponseCommand];
    goto LABEL_30;
  }
  uint64_t v11 = [(id)objc_opt_class() assetsPathURLForModelBundle:v10];
  if (!v11)
  {
    v22 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CDMLVCService setup:]";
      v23 = "%s Language variant classifier asset path not found";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CDMLVCService setup:]";
    __int16 v37 = 2112;
    uint64_t v38 = v11;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s LVC service passing assets path to SNLPLanguageVariantClassifier: %@", buf, 0x16u);
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  id v32 = 0;
  int v14 = [(CDMLVCService *)v13 getSNLPLanguageVariantClassifierPath:v11 error:&v32];
  id v15 = v32;

  if (v14)
  {
    uint64_t v16 = [v4 dynamicConfig];
    uint64_t v17 = [v16 getAssetBundlePathForFactorName:@"com.apple.siri.nl.overrides"];

    v18 = [v17 resourcePath];
    v19 = [v18 stringByAppendingPathComponent:@"trie_bundle"];

    if ([(CDMLVCService *)v13 initializeLVCOverrides:v19])
    {
      v20 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMLVCService setup:]";
        _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s Trie Overrides: Loaded LVC overrides bundle", buf, 0xCu);
      }
      int v21 = 0;
    }
    else
    {
      v26 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMLVCService setup:]";
        _os_log_error_impl(&dword_2263A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Trie Overrides: Failed to load LVC overrides bundle", buf, 0xCu);
      }

      v13->super.super._serviceState = 4;
      v18 = [(CDMBaseService *)v13 createSetupResponseCommand];
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08338];
      v34 = @"Failed to load LVC overrides bundle";
      v20 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v28 = [v27 errorWithDomain:*MEMORY[0x263F72028] code:0 userInfo:v20];
      [v18 setCmdError:v28];

      int v21 = 1;
    }
  }
  else
  {
    v25 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = [v15 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMLVCService setup:]";
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v31;
      _os_log_error_impl(&dword_2263A0000, v25, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create LVC Orchestrator: %@", buf, 0x16u);
    }
    v13->super.super._serviceState = 3;
    v18 = [(CDMBaseService *)v13 createSetupResponseCommand];
    [v18 setCmdError:v15];
    int v21 = 1;
  }

  objc_sync_exit(v13);
  if (!v21)
  {
    v29 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CDMLVCService setup:]";
      _os_log_impl(&dword_2263A0000, v29, OS_LOG_TYPE_INFO, "%s LVC model loaded", buf, 0xCu);
    }

    v13->super.super._serviceState = 2;
    v18 = [(CDMBaseService *)v13 createSetupResponseCommand];
  }
  v24 = (void *)v11;
LABEL_30:

  return v18;
}

- (id)handle:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CDMLVCService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Running LVC inference...", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    id v6 = self;
    objc_sync_enter(v6);
    overrideProxy = v6->_overrideProxy;
    if (overrideProxy)
    {
      uint64_t v8 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[CDMLVCService handle:]";
        __int16 v56 = 2112;
        v57 = @"lvc";
        _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nLVC override start matching", buf, 0x16u);
        overrideProxy = v6->_overrideProxy;
      }
      id v9 = [v4 overridesInputs];
      int64_t v10 = [(SiriNLUOverrideProxy *)overrideProxy matchWithInputs:v9 overrideNamespace:4];

      if (v10)
      {
        uint64_t v11 = +[CDMLVCService buildMultiLingualVariant:v10];
        if (v11)
        {
          id v12 = [CDMLVCResponseCommand alloc];
          id v13 = objc_alloc_init(MEMORY[0x263F71E28]);
          int v14 = [(CDMLVCResponseCommand *)v12 initWithITFMResponse:v13 languageVariantResult:v11];

          objc_sync_exit(v6);
          goto LABEL_50;
        }
      }
    }
    if (!v6->_lvcOrchestrator)
    {
      uint64_t v17 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMLVCService handle:]";
        _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: _lvcOrchestrator not initialized", buf, 0xCu);
      }
    }
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v4 parserRequest];
      v20 = [v19 tokenisedUtterance];
      id v21 = [v20 originalUtterance];
      uint64_t v22 = [v21 UTF8String];
      *(_DWORD *)buf = 136315394;
      v55 = "-[CDMLVCService handle:]";
      __int16 v56 = 2080;
      v57 = (__CFString *)v22;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s LVC Request for utterance: %s", buf, 0x16u);
    }
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[CDMLVCService handle:]";
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s Handling LVC Request", buf, 0xCu);
    }

    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      v24 = [v4 parserRequest];
      uint64_t v53 = 0;
      id v25 = +[CDMNluLogUtil writeLVCRequestToDisk:v24 error:&v53];
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v26 = [v4 parserRequest];
    v27 = [v26 tokenisedUtterance];
    v28 = [v27 tokenChain];
    v29 = [v28 tokens];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v50;
LABEL_26:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v29);
        }
        if (([*(id *)(*((void *)&v49 + 1) + 8 * v32) isWhitespace] & 1) == 0) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v60 count:16];
          if (v30) {
            goto LABEL_26;
          }
          goto LABEL_32;
        }
      }

      uint64_t v33 = v6;
      objc_sync_enter(v33);
      v34 = [v4 parserRequest];
      id v48 = 0;
      v35 = [v33 doInference:v34 error:&v48];
      id v36 = v48;

      if (v35)
      {

        objc_sync_exit(v33);
        __int16 v37 = [v35 hypotheses];
        BOOL v38 = [v37 count] == 0;

        if (v38)
        {
          uint64_t v39 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v55 = "-[CDMLVCService handle:]";
            _os_log_debug_impl(&dword_2263A0000, v39, OS_LOG_TYPE_DEBUG, "%s LVC returned no hypotheses", buf, 0xCu);
          }
        }
        v40 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v55 = "-[CDMLVCService handle:]";
          __int16 v56 = 2112;
          v57 = @"lvc";
          __int16 v58 = 2112;
          v59 = v35;
          _os_log_debug_impl(&dword_2263A0000, v40, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nLVC Parser Response: %@", buf, 0x20u);
        }
        goto LABEL_47;
      }
      v41 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v46 = [v36 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v55 = "-[CDMLVCService handle:]";
        __int16 v56 = 2112;
        v57 = v46;
        _os_log_error_impl(&dword_2263A0000, v41, OS_LOG_TYPE_ERROR, "%s [ERR]: LVC inference failed with error: %@", buf, 0x16u);
      }
      objc_sync_exit(v33);
    }
    else
    {
LABEL_32:

      uint64_t v33 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CDMLVCService handle:]";
        _os_log_impl(&dword_2263A0000, v33, OS_LOG_TYPE_INFO, "%s No non whitespace tokens found. Skipping call to LVC model inference.", buf, 0xCu);
      }
    }

    v42 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[CDMLVCService handle:]";
      _os_log_impl(&dword_2263A0000, v42, OS_LOG_TYPE_INFO, "%s Given that LVC model call has been incomplete, returning an empty response.", buf, 0xCu);
    }

    v35 = objc_opt_new();
LABEL_47:
    v43 = +[CDMNLServiceUtils buildLVCResponse:v35 lvcRequest:v4];
    if (+[CDMFeatureFlags isLogNluEnabled])
    {
      uint64_t v47 = 0;
      id v44 = +[CDMNluLogUtil writeLVCResponseToDisk:v35 error:&v47];
    }
    objc_sync_exit(v6);

    id v6 = v43;
    int v14 = (CDMLVCResponseCommand *)v6;
  }
  else
  {
    id v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int64_t serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v55 = "-[CDMLVCService handle:]";
      __int16 v56 = 2048;
      v57 = (__CFString *)serviceState;
      _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    int v14 = objc_alloc_init(CDMLVCResponseCommand);
    id v6 = [(CDMBaseService *)self createErrorWithCode:1 description:&stru_26DA24FF0];
    [(CDMBaseCommand *)v14 setCmdError:v6];
  }
LABEL_50:

  return v14;
}

+ (id)buildMultiLingualVariant:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 hasLvcOverrideValue]
    && ([v3 lvcOverrideValue],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 hasLvcValue],
        v4,
        v5))
  {
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = objc_alloc_init(MEMORY[0x263F71CE8]);
    uint64_t v8 = [v3 lvcOverrideValue];
    id v9 = [v8 lvcValue];
    int64_t v10 = [v9 languageVariantName];
    [v7 setLanguageVariantName:v10];

    uint64_t v11 = [v3 lvcOverrideValue];
    id v12 = [v11 lvcValue];
    [v12 languageVariantScore];
    objc_msgSend(v7, "setLanguageVariantScore:");

    id v13 = (id)CDMLogContext;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [v7 dictionaryRepresentation];
      int v18 = 136315650;
      v19 = "+[CDMLVCService buildMultiLingualVariant:]";
      __int16 v20 = 2112;
      id v21 = @"lvc";
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nLVC override found:%@", (uint8_t *)&v18, 0x20u);
    }
    [v6 addObject:v7];
    id v15 = objc_alloc_init(MEMORY[0x263F71CD8]);
    [v15 setMultilingualVariants:v6];
    id v16 = objc_alloc_init(MEMORY[0x263F71D00]);
    [v16 setAlgorithm:1];
    [v16 setParserId:8];
    [v15 setParser:v16];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)assetsPathURLForModelBundle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 resourcePath];
  char v11 = 0;
  int v5 = [MEMORY[0x263F08850] defaultManager];
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
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "+[CDMLVCService assetsPathURLForModelBundle:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: LVC assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  char v6 = @"model_bundle_lvc";
  char v7 = @"com.apple.siri.nl.lvc";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

@end