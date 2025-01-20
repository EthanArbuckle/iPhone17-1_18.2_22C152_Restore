@interface HKCategorySample(HKDataMetadataDetailSection)
- (void)_addDefaultCategoryDetailValuesToSection:()HKDataMetadataDetailSection;
- (void)_addHeartEventDetailValuesToSection:()HKDataMetadataDetailSection;
- (void)_addWalkingSteadinessEventDetailValuesToSection:()HKDataMetadataDetailSection;
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKCategorySample(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4 = a3;
  v5 = [a1 sampleType];
  uint64_t v6 = [v5 code];

  if (v6 != 140)
  {
    if (v6 == 250)
    {
      [a1 _addWalkingSteadinessEventDetailValuesToSection:v4];
      goto LABEL_7;
    }
    if (v6 != 147)
    {
      [a1 _addDefaultCategoryDetailValuesToSection:v4];
      goto LABEL_7;
    }
  }
  [a1 _addHeartEventDetailValuesToSection:v4];
LABEL_7:
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F3CF7F28;
  objc_msgSendSuper2(&v7, sel_addDetailValuesToSection_, v4);
}

- (void)_addDefaultCategoryDetailValuesToSection:()HKDataMetadataDetailSection
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 displayTypeController];
  uint64_t v6 = [a1 sampleType];
  objc_super v7 = [v5 displayTypeForObjectType:v6];

  v8 = objc_msgSend(v7, "hk_enumeratedValueLabels");
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "value"));
  v10 = [v8 objectForKeyedSubscript:v9];

  v11 = [v7 localization];
  v12 = [v11 displayName];

  if ([v10 length])
  {
    v13 = [a1 sampleType];
    v14 = [v13 identifier];
    v17[0] = v14;
    v17[1] = @"DisplayType";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v16 = HKUIJoinStringsForAutomationIdentifier(v15);
    [v4 addText:v10 detail:v12 baseIdentifier:v16];
  }
}

- (void)_addHeartEventDetailValuesToSection:()HKDataMetadataDetailSection
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
  uint64_t v6 = NSString;
  objc_super v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v8 = [v7 localizedStringForKey:@"BEATS_PER_MINUTE_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v9 = v6;
  v10 = a1;
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v8, 0);

  v12 = [a1 metadata];
  uint64_t v13 = *MEMORY[0x1E4F2BB38];
  v14 = [v12 objectForKey:*MEMORY[0x1E4F2BB38]];

  if (v14)
  {
    v15 = HKFormatValueAndUnit(v14, v11);
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v16 localizedStringForKey:v13 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v18 = [a1 sampleType];
    [v18 identifier];
    v41 = a1;
    v20 = v19 = v5;
    v45[0] = v20;
    v45[1] = @"Range";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    v21 = v14;
    v23 = v22 = v11;
    v24 = HKUIJoinStringsForAutomationIdentifier(v23);
    [v4 addText:v15 detail:v17 baseIdentifier:v24];

    v11 = v22;
    v14 = v21;

    v5 = v19;
    v10 = v41;
  }
  v25 = [v10 metadata];
  uint64_t v26 = *MEMORY[0x1E4F2A140];
  uint64_t v27 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F2A140]];
  v43 = v4;
  if (v27)
  {
    v28 = (void *)v27;

LABEL_6:
    [v28 doubleValueForUnit:v5];
    v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    v31 = HKLocalizedStringForNumberWithDecimalPrecision(v30, 0, 0);

    HKFormatValueAndUnit(v31, v11);
    v32 = v42 = v5;
    v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v34 = [v33 localizedStringForKey:v26 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v35 = [v10 sampleType];
    v36 = [v35 identifier];
    v44[0] = v36;
    v44[1] = @"Threshold";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v37 = v14;
    v39 = v38 = v11;
    v40 = HKUIJoinStringsForAutomationIdentifier(v39);
    [v43 addText:v32 detail:v34 baseIdentifier:v40];

    v11 = v38;
    v14 = v37;

    v5 = v42;
    goto LABEL_7;
  }
  v29 = [v10 metadata];
  v28 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F2BB30]];

  if (v28) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_addWalkingSteadinessEventDetailValuesToSection:()HKDataMetadataDetailSection
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 sampleType];
  uint64_t v6 = [v5 identifier];

  unint64_t v7 = [a1 value] - 1;
  if (v7 <= 3
    && (+[HKMobilityUtilities localizedTitleForClassification:qword_1E0F06110[v7]], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v11 = [v10 localizedStringForKey:@"WALKING_STEADINESS_EVENT_VALUE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];
    v25[0] = v6;
    v25[1] = @"EventValue";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v13 = HKUIJoinStringsForAutomationIdentifier(v12);
    [v4 addText:v9 detail:v11 baseIdentifier:v13];
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E4F29F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
      -[HKCategorySample(HKDataMetadataDetailSection) _addWalkingSteadinessEventDetailValuesToSection:](v14, a1);
    }
  }
  uint64_t v15 = [a1 value];
  if ((unint64_t)(v15 - 3) < 2)
  {
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = v16;
    v18 = @"WALKING_STEADINESS_EVENT_TYPE_REPEAT";
  }
  else
  {
    if ((unint64_t)(v15 - 1) > 1) {
      goto LABEL_12;
    }
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = v16;
    v18 = @"WALKING_STEADINESS_EVENT_TYPE_INITIAL";
  }
  v19 = [v16 localizedStringForKey:v18 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];

  if (v19)
  {
    v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v21 = [v20 localizedStringForKey:@"WALKING_STEADINESS_EVENT_TYPE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];
    v24[0] = v6;
    v24[1] = @"EventType";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v23 = HKUIJoinStringsForAutomationIdentifier(v22);
    [v4 addText:v19 detail:v21 baseIdentifier:v23];
  }
LABEL_12:
}

- (void)_addWalkingSteadinessEventDetailValuesToSection:()HKDataMetadataDetailSection .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 value];
  _os_log_fault_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_FAULT, "Unable to localize classification for category value: %llu", (uint8_t *)&v4, 0xCu);
}

@end