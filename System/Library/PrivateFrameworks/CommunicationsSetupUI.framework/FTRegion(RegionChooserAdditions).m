@interface FTRegion(RegionChooserAdditions)
- (BOOL)isLeafNode;
- (uint64_t)search:()RegionChooserAdditions withResults:;
@end

@implementation FTRegion(RegionChooserAdditions)

- (BOOL)isLeafNode
{
  v2 = [a1 subRegions];
  if (v2)
  {
    v3 = [a1 subRegions];
    BOOL v4 = [v3 count] == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (uint64_t)search:()RegionChooserAdditions withResults:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    if ([a1 isLeafNode])
    {
      v8 = [a1 label];
      v9 = v8;
      if (v8
        && [v8 length]
        && (uint64_t v10 = [v9 length],
            [a1 label],
            v11 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = objc_msgSend(v11, "rangeOfString:options:range:locale:", v6, 1, 0, v10, 0),
            v11,
            v12 != 0x7FFFFFFFFFFFFFFFLL))
      {
        [v7 addObject:a1];
        LOBYTE(v13) = 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v14 = objc_msgSend(a1, "subRegions", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        int v13 = 0;
        uint64_t v17 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v21 != v17) {
              objc_enumerationMutation(v14);
            }
            v13 |= [*(id *)(*((void *)&v20 + 1) + 8 * i) search:v6 withResults:v7];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v16);
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

@end