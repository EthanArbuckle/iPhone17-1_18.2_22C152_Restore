@interface CDMUaaPNLProtoService
+ (BOOL)isEnabled;
+ (id)createErrorResponse:(id)a3;
+ (id)detectForegroundAppForLocale:(id)a3;
+ (id)getCDMServiceAssetConfig;
+ (id)loadAppModelBundles:(id)a3;
+ (id)loadModelBundle:(id)a3 error:(id *)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (int)getOverrideNamespace;
- (void)loadOverrides:(id)a3;
@end

@implementation CDMUaaPNLProtoService

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
  return +[CDMFeatureFlags isUaaPEnabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->__appModelBundles, 0);
  objc_storeStrong((id *)&self->__coreModelBundle, 0);
}

- (void)loadOverrides:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  v6 = [v4 defaultManager];
  v7 = [NSURL URLWithString:@"overrides.pb" relativeToURL:v5];

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [v7 path];
  if (!v8) {
    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = [v7 path];
  char v11 = [v6 fileExistsAtPath:v10];

  if (v11)
  {
    v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7];
    if (v12)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v12];
      id v14 = objc_alloc_init(MEMORY[0x263F71E90]);
      [v14 readFrom:v13];
      [(CDMUaaPNLProtoService *)self addOverride:v14];
      v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        v17 = "-[CDMUaaPNLProtoService loadOverrides:]";
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s UaaP added override from pb file: %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
LABEL_8:
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      v17 = "-[CDMUaaPNLProtoService loadOverrides:]";
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s UaaP component override file is missing", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)handle:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CDMUaaPNLProtoService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling UAAP Inference", buf, 0xCu);
  }

  if (self->super.super._serviceState == 2)
  {
    v6 = [v4 parserRequest];
    v7 = [v6 tokenChain];

    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v30 = [v7 stringValue];
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMUaaPNLProtoService handle:]";
      __int16 v36 = 2112;
      int64_t v37 = (int64_t)v30;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Handling UaaP request for utterance: %@", buf, 0x16u);
    }
    v9 = [v4 parserRequest];
    char v10 = [v9 hasTokenChain];

    if (v10)
    {
      char v11 = +[CDMUaaPNLModelBundleFilter selectModelBundlesForLoadedAppModelBundles:self->__appModelBundles];
      v12 = v11;
      if (v11 && [v11 count])
      {
        id v13 = objc_alloc(MEMORY[0x263F72020]);
        id v14 = [(UPModelBundle *)self->__coreModelBundle parserModel];
        id v15 = (id)[v13 initWithCoreModel:v14 domainModelBundles:v12];

        int v16 = [v4 parserRequest];
        id v33 = 0;
        v17 = [v15 predictionFromProtobufQuery:v16 error:&v33];
        id v18 = v33;

        if (v17)
        {
          if ([v17 hypothesesCount])
          {
            v19 = [v17 hypotheses];
            id v20 = objc_alloc_init(MEMORY[0x263F71CB0]);
            v21 = [v4 requestId];
            [v20 setRequestId:v21];

            [v20 setParses:v19];
            v22 = [[CDMUaaPNLProtoResponseCommand alloc] initWithParserResponse:v17 nluResponse:v20];
          }
          else
          {
            v31 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = [v18 localizedDescription];
              *(_DWORD *)buf = 136315394;
              v35 = "-[CDMUaaPNLProtoService handle:]";
              __int16 v36 = 2112;
              int64_t v37 = (int64_t)v32;
              _os_log_impl(&dword_2263A0000, v31, OS_LOG_TYPE_INFO, "%s [WARN]: UaaP provided no candidate parses: %@", buf, 0x16u);
            }
            v22 = +[CDMUaaPNLProtoService createErrorResponse:v18];
          }
        }
        else
        {
          v29 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[CDMUaaPNLProtoService handle:]";
            _os_log_impl(&dword_2263A0000, v29, OS_LOG_TYPE_INFO, "%s [WARN]: Received no UaaP result", buf, 0xCu);
          }

          v22 = +[CDMUaaPNLProtoService createErrorResponse:v18];
        }
      }
      else
      {
        id v15 = objc_alloc_init(MEMORY[0x263F71CB0]);
        v26 = [v4 requestId];
        [v15 setRequestId:v26];

        id v27 = objc_alloc_init(MEMORY[0x263F71F38]);
        v22 = [[CDMUaaPNLProtoResponseCommand alloc] initWithParserResponse:v27 nluResponse:v15];
      }
    }
    else
    {
      v25 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CDMUaaPNLProtoService handle:]";
        _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: CDM tokens empty", buf, 0xCu);
      }

      v12 = [MEMORY[0x263F087E8] errorWithDomain:@"UaaPNLProtobufServiceError" code:0 userInfo:0];
      v22 = +[CDMUaaPNLProtoService createErrorResponse:v12];
    }
  }
  else
  {
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int64_t serviceState = self->super.super._serviceState;
      *(_DWORD *)buf = 136315394;
      v35 = "-[CDMUaaPNLProtoService handle:]";
      __int16 v36 = 2048;
      int64_t v37 = serviceState;
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v7 = [(CDMBaseService *)self createErrorWithCode:1 description:@"UaaP service is not ready"];
    v22 = +[CDMUaaPNLProtoService createErrorResponse:v7];
  }

  return v22;
}

- (id)setup:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->super.super._int64_t serviceState = 2;
  id v5 = [v4 dynamicConfig];
  v6 = [v5 getAssetForFactorName:@"com.apple.siri.nl.uaap.ssu"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v6;

  uint64_t v8 = [v4 dynamicConfig];
  v9 = [v8 getAssetBundlePathForFactorName:@"com.apple.siri.nl.uaap.ssu"];

  char v10 = [v9 bundlePath];
  if (([(id)objc_opt_class() isEnabled] & 1) == 0)
  {
    self->super.super._int64_t serviceState = 4;
    v35 = [(CDMBaseService *)self createSetupResponseCommand];
    goto LABEL_35;
  }
  char v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[CDMUaaPNLProtoService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Fetching core model configuration", buf, 0xCu);
  }

  v12 = [v4 dynamicConfig];
  id v13 = [v12 languageCode];
  id v49 = 0;
  id v14 = +[CDMUaaPNLModelProvider getCoreModelConfigurationForLocale:v13 bundlePath:v10 error:&v49];
  id v15 = v49;

  int v16 = CDMOSLoggerForCategory(0);
  v17 = v16;
  if (!v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v36 = [v15 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v51 = "-[CDMUaaPNLProtoService setup:]";
      __int16 v52 = 2112;
      NSUInteger v53 = (NSUInteger)v36;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to fetch core model configuration: %@", buf, 0x16u);
    }
    v35 = [(CDMBaseService *)self createSetupResponseCommand];
    goto LABEL_34;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[CDMUaaPNLProtoService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Loading core model bundle", buf, 0xCu);
  }

  id v48 = 0;
  id v18 = +[CDMUaaPNLProtoService loadModelBundle:v14 error:&v48];
  id v46 = v48;
  coreModelBundle = self->__coreModelBundle;
  self->__coreModelBundle = v18;

  id v20 = self->__coreModelBundle;
  v21 = CDMOSLoggerForCategory(0);
  v22 = v21;
  if (!v20)
  {
    int64_t v37 = v46;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = [v46 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v51 = "-[CDMUaaPNLProtoService setup:]";
      __int16 v52 = 2112;
      NSUInteger v53 = (NSUInteger)v38;
      _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load core model bundle: %@", buf, 0x16u);
    }
    v35 = [(CDMBaseService *)self createSetupResponseCommand];
    goto LABEL_33;
  }
  id v44 = v15;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[CDMUaaPNLProtoService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s Fetching app model configurations", buf, 0xCu);
  }

  v23 = objc_alloc_init(CDMUaaPNLModelProvider);
  v24 = [v4 dynamicConfig];
  v25 = [v24 languageCode];
  id v47 = 0;
  v26 = [(CDMUaaPNLModelProvider *)v23 getModelConfigsForLocale:v25 error:&v47];
  id v45 = v47;

  if (!v26)
  {
    v39 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = [v45 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v51 = "-[CDMUaaPNLProtoService setup:]";
      __int16 v52 = 2112;
      NSUInteger v53 = (NSUInteger)v40;
      _os_log_impl(&dword_2263A0000, v39, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to fetch any app configuration (are any UaaP-enabled apps present?): %@", buf, 0x16u);
    }
    v41 = [MEMORY[0x263EFFA08] set];
    appModelBundles = self->__appModelBundles;
    self->__appModelBundles = v41;
    goto LABEL_32;
  }
  uint64_t v27 = [v26 count];
  v28 = CDMOSLoggerForCategory(0);
  appModelBundles = (NSSet *)v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[CDMUaaPNLProtoService setup:]";
      _os_log_debug_impl(&dword_2263A0000, &appModelBundles->super, OS_LOG_TYPE_DEBUG, "%s Loading app model bundles", buf, 0xCu);
    }

    v30 = +[CDMUaaPNLProtoService loadAppModelBundles:v26];
    v31 = self->__appModelBundles;
    self->__appModelBundles = v30;

    NSUInteger v32 = [(NSSet *)self->__appModelBundles count];
    id v33 = CDMOSLoggerForCategory(0);
    appModelBundles = (NSSet *)v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        NSUInteger v34 = [(NSSet *)self->__appModelBundles count];
        *(_DWORD *)buf = 136315394;
        v51 = "-[CDMUaaPNLProtoService setup:]";
        __int16 v52 = 2048;
        NSUInteger v53 = v34;
        _os_log_debug_impl(&dword_2263A0000, &appModelBundles->super, OS_LOG_TYPE_DEBUG, "%s Loaded %lu app model bundles", buf, 0x16u);
      }
      goto LABEL_32;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[CDMUaaPNLProtoService setup:]";
      v42 = "%s [WARN]: Failed to load any app model bundles (despite having configurations)";
      goto LABEL_31;
    }
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[CDMUaaPNLProtoService setup:]";
    v42 = "%s [WARN]: getModelConfigsForLocale returned an unexpected empty set";
LABEL_31:
    _os_log_impl(&dword_2263A0000, &appModelBundles->super, OS_LOG_TYPE_INFO, v42, buf, 0xCu);
  }
LABEL_32:
  int64_t v37 = v46;

  v35 = [(CDMBaseService *)self createSetupResponseCommand];

  id v15 = v44;
LABEL_33:

LABEL_34:
LABEL_35:

  return v35;
}

- (int)getOverrideNamespace
{
  return 0;
}

+ (id)loadModelBundle:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F72000];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithModelConfiguration:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F72018] modelWithLoadedModelConfiguration:v7 error:a4];
    if (v8)
    {
      int v9 = [v7 hasCalibrationModel];
      char v10 = CDMOSLoggerForCategory(0);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9)
      {
        if (v11)
        {
          int v20 = 136315138;
          v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
          _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Found calibration model in configuration: loading it", (uint8_t *)&v20, 0xCu);
        }

        v12 = [MEMORY[0x263F71FE8] modelWithLoadedModelConfiguration:v7 error:a4];
        if (!v12)
        {
          id v13 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v20 = 136315138;
            v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
            _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load calibration model", (uint8_t *)&v20, 0xCu);
          }

          if (a4)
          {
            id v14 = (void *)MEMORY[0x263F087E8];
            uint64_t v15 = 2;
LABEL_19:
            [v14 errorWithDomain:@"UaaPNLProtobufServiceError" code:v15 userInfo:0];
            v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

            goto LABEL_27;
          }
          goto LABEL_25;
        }
      }
      else
      {
        if (v11)
        {
          int v20 = 136315138;
          v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
          _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Did not find calibration model in configuration: calibration will be disabled", (uint8_t *)&v20, 0xCu);
        }

        v12 = 0;
      }
      v17 = (void *)[objc_alloc(MEMORY[0x263F72008]) initWithLoadedModelConfiguration:v7 parserModel:v8 calibrationModel:v12];

      goto LABEL_26;
    }
    id v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load parser model", (uint8_t *)&v20, 0xCu);
    }

    if (a4)
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = 3;
      goto LABEL_19;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  int v16 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    v21 = "+[CDMUaaPNLProtoService loadModelBundle:error:]";
    _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load model configuration from disk", (uint8_t *)&v20, 0xCu);
  }

  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"UaaPNLProtobufServiceError" code:1 userInfo:0];
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_27:

  return v17;
}

+ (id)createErrorResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CDMUaaPNLProtoResponseCommand);
  [(CDMBaseCommand *)v4 setCmdError:v3];

  return v4;
}

+ (id)detectForegroundAppForLocale:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(CDMUaaPNLModelProvider);
  id v15 = 0;
  id v5 = [(CDMUaaPNLModelProvider *)v4 getForegroundModelConfigForLocale:v3 error:&v15];

  id v6 = v15;
  if (v5)
  {
    id v14 = v6;
    v7 = +[CDMUaaPNLProtoService loadModelBundle:v5 error:&v14];
    id v8 = v14;

    if (v7)
    {
      int v9 = v7;
      char v10 = v9;
    }
    else
    {
      BOOL v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [v8 description];
        *(_DWORD *)buf = 136315394;
        v17 = "+[CDMUaaPNLProtoService detectForegroundAppForLocale:]";
        __int16 v18 = 2112;
        v19 = v13;
        _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Failed to create foreground UaaP parser model %@", buf, 0x16u);
      }
      int v9 = 0;
      char v10 = 0;
    }
  }
  else
  {
    int v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[CDMUaaPNLProtoService detectForegroundAppForLocale:]";
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Failed to find foreground app model configuration", buf, 0xCu);
    }
    char v10 = 0;
    id v8 = v6;
  }

  return v10;
}

+ (id)loadAppModelBundles:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 136315394;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v18 = 0;
        v12 = +[CDMUaaPNLProtoService loadModelBundle:error:](CDMUaaPNLProtoService, "loadModelBundle:error:", v11, &v18, v17);
        id v13 = v18;
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          id v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [v13 localizedDescription];
            *(_DWORD *)buf = v17;
            v24 = "+[CDMUaaPNLProtoService loadAppModelBundles:]";
            __int16 v25 = 2112;
            v26 = v15;
            _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Error initializing model bundle: %@. Skipping.", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  uint64_t v6 = @"uaap/ssu";
  long long v7 = @"com.apple.siri.nl.uaap.ssu";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

@end