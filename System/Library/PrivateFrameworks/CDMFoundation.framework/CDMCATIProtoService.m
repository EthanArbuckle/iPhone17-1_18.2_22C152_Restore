@interface CDMCATIProtoService
+ (BOOL)isEnabled;
+ (id)getCDMServiceAssetConfig;
- (id)getChildServices;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)setupErrorResponse:(id)a3 serviceState:(int64_t)a4;
- (int64_t)getServiceState;
@end

@implementation CDMCATIProtoService

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
  return +[CDMFeatureFlags isCATIEnabled];
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = @"cati_models";
  v7 = @"com.apple.siri.nl.cati";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlAsset, 0);
  objc_storeStrong((id *)&self->_childServices, 0);
  objc_storeStrong((id *)&self->_catiBundle, 0);
}

- (id)getChildServices
{
  v2 = (void *)[(NSMutableArray *)self->_childServices copy];
  return v2;
}

- (int64_t)getServiceState
{
  return self->super.super._serviceState;
}

- (id)handle:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMCATIProtoService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling CATI ", buf, 0xCu);
  }

  if ([(CDMCATIProtoService *)self getServiceState] == 2)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = [(CDMCATIProtoService *)self getChildServices];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) handle:v4 assetVersion:self->_assetVersion];
          if (v11) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v8);
    }

    id v12 = objc_alloc_init(MEMORY[0x263F71DD0]);
    [v12 setHypotheses:v6];
    if (![v6 count])
    {
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[CDMCATIProtoService handle:]";
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s No child service produced a hypothesis", buf, 0xCu);
      }
    }
    v14 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[CDMCATIProtoService handle:]";
      __int16 v25 = 2112;
      v26 = @"cati";
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nCATIResponse: %@", buf, 0x20u);
    }
    v15 = objc_alloc_init(CDMCATIProtoResponseCommand);
    [(CDMCATIProtoResponseCommand *)v15 setResponse:v12];
  }
  else
  {
    v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int64_t v17 = [(CDMCATIProtoService *)self getServiceState];
      *(_DWORD *)buf = 136315394;
      v24 = "-[CDMCATIProtoService handle:]";
      __int16 v25 = 2048;
      v26 = (__CFString *)v17;
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v15 = objc_alloc_init(CDMCATIProtoResponseCommand);
    id v6 = [(CDMBaseService *)self createErrorWithCode:1 description:&stru_26DA24FF0];
    [(CDMBaseCommand *)v15 setCmdError:v6];
  }

  return v15;
}

- (id)setupErrorResponse:(id)a3 serviceState:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  self->super.super._serviceState = a4;
  v7 = [(CDMBaseService *)self createSetupResponseCommand];
  uint64_t v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315394;
    id v12 = "-[CDMCATIProtoService setupErrorResponse:serviceState:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = [(CDMBaseService *)self createErrorWithCode:1 description:v6];
  [v7 setCmdError:v9];

  return v7;
}

- (id)setup:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v4 = CDMOSLoggerForCategory(0);
  v58 = self;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v76 = "-[CDMCATIProtoService setup:]";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Begin CATI setup", buf, 0xCu);
  }

  v5 = [v57 dynamicConfig];
  id v6 = [v5 getAssetForFactorName:@"com.apple.siri.nl.cati"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v6;

  uint64_t v8 = [v57 dynamicConfig];
  v55 = [v8 getAssetForFactorName:@"com.apple.siri.nl.cati"];

  if (!v55 || ![(__CFString *)v55 getAssetType])
  {
    long long v22 = [(CDMCATIProtoService *)self setupErrorResponse:@"Not able to find/load CATI assets" serviceState:3];
    goto LABEL_71;
  }
  uint64_t v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v76 = "-[CDMCATIProtoService setup:]";
    __int16 v77 = 2112;
    v78 = v55;
    __int16 v79 = 2112;
    v80 = @"com.apple.siri.nl.cati";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Asset is: [%@] for factor: %@.", buf, 0x20u);
  }

  v10 = [v57 dynamicConfig];
  int v11 = [v10 getAssetBundlePathForFactorName:@"com.apple.siri.nl.cati"];
  catiBundle = self->_catiBundle;
  self->_catiBundle = v11;

  v54 = [(__CFString *)v55 getAssetVersion];
  __int16 v13 = [v54 componentsSeparatedByString:@"."];
  id v14 = [v13 firstObject];
  self->_assetVersion = [v14 integerValue];

  if (self->_catiBundle)
  {
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    childServices = self->_childServices;
    self->_childServices = v15;

    int64_t v17 = [MEMORY[0x263F08850] defaultManager];
    v18 = [(NSBundle *)self->_catiBundle resourcePath];
    v53 = [v17 contentsOfDirectoryAtPath:v18 error:0];

    id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (self->_assetVersion > 3103)
    {
      if (![v53 count])
      {
        v38 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "-[CDMCATIProtoService setup:]";
          __int16 v77 = 2112;
          v78 = @"The cati_models directory is empty";
          _os_log_debug_impl(&dword_2263A0000, v38, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        }

        uint64_t v39 = [(CDMCATIProtoService *)self setupErrorResponse:@"The cati_models directory is empty" serviceState:3];
        goto LABEL_65;
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v19 = v53;
      uint64_t v23 = [(CDMCATIChildService *)v19 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v69 != v24) {
              objc_enumerationMutation(v19);
            }
            v26 = *(__CFString **)(*((void *)&v68 + 1) + 8 * i);
            __int16 v27 = (void *)MEMORY[0x263F086E0];
            id v28 = [(NSBundle *)v58->_catiBundle resourcePath];
            v29 = [v28 stringByAppendingPathComponent:v26];
            uint64_t v30 = [v27 bundleWithPath:v29];

            char v67 = 0;
            v31 = [MEMORY[0x263F08850] defaultManager];
            v32 = [v30 resourcePath];
            char v33 = [v31 fileExistsAtPath:v32 isDirectory:&v67];
            if (v67) {
              char v34 = v33;
            }
            else {
              char v34 = 0;
            }

            if (v34)
            {
              v35 = [[CDMCATIChildService alloc] initWithAssetBundle:v30];
              v36 = [(CDMCATIChildService *)v35 setup:v57 assetVersion:v58->_assetVersion];
              if (v36)
              {
                v37 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v76 = "-[CDMCATIProtoService setup:]";
                  __int16 v77 = 2112;
                  v78 = v36;
                  _os_log_debug_impl(&dword_2263A0000, v37, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
                }

                [v56 addObject:v36];
              }
              else
              {
                [(NSMutableArray *)v58->_childServices addObject:v35];
              }
            }
            else
            {
              CDMOSLoggerForCategory(0);
              v35 = (CDMCATIChildService *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v35->super, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v76 = "-[CDMCATIProtoService setup:]";
                __int16 v77 = 2112;
                v78 = v26;
                _os_log_debug_impl(&dword_2263A0000, &v35->super, OS_LOG_TYPE_DEBUG, "%s %@ is not a valid directory", buf, 0x16u);
              }
            }
          }
          uint64_t v23 = [(CDMCATIChildService *)v19 countByEnumeratingWithState:&v68 objects:v74 count:16];
        }
        while (v23);
      }
    }
    else
    {
      long long v19 = [[CDMCATIChildService alloc] initWithAssetBundle:self->_catiBundle];
      long long v20 = [(CDMCATIChildService *)v19 setup:v57 assetVersion:self->_assetVersion];
      if (v20)
      {
        long long v21 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "-[CDMCATIProtoService setup:]";
          __int16 v77 = 2112;
          v78 = v20;
          _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        }

        long long v22 = [(CDMCATIProtoService *)self setupErrorResponse:v20 serviceState:3];

LABEL_68:
        goto LABEL_69;
      }
      [(NSMutableArray *)self->_childServices addObject:v19];
    }

    if (![(NSMutableArray *)v58->_childServices count])
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v46 = v56;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v64;
        long long v19 = (CDMCATIChildService *)@"No CATI child services were made, the following errors occurred:";
        do
        {
          uint64_t v49 = 0;
          v50 = v19;
          do
          {
            if (*(void *)v64 != v48) {
              objc_enumerationMutation(v46);
            }
            long long v19 = [(CDMCATIChildService *)v50 stringByAppendingFormat:@" %@, ", *(void *)(*((void *)&v63 + 1) + 8 * v49)];

            ++v49;
            v50 = v19;
          }
          while (v47 != v49);
          uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v73 count:16];
        }
        while (v47);
      }
      else
      {
        long long v19 = (CDMCATIChildService *)@"No CATI child services were made, the following errors occurred:";
      }

      long long v22 = [(CDMCATIProtoService *)v58 setupErrorResponse:v19 serviceState:3];
      goto LABEL_68;
    }
    if ([v56 count])
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v40 = v56;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v60;
        v43 = @"Some CATI child services did not set up correctly, the following errors occurred:";
        do
        {
          uint64_t v44 = 0;
          v45 = v43;
          do
          {
            if (*(void *)v60 != v42) {
              objc_enumerationMutation(v40);
            }
            v43 = [v45 stringByAppendingFormat:@" %@, ", *(void *)(*((void *)&v59 + 1) + 8 * v44)];

            ++v44;
            v45 = v43;
          }
          while (v41 != v44);
          uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v72 count:16];
        }
        while (v41);
      }
      else
      {
        v43 = @"Some CATI child services did not set up correctly, the following errors occurred:";
      }

      v51 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v76 = "-[CDMCATIProtoService setup:]";
        __int16 v77 = 2112;
        v78 = (__CFString *)v43;
        _os_log_impl(&dword_2263A0000, v51, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }
    }
    else
    {
      v43 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[CDMCATIProtoService setup:]";
        _os_log_debug_impl(&dword_2263A0000, v43, OS_LOG_TYPE_DEBUG, "%s All child services set up successfully", buf, 0xCu);
      }
    }

    v58->super.super._serviceState = 2;
    uint64_t v39 = [(CDMBaseService *)v58 createSetupResponseCommand];
LABEL_65:
    long long v22 = (void *)v39;
LABEL_69:

    goto LABEL_70;
  }
  long long v22 = [(CDMCATIProtoService *)self setupErrorResponse:@"Not able to find/load CATI model bundle directory" serviceState:3];
LABEL_70:

LABEL_71:
  return v22;
}

@end