@interface NSArray(IRExtensions)
- (BOOL)containsObjectPassingTest:()IRExtensions;
- (id)allWhere:()IRExtensions;
- (id)arrayByAddingObject:()IRExtensions withCapacityLimit:;
- (id)compactMap:()IRExtensions;
- (id)firstWhere:()IRExtensions;
@end

@implementation NSArray(IRExtensions)

- (id)firstWhere:()IRExtensions
{
  return sequenceFirstWhere(a1, a3);
}

- (id)allWhere:()IRExtensions
{
  v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  if ([a1 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      v8 = [a1 objectAtIndexedSubscript:v7];
      if ((v4[2](v4, v8) & 1) == 0) {
        [v5 removeObjectAtIndex:v7 - v6++];
      }

      ++v7;
    }
    while (v7 < [a1 count]);
  }
  v9 = (void *)[v5 copy];

  return v9;
}

- (BOOL)containsObjectPassingTest:()IRExtensions
{
  v1 = objc_msgSend(a1, "firstWhere:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)arrayByAddingObject:()IRExtensions withCapacityLimit:
{
  id v6 = a3;
  if ([a1 count] >= a4)
  {
    id v7 = a1;
  }
  else
  {
    id v7 = [a1 arrayByAddingObject:v6];
  }
  v8 = v7;

  return v8;
}

- (id)compactMap:()IRExtensions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

@end