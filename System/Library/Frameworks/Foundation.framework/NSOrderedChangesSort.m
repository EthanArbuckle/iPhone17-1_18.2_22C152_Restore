@interface NSOrderedChangesSort
@end

@implementation NSOrderedChangesSort

uint64_t ___NSOrderedChangesSort_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [**(id **)(a1 + 40) objectAtIndex:*(void *)(a1 + 48) + a2];
  uint64_t v7 = [**(id **)(a1 + 40) objectAtIndex:*(void *)(a1 + 48) + a3];
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v8(v5, v6, v7);
}

@end