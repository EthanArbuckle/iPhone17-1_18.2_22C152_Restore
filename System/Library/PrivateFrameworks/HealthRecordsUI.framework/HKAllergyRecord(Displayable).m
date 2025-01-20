@interface HKAllergyRecord(Displayable)
- (id)codings;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKAllergyRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"ALLERGY_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 allergyCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_ALLERGY_TITLE");
}

@end