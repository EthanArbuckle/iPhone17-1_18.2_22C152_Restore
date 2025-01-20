@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

uint64_t __75__NSMutableDictionary_MTMaterialDescriptionInternal__sortFiltersWithOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 objectForKey:@"type"];
  v7 = [v5 objectForKey:@"type"];

  uint64_t v8 = MTCompareObjectsWithOrder((uint64_t)v6, v7, *(void **)(a1 + 32));
  return v8;
}

@end