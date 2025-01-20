@interface NSArray(CalClassAdditions)
+ (id)arrayOfSetsBySplitting:()CalClassAdditions batchSize:;
- (BOOL)CalContainsObjectIdenticalTo:()CalClassAdditions;
- (id)CalFilter:()CalClassAdditions;
- (id)CalFirstObjectPassingTest:()CalClassAdditions;
- (id)CalFlatMap:()CalClassAdditions;
- (id)CalMap:()CalClassAdditions;
- (id)CalStringValueForKeyPaths:()CalClassAdditions;
- (id)CalStringValueForKeys:()CalClassAdditions;
- (id)CalStringValueForKeys:()CalClassAdditions keyPaths:;
- (id)CalTake:()CalClassAdditions;
- (id)_CalArrayOfValueForKeyPaths:()CalClassAdditions;
- (id)_CalArrayOfValueForKeys:()CalClassAdditions;
- (id)_CalStringForArrayOfValues:()CalClassAdditions;
- (id)allObjectsWithClass:()CalClassAdditions;
- (id)filteredArrayUsingTest:()CalClassAdditions;
- (void)CalMutableRecursiveCopy;
@end

@implementation NSArray(CalClassAdditions)

- (id)filteredArrayUsingTest:()CalClassAdditions
{
  v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (void)CalMutableRecursiveCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 CalMutableRecursiveCopy];
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 {
               && objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0DA0E0, (void)v12))
        }
        {
          uint64_t v9 = [v8 mutableCopy];
        }
        else
        {
          uint64_t v9 = objc_msgSend(v8, "copy", (void)v12);
        }
        v10 = (void *)v9;
        objc_msgSend(v2, "addObject:", v9, (void)v12);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)allObjectsWithClass:()CalClassAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (BOOL)CalContainsObjectIdenticalTo:()CalClassAdditions
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)arrayOfSetsBySplitting:()CalClassAdditions batchSize:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "count", (void)v16) >= a4)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA80] set];

          [v7 addObject:v14];
          uint64_t v6 = (void *)v14;
        }
        [v6 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_CalArrayOfValueForKeys:()CalClassAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        uint64_t v11 = objc_msgSend(a1, "valueForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_CalArrayOfValueForKeyPaths:()CalClassAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        uint64_t v11 = objc_msgSend(a1, "valueForKeyPath:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_CalStringForArrayOfValues:()CalClassAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = [v3 firstObject];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [MEMORY[0x1E4F28E78] string];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectAtIndexedSubscript:v7];
            [v8 appendFormat:@"%@,", v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      [v4 appendFormat:@"%@\n", v8];
      ++v7;
      long long v15 = [v9 firstObject];
      unint64_t v16 = [v15 count];
    }
    while (v16 > v7);
  }

  return v4;
}

- (id)CalStringValueForKeys:()CalClassAdditions
{
  v2 = objc_msgSend(a1, "_CalArrayOfValueForKeys:");
  id v3 = [a1 _CalStringForArrayOfValues:v2];

  return v3;
}

- (id)CalStringValueForKeyPaths:()CalClassAdditions
{
  v2 = objc_msgSend(a1, "_CalArrayOfValueForKeyPaths:");
  id v3 = [a1 _CalStringForArrayOfValues:v2];

  return v3;
}

- (id)CalStringValueForKeys:()CalClassAdditions keyPaths:
{
  id v6 = a4;
  unint64_t v7 = [a1 _CalArrayOfValueForKeys:a3];
  uint64_t v8 = [a1 _CalArrayOfValueForKeyPaths:v6];

  [v7 addObjectsFromArray:v8];
  id v9 = [a1 _CalStringForArrayOfValues:v7];

  return v9;
}

- (id)CalFirstObjectPassingTest:()CalClassAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NSArray_CalClassAdditions__CalFirstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E56CE540;
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = [a1 objectAtIndex:v6];
  }

  return v7;
}

- (id)CalFilter:()CalClassAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__NSArray_CalClassAdditions__CalFilter___block_invoke;
  v9[3] = &unk_1E56CE540;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 indexesOfObjectsPassingTest:v9];
  unint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (id)CalMap:()CalClassAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
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
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)CalFlatMap:()CalClassAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
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
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)CalTake:()CalClassAdditions
{
  if ([a1 count] >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

@end