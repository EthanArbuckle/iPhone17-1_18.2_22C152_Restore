@interface CDMAssetSetToFactorsConfig
- (BOOL)hasAssetSetToFactorsMapping;
- (CDMAssetSetToFactorsConfig)init;
- (id)getAllAssetSets;
- (id)getAllFactors;
- (id)getAssetSetToFactorsConfigMapping;
- (id)getCDMFactorConfigForAssetSet:(int64_t)a3;
- (void)setCDMAssetsFactorConfig:(id)a3 forAssetSet:(int64_t)a4;
@end

@implementation CDMAssetSetToFactorsConfig

- (void).cxx_destruct
{
}

- (CDMAssetSetToFactorsConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDMAssetSetToFactorsConfig;
  v2 = [(CDMAssetSetToFactorsConfig *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetToFactorsMapping = v2->_assetSetToFactorsMapping;
    v2->_assetSetToFactorsMapping = v3;
  }
  return v2;
}

- (id)getCDMFactorConfigForAssetSet:(int64_t)a3
{
  assetSetToFactorsMapping = self->_assetSetToFactorsMapping;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)assetSetToFactorsMapping objectForKey:v6];

  if (v7)
  {
    v8 = self->_assetSetToFactorsMapping;
    v9 = [NSNumber numberWithInteger:a3];
    v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)hasAssetSetToFactorsMapping
{
  return [(NSMutableDictionary *)self->_assetSetToFactorsMapping count] != 0;
}

- (id)getAllFactors
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v4 = [(NSMutableDictionary *)self->_assetSetToFactorsMapping allValues];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = [(NSMutableDictionary *)self->_assetSetToFactorsMapping allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) getFactorToFoldersMapping];
        v12 = [v11 allKeys];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)getAllAssetSets
{
  return (id)[(NSMutableDictionary *)self->_assetSetToFactorsMapping allKeys];
}

- (void)setCDMAssetsFactorConfig:(id)a3 forAssetSet:(int64_t)a4
{
  assetSetToFactorsMapping = self->_assetSetToFactorsMapping;
  objc_super v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)assetSetToFactorsMapping setObject:v7 forKey:v8];
}

- (id)getAssetSetToFactorsConfigMapping
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_assetSetToFactorsMapping];
}

@end