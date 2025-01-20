@interface NSArray(DC)
- (BOOL)dc_containsObjectPassingTest:()DC;
- (BOOL)dc_indexIsValid:()DC;
- (id)dc_arrayByGroupingIntoArraysWithMaxCount:()DC;
- (id)dc_compactMap:()DC;
- (id)dc_flatMap:()DC;
- (id)dc_map:()DC;
- (id)dc_objectAfter:()DC wrap:;
- (id)dc_objectBefore:()DC wrap:;
- (id)dc_objectPassingTest:()DC;
- (id)dc_objectsOfClass:()DC;
- (id)dc_objectsPassingTest:()DC;
- (uint64_t)dc_objectAfter:()DC;
- (uint64_t)dc_objectBefore:()DC;
- (unint64_t)dc_indexOfSortedObject:()DC insertionIndex:usingComparator:;
@end

@implementation NSArray(DC)

- (id)dc_objectPassingTest:()DC
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

- (BOOL)dc_containsObjectPassingTest:()DC
{
  v1 = objc_msgSend(a1, "dc_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)dc_objectsPassingTest:()DC
{
  BOOL v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)dc_objectsOfClass:()DC
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__NSArray_DC__dc_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "dc_objectsPassingTest:", v5);

  return v3;
}

- (id)dc_arrayByGroupingIntoArraysWithMaxCount:()DC
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
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
          v9 = (void *)v14;
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)dc_indexOfSortedObject:()DC insertionIndex:usingComparator:
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4) {
    *a4 = v10;
  }
  if (v10 >= [a1 count]
    || ([a1 objectAtIndexedSubscript:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) == 0))
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)dc_indexIsValid:()DC
{
  return a3 >= 1 && [a1 count] > (unint64_t)a3;
}

- (uint64_t)dc_objectBefore:()DC
{
  return objc_msgSend(a1, "dc_objectBefore:wrap:", a3, 0);
}

- (uint64_t)dc_objectAfter:()DC
{
  return objc_msgSend(a1, "dc_objectAfter:wrap:", a3, 0);
}

- (id)dc_objectBefore:()DC wrap:
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

- (id)dc_objectAfter:()DC wrap:
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

- (id)dc_compactMap:()DC
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  char v12 = __29__NSArray_DC__dc_compactMap___block_invoke;
  unint64_t v13 = &unk_2642AA6A8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  int v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)dc_map:()DC
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  char v12 = __22__NSArray_DC__dc_map___block_invoke;
  unint64_t v13 = &unk_2642AA6A8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  int v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)dc_flatMap:()DC
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  char v12 = __26__NSArray_DC__dc_flatMap___block_invoke;
  unint64_t v13 = &unk_2642AA6A8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  int v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end