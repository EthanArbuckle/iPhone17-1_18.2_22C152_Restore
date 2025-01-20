@interface NSDictionary(SCNExtensions)
- (unint64_t)SCN_safeHash;
@end

@implementation NSDictionary(SCNExtensions)

- (unint64_t)SCN_safeHash
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = (void *)[a1 allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= (v5 << 6) + 2654435769u + (v5 >> 2) + [*(id *)(*((void *)&v18 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = objc_msgSend(a1, "allValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v5 ^= (v5 << 6) + 2654435769u + (v5 >> 2) + [*(id *)(*((void *)&v14 + 1) + 8 * j) hash];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
  return v5;
}

@end