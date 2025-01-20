@interface NSCountedSet(EmailFoundationAdditions)
- (id)ef_leastCommonObjects;
- (id)ef_mostCommonObjects;
@end

@implementation NSCountedSet(EmailFoundationAdditions)

- (id)ef_mostCommonObjects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v3, "countForObject:", v8, (void)v12);
        unint64_t v10 = v9;
        if (v9 <= v5)
        {
          if (v9 == v5) {
            [v2 addObject:v8];
          }
        }
        else
        {
          [v2 removeAllObjects];
          [v2 addObject:v8];
          unint64_t v5 = v10;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)ef_leastCommonObjects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    unint64_t v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v3, "countForObject:", v8, (void)v12);
        unint64_t v10 = v9;
        if (v9 >= v6)
        {
          if (v9 == v6) {
            [v2 addObject:v8];
          }
        }
        else
        {
          [v2 removeAllObjects];
          [v2 addObject:v8];
          unint64_t v6 = v10;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return v2;
}

@end