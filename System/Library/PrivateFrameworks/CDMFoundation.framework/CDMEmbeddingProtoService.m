@interface CDMEmbeddingProtoService
+ (BOOL)isSiriInputRepresentationModel:(id)a3;
+ (id)getCDMServiceAssetConfig;
- (BOOL)hasEmbedderOrchestrator;
- (id)addEmbeddingModelItemToEmbedders:(id)a3;
- (id)assetsPathURLForModelBundle:(id)a3;
- (id)createEmbedderOrchestrator:(id)a3;
- (id)createEmbedderOrchestrator:(id)a3 embedding_bert_path:(id)a4 embedding_config_path:(id)a5 reformulation_path:(id)a6;
- (id)createEmbeddingConfigItemEqualToNilResponse;
- (id)createEmbeddingProtoServiceErrorWithCode:(int64_t)a3 description:(id)a4;
- (id)createEmbeddingsBundleMissingPathResponse;
- (id)createEmptyEmbeddingsBundleResponse:(id)a3;
- (id)createNoStableEmbeddingsModelFoundResponse;
- (id)createNotReadyForHandleProtoResponse;
- (id)createOrchestratorConstructFailureResponse;
- (id)doEmbedding:(id)a3;
- (id)getSpecificEmbeddingModelItem:(id)a3 dependentEmbeddingConfigs:(id)a4 embeddingVersion:(id)a5;
- (id)getStableEmbeddingModelItem:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)legacyEmbeddingPaths:(id)a3;
- (id)setup:(id)a3;
- (id)warmup:(id)a3;
- (int64_t)getServiceState;
- (void)setEmbedders:(id)a3;
@end

@implementation CDMEmbeddingProtoService

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6[0] = @"siri_input_representations";
  v6[1] = @"temp_model";
  v7 = @"com.apple.siri.nl.owl";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

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

- (id)warmup:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CDMEmbeddingProtoService warmup:]";
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Prewarm Embedding models", buf, 0xCu);
  }

  if (+[CDMUserDefaultsUtils prewarmModels]
    && [(CDMEmbeddingProtoService *)self hasEmbedderOrchestrator])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_embedders;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "warmup", (void)v14);
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMEmbeddingProtoService warmup:]";
      _os_log_debug_impl(&dword_2263A0000, &v5->super.super, OS_LOG_TYPE_DEBUG, "%s Model prewarming is turned off. Embedding models will not prewarm.", buf, 0xCu);
    }
  }

  v9 = [CDMWarmupResponseCommand alloc];
  int64_t v10 = [(CDMBaseService *)self serviceState];
  v11 = [(CDMBaseService *)self serviceName];
  v12 = [(CDMWarmupResponseCommand *)v9 initWithServiceState:v10 serviceName:v11];

  return v12;
}

- (BOOL)hasEmbedderOrchestrator
{
  embedders = self->_embedders;
  if (embedders) {
    LOBYTE(embedders) = [(NSMutableArray *)embedders count] != 0;
  }
  return (char)embedders;
}

- (id)setup:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v25 = 136315138;
    v26 = "-[CDMEmbeddingProtoService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setup CDMEmbeddingProtoService", (uint8_t *)&v25, 0xCu);
  }

  uint64_t v6 = [v4 dynamicConfig];
  uint64_t v7 = [v6 embeddingConfigs];
  embeddingConfigs = self->_embeddingConfigs;
  self->_embeddingConfigs = v7;

  v9 = [v4 dataDispatcherContext];
  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v9;

  v11 = [v4 dynamicConfig];
  v12 = [v11 embeddingVersion];

  v13 = [(CDMEmbeddingConfigs *)self->_embeddingConfigs getDependentEmbeddingConfigs];
  long long v14 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = [v13 count];
    int v25 = 136315394;
    v26 = "-[CDMEmbeddingProtoService setup:]";
    __int16 v27 = 2048;
    uint64_t v28 = v24;
    _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Initialize _embedders array with capacity %lu", (uint8_t *)&v25, 0x16u);
  }

  long long v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v13, "count"));
  embedders = self->_embedders;
  self->_embedders = v15;

  if (v12)
  {
    long long v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315394;
      v26 = "-[CDMEmbeddingProtoService setup:]";
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v12;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s Client Embedding version is not nil and the value is %@.", (uint8_t *)&v25, 0x16u);
    }

    v18 = [(CDMEmbeddingConfigs *)self->_embeddingConfigs getEmbeddingVersionDictionary];
    v19 = [(CDMEmbeddingProtoService *)self getSpecificEmbeddingModelItem:v18 dependentEmbeddingConfigs:v13 embeddingVersion:v12];
    if (v19)
    {
      v20 = [(CDMEmbeddingProtoService *)self addEmbeddingModelItemToEmbedders:v19];
LABEL_16:

      goto LABEL_18;
    }
    uint64_t v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      v26 = "-[CDMEmbeddingProtoService setup:]";
      _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Embedding version not found; fallback to stable embedding.",
        (uint8_t *)&v25,
        0xCu);
    }
  }
  v19 = [(CDMEmbeddingProtoService *)self getStableEmbeddingModelItem:v13];
  if (v19)
  {
    v20 = [(CDMEmbeddingProtoService *)self addEmbeddingModelItemToEmbedders:v19];
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v22 = [v19 embeddingModelVersion];
      int v25 = 136315394;
      v26 = "-[CDMEmbeddingProtoService setup:]";
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v22;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s Embeddings model successfully loaded: %@", (uint8_t *)&v25, 0x16u);
    }
    goto LABEL_16;
  }
  self->super.super._serviceState = 3;
  v20 = [(CDMEmbeddingProtoService *)self createNoStableEmbeddingsModelFoundResponse];
LABEL_18:

  return v20;
}

- (id)getStableEmbeddingModelItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isStableEmbeddingModel", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)addEmbeddingModelItemToEmbedders:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v37 = [v4 embeddingModelVersion];
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v37;
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Processing embedding config for model %@", buf, 0x16u);
    }
    uint64_t v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v38 = [v4 isStableEmbeddingModel];
      *(_DWORD *)buf = 136315394;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      __int16 v46 = 1024;
      LODWORD(v47) = v38;
      _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Is stable model: %d", buf, 0x12u);
    }

    uint64_t v7 = (void *)MEMORY[0x263F086E0];
    v8 = [v4 embeddingModelPath];
    long long v9 = [v7 bundleWithPath:v8];

    if (!v9)
    {
      self->super.super._serviceState = 3;
      uint64_t v20 = [(CDMEmbeddingProtoService *)self createEmptyEmbeddingsBundleResponse:v4];
      goto LABEL_19;
    }
    long long v10 = [v9 bundlePath];
    BOOL v11 = +[CDMEmbeddingProtoService isSiriInputRepresentationModel:v10];

    if (v11)
    {
      uint64_t v12 = [(CDMEmbeddingProtoService *)self assetsPathURLForModelBundle:v9];
      if (v12)
      {
        v13 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
          __int16 v46 = 2112;
          uint64_t v47 = v12;
          _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Embeddings proto service passing assets path to embeddings orchestrator: %@", buf, 0x16u);
        }

        uint64_t v14 = self;
        objc_sync_enter(v14);
        long long v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          long long v16 = [v4 embeddingModelVersion];
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
          __int16 v46 = 2112;
          uint64_t v47 = (uint64_t)v16;
          _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s creating SNLPEmbedder for embeddings model: %@", buf, 0x16u);
        }
        long long v17 = [(CDMEmbeddingProtoService *)v14 createEmbedderOrchestrator:v12];
        v18 = [[Embedder alloc] initWithSnlpEmbedder:v17 andEmbeddingConfigItem:v4];
        [(NSMutableArray *)v14->_embedders addObject:v18];
        v19 = (void *)v12;
        goto LABEL_14;
      }
      self->super.super._serviceState = 3;
      v22 = [(CDMBaseService *)self createSetupResponseCommand];
      v33 = NSString;
      v34 = [v9 description];
      v19 = [v33 stringWithFormat:@"Could not look up embeddings assets path %@", v34];

      v35 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v19;
        _os_log_impl(&dword_2263A0000, v35, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      v36 = [(CDMBaseService *)self createErrorWithCode:1 description:v19];
      [v22 setCmdError:v36];

LABEL_33:
      goto LABEL_34;
    }
    v19 = [(CDMEmbeddingProtoService *)self legacyEmbeddingPaths:v9];
    v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v40 = [v19 srcVocabPath];
      v41 = [v19 modelPath];
      v42 = [v19 configPath];
      v43 = [v19 reformulationPath];
      *(_DWORD *)buf = 136316162;
      v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v40;
      __int16 v48 = 2112;
      v49 = v41;
      __int16 v50 = 2112;
      v51 = v42;
      __int16 v52 = 2112;
      v53 = v43;
      _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s SrcVocabPath:%@, Model path:%@, Model config path:%@, Reformulation path:%@", buf, 0x34u);
    }
    uint64_t v24 = [v19 srcVocabPath];
    if (v24)
    {
      int v25 = [v19 modelPath];
      if (v25)
      {
        v26 = [v19 configPath];
        if (v26)
        {
          __int16 v27 = [v19 reformulationPath];
          BOOL v28 = v27 == 0;

          if (!v28)
          {
            uint64_t v14 = self;
            objc_sync_enter(v14);
            uint64_t v29 = [v19 srcVocabPath];
            v30 = [v19 modelPath];
            v31 = [v19 configPath];
            v32 = [v19 reformulationPath];
            long long v17 = [(CDMEmbeddingProtoService *)v14 createEmbedderOrchestrator:v29 embedding_bert_path:v30 embedding_config_path:v31 reformulation_path:v32];

            v18 = [[Embedder alloc] initWithSnlpEmbedder:v17 andEmbeddingConfigItem:v4];
            [(NSMutableArray *)v14->_embedders addObject:v18];
LABEL_14:

            objc_sync_exit(v14);
            self->super.super._serviceState = 2;
            uint64_t v20 = [(CDMBaseService *)self createSetupResponseCommand];
LABEL_19:
            v22 = (void *)v20;
LABEL_34:

            goto LABEL_35;
          }
          goto LABEL_32;
        }
      }
    }
LABEL_32:
    self->super.super._serviceState = 3;
    v22 = [(CDMEmbeddingProtoService *)self createEmbeddingsBundleMissingPathResponse];
    goto LABEL_33;
  }
  uint64_t v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CDMEmbeddingProtoService addEmbeddingModelItemToEmbedders:]";
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s The CDMEmbeddingConfigItem to be used is nil. Fail the setup.", buf, 0xCu);
  }

  self->super.super._serviceState = 3;
  v22 = [(CDMEmbeddingProtoService *)self createEmbeddingConfigItemEqualToNilResponse];
LABEL_35:

  return v22;
}

- (id)getSpecificEmbeddingModelItem:(id)a3 dependentEmbeddingConfigs:(id)a4 embeddingVersion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v22 = v7;
  long long v10 = [v7 objectForKey:v9];

  BOOL v11 = v9;
  if (v10)
  {
    BOOL v11 = [v7 objectForKey:v9];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v21 = v8;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = objc_msgSend(v16, "embeddingModelVersion", v21);
        BOOL v18 = [v17 rangeOfString:v11] == 0x7FFFFFFFFFFFFFFFLL;

        if (!v18)
        {
          id v19 = v16;
          goto LABEL_13;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v19 = 0;
LABEL_13:

  return v19;
}

- (id)createEmbedderOrchestrator:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F71FA0]) initFromAssetDirectoryURL:v3];

  return v4;
}

- (id)assetsPathURLForModelBundle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 resourcePath];
  char v11 = 0;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  if (v11) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  if (v7)
  {
    id v8 = [NSURL fileURLWithPath:v4 isDirectory:1];
  }
  else
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[CDMEmbeddingProtoService assetsPathURLForModelBundle:]";
      __int16 v14 = 2112;
      long long v15 = v4;
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: Embeddings assets path does not exist or is not a directory: %@", buf, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

+ (BOOL)isSiriInputRepresentationModel:(id)a3
{
  id v3 = [a3 pathComponents];
  char v4 = [v3 containsObject:@"siri_input_representations"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_embedders, 0);
}

- (int64_t)getServiceState
{
  return self->super.super._serviceState;
}

- (id)doEmbedding:(id)a3
{
  v39 = self;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Start doEmbedding", buf, 0xCu);
  }

  if ([(CDMDataDispatcherContext *)v39->_dataDispatcherContext cdmSELFLoggingPolicyType] == 2)
  {
    char v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding input: <Redacted>", buf, 0xCu);
    }
  }
  else
  {
    char v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v38 = [v45 request];
      *(_DWORD *)buf = 136315394;
      uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v38;
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding input: %@", buf, 0x16u);
    }
  }

  id v41 = objc_alloc_init(MEMORY[0x263F71E08]);
  uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](v39->_embedders, "count"));
  __int16 v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](v39->_embedders, "count"));
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [(NSMutableArray *)v39->_embedders count];
    *(_DWORD *)buf = 136315394;
    uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    __int16 v55 = 2048;
    uint64_t v56 = v35;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Running doEmbedding for %lu embedders", buf, 0x16u);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = v39->_embedders;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (!v6)
  {

LABEL_22:
    __int16 v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
      _os_log_error_impl(&dword_2263A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Stable not response is not found! Execution should not continue", buf, 0xCu);
    }

    long long v26 = 0;
    goto LABEL_25;
  }
  uint64_t v43 = *(void *)v49;
  v44 = 0;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v49 != v43) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      id v9 = objc_alloc_init(MEMORY[0x263F71E10]);
      id v10 = objc_alloc_init(MEMORY[0x263F71E10]);
      char v11 = [v8 snlpEmbedder];
      id v12 = [v45 request];
      uint64_t v13 = [v11 getEmbeddings:v12];

      objc_msgSend(v9, "setEmbeddingDim:", objc_msgSend(v13, "embeddingDim"));
      __int16 v14 = [v13 embeddingTensorOutputs];
      long long v15 = [v14 objectAtIndexedSubscript:0];
      uint64_t v16 = [v15 embeddingTensor];
      [v9 setEmbeddingTensor:v16];

      long long v17 = [v8 embeddingConfigItem];
      objc_msgSend(v9, "setIsStableEmbeddingsVersion:", objc_msgSend(v17, "isStableEmbeddingModel"));

      BOOL v18 = [v8 embeddingConfigItem];
      id v19 = [v18 embeddingModelVersion];
      [v9 setEmbeddingVersion:v19];

      if ([v9 isStableEmbeddingsVersion])
      {
        id v20 = v13;

        v44 = v20;
      }
      objc_msgSend(v47, "addObject:", v9, v39);
      objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v13, "embeddingDim"));
      id v21 = [v13 subwordEmbeddingTensorOutputs];
      v22 = [v21 objectAtIndexedSubscript:0];
      long long v23 = [v22 embeddingTensor];
      [v10 setEmbeddingTensor:v23];

      long long v24 = [v8 embeddingConfigItem];
      long long v25 = [v24 embeddingModelVersion];
      [v10 setEmbeddingVersion:v25];

      [v46 addObject:v10];
    }
    uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  }
  while (v6);

  long long v26 = v44;
  if (!v44) {
    goto LABEL_22;
  }
LABEL_25:
  uint64_t v28 = v26;
  uint64_t v29 = objc_msgSend(v26, "tokenChain", v39);
  [v41 setTokenChain:v29];

  objc_msgSend(v41, "setNumToken:", objc_msgSend(v28, "numToken"));
  v30 = [v28 subwordTokenChain];
  [v41 setSubwordTokenChain:v30];

  objc_msgSend(v41, "setNumSubwordToken:", objc_msgSend(v28, "numSubwordToken"));
  [v41 setEmbeddingTensorOutputs:v47];
  [v41 setSubwordEmbeddingTensorOutputs:v46];
  v31 = [[CDMEmbeddingProtoResponseCommand alloc] initWithResponse:v41 embeddingConfigs:*(void *)(v40 + 56)];
  v32 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    _os_log_impl(&dword_2263A0000, v32, OS_LOG_TYPE_INFO, "%s CDMEmbeddingProtoService::doEmbedding finished", buf, 0xCu);
  }

  v33 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v36 = [v41 embeddingTensorOutputs];
    uint64_t v37 = [v36 count];
    *(_DWORD *)buf = 136315394;
    uint64_t v54 = "-[CDMEmbeddingProtoService doEmbedding:]";
    __int16 v55 = 2048;
    uint64_t v56 = v37;
    _os_log_debug_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEBUG, "%s CDMEmbeddingProtoService::doEmbedding produced %lu embedding tensors", buf, 0x16u);
  }
  return v31;
}

- (void)setEmbedders:(id)a3
{
}

- (id)createEmbedderOrchestrator:(id)a3 embedding_bert_path:(id)a4 embedding_config_path:(id)a5 reformulation_path:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F71FA0]) initFromSourceVocabPath:v9 bertModelPath:v10 bertConfigPath:v11 reformulatorPath:v12];

  return v13;
}

- (id)handle:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 request];
  uint64_t v6 = [v5 text];

  if ([(CDMDataDispatcherContext *)self->_dataDispatcherContext cdmSELFLoggingPolicyType] == 2)
  {

    uint64_t v6 = @"<Redacted>";
  }
  char v7 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315650;
    BOOL v18 = "-[CDMEmbeddingProtoService handle:]";
    __int16 v19 = 2112;
    id v20 = @"embedding";
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nEmbeddingRequest text: %@", (uint8_t *)&v17, 0x20u);
  }
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    BOOL v18 = "-[CDMEmbeddingProtoService handle:]";
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s calling SiriBERT embedding", (uint8_t *)&v17, 0xCu);
  }

  if ([(CDMEmbeddingProtoService *)self getServiceState] != 2)
  {
    uint64_t v10 = [(CDMEmbeddingProtoService *)self createNotReadyForHandleProtoResponse];
    goto LABEL_11;
  }
  id v9 = self;
  objc_sync_enter(v9);
  if ([(CDMEmbeddingProtoService *)v9 hasEmbedderOrchestrator])
  {
    objc_sync_exit(v9);

    uint64_t v10 = [(CDMEmbeddingProtoService *)v9 doEmbedding:v4];
LABEL_11:
    id v11 = (void *)v10;
    goto LABEL_17;
  }
  embedders = v9->_embedders;
  uint64_t v13 = CDMLogContext;
  BOOL v14 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_ERROR);
  if (embedders)
  {
    if (v14)
    {
      int v17 = 136315394;
      BOOL v18 = "-[CDMEmbeddingProtoService handle:]";
      __int16 v19 = 2112;
      id v20 = @"embedding";
      long long v15 = "%s [ERR]: [insights-cdm-%@]:\nNo embedders were loaded";
LABEL_21:
      _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x16u);
    }
  }
  else if (v14)
  {
    int v17 = 136315394;
    BOOL v18 = "-[CDMEmbeddingProtoService handle:]";
    __int16 v19 = 2112;
    id v20 = @"embedding";
    long long v15 = "%s [ERR]: [insights-cdm-%@]:\n_embedders array is nil";
    goto LABEL_21;
  }
  objc_sync_exit(v9);

  id v11 = 0;
LABEL_17:

  return v11;
}

- (id)legacyEmbeddingPaths:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v3 bundlePath];
    int v17 = 136315394;
    BOOL v18 = "-[CDMEmbeddingProtoService legacyEmbeddingPaths:]";
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Load legacy owl asset from: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = [v3 bundlePath];
  char v7 = [v6 stringByAppendingPathComponent:@"model_bundle/v3/bert.mlmodelc"];
  id v8 = [v7 stringByDeletingLastPathComponent];
  id v9 = [v5 bundleWithPath:v8];

  uint64_t v10 = [v9 pathForResource:@"src_vocab" ofType:@"txt"];
  id v11 = [v3 pathForResource:@"model.espresso" ofType:@"net" inDirectory:@"model_bundle/v3/bert.mlmodelc"];
  id v12 = [v3 pathForResource:@"config" ofType:@"json" inDirectory:@"model_bundle/v3/bert.mlmodelc"];
  uint64_t v13 = [v9 pathForResource:@"reformulations" ofType:@"txt"];
  BOOL v14 = [[EmbeddingPaths alloc] initWithSrcVocabPath:v10 modelPath:v11 configPath:v12 reformulationPath:v13];

  return v14;
}

- (id)createOrchestratorConstructFailureResponse
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(CDMBaseService *)self createSetupResponseCommand];
  id v4 = [NSString stringWithFormat:@"Unable to get EmbedderOrchestrator"];
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    id v9 = "-[CDMEmbeddingProtoService createOrchestratorConstructFailureResponse]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:4 description:v4];
  [v3 setCmdError:v6];

  return v3;
}

- (id)createEmbeddingsBundleMissingPathResponse
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(CDMBaseService *)self createSetupResponseCommand];
  id v4 = [NSString stringWithFormat:@"Not able to find/load all values needed for Embedding model bundle."];
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    id v9 = "-[CDMEmbeddingProtoService createEmbeddingsBundleMissingPathResponse]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:3 description:v4];
  [v3 setCmdError:v6];

  return v3;
}

- (id)createNoStableEmbeddingsModelFoundResponse
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(CDMBaseService *)self createSetupResponseCommand];
  id v4 = [NSString stringWithFormat:@"No stable embeddings model found. Aborting setup."];
  uint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    id v9 = "-[CDMEmbeddingProtoService createNoStableEmbeddingsModelFoundResponse]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:2 description:v4];
  [v3 setCmdError:v6];

  return v3;
}

- (id)createEmbeddingConfigItemEqualToNilResponse
{
  id v3 = [(CDMBaseService *)self createSetupResponseCommand];
  id v4 = [NSString stringWithFormat:@"CDM EmbeddingConfigItem is Nil. Aborting setup."];
  uint64_t v5 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:5 description:v4];
  [v3 setCmdError:v5];

  return v3;
}

- (id)createEmptyEmbeddingsBundleResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CDMBaseService *)self createSetupResponseCommand];
  uint64_t v6 = NSString;
  char v7 = [v4 embeddingModelPath];
  int v8 = [v6 stringWithFormat:@"Not able to find/load Bert Embedding model bundle directory from path: %@.", v7];
  id v9 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:1 description:v8];
  [v5 setCmdError:v9];

  return v5;
}

- (id)createNotReadyForHandleProtoResponse
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t serviceState = self->super.super._serviceState;
    int v8 = 136315394;
    id v9 = "-[CDMEmbeddingProtoService createNotReadyForHandleProtoResponse]";
    __int16 v10 = 2048;
    int64_t v11 = serviceState;
    _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = objc_alloc_init(CDMEmbeddingProtoResponseCommand);
  uint64_t v6 = [(CDMEmbeddingProtoService *)self createEmbeddingProtoServiceErrorWithCode:0 description:@"Service not ready to handle requests"];
  [(CDMBaseCommand *)v5 setCmdError:v6];

  return v5;
}

- (id)createEmbeddingProtoServiceErrorWithCode:(int64_t)a3 description:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = (void *)MEMORY[0x263F087E8];
  int v8 = [(CDMBaseService *)self serviceName];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = v6;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  __int16 v10 = [v7 errorWithDomain:v8 code:a3 userInfo:v9];

  return v10;
}

@end