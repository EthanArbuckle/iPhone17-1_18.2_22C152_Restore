@interface NSMutableOrderedSet(NSMutableOrderedSetDiffing)
- (uint64_t)applyDifference:()NSMutableOrderedSetDiffing;
@end

@implementation NSMutableOrderedSet(NSMutableOrderedSetDiffing)

- (uint64_t)applyDifference:()NSMutableOrderedSetDiffing
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if ([v9 changeType] == 1) {
          objc_msgSend(a1, "removeObjectAtIndex:", objc_msgSend(v9, "index"));
        }
        else {
          objc_msgSend(a1, "insertObject:atIndex:", objc_msgSend(v9, "object"), objc_msgSend(v9, "index"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

@end