@interface HKGAD7Assessment(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKGAD7Assessment(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = HKUILocalizedStringForGAD7Risk([a1 risk]);
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"GAD7_RISK_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
  v8 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF30);
  [v4 addText:v5 detail:v7 baseIdentifier:v8];

  uint64_t v9 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", objc_msgSend(a1, "score"));
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"GAD7_SCORE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
  v12 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF48);
  v31 = (void *)v9;
  v32 = v4;
  [v4 addText:v9 detail:v11 baseIdentifier:v12];

  v13 = [a1 answers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [a1 answers];
      v17 = [v16 objectAtIndexedSubscript:v15];
      uint64_t v18 = [v17 integerValue];

      v19 = HKUILocalizedStringForGAD7Answer(v18);
      v20 = NSString;
      v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v22 = [v21 localizedStringForKey:@"ASSESSMENT_POINT_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
      v23 = objc_msgSend(v20, "localizedStringWithFormat:", v22, v18);

      v24 = [NSString localizedStringWithFormat:@"%@ %@", v19, v23];

      v25 = objc_msgSend(NSString, "stringWithFormat:", @"GAD7_QUESTION_%i", ++v15);
      v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v27 = [v26 localizedStringForKey:v25 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
      v28 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF60);
      [v32 addText:v24 detail:v27 baseIdentifier:v28];

      v29 = [a1 answers];
      unint64_t v30 = [v29 count];
    }
    while (v30 > v15);
  }
  v33.receiver = a1;
  v33.super_class = (Class)&off_1F3D03860;
  objc_msgSendSuper2(&v33, sel_addDetailValuesToSection_, v32);
}

@end