@interface CDMEmbeddingConfigs
+ (BOOL)isInternalBuild;
+ (BOOL)supportsSecureCoding;
+ (id)generateEmbeddingModelIdList:(id)a3;
+ (int)getMaxEmbeddingConcurrency;
+ (int)getMaxEmbeddingConcurrencyConst;
- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3;
- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3 embeddingVersion:(id)a4;
- (CDMEmbeddingConfigs)initWithCoder:(id)a3;
- (id)description;
- (id)generateEmbeddingConfigItemsWithError:(id *)a3;
- (id)generateServiceDependentEmbeddingModelVersionsWithError:(id *)a3;
- (id)getAllEmbeddingConfigs;
- (id)getAssetPaths;
- (id)getDependentEmbeddingConfigs;
- (id)getEmbeddingConfigForEmbeddingModelVersion:(id)a3;
- (id)getEmbeddingConfigForFactor:(id)a3;
- (id)getEmbeddingVersionDictionary;
- (id)getStableEmbeddingConfig;
- (void)encodeWithCoder:(id)a3;
- (void)setupWithError:(id *)a3;
- (void)validateClientEmbeddingVersion:(id)a3 embeddingAssetVersion:(id)a4 embeddingModelIdList:(id)a5 multipleModels:(BOOL)a6 withError:(id *)a7;
@end

@implementation CDMEmbeddingConfigs

- (void)setupWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[CDMEmbeddingConfigs setupWithError:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Setup CDM embedding configs.", buf, 0xCu);
  }

  self->_setupCalled = 1;
  v6 = [(NSDictionary *)self->_assetPaths objectForKey:@"com.apple.siri.nl.owl"];
  v7 = [v6 getAssetMetadata];
  v8 = [v7 objectForKey:@"EMBEDDING_RETURN_FOR_VERSION"];

  v9 = (NSDictionary *)objc_alloc_init(NSDictionary);
  embeddingReturnForVersion = self->_embeddingReturnForVersion;
  self->_embeddingReturnForVersion = v9;

  if (v8
    && (id v27 = 0,
        +[CDMEmbeddingUtils setStringToJSONDictionaryWithError:&v27 stringToConvert:v8], v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), id v12 = v27, v13 = self->_embeddingReturnForVersion, self->_embeddingReturnForVersion = v11, v13, v12))
  {
    id v14 = v12;
    *a3 = v14;
    v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CDMEmbeddingConfigs setupWithError:]";
      _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Failed to save EMBEDDING_RETURN_FOR_VERSION value to dictionary.", buf, 0xCu);
    }
  }
  else
  {
    v16 = (NSDictionary *)objc_alloc_init(NSDictionary);
    embeddingConfigItems = self->_embeddingConfigItems;
    self->_embeddingConfigItems = v16;

    v18 = (NSDictionary *)objc_alloc_init(NSDictionary);
    serviceDependentEmbeddingModelVersions = self->_serviceDependentEmbeddingModelVersions;
    self->_serviceDependentEmbeddingModelVersions = v18;

    id v26 = 0;
    v20 = [(CDMEmbeddingConfigs *)self generateEmbeddingConfigItemsWithError:&v26];
    id v14 = v26;
    v21 = self->_embeddingConfigItems;
    self->_embeddingConfigItems = v20;

    if (v14)
    {
      *a3 = v14;
    }
    else
    {
      id v25 = 0;
      v22 = [(CDMEmbeddingConfigs *)self generateServiceDependentEmbeddingModelVersionsWithError:&v25];
      id v23 = v25;
      v24 = self->_serviceDependentEmbeddingModelVersions;
      self->_serviceDependentEmbeddingModelVersions = v22;

      if (v23) {
        *a3 = v23;
      }
    }
  }
}

- (id)generateEmbeddingConfigItemsWithError:(id *)a3
{
  v105[1] = *MEMORY[0x263EF8340];
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Generate embedding config item list.", buf, 0xCu);
  }

  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    v7 = [(NSDictionary *)assetPaths objectForKey:@"com.apple.siri.nl.owl"];
    v8 = v7;
    if (!v7 || ![v7 getAssetType])
    {
      id v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v104 = *MEMORY[0x263F08320];
      v24 = [NSString stringWithFormat:@"Embedding asset is nil"];
      v105[0] = v24;
      id v25 = [NSDictionary dictionaryWithObjects:v105 forKeys:&v104 count:1];
      *a3 = [v23 errorWithDomain:@"CDMEmbeddingConfigs" code:0 userInfo:v25];

      id v26 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v59 = *a3;
        *(_DWORD *)buf = 136315394;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        __int16 v100 = 2112;
        uint64_t v101 = (uint64_t)v59;
        _os_log_error_impl(&dword_2263A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
      }

      id v22 = objc_alloc_init(NSDictionary);
      goto LABEL_55;
    }
    v79 = a3;
    v9 = [v8 getAssetVersion];
    v10 = [v8 getAssetPath];
    v11 = [v8 getAssetMetadata];
    uint64_t v12 = [v11 objectForKey:@"MULTI_EMBEDDING_MODEL_IDS"];
    uint64_t v13 = [v11 objectForKey:@"STABLE_EMBEDDING_MODEL_ID"];
    id v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
      __int16 v100 = 2112;
      uint64_t v101 = v12;
      __int16 v102 = 2112;
      uint64_t v103 = v13;
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s Get embedding model ids: %@, stable embedding model id: %@", buf, 0x20u);
    }

    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = v15;
    if (v12 && v13)
    {
      v83 = v10;
      v17 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s In multi embedding model mode.", buf, 0xCu);
      }

      v18 = &off_2647A2000;
      v19 = +[CDMEmbeddingConfigs generateEmbeddingModelIdList:v12];
      v77 = v19;
      if (self->_clientEmbeddingVersion)
      {
        v20 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          clientEmbeddingVersion = self->_clientEmbeddingVersion;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          __int16 v100 = 2112;
          uint64_t v101 = (uint64_t)clientEmbeddingVersion;
          _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s Client Embedding version is not nil and the value is %@.", buf, 0x16u);
        }

        [(CDMEmbeddingConfigs *)self validateClientEmbeddingVersion:self->_clientEmbeddingVersion embeddingAssetVersion:v9 embeddingModelIdList:v19 multipleModels:1 withError:v79];
        v18 = &off_2647A2000;
        if (*v79)
        {
          id v22 = objc_alloc_init(NSDictionary);
          goto LABEL_52;
        }
      }
      uint64_t v82 = v13;
      if (([v19 containsObject:v13] & 1) == 0)
      {
        uint64_t v54 = v12;
        v55 = (void *)MEMORY[0x263F087E8];
        uint64_t v96 = *MEMORY[0x263F08320];
        v56 = [NSString stringWithFormat:@"Can't locate stable embedding id: %@ in embedding model id list: %@.", self->_stableEmbeddingModelVersion, v19];
        v97 = v56;
        v57 = [NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        id *v79 = [v55 errorWithDomain:@"CDMEmbeddingConfigs" code:1 userInfo:v57];

        v58 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          id v71 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          __int16 v100 = 2112;
          uint64_t v101 = (uint64_t)v71;
          _os_log_error_impl(&dword_2263A0000, v58, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        id v22 = objc_alloc_init(NSDictionary);
        uint64_t v12 = v54;
        goto LABEL_51;
      }
      uint64_t v75 = v12;
      uint64_t v32 = [v18[405] getMaxEmbeddingConcurrency];
      BOOL v33 = [v19 count] == (int)v32;
      v34 = v19;
      if (!v33)
      {
        v60 = (void *)MEMORY[0x263F087E8];
        uint64_t v94 = *MEMORY[0x263F08320];
        v61 = objc_msgSend(NSString, "stringWithFormat:", @"The count of embedding model ids in the configs: %lu doesn't match with max embedding concurrency count: %d.", objc_msgSend(v34, "count"), v32);
        v95 = v61;
        v62 = [NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id *v79 = [v60 errorWithDomain:@"CDMEmbeddingConfigs" code:1 userInfo:v62];

        v63 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          id v72 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          __int16 v100 = 2112;
          uint64_t v101 = (uint64_t)v72;
          _os_log_error_impl(&dword_2263A0000, v63, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        id v22 = objc_alloc_init(NSDictionary);
        uint64_t v12 = v75;
LABEL_51:
        uint64_t v13 = v82;
LABEL_52:
        v10 = v83;
LABEL_53:

        goto LABEL_54;
      }
      v80 = v16;
      v74 = v11;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v29 = v19;
      uint64_t v35 = [(CDMEmbeddingConfigItem *)v29 countByEnumeratingWithState:&v85 objects:v93 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v78 = *(void *)v86;
        obj = v29;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v86 != v78) {
              objc_enumerationMutation(obj);
            }
            v38 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            v39 = v9;
            v40 = [NSString stringWithFormat:@"%@.%@", v9, v38];
            v41 = [CDMEmbeddingConfigItem alloc];
            v42 = [v83 stringByAppendingPathComponent:v38];
            v43 = -[CDMEmbeddingConfigItem initWithEmbeddingModelPath:isStableEmbeddingModel:](v41, "initWithEmbeddingModelPath:isStableEmbeddingModel:", v42, [v38 isEqualToString:v82]);

            v44 = [(CDMEmbeddingConfigItem *)v43 embeddingModelVersion];
            char v45 = [v44 isEqualToString:v40];

            if ((v45 & 1) == 0)
            {
              v66 = (void *)MEMORY[0x263F087E8];
              uint64_t v91 = *MEMORY[0x263F08320];
              v67 = [NSString stringWithFormat:@"Embedding model version of embedding config for embedding model id: %@ doesn't match with expected embedding model version: %@.", v38, v40];
              v92 = v67;
              v68 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
              id *v79 = [v66 errorWithDomain:@"CDMEmbeddingConfigs" code:1 userInfo:v68];

              v69 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                id v73 = *v79;
                *(_DWORD *)buf = 136315394;
                v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
                __int16 v100 = 2112;
                uint64_t v101 = (uint64_t)v73;
                _os_log_error_impl(&dword_2263A0000, v69, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
              }

              id v22 = objc_alloc_init(NSDictionary);
              v9 = v39;
              uint64_t v13 = v82;
              v10 = v83;
              v11 = v74;
              uint64_t v12 = v75;
              v16 = v80;
              goto LABEL_53;
            }
            v46 = [(CDMEmbeddingConfigItem *)v43 embeddingModelVersion];
            [v80 setObject:v43 forKeyedSubscript:v46];

            v9 = v39;
          }
          v29 = obj;
          uint64_t v36 = [(CDMEmbeddingConfigItem *)obj countByEnumeratingWithState:&v85 objects:v93 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }

      uint64_t v13 = v82;
      v47 = [NSString stringWithFormat:@"%@.%@", v9, v82];
      stableEmbeddingModelVersion = self->_stableEmbeddingModelVersion;
      self->_stableEmbeddingModelVersion = v47;

      v10 = v83;
      v11 = v74;
      uint64_t v12 = v75;
      v16 = v80;
    }
    else
    {
      if (v12 | v13)
      {
        v84 = v10;
        id v81 = v15;
        v49 = (void *)MEMORY[0x263F087E8];
        uint64_t v89 = *MEMORY[0x263F08320];
        uint64_t v50 = v12;
        v51 = [NSString stringWithFormat:@"Invalid embedding configs with embedding model ids: %@, stable embedding model id: %@. CDM is confusing whether current is single embedding mode or multi embedding mode.", v12, v13];
        v90 = v51;
        v52 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id *v79 = [v49 errorWithDomain:@"CDMEmbeddingConfigs" code:1 userInfo:v52];

        v53 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          id v70 = *v79;
          *(_DWORD *)buf = 136315394;
          v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
          __int16 v100 = 2112;
          uint64_t v101 = (uint64_t)v70;
          _os_log_error_impl(&dword_2263A0000, v53, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
        }

        id v22 = objc_alloc_init(NSDictionary);
        uint64_t v12 = v50;
        v16 = v81;
        v10 = v84;
        goto LABEL_54;
      }
      v28 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
        _os_log_impl(&dword_2263A0000, v28, OS_LOG_TYPE_INFO, "%s In single embedding model mode. Skipping version check.", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_stableEmbeddingModelVersion, v9);
      v29 = [[CDMEmbeddingConfigItem alloc] initWithEmbeddingModelPath:v10 isStableEmbeddingModel:1];
      [v16 setObject:v29 forKeyedSubscript:v9];
    }

    uint64_t v30 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = self->_stableEmbeddingModelVersion;
      *(_DWORD *)buf = 136315650;
      v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
      __int16 v100 = 2112;
      uint64_t v101 = (uint64_t)v31;
      __int16 v102 = 2112;
      uint64_t v103 = (uint64_t)v16;
      _os_log_impl(&dword_2263A0000, v30, OS_LOG_TYPE_INFO, "%s Stable embedding asset version: %@. Embedding config items: %@.", buf, 0x20u);
    }

    id v22 = v16;
LABEL_54:

LABEL_55:
    goto LABEL_56;
  }
  id v27 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v99 = "-[CDMEmbeddingConfigs generateEmbeddingConfigItemsWithError:]";
    _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s Input asset paths is nil. Return empty map.", buf, 0xCu);
  }

  id v22 = objc_alloc_init(NSDictionary);
LABEL_56:
  return v22;
}

- (id)generateServiceDependentEmbeddingModelVersionsWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Generate CDM service dependent embedding model version map.", buf, 0xCu);
  }

  if (self->_assetPaths)
  {
    uint64_t v30 = a3;
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v7 = self->_assetPaths;
    uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v13 = [(NSDictionary *)self->_assetPaths objectForKey:v12];
          id v14 = v13;
          if (v13 && [v13 getAssetType])
          {
            id v15 = [v14 getAssetMetadata];
            v16 = [v15 objectForKey:@"EMBEDDING_VERSION"];

            if (!v16)
            {
              v17 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
                __int16 v39 = 2112;
                id v40 = v14;
                __int16 v41 = 2112;
                v42 = @"EMBEDDING_VERSION";
                _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Asset: %@ doesn't have metadata with key: %@. Will use the stable embedding model version.", buf, 0x20u);
              }

              v16 = self->_stableEmbeddingModelVersion;
            }
            v18 = [(NSDictionary *)self->_embeddingConfigItems objectForKey:v16];

            if (!v18)
            {
              id v22 = (void *)MEMORY[0x263F087E8];
              uint64_t v35 = *MEMORY[0x263F08320];
              id v23 = NSString;
              v24 = [(NSDictionary *)self->_embeddingConfigItems allKeys];
              id v25 = [v23 stringWithFormat:@"The dependent embedding model version: %@ for uafFactorName: %@ doesn't exist in all available embedding model versions: %@.", v16, v12, v24];
              uint64_t v36 = v25;
              id v26 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
              *uint64_t v30 = [v22 errorWithDomain:@"CDMEmbeddingConfigs" code:1 userInfo:v26];

              id v27 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                id v29 = *v30;
                *(_DWORD *)buf = 136315394;
                v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
                __int16 v39 = 2112;
                id v40 = v29;
                _os_log_error_impl(&dword_2263A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@. Return empty map.", buf, 0x16u);
              }

              id v20 = objc_alloc_init(NSDictionary);
              goto LABEL_30;
            }
            [v6 setObject:v16 forKeyedSubscript:v12];
          }
          else
          {
            v16 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
              __int16 v39 = 2112;
              id v40 = v12;
              _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Asset for UAF factor: %@ is nil.", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s CDM factor dependent embedding model version map is: %@.", buf, 0x16u);
    }

    id v20 = v6;
LABEL_30:
  }
  else
  {
    v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CDMEmbeddingConfigs generateServiceDependentEmbeddingModelVersionsWithError:]";
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Input asset paths is nil. Return empty map.", buf, 0xCu);
    }

    id v20 = objc_alloc_init(NSDictionary);
  }
  return v20;
}

- (id)getDependentEmbeddingConfigs
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_setupCalled)
  {
    v3 = (void *)MEMORY[0x263EFFA08];
    v4 = [(NSDictionary *)self->_serviceDependentEmbeddingModelVersions allValues];
    v5 = [v3 setWithArray:v4];

    id v6 = [v5 allObjects];
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[CDMEmbeddingConfigs getDependentEmbeddingConfigs]";
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s All embedding versions that has CDM DAG services dependent on: %@.", buf, 0x16u);
    }

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = -[NSDictionary objectForKey:](self->_embeddingConfigItems, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CDMEmbeddingConfigs getDependentEmbeddingConfigs]";
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", buf, 0xCu);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3 embeddingVersion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[CDMEmbeddingConfigs initWithAssetPaths:embeddingVersion:]";
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Init CDM embedding configs with asset paths: %@ and embedding version %@.", buf, 0x20u);
  }

  v13.receiver = self;
  v13.super_class = (Class)CDMEmbeddingConfigs;
  uint64_t v10 = [(CDMEmbeddingConfigs *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetPaths, a3);
    objc_storeStrong((id *)&v11->_clientEmbeddingVersion, a4);
  }

  return v11;
}

- (id)getEmbeddingVersionDictionary
{
  return self->_embeddingReturnForVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingReturnForVersion, 0);
  objc_storeStrong((id *)&self->_serviceDependentEmbeddingModelVersions, 0);
  objc_storeStrong((id *)&self->_embeddingConfigItems, 0);
  objc_storeStrong((id *)&self->_clientEmbeddingVersion, 0);
  objc_storeStrong((id *)&self->_stableEmbeddingModelVersion, 0);
  objc_storeStrong((id *)&self->_assetPaths, 0);
}

- (void)encodeWithCoder:(id)a3
{
  assetPaths = self->_assetPaths;
  id v5 = a3;
  [v5 encodeObject:assetPaths forKey:@"assetPaths"];
  [v5 encodeObject:self->_stableEmbeddingModelVersion forKey:@"_stableEmbeddingModelVersion"];
  [v5 encodeObject:self->_embeddingConfigItems forKey:@"embeddingConfigItems"];
  [v5 encodeObject:self->_serviceDependentEmbeddingModelVersions forKey:@"serviceDependentEmbeddingModelVersions"];
  [v5 encodeBool:self->_setupCalled forKey:@"setupCalled"];
}

- (CDMEmbeddingConfigs)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CDMEmbeddingConfigs;
  id v5 = [(CDMEmbeddingConfigs *)&v28 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"assetPaths"];
    assetPaths = v5->_assetPaths;
    v5->_assetPaths = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stableEmbeddingModelVersion"];
    stableEmbeddingModelVersion = v5->_stableEmbeddingModelVersion;
    v5->_stableEmbeddingModelVersion = (NSString *)v14;

    __int16 v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    id v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"embeddingConfigItems"];
    embeddingConfigItems = v5->_embeddingConfigItems;
    v5->_embeddingConfigItems = (NSDictionary *)v20;

    id v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"serviceDependentEmbeddingModelVersions"];
    serviceDependentEmbeddingModelVersions = v5->_serviceDependentEmbeddingModelVersions;
    v5->_serviceDependentEmbeddingModelVersions = (NSDictionary *)v25;

    v5->_setupCalled = [v4 decodeBoolForKey:@"setupCalled"];
  }

  return v5;
}

- (id)getAssetPaths
{
  return self->_assetPaths;
}

- (void)validateClientEmbeddingVersion:(id)a3 embeddingAssetVersion:(id)a4 embeddingModelIdList:(id)a5 multipleModels:(BOOL)a6 withError:(id *)a7
{
  BOOL v8 = a6;
  v38[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  BOOL v15 = +[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:self->_clientEmbeddingVersion];
  if (v8)
  {
    if (v15 && ![(NSString *)self->_clientEmbeddingVersion isEqualToString:v13])
    {
      __int16 v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      uint64_t v17 = [NSString stringWithFormat:@"The embeddingVersion is with format {OS}.{NCV}.{Patch}, and it does not match with the top-level embedding asset version. Return empty map."];
      v38[0] = v17;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
      *a7 = [v16 errorWithDomain:@"CDMEmbeddingConfigs" code:2 userInfo:v18];

      id v19 = +[CDMPlatformUtils prettyPrintError:*a7];
    }
    if (!+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:](CDMEmbeddingUtils, "isValidEmbeddingVersionOnlyNumber:", self->_clientEmbeddingVersion)&& ([v14 containsObject:self->_clientEmbeddingVersion] & 1) == 0)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      v21 = [NSString stringWithFormat:@"The embeddingVersion is not a valid bolt ID as it does not exist in the available embedding model ids provided in embedding asset configuration. Return empty map."];
      uint64_t v36 = v21;
      id v22 = NSDictionary;
      uint64_t v23 = &v36;
      v24 = &v35;
LABEL_13:
      id v29 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      *a7 = [v20 errorWithDomain:@"CDMEmbeddingConfigs" code:2 userInfo:v29];

      id v30 = +[CDMPlatformUtils prettyPrintError:*a7];
    }
  }
  else
  {
    if (v15 && ![(NSString *)self->_clientEmbeddingVersion isEqualToString:v13])
    {
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F08320];
      id v26 = [NSString stringWithFormat:@"The embeddingVersion is with format {OS}.{NCV}.{Patch} (e.g. 3200.1002.1004) and it does not matche with the CDM embedding asset version. Return empty map."];
      long long v34 = v26;
      id v27 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a7 = [v25 errorWithDomain:@"CDMEmbeddingConfigs" code:2 userInfo:v27];

      id v28 = +[CDMPlatformUtils prettyPrintError:*a7];
    }
    if (!+[CDMEmbeddingUtils isValidEmbeddingVersionOnlyNumber:self->_clientEmbeddingVersion])
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v21 = [NSString stringWithFormat:@"In a single embedding model case, it is not allowed that the embeddingVersion is with format {Espresso_Bolt_ID}. Return empty map."];
      long long v32 = v21;
      id v22 = NSDictionary;
      uint64_t v23 = &v32;
      v24 = &v31;
      goto LABEL_13;
    }
  }
}

- (id)getEmbeddingConfigForEmbeddingModelVersion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CDMEmbeddingConfigs getEmbeddingConfigForEmbeddingModelVersion:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Get embedding config for embedding model version: %@.", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(NSDictionary *)self->_embeddingConfigItems objectForKey:v4];
  uint64_t v7 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CDMEmbeddingConfigs getEmbeddingConfigForEmbeddingModelVersion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s Return embedding config: %@.", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)getAllEmbeddingConfigs
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_setupCalled)
  {
    v2 = [(NSDictionary *)self->_embeddingConfigItems allValues];
  }
  else
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[CDMEmbeddingConfigs getAllEmbeddingConfigs]";
      _os_log_error_impl(&dword_2263A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v5, 0xCu);
    }

    v2 = 0;
  }
  return v2;
}

- (id)getEmbeddingConfigForFactor:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    id v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Get embedding config for factor: %@.", (uint8_t *)&v11, 0x16u);
  }

  if (self->_setupCalled)
  {
    id v6 = [(CDMEmbeddingConfigs *)self getStableEmbeddingConfig];
    uint64_t v7 = [(NSDictionary *)self->_serviceDependentEmbeddingModelVersions objectForKey:v4];
    if (v7)
    {
      uint64_t v8 = [(CDMEmbeddingConfigs *)self getEmbeddingConfigForEmbeddingModelVersion:v7];

      id v6 = (void *)v8;
    }
    int v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      id v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Return embedding config: %@ for factor :%@.", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CDMEmbeddingConfigs getEmbeddingConfigForFactor:]";
      _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v11, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)getStableEmbeddingConfig
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Get stable embedding config.", (uint8_t *)&v7, 0xCu);
  }

  if (self->_setupCalled)
  {
    id v4 = [(NSDictionary *)self->_embeddingConfigItems objectForKey:self->_stableEmbeddingModelVersion];
    int v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Return stable embedding config: %@.", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    int v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CDMEmbeddingConfigs getStableEmbeddingConfig]";
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: The setup method has not been called. Please call setup first.", (uint8_t *)&v7, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[CDMEmbeddingConfigs] - Stable Embedding Model Version: %@,\n Service Dependent Embedding Model Versions: %@,\n Max Embedding Concurrency: %d,\n Embedding Model Config Items: %@.", self->_stableEmbeddingModelVersion, self->_serviceDependentEmbeddingModelVersions, +[CDMEmbeddingConfigs getMaxEmbeddingConcurrency](CDMEmbeddingConfigs, "getMaxEmbeddingConcurrency"), self->_embeddingConfigItems];
}

- (CDMEmbeddingConfigs)initWithAssetPaths:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[CDMEmbeddingConfigs initWithAssetPaths:]";
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Init CDM embedding configs.", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)CDMEmbeddingConfigs;
  int v7 = [(CDMEmbeddingConfigs *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_assetPaths, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)getMaxEmbeddingConcurrency
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = +[CDMEmbeddingConfigs getMaxEmbeddingConcurrencyConst];
  if (v2 == 1)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      objc_super v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Simplicity is good, just 1 embedding in the system.", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_4;
  }
  int v4 = v2;
  if (v2 <= 0)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      objc_super v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      __int16 v11 = 1024;
      int v12 = v4;
      int v7 = "%s [WARN]: ⚠️ Trust but verify, why is this set to %d? Returning 1 as we need to have at least a embedding in the system.";
LABEL_13:
      int v4 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v5 = +[CDMEmbeddingConfigs isInternalBuild];
    v3 = CDMOSLoggerForCategory(0);
    BOOL v6 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (!v6) {
        goto LABEL_15;
      }
      int v9 = 136315394;
      objc_super v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      __int16 v11 = 1024;
      int v12 = v4;
      int v7 = "%s [WARN]: ⚠️ In active development on an internal build. Configured with multiple embeddings at the moment: %d";
LABEL_14:
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 0x12u);
      goto LABEL_15;
    }
    if (v6)
    {
      int v9 = 136315394;
      objc_super v10 = "+[CDMEmbeddingConfigs getMaxEmbeddingConcurrency]";
      __int16 v11 = 1024;
      int v12 = v4;
      int v7 = "%s [WARN]: 🚨 Cannot have multiple embeddings (%d) on a non-internal build, so returning 1";
      goto LABEL_13;
    }
  }
LABEL_4:
  int v4 = 1;
LABEL_15:

  return v4;
}

+ (BOOL)isInternalBuild
{
  return +[CDMPlatformUtils isInternalInstall];
}

+ (int)getMaxEmbeddingConcurrencyConst
{
  return 1;
}

+ (id)generateEmbeddingModelIdList:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [a3 componentsSeparatedByString:@","];
  int v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v11 = objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", (void)v14);
        int v12 = [v10 stringByTrimmingCharactersInSet:v11];

        if ([v12 length]) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end