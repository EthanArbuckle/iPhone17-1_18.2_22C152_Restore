@interface HKClinicalNoteRecord(Displayable)
- (id)codings;
- (id)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKClinicalNoteRecord(Displayable)

- (id)title
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v1 = [v0 localizedStringForKey:@"CLINICAL_NOTE_DETAIL_TITLE" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Notes"];

  return v1;
}

- (id)codings
{
  v1 = [a1 documentTypeCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRClinicalNotesLocalizedString(@"RECORD_DETAIL_CLINICAL_NOTE_TITLE");
}

@end