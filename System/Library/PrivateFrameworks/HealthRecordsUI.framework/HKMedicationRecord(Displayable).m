@interface HKMedicationRecord(Displayable)
- (id)codings;
- (id)meaningfulDateTitle;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKMedicationRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"MEDICATION_STATEMENT_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 medicationCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (id)meaningfulDateTitle
{
  if ([a1 notTaken]) {
    HRLocalizedString(@"MEDICATION_RECORD_SORT_DATE_TITLE_NOT_TAKEN");
  }
  else {
  v2 = [a1 sortDateTitle];
  }
  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_MEDICATION_TITLE");
}

@end