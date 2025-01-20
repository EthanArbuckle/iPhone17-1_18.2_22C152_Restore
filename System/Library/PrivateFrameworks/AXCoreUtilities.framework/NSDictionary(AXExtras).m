@interface NSDictionary(AXExtras)
- (id)ax_deepMutableCopy;
@end

@implementation NSDictionary(AXExtras)

- (id)ax_deepMutableCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(v1, "allKeys", 0);
  v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v1 objectForKeyedSubscript:v8];
        if (objc_opt_respondsToSelector())
        {
          v10 = (void *)[v9 copyWithZone:0];
          [v1 setObject:v10 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v1;
}

@end