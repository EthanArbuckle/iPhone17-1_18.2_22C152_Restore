@interface NSArray(AppleMediaServices)
+ (id)ams_arrayWithItem:()AppleMediaServices count:;
+ (void)ams_enumerateObjectsForArrays:()AppleMediaServices usingBlock:;
- (BOOL)ams_allWithOptions:()AppleMediaServices test:;
- (BOOL)ams_anyWithOptions:()AppleMediaServices test:;
- (id)ams_arrayByRemovingObjectsFromArray:()AppleMediaServices;
- (id)ams_dictionaryUsingTransform:()AppleMediaServices;
- (id)ams_filterUsingTest:()AppleMediaServices;
- (id)ams_firstObjectPassingTest:()AppleMediaServices;
- (id)ams_invertedDictionaryUsingTransform:()AppleMediaServices;
- (id)ams_invertedDictionaryUsingTransformIgnoresNil:()AppleMediaServices;
- (id)ams_mapWithTransform:()AppleMediaServices;
- (id)ams_mapWithTransformIgnoresNil:()AppleMediaServices;
- (id)ams_nonEmptyComponentsJoinedByString:()AppleMediaServices;
- (id)ams_objectAtIndex:()AppleMediaServices;
- (id)ams_reduceWithInitialResult:()AppleMediaServices updateAccumulatingResult:;
- (id)hashedDescription;
- (uint64_t)ams_allWithTest:()AppleMediaServices;
- (uint64_t)ams_anyWithTest:()AppleMediaServices;
- (uint64_t)ams_concurrentAllWithTest:()AppleMediaServices;
- (uint64_t)ams_concurrentAnyWithTest:()AppleMediaServices;
- (uint64_t)ams_sanitizedForSecureCoding;
@end

@implementation NSArray(AppleMediaServices)

- (id)ams_mapWithTransform:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
        objc_msgSend(v5, "addObject:", v11, (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)ams_filterUsingTest:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)ams_nonEmptyComponentsJoinedByString:()AppleMediaServices
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([a1 count])
  {
    unint64_t v6 = 1;
    do
    {
      unint64_t v7 = v6 - 1;
      uint64_t v8 = [a1 objectAtIndexedSubscript:v6 - 1];
      if (__68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(v8))
      {
        uint64_t v9 = [a1 count] - 1;
        uint64_t v10 = [a1 count];
        if (v7 == v9
          || v7 == v10 - 2
          && ([a1 objectAtIndexedSubscript:v6],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              BOOL v12 = __68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(v11),
              v11,
              !v12))
        {
          [v5 appendFormat:@"%@", v8, v16];
        }
        else
        {
          [v5 appendFormat:@"%@%@", v8, v4];
        }
      }
    }
    while (v6++ < [a1 count]);
  }
  long long v14 = (void *)[v5 copy];

  return v14;
}

- (id)ams_firstObjectPassingTest:()AppleMediaServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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

- (id)hashedDescription
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p>", objc_opt_class(), a1];
  [v2 appendString:@" {\n"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        uint64_t v8 = AMSHashIfNeeded(*(void **)(*((void *)&v10 + 1) + 8 * i));
        [v2 appendFormat:@"  %@\n", v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [v2 appendString:@"}"];
  return v2;
}

- (id)ams_mapWithTransformIgnoresNil:()AppleMediaServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (id)ams_dictionaryUsingTransform:()AppleMediaServices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = v4[2](v4, v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v13 = (void *)[v5 copy];
  return v13;
}

+ (id)ams_arrayWithItem:()AppleMediaServices count:
{
  id v5 = a3;
  if (a4)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    do
    {
      [v6 addObject:v5];
      --a4;
    }
    while (a4);
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return v7;
}

- (uint64_t)ams_sanitizedForSecureCoding
{
  return objc_msgSend(a1, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_144);
}

- (BOOL)ams_allWithOptions:()AppleMediaServices test:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (unsigned int (**)(void, void))v6;
  if (a3)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__NSArray_AppleMediaServices__ams_allWithOptions_test___block_invoke;
    v14[3] = &unk_1E55A8788;
    id v15 = v6;
    long long v16 = &v17;
    [a1 enumerateObjectsWithOptions:a3 usingBlock:v14];
    BOOL v8 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = a1;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          if (!v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * v12)))
          {
            BOOL v8 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 1;
LABEL_13:
  }
  return v8;
}

- (uint64_t)ams_allWithTest:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_allWithOptions:test:", 0, a3);
}

- (BOOL)ams_anyWithOptions:()AppleMediaServices test:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (uint64_t (**)(void, void))v6;
  if (a3)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__NSArray_AppleMediaServices__ams_anyWithOptions_test___block_invoke;
    v14[3] = &unk_1E55A8788;
    id v15 = v6;
    long long v16 = &v17;
    [a1 enumerateObjectsWithOptions:a3 usingBlock:v14];
    BOOL v8 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = a1;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          if (v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * v12)))
          {

            BOOL v8 = 1;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (uint64_t)ams_anyWithTest:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_anyWithOptions:test:", 0, a3);
}

- (id)ams_arrayByRemovingObjectsFromArray:()AppleMediaServices
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)[a1 mutableCopy];
    [v5 removeObjectsInArray:v4];
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (uint64_t)ams_concurrentAllWithTest:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_allWithOptions:test:", 1, a3);
}

- (uint64_t)ams_concurrentAnyWithTest:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_anyWithOptions:test:", 1, a3);
}

+ (void)ams_enumerateObjectsForArrays:()AppleMediaServices usingBlock:
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke;
  v7[3] = &unk_1E55A87D8;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

- (id)ams_invertedDictionaryUsingTransform:()AppleMediaServices
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__NSArray_AppleMediaServices__ams_invertedDictionaryUsingTransform___block_invoke;
  v8[3] = &unk_1E55A8800;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "ams_invertedDictionaryUsingTransformIgnoresNil:", v8);

  return v6;
}

- (id)ams_invertedDictionaryUsingTransformIgnoresNil:()AppleMediaServices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = v4[2](v4, v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11, (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v13 = (void *)[v5 copy];
  return v13;
}

- (id)ams_objectAtIndex:()AppleMediaServices
{
  if ((a3 & 0x8000000000000000) != 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([a1 count] <= a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [a1 objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)ams_reduceWithInitialResult:()AppleMediaServices updateAccumulatingResult:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    uint64_t v11 = v8;
    do
    {
      uint64_t v14 = 0;
      long long v15 = v11;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = v7[2](v7, v15, *(void *)(*((void *)&v17 + 1) + 8 * v14));

        ++v14;
        long long v15 = v11;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v11;
}

@end