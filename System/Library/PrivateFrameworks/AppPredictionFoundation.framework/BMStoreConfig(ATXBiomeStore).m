@interface BMStoreConfig(ATXBiomeStore)
+ (id)atx_biomeStreamManagerStreamsBasePath;
+ (id)atx_storeConfigWithMaxAge:()ATXBiomeStore;
+ (uint64_t)atx_storeConfig;
@end

@implementation BMStoreConfig(ATXBiomeStore)

+ (uint64_t)atx_storeConfig
{
  return objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfigWithMaxAge:", 0.0);
}

+ (id)atx_storeConfigWithMaxAge:()ATXBiomeStore
{
  id v4 = objc_alloc(MEMORY[0x1E4F50278]);
  v5 = objc_msgSend(a1, "atx_biomeStreamManagerStreamsBasePath");
  v6 = (void *)[v4 initWithStoreBasePath:v5 segmentSize:0x800000];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:1 filterByAgeOnRead:0 maxAge:0x20000000 maxStreamSize:a2];
  [v6 setPruningPolicy:v7];

  return v6;
}

+ (id)atx_biomeStreamManagerStreamsBasePath
{
  return +[ATXPaths biomeStreamsRootDirectory];
}

@end