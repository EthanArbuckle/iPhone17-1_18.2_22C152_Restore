@interface NSMutableArray(DBAdditions)
- (uint64_t)db_removeFirstObjectIfMatching:()DBAdditions;
- (uint64_t)db_removeFirstObjectsIfMatching:()DBAdditions;
- (void)db_mutatingMap:()DBAdditions;
@end

@implementation NSMutableArray(DBAdditions)

- (void)db_mutatingMap:()DBAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__NSMutableArray_DBAdditions__db_mutatingMap___block_invoke;
  v6[3] = &unk_2649B5438;
  v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v6];
}

- (uint64_t)db_removeFirstObjectIfMatching:()DBAdditions
{
  id v4 = a3;
  id v5 = [a1 firstObject];
  uint64_t v6 = [v5 isEqual:v4];

  if (v6) {
    [a1 removeObjectAtIndex:0];
  }
  return v6;
}

- (uint64_t)db_removeFirstObjectsIfMatching:()DBAdditions
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 <= [a1 count]
    && (uint64_t v6 = [v4 count],
        objc_msgSend(a1, "subarrayWithRange:", 0, v6),
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToArray:v4],
        v7,
        v8))
  {
    objc_msgSend(a1, "removeObjectsInRange:", 0, v6);
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end