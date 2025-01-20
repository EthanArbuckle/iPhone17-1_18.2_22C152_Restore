@interface NSIndexSet(HKMenstrualCycles)
+ (id)hk_indexSetWithArray:()HKMenstrualCycles;
- (id)hk_indexSetSubtractingIndexes:()HKMenstrualCycles;
@end

@implementation NSIndexSet(HKMenstrualCycles)

+ (id)hk_indexSetWithArray:()HKMenstrualCycles
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue", (void)v12));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = (void *)[v4 copy];
  return v10;
}

- (id)hk_indexSetSubtractingIndexes:()HKMenstrualCycles
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeIndexes:v4];

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

@end