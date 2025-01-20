@interface NSSet(AppleMediaServices)
+ (id)ams_JSONClasses;
+ (id)ams_PLISTClasses;
- (id)ams_filterUsingTest:()AppleMediaServices;
- (id)ams_firstObjectPassingTest:()AppleMediaServices;
- (id)ams_mapWithTransform:()AppleMediaServices;
- (id)ams_mapWithTransformIgnoresNil:()AppleMediaServices;
- (id)ams_nonEmptyComponentsJoinedByString:()AppleMediaServices;
- (uint64_t)ams_allWithTest:()AppleMediaServices;
- (uint64_t)ams_anyWithTest:()AppleMediaServices;
@end

@implementation NSSet(AppleMediaServices)

- (id)ams_filterUsingTest:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];

  return v12;
}

- (id)ams_firstObjectPassingTest:()AppleMediaServices
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

+ (id)ams_PLISTClasses
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);

  return v2;
}

- (uint64_t)ams_allWithTest:()AppleMediaServices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (uint64_t)ams_anyWithTest:()AppleMediaServices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)ams_JSONClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:5];
  v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);

  return v2;
}

- (id)ams_mapWithTransform:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        long long v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v11, (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];

  return v12;
}

- (id)ams_mapWithTransformIgnoresNil:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        long long v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];

  return v12;
}

- (id)ams_nonEmptyComponentsJoinedByString:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v6 = [a1 allObjects];
  if ([a1 count])
  {
    unint64_t v7 = 1;
    do
    {
      unint64_t v8 = v7 - 1;
      uint64_t v9 = [v6 objectAtIndexedSubscript:v7 - 1];
      if (__68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(v9))
      {
        uint64_t v10 = [v6 count] - 1;
        uint64_t v11 = [v6 count];
        if (v8 == v10
          || v8 == v11 - 2
          && ([v6 objectAtIndexedSubscript:v7],
              long long v12 = objc_claimAutoreleasedReturnValue(),
              BOOL v13 = __68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(v12),
              v12,
              !v13))
        {
          [v5 appendFormat:@"%@", v9, v17];
        }
        else
        {
          [v5 appendFormat:@"%@%@", v9, v4];
        }
      }
    }
    while (v7++ < [a1 count]);
  }
  long long v15 = [NSString stringWithString:v5];

  return v15;
}

@end