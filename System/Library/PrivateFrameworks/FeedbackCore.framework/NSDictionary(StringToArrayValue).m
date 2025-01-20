@interface NSDictionary(StringToArrayValue)
- (id)transformValueToArray;
@end

@implementation NSDictionary(StringToArrayValue)

- (id)transformValueToArray
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = [a1 objectForKeyedSubscript:v8];
        v17 = v9;
        v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
        [v2 setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }

  v11 = [NSDictionary dictionaryWithDictionary:v2];

  return v11;
}

@end