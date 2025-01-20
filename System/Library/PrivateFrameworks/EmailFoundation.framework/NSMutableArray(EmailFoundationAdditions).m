@interface NSMutableArray(EmailFoundationAdditions)
- (BOOL)ef_addObjectIfAbsent:()EmailFoundationAdditions;
- (BOOL)ef_addObjectIfAbsentAccordingToEquals:()EmailFoundationAdditions;
- (id)ef_popElement;
- (id)ef_removeFirst;
- (uint64_t)ef_addObject:()EmailFoundationAdditions orPlaceholder:;
- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingComparator:allowDuplicates:;
- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortDescriptors:;
- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortFunction:context:allowDuplicates:;
- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingComparator:;
- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingSortFunction:context:;
- (unint64_t)ef_insertObjectIfAbsent:()EmailFoundationAdditions usingComparator:;
- (unint64_t)ef_trimToCount:()EmailFoundationAdditions fromStart:;
- (void)ef_addAbsentObjectsFromArrayAccordingToEquals:()EmailFoundationAdditions;
- (void)ef_addOptionalObject:()EmailFoundationAdditions;
- (void)ef_insertOptionalObject:()EmailFoundationAdditions atIndex:;
- (void)ef_moveObjectAtIndex:()EmailFoundationAdditions toIndex:;
- (void)ef_reverseObjects;
@end

@implementation NSMutableArray(EmailFoundationAdditions)

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortFunction:context:allowDuplicates:
{
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __102__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortFunction_context_allowDuplicates___block_invoke;
  v15 = &__block_descriptor_48_e11_q24__0_8_16l;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  id v8 = a3;
  v9 = _Block_copy(&v12);
  uint64_t v10 = objc_msgSend(a1, "ef_insertObject:usingComparator:allowDuplicates:", v8, v9, a6, v12, v13, v14, v15, v16, v17);

  return v10;
}

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingComparator:allowDuplicates:
{
  id v8 = a3;
  v9 = a4;
  unint64_t v10 = objc_msgSend(a1, "ef_indexWhereObjectWouldBeInserted:usingComparator:", v8, v9);
  uint64_t v11 = v10;
  if ((a5 & 1) != 0
    || !v10
    || v10 > [a1 count]
    || ([a1 objectAtIndex:v11 - 1],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = v9[2](v9, v12, v8),
        v12,
        v13))
  {
    [a1 insertObject:v8 atIndex:v11];
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (void)ef_addOptionalObject:()EmailFoundationAdditions
{
  id v4 = a3;
  if (v4) {
    [a1 addObject:v4];
  }
}

- (BOOL)ef_addObjectIfAbsent:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 indexOfObjectIdenticalTo:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    [a1 addObject:v4];
  }

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ef_addObjectIfAbsentAccordingToEquals:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    [a1 addObject:v4];
  }

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)ef_addObject:()EmailFoundationAdditions orPlaceholder:
{
  if (!a3) {
    a3 = a4;
  }
  return [a1 addObject:a3];
}

- (void)ef_moveObjectAtIndex:()EmailFoundationAdditions toIndex:
{
  objc_msgSend(a1, "objectAtIndex:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertObject:atIndex:");
  if (a4 > a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = a3 + 1;
  }
  [a1 removeObjectAtIndex:v7];
}

- (void)ef_addAbsentObjectsFromArrayAccordingToEquals:()EmailFoundationAdditions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
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
        objc_msgSend(a1, "ef_addObjectIfAbsentAccordingToEquals:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)ef_reverseObjects
{
  unint64_t v2 = [a1 count];
  uint64_t v3 = [a1 count];
  if (v2 >= 2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v2 >> 1;
    uint64_t v6 = v3 - 1;
    do
    {
      uint64_t v7 = [a1 objectAtIndexedSubscript:v4];
      long long v8 = [a1 objectAtIndexedSubscript:v6];
      [a1 setObject:v7 atIndexedSubscript:v6];
      [a1 setObject:v8 atIndexedSubscript:v4];

      ++v4;
      --v6;
    }
    while (v5 != v4);
  }
}

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortDescriptors:
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortDescriptors___block_invoke;
  aBlock[3] = &unk_1E6122548;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  long long v9 = _Block_copy(aBlock);
  uint64_t v10 = objc_msgSend(a1, "ef_insertObject:usingComparator:allowDuplicates:", v8, v9, 1);

  return v10;
}

- (unint64_t)ef_insertObjectIfAbsent:()EmailFoundationAdditions usingComparator:
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [a1 count];
  unint64_t v9 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v8, 1280, v7);
  if (v9 < v8
    && ([a1 objectAtIndexedSubscript:v9],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:v6],
        v10,
        (v11 & 1) != 0))
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    [a1 insertObject:v6 atIndex:v9];
  }

  return v9;
}

- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingComparator:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 removeObjectAtIndex:v8];
  }

  return v8;
}

- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingSortFunction:context:
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __86__NSMutableArray_EmailFoundationAdditions__ef_removeObject_usingSortFunction_context___block_invoke;
  id v13 = &__block_descriptor_48_e11_q24__0_8_16l;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  id v6 = a3;
  id v7 = _Block_copy(&v10);
  uint64_t v8 = objc_msgSend(a1, "ef_removeObject:usingComparator:", v6, v7, v10, v11, v12, v13, v14, v15);

  return v8;
}

- (void)ef_insertOptionalObject:()EmailFoundationAdditions atIndex:
{
  id v6 = a3;
  if (v6) {
    [a1 insertObject:v6 atIndex:a4];
  }
}

- (unint64_t)ef_trimToCount:()EmailFoundationAdditions fromStart:
{
  unint64_t result = [a1 count];
  if (result > a3)
  {
    if (a4) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = a3;
    }
    return objc_msgSend(a1, "removeObjectsInRange:", v8, result - a3);
  }
  return result;
}

- (id)ef_removeFirst
{
  if ([a1 count])
  {
    unint64_t v2 = [a1 objectAtIndex:0];
    [a1 removeObjectAtIndex:0];
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2;
}

- (id)ef_popElement
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    uint64_t v3 = [a1 objectAtIndex:v2 - 1];
    [a1 removeLastObject];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

@end