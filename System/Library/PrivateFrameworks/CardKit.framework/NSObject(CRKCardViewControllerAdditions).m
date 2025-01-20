@interface NSObject(CRKCardViewControllerAdditions)
- (uint64_t)_crk_leadingCardSectionSeparatorStyle;
- (uint64_t)_crk_trailingCardSectionSeparatorStyle;
@end

@implementation NSObject(CRKCardViewControllerAdditions)

- (uint64_t)_crk_leadingCardSectionSeparatorStyle
{
  return 0;
}

- (uint64_t)_crk_trailingCardSectionSeparatorStyle
{
  return 0;
}

@end