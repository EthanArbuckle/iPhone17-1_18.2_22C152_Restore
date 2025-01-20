@interface AXMMobileAssetEvaluationNode
- (AXMMobileAssetEvaluationNode)initWithIdentifier:(id)a3;
- (NSArray)mlModels;
- (NSURL)mobileAssetBaseURL;
- (id)contentVersionKey;
- (id)mlModelClasses;
- (id)mobileAssetType;
- (id)modelResourceNames;
- (id)modelURLs;
- (unint64_t)formatVersion;
- (unint64_t)maxSupportedFormatVersion;
- (unint64_t)minSupportedFormatVersion;
- (void)_downloadAssetsIfNecessary;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)minSupportedFormatVersion;
- (void)mlModelClasses;
- (void)mobileAssetType;
- (void)modelResourceNames;
- (void)setModelURLs:(id)a3;
@end

@implementation AXMMobileAssetEvaluationNode

- (AXMMobileAssetEvaluationNode)initWithIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMMobileAssetEvaluationNode;
  v3 = [(AXMVisionEngineNode *)&v5 initWithIdentifier:a3];
  [(AXMMobileAssetEvaluationNode *)v3 _downloadAssetsIfNecessary];
  return v3;
}

- (id)mlModelClasses
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXMMobileAssetEvaluationNode mlModelClasses]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)mobileAssetType
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXMMobileAssetEvaluationNode mobileAssetType]();
  }

  return &stru_1F0E72D10;
}

- (id)modelResourceNames
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXMMobileAssetEvaluationNode modelResourceNames]();
  }

  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)minSupportedFormatVersion
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXMMobileAssetEvaluationNode minSupportedFormatVersion]();
  }

  return 1;
}

- (unint64_t)maxSupportedFormatVersion
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXMMobileAssetEvaluationNode minSupportedFormatVersion]();
  }

  return -1;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (id)modelURLs
{
  if (modelURLs_onceToken != -1) {
    dispatch_once(&modelURLs_onceToken, &__block_literal_global_3);
  }
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  v3 = (void *)__ModelURLs;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = (void *)__ModelURLs;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 setObject:v7 forKeyedSubscript:v10];
  }
  v11 = (void *)__ModelURLs;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 objectForKeyedSubscript:v13];

  objc_sync_exit(v2);

  return v14;
}

void __41__AXMMobileAssetEvaluationNode_modelURLs__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)__ModelURLs;
  __ModelURLs = v0;
}

- (void)setModelURLs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_opt_class();
  objc_sync_enter(v5);
  v6 = AXLogAssetLoader();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B57D5000, v6, OS_LOG_TYPE_INFO, "Setting new model URLs: %@. Replacing old modelURLs: %@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
  [v8 removeAllObjects];

  v9 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
  [v9 addObjectsFromArray:v4];

  objc_sync_exit(v5);
}

- (id)contentVersionKey
{
  return @"_ContentVersion";
}

- (void)_downloadAssetsIfNecessary
{
  v3 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
  if ([v3 count])
  {
    mobileAssetBaseURL = self->_mobileAssetBaseURL;

    if (mobileAssetBaseURL) {
      return;
    }
  }
  else
  {
  }
  id v5 = objc_alloc(MEMORY[0x1E4F77FB8]);
  v6 = [(AXMMobileAssetEvaluationNode *)self mobileAssetType];
  v7 = (void *)[v5 initWithType:v6];

  [v7 returnTypes:2];
  [v7 setDoNotBlockBeforeFirstUnlock:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke;
  v9[3] = &unk_1E6117040;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  [v8 queryMetaData:v9];
}

void __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    v33 = (void *)MEMORY[0x1E4F77FB0];
    id v38 = [*(id *)(a1 + 40) mobileAssetType];
    [v33 startCatalogDownload:v38 then:&__block_literal_global_319];
  }
  else if (!a2)
  {
    id v37 = [*(id *)(a1 + 32) results];
    v3 = AXLogAssetLoader();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v37;
      _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_INFO, "Retrieved assets: %@", buf, 0xCu);
    }

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_302;
    v48[3] = &unk_1E6116FD0;
    v48[4] = *(void *)(a1 + 40);
    v36 = objc_msgSend(v37, "ax_filteredArrayUsingBlock:", v48);
    id v4 = AXLogAssetLoader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "minSupportedFormatVersion"));
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "maxSupportedFormatVersion"));
      *(_DWORD *)buf = 138412802;
      id v52 = v36;
      __int16 v53 = 2112;
      v54 = v5;
      __int16 v55 = 2112;
      v56 = v6;
      _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_INFO, "Supported assets: %@ %@ %@", buf, 0x20u);
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_308;
    v47[3] = &unk_1E6116FF8;
    v47[4] = *(void *)(a1 + 40);
    v7 = [v36 sortedArrayUsingComparator:v47];
    id v8 = [v7 lastObject];
    v9 = AXLogAssetLoader();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v8;
      _os_log_impl(&dword_1B57D5000, v9, OS_LOG_TYPE_INFO, "Found download node asset: %@", buf, 0xCu);
    }

    if (v8)
    {
      id v10 = [v8 attributes];
      v35 = [v10 objectForKeyedSubscript:@"FormatVersion"];

      id v11 = [v8 attributes];
      __int16 v12 = [v11 objectForKeyedSubscript:@"FormatVersion"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        *(void *)(*(void *)(a1 + 40) + 64) = [v35 unsignedIntegerValue];
      }
      [v8 logAsset];
      if ([v8 state] == 2 || objc_msgSend(v8, "state") == 4 || objc_msgSend(v8, "state") == 3)
      {
        if ([v8 state] == 2 || objc_msgSend(v8, "state") == 3)
        {
          objc_opt_class();
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(obj);
          uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v15 = [*(id *)(a1 + 40) modelResourceNames];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v50 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v44 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                v20 = objc_msgSend(v8, "getLocalFileUrl", obj);
                v21 = [v20 URLByAppendingPathComponent:v19];
                [v14 addObject:v21];
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v50 count:16];
            }
            while (v16);
          }

          [*(id *)(a1 + 40) setModelURLs:v14];
          v22 = AXMediaLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v14;
            _os_log_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_INFO, "Adding model URLS: %@", buf, 0xCu);
          }

          uint64_t v23 = [v8 getLocalFileUrl];
          uint64_t v24 = *(void *)(a1 + 40);
          v25 = *(void **)(v24 + 80);
          *(void *)(v24 + 80) = v23;

          v26 = AXMediaLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = *(void **)(*(void *)(a1 + 40) + 80);
            *(_DWORD *)buf = 138412546;
            id v52 = v27;
            __int16 v53 = 2112;
            v54 = v8;
            _os_log_impl(&dword_1B57D5000, v26, OS_LOG_TYPE_INFO, "Adding base URLS: %@ -> %@", buf, 0x16u);
          }

          if (!*(void *)(*(void *)(a1 + 40) + 80))
          {
            v28 = AXMediaLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B57D5000, v28, OS_LOG_TYPE_INFO, "No base URL, resetting model URLs", buf, 2u);
            }

            [*(id *)(a1 + 40) setModelURLs:0];
          }

          objc_sync_exit(obj);
          if ((unint64_t)[v7 count] >= 2)
          {
            v29 = objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v49 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v40;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v40 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "purge:", &__block_literal_global_316, obj);
                }
                uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v49 count:16];
              }
              while (v30);
            }
          }
        }
      }
      else
      {
        [v8 startDownload:&__block_literal_global_313];
      }
    }
  }
}

BOOL __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_302(uint64_t a1, void *a2)
{
  v3 = [a2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"FormatVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = [v4 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 1;
  }
  BOOL v6 = v5 >= [*(id *)(a1 + 32) minSupportedFormatVersion]
    && v5 <= [*(id *)(a1 + 32) maxSupportedFormatVersion];

  return v6;
}

uint64_t __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_308(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = [a2 attributes];
  v7 = [*(id *)(a1 + 32) contentVersionKey];
  id v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [v5 attributes];

  id v10 = [*(id *)(a1 + 32) contentVersionKey];
  id v11 = [v9 objectForKeyedSubscript:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    uint64_t v12 = [v8 compare:v11];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)AXMMobileAssetEvaluationNode;
  id v27 = a3;
  id v28 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v30, sel_evaluate_metrics_, v27);
  [(AXMMobileAssetEvaluationNode *)self _downloadAssetsIfNecessary];
  if (!self->_mlModels)
  {
    BOOL v6 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v7 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
    uint64_t v8 = [v7 count];
    v9 = [(AXMMobileAssetEvaluationNode *)self mlModelClasses];
    uint64_t v10 = [v9 count];

    unint64_t v11 = 0;
    *(void *)&long long v12 = 138412290;
    long long v25 = v12;
    while (1)
    {
      v13 = [(AXMMobileAssetEvaluationNode *)self mlModelClasses];
      BOOL v14 = [v13 count] > v11;

      if (!v14) {
        break;
      }
      v15 = [(AXMMobileAssetEvaluationNode *)self mlModelClasses];
      uint64_t v16 = (objc_class *)[v15 objectAtIndexedSubscript:v11];

      if (v8 == v10)
      {
        uint64_t v17 = [(AXMMobileAssetEvaluationNode *)self modelURLs];
        v18 = [v17 objectAtIndexedSubscript:v11];

        if (v18)
        {
          id v19 = [v16 alloc];
          id v29 = 0;
          id v20 = (id)[v19 initWithContentsOfURL:v18 error:&v29];
          id v21 = v29;
          if (v21)
          {
            v22 = AXMediaLogCommon();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              id v32 = v21;
              _os_log_error_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_ERROR, "Can't load model: %@", buf, 0xCu);
            }
          }
          else
          {
            v22 = AXMediaLogCommon();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v32 = v18;
              __int16 v33 = 2112;
              id v34 = v20;
              _os_log_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_INFO, "Made model: %@ %@", buf, 0x16u);
            }
          }

          if (v20) {
            goto LABEL_13;
          }
        }
      }
      id v20 = objc_alloc_init(v16);
      if (v20) {
LABEL_13:
      }
        [v6 addObject:v20];

      ++v11;
    }
    objc_sync_exit(obj);

    uint64_t v23 = [v6 count];
    uint64_t v24 = [(AXMMobileAssetEvaluationNode *)self mlModelClasses];
    LOBYTE(v23) = v23 == [v24 count];

    if (v23) {
      objc_storeStrong((id *)&self->_mlModels, v6);
    }
  }
}

- (NSArray)mlModels
{
  return self->_mlModels;
}

- (NSURL)mobileAssetBaseURL
{
  return self->_mobileAssetBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetBaseURL, 0);

  objc_storeStrong((id *)&self->_mlModels, 0);
}

- (void)mlModelClasses
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Need to define mlModelClasses for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
}

- (void)mobileAssetType
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Need to define an mobileAssetType for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
}

- (void)modelResourceNames
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Need to define modelResourceNames for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
}

- (void)minSupportedFormatVersion
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Need to define an minSupportedFormatVersion for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
}

@end