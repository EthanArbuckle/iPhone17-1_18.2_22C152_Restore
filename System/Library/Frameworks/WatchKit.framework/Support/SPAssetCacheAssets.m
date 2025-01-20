@interface SPAssetCacheAssets
+ (id)fromProto:(id)a3;
+ (id)toProto:(id)a3;
- (NSMutableArray)assets;
- (SPAssetCacheAssets)init;
- (void)addAsset:(id)a3;
- (void)setAssets:(id)a3;
@end

@implementation SPAssetCacheAssets

- (SPAssetCacheAssets)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPAssetCacheAssets;
  v2 = [(SPAssetCacheAssets *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    assets = v2->_assets;
    v2->_assets = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addAsset:(id)a3
{
}

+ (id)toProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheAssets);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(v3, "assets", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[SPCacheAsset toProto:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [(SPProtoCacheAssets *)v4 addAssets:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPAssetCacheAssets);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "assets", 0);
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [(SPAssetCacheAssets *)v4 assets];
        long long v12 = +[SPCacheAsset fromProto:v10];
        [v11 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end