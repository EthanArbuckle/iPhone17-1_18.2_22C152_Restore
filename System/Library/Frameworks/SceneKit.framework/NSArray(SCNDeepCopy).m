@interface NSArray(SCNDeepCopy)
- (void)SCNMutableDeepCopy;
@end

@implementation NSArray(SCNDeepCopy)

- (void)SCNMutableDeepCopy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a1);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          v10 = (void *)[v9 SCNMutableDeepCopy];
          [v2 replaceObjectAtIndex:v8 + v7 withObject:v10];
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      int v5 = v8 + v7;
    }
    while (v4);
  }
  return v2;
}

@end