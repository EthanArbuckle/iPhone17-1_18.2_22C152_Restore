@interface PHEntityKeyMap
+ (id)transposePropertyKeysByEntityKey:(id)a3;
+ (void)assertPropertyKey:(id)a3 doesNotExistForEntityKey:(id)a4 inEntityKeysByProperty:(id)a5;
- (PHEntityKeyMap)initWithPropertyKeysByEntityKey:(id)a3;
- (id)entityKeyForPropertyKey:(id)a3;
- (id)propertyKeyForEntityKey:(id)a3;
@end

@implementation PHEntityKeyMap

void __51__PHEntityKeyMap_transposePropertyKeysByEntityKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [*(id *)(a1 + 40) assertPropertyKey:v11 doesNotExistForEntityKey:v5 inEntityKeysByProperty:*(void *)(a1 + 32)];
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (void)assertPropertyKey:(id)a3 doesNotExistForEntityKey:(id)a4 inEntityKeysByProperty:(id)a5
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 objectForKeyedSubscript:v11];
  if (v9)
  {
    v12[0] = @"existingEntityKey";
    v12[1] = @"entityKey";
    v13[0] = v9;
    v13[1] = v7;
    v12[2] = @"propertyKey";
    v13[2] = v11;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Duplicate property key" userInfo:objc_claimAutoreleasedReturnValue()];
    objc_exception_throw(v10);
  }
}

- (id)entityKeyForPropertyKey:(id)a3
{
  return [(NSDictionary *)self->_entityKeysByPropertyKey objectForKeyedSubscript:a3];
}

- (PHEntityKeyMap)initWithPropertyKeysByEntityKey:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHEntityKeyMap;
  id v5 = [(PHEntityKeyMap *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    propertyKeysByEntityKey = v5->_propertyKeysByEntityKey;
    v5->_propertyKeysByEntityKey = (NSDictionary *)v6;

    uint64_t v8 = [(id)objc_opt_class() transposePropertyKeysByEntityKey:v5->_propertyKeysByEntityKey];
    entityKeysByPropertyKey = v5->_entityKeysByPropertyKey;
    v5->_entityKeysByPropertyKey = (NSDictionary *)v8;

    id v10 = v5;
  }

  return v5;
}

+ (id)transposePropertyKeysByEntityKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PHEntityKeyMap_transposePropertyKeysByEntityKey___block_invoke;
  v9[3] = &unk_1E5842CE8;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityKeysByPropertyKey, 0);

  objc_storeStrong((id *)&self->_propertyKeysByEntityKey, 0);
}

- (id)propertyKeyForEntityKey:(id)a3
{
  v3 = [(NSDictionary *)self->_propertyKeysByEntityKey objectForKeyedSubscript:a3];
  id v4 = [v3 firstObject];

  return v4;
}

@end