@interface NSIndexSet
@end

@implementation NSIndexSet

void __55__NSIndexSet_CKUtilities____ck_indexPathRowsInSection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

void __56__NSIndexSet_CKUtilities____ck_indexPathItemsInSection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

@end