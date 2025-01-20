@interface FPItemList
@end

@implementation FPItemList

void __41___FPItemList_itemIDsDifferenceWithList___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 itemID];
  [v2 addObject:v3];
}

@end