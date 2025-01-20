@interface AVTAssetLibrary
+ (id)sharedAssetLibrary;
- (id)assetWithType:(int64_t)a3 identifier:(id)a4;
- (void)reload;
@end

@implementation AVTAssetLibrary

- (void)reload
{
  for (uint64_t i = 0; i != 42; ++i)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = self->_assets[i];
    self->_assets[i] = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = self->_assetsByName[i];
    self->_assetsByName[i] = v6;
  }
  for (unint64_t j = 0; j != 42; ++j)
  {
    v9 = AVTPrecompiledMemojiAssetsForComponentType(j);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __25__AVTAssetLibrary_reload__block_invoke;
    v10[3] = &unk_26401FA48;
    v10[4] = self;
    v10[5] = j;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __25__AVTAssetLibrary_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  +[AVTResourceLocator sharedResourceLocator]();
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v7, (uint64_t)v5, 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [AVTAsset alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v12 path];
  v11 = [(AVTAsset *)v8 initWithType:v9 identifier:v6 path:v10];

  [*(id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 40) + 8) addObject:v11];
  [*(id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 40) + 344) setObject:v11 forKeyedSubscript:v6];
}

+ (id)sharedAssetLibrary
{
  if (sharedAssetLibrary_onceToken != -1) {
    dispatch_once(&sharedAssetLibrary_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedAssetLibrary_sharedInstance;
  return v2;
}

uint64_t __37__AVTAssetLibrary_sharedAssetLibrary__block_invoke()
{
  v0 = objc_alloc_init(AVTAssetLibrary);
  v1 = (void *)sharedAssetLibrary_sharedInstance;
  sharedAssetLibrary_sharedInstance = (uint64_t)v0;

  v2 = (void *)sharedAssetLibrary_sharedInstance;
  return [v2 reload];
}

- (id)assetWithType:(int64_t)a3 identifier:(id)a4
{
  if (a3 == 42)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByName[a3], "objectForKeyedSubscript:", a4, v4);
  }
  return v6;
}

- (void).cxx_destruct
{
  for (uint64_t i = 672; i != 336; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end