@interface NSSet
@end

@implementation NSSet

uint64_t __42__NSSet_EmailFoundationAdditions__ef_all___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __66__NSSet_EmailFoundationAdditions__ef_setByRemovingObjectsFromSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

@end