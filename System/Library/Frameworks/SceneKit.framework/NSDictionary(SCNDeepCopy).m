@interface NSDictionary(SCNDeepCopy)
- (void)SCNMutableDeepCopy;
@end

@implementation NSDictionary(SCNDeepCopy)

- (void)SCNMutableDeepCopy
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v1 = (void *)[a1 mutableCopy];
  v2 = (void *)[v1 allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v8 = (void *)[v1 objectForKey:v7];
        if (objc_opt_respondsToSelector())
        {
          v9 = (void *)[v8 SCNMutableDeepCopy];
          [v1 setValue:v9 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  return v1;
}

@end