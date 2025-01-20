@interface NSOrderedSet(IntentsFoundation)
- (id)if_compactMap:()IntentsFoundation;
- (id)if_map:()IntentsFoundation;
- (id)if_orderedSetByAddingObject:()IntentsFoundation;
- (id)if_orderedSetByAddingObjectsFromArray:()IntentsFoundation;
- (id)if_orderedSetByAddingObjectsFromOrderedSet:()IntentsFoundation;
@end

@implementation NSOrderedSet(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  return _IFOrderedSetTransform(a1, a3);
}

- (id)if_map:()IntentsFoundation
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__NSOrderedSet_IntentsFoundation__if_map___block_invoke;
  v8[3] = &unk_1E6CA0C38;
  id v9 = v4;
  id v5 = v4;
  v6 = _IFOrderedSetTransform(a1, (uint64_t)v8);

  return v6;
}

- (id)if_orderedSetByAddingObject:()IntentsFoundation
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 addObject:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

- (id)if_orderedSetByAddingObjectsFromArray:()IntentsFoundation
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 addObjectsFromArray:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

- (id)if_orderedSetByAddingObjectsFromOrderedSet:()IntentsFoundation
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 unionOrderedSet:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

@end