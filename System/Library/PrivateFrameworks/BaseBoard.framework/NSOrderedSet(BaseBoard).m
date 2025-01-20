@interface NSOrderedSet(BaseBoard)
- (BOOL)bs_containsObjectPassingTest:()BaseBoard;
- (id)bs_array;
- (id)bs_compactMap:()BaseBoard;
- (id)bs_dictionaryByPartitioning:()BaseBoard;
- (id)bs_filter:()BaseBoard;
- (id)bs_firstObjectPassingTest:()BaseBoard;
- (id)bs_map:()BaseBoard;
- (id)bs_orderedSet;
- (id)bs_reduce:()BaseBoard block:;
- (id)bs_set;
@end

@implementation NSOrderedSet(BaseBoard)

- (id)bs_compactMap:()BaseBoard
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = BSCollectionCompactMap(v5, a1, v4);

  return v6;
}

- (BOOL)bs_containsObjectPassingTest:()BaseBoard
{
  v3 = BSCollectionFind(a1, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)bs_reduce:()BaseBoard block:
{
  BOOL v4 = BSCollectionReduce(a1, a3, a4);
  return v4;
}

- (id)bs_set
{
  v1 = [a1 set];
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)bs_array
{
  v1 = [a1 array];
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)bs_orderedSet
{
  v1 = (void *)[a1 copy];
  return v1;
}

- (id)bs_filter:()BaseBoard
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = BSCollectionFilter(v5, a1, v4);

  return v6;
}

- (id)bs_map:()BaseBoard
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = BSCollectionMap(v5, a1, v4);

  return v6;
}

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  v3 = BSCollectionFind(a1, a3);
  return v3;
}

- (id)bs_dictionaryByPartitioning:()BaseBoard
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = BSCollectionPartition(v5, a1, v4);

  return v6;
}

@end