@interface NSArray(ABSExtensions)
- (id)abs_arrayByMappingTransform:()ABSExtensions;
@end

@implementation NSArray(ABSExtensions)

- (id)abs_arrayByMappingTransform:()ABSExtensions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v14);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = (void *)[v5 copy];
  }
  else
  {
    v12 = (void *)[a1 copy];
  }

  return v12;
}

@end