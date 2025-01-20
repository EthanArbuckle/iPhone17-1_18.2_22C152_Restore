@interface HKCorrelation(HKDataMetadataDetailSection)
- (void)_hk_bloodPressureDetailRowForSampleType:()HKDataMetadataDetailSection title:section:;
- (void)_hk_bloodPressureDetailRowsWithSection:()HKDataMetadataDetailSection;
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKCorrelation(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = [a1 sampleType];
  uint64_t v6 = [v5 code];

  if (v6 == 80) {
    objc_msgSend(a1, "_hk_bloodPressureDetailRowsWithSection:", v4);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F3CF8360;
  objc_msgSendSuper2(&v7, sel_addDetailValuesToSection_, v4);
}

- (void)_hk_bloodPressureDetailRowsWithSection:()HKDataMetadataDetailSection
{
  id v4 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v5 = *MEMORY[0x1E4F2A620];
  id v6 = a3;
  objc_super v7 = [v4 quantityTypeForIdentifier:v5];
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"SYSTOLIC" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  objc_msgSend(a1, "_hk_bloodPressureDetailRowForSampleType:title:section:", v7, v9, v6);

  id v12 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"DIASTOLIC" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  objc_msgSend(a1, "_hk_bloodPressureDetailRowForSampleType:title:section:", v12, v11, v6);
}

- (void)_hk_bloodPressureDetailRowForSampleType:()HKDataMetadataDetailSection title:section:
{
  id v27 = a4;
  id v8 = a5;
  v9 = [a1 objectsForType:a3];
  v10 = [v9 anyObject];

  if (v10)
  {
    v11 = [v8 displayTypeController];
    id v12 = [v11 displayTypeWithIdentifier:&unk_1F3C22858];

    v13 = [v8 unitController];
    v14 = [v13 unitForDisplayType:v12];

    v15 = [v10 quantity];
    [v15 doubleValueForUnit:v14];
    double v17 = v16;

    v18 = [v12 presentation];
    v19 = [NSNumber numberWithDouble:v17];
    v20 = [v18 adjustedValueForDaemonValue:v19];

    v21 = [v8 unitController];
    v22 = HKFormattedStringFromValueForContext(v20, v12, v21, 0, 0, 1);

    v23 = [v8 unitController];
    v24 = [v23 localizedDisplayNameForDisplayType:v12 value:0 nameContext:3];

    v25 = HKFormatValueAndUnit(v22, v24);
    v26 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FDF8);
    [v8 addText:v25 detail:v27 baseIdentifier:v26];
  }
}

@end