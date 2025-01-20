@interface ATXModeEntityStore
- (ATXModeEntityStore)init;
- (ATXModeEntityStore)initWithModeMetadataConstants:(id)a3;
- (id)appEntityForBundleId:(id)a3;
@end

@implementation ATXModeEntityStore

- (ATXModeEntityStore)init
{
  v3 = objc_opt_new();
  v4 = [(ATXModeEntityStore *)self initWithModeMetadataConstants:v3];

  return v4;
}

- (ATXModeEntityStore)initWithModeMetadataConstants:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXModeEntityStore;
  v6 = [(ATXModeEntityStore *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    entityStore = v6->_entityStore;
    v6->_entityStore = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_modeMetadataConstants, a3);
  }

  return v6;
}

- (id)appEntityForBundleId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[ATXSessionTaggingAppEntity keyForBundleId:v4];
    v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(NSMutableDictionary *)v6->_entityStore objectForKeyedSubscript:v5];

    if (v7)
    {
      v8 = [(NSMutableDictionary *)v6->_entityStore objectForKeyedSubscript:v5];
    }
    else
    {
      v8 = [[ATXSessionTaggingAppEntity alloc] initWithBundleId:v4 modeMetadataConstants:v6->_modeMetadataConstants];
      [(NSMutableDictionary *)v6->_entityStore setObject:v8 forKeyedSubscript:v5];
    }
    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeMetadataConstants, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
}

@end