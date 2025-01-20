@interface NSSet(HUAdditions)
- (uint64_t)computeHashFromContents;
@end

@implementation NSSet(HUAdditions)

- (uint64_t)computeHashFromContents
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 hash];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v2 ^= HFComputeHashFromContents(*(void **)(*((void *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v2;
}

@end