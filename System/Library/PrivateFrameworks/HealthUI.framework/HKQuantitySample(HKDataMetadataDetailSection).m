@interface HKQuantitySample(HKDataMetadataDetailSection)
- (BOOL)_shouldOmitUnitsInSampleDetailViewForDisplayType:()HKDataMetadataDetailSection;
- (id)_titleStringForValueSectionWithDisplayType:()HKDataMetadataDetailSection;
- (id)detailFooter;
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKQuantitySample(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  v91[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 displayTypeController];
  v6 = [a1 sampleType];
  v7 = [v5 displayTypeForObjectType:v6];

  v85 = v4;
  v84 = [v4 unitController];
  v8 = [v84 unitForDisplayType:v7];
  v9 = [a1 quantity];
  [v9 doubleValueForUnit:v8];
  double v11 = v10;

  v12 = [v7 presentation];
  v13 = [NSNumber numberWithDouble:v11];
  v14 = [v12 adjustedValueForDaemonValue:v13];

  v82 = v14;
  if ([v7 displayTypeIdentifier] == 275)
  {
    v15 = [a1 quantity];
    v16 = +[HKSleepApneaUtilities localizedTitleForBreathingDisturbances:v15];
    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v18 = [v17 localizedStringForKey:@"LEVEL_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v91[0] = *MEMORY[0x1E4F2A5D8];
    v91[1] = @"Level";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
    v20 = HKUIJoinStringsForAutomationIdentifier(v19);
    [v85 addText:v16 detail:v18 baseIdentifier:v20];

    v14 = v82;
  }
  v21 = [MEMORY[0x1E4F2B618] percentUnit];
  int v22 = [v8 isEqual:v21];

  if (v22)
  {
    v23 = [v7 objectType];
    uint64_t v24 = [v23 code];

    if (v24 == 249) {
      +[HKTieredDecimalPrecisionRule numberFormatter];
    }
    else {
    id v25 = +[HKTieredDecimalPrecisionRule percentageFormatter];
    }
    v26 = HKFormattedStringFromValueForContext(v14, v7, v84, 0, v25, 1);
    v27 = [a1 metadata];
    v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F2A1B8]];
    v29 = v14;
    int v30 = [v28 BOOLValue];

    if (v30)
    {
      uint64_t v31 = HKAFibBurdenClampedLowerBoundLocalizedString(v29);

      uint64_t v83 = v31;
    }
    else
    {
      uint64_t v83 = (uint64_t)v26;
    }
    goto LABEL_20;
  }
  HKFormattedStringFromValueForContext(v14, v7, v84, 0, 0, 1);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (HKFormatterIncludesUnitForDisplayTypeInContext(v7, 1, v84))
  {
    id v25 = v25;
    uint64_t v83 = (uint64_t)v25;
    goto LABEL_20;
  }
  v32 = [v84 localizedDisplayNameForDisplayType:v7 value:v14 nameContext:3];
  if ([v7 displayTypeIdentifier] == 2)
  {
    v33 = [MEMORY[0x1E4F2B618] footUnit];
    if ([v8 isEqual:v33])
    {
    }
    else
    {
      char v75 = [a1 _shouldOmitUnitsInSampleDetailViewForDisplayType:v7];

      if ((v75 & 1) == 0) {
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  if ([a1 _shouldOmitUnitsInSampleDetailViewForDisplayType:v7])
  {
LABEL_16:

    v32 = &stru_1F3B9CF20;
  }
LABEL_17:
  v34 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
  int v35 = [v8 isEqual:v34];

  if (v35)
  {
    v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v37 = [v36 localizedStringForKey:@"SPL_DECIBEL_UNIT_LONG_FORM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v32 = (__CFString *)v37;
  }
  uint64_t v83 = HKFormatValueAndUnit(v25, v32);

LABEL_20:
  uint64_t v38 = [v7 displayTypeIdentifier];
  v39 = [a1 _titleStringForValueSectionWithDisplayType:v7];
  if (v38 == 275)
  {
    v90[0] = *MEMORY[0x1E4F2A5D8];
    v90[1] = @"BreathingDisturbanceValue";
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    v41 = HKUIJoinStringsForAutomationIdentifier(v40);
    v42 = (void *)v83;
    [v85 addText:v83 detail:v39 baseIdentifier:v41];
  }
  else
  {
    v40 = [a1 sampleType];
    v41 = [v40 identifier];
    v89[0] = v41;
    v89[1] = @"Sample";
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
    v44 = HKUIJoinStringsForAutomationIdentifier(v43);
    [v85 addText:v83 detail:v39 baseIdentifier:v44];

    v42 = (void *)v83;
  }

  if ([v7 displayTypeIdentifier] == 249)
  {
    v45 = [a1 quantity];
    int64_t v46 = +[HKMobilityUtilities classificationForAppleWalkingSteadinessQuantity:v45];

    v47 = +[HKMobilityUtilities localizedTitleForClassification:v46];
    if (v47)
    {
      v80 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v48 = [v80 localizedStringForKey:@"LEVEL_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v49 = [a1 sampleType];
      v50 = [v49 identifier];
      v88[0] = v50;
      v88[1] = @"SteadinessLevel";
      v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
      HKUIJoinStringsForAutomationIdentifier(v51);
      v52 = v7;
      v54 = v53 = v8;
      [v85 addText:v47 detail:v48 baseIdentifier:v54];

      v8 = v53;
      v7 = v52;

      v42 = (void *)v83;
    }
  }
  if ([v7 displayTypeIdentifier] == 248)
  {
    v81 = v8;
    id v55 = objc_alloc(MEMORY[0x1E4F28C18]);
    v56 = [a1 startDate];
    v57 = [a1 endDate];
    v58 = (void *)[v55 initWithStartDate:v56 endDate:v57];

    uint64_t v59 = [a1 _timeZone];
    v60 = [v85 calendarCache];
    v79 = (void *)v59;
    v61 = [v60 calendarForTimeZone:v59];

    v62 = (void *)MEMORY[0x1E4F28C18];
    v63 = [v85 calendarCache];
    v64 = [v63 currentCalendar];
    v65 = objc_msgSend(v62, "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v58, v61, v64);

    if (v65)
    {
      v66 = objc_msgSend(MEMORY[0x1E4F28C20], "hk_mediumDateStyleIntervalFormatter");
      v67 = [v66 stringFromDateInterval:v65];
      if (v67)
      {
        v77 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v68 = [v77 localizedStringForKey:@"AFIB_BURDEN_DATE_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
        v76 = [a1 sampleType];
        [v76 identifier];
        v69 = v78 = v58;
        v87[0] = v69;
        v87[1] = @"DateRange";
        v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
        HKUIJoinStringsForAutomationIdentifier(v70);
        v71 = v61;
        v73 = v72 = v66;
        [v85 addText:v67 detail:v68 baseIdentifier:v73];

        v66 = v72;
        v61 = v71;

        v58 = v78;
        v42 = (void *)v83;
      }
    }
    else
    {
      _HKInitializeLogging();
      v74 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT)) {
        -[HKQuantitySample(HKDataMetadataDetailSection) addDetailValuesToSection:](v74);
      }
    }

    v8 = v81;
  }
  v86.receiver = a1;
  v86.super_class = (Class)&off_1F3CF81A8;
  objc_msgSendSuper2(&v86, sel_addDetailValuesToSection_, v85);
}

- (id)_titleStringForValueSectionWithDisplayType:()HKDataMetadataDetailSection
{
  id v3 = a3;
  if ([v3 displayTypeIdentifier] == 275)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    [v4 localizedStringForKey:@"SLEEP_BREATHING_DISTURBANCES_SAMPLE_DETAIL_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];
  }
  else
  {
    id v4 = [v3 localization];
    [v4 displayName];
  v5 = };

  return v5;
}

- (BOOL)_shouldOmitUnitsInSampleDetailViewForDisplayType:()HKDataMetadataDetailSection
{
  return [a3 displayTypeIdentifier] == 275;
}

- (id)detailFooter
{
  v1 = [a1 sampleType];
  v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5E0]];
  int v3 = [v1 isEqual:v2];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = [v4 localizedStringForKey:@"SLEEPING_WRIST_TEMPERATURE_METADATA_DETAIL_FOOTER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E0B26000, log, OS_LOG_TYPE_FAULT, "AFibBurden sample with instantaneous duration detected", v1, 2u);
}

@end