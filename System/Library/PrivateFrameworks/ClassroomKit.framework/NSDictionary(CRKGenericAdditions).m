@interface NSDictionary(CRKGenericAdditions)
- (id)crk_dictionaryByFilteringToKeys:()CRKGenericAdditions;
- (id)crk_mapToDictionary:()CRKGenericAdditions;
- (id)crk_mapUsingBlock:()CRKGenericAdditions;
@end

@implementation NSDictionary(CRKGenericAdditions)

- (id)crk_mapToDictionary:()CRKGenericAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke;
  v15[3] = &unk_2646F4A58;
  id v16 = v5;
  id v6 = v5;
  v7 = (void *)MEMORY[0x22A620AF0](v15);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke_2;
  v12[3] = &unk_2646F4A80;
  id v13 = v4;
  id v14 = v7;
  id v8 = v7;
  id v9 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  v10 = (void *)[v6 copy];

  return v10;
}

- (id)crk_mapUsingBlock:()CRKGenericAdditions
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDictionary+CRKAdditions.m", 54, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  id v6 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__NSDictionary_CRKGenericAdditions__crk_mapUsingBlock___block_invoke;
  v12[3] = &unk_2646F4AA8;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = (void *)[v8 copy];

  return v9;
}

- (id)crk_dictionaryByFilteringToKeys:()CRKGenericAdditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v15);
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[v5 copy];

  return v13;
}

@end