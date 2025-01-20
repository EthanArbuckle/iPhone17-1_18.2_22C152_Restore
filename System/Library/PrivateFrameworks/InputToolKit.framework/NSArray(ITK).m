@interface NSArray(ITK)
+ (id)itk_arrayFromNonNilObject:()ITK;
+ (void)heapsAlgorithm:()ITK k:result:;
- (BOOL)itk_containsObjectPassingTest:()ITK;
- (BOOL)itk_indexIsValid:()ITK;
- (id)itk_arrayByAddingNonNilObject:()ITK;
- (id)itk_arrayByAddingObjectsFromNonNilArray:()ITK;
- (id)itk_arrayByGroupingIntoArraysWithMaxCount:()ITK;
- (id)itk_arrayFromReplacingObject:()ITK withObject:;
- (id)itk_compactMap:()ITK;
- (id)itk_firstObjectOfClass:()ITK;
- (id)itk_flatMap:()ITK;
- (id)itk_generateAllPermutations;
- (id)itk_map:()ITK;
- (id)itk_objectAfter:()ITK wrap:;
- (id)itk_objectBefore:()ITK wrap:;
- (id)itk_objectPassingTest:()ITK;
- (id)itk_objectsConformingToProtocol:()ITK;
- (id)itk_objectsOfClass:()ITK;
- (id)itk_objectsPassingTest:()ITK;
- (id)itk_randomObject;
- (id)itk_randomizedArray;
- (id)itk_safeObjectAtIndex:()ITK;
- (uint64_t)itk_countOfObjectsPassingTest:()ITK;
- (uint64_t)itk_objectAfter:()ITK;
- (uint64_t)itk_objectBefore:()ITK;
- (unint64_t)itk_indexOfSortedObject:()ITK insertionIndex:usingComparator:;
@end

@implementation NSArray(ITK)

+ (id)itk_arrayFromNonNilObject:()ITK
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v7[0] = a3;
    v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = a3;
    v5 = [v3 arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)itk_randomObject
{
  v2 = (void *)[a1 count];
  if (v2)
  {
    v2 = objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
  }

  return v2;
}

- (id)itk_randomizedArray
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "itk_randomize");
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)itk_generateAllPermutations
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = (void *)[a1 mutableCopy];
  objc_msgSend((id)objc_opt_class(), "heapsAlgorithm:k:result:", v3, objc_msgSend(v3, "count"), v2);
  id v4 = (void *)[v2 copy];

  return v4;
}

+ (void)heapsAlgorithm:()ITK k:result:
{
  id v12 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    v9 = (void *)[v12 copy];
    [v8 addObject:v9];
  }
  else if (a4 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      [a1 heapsAlgorithm:v12 k:a4 - 1 result:v8];
      if (a4) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v10;
      }
      [v12 exchangeObjectAtIndex:v11 withObjectAtIndex:a4 - 1];
      ++v10;
    }
    while (a4 != v10);
  }
}

- (id)itk_objectPassingTest:()ITK
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 objectAtIndex:v2];
  }

  return v3;
}

- (uint64_t)itk_countOfObjectsPassingTest:()ITK
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v5);
      }
      v9 += v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v11), v8 + v11, &v17);
      if (v17) {
        break;
      }
      if (v7 == ++v11)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        v8 += v11;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)itk_arrayFromReplacingObject:()ITK withObject:
{
  id v6 = a4;
  id v7 = a1;
  uint64_t v8 = [v7 indexOfObject:a3];
  if (v6)
  {
    uint64_t v9 = v8;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)[v7 mutableCopy];
      [v10 replaceObjectAtIndex:v9 withObject:v6];
      uint64_t v11 = [v10 copy];

      id v7 = (id)v11;
    }
  }
  else
  {
    +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ITKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "newObject", "-[NSArray(ITK) itk_arrayFromReplacingObject:withObject:]", 0, 0, @"itk_arrayFromReplacingObject, Trying to replace an object with nil.");
  }

  return v7;
}

- (BOOL)itk_containsObjectPassingTest:()ITK
{
  v1 = objc_msgSend(a1, "itk_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)itk_objectsPassingTest:()ITK
{
  BOOL v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)itk_objectsOfClass:()ITK
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__NSArray_ITK__itk_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "itk_objectsPassingTest:", v5);

  return v3;
}

- (id)itk_firstObjectOfClass:()ITK
{
  v1 = objc_msgSend(a1, "itk_objectsOfClass:");
  BOOL v2 = [v1 firstObject];

  return v2;
}

- (id)itk_safeObjectAtIndex:()ITK
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

- (id)itk_objectsConformingToProtocol:()ITK
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NSArray_ITK__itk_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_26538D018;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "itk_objectsPassingTest:", v8);

  return v6;
}

- (id)itk_arrayByGroupingIntoArraysWithMaxCount:()ITK
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend(v9, "count", (void)v16);
        if (!v9 || v13 >= a3)
        {
          uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];

          [v5 addObject:v14];
          id v9 = (void *)v14;
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v5;
}

- (unint64_t)itk_indexOfSortedObject:()ITK insertionIndex:usingComparator:
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4) {
    *a4 = v10;
  }
  if (v10 >= [a1 count]
    || ([a1 objectAtIndexedSubscript:v10],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) == 0))
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)itk_indexIsValid:()ITK
{
  return (a3 & 0x8000000000000000) == 0 && [a1 count] > a3;
}

- (uint64_t)itk_objectBefore:()ITK
{
  return objc_msgSend(a1, "itk_objectBefore:wrap:", a3, 0);
}

- (uint64_t)itk_objectAfter:()ITK
{
  return objc_msgSend(a1, "itk_objectAfter:wrap:", a3, 0);
}

- (id)itk_objectBefore:()ITK wrap:
{
  uint64_t v6 = objc_msgSend(a1, "indexOfObject:");
  uint64_t v7 = 0;
  if (v6) {
    int v8 = 1;
  }
  else {
    int v8 = a4;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    uint64_t v7 = objc_msgSend(a1, "objectAtIndexedSubscript:", (v6 + objc_msgSend(a1, "count") - 1) % (unint64_t)objc_msgSend(a1, "count"));
  }

  return v7;
}

- (id)itk_objectAfter:()ITK wrap:
{
  uint64_t v6 = objc_msgSend(a1, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v7 = v6, (a4 & 1) == 0) && v6 == [a1 count] - 1)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = objc_msgSend(a1, "objectAtIndexedSubscript:", (v7 + 1) % (unint64_t)objc_msgSend(a1, "count"));
  }

  return v8;
}

- (id)itk_arrayByAddingNonNilObject:()ITK
{
  id v4 = a1;
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = [v4 arrayByAddingObject:a3];

    id v5 = (void *)v6;
  }

  return v5;
}

- (id)itk_arrayByAddingObjectsFromNonNilArray:()ITK
{
  id v4 = a1;
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:a3];

    id v5 = (void *)v6;
  }

  return v5;
}

- (id)itk_compactMap:()ITK
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    uint64_t v6 = [a1 firstObject];
    v4[2](v4, v6, 0, 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v16[0] = v7;
      int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    }
    else
    {
      int v8 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    uint64_t v9 = v5;
    unint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __31__NSArray_ITK__itk_compactMap___block_invoke;
    v12[3] = &unk_26538D040;
    uint64_t v14 = v4;
    uint64_t v15 = v9;
    id v13 = v10;
    id v7 = v10;
    [a1 enumerateObjectsUsingBlock:v12];
    int v8 = (void *)[v7 copy];
  }

  return v8;
}

- (id)itk_map:()ITK
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    id v6 = [a1 firstObject];
    id v7 = v4[2](v4, v6, 0, 1);
    v16[0] = v7;
    int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  }
  else
  {
    uint64_t v9 = v5;
    unint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __24__NSArray_ITK__itk_map___block_invoke;
    v12[3] = &unk_26538D040;
    uint64_t v14 = v4;
    uint64_t v15 = v9;
    id v13 = v10;
    id v6 = v10;
    [a1 enumerateObjectsUsingBlock:v12];
    int v8 = (void *)[v6 copy];

    id v7 = v14;
  }

  return v8;
}

- (id)itk_flatMap:()ITK
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    id v6 = [a1 firstObject];
    id v7 = v4[2](v4, v6, 0, 1);
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __28__NSArray_ITK__itk_flatMap___block_invoke;
    v11[3] = &unk_26538D040;
    id v13 = v4;
    uint64_t v14 = v8;
    id v12 = v9;
    id v6 = v9;
    [a1 enumerateObjectsUsingBlock:v11];
    id v7 = (void *)[v6 copy];
  }

  return v7;
}

@end