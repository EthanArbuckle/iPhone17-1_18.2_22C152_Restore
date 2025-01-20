@interface CNStringRangeFinder
+ (id)rangesOfString:(id)a3 inString:(id)a4;
+ (id)rangesOfStrings:(id)a3 inString:(id)a4;
+ (void)removeOverlappingRanges:(id)a3;
@end

@implementation CNStringRangeFinder

+ (id)rangesOfStrings:(id)a3 inString:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
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
        v14 = objc_msgSend(a1, "rangesOfString:inString:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v8 sortUsingComparator:&__block_literal_global_67];
  [a1 removeOverlappingRanges:v8];

  return v8;
}

+ (id)rangesOfString:(id)a3 inString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    do
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, v11);
      [v7 addObject:v12];
      uint64_t v10 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, v10 + v11, objc_msgSend(v6, "length") - (v10 + v11));
      uint64_t v11 = v13;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v7;
}

+ (void)removeOverlappingRanges:(id)a3
{
  id v12 = a3;
  if ((unint64_t)[v12 count] >= 2)
  {
    v3 = [v12 objectAtIndex:0];
    uint64_t v4 = [v3 rangeValue];
    uint64_t v6 = v5;

    if ((unint64_t)[v12 count] >= 2)
    {
      unint64_t v7 = 1;
      do
      {
        uint64_t v8 = [v12 objectAtIndex:v7];
        unint64_t v9 = [v8 rangeValue];
        uint64_t v11 = v10;

        if (v9 >= v6 + v4)
        {
          ++v7;
          uint64_t v4 = v9;
          uint64_t v6 = v11;
        }
        else
        {
          [v12 removeObjectAtIndex:v7];
        }
      }
      while (v7 < [v12 count]);
    }
  }
}

@end