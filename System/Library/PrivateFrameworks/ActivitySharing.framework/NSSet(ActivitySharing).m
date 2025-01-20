@interface NSSet(ActivitySharing)
- (id)as_autoreleasingCompactMap:()ActivitySharing;
@end

@implementation NSSet(ActivitySharing)

- (id)as_autoreleasingCompactMap:()ActivitySharing
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x223C37F60](v7);
          v13 = v4[2](v4, v11);
          if (v13) {
            objc_msgSend(v5, "addObject:", v13, (void)v15);
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v7;
      }
      while (v7);
    }
  }
  else
  {
    id v5 = (id)[a1 copy];
  }

  return v5;
}

@end