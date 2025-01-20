@interface HKWorkout(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKWorkout(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 workoutActivityType];
  v21 = HKUILocalizedWorkoutTypeName();
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"WORKOUT_TYPE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v7 = [a1 sampleType];
  v8 = [v7 identifier];
  v24[0] = v8;
  v24[1] = @"Type";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v10 = HKUIJoinStringsForAutomationIdentifier(v9);
  [v4 addText:v21 detail:v6 baseIdentifier:v10];

  v11 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
  [(HKTimePeriodWithSecondsNumberFormatter *)v11 setAllowMillisecondPrecision:1];
  v12 = NSNumber;
  [a1 duration];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = [(HKTimePeriodWithSecondsNumberFormatter *)v11 stringFromNumber:v13 displayType:0 unitController:0];

  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"DURATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v17 = [a1 sampleType];
  v18 = [v17 identifier];
  v23[0] = v18;
  v23[1] = @"Duration";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v20 = HKUIJoinStringsForAutomationIdentifier(v19);
  [v4 addText:v14 detail:v16 baseIdentifier:v20];

  v22.receiver = a1;
  v22.super_class = (Class)&off_1F3CF32D8;
  objc_msgSendSuper2(&v22, sel_addDetailValuesToSection_, v4);
}

@end