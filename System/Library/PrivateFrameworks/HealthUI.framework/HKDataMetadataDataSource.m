@interface HKDataMetadataDataSource
- (HKDataMetadataDataSource)initWithSample:(id)a3 unitPreferenceController:(id)a4;
- (id)_formattedValueTextForVO2MaxQuantityObject:(id)a3 key:(id)a4 section:(id)a5;
- (id)_mediaSourceDisplayNamesForSample:(id)a3;
- (void)addAdditionalOxygenSaturationDetailValuesToSection:(id)a3 key:(id)a4 value:(id)a5;
- (void)addDetailValuesToSection:(id)a3;
@end

@implementation HKDataMetadataDataSource

- (HKDataMetadataDataSource)initWithSample:(id)a3 unitPreferenceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDataMetadataDataSource;
  v8 = [(HKDataMetadataDataSource *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sample = v8->_sample;
    v8->_sample = (HKSample *)v9;

    objc_storeStrong((id *)&v8->_unitPreferenceController, a4);
  }

  return v8;
}

- (void)addDetailValuesToSection:(id)a3
{
  id v4 = a3;
  v5 = [(HKSample *)self->_sample metadata];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke;
  v7[3] = &unk_1E6D56938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v275[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (MACancelDownloadErrorDomain_block_invoke_onceToken != -1) {
    dispatch_once(&MACancelDownloadErrorDomain_block_invoke_onceToken, &__block_literal_global_84);
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A170]])
  {
    [NSString stringWithFormat:@"HEART_RATE_SENSOR_LOCATION_%@", v6];
    id v7 = LABEL_7:;
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v9 = [(__CFString *)v8 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_8:
    v10 = (void *)v9;
LABEL_9:

LABEL_10:
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A0F0]])
  {
    [NSString stringWithFormat:@"BODY_TEMP_SENSOR_LOCATION_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A200]])
  {
    id v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v6];
    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v18 = [*(id *)(*(void *)(a1 + 32) + 8) startDate];
    int v19 = [v7 isDaylightSavingTimeForDate:v18];

    if (v19) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 0;
    }
    id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v9 = [v7 localizedName:v20 locale:v8];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A238]])
  {
    [NSString stringWithFormat:@"HK_WEATHER_CONDITION_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A248]])
  {
    id v7 = _HKWeatherTemperatureUnit();
    v21 = [MEMORY[0x1E4F2B618] degreeFahrenheitUnit];
    int v22 = [v7 isEqual:v21];
    v23 = @"DEGREES_CELSIUS_NUMBERED_UNIT";
    if (v22) {
      v23 = @"DEGREES_FAHRENHEIT_NUMBERED_UNIT";
    }
    id v8 = v23;

    if (![v6 isCompatibleWithUnit:v7])
    {
      v10 = 0;
      goto LABEL_9;
    }
    [v6 doubleValueForUnit:v7];
    uint64_t v25 = v24;
    v26 = objc_msgSend(NSNumber, "numberWithDouble:");
    v27 = HKLocalizedStringForNumberWithDecimalPrecision(v26, 2, 0);

    v28 = NSString;
    v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = [v29 localizedStringForKey:v8 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v25);

    v10 = HKFormatValueAndUnit(v27, v31);

    goto LABEL_32;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A240]])
  {
    v32 = [v6 _unit];
    [v6 doubleValueForUnit:v32];
    double v34 = v33;

    v35 = HKIntegerFormatter();
    v36 = [NSNumber numberWithDouble:v34];
    v37 = [v35 stringFromNumber:v36];

    v38 = NSString;
    v39 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v40 = [v39 localizedStringForKey:@"PERCENT_NUMBERED_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v10 = [v38 stringWithFormat:@"%@%@", v37, v40];

    goto LABEL_11;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A188]])
  {
    v41 = [MEMORY[0x1E4F2B618] meterUnit];
    int v42 = [v6 isCompatibleWithUnit:v41];

    if (v42)
    {
      v43 = *(void **)(*(void *)(a1 + 32) + 8);
      id v7 = [*(id *)(a1 + 40) displayTypeController];
      id v8 = [*(id *)(a1 + 40) unitController];
      uint64_t v9 = objc_msgSend(v43, "hk_localizedStringForAssociatedDistanceQuantity:displayTypeController:unitController:", v6, v7, v8);
      goto LABEL_8;
    }
    goto LABEL_78;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A1E0]])
  {
    [NSString stringWithFormat:@"SWIMMING_LOCATION_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A1E8]])
  {
    [NSString stringWithFormat:@"SWIMMING_STROKE_STYLE_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A180]])
  {
    [NSString stringWithFormat:@"INSULIN_DELIVERY_REASON_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A0E8]])
  {
    [NSString stringWithFormat:@"MEAL_TIME_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A210]])
  {
    [NSString stringWithFormat:@"VO2_MAX_TEST_TYPE_%@", v6];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A0D0]])
  {
    v44 = [MEMORY[0x1E4F2B618] unitFromString:@"kcal/(kg*hr)"];
    [v6 doubleValueForUnit:v44];
    double v46 = v45;

    id v7 = [NSNumber numberWithDouble:v46];
    uint64_t v47 = HKLocalizedStringForNumberWithDecimalPrecision(v7, 1, 0);
LABEL_52:
    v10 = (void *)v47;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A198]])
  {
    v48 = [MEMORY[0x1E4F2B618] unitFromString:@"lx"];
    [v6 doubleValueForUnit:v48];
    double v50 = v49;

    v51 = [*(id *)(*(void *)(a1 + 32) + 16) healthStore];
    v52 = +[HKDisplayTypeController sharedInstanceForHealthStore:v51];
    v259 = [v52 displayTypeWithIdentifier:&unk_1F3C227C8];

    v53 = [NSNumber numberWithDouble:v50];
    v54 = HKFormattedStringFromValue(v53, v259, *(void **)(*(void *)(a1 + 32) + 16), 0, 0);

    v55 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v56 = [v55 localizedStringForKey:@"MAXIMUM_LIGHT_INTENSITY_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v10 = HKFormatValueAndUnit(v54, v56);
    v57 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v58 = [v57 localizedStringForKey:@"MAXIMUM_LIGHT_INTENSITY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

LABEL_55:
    BOOL v11 = 0;
    id v5 = (id)v58;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A140]])
  {
LABEL_57:
    v10 = 0;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A088]])
  {
    v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v60 = v59;
    v61 = @"ACTIVITY_TYPE";
    v62 = @"HealthUI-Localizable";
    goto LABEL_60;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A1B0]])
  {
    v65 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v66 = @"HealthUI-Localizable";
    uint64_t v58 = [v65 localizedStringForKey:@"PHYSICAL_EFFORT_ESTIMATION_TYPE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    uint64_t v67 = [v6 unsignedIntegerValue];
    objc_msgSend(NSString, "stringWithFormat:", @"PHYSICAL_EFFORT_ESTIMATION_%ld", v67);
    v70 = LABEL_68:;
    v71 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v10 = [v71 localizedStringForKey:v70 value:&stru_1F3B9CF20 table:v66];

    goto LABEL_55;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A100]])
  {
    v68 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v66 = @"HealthUI-Localizable";
    uint64_t v58 = [v68 localizedStringForKey:@"CYCLING_FUNCTIONAL_THRESHOLD_POWER_TEST_TYPE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    uint64_t v69 = [v6 unsignedIntegerValue];
    objc_msgSend(NSString, "stringWithFormat:", @"CYCLING_FUNCTIONAL_THRESHOLD_POWER_TEST_%ld", v69);
    goto LABEL_68;
  }
  uint64_t v72 = *MEMORY[0x1E4F2A148];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A148]])
  {
    v73 = [*(id *)(*(void *)(a1 + 32) + 8) metadata];
    uint64_t v74 = *MEMORY[0x1E4F2BB28];
    v13 = [v73 objectForKey:*MEMORY[0x1E4F2BB28]];

    v75 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v76 = v75;
    if (v13)
    {
      v15 = [v75 localizedStringForKey:v74 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v17 = [NSString stringWithFormat:@"HEART_RATE_CONTEXT_%@", v13];
      uint64_t v77 = [v13 integerValue];
      if (v77 == 9)
      {
        v260 = *(void **)(a1 + 40);
        v79 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v80 = [v79 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
        v94 = HKConditionallyRedactedHeartRhythmString();
        v274[0] = v72;
        v274[1] = @"StreamingECG";
        v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v274 count:2];
        v96 = HKUIJoinStringsForAutomationIdentifier(v95);
        [v260 addText:v94 detail:v15 baseIdentifier:v96];

LABEL_93:
        v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v78 = *(void **)(a1 + 40);
      if (v77 == 10)
      {
        v79 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v80 = [v79 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
        v275[0] = v72;
        v275[1] = @"OxygenSaturation";
        v81 = (void *)MEMORY[0x1E4F1C978];
        v82 = v275;
      }
      else
      {
        v79 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v80 = [v79 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v273[0] = v72;
        v273[1] = @"HeartRateContext";
        v81 = (void *)MEMORY[0x1E4F1C978];
        v82 = v273;
      }
    }
    else
    {
      v15 = [v75 localizedStringForKey:v72 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v17 = [NSString stringWithFormat:@"HEART_RATE_MOTION_CONTEXT_%@", v6];
      v78 = *(void **)(a1 + 40);
      v79 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v80 = [v79 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v272[0] = v72;
      v272[1] = @"Sample";
      v81 = (void *)MEMORY[0x1E4F1C978];
      v82 = v272;
    }
    v94 = [v81 arrayWithObjects:v82 count:2];
    v95 = HKUIJoinStringsForAutomationIdentifier(v94);
    [v78 addText:v80 detail:v15 baseIdentifier:v95];
    goto LABEL_93;
  }
  uint64_t v83 = *MEMORY[0x1E4F2BAA0];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2BAA0]])
  {
    v84 = [*(id *)(a1 + 32) _mediaSourceDisplayNamesForSample:*(void *)(*(void *)(a1 + 32) + 8)];
    if (v84)
    {
      v85 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v86 = [v85 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v87 = *(void **)(a1 + 40);
      v271[0] = v83;
      v271[1] = @"Sample";
      v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v271 count:2];
      v89 = HKUIJoinStringsForAutomationIdentifier(v88);
      [v87 addText:v84 detail:v86 baseIdentifier:v89];
    }
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F2A1F0]] & 1) == 0
    && ![v5 isEqualToString:*MEMORY[0x1E4F2A1F8]])
  {
    if ([(id)MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean containsObject:v5])
    {
      id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if ([v6 BOOLValue]) {
        v93 = @"YES";
      }
      else {
        v93 = @"NO";
      }
      uint64_t v47 = [v7 localizedStringForKey:v93 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      goto LABEL_52;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A0C8]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v97 = (void *)MEMORY[0x1E4F2B618];
        id v98 = v6;
        id v7 = [v97 decibelAWeightedSoundPressureLevelUnit];
        [v98 doubleValueForUnit:v7];
        double v100 = v99;

        v101 = [*(id *)(*(void *)(a1 + 32) + 16) healthStore];
        v102 = +[HKDisplayTypeController sharedInstanceForHealthStore:v101];
        id v8 = [v102 displayTypeWithIdentifier:&unk_1F3C227E0];

        v103 = [NSNumber numberWithDouble:v100];
        v27 = HKFormattedStringFromValue(v103, v8, *(void **)(*(void *)(a1 + 32) + 16), 0, 0);

        v104 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v105 = [v104 localizedStringForKey:@"SPL_DECIBEL_UNIT_LONG_FORM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

        v10 = HKFormatValueAndUnit(v27, v105);

LABEL_32:
        goto LABEL_9;
      }
    }
    if (([v5 isEqualToString:*MEMORY[0x1E4F2A118]] & 1) != 0
      || [v5 isEqualToString:*MEMORY[0x1E4F2A120]])
    {
      v106 = [*(id *)(*(void *)(a1 + 32) + 16) healthStore];
      v107 = +[HKDisplayTypeController sharedInstanceForHealthStore:v106];
      uint64_t v108 = [v107 displayTypeWithIdentifier:&unk_1F3C227F8];

      v261 = (void *)v108;
      v109 = [*(id *)(*(void *)(a1 + 32) + 16) unitForDisplayType:v108];
      v110 = [MEMORY[0x1E4F2B618] mileUnit];
      if ([v109 isEqual:v110]) {
        [MEMORY[0x1E4F2B618] footUnit];
      }
      else {
      v111 = [MEMORY[0x1E4F2B618] meterUnit];
      }

      v112 = [MEMORY[0x1E4F2B618] mileUnit];
      int v113 = [v109 isEqual:v112];
      v114 = @"METERS_NUMBERLESS_UNIT";
      if (v113) {
        v114 = @"FEET_NUMBERLESS_UNIT";
      }
      v115 = v114;

      if ([v6 isCompatibleWithUnit:v111])
      {
        [v6 doubleValueForUnit:v111];
        uint64_t v117 = v116;
        v118 = objc_msgSend(NSNumber, "numberWithDouble:");
        v256 = HKLocalizedStringForNumberWithDecimalPrecision(v118, 2, 0);

        v119 = NSString;
        v120 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v121 = [v120 localizedStringForKey:v115 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v122 = objc_msgSend(v119, "localizedStringWithFormat:", v121, v117);

        v10 = HKFormatValueAndUnit(v256, v122);
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_11;
    }
    uint64_t v123 = *MEMORY[0x1E4F2BAD0];
    if ([v5 isEqualToString:*MEMORY[0x1E4F2BAD0]])
    {
      v124 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v125 = [NSString stringWithFormat:@"BLOOD_OXYGEN_CONTEXT_%@", v6];
      v126 = [v124 localizedStringForKey:v125 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];

      v127 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v128 = [v127 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];

      v129 = *(void **)(a1 + 40);
      v270[0] = v123;
      v270[1] = @"Sample";
      v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v270 count:2];
      v131 = HKUIJoinStringsForAutomationIdentifier(v130);
      [v129 addText:v126 detail:v128 baseIdentifier:v131];

      goto LABEL_78;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A0E0]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v132 = v6;
        v133 = _HKBarometricPressureUnit();
        v134 = [MEMORY[0x1E4F2B618] inchesOfMercuryUnit];
        int v135 = [v133 isEqual:v134];

        v136 = @"HECTOPASCALS_NUMBERED_UNIT";
        if (v135) {
          v136 = @"INCHES_OF_MERCURY_NUMBERED_UNIT";
        }
        v262 = v136;
        if ([v132 isCompatibleWithUnit:v133])
        {
          if (v135) {
            uint64_t v137 = 2;
          }
          else {
            uint64_t v137 = 0;
          }
          [v132 doubleValueForUnit:v133];
          uint64_t v139 = v138;
          v140 = objc_msgSend(NSNumber, "numberWithDouble:");
          v141 = HKLocalizedStringForNumberWithDecimalPrecision(v140, v137, 0);

          v142 = NSString;
          v143 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v144 = [v143 localizedStringForKey:v262 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
          v145 = objc_msgSend(v142, "localizedStringWithFormat:", v144, v139);

          v10 = HKFormatValueAndUnit(v141, v145);
          v146 = [*(id *)(*(void *)(a1 + 32) + 8) sampleType];
          v147 = [v146 identifier];
          BOOL v11 = v147 == (void *)*MEMORY[0x1E4F2A868];
        }
        else
        {
          v10 = 0;
          BOOL v11 = 0;
        }

        goto LABEL_12;
      }
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A0A8]])
    {
      v148 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v149 = [v148 localizedStringForKey:@"ECG_ALGORITHM_VERSION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
      uint64_t v150 = HKConditionallyRedactedHeartRhythmString();

      BOOL v11 = 0;
      id v5 = (id)v150;
      goto LABEL_13;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2BBB0]]) {
      goto LABEL_57;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A218]])
    {
      v151 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v152 = v151;
      v153 = @"CARDIO_FITNESS_VALUE";
LABEL_128:
      uint64_t v63 = [v151 localizedStringForKey:v153 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];

      uint64_t v64 = [*(id *)(a1 + 32) _formattedValueTextForVO2MaxQuantityObject:v6 key:v63 section:*(void *)(a1 + 40)];
      goto LABEL_62;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A190]])
    {
      v151 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v152 = v151;
      v153 = @"CARDIO_FITNESS_NOTIFICATION_THRESHOLD";
      goto LABEL_128;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2BBF8]])
    {
      v154 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v155 = v154;
      v156 = @"CARDIO_FITNESS_RELATED_MEDICATIONS";
      v157 = @"HealthUI-Localizable-CardioFitness";
LABEL_131:
      uint64_t v158 = [v154 localizedStringForKey:v156 value:&stru_1F3B9CF20 table:v157];

      v159 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if ([v6 BOOLValue]) {
        v160 = @"YES";
      }
      else {
        v160 = @"NO";
      }
      v10 = [v159 localizedStringForKey:v160 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      BOOL v11 = 0;
      id v5 = (id)v158;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A110]])
    {
      [NSString stringWithFormat:@"DEVICE_PLACEMENT_SIDE_%@", v6];
      goto LABEL_7;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A090]])
    {
      uint64_t v161 = [v6 stringValue];
LABEL_139:
      v10 = (void *)v161;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A0C0]])
    {
      v162 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v63 = [v162 localizedStringForKey:@"IRN_ALGORITHM_VERSION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-IRN2"];

      uint64_t v64 = [v6 stringValue];
      goto LABEL_62;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A1B8]])
    {
      v154 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v155 = v154;
      v156 = @"METADATA_TITLE_QUANTITY_CLAMPED_TO_LOWER_BOUND";
      v157 = @"HealthUI-Localizable-AFibBurden";
      goto LABEL_131;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A108]])
    {
      uint64_t v161 = HKLocalizedStringForDateAndTemplate(v6, 10);
      goto LABEL_139;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A168]])
    {
      v163 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v66 = @"HealthUI-Localizable-Lyon";
      uint64_t v58 = [v163 localizedStringForKey:@"HEART_RATE_RECOVERY_TEST_TYPE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Lyon"];

      [NSString stringWithFormat:@"HEART_RATE_RECOVERY_TEST_TYPE_%@", v6];
      goto LABEL_68;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A158]])
    {
      v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v60 = v59;
      v61 = @"HEART_RATE_RECOVERY_ACTIVITY_TYPE";
      v62 = @"HealthUI-Localizable-Lyon";
LABEL_60:
      uint64_t v63 = [v59 localizedStringForKey:v61 value:&stru_1F3B9CF20 table:v62];

      [v6 unsignedIntegerValue];
      if (_HKWorkoutActivityTypeIsValid())
      {
        uint64_t v64 = HKUILocalizedWorkoutTypeName();
LABEL_62:
        v10 = (void *)v64;
LABEL_63:
        BOOL v11 = 0;
        id v5 = (id)v63;
        goto LABEL_12;
      }
LABEL_171:
      BOOL v11 = 0;
      id v5 = (id)v63;
      goto LABEL_13;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F2A150]])
    {
      v164 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v63 = [v164 localizedStringForKey:@"HEART_RATE_RECOVERY_ACTIVITY_DURATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Lyon"];

      v165 = [MEMORY[0x1E4F2B618] secondUnit];
      id v166 = v6;
      if ([v166 isCompatibleWithUnit:v165])
      {
        v167 = NSNumber;
        v168 = [MEMORY[0x1E4F2B618] secondUnit];
        [v166 doubleValueForUnit:v168];
        v169 = objc_msgSend(v167, "numberWithDouble:");

        v170 = objc_alloc_init(HKWorkoutDurationNumberFormatter);
        [(HKTimePeriodWithSecondsNumberFormatter *)v170 setAllowMillisecondPrecision:1];
        v10 = [(HKTimePeriodWithSecondsNumberFormatter *)v170 stringFromNumber:v169 displayType:0 unitController:0];

LABEL_157:
        goto LABEL_158;
      }
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x1E4F2A160]])
      {
        if ([v5 isEqualToString:*MEMORY[0x1E4F2A208]])
        {
          v178 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v66 = @"HealthUI-Localizable";
          uint64_t v58 = [v178 localizedStringForKey:@"USER_MOTION_CONTEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

          [NSString stringWithFormat:@"USER_MOTION_CONTEXT_%@", v6];
          goto LABEL_68;
        }
        if (![v5 isEqualToString:*MEMORY[0x1E4F2A1D0]])
        {
          if ([v5 isEqualToString:*MEMORY[0x1E4F2BBC8]])
          {
            v180 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
            uint64_t v263 = [v180 localizedStringForKey:@"SKIN_SURFACE_TEMPERATURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

            v181 = [*(id *)(*(void *)(a1 + 32) + 16) healthStore];
            v182 = +[HKDisplayTypeController sharedInstanceForHealthStore:v181];
            uint64_t v183 = [v182 displayTypeWithIdentifier:&unk_1F3C22810];

            v257 = (void *)v183;
            v184 = [*(id *)(*(void *)(a1 + 32) + 16) unitForDisplayType:v183];
            v185 = [MEMORY[0x1E4F2B618] degreeFahrenheitUnit];
            int v186 = [v184 isEqual:v185];
            v187 = @"DEGREES_CELSIUS_NUMBERED_UNIT";
            if (v186) {
              v187 = @"DEGREES_FAHRENHEIT_NUMBERED_UNIT";
            }
            v188 = v187;

            id v189 = v6;
            if ([v189 isCompatibleWithUnit:v184])
            {
              [v189 doubleValueForUnit:v184];
              uint64_t v191 = v190;
              v192 = objc_msgSend(NSNumber, "numberWithDouble:");
              v193 = HKLocalizedStringForNumberWithDecimalPrecision(v192, 2, 0);

              v194 = NSString;
              v195 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              v196 = [v195 localizedStringForKey:v188 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
              v197 = objc_msgSend(v194, "localizedStringWithFormat:", v196, v191);

              v10 = HKFormatValueAndUnit(v193, v197);
            }
            else
            {
              v10 = 0;
            }

            BOOL v11 = 0;
            id v5 = (id)v263;
          }
          else
          {
            if ([v5 isEqualToString:*MEMORY[0x1E4F2BB58]])
            {
              v198 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
              uint64_t v63 = [v198 localizedStringForKey:@"INTERNAL_LIVEON_ALGORITHM_VERSION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

              goto LABEL_171;
            }
            if (![v5 isEqualToString:*MEMORY[0x1E4F2A1C0]])
            {
              if ([v5 isEqualToString:*MEMORY[0x1E4F2A230]])
              {
                v206 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                v66 = @"HealthUI-Localizable";
                uint64_t v58 = [v206 localizedStringForKey:@"WATER_SALINITY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

                [NSString stringWithFormat:@"WATER_SALINITY_%@", v6];
                goto LABEL_68;
              }
              uint64_t v207 = *MEMORY[0x1E4F2BB08];
              if ([v5 isEqualToString:*MEMORY[0x1E4F2BB08]])
              {
                v208 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                uint64_t v209 = [v208 localizedStringForKey:@"TAKEN_WITH_CONGESTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

                v210 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                if ([v6 BOOLValue]) {
                  v211 = @"YES";
                }
                else {
                  v211 = @"NO";
                }
                uint64_t v212 = [v210 localizedStringForKey:v211 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

                v213 = *(void **)(a1 + 40);
                uint64_t v269 = v207;
                v214 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v269 count:1];
                v215 = HKUIJoinStringsForAutomationIdentifier(v214);
                v258 = (void *)v212;
                v264 = (void *)v209;
                [v213 addText:v212 detail:v209 baseIdentifier:v215];

                v216 = [*(id *)(*(void *)(a1 + 32) + 8) metadata];
                uint64_t v217 = *MEMORY[0x1E4F2BB18];
                v218 = [v216 objectForKey:*MEMORY[0x1E4F2BB18]];

                if (v218)
                {
                  v219 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  v220 = [v219 localizedStringForKey:@"TAKEN_WITH_RECENT_LOUD_EXPOSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

                  v221 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  if ([v218 BOOLValue]) {
                    v222 = @"YES";
                  }
                  else {
                    v222 = @"NO";
                  }
                  v223 = [v221 localizedStringForKey:v222 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

                  v224 = *(void **)(a1 + 40);
                  uint64_t v268 = v217;
                  v225 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v268 count:1];
                  v226 = HKUIJoinStringsForAutomationIdentifier(v225);
                  [v224 addText:v223 detail:v220 baseIdentifier:v226];
                }
              }
              else
              {
                uint64_t v227 = *MEMORY[0x1E4F2BB10];
                if (![v5 isEqualToString:*MEMORY[0x1E4F2BB10]]) {
                  goto LABEL_78;
                }
                v228 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                uint64_t v229 = [v228 localizedStringForKey:@"AUDIOGRAM_LEFT_EAR_NOISE_LEVEL_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];

                v230 = NSNumber;
                [v6 doubleValue];
                v231 = objc_msgSend(v230, "numberWithDouble:");
                uint64_t v232 = HKLocalizedStringForNumberWithDecimalPrecision(v231, 0, 0);

                id v233 = [NSString alloc];
                v234 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                v235 = [v234 localizedStringForKey:@"AUDIOGRAM_EAR_NOISE_LEVEL_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
                v258 = (void *)v232;
                uint64_t v236 = objc_msgSend(v233, "initWithFormat:", v235, v232);

                v237 = *(void **)(a1 + 40);
                uint64_t v267 = v227;
                v238 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
                v239 = HKUIJoinStringsForAutomationIdentifier(v238);
                v255 = (void *)v236;
                v264 = (void *)v229;
                [v237 addText:v236 detail:v229 baseIdentifier:v239];

                v240 = [*(id *)(*(void *)(a1 + 32) + 8) metadata];
                uint64_t v241 = *MEMORY[0x1E4F2BB20];
                v242 = [v240 objectForKey:*MEMORY[0x1E4F2BB20]];

                if (v242)
                {
                  v243 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  v244 = [v243 localizedStringForKey:@"AUDIOGRAM_RIGHT_EAR_NOISE_LEVEL_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];

                  v245 = NSNumber;
                  [v242 doubleValue];
                  v246 = objc_msgSend(v245, "numberWithDouble:");
                  v247 = HKLocalizedStringForNumberWithDecimalPrecision(v246, 0, 0);

                  id v248 = [NSString alloc];
                  v249 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
                  v250 = [v249 localizedStringForKey:@"AUDIOGRAM_EAR_NOISE_LEVEL_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
                  v251 = objc_msgSend(v248, "initWithFormat:", v250, v247);

                  v252 = *(void **)(a1 + 40);
                  uint64_t v266 = v241;
                  v253 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v266 count:1];
                  v254 = HKUIJoinStringsForAutomationIdentifier(v253);
                  [v252 addText:v251 detail:v244 baseIdentifier:v254];
                }
              }

              goto LABEL_78;
            }
            v199 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
            if ([v6 BOOLValue]) {
              v200 = @"YES";
            }
            else {
              v200 = @"NO";
            }
            v10 = [v199 localizedStringForKey:v200 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

            v201 = [*(id *)(*(void *)(a1 + 32) + 8) sampleType];
            v202 = [v201 identifier];
            int v203 = [v202 isEqualToString:*MEMORY[0x1E4F2A910]];

            if (!v203) {
              goto LABEL_11;
            }
            v204 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
            uint64_t v205 = [v204 localizedStringForKey:@"BEYOND_MAXIMUM_DEPTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Charon"];

            BOOL v11 = 0;
            id v5 = (id)v205;
          }
LABEL_12:
          if (v10) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        v179 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v63 = [v179 localizedStringForKey:@"SESSION_ESTIMATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_171;
        }
        v165 = [*(id *)(*(void *)(a1 + 32) + 8) sampleType];
        v10 = [v6 localizedStringForType:v165];
LABEL_158:

        goto LABEL_63;
      }
      v171 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v63 = [v171 localizedStringForKey:@"HEART_RATE_RECOVERY_MAX_OBSERVED_HEART_RATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Lyon"];

      v165 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
      id v166 = v6;
      if ([v166 isCompatibleWithUnit:v165])
      {
        [v166 doubleValueForUnit:v165];
        v172 = objc_msgSend(NSNumber, "numberWithDouble:");
        v173 = HKLocalizedStringForNumberWithDecimalPrecision(v172, 0, 0);

        v174 = NSString;
        v175 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v176 = [v175 localizedStringForKey:@"BEATS_PER_MINUTE_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v177 = objc_msgSend(v174, "localizedStringWithFormat:", v176, 0);

        v10 = HKFormatValueAndUnit(v173, v177);

        goto LABEL_157;
      }
    }
    v10 = 0;
    goto LABEL_157;
  }
  v90 = [*(id *)(*(void *)(a1 + 32) + 8) sourceRevision];
  v91 = [v90 source];
  char v92 = [v91 _hasFirstPartyBundleID];

  if (v92) {
    goto LABEL_57;
  }
LABEL_78:
  BOOL v11 = 0;
LABEL_13:
  v10 = [v6 description];
LABEL_14:
  if ((_HKMetadataKeyIsPrivate() & 1) == 0)
  {
    objc_super v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = [v12 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v14 = [*(id *)(*(void *)(a1 + 32) + 8) sampleType];
    v15 = [v14 identifier];

    v265[0] = v15;
    v265[1] = v5;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v265 count:2];
    v17 = HKUIJoinStringsForAutomationIdentifier(v16);

    [*(id *)(a1 + 40) addText:v10 detail:v13 baseIdentifier:v17];
    if (v11) {
      [*(id *)(a1 + 32) addAdditionalOxygenSaturationDetailValuesToSection:*(void *)(a1 + 40) key:v5 value:v6];
    }
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __53__HKDataMetadataDataSource_addDetailValuesToSection___block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2A228], *MEMORY[0x1E4F2A178], *MEMORY[0x1E4F2A0F8], *MEMORY[0x1E4F2A220], *MEMORY[0x1E4F2A138], *MEMORY[0x1E4F2A1A8], *MEMORY[0x1E4F2A1D8], *MEMORY[0x1E4F2A0A0], *MEMORY[0x1E4F2A0B8], 0);
  uint64_t v1 = MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean;
  MACancelDownloadErrorDomain_block_invoke___metadataKeysExpectingBoolean = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_formattedValueTextForVO2MaxQuantityObject:(id)a3 key:(id)a4 section:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    uint64_t v9 = [v7 displayTypeController];
    v10 = [v9 displayTypeWithIdentifier:&unk_1F3C22828];

    BOOL v11 = [v7 unitController];
    objc_super v12 = [v11 unitForDisplayType:v10];
    [v8 doubleValueForUnit:v12];
    double v14 = v13;
    v15 = [v10 presentation];
    v16 = [NSNumber numberWithDouble:v14];
    v17 = [v15 adjustedValueForDaemonValue:v16];

    v18 = HKFormattedStringFromValueForContext(v17, v10, v11, 0, 0, 1);
    if (HKFormatterIncludesUnitForDisplayTypeInContext(v10, 1, v11))
    {
      id v19 = v18;
    }
    else
    {
      uint64_t v20 = [v11 localizedDisplayNameForDisplayType:v10 value:v17 nameContext:3];
      HKFormatValueAndUnit(v18, v20);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)addAdditionalOxygenSaturationDetailValuesToSection:(id)a3 key:(id)a4 value:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([a4 isEqualToString:*MEMORY[0x1E4F2A0E0]])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v10 = [v9 localizedStringForKey:@"SCANDIUM_OVERLAY_LOW_AIR_PRESSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];

      id v11 = v8;
      objc_super v12 = HKOxygenSaturationLowBarometricPressureThresholdQuantity();
      int v13 = objc_msgSend(v11, "hk_isGreaterThanQuantity:", v12);

      double v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v15 = v14;
      if (v13) {
        v16 = @"NO";
      }
      else {
        v16 = @"YES";
      }
      v17 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      v20[0] = *MEMORY[0x1E4F2A868];
      v20[1] = @"HighElevationEnvironment";
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      id v19 = HKUIJoinStringsForAutomationIdentifier(v18);
      [v7 addText:v17 detail:v10 baseIdentifier:v19];
    }
  }
}

- (id)_mediaSourceDisplayNamesForSample:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(HKSample *)self->_sample metadata];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F2BAA0]];
  id v5 = [v4 componentsSeparatedByString:@","];

  if (![v5 count])
  {
    uint64_t v24 = 0;
    goto LABEL_21;
  }
  v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  unint64_t v8 = 0x1E4F28000;
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v9 = v7;
  v29 = v5;
  char v10 = 0;
  char v11 = 0;
  uint64_t v12 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v33 != v12) {
        objc_enumerationMutation(v6);
      }
      double v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v16 = [v14 stringByTrimmingCharactersInSet:v15];

      uint64_t v31 = 0;
      v17 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v16 allowPlaceholder:1 error:&v31];
      v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 localizedName];
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          [v30 addObject:v19];
        }
      }
      else
      {
        char v21 = [v16 isEqualToString:@"com.apple.WebKit.WebContent"];
        v10 |= v21;
        v11 |= v21 ^ 1;
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v9);

  if (v10)
  {
    unint64_t v8 = 0x1E4F28000uLL;
    int v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = [v22 localizedStringForKey:@"MEDIA_SOURCE_WEB_CONTENT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v30 addObject:v23];

    id v5 = v29;
    if ((v11 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  id v5 = v29;
  unint64_t v8 = 0x1E4F28000uLL;
  if (v11)
  {
LABEL_18:
    id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v25 = [v6 localizedStringForKey:@"MEDIA_SOURCE_OTHER_SOURCE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v30 addObject:v25];

LABEL_19:
  }
LABEL_20:
  v26 = [*(id *)(v8 + 2896) bundleWithIdentifier:@"com.apple.HealthUI"];
  v27 = [v26 localizedStringForKey:@"CHART_COMMA_SEPARATOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v24 = [v30 componentsJoinedByString:v27];

LABEL_21:
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end