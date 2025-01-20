@interface NSSet(ARAdditions)
- (id)ar_filter:()ARAdditions;
- (id)ar_map:()ARAdditions;
@end

@implementation NSSet(ARAdditions)

- (id)ar_map:()ARAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
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
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)ar_filter:()ARAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

@end