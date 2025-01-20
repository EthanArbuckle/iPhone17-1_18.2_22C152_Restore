@interface NSArray(FPAction)
- (uint64_t)fp_itemIDs;
- (uint64_t)fp_itemIdentifiers;
@end

@implementation NSArray(FPAction)

- (uint64_t)fp_itemIdentifiers
{
  return objc_msgSend(a1, "fp_map:", &__block_literal_global_46_0);
}

- (uint64_t)fp_itemIDs
{
  return objc_msgSend(a1, "fp_map:", &__block_literal_global_48);
}

@end