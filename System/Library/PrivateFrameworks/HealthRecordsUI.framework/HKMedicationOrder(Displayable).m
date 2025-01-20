@interface HKMedicationOrder(Displayable)
- (id)codings;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKMedicationOrder(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"MEDICATION_PRESCRIPTION_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 medicationCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_MEDICATION_TITLE");
}

@end