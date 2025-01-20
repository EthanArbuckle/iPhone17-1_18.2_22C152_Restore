@interface NSSet(BaseBoard)
- (BOOL)bs_containsObjectPassingTest:()BaseBoard;
- (id)bs_compactMap:()BaseBoard;
- (id)bs_dictionaryByPartitioning:()BaseBoard;
- (id)bs_filter:()BaseBoard;
- (id)bs_firstObjectPassingTest:()BaseBoard;
- (id)bs_map:()BaseBoard;
- (id)bs_reduce:()BaseBoard block:;
- (id)bs_set;
- (uint64_t)bs_orderedSet;
- (void)bs_each:()BaseBoard;
@end

@implementation NSSet(BaseBoard)

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  return BSCollectionFind(a1, a3);
}

- (id)bs_filter:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionFilter(v5, a1, a3);
}

- (id)bs_map:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
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

- (id)bs_set
{
  v1 = (void *)[a1 copy];
  return v1;
}

- (uint64_t)bs_orderedSet
{
  return [MEMORY[0x1E4F1CAA0] orderedSetWithSet:a1];
}

- (id)bs_reduce:()BaseBoard block:
{
  return BSCollectionReduce(a1, a3, a4);
}

- (id)bs_dictionaryByPartitioning:()BaseBoard
{
  v5 = (objc_class *)objc_opt_class();
  return BSCollectionPartition(v5, a1, a3);
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

@end