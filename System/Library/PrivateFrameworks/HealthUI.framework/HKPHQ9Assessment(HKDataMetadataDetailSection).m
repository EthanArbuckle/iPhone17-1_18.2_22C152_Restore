@interface HKPHQ9Assessment(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKPHQ9Assessment(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = HKUILocalizedStringForPHQ9Risk([a1 risk]);
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"PHQ9_RISK_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
  v8 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF78);
  [v4 addText:v5 detail:v7 baseIdentifier:v8];

  v9 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", objc_msgSend(a1, "score"));
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"PHQ9_SCORE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
  v12 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF90);
  v33 = v4;
  [v4 addText:v9 detail:v11 baseIdentifier:v12];

  v13 = [a1 answers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    unint64_t v15 = 0;
    v32 = a1;
    do
    {
      v16 = [a1 answers];
      v17 = [v16 objectAtIndexedSubscript:v15];
      uint64_t v18 = [v17 integerValue];

      v19 = HKUILocalizedStringForPHQ9Answer(v18);
      if (v18 == 4)
      {
        unint64_t v20 = 0x1E4F28000;
      }
      else
      {
        v21 = NSString;
        v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v23 = [v22 localizedStringForKey:@"ASSESSMENT_POINT_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
        v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v18);

        uint64_t v25 = [NSString localizedStringWithFormat:@"%@ %@", v19, v24];

        unint64_t v20 = 0x1E4F28000uLL;
        a1 = v32;
        v19 = (void *)v25;
      }
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"PHQ9_QUESTION_%i", ++v15);
      v27 = [*(id *)(v20 + 2896) bundleWithIdentifier:@"com.apple.HealthUI"];
      v28 = [v27 localizedStringForKey:v26 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
      v29 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FFA8);
      [v33 addText:v19 detail:v28 baseIdentifier:v29];

      v30 = [a1 answers];
      unint64_t v31 = [v30 count];
    }
    while (v31 > v15);
  }
  v34.receiver = a1;
  v34.super_class = (Class)&off_1F3D039C0;
  objc_msgSendSuper2(&v34, sel_addDetailValuesToSection_, v33);
}

@end