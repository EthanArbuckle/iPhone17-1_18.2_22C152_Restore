@interface NSArray(AXExtensions)
+ (id)axArrayByIgnoringNilElementsWithCount:()AXExtensions;
+ (id)axArrayWithPossiblyNilArrays:()AXExtensions;
- (BOOL)axIsEqualToOrderedArray:()AXExtensions withPredicate:;
- (id)axFilterObjectsUsingBlock:()AXExtensions;
- (id)axFirstObjectsUsingBlock:()AXExtensions;
- (id)axMapObjectsUsingBlock:()AXExtensions;
- (id)axSafeObjectAtIndex:()AXExtensions;
- (id)axUniqueArrayWithPredicate:()AXExtensions;
@end

@implementation NSArray(AXExtensions)

+ (id)axArrayWithPossiblyNilArrays:()AXExtensions
{
  v14 = (id *)&a9;
  if (a3)
  {
    uint64_t v9 = a3;
    v10 = 0;
    do
    {
      v11 = v14++;
      id v12 = *v11;
      if ([v12 count])
      {
        if (!v10)
        {
          v10 = [MEMORY[0x1E4F1CA48] array];
        }
        [v10 addObjectsFromArray:v12];
      }

      --v9;
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)axArrayByIgnoringNilElementsWithCount:()AXExtensions
{
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (i = &a9; a3; --a3)
  {
    v11 = i++;
    if (*v11) {
      objc_msgSend(v10, "addObject:");
    }
  }
  return v10;
}

- (id)axUniqueArrayWithPredicate:()AXExtensions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = v4[2](v4, v12);
        if (v13 && (objc_msgSend(v5, "containsObject:", v13, (void)v15) & 1) == 0)
        {
          [v5 addObject:v13];
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)axIsEqualToOrderedArray:()AXExtensions withPredicate:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 count];
  uint64_t v9 = [v6 count];
  BOOL v10 = 0;
  if (v6 && v8 == v9)
  {
    if (v8)
    {
      BOOL v10 = 0;
      for (i = 0; i != v8; BOOL v10 = i >= v8)
      {
        uint64_t v12 = [a1 objectAtIndex:i];
        v13 = [v6 objectAtIndex:i];
        char v14 = v7[2](v7, v12, v13);

        if ((v14 & 1) == 0) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (id)axMapObjectsUsingBlock:()AXExtensions
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__NSArray_AXExtensions__axMapObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E5672DD8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateObjectsUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)[a1 copy];
  }

  return v8;
}

- (id)axFilterObjectsUsingBlock:()AXExtensions
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__NSArray_AXExtensions__axFilterObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E5672DD8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateObjectsUsingBlock:v10];
    id v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)[a1 copy];
  }

  return v8;
}

- (id)axFirstObjectsUsingBlock:()AXExtensions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    char v14 = __Block_byref_object_copy__0;
    long long v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__NSArray_AXExtensions__axFirstObjectsUsingBlock___block_invoke;
    v8[3] = &unk_1E5672E00;
    id v9 = v4;
    BOOL v10 = &v11;
    [a1 enumerateObjectsUsingBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = [a1 firstObject];
  }

  return v6;
}

- (id)axSafeObjectAtIndex:()AXExtensions
{
  if ([a1 count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [a1 objectAtIndex:a3];
  }
  return v5;
}

@end