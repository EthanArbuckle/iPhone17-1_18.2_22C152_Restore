@interface NSArray(DESExtensions)
- (id)_fides_objectByReplacingValue:()DESExtensions withValue:;
- (id)_fides_shuffledArray;
@end

@implementation NSArray(DESExtensions)

- (id)_fides_shuffledArray
{
  if ([a1 count])
  {
    v2 = (void *)[a1 mutableCopy];
    uint64_t v3 = [v2 count];
    uint64_t v4 = v3 - 1;
    if (v3 != 1)
    {
      do
      {
        [v2 exchangeObjectAtIndex:v4 withObjectAtIndex:arc4random_uniform(v4 + 1)];
        --v4;
      }
      while (v4);
    }
    v5 = (void *)[v2 copy];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C978] array];
  }

  return v5;
}

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_fides_objectByReplacingValue:withValue:", v6, v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

@end