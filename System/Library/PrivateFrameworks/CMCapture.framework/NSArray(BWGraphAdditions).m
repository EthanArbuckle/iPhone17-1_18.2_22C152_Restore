@interface NSArray(BWGraphAdditions)
- (uint64_t)bw_intersectWithArray:()BWGraphAdditions;
@end

@implementation NSArray(BWGraphAdditions)

- (uint64_t)bw_intersectWithArray:()BWGraphAdditions
{
  v4 = (void *)[MEMORY[0x1E4F1CA70] orderedSetWithArray:a1];
  objc_msgSend(v4, "intersectOrderedSet:", objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:", a3));
  return [v4 array];
}

@end