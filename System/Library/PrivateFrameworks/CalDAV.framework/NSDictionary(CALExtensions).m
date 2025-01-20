@interface NSDictionary(CALExtensions)
- (void)mutableCopyWithElementsCopy;
@end

@implementation NSDictionary(CALExtensions)

- (void)mutableCopyWithElementsCopy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "allKeys", 0);
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
        v9 = [v2 objectForKey:v8];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 copy];

          [v2 setObject:v10 forKey:v8];
          v9 = (void *)v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end