@interface HKMedicationDispenseRecord(Displayable)
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKMedicationDispenseRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"MEDICATION_FILL_DETAIL_TITLE");
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_MEDICATION_TITLE");
}

@end