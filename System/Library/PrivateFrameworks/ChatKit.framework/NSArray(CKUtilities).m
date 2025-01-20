@interface NSArray(CKUtilities)
- (id)__ck_indexSetForIndexPathItemsInSection:()CKUtilities;
- (id)__ck_indexSetForIndexPathRowsInSection:()CKUtilities;
- (id)__ck_shuffledArray;
@end

@implementation NSArray(CKUtilities)

- (id)__ck_indexSetForIndexPathRowsInSection:()CKUtilities
{
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NSArray_CKUtilities____ck_indexSetForIndexPathRowsInSection___block_invoke;
  v8[3] = &unk_1E5624090;
  uint64_t v10 = a3;
  id v6 = v5;
  id v9 = v6;
  [a1 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (id)__ck_indexSetForIndexPathItemsInSection:()CKUtilities
{
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__NSArray_CKUtilities____ck_indexSetForIndexPathItemsInSection___block_invoke;
  v8[3] = &unk_1E5624090;
  uint64_t v10 = a3;
  id v6 = v5;
  id v9 = v6;
  [a1 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (id)__ck_shuffledArray
{
  v1 = (void *)[a1 mutableCopy];
  v2 = [MEMORY[0x1E4F1CA48] array];
  while ([v1 count])
  {
    unint64_t v3 = arc4random();
    unint64_t v4 = v3 % [v1 count];
    v5 = [v1 objectAtIndexedSubscript:v4];
    [v2 addObject:v5];
    [v1 removeObjectAtIndex:v4];
  }
  id v6 = (void *)[v2 copy];

  return v6;
}

@end