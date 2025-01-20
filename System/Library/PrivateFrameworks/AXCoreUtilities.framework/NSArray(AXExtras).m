@interface NSArray(AXExtras)
- (BOOL)ax_containsObjectUsingBlock:()AXExtras;
- (id)ax_arrayByRemovingDuplicates;
- (id)ax_filteredArrayUsingBlock:()AXExtras;
- (id)ax_firstObjectUsingBlock:()AXExtras;
- (id)ax_flatMappedArrayUsingBlock:()AXExtras;
- (id)ax_mappedArrayUsingBlock:()AXExtras;
@end

@implementation NSArray(AXExtras)

- (id)ax_filteredArrayUsingBlock:()AXExtras
{
  v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  if (v2)
  {
    v3 = [a1 objectsAtIndexes:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)ax_mappedArrayUsingBlock:()AXExtras
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
          objc_msgSend(v6, "addObject:", v12, (void)v14);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)ax_firstObjectUsingBlock:()AXExtras
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)ax_containsObjectUsingBlock:()AXExtras
{
  v1 = objc_msgSend(a1, "ax_firstObjectUsingBlock:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)ax_flatMappedArrayUsingBlock:()AXExtras
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
          if (v12) {
            objc_msgSend(v6, "addObject:", v12, (void)v14);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)ax_arrayByRemovingDuplicates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 count];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10, (void)v13) & 1) == 0)
        {
          [v4 addObject:v10];
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v11 = (void *)[v3 copy];
  return v11;
}

@end