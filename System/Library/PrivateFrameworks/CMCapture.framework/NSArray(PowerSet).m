@interface NSArray(PowerSet)
- (uint64_t)powerSet;
@end

@implementation NSArray(PowerSet)

- (uint64_t)powerSet
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = [a1 lastObject];
    v5 = objc_msgSend((id)objc_msgSend(a1, "subarrayWithRange:", 0, v3 - 1), "powerSet");
    v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "arrayByAddingObject:", v4));
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    return [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v13 = [MEMORY[0x1E4F1C978] array];
    return [v12 arrayWithObject:v13];
  }
}

@end