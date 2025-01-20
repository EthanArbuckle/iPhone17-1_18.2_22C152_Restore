@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __81__NSMutableArray_MKLocatableAdditions___mapkit_insertObject_sortedUsingSelector___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6 = (uint64_t (*)(void *, uint64_t, uint64_t))[a2 methodForSelector:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 32);

  return v6(a2, v7, a3);
}

@end