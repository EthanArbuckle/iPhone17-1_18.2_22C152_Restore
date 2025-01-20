@interface NSMutableOrderedSet(EmailFoundationAdditions)
- (id)ef_uniquedObject:()EmailFoundationAdditions;
- (void)ef_insertObject:()EmailFoundationAdditions usingComparator:;
- (void)ef_insertObjects:()EmailFoundationAdditions after:;
- (void)ef_insertObjects:()EmailFoundationAdditions before:;
- (void)ef_removeObjectsInArray:()EmailFoundationAdditions;
@end

@implementation NSMutableOrderedSet(EmailFoundationAdditions)

- (void)ef_insertObjects:()EmailFoundationAdditions before:
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 indexOfObject:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [a1 addObjectsFromArray:v9];
  }
  else
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v7, objc_msgSend(v9, "count"));
    [a1 insertObjects:v9 atIndexes:v8];
  }
}

- (id)ef_uniquedObject:()EmailFoundationAdditions
{
  id v4 = a3;
  v5 = [a1 set];
  id v6 = [v5 member:v4];

  if (!v6)
  {
    id v6 = (void *)[v4 copyWithZone:0];
    [a1 addObject:v6];
  }

  return v6;
}

- (void)ef_removeObjectsInArray:()EmailFoundationAdditions
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
        objc_msgSend(a1, "removeObject:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)ef_insertObjects:()EmailFoundationAdditions after:
{
  id v11 = a3;
  uint64_t v6 = [a1 indexOfObject:a4];
  id v7 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v8 = [v11 count];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v6 + 1;
  }
  long long v10 = objc_msgSend(v7, "initWithIndexesInRange:", v9, v8);
  [a1 insertObjects:v11 atIndexes:v10];
}

- (void)ef_insertObject:()EmailFoundationAdditions usingComparator:
{
  id v7 = a3;
  id v6 = a4;
  objc_msgSend(a1, "insertObject:atIndex:", v7, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(a1, "count"), 1024, v6));
}

@end