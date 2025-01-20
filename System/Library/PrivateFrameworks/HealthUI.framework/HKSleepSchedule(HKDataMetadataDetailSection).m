@interface HKSleepSchedule(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKSleepSchedule(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hk_localizedWeekdaysList");
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"SLEEP_SCHEDULE_DAYS_ACTIVE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  v8 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FE70);
  [v4 addText:v5 detail:v7 baseIdentifier:v8];

  v9 = objc_msgSend(a1, "hk_localizedBedtime");
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"SLEEP_SCHEDULE_BEDTIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  v12 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FE88);
  [v4 addText:v9 detail:v11 baseIdentifier:v12];

  v13 = objc_msgSend(a1, "hk_localizedWakeTime");
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = [v14 localizedStringForKey:@"SLEEP_SCHEDULE_WAKETIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Eucalyptus"];
  v16 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FEA0);
  [v4 addText:v13 detail:v15 baseIdentifier:v16];

  v17.receiver = a1;
  v17.super_class = (Class)&off_1F3CFD030;
  objc_msgSendSuper2(&v17, sel_addDetailValuesToSection_, v4);
}

@end