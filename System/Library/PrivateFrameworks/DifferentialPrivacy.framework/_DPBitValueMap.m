@interface _DPBitValueMap
+ (id)bitValueMapForKey:(id)a3;
+ (id)bitValueMapForKey:(id)a3 bitValueMapsDirectory:(id)a4;
+ (id)bitValueMapForKey:(id)a3 fromConfigurationsFile:(id)a4;
+ (void)initialize;
+ (void)removeBitValueMapForKey:(id)a3;
- (NSDictionary)map;
- (NSString)key;
- (_DPBitValueMap)init;
- (_DPBitValueMap)initWithKey:(id)a3 bitValueMapsDirectory:(id)a4;
- (id)bitValueForString:(id)a3;
@end

@implementation _DPBitValueMap

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_12);
  }
}

- (_DPBitValueMap)init
{
  return 0;
}

- (_DPBitValueMap)initWithKey:(id)a3 bitValueMapsDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DPBitValueMap;
  v9 = [(_DPBitValueMap *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    uint64_t v11 = [(id)objc_opt_class() bitValueMapForKey:v7 fromConfigurationsFile:v8];
    map = v10->_map;
    v10->_map = (NSDictionary *)v11;
  }
  return v10;
}

+ (id)bitValueMapForKey:(id)a3
{
  id v4 = a3;
  v5 = +[_DPStrings bitValueMapDirectoryPath];
  v6 = [a1 bitValueMapForKey:v4 bitValueMapsDirectory:v5];

  return v6;
}

+ (id)bitValueMapForKey:(id)a3 bitValueMapsDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)_allBitValueMaps;
  objc_sync_enter(v8);
  v9 = [(id)_allBitValueMaps objectForKeyedSubscript:v6];
  if (!v9)
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithKey:v6 bitValueMapsDirectory:v7];
    if (v9) {
      [(id)_allBitValueMaps setObject:v9 forKeyedSubscript:v6];
    }
  }
  objc_sync_exit(v8);

  return v9;
}

+ (void)removeBitValueMapForKey:(id)a3
{
  id v5 = a3;
  v3 = (void *)MEMORY[0x1E019F810]();
  id v4 = (id)_allBitValueMaps;
  objc_sync_enter(v4);
  [(id)_allBitValueMaps removeObjectForKey:v5];
  objc_sync_exit(v4);
}

+ (id)bitValueMapForKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E019F810]();
  id v8 = [NSString stringWithFormat:@"%@/%@.plist", v6, v5];
  v9 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v8];
  v10 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59___DPBitValueMap_bitValueMapForKey_fromConfigurationsFile___block_invoke;
  v14[3] = &unk_1E6C44900;
  id v15 = v10;
  id v11 = v10;
  [v9 enumerateObjectsUsingBlock:v14];
  v12 = (void *)[v11 copy];

  return v12;
}

- (id)bitValueForString:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(NSDictionary *)self->_map objectForKeyedSubscript:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = &unk_1F37A03B8;
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end