@interface CDMOverridesProtoService
+ (BOOL)isEnabled;
+ (id)getCDMServiceAssetConfig;
- (SiriNLUOverrideProxy)store;
- (id)buildOverridesTurnInputAndPreprocessing;
- (id)createSetupErrorCmd:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)matchOverride:(id)a3 shouldAppend:(BOOL *)a4;
- (id)setup:(id)a3;
- (id)setupFailedFor:(id)a3;
- (id)setupSucceeded;
- (id)warmup:(id)a3;
- (void)dealloc;
@end

@implementation CDMOverridesProtoService

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
  return +[CDMFeatureFlags globalOverridesAreEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__store, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (SiriNLUOverrideProxy)store
{
  return self->__store;
}

- (id)matchOverride:(id)a3 shouldAppend:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(CDMOverridesProtoService *)self store];
  v8 = [v7 matchWithInputs:v6 shouldAppend:a4];

  return v8;
}

- (id)buildOverridesTurnInputAndPreprocessing
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
  id v3 = objc_alloc_init(MEMORY[0x263F71CA0]);
  [v3 setUtterance:@"HelloWorld"];
  [v3 setProbability:1.0];
  v4 = (void *)MEMORY[0x263F71F48];
  id v5 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v6 = [v4 convertFromUUID:v5];
  [v3 setIdA:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v7 setValue:@"HelloWorld"];
  [v7 setBegin:0];
  [v7 setEnd:10];
  [v7 setIsSignificant:1];
  [v7 setIsWhitespace:0];
  [v7 setCleanValue:@"HelloWorld"];
  [v7 setTokenIndex:0];
  [v7 setNonWhitespaceTokenIndex:0];
  id v8 = objc_alloc_init(MEMORY[0x263F71F28]);
  v9 = [v2 localeIdentifier];
  [v8 setLocale:v9];

  [v8 setStringValue:@"HelloWorld"];
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v7, 0);
  [v8 setTokens:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F71D70]);
  v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v3, 0);
  [v11 setAsrOutputs:v12];

  v13 = [v2 localeIdentifier];
  [v11 setLocale:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  id v15 = objc_alloc_init(MEMORY[0x263F71E88]);
  [v15 setUtterance:@"HelloWorld"];
  [v15 setTokenChain:v8];
  [v15 setTurnInput:v11];
  [v14 addObject:v15];

  return v14;
}

- (void)dealloc
{
  [MEMORY[0x263F71420] clearCache];
  v3.receiver = self;
  v3.super_class = (Class)CDMOverridesProtoService;
  [(CDMOverridesProtoService *)&v3 dealloc];
}

- (id)handle:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v55 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136315138;
    v69 = "-[CDMOverridesProtoService handle:]";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Service is handling command to match user request to database of overrides", (uint8_t *)&buf, 0xCu);
  }

  if (self->super.super._serviceState != 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Service is not ready to handle commands! State: %tu", self->super.super._serviceState);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int buf = 136315394;
      v69 = "-[CDMOverridesProtoService handle:]";
      __int16 v70 = 2112;
      v71 = v5;
      _os_log_error_impl(&dword_2263A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&buf, 0x16u);
    }

    v22 = objc_alloc_init(CDMOverridesProtoResponseCommand);
    id v6 = [(CDMBaseService *)self createErrorWithCode:1 description:v5];
    [(CDMBaseCommand *)v22 setCmdError:v6];
    goto LABEL_26;
  }
  id v5 = [v55 request];
  id v6 = [(__CFString *)v5 inputs];
  id v7 = [v6 objectAtIndex:0];
  id v8 = [v7 tokenChain];
  if (!v8) {
    goto LABEL_22;
  }
  v9 = [v7 tokenChain];
  v10 = [v9 tokens];
  if (!v10)
  {

    goto LABEL_22;
  }
  id v11 = [v7 tokenChain];
  v12 = [v11 tokens];
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
LABEL_22:
    v28 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
    {
      int buf = 136315650;
      v69 = "-[CDMOverridesProtoService handle:]";
      __int16 v70 = 2112;
      v71 = @"overrides";
      __int16 v72 = 2112;
      v73 = @"Request has no tokens; ignoring command.";
      _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
    }
    v22 = objc_alloc_init(CDMOverridesProtoResponseCommand);
    v29 = (void *)MEMORY[0x263F087E8];
    v24 = [(CDMBaseService *)self serviceName];
    uint64_t v66 = *MEMORY[0x263F08320];
    v67 = @"Request has no tokens; ignoring command.";
    v30 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v31 = [v29 errorWithDomain:v24 code:3 userInfo:v30];
    [(CDMBaseCommand *)v22 setCmdError:v31];

    goto LABEL_25;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v14 = [v7 tokenChain];
  id v15 = [v14 tokens];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v17 = *(void *)v58;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v58 != v17) {
        objc_enumerationMutation(v15);
      }
      if (![*(id *)(*((void *)&v57 + 1) + 8 * i) isWhitespace])
      {

        v33 = [v7 utterance];
        v34 = [v33 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
        [v7 setUtterance:v34];

        v24 = self;
        objc_sync_enter(v24);
        v35 = [v7 tokenChain];
        if (v35)
        {
          v36 = [v7 tokenChain];
          v37 = [v36 locale];
          if (v37)
          {
            v38 = [v7 tokenChain];
            v39 = [v38 locale];
            int v40 = [v39 isEqual:&stru_26DA24FF0];

            if (!v40)
            {
              v41 = [(__CFString *)v5 inputs];
              unsigned __int8 v56 = 0;
              v42 = [(CDMOverridesProtoService *)v24 matchOverride:v41 shouldAppend:&v56];
              if ([(__CFString *)v42 count])
              {
                int v43 = v56;
                v44 = CDMLogContext;
                BOOL v45 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
                if (v43)
                {
                  if (v45)
                  {
                    int buf = 136315650;
                    v69 = "-[CDMOverridesProtoService handle:]";
                    __int16 v70 = 2112;
                    v71 = @"overrides";
                    __int16 v72 = 2112;
                    v73 = v42;
                    _os_log_debug_impl(&dword_2263A0000, v44, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatched override(s) to append: %@", (uint8_t *)&buf, 0x20u);
                  }
                  v46 = [CDMOverridesProtoResponseCommand alloc];
                  uint64_t v47 = [(CDMOverridesProtoResponseCommand *)v46 initWithParsesForReplacement:MEMORY[0x263EFFA68] parsesForAppending:v42];
                }
                else
                {
                  if (v45)
                  {
                    int buf = 136315650;
                    v69 = "-[CDMOverridesProtoService handle:]";
                    __int16 v70 = 2112;
                    v71 = @"overrides";
                    __int16 v72 = 2112;
                    v73 = v42;
                    _os_log_debug_impl(&dword_2263A0000, v44, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatched override: %@", (uint8_t *)&buf, 0x20u);
                  }
                  v54 = [CDMOverridesProtoResponseCommand alloc];
                  uint64_t v47 = [(CDMOverridesProtoResponseCommand *)v54 initWithParsesForReplacement:v42 parsesForAppending:MEMORY[0x263EFFA68]];
                }
              }
              else
              {
                v52 = CDMLogContext;
                if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
                {
                  int buf = 136315394;
                  v69 = "-[CDMOverridesProtoService handle:]";
                  __int16 v70 = 2112;
                  v71 = @"overrides";
                  _os_log_debug_impl(&dword_2263A0000, v52, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNo overrides were matched to the request.", (uint8_t *)&buf, 0x16u);
                }
                v53 = [CDMOverridesProtoResponseCommand alloc];
                uint64_t v47 = [(CDMOverridesProtoResponseCommand *)v53 initWithParsesForReplacement:MEMORY[0x263EFFA68] parsesForAppending:MEMORY[0x263EFFA68]];
              }
              v22 = (CDMOverridesProtoResponseCommand *)v47;

LABEL_41:
              objc_sync_exit(v24);
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
        v48 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_ERROR))
        {
          int buf = 136315650;
          v69 = "-[CDMOverridesProtoService handle:]";
          __int16 v70 = 2112;
          v71 = @"overrides";
          __int16 v72 = 2112;
          v73 = @"Language code is not set; unable to perform override lookup.";
          _os_log_error_impl(&dword_2263A0000, v48, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
        }
        v22 = objc_alloc_init(CDMOverridesProtoResponseCommand);
        v49 = (void *)MEMORY[0x263F087E8];
        v41 = [(CDMBaseService *)v24 serviceName];
        uint64_t v61 = *MEMORY[0x263F08320];
        v62 = @"Language code is not set; unable to perform override lookup.";
        v50 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v51 = [v49 errorWithDomain:v41 code:3 userInfo:v50];
        [(CDMBaseCommand *)v22 setCmdError:v51];

        goto LABEL_41;
      }
    }
    uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_15:

  v19 = [v7 utterance];
  v20 = [v19 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  [v7 setUtterance:v20];

  v21 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
  {
    int buf = 136315650;
    v69 = "-[CDMOverridesProtoService handle:]";
    __int16 v70 = 2112;
    v71 = @"overrides";
    __int16 v72 = 2112;
    v73 = @"All tokens found contained only whitespace; ignoring command.";
    _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: [insights-cdm-%@]:\nOverrides skipped request: %@", (uint8_t *)&buf, 0x20u);
  }
  v22 = objc_alloc_init(CDMOverridesProtoResponseCommand);
  v23 = (void *)MEMORY[0x263F087E8];
  v24 = [(CDMBaseService *)self serviceName];
  uint64_t v63 = *MEMORY[0x263F08320];
  v64 = @"All tokens found contained only whitespace; ignoring command.";
  v25 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v26 = [v23 errorWithDomain:v24 code:3 userInfo:v25];
  [(CDMBaseCommand *)v22 setCmdError:v26];

LABEL_25:
LABEL_26:

  return v22;
}

- (id)setupFailedFor:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    v10 = "-[CDMOverridesProtoService setupFailedFor:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Overrides service failed to setup: %@", (uint8_t *)&v9, 0x16u);
  }

  self->super.super._serviceState = 3;
  id v6 = [(CDMBaseService *)self createSetupResponseCommand];
  id v7 = [(CDMBaseService *)self createErrorWithCode:0 description:v4];
  [v6 setCmdError:v7];

  return v6;
}

- (id)setupSucceeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[CDMOverridesProtoService setupSucceeded]";
    _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Overrides service has been setup successfully!", (uint8_t *)&v6, 0xCu);
  }

  self->super.super._serviceState = 2;
  id v4 = [(CDMBaseService *)self createSetupResponseCommand];
  return v4;
}

- (id)warmup:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  int v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    v18 = "-[CDMOverridesProtoService warmup:]";
    _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s Warming Up CDMOverridesProtoService", (uint8_t *)&v17, 0xCu);
  }

  id v7 = [(CDMOverridesProtoService *)v5 store];
  uint64_t v8 = [v4 dynamicConfig];
  int v9 = [v8 languageCode];
  [v7 preheatWithLanguageCode:v9];

  v10 = [(CDMOverridesProtoService *)v5 buildOverridesTurnInputAndPreprocessing];
  LOBYTE(v17) = 0;
  id v11 = [(CDMOverridesProtoService *)v5 matchOverride:v10 shouldAppend:&v17];

  objc_sync_exit(v5);
  id v12 = [CDMWarmupResponseCommand alloc];
  uint64_t v13 = [(CDMBaseService *)v5 serviceState];
  v14 = [(CDMBaseService *)v5 serviceName];
  id v15 = [(CDMWarmupResponseCommand *)v12 initWithServiceState:v13 serviceName:v14];

  return v15;
}

- (id)setup:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 136315138;
    v31 = "-[CDMOverridesProtoService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Beginning setup of new instance of Overrides (Protobuf) service", (uint8_t *)&v30, 0xCu);
  }

  int v6 = [v4 dynamicConfig];
  id v7 = [v6 languageCode];

  int v8 = [(id)objc_opt_class() isEnabled];
  int v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    if (v8) {
      v10 = "YES";
    }
    int v30 = 136315394;
    v31 = "-[CDMOverridesProtoService setup:]";
    __int16 v32 = 2080;
    v33 = v10;
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Is the Overrides (Protobuf) service enabled? %s", (uint8_t *)&v30, 0x16u);
  }

  if ((v8 & 1) == 0)
  {
    v26 = [(CDMOverridesProtoService *)self setupFailedFor:@"Feature flag prescribes that Overrides (Protobuf) service remain disabled; bailing."];
    goto LABEL_27;
  }
  id v11 = [v4 dynamicConfig];
  id v12 = [v11 getAssetForFactorName:@"com.apple.siri.nl.overrides"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v12;

  v14 = [v4 dynamicConfig];
  id v15 = [v14 getAssetBundlePathForFactorName:@"com.apple.siri.nl.overrides"];

  if (v15)
  {
    if (+[CDMFeatureFlags isTrieOverridesEnabled])
    {
      uint64_t v16 = [v15 resourcePath];
      int v17 = [v16 stringByAppendingPathComponent:@"trie_bundle"];

      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315394;
        v31 = "-[CDMOverridesProtoService setup:]";
        __int16 v32 = 2112;
        v33 = v17;
        _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s Overrides Trie asset bundle is:%@", (uint8_t *)&v30, 0x16u);
      }

      uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
      if ([v19 fileExistsAtPath:v17])
      {
        v20 = self;
        objc_sync_enter(v20);
        v21 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v30 = 136315138;
          v31 = "-[CDMOverridesProtoService setup:]";
          _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Trie Overrides Enabled! There is global overrides trie asset folder", (uint8_t *)&v30, 0xCu);
        }

        v22 = [[SiriNLUOverrideProxy alloc] initWithUseTrie:1 useMemory:0];
        store = v20->__store;
        v20->__store = v22;

        if ([(SiriNLUOverrideProxy *)v20->__store loadGlobalOverrideTrieStoreWithTrieFilePath:v17])
        {
          v24 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v30 = 136315138;
            v31 = "-[CDMOverridesProtoService setup:]";
            _os_log_impl(&dword_2263A0000, v24, OS_LOG_TYPE_INFO, "%s Trie Overrides store successfully initialized", (uint8_t *)&v30, 0xCu);
          }

          uint64_t v25 = [(CDMOverridesProtoService *)v20 setupSucceeded];
        }
        else
        {
          uint64_t v25 = [(CDMOverridesProtoService *)v20 setupFailedFor:@"Trie Overrides store unable to initialize"];
        }
        v26 = (void *)v25;
        objc_sync_exit(v20);

        goto LABEL_26;
      }
      v28 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[CDMOverridesProtoService setup:]";
        _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s Trie Overrides Enabled! But there is no trie asset folder. Fallback to load protobuf overrides assets.", (uint8_t *)&v30, 0xCu);
      }
    }
    uint64_t v27 = [(CDMOverridesProtoService *)self setupSucceeded];
  }
  else
  {
    uint64_t v27 = [(CDMOverridesProtoService *)self setupFailedFor:@"Unable to locate NSBundle of requisite file assets to handle requests"];
  }
  v26 = (void *)v27;
LABEL_26:

LABEL_27:
  return v26;
}

- (id)createSetupErrorCmd:(id)a3
{
  self->super.super._serviceState = 4;
  id v4 = a3;
  id v5 = [(CDMBaseService *)self createSetupResponseCommand];
  int v6 = [(CDMBaseService *)self createErrorWithCode:0 description:v4];

  [v5 setCmdError:v6];
  return v5;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  int v6 = @"nlv4_overrides";
  id v7 = @"com.apple.siri.nl.overrides";
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:1];

  return v2;
}

@end