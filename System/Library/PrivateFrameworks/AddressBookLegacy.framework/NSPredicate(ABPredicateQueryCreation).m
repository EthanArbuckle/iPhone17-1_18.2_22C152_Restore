@interface NSPredicate(ABPredicateQueryCreation)
- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation;
- (uint64_t)ab_hasCallback;
- (uint64_t)ab_metadataForMatchingRow:()ABPredicateQueryCreation columnOffset:;
- (uint64_t)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:;
@end

@implementation NSPredicate(ABPredicateQueryCreation)

- (uint64_t)ab_addCallbackContextToArray:()ABPredicateQueryCreation
{
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  return [a3 addObject:v4];
}

- (uint64_t)ab_hasCallback
{
  return 0;
}

- (uint64_t)ab_newQueryWithSortOrder:()ABPredicateQueryCreation ranked:addressBook:propertyIndices:
{
  return 0;
}

- (uint64_t)ab_metadataForMatchingRow:()ABPredicateQueryCreation columnOffset:
{
  return 0;
}

@end