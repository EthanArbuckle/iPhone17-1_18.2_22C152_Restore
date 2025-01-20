@interface NSSet
@end

@implementation NSSet

uint64_t __44__NSSet_GKCollectionUtils___gkMapWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

@end