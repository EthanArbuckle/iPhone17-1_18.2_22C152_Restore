@interface NSArray(BaseBoard)
- (BOOL)bs_containsObjectPassingTest:()BaseBoard;
- (id)bs_array;
- (id)bs_compactMap:()BaseBoard;
- (id)bs_dictionaryByPartitioning:()BaseBoard;
- (id)bs_differenceWithArray:()BaseBoard;
- (id)bs_filter:()BaseBoard;
- (id)bs_firstObjectOfClass:()BaseBoard;
- (id)bs_firstObjectPassingTest:()BaseBoard;
- (id)bs_flatten;
- (id)bs_flattenedDifferenceWithArray:()BaseBoard;
- (id)bs_map:()BaseBoard;
- (id)bs_mapNoNulls:()BaseBoard;
- (id)bs_objectsOfClass:()BaseBoard;
- (id)bs_reduce:()BaseBoard block:;
- (id)bs_reverse;
- (uint64_t)bs_first:()BaseBoard;
- (uint64_t)bs_firstObjectOfClassNamed:()BaseBoard;
- (uint64_t)bs_orderedSet;
- (uint64_t)bs_set;
- (void)bs_each:()BaseBoard;
- (void)bs_enumerateObjectsOfClass:()BaseBoard usingBlock:;
@end

@implementation NSArray(BaseBoard)

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  return BSCollectionFind(a1, a3);
}

- (id)bs_filter:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionFilter(v5, a1, a3);
}

- (BOOL)bs_containsObjectPassingTest:()BaseBoard
{
  v3 = BSCollectionFind(a1, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)bs_compactMap:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_map:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionMap(v5, a1, a3);
}

- (id)bs_objectsOfClass:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__NSArray_BaseBoard__bs_objectsOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v8[4] = a3;
  v6 = BSCollectionFilter(v5, a1, v8);
  return v6;
}

- (id)bs_dictionaryByPartitioning:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionPartition(v5, a1, a3);
}

- (id)bs_mapNoNulls:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_differenceWithArray:()BaseBoard
{
  BOOL v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1];
  [v4 removeObjectsInArray:a3];
  v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v5;
}

- (id)bs_reverse
{
  v1 = [a1 reverseObjectEnumerator];
  v2 = [v1 allObjects];

  return v2;
}

- (id)bs_reduce:()BaseBoard block:
{
  return BSCollectionReduce(a1, a3, a4);
}

- (uint64_t)bs_set
{
  return [MEMORY[0x1E4F1CAD0] setWithArray:a1];
}

- (id)bs_array
{
  v1 = (void *)[a1 copy];
  return v1;
}

- (void)bs_each:()BaseBoard
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = a1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (uint64_t)bs_orderedSet
{
  return [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a1];
}

- (void)bs_enumerateObjectsOfClass:()BaseBoard usingBlock:
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__NSArray_BaseBoard__bs_enumerateObjectsOfClass_usingBlock___block_invoke;
    v4[3] = &unk_1E5446DC8;
    v4[4] = a4;
    v4[5] = a3;
    return (void *)[result enumerateObjectsUsingBlock:v4];
  }
  return result;
}

- (uint64_t)bs_first:()BaseBoard
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (id)bs_firstObjectOfClass:()BaseBoard
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__NSArray_BaseBoard__bs_firstObjectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = BSCollectionFind(a1, v5);
  return v3;
}

- (uint64_t)bs_firstObjectOfClassNamed:()BaseBoard
{
  Class v4 = NSClassFromString(aClassName);
  return objc_msgSend(a1, "bs_firstObjectOfClass:", v4);
}

- (id)bs_flatten
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v8 = objc_msgSend(v7, "bs_flatten");
          [v2 addObjectsFromArray:v8];
        }
        else
        {
          objc_msgSend(v2, "addObject:", v7, (void)v10);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)bs_flattenedDifferenceWithArray:()BaseBoard
{
  uint64_t v4 = objc_msgSend(a1, "bs_flatten");
  uint64_t v5 = objc_msgSend(a3, "bs_flatten");
  unint64_t v6 = objc_msgSend(v4, "bs_differenceWithArray:", v5);

  return v6;
}

@end