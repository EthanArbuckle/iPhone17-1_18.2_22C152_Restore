@interface HKStateOfMind(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKStateOfMind(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = [v4 displayTypeController];
  v6 = [a1 sampleType];
  v7 = [v5 displayTypeForObjectType:v6];

  v8 = HKUILocalizedStringForStateOfMind(a1);
  v9 = [v7 localization];
  v10 = [v9 displayName];
  v11 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FEB8);
  [v4 addText:v8 detail:v10 baseIdentifier:v11];

  v12 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentDecimalNumberFormatter");
  v13 = NSNumber;
  [a1 valence];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = [v12 stringFromNumber:v14];
  v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v17 = [v16 localizedStringForKey:@"STATE_OF_MIND_VALENCE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
  v18 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FED0);
  [v4 addText:v15 detail:v17 baseIdentifier:v18];

  v19 = [a1 domains];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [a1 domains];
    v22 = objc_msgSend(v21, "hk_map:", &__block_literal_global_924);

    v23 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v22];
    v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v25 = [v24 localizedStringForKey:@"STATE_OF_MIND_DOMAINS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v26 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FEE8);
    [v4 addText:v23 detail:v25 baseIdentifier:v26];
  }
  v27 = [a1 labels];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = [a1 labels];
    v30 = objc_msgSend(v29, "hk_map:", &__block_literal_global_936);

    v31 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v30];
    v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v33 = [v32 localizedStringForKey:@"STATE_OF_MIND_DESCRIPTIONS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v34 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF00);
    [v4 addText:v31 detail:v33 baseIdentifier:v34];
  }
  v35 = [a1 context];

  if (v35)
  {
    v36 = [a1 context];
    v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v38 = [v37 localizedStringForKey:@"STATE_OF_MIND_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Chamomile"];
    v39 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FF18);
    [v4 addText:v36 detail:v38 baseIdentifier:v39];
  }
  v40.receiver = a1;
  v40.super_class = (Class)&off_1F3D033C0;
  objc_msgSendSuper2(&v40, sel_addDetailValuesToSection_, v4);
}

@end