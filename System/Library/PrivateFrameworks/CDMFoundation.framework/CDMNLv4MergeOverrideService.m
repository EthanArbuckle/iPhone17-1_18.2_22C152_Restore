@interface CDMNLv4MergeOverrideService
+ (BOOL)isEnabled;
- (BOOL)InitializeNLv4OverrideStore:(id)a3;
- (BOOL)isOverrideServiceEnabled;
- (SiriNLUOverrideProxy)store;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)setupFailedFor:(id)a3;
- (id)setupSucceeded;
@end

@implementation CDMNLv4MergeOverrideService

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
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (SiriNLUOverrideProxy)store
{
  return self->_store;
}

- (BOOL)isOverrideServiceEnabled
{
  return +[CDMFeatureFlags isNLv4ServiceOverridesEnabled];
}

- (id)setupFailedFor:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    v10 = "-[CDMNLv4MergeOverrideService setupFailedFor:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4 Overrides service failed to setup: %@", (uint8_t *)&v9, 0x16u);
  }

  self->super.super._serviceState = 3;
  v6 = [(CDMBaseService *)self createSetupResponseCommand];
  v7 = [(CDMBaseService *)self createErrorWithCode:0 description:v4];
  [v6 setCmdError:v7];

  return v6;
}

- (id)setupSucceeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[CDMNLv4MergeOverrideService setupSucceeded]";
    _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s NLv4 Overrides service has been setup successfully!", (uint8_t *)&v6, 0xCu);
  }

  self->super.super._serviceState = 2;
  id v4 = [(CDMBaseService *)self createSetupResponseCommand];
  return v4;
}

- (id)handle:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CDMNLv4MergeOverrideService *)self isOverrideServiceEnabled];
  int v6 = @"disabled";
  if (v5) {
    int v6 = @"enabled";
  }
  v7 = v6;
  os_signpost_id_t v8 = os_signpost_id_generate((os_log_t)CDMLogContext);
  int v9 = (id)CDMLogContext;
  v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "NLv4MergeOverride", "invokeNLv4MergeOverrideService: %@", buf, 0xCu);
  }

  if (v5 && self->_store)
  {
    id v12 = [v4 request];
    uint64_t v13 = [v12 inputs];

    uint64_t v14 = [(SiriNLUOverrideProxy *)self->_store matchWithInputs:v13 overrideNamespace:5];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (id)CDMLogContext;
      v17 = v16;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v17, OS_SIGNPOST_INTERVAL_END, v8, "NLv4MergeOverride", "", buf, 2u);
      }

      v18 = [CDMOverridesProtoResponseCommand alloc];
      v19 = [v15 userParse];
      v24 = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      v21 = [(CDMOverridesProtoResponseCommand *)v18 initWithParsesForReplacement:v20 parsesForAppending:MEMORY[0x263EFFA68]];

      goto LABEL_18;
    }
  }
  v22 = (id)CDMLogContext;
  uint64_t v13 = v22;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v13, OS_SIGNPOST_INTERVAL_END, v8, "NLv4MergeOverride", "", buf, 2u);
  }
  v21 = 0;
LABEL_18:

  return v21;
}

- (BOOL)InitializeNLv4OverrideStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Overrides Trie asset bundle is:%@", (uint8_t *)&v12, 0x16u);
  }

  int v6 = [[SiriNLUOverrideProxy alloc] initWithUseTrie:1 useMemory:0];
  store = self->_store;
  self->_store = v6;

  BOOL v8 = [(SiriNLUOverrideProxy *)self->_store loadComponentOverrideTrieStoreWithTrieFilePath:v4];
  int v9 = CDMOSLoggerForCategory(0);
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
      _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s NLv4 Overrides store successfully initialized", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMNLv4MergeOverrideService InitializeNLv4OverrideStore:]";
    _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4 Overrides store unable to initialize", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

- (id)setup:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 136315138;
    v38 = "-[CDMNLv4MergeOverrideService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Beginning setup of new instance of NLv4 Service Overrides service", (uint8_t *)&v37, 0xCu);
  }

  BOOL v6 = [(CDMNLv4MergeOverrideService *)self isOverrideServiceEnabled];
  v7 = @"disabled";
  if (v6) {
    v7 = @"enabled";
  }
  BOOL v8 = v7;
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v10 = (id)CDMLogContext;
  unint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v37 = 138412290;
    v38 = (const char *)v8;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NLv4MergeOverride", "setupNLv4MergeOverrideService: %@", (uint8_t *)&v37, 0xCu);
  }

  if (v6)
  {
    uint64_t v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315138;
      v38 = "-[CDMNLv4MergeOverrideService setup:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s The NLv4 Overrides service is enabled", (uint8_t *)&v37, 0xCu);
    }

    __int16 v14 = [v4 dynamicConfig];
    id v15 = [v14 getAssetForFactorName:@"com.apple.siri.nl.nlv4"];
    nlAsset = self->_nlAsset;
    self->_nlAsset = v15;

    v17 = [v4 dynamicConfig];
    v18 = [v17 getAssetBundlePathForFactorName:@"com.apple.siri.nl.nlv4"];

    if (!v18)
    {
      uint64_t v27 = (id)CDMLogContext;
      v28 = v27;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(v37) = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v28, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", "", (uint8_t *)&v37, 2u);
      }

      v29 = [(CDMNLv4MergeOverrideService *)self setupFailedFor:@"Unable to locate NSBundle of requisite file assets to handle requests"];
      goto LABEL_40;
    }
    if (+[CDMFeatureFlags isTrieOverridesEnabled])
    {
      v19 = [v18 resourcePath];
      v20 = [v19 stringByAppendingPathComponent:@"trie_bundle"];

      v21 = [MEMORY[0x263F08850] defaultManager];
      if ([v21 fileExistsAtPath:v20])
      {
        v22 = self;
        objc_sync_enter(v22);
        if ([(CDMNLv4MergeOverrideService *)v22 InitializeNLv4OverrideStore:v20])
        {
          v23 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            int v37 = 136315138;
            v38 = "-[CDMNLv4MergeOverrideService setup:]";
            _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s Trie Overrides: Loaded NLv4 overrides bundle", (uint8_t *)&v37, 0xCu);
          }

          v24 = (id)CDMLogContext;
          v25 = v24;
          if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
          {
            LOWORD(v37) = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v25, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", "", (uint8_t *)&v37, 2u);
          }

          uint64_t v26 = [(CDMNLv4MergeOverrideService *)v22 setupSucceeded];
        }
        else
        {
          v33 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v37 = 136315138;
            v38 = "-[CDMNLv4MergeOverrideService setup:]";
            _os_log_error_impl(&dword_2263A0000, v33, OS_LOG_TYPE_ERROR, "%s [ERR]: Trie Overrides: Failed to load NLv4 overrides bundle", (uint8_t *)&v37, 0xCu);
          }

          v34 = (id)CDMLogContext;
          v35 = v34;
          if (v12 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
          {
            LOWORD(v37) = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v35, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", "", (uint8_t *)&v37, 2u);
          }

          uint64_t v26 = [(CDMNLv4MergeOverrideService *)v22 setupFailedFor:@"Failed to load NLv4 overrides bundle. See CDM Logs for details"];
        }
        v29 = (void *)v26;
        objc_sync_exit(v22);

LABEL_40:
        goto LABEL_41;
      }
      v30 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v37 = 136315138;
        v38 = "-[CDMNLv4MergeOverrideService setup:]";
        _os_log_impl(&dword_2263A0000, v30, OS_LOG_TYPE_INFO, "%s [WARN]: NLv4 Overrides Enabled! There is no NLv4 overrides trie asset folder. Setting up CDM anyways", (uint8_t *)&v37, 0xCu);
      }
    }
  }
  v31 = (id)CDMLogContext;
  v32 = v31;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v32, OS_SIGNPOST_INTERVAL_END, v9, "NLv4MergeOverride", "", (uint8_t *)&v37, 2u);
  }

  v29 = [(CDMNLv4MergeOverrideService *)self setupSucceeded];
LABEL_41:

  return v29;
}

@end