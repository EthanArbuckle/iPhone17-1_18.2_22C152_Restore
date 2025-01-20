@interface HKSignedClinicalDataRecord(Localization)
- (id)sortDateTitle;
@end

@implementation HKSignedClinicalDataRecord(Localization)

- (id)sortDateTitle
{
  v1 = [a1 sortDate];
  v2 = [v1 keyPath];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F2A9F0]];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = [v4 localizedStringForKey:@"SIGNED_CLINICAL_DATA_RECORD_SORT_DATE_TITLE_ISSUED_DATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end