@interface CDMDynamicConfig
+ (id)resolveActiveGraph:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWithoutSandboxId:(id)a3;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 embeddingVersion:(id)a4 graphName:(id)a5 sandboxId:(id)a6 assetPaths:(id)a7 assetDirPath:(id)a8 overrideSiriVocabSpans:(id)a9 overrideMentions:(id)a10 overrideContextualSpans:(id)a11 serviceStateDirectory:(id)a12;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 assetDirPath:(id)a7 overrideSiriVocabSpans:(id)a8 overrideMentions:(id)a9 overrideContextualSpans:(id)a10 serviceStateDirectory:(id)a11;
- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9;
- (CDMEmbeddingConfigs)embeddingConfigs;
- (CDMNLAssetCollection)assetCollection;
- (NSArray)overrideContextualSpans;
- (NSArray)overrideMentions;
- (NSArray)overrideSiriVocabSpans;
- (NSString)assetDirPath;
- (NSString)embeddingVersion;
- (NSString)graphName;
- (NSString)languageCode;
- (NSString)serviceStateDirectory;
- (NSString)siriVocabularySandboxId;
- (id)assetPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getAssetBundlePathForFactorName:(id)a3;
- (id)getAssetForFactorName:(id)a3;
- (unint64_t)hash;
- (void)setAssetCollection:(id)a3;
- (void)setAssetDirPath:(id)a3;
- (void)setAssetPaths:(id)a3;
- (void)setEmbeddingConfigs:(id)a3;
- (void)setEmbeddingVersion:(id)a3;
- (void)setGraphName:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setOverrideContextualSpans:(id)a3;
- (void)setOverrideMentions:(id)a3;
- (void)setOverrideSiriVocabSpans:(id)a3;
- (void)setServiceStateDirectory:(id)a3;
- (void)setSiriVocabularySandboxId:(id)a3;
@end

@implementation CDMDynamicConfig

- (CDMDynamicConfig)initWithLanguageCode:(id)a3
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 graphName:0 sandboxId:0 assetPaths:0 assetDirPath:0 overrideSiriVocabSpans:0 overrideMentions:0 overrideContextualSpans:0 serviceStateDirectory:0];
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 assetDirPath:(id)a7 overrideSiriVocabSpans:(id)a8 overrideMentions:(id)a9 overrideContextualSpans:(id)a10 serviceStateDirectory:(id)a11
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 embeddingVersion:0 graphName:a4 sandboxId:a5 assetPaths:a6 assetDirPath:a7 overrideSiriVocabSpans:a8 overrideMentions:a9 overrideContextualSpans:a10 serviceStateDirectory:a11];
}

- (CDMEmbeddingConfigs)embeddingConfigs
{
  return self->_embeddingConfigs;
}

- (id)assetPaths
{
  return [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
}

- (void)setEmbeddingConfigs:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (CDMEmbeddingConfigs *)a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    v8 = "-[CDMDynamicConfig setEmbeddingConfigs:]";
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Set embedding configs to be: %@.", (uint8_t *)&v7, 0x16u);
  }

  embeddingConfigs = self->_embeddingConfigs;
  self->_embeddingConfigs = v4;
}

- (CDMNLAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)graphName
{
  return self->_graphName;
}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (NSString)assetDirPath
{
  return self->_assetDirPath;
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 embeddingVersion:(id)a4 graphName:(id)a5 sandboxId:(id)a6 assetPaths:(id)a7 assetDirPath:(id)a8 overrideSiriVocabSpans:(id)a9 overrideMentions:(id)a10 overrideContextualSpans:(id)a11 serviceStateDirectory:(id)a12
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v36 = a4;
  id v18 = a5;
  id obj = a6;
  id v19 = a6;
  id v39 = a7;
  id v20 = a8;
  v21 = v19;
  id v38 = v20;
  id v22 = a9;
  id v35 = a10;
  id v34 = a11;
  id v33 = a12;
  if (v19 && v22)
  {
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrid"
            "eSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:]";
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s [WARN]: Both sandboxId and overrideSiriVocabSpans are attempted to be set in the CDMDynamicConfig! Only one of these should be set. If both are set, sandboxId will be ignored and only overrideSiriVocabSpans will be used.", buf, 0xCu);
    }

    v21 = v19;
  }
  v40.receiver = self;
  v40.super_class = (Class)CDMDynamicConfig;
  v24 = [(CDMDynamicConfig *)&v40 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_languageCode, a3);
    objc_storeStrong((id *)&v25->_embeddingVersion, a4);
    uint64_t v26 = +[CDMDynamicConfig resolveActiveGraph:v18];
    graphName = v25->_graphName;
    v25->_graphName = (NSString *)v26;

    objc_storeStrong((id *)&v25->_siriVocabularySandboxId, obj);
    [(CDMDynamicConfig *)v25 setAssetPaths:v39];
    [(CDMDynamicConfig *)v25 setAssetDirPath:v38];
    objc_storeStrong((id *)&v25->_overrideSiriVocabSpans, a9);
    objc_storeStrong((id *)&v25->_overrideMentions, a10);
    objc_storeStrong((id *)&v25->_overrideContextualSpans, a11);
    objc_storeStrong((id *)&v25->_serviceStateDirectory, a12);
  }
  v28 = v18;
  v29 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideS"
          "iriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:]";
    __int16 v43 = 2112;
    v44 = v25;
    _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@.", buf, 0x16u);
  }

  return v25;
}

- (void)setAssetPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
  if (v5)
  {
    v6 = (void *)v5;
    int v7 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
    char v8 = [v7 isEqualToDictionary:v4];

    if ((v8 & 1) == 0)
    {
      __int16 v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
        int v13 = 136315650;
        v14 = "-[CDMDynamicConfig setAssetPaths:]";
        __int16 v15 = 2112;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Asset paths: %@ are not nil. They will be overwritten by new asset paths: %@.", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  uint64_t v11 = +[CDMNLAssetCollection assetCollectionWithAssetPaths:v4 withLanguageCode:self->_languageCode];
  assetCollection = self->_assetCollection;
  self->_assetCollection = v11;
}

+ (id)resolveActiveGraph:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  id v4 = v3;
  if (!v3 || ![(__CFString *)v3 length])
  {

    uint64_t v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      char v8 = "+[CDMDynamicConfig resolveActiveGraph:]";
      __int16 v9 = 2112;
      v10 = @"CDMNLUServiceGraph";
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: No value for active graph provided to CDMDynamicConfig, using the active service graph default of %@", (uint8_t *)&v7, 0x16u);
    }

    id v4 = @"CDMNLUServiceGraph";
  }
  return v4;
}

- (void)setAssetDirPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  assetDirPath = self->_assetDirPath;
  p_assetDirPath = (id *)&self->_assetDirPath;
  v6 = assetDirPath;
  if (assetDirPath && ![(NSString *)v6 isEqualToString:v5])
  {
    __int16 v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = *p_assetDirPath;
      int v13 = 136315650;
      v14 = "-[CDMDynamicConfig setAssetDirPath:]";
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Asset dir path: %@ is not nil. It will be overwritten by new asset dir path: %@.", (uint8_t *)&v13, 0x20u);
    }
  }
  objc_storeStrong(p_assetDirPath, a3);
  uint64_t v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = *p_assetDirPath;
    int v13 = 136315394;
    v14 = "-[CDMDynamicConfig setAssetDirPath:]";
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Set asset dir path to be: %@.", (uint8_t *)&v13, 0x16u);
  }
}

- (NSString)siriVocabularySandboxId
{
  return self->_siriVocabularySandboxId;
}

- (void)setGraphName:(id)a3
{
}

- (void)setEmbeddingVersion:(id)a3
{
}

- (NSString)serviceStateDirectory
{
  return self->_serviceStateDirectory;
}

- (NSArray)overrideSiriVocabSpans
{
  return self->_overrideSiriVocabSpans;
}

- (NSArray)overrideMentions
{
  return self->_overrideMentions;
}

- (NSArray)overrideContextualSpans
{
  return self->_overrideContextualSpans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStateDirectory, 0);
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_overrideContextualSpans, 0);
  objc_storeStrong((id *)&self->_overrideMentions, 0);
  objc_storeStrong((id *)&self->_overrideSiriVocabSpans, 0);
  objc_storeStrong((id *)&self->_assetDirPath, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_siriVocabularySandboxId, 0);
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (void)setServiceStateDirectory:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    char v8 = "-[CDMDynamicConfig setServiceStateDirectory:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Set serviceStateDirectory to be: %@.", (uint8_t *)&v7, 0x16u);
  }

  serviceStateDirectory = self->_serviceStateDirectory;
  self->_serviceStateDirectory = v4;
}

- (id)description
{
  v3 = NSString;
  languageCode = self->_languageCode;
  graphName = self->_graphName;
  v6 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
  int v7 = [v3 stringWithFormat:@"[CDMDynamicConfig] - Language Code: %@, Graph Name: %@, Asset Paths: %@, Asset Dir Path: %@, Siri Vocabulary Sandbox ID: %@, Service State Directory: %@", languageCode, graphName, v6, self->_assetDirPath, self->_siriVocabularySandboxId, self->_serviceStateDirectory];

  return v7;
}

- (BOOL)isEqualWithoutSandboxId:(id)a3
{
  id v5 = (CDMDynamicConfig *)a3;
  v6 = v5;
  if (v5 != self)
  {
    if (!v5) {
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
    languageCode = self->_languageCode;
    char v8 = languageCode;
    if (!languageCode)
    {
      uint64_t v9 = [(CDMDynamicConfig *)v6 languageCode];
      if (!v9) {
        goto LABEL_12;
      }
      v3 = (void *)v9;
      char v8 = self->_languageCode;
    }
    id v10 = [(CDMDynamicConfig *)v6 languageCode];
    BOOL v11 = [(NSString *)v8 isEqualToString:v10];

    if (languageCode)
    {
      if (!v11) {
        goto LABEL_43;
      }
    }
    else
    {

      if (!v11) {
        goto LABEL_43;
      }
    }
LABEL_12:
    embeddingVersion = self->_embeddingVersion;
    v14 = embeddingVersion;
    if (!embeddingVersion)
    {
      uint64_t v15 = [(CDMDynamicConfig *)v6 embeddingVersion];
      if (!v15) {
        goto LABEL_19;
      }
      v3 = (void *)v15;
      v14 = self->_embeddingVersion;
    }
    id v16 = [(CDMDynamicConfig *)v6 embeddingVersion];
    BOOL v17 = [(NSString *)v14 isEqualToString:v16];

    if (embeddingVersion)
    {
      if (!v17) {
        goto LABEL_43;
      }
    }
    else
    {

      if (!v17) {
        goto LABEL_43;
      }
    }
LABEL_19:
    graphName = self->_graphName;
    uint64_t v19 = (uint64_t)graphName;
    if (!graphName)
    {
      uint64_t v20 = [(CDMDynamicConfig *)v6 graphName];
      if (!v20)
      {
LABEL_26:
        id v22 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
        if (v22 || ([(CDMDynamicConfig *)v6 assetPaths], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v23 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
          v24 = [(CDMDynamicConfig *)v6 assetPaths];
          int v25 = [v23 isEqualToDictionary:v24];

          if (v22)
          {

            if (!v25) {
              goto LABEL_43;
            }
          }
          else
          {

            if ((v25 & 1) == 0) {
              goto LABEL_43;
            }
          }
        }
        assetDirPath = self->_assetDirPath;
        v27 = assetDirPath;
        if (!assetDirPath)
        {
          uint64_t v28 = [(CDMDynamicConfig *)v6 assetDirPath];
          if (!v28) {
            goto LABEL_37;
          }
          id v22 = (void *)v28;
          v27 = self->_assetDirPath;
        }
        v29 = [(CDMDynamicConfig *)v6 assetDirPath];
        BOOL v30 = [(NSString *)v27 isEqualToString:v29];

        if (assetDirPath)
        {
          if (v30) {
            goto LABEL_37;
          }
        }
        else
        {

          if (v30)
          {
LABEL_37:
            serviceStateDirectory = self->_serviceStateDirectory;
            v32 = serviceStateDirectory;
            if (!serviceStateDirectory)
            {
              id v22 = [(CDMDynamicConfig *)v6 serviceStateDirectory];
              if (!v22)
              {
                LOBYTE(v34) = 0;
                goto LABEL_46;
              }
              v32 = self->_serviceStateDirectory;
            }
            id v33 = [(CDMDynamicConfig *)v6 serviceStateDirectory];
            int v34 = ![(NSString *)v32 isEqualToString:v33];

            if (serviceStateDirectory)
            {
LABEL_47:
              char v12 = v34 ^ 1;
              goto LABEL_44;
            }
LABEL_46:

            goto LABEL_47;
          }
        }
LABEL_43:
        char v12 = 0;
        goto LABEL_44;
      }
      v3 = (void *)v20;
      uint64_t v19 = (uint64_t)self->_graphName;
    }
    v21 = [(CDMDynamicConfig *)v6 graphName];
    uint64_t v19 = [(id)v19 isEqualToString:v21];

    if (graphName)
    {
      if (!v19) {
        goto LABEL_43;
      }
    }
    else
    {

      if ((v19 & 1) == 0) {
        goto LABEL_43;
      }
    }
    goto LABEL_26;
  }
  char v12 = 1;
LABEL_44:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(CDMDynamicConfig *)self isEqualWithoutSandboxId:v5])
  {
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  siriVocabularySandboxId = self->_siriVocabularySandboxId;
  int v7 = siriVocabularySandboxId;
  if (siriVocabularySandboxId)
  {
LABEL_5:
    uint64_t v9 = [v5 siriVocabularySandboxId];
    BOOL v10 = [(NSString *)v7 isEqualToString:v9];

    if (siriVocabularySandboxId)
    {
      if (v10) {
        goto LABEL_7;
      }
    }
    else
    {

      if (v10) {
        goto LABEL_7;
      }
    }
    BOOL v11 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:
      BOOL v12 = 0;
      goto LABEL_15;
    }
LABEL_16:
    int v14 = 136315650;
    uint64_t v15 = "-[CDMDynamicConfig isEqual:]";
    __int16 v16 = 2112;
    BOOL v17 = self;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@ doesn't equal to dynamic config: %@.", (uint8_t *)&v14, 0x20u);
    goto LABEL_14;
  }
  uint64_t v8 = [v5 siriVocabularySandboxId];
  if (v8)
  {
    v3 = (void *)v8;
    int v7 = self->_siriVocabularySandboxId;
    goto LABEL_5;
  }
LABEL_7:
  BOOL v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    uint64_t v15 = "-[CDMDynamicConfig isEqual:]";
    __int16 v16 = 2112;
    BOOL v17 = self;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@ equals to dynamic config: %@.", (uint8_t *)&v14, 0x20u);
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSString *)self->_languageCode hash];
  NSUInteger v4 = [(NSString *)self->_embeddingVersion hash] + 89 * v3;
  NSUInteger v5 = [(NSString *)self->_graphName hash] + 89 * v4;
  NSUInteger v6 = [(NSString *)self->_siriVocabularySandboxId hash] + 89 * v5 + 62742241;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v7 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
  uint64_t v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 hash] + 89 * v6;
        uint64_t v15 = [(CDMNLAssetCollection *)self->_assetCollection assetPaths];
        __int16 v16 = [v15 objectForKeyedSubscript:v13];
        NSUInteger v6 = v14 + [v16 hash];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  NSUInteger v17 = [(NSString *)self->_assetDirPath hash];
  return [(NSString *)self->_serviceStateDirectory hash] + 89 * (v17 + 89 * v6);
}

- (void)setOverrideContextualSpans:(id)a3
{
}

- (void)setOverrideMentions:(id)a3
{
}

- (void)setOverrideSiriVocabSpans:(id)a3
{
}

- (void)setAssetCollection:(id)a3
{
}

- (void)setSiriVocabularySandboxId:(id)a3
{
}

- (void)setLanguageCode:(id)a3
{
}

- (id)getAssetBundlePathForFactorName:(id)a3
{
  return [(CDMNLAssetCollection *)self->_assetCollection getAssetBundlePathForFactorName:a3];
}

- (id)getAssetForFactorName:(id)a3
{
  return [(CDMNLAssetCollection *)self->_assetCollection getAssetForFactorName:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_languageCode copy];
    NSUInteger v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(NSString *)self->_embeddingVersion copy];
    uint64_t v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [(NSString *)self->_graphName copy];
    uint64_t v10 = (void *)v4[3];
    v4[3] = v9;

    uint64_t v11 = [(NSString *)self->_siriVocabularySandboxId copy];
    BOOL v12 = (void *)v4[4];
    v4[4] = v11;

    int v13 = [(CDMDynamicConfig *)self assetPaths];
    uint64_t v14 = (void *)[v13 copy];
    [v4 setAssetPaths:v14];

    uint64_t v15 = [(NSString *)self->_serviceStateDirectory copy];
    __int16 v16 = (void *)v4[11];
    v4[11] = v15;
  }
  return v4;
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 graphName:a4 sandboxId:a5 assetPaths:0 assetDirPath:a6 overrideSiriVocabSpans:a7 overrideMentions:a8 overrideContextualSpans:a9 serviceStateDirectory:0];
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 graphName:a4 sandboxId:a5 assetPaths:a6 assetDirPath:0 overrideSiriVocabSpans:a7 overrideMentions:a8 overrideContextualSpans:a9 serviceStateDirectory:0];
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 graphName:a4 sandboxId:a5 assetDirPath:a6 overrideSiriVocabSpans:0 overrideMentions:0 overrideContextualSpans:0];
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6
{
  return [(CDMDynamicConfig *)self initWithLanguageCode:a3 graphName:a4 sandboxId:a5 assetPaths:a6 overrideSiriVocabSpans:0 overrideMentions:0 overrideContextualSpans:0];
}

@end