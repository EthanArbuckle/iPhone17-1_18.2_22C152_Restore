@interface NSArray(GEOFunctionalExtras)
- (id)_geo_compactMap:()GEOFunctionalExtras;
- (id)_geo_filtered:()GEOFunctionalExtras;
- (id)_geo_map:()GEOFunctionalExtras;
@end

@implementation NSArray(GEOFunctionalExtras)

- (id)_geo_compactMap:()GEOFunctionalExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)_geo_map:()GEOFunctionalExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)_geo_filtered:()GEOFunctionalExtras
{
  id v4 = a3;
  if ([a1 count])
  {
    v5 = (void *)MEMORY[0x1E4F28F60];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__NSArray_GEOFunctionalExtras___geo_filtered___block_invoke;
    v9[3] = &unk_1E53E16A0;
    id v10 = v4;
    id v6 = [v5 predicateWithBlock:v9];
    uint64_t v7 = [a1 filteredArrayUsingPredicate:v6];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

@end