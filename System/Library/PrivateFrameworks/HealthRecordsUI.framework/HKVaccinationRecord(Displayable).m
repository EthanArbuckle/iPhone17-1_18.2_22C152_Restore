@interface HKVaccinationRecord(Displayable)
- (id)meaningfulDateTitle;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKVaccinationRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"IMMUNIZATION_DETAIL_TITLE");
}

- (id)meaningfulDateTitle
{
  if ([a1 notGiven]) {
    HRLocalizedString(@"VACCINATION_RECORD_SORT_DATE_TITLE_NOT_ADMINISTERED");
  }
  else {
  v2 = [a1 sortDateTitle];
  }
  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_IMMUNIZATION_TITLE");
}

@end