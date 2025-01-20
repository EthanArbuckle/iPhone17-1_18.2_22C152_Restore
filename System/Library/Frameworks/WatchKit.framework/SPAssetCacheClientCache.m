@interface SPAssetCacheClientCache
- (BOOL)addAsset:(id)a3 withName:(id)a4 sendImage:(BOOL)a5;
- (BOOL)checkAvailableSpaceForAssetWithName:(id)a3 length:(unint64_t)a4;
- (BOOL)saveAssetData:(id)a3 forAsset:(id)a4;
- (NSMutableArray)keys;
- (NSMutableDictionary)assets;
- (NSString)gizmoCacheIdentifier;
- (SPAssetCacheClientCache)initWithIdentifier:(id)a3 cacheType:(unint64_t)a4;
- (id)cacheDirectory;
- (id)cachedImages;
- (id)dataForImageWithName:(id)a3;
- (id)pathForAssetDataWithName:(id)a3;
- (int64_t)size;
- (unint64_t)cacheType;
- (void)addedAssetWithName:(id)a3;
- (void)clearSpaceForAsset:(unint64_t)a3;
- (void)deleteAllAssets;
- (void)deleteAsset:(id)a3;
- (void)deleteAssetWithName:(id)a3;
- (void)deleteDataForAsset:(id)a3;
- (void)deletedAssetWithName:(id)a3;
- (void)setAssets:(id)a3;
- (void)setCacheType:(unint64_t)a3;
- (void)setGizmoCacheIdentifier:(id)a3;
- (void)setKeys:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)syncAssets:(id)a3;
@end

@implementation SPAssetCacheClientCache

- (SPAssetCacheClientCache)initWithIdentifier:(id)a3 cacheType:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPAssetCacheClientCache;
  v8 = [(SPAssetCacheClientCache *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    keys = v8->_keys;
    v8->_keys = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    assets = v8->_assets;
    v8->_assets = (NSMutableDictionary *)v11;

    v8->_size = 0;
    v8->_cacheType = a4;
    objc_storeStrong((id *)&v8->_gizmoCacheIdentifier, a3);
  }

  return v8;
}

- (id)cacheDirectory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SPAssetCacheClientCache_cacheDirectory__block_invoke;
  block[3] = &unk_264598C20;
  block[4] = self;
  if (cacheDirectory_onceDirectoryToken != -1) {
    dispatch_once(&cacheDirectory_onceDirectoryToken, block);
  }
  return (id)cacheDirectory___cacheDirectory;
}

void __41__SPAssetCacheClientCache_cacheDirectory__block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = NSHomeDirectory();
  v10[0] = v2;
  v10[1] = @"/Library/Caches/";
  v10[2] = @"com.apple.watchkit.imagecache";
  v10[3] = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];

  uint64_t v4 = [NSString pathWithComponents:v3];
  v5 = (void *)cacheDirectory___cacheDirectory;
  cacheDirectory___cacheDirectory = v4;

  v6 = [MEMORY[0x263F08850] defaultManager];
  id v9 = 0;
  [v6 createDirectoryAtPath:cacheDirectory___cacheDirectory withIntermediateDirectories:1 attributes:0 error:&v9];
  id v7 = v9;

  if (v7)
  {
    v8 = wk_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __41__SPAssetCacheClientCache_cacheDirectory__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
}

- (id)pathForAssetDataWithName:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SPAssetCacheClientCache *)self cacheDirectory];
  v10[0] = v5;
  v6 = objc_msgSend(v4, "_sp_stringByEncodingIllegalFilenameCharacters");

  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  v8 = [NSString pathWithComponents:v7];

  return v8;
}

- (void)syncAssets:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SPAssetCacheClientCache *)self clearedCache];
  unint64_t cacheType = self->_cacheType;
  if (cacheType == 2)
  {
    v19 = [v4 transientCache];
    v20 = [v19 assets];

    if (v20)
    {
      v21 = [v4 transientCache];
      v22 = [v21 assets];
      v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_9];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = v23;
      uint64_t v24 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v9);
            }
            v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            assets = self->_assets;
            v30 = objc_msgSend(v28, "key", (void)v33);
            [(NSMutableDictionary *)assets setObject:v28 forKey:v30];

            keys = self->_keys;
            v32 = [v28 key];
            [(NSMutableArray *)keys addObject:v32];

            self->_size += [v28 size];
          }
          uint64_t v25 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v25);
      }

      goto LABEL_21;
    }
  }
  else if (cacheType == 1)
  {
    v6 = [v4 permanentCache];
    id v7 = [v6 assets];

    if (v7)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v8 = [v4 permanentCache];
      id v9 = [v8 assets];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_super v14 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            v15 = self->_assets;
            v16 = [v14 key];
            [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];

            v17 = self->_keys;
            v18 = [v14 key];
            [(NSMutableArray *)v17 addObject:v18];

            self->_size += [v14 size];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v11);
      }
LABEL_21:
    }
  }
}

BOOL __38__SPAssetCacheClientCache_syncAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessDate];
  double v6 = v5;
  [v4 accessDate];
  double v8 = v7;

  return v6 > v8;
}

- (BOOL)addAsset:(id)a3 withName:(id)a4 sendImage:(BOOL)a5
{
  BOOL v5 = a5;
  v29[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v21 = wk_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SPAssetCacheClientCache addAsset:withName:sendImage:]();
    }

    goto LABEL_14;
  }
  if (self->_cacheType != 1)
  {
    v22 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:v9];

    if (v22)
    {
      BOOL v20 = 1;
    }
    else
    {
      -[SPAssetCacheClientCache clearSpaceForAsset:](self, "clearSpaceForAsset:", [v8 length]);
      [(NSMutableArray *)self->_keys addObject:v9];
      v23 = [SPCacheAsset alloc];
      uint64_t v24 = [v8 length];
      uint64_t v25 = [MEMORY[0x263EFF910] date];
      BOOL v20 = 1;
      uint64_t v26 = [(SPCacheAsset *)v23 initWithName:v9 size:v24 state:1 accessDate:v25];
      [(NSMutableDictionary *)self->_assets setObject:v26 forKeyedSubscript:v9];
    }
    goto LABEL_20;
  }
  if (!-[SPAssetCacheClientCache checkAvailableSpaceForAssetWithName:length:](self, "checkAvailableSpaceForAssetWithName:length:", v9, [v8 length]))
  {
LABEL_14:
    BOOL v20 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [SPCacheAsset alloc];
  uint64_t v11 = [v8 length];
  uint64_t v12 = [MEMORY[0x263EFF910] date];
  v13 = [(SPCacheAsset *)v10 initWithName:v9 size:v11 state:1 accessDate:v12];

  if (v5 && ![(SPAssetCacheClientCache *)self saveAssetData:v8 forAsset:v13])
  {
    BOOL v20 = 0;
  }
  else
  {
    objc_super v14 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:v9];

    if (!v14) {
      [(NSMutableArray *)self->_keys addObject:v9];
    }
    [(NSMutableDictionary *)self->_assets setObject:v13 forKeyedSubscript:v9];
    if (v5)
    {
      v29[0] = &unk_26D31C2D0;
      v28[0] = @"cmsg";
      v28[1] = @"a";
      v15 = [(SPCacheAsset *)v13 key];
      v29[1] = v15;
      v29[2] = v8;
      v28[2] = @"d";
      v28[3] = @"t";
      v16 = [NSNumber numberWithUnsignedInteger:self->_cacheType];
      v28[4] = @"i";
      gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
      v29[3] = v16;
      v29[4] = gizmoCacheIdentifier;
      v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];

      v19 = [[SPCacheMessage alloc] initWithDictionary:v18];
      +[SPRemoteInterface sendCacheRequestMessage:v19];
    }
    BOOL v20 = 1;
  }

LABEL_20:
  return v20;
}

- (void)addedAssetWithName:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 setState:0];
    [(SPAssetCacheClientCache *)self deleteDataForAsset:v5];
    id v4 = v5;
  }
}

- (void)clearSpaceForAsset:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v4 = self->_size + a3;
  if (v4 >= 0x500000)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = self->_keys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v14;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        [(SPAssetCacheClientCache *)self deleteAsset:v12];
        v9 += [v12 size];

        if (v9 >= a3) {
          break;
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unint64_t v4 = self->_size + a3;
  }
  self->_size = v4;
}

- (BOOL)checkAvailableSpaceForAssetWithName:(id)a3 length:(unint64_t)a4
{
  double v6 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:a3];
  uint64_t v7 = v6;
  if (v6) {
    a4 -= [v6 size];
  }
  unint64_t v8 = self->_size + a4;
  if (v8 >> 20 <= 4) {
    self->_size = v8;
  }
  BOOL v9 = v8 < 0x500000;

  return v9;
}

- (void)deleteAsset:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 size];
  self->_size = (self->_size - v5) & ~((self->_size - v5) >> 63);
  [(SPAssetCacheClientCache *)self deleteDataForAsset:v4];
  [v4 setState:2];
  v12[0] = &unk_26D31C2E8;
  v11[0] = @"cmsg";
  v11[1] = @"a";
  double v6 = [v4 key];

  v12[1] = v6;
  v11[2] = @"t";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_cacheType];
  v11[3] = @"i";
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  v12[2] = v7;
  v12[3] = gizmoCacheIdentifier;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  uint64_t v10 = [[SPCacheMessage alloc] initWithDictionary:v9];
  +[SPRemoteInterface sendCacheRequestMessage:v10];
}

- (void)deleteAssetWithName:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:a3];
  if (v4) {
    [(SPAssetCacheClientCache *)self deleteAsset:v4];
  }

  MEMORY[0x270F9A758]();
}

- (void)deletedAssetWithName:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_assets removeObjectForKey:v5];
    [(NSMutableArray *)self->_keys removeObject:v5];
  }
}

- (void)deleteAllAssets
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_size = 0;
  if (self->_cacheType == 1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = self->_assets;
    uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v7), (void)v13);
          [(SPAssetCacheClientCache *)self deleteDataForAsset:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v5);
    }
  }
  [(NSMutableDictionary *)self->_assets removeAllObjects];
  [(NSMutableArray *)self->_keys removeAllObjects];
  v18[0] = &unk_26D31C300;
  v17[0] = @"cmsg";
  v17[1] = @"t";
  BOOL v9 = [NSNumber numberWithUnsignedInteger:self->_cacheType];
  v17[2] = @"i";
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  v18[1] = v9;
  v18[2] = gizmoCacheIdentifier;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  uint64_t v12 = [[SPCacheMessage alloc] initWithDictionary:v11];
  +[SPRemoteInterface sendCacheRequestMessage:v12];
}

- (id)cachedImages
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_assets;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assets, "objectForKeyedSubscript:", v9, (void)v13);
        if ([v10 state] == 1 || !objc_msgSend(v10, "state"))
        {
          uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "size"));
          [v3 setObject:v11 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)saveAssetData:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 key];
  unint64_t v8 = [(SPAssetCacheClientCache *)self pathForAssetDataWithName:v7];

  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v7) = [v9 fileExistsAtPath:v8];

  if (v7)
  {
    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    id v18 = 0;
    char v11 = [v10 removeItemAtPath:v8 error:&v18];
    id v12 = v18;

    if ((v11 & 1) == 0)
    {
      long long v13 = wk_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SPAssetCacheClientCache saveAssetData:forAsset:]();
      }
LABEL_9:

      BOOL v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = 0;
  }
  long long v14 = v12;
  id v17 = v12;
  BOOL v15 = 1;
  [v6 writeToFile:v8 options:1 error:&v17];
  id v12 = v17;

  if (v12)
  {
    long long v13 = wk_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPAssetCacheClientCache saveAssetData:forAsset:]();
    }
    goto LABEL_9;
  }
LABEL_10:

  return v15;
}

- (void)deleteDataForAsset:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 key];
    uint64_t v5 = [(SPAssetCacheClientCache *)self pathForAssetDataWithName:v4];

    id v6 = [MEMORY[0x263F08850] defaultManager];
    int v7 = [v6 fileExistsAtPath:v5];

    if (v7)
    {
      unint64_t v8 = [MEMORY[0x263F08850] defaultManager];
      id v12 = 0;
      char v9 = [v8 removeItemAtPath:v5 error:&v12];
      id v10 = v12;

      if ((v9 & 1) == 0)
      {
        char v11 = wk_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[SPAssetCacheClientCache deleteDataForAsset:]();
        }
      }
    }
    else
    {
      id v10 = 0;
    }
  }
}

- (id)dataForImageWithName:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263EFF8F8];
    int v7 = [v4 key];
    unint64_t v8 = [(SPAssetCacheClientCache *)self pathForAssetDataWithName:v7];
    char v9 = [v6 dataWithContentsOfFile:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)gizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier;
}

- (void)setGizmoCacheIdentifier:(id)a3
{
}

- (NSMutableDictionary)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_unint64_t cacheType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);
}

void __41__SPAssetCacheClientCache_cacheDirectory__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = 136446978;
  v3 = "-[SPAssetCacheClientCache cacheDirectory]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 60;
  __int16 v6 = 2114;
  uint64_t v7 = cacheDirectory___cacheDirectory;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_2211F3000, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to create directory at %{public}@, error: %{public}@", (uint8_t *)&v2, 0x26u);
}

- (void)addAsset:withName:sendImage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2211F3000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to cache image with name: %{public}@", (uint8_t *)v1, 0x1Cu);
}

- (void)saveAssetData:forAsset:.cold.1()
{
  int v2 = 136446978;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: failed to save asset at: %{public}@, error: %{public}@", v2);
}

- (void)saveAssetData:forAsset:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@");
}

- (void)deleteDataForAsset:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3(&dword_2211F3000, v0, v1, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@");
}

@end