@interface SFMapCardSection(CRKCardViewControllerAdditions)
- (uint64_t)_crk_leadingCardSectionSeparatorStyle;
- (uint64_t)_crk_trailingCardSectionSeparatorStyle;
@end

@implementation SFMapCardSection(CRKCardViewControllerAdditions)

- (uint64_t)_crk_leadingCardSectionSeparatorStyle
{
  return 1;
}

- (uint64_t)_crk_trailingCardSectionSeparatorStyle
{
  return 1;
}

@end