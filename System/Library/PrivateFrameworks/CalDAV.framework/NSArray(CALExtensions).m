@interface NSArray(CALExtensions)
- (BOOL)containsObjectIdenticalTo:()CALExtensions;
- (id)allObjectsWithClass:()CALExtensions;
@end

@implementation NSArray(CALExtensions)

- (BOOL)containsObjectIdenticalTo:()CALExtensions
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)allObjectsWithClass:()CALExtensions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

@end