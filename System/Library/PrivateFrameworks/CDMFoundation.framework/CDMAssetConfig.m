@interface CDMAssetConfig
- (BOOL)hasAssetConfigItems;
- (CDMAssetConfig)init;
- (id)getAssetConfigItemForKey:(id)a3;
- (id)getAssetConfigItems;
- (void)addAssetConfigItem:(id)a3 forKey:(id)a4;
@end

@implementation CDMAssetConfig

- (void).cxx_destruct
{
}

- (void)addAssetConfigItem:(id)a3 forKey:(id)a4
{
}

- (id)getAssetConfigItemForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_assetConfigs objectForKey:v4];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_assetConfigs objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasAssetConfigItems
{
  return [(NSMutableDictionary *)self->_assetConfigs count] != 0;
}

- (id)getAssetConfigItems
{
  return (id)[NSDictionary dictionaryWithDictionary:self->_assetConfigs];
}

- (CDMAssetConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDMAssetConfig;
  v2 = [(CDMAssetConfig *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetConfigs = v2->_assetConfigs;
    v2->_assetConfigs = v3;
  }
  return v2;
}

@end