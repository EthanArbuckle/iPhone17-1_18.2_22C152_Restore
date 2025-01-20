@interface SFRichTitleCardSection(CRKCardViewControllerAdditions)
- (uint64_t)_crk_leadingCardSectionSeparatorStyle;
- (uint64_t)_crk_trailingCardSectionSeparatorStyle;
@end

@implementation SFRichTitleCardSection(CRKCardViewControllerAdditions)

- (uint64_t)_crk_leadingCardSectionSeparatorStyle
{
  return 5;
}

- (uint64_t)_crk_trailingCardSectionSeparatorStyle
{
  return 0;
}

@end