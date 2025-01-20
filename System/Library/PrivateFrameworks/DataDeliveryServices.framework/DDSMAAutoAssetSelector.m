@interface DDSMAAutoAssetSelector
+ (id)allSupportedLinguisticAssetTypeForAssetType:(id)a3;
+ (id)createWithQuery:(id)a3 supportedAssetSpecifiers:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DDSMAAutoAssetSelector)initWithAssetType:(id)a3 assetSpecifier:(id)a4;
- (MAAutoAssetSelector)assetSelector;
- (id)description;
- (unint64_t)hash;
@end

@implementation DDSMAAutoAssetSelector

- (DDSMAAutoAssetSelector)initWithAssetType:(id)a3 assetSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DDSMAAutoAssetSelector;
  v8 = [(DDSMAAutoAssetSelector *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F77FE0]) initForAssetType:v6 withAssetSpecifier:v7];
    assetSelector = v8->_assetSelector;
    v8->_assetSelector = (MAAutoAssetSelector *)v9;
  }
  return v8;
}

+ (id)allSupportedLinguisticAssetTypeForAssetType:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.MobileAsset.LinguisticDataAuto"])
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v9[0] = @"Priority";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = [v4 setWithArray:v5];
  }
  else
  {
    id v7 = AutoAssetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[DDSMAAutoAssetSelector allSupportedLinguisticAssetTypeForAssetType:]();
    }

    id v6 = objc_opt_new();
  }

  return v6;
}

+ (id)createWithQuery:(id)a3 supportedAssetSpecifiers:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v8 = [v5 assetType];
  uint64_t v9 = +[DDSMAAutoAssetSelector allSupportedLinguisticAssetTypeForAssetType:v8];

  v49 = v5;
  v10 = [v5 filter];
  v11 = [v10 allowedValuesForKey:@"LinguisticAssetType"];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v64 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        if ([v9 containsObject:v17]) {
          [v7 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v14);
  }

  if ([v12 count] && !objc_msgSend(v7, "count"))
  {
    v20 = AutoAssetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:]();
    }
    v39 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (![v7 count])
    {
      v18 = AutoAssetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:]();
      }

      v19 = [v9 allObjects];
      [v7 addObjectsFromArray:v19];
    }
    id v41 = v12;
    v42 = v9;
    v20 = objc_opt_new();
    v21 = [v49 filter];
    v46 = [v21 allowedValuesForKey:@"AssetLocale"];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v43 = v7;
    obuint64_t j = v7;
    uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v47)
    {
      uint64_t v45 = *(void *)v60;
      v22 = @"fil";
      unint64_t v23 = 0x1E4F1C000uLL;
      unint64_t v24 = 0x1E4F29000uLL;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v60 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = v25;
          uint64_t v52 = *(void *)(*((void *)&v59 + 1) + 8 * v25);
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v50 = v46;
          uint64_t v53 = [v50 countByEnumeratingWithState:&v55 objects:v69 count:16];
          if (v53)
          {
            uint64_t v51 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v53; ++j)
              {
                if (*(void *)v56 != v51) {
                  objc_enumerationMutation(v50);
                }
                v27 = [*(id *)(v23 + 2592) localeWithLocaleIdentifier:*(void *)(*((void *)&v55 + 1) + 8 * j)];
                v28 = [v27 languageCode];
                v54 = v27;
                if ([(__CFString *)v28 isEqualToString:v22])
                {

                  v28 = @"tl";
                }
                v29 = [*(id *)(v24 + 24) stringWithFormat:@"%@_%@", v52, v28];
                if ([v6 containsObject:v29])
                {
                  v30 = [DDSMAAutoAssetSelector alloc];
                  [v49 assetType];
                  unint64_t v31 = v24;
                  unint64_t v32 = v23;
                  v33 = v22;
                  v34 = v20;
                  v36 = id v35 = v6;
                  v37 = [(DDSMAAutoAssetSelector *)v30 initWithAssetType:v36 assetSpecifier:v29];

                  id v6 = v35;
                  v20 = v34;
                  v22 = v33;
                  unint64_t v23 = v32;
                  unint64_t v24 = v31;
                  [v20 addObject:v37];
                }
                else
                {
                  v37 = DefaultLog();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v68 = v29;
                    _os_log_impl(&dword_1E41D6000, v37, OS_LOG_TYPE_DEFAULT, "Auto asset specifier: %@ is not supported", buf, 0xCu);
                  }
                }
              }
              uint64_t v53 = [v50 countByEnumeratingWithState:&v55 objects:v69 count:16];
            }
            while (v53);
          }

          uint64_t v25 = v48 + 1;
        }
        while (v48 + 1 != v47);
        uint64_t v47 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v47);
    }

    v38 = AutoAssetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:]();
    }

    v39 = [v20 allObjects];

    uint64_t v9 = v42;
    id v7 = v43;
    id v12 = v41;
  }

  return v39;
}

- (id)description
{
  v2 = [(DDSMAAutoAssetSelector *)self assetSelector];
  id v3 = [v2 description];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(DDSMAAutoAssetSelector *)self assetSelector];
  id v3 = [v2 description];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(DDSMAAutoAssetSelector *)self assetSelector];
    id v7 = [v5 assetSelector];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void).cxx_destruct
{
}

+ (void)allSupportedLinguisticAssetTypeForAssetType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E41D6000, v0, v1, "Supported linguistic asset types are not provided for asset type: %@", v2, v3, v4, v5, v6);
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1E41D6000, v1, OS_LOG_TYPE_DEBUG, "Created DDSMAAutoAssetSelectors: %@ for query: %@", v2, 0x16u);
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E41D6000, v0, v1, "LinguisticAssetType is not provided in the query: %@", v2, v3, v4, v5, v6);
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1E41D6000, v0, v1, "LinguisticAssetType is provided in the query does not support auto asset: %@", v2, v3, v4, v5, v6);
}

@end