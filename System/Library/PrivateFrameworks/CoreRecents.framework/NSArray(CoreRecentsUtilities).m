@interface NSArray(CoreRecentsUtilities)
- (uint64_t)cr_firstObjectPassingTest:()CoreRecentsUtilities;
- (unint64_t)cr_binaryInsertionIndexOfObject:()CoreRecentsUtilities usingComparator:match:;
- (void)cr_insertionSortedArrayUsingComparator:()CoreRecentsUtilities;
- (void)cr_map:()CoreRecentsUtilities;
@end

@implementation NSArray(CoreRecentsUtilities)

- (unint64_t)cr_binaryInsertionIndexOfObject:()CoreRecentsUtilities usingComparator:match:
{
  unint64_t v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4);
  if (a5)
  {
    *a5 = 0;
    if (v8 < [a1 count]) {
      *a5 = objc_msgSend(a3, "isEqual:", objc_msgSend(a1, "objectAtIndex:", v8));
    }
  }
  return v8;
}

- (uint64_t)cr_firstObjectPassingTest:()CoreRecentsUtilities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(a1);
    }
    uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)cr_map:()CoreRecentsUtilities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v5, "cr_addObject:orPlaceholder:", (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(*((void *)&v11 + 1) + 8 * v9++)), objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
      }
      while (v7 != v9);
      uint64_t v7 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)cr_insertionSortedArrayUsingComparator:()CoreRecentsUtilities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v5, "cr_insertObject:usingComparator:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), a3);
      }
      while (v7 != v9);
      uint64_t v7 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

@end