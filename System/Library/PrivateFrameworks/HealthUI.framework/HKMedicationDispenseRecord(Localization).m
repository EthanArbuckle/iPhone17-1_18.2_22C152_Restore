@interface HKMedicationDispenseRecord(Localization)
- (id)sortDateTitle;
@end

@implementation HKMedicationDispenseRecord(Localization)

- (id)sortDateTitle
{
  v2 = [a1 sortDate];
  v3 = [v2 keyPath];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F29FD8]];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"MEDICATION_DISPENSE_RECORD_SORT_DATE_TITLE_MODIFIED_DATE";
LABEL_9:
    v17 = [v5 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];

    goto LABEL_10;
  }
  v8 = [a1 sortDate];
  v9 = [v8 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A020]];

  if (v10)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"MEDICATION_DISPENSE_RECORD_SORT_DATE_TITLE_EARLIEST_DOSAGE_DATE";
    goto LABEL_9;
  }
  v11 = [a1 sortDate];
  v12 = [v11 keyPath];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F2A030]];

  if (v13)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"MEDICATION_DISPENSE_RECORD_SORT_DATE_TITLE_PREPARATION_DATE";
    goto LABEL_9;
  }
  v14 = [a1 sortDate];
  v15 = [v14 keyPath];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F2A028]];

  if (v16)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"MEDICATION_DISPENSE_RECORD_SORT_DATE_TITLE_HAND_OVER_DATE";
    goto LABEL_9;
  }
  v17 = 0;
LABEL_10:
  return v17;
}

@end