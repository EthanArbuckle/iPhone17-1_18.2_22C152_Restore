@interface HKWorkoutActivity(HKDataMetadataDetailSection)
- (void)addDetailValuesToSection:()HKDataMetadataDetailSection;
@end

@implementation HKWorkoutActivity(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  v116[15] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HKDateFormatterFromTemplate(32);
  v6 = [a1 startDate];
  v7 = [a1 endDate];
  int v8 = [v6 isEqualToDate:v7];

  v102 = v5;
  v103 = v4;
  v106 = a1;
  if (v8)
  {
    v9 = [a1 startDate];
    v10 = [v5 stringFromDate:v9];

    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = [v11 localizedStringForKey:@"DATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v13 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD38);
    [v4 addText:v10 detail:v12 baseIdentifier:v13];
  }
  else
  {
    v10 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
    [(HKTimePeriodWithSecondsNumberFormatter *)v10 setAllowMillisecondPrecision:1];
    v14 = [a1 startDate];
    v11 = [v5 stringFromDate:v14];

    v15 = [a1 endDate];
    [v5 stringFromDate:v15];
    v12 = v16 = a1;

    v17 = NSNumber;
    [v16 duration];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    v13 = [(HKTimePeriodWithSecondsNumberFormatter *)v10 stringFromNumber:v18 displayType:0 unitController:0];

    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = [v19 localizedStringForKey:@"DURATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v21 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD50);
    [v4 addText:v13 detail:v20 baseIdentifier:v21];

    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = [v22 localizedStringForKey:@"START_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v24 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD68);
    [v4 addText:v11 detail:v23 baseIdentifier:v24];

    v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v26 = [v25 localizedStringForKey:@"END_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v27 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD80);
    [v4 addText:v12 detail:v26 baseIdentifier:v27];
  }
  id obja = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  v116[0] = obja;
  v107 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  v116[1] = v107;
  v104 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A600]];
  v116[2] = v104;
  v101 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F0]];
  v116[3] = v101;
  v100 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
  v116[4] = v100;
  v99 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A808]];
  v116[5] = v99;
  v98 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
  v116[6] = v98;
  v28 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
  v116[7] = v28;
  v29 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E8]];
  v116[8] = v29;
  v30 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C8]];
  v116[9] = v30;
  v31 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8D0]];
  v116[10] = v31;
  v32 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B0]];
  v116[11] = v32;
  v33 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8B8]];
  v116[12] = v33;
  v34 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8C0]];
  v116[13] = v34;
  v35 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8F8]];
  v116[14] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:15];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = v36;
  uint64_t v37 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  v38 = v103;
  v39 = v106;
  if (!v37) {
    goto LABEL_21;
  }
  uint64_t v40 = v37;
  uint64_t v41 = *(void *)v112;
  uint64_t v105 = *(void *)v112;
  do
  {
    uint64_t v42 = 0;
    uint64_t v108 = v40;
    do
    {
      if (*(void *)v112 != v41) {
        objc_enumerationMutation(obj);
      }
      v43 = *(void **)(*((void *)&v111 + 1) + 8 * v42);
      v44 = [v39 statisticsForType:v43];
      if (v44)
      {
        v45 = [v38 displayTypeController];
        v46 = [v45 displayTypeForObjectType:v43];

        v47 = [v38 unitController];
        v48 = [v47 unitForDisplayType:v46];

        uint64_t v49 = [v43 aggregationStyle];
        if (v49 == 1)
        {
          v50 = [v44 averageQuantity];
LABEL_14:
          v51 = v50;
          [v50 doubleValueForUnit:v48];
          double v53 = v52;

          v54 = [v46 presentation];
          v55 = [NSNumber numberWithDouble:v53];
          uint64_t v56 = [v54 adjustedValueForDaemonValue:v55];
          [v38 unitController];
          v58 = v57 = v38;
          v59 = HKFormattedStringFromValueForContext((void *)v56, v46, v58, 0, 0, 1);

          v60 = [v57 unitController];
          LOBYTE(v56) = HKFormatterIncludesUnitForDisplayTypeInContext(v46, 1, v60);

          if (v56)
          {
            id v61 = v59;
          }
          else
          {
            v62 = [v57 unitController];
            v63 = [v62 localizedDisplayNameForDisplayType:v46 value:0 nameContext:3];

            HKFormatValueAndUnit(v59, v63);
            id v61 = (id)objc_claimAutoreleasedReturnValue();
          }
          v64 = [v46 localization];
          v65 = [v64 displayName];
          v66 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FD98);
          [v57 addText:v61 detail:v65 baseIdentifier:v66];

          v38 = v57;
          uint64_t v41 = v105;
          v39 = v106;
          uint64_t v40 = v108;
        }
        else if (!v49)
        {
          v50 = [v44 sumQuantity];
          goto LABEL_14;
        }
      }
      ++v42;
    }
    while (v40 != v42);
    uint64_t v40 = [obj countByEnumeratingWithState:&v111 objects:v115 count:16];
  }
  while (v40);
LABEL_21:

  v67 = [v39 workoutConfiguration];
  uint64_t v68 = [v67 locationType];

  if ((unint64_t)(v68 - 1) > 2) {
    v69 = 0;
  }
  else {
    v69 = off_1E6D56958[v68 - 1];
  }
  v70 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v71 = [v70 localizedStringForKey:v69 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v72 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v73 = [v72 localizedStringForKey:@"WORKOUT_SESSION_LOCATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v74 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FDB0);
  [v103 addText:v71 detail:v73 baseIdentifier:v74];

  v75 = [v106 workoutConfiguration];
  uint64_t v76 = [v75 activityType];

  if (v76 == 6)
  {
    v77 = [v106 workoutConfiguration];
    [v77 swimmingLocationType];
    v78 = _HKWorkoutSwimmingLocationTypeName();
    v79 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v80 = [v79 localizedStringForKey:@"HKSwimmingLocationType" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v81 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FDC8);
    [v103 addText:v78 detail:v80 baseIdentifier:v81];

    v82 = [v103 displayTypeController];
    v83 = [v82 displayTypeWithIdentifier:&unk_1F3C22840];

    v84 = [v103 unitController];
    v85 = [v84 unitForDisplayType:v83];

    v86 = [v106 workoutConfiguration];
    v87 = [v86 lapLength];
    [v87 doubleValueForUnit:v85];
    double v89 = v88;

    v90 = [v83 presentation];
    v91 = [NSNumber numberWithDouble:v89];
    v92 = [v90 adjustedValueForDaemonValue:v91];
    v93 = [v103 unitController];
    v94 = HKFormattedStringFromValueForContext(v92, v83, v93, 0, 0, 1);

    v95 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v96 = [v95 localizedStringForKey:@"HKLapLength" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v97 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FDE0);
    [v103 addText:v94 detail:v96 baseIdentifier:v97];
  }
}

@end