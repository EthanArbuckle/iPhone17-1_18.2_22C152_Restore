@interface HKWorkoutEvent(HKDataMetadataDetailSection)
- (id)startDate;
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKWorkoutEvent(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  HKDateFormatterFromTemplate(32);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [a1 dateInterval];
  v6 = [v5 startDate];
  v7 = [a1 dateInterval];
  v8 = [v7 endDate];
  int v9 = [v6 isEqualToDate:v8];

  if (v9)
  {
    v10 = [a1 dateInterval];
    v11 = [v10 startDate];
    v12 = [v32 stringFromDate:v11];

    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v13 localizedStringForKey:@"DATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v15 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FCD8);
    [v4 addText:v12 detail:v14 baseIdentifier:v15];
  }
  else
  {
    v12 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
    [(HKTimePeriodWithSecondsNumberFormatter *)v12 setAllowMillisecondPrecision:1];
    v16 = NSNumber;
    v17 = [a1 dateInterval];
    [v17 duration];
    v18 = objc_msgSend(v16, "numberWithDouble:");
    v13 = [(HKTimePeriodWithSecondsNumberFormatter *)v12 stringFromNumber:v18 displayType:0 unitController:0];

    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = objc_msgSend(v19, "localizedStringForKey:value:table:", @"DURATION");
    v21 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FCF0);
    [v4 addText:v13 detail:v20 baseIdentifier:v21];

    v22 = [a1 dateInterval];
    v23 = [v22 startDate];
    v14 = [v32 stringFromDate:v23];

    v24 = [a1 dateInterval];
    v25 = [v24 endDate];
    v15 = [v32 stringFromDate:v25];

    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v27 = [v26 localizedStringForKey:@"START_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v28 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD08);
    [v4 addText:v14 detail:v27 baseIdentifier:v28];

    v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = [v29 localizedStringForKey:@"END_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v31 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD20);
    [v4 addText:v15 detail:v30 baseIdentifier:v31];

    id v4 = v29;
  }
}

- (id)startDate
{
  v1 = [a1 dateInterval];
  v2 = [v1 startDate];

  return v2;
}

@end