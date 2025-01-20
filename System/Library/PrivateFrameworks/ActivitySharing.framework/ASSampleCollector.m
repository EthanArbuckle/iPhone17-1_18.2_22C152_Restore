@interface ASSampleCollector
+ (id)sampleDictionaryByIndex:(id)a3 sampleIndexBlock:(id)a4;
@end

@implementation ASSampleCollector

+ (id)sampleDictionaryByIndex:(id)a3 sampleIndexBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (uint64_t (**)(id, void))a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [MEMORY[0x263EFFA08] setWithArray:v5];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = v6[2](v6, v11);
        v13 = [NSNumber numberWithLongLong:v12];
        v14 = [v7 objectForKeyedSubscript:v13];
        v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [MEMORY[0x263EFFA08] set];
        }
        v17 = v16;

        v18 = [v17 setByAddingObject:v11];

        v19 = [NSNumber numberWithLongLong:v12];
        [v7 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
  v20 = [NSDictionary dictionaryWithDictionary:v7];

  return v20;
}

@end