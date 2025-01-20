@interface HKActivitySummary(ActivitySharing)
- (id)_moveStringWithFont:()ActivitySharing smallCapsFont:color:formattingManager:snapshot:;
- (id)as_distanceStringWithContext:()ActivitySharing formattingManager:distanceUnitFormat:;
- (id)as_exerciseDurationStringWithContext:()ActivitySharing;
- (id)as_exerciseProgressStringWithContext:()ActivitySharing;
- (id)as_movePercentStringWithContext:()ActivitySharing snapshot:;
- (id)as_moveProgressStringWithContext:()ActivitySharing formattingManager:snapshot:;
- (id)as_moveStringWithContext:()ActivitySharing formattingManager:snapshot:;
- (id)as_pushesStringWithContext:()ActivitySharing;
- (id)as_stepsStringWithContext:()ActivitySharing;
- (uint64_t)_isEmptyExerciseSummary;
- (uint64_t)_isEmptyMoveSummaryForSnapshot:()ActivitySharing;
- (uint64_t)as_distanceStringWithContext:()ActivitySharing formattingManager:;
@end

@implementation HKActivitySummary(ActivitySharing)

- (id)as_movePercentStringWithContext:()ActivitySharing snapshot:
{
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 keyColorForDisplayMode:1];
  if ([a1 _isEmptyMoveSummaryForSnapshot:v6])
  {
    v9 = ActivitySharingBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"LIST_VIEW_EMPTY_VALUE" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    int v11 = [v6 isAmm];
    v12 = (void *)MEMORY[0x263F3F170];
    v13 = NSNumber;
    if (v11) {
      [v6 mmPercent];
    }
    else {
      [v6 energyBurnedGoalPercentage];
    }
    v9 = objc_msgSend(v13, "numberWithDouble:");
    uint64_t v10 = [v12 percentStringWithNumber:v9];
  }
  v14 = (void *)v10;

  id v15 = objc_alloc(MEMORY[0x263F089B8]);
  v20[0] = *MEMORY[0x263F814F0];
  v16 = [v7 multilineDataFont];

  v20[1] = *MEMORY[0x263F81500];
  v21[0] = v16;
  v21[1] = v8;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18 = (void *)[v15 initWithString:v14 attributes:v17];

  return v18;
}

- (id)_moveStringWithFont:()ActivitySharing smallCapsFont:color:formattingManager:snapshot:
{
  v53[2] = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v51 = a5;
  id v12 = a6;
  id v13 = a7;
  id v49 = a4;
  v48 = v12;
  if ([v13 isAmm])
  {
    v14 = (void *)MEMORY[0x263F3F170];
    id v15 = NSNumber;
    v16 = [v13 mmvQuantity];
    v17 = [MEMORY[0x263F0A830] minuteUnit];
    [v16 doubleValueForUnit:v17];
    v18 = objc_msgSend(v15, "numberWithDouble:");
    uint64_t v19 = [v14 stringWithNumber:v18 decimalPrecision:1];

    v20 = (void *)MEMORY[0x263F3F170];
    v21 = NSNumber;
    v22 = [v13 mmgQuantity];
    v23 = [MEMORY[0x263F0A830] minuteUnit];
    [v22 doubleValueForUnit:v23];
    v24 = objc_msgSend(v21, "numberWithDouble:");
    v25 = [v20 stringWithNumber:v24 decimalPrecision:1];

    v26 = ActivitySharingBundle();
    [v26 localizedStringForKey:@"MIN" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    v27 = [a1 activeEnergyBurned];
    uint64_t v19 = [v12 localizedStringWithActiveEnergy:v27];

    v28 = [a1 activeEnergyBurnedGoal];
    v25 = [v12 localizedStringWithActiveEnergy:v28];

    v26 = [v12 localizedShortActiveEnergyUnitString];
    [v26 localizedUppercaseString];
  v29 = };

  char v30 = [a1 _isEmptyMoveSummaryForSnapshot:v13];
  if (v30)
  {
    v31 = ActivitySharingBundle();
    [v31 localizedStringForKey:@"LIST_VIEW_EMPTY_RATIO" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    v32 = NSString;
    v31 = ASActivitySummaryGoalFormatString();
    objc_msgSend(v32, "stringWithFormat:", v31, v19, v25, v29, v12);
  v33 = };
  v34 = (void *)v19;

  id v35 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v37 = *MEMORY[0x263F81500];
  v52[0] = *MEMORY[0x263F814F0];
  uint64_t v36 = v52[0];
  v52[1] = v37;
  v53[0] = v50;
  v53[1] = v51;
  v38 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
  v39 = (void *)[v35 initWithString:v33 attributes:v38];

  v40 = objc_msgSend(v50, "fu_shortSlashFont");
  v41 = [v39 string];
  uint64_t v42 = [v41 rangeOfString:@"/"];
  objc_msgSend(v39, "addAttribute:value:range:", v36, v40, v42, v43);

  v44 = [v39 string];
  uint64_t v45 = [v44 rangeOfString:v29];
  objc_msgSend(v39, "addAttribute:value:range:", v36, v49, v45, v46);

  return v39;
}

- (uint64_t)_isEmptyMoveSummaryForSnapshot:()ActivitySharing
{
  id v4 = a3;
  char v5 = [a1 isPaused];
  uint64_t v6 = 1;
  if (v4 && (v5 & 1) == 0)
  {
    id v7 = [a1 activeEnergyBurned];
    if ([v7 _isZero])
    {
      v8 = [a1 activeEnergyBurnedGoal];
      if ([v8 _isZero])
      {
        v9 = [v4 mmvQuantity];
        if ([v9 _isZero])
        {
          uint64_t v10 = [v4 mmgQuantity];
          uint64_t v6 = [v10 _isZero];
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)as_moveProgressStringWithContext:()ActivitySharing formattingManager:snapshot:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [v10 keyColorForDisplayMode:1];
  id v12 = [v10 multilineDataFont];
  id v13 = [v10 multilineUnitFont];

  v14 = [a1 _moveStringWithFont:v12 smallCapsFont:v13 color:v11 formattingManager:v9 snapshot:v8];

  return v14;
}

- (id)as_moveStringWithContext:()ActivitySharing formattingManager:snapshot:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [v10 dataFont];
  id v12 = [v10 unitFont];
  id v13 = [v10 keyColorForDisplayMode:1];

  v14 = [a1 _moveStringWithFont:v11 smallCapsFont:v12 color:v13 formattingManager:v9 snapshot:v8];

  return v14;
}

- (id)as_exerciseDurationStringWithContext:()ActivitySharing
{
  v40[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38 = [v4 keyColorForDisplayMode:2];
  char v5 = NSNumber;
  uint64_t v6 = [a1 appleExerciseTime];
  id v7 = [MEMORY[0x263F0A830] minuteUnit];
  [v6 doubleValueForUnit:v7];
  uint64_t v8 = objc_msgSend(v5, "numberWithDouble:");

  uint64_t v37 = (void *)v8;
  uint64_t v9 = [MEMORY[0x263F3F170] stringWithNumber:v8 decimalPrecision:1];
  id v10 = NSNumber;
  int v11 = [a1 appleExerciseTimeGoal];
  id v12 = [MEMORY[0x263F0A830] minuteUnit];
  [v11 doubleValueForUnit:v12];
  uint64_t v13 = objc_msgSend(v10, "numberWithDouble:");

  uint64_t v36 = (void *)v13;
  v14 = [MEMORY[0x263F3F170] stringWithNumber:v13 decimalPrecision:1];
  id v15 = ActivitySharingBundle();
  v16 = [v15 localizedStringForKey:@"MIN" value:&stru_26E8035F0 table:@"Localizable"];

  id v35 = (void *)v9;
  if ([a1 _isEmptyExerciseSummary])
  {
    v17 = ActivitySharingBundle();
    [v17 localizedStringForKey:@"LIST_VIEW_EMPTY_RATIO" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    v18 = NSString;
    v17 = ASActivitySummaryGoalFormatString();
    objc_msgSend(v18, "stringWithFormat:", v17, v9, v14, v16, v9);
  uint64_t v19 = };

  id v20 = objc_alloc(MEMORY[0x263F089B8]);
  v39[0] = *MEMORY[0x263F814F0];
  uint64_t v21 = v39[0];
  v22 = [v4 multilineDataFont];
  v39[1] = *MEMORY[0x263F81500];
  v40[0] = v22;
  v40[1] = v38;
  v23 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  v24 = (void *)[v20 initWithString:v19 attributes:v23];

  v25 = [v4 multilineDataFont];
  v26 = objc_msgSend(v25, "fu_shortSlashFont");
  v27 = [v24 string];
  uint64_t v28 = [v27 rangeOfString:@"/"];
  objc_msgSend(v24, "addAttribute:value:range:", v21, v26, v28, v29);

  char v30 = [v4 multilineUnitFont];

  v31 = [v24 string];
  uint64_t v32 = [v31 rangeOfString:v16];
  objc_msgSend(v24, "addAttribute:value:range:", v21, v30, v32, v33);

  return v24;
}

- (id)as_exerciseProgressStringWithContext:()ActivitySharing
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 keyColorForDisplayMode:2];
  if ([a1 _isEmptyExerciseSummary])
  {
    uint64_t v6 = ActivitySharingBundle();
    [v6 localizedStringForKey:@"LIST_VIEW_EMPTY_VALUE" value:&stru_26E8035F0 table:@"Localizable"];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F3F170];
    uint64_t v8 = NSNumber;
    [a1 _exerciseTimeCompletionPercentage];
    uint64_t v6 = objc_msgSend(v8, "numberWithDouble:");
    [v7 percentStringWithNumber:v6];
  uint64_t v9 = };

  id v10 = objc_alloc(MEMORY[0x263F089B8]);
  v15[0] = *MEMORY[0x263F814F0];
  int v11 = [v4 multilineDataFont];

  v15[1] = *MEMORY[0x263F81500];
  v16[0] = v11;
  v16[1] = v5;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v13 = (void *)[v10 initWithString:v9 attributes:v12];

  return v13;
}

- (id)as_stepsStringWithContext:()ActivitySharing
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 keyColorForDisplayMode:3];
  uint64_t v6 = NSNumber;
  id v7 = [a1 stepCount];
  uint64_t v8 = [MEMORY[0x263F0A830] countUnit];
  [v7 doubleValueForUnit:v8];
  uint64_t v9 = objc_msgSend(v6, "numberWithDouble:");

  id v10 = [MEMORY[0x263F3F170] stringWithNumber:v9 decimalPrecision:1];
  uint64_t v11 = [v9 integerValue];
  id v12 = NSString;
  uint64_t v13 = ActivitySharingBundle();
  v14 = [v13 localizedStringForKey:@"STEPS" value:&stru_26E8035F0 table:@"Localizable"];
  id v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11, v10);
  v16 = [v15 localizedUppercaseString];

  id v17 = objc_alloc(MEMORY[0x263F089B8]);
  v27[0] = *MEMORY[0x263F814F0];
  uint64_t v18 = v27[0];
  uint64_t v19 = [v4 multilineUnitFont];
  v27[1] = *MEMORY[0x263F81500];
  v28[0] = v19;
  v28[1] = v5;
  id v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v21 = (void *)[v17 initWithString:v16 attributes:v20];

  v22 = [v4 multilineDataFont];

  v23 = [v21 string];
  uint64_t v24 = [v23 rangeOfString:v10];
  objc_msgSend(v21, "addAttribute:value:range:", v18, v22, v24, v25);

  return v21;
}

- (uint64_t)as_distanceStringWithContext:()ActivitySharing formattingManager:
{
  return objc_msgSend(a1, "as_distanceStringWithContext:formattingManager:distanceUnitFormat:", a3, a4, 0);
}

- (id)as_distanceStringWithContext:()ActivitySharing formattingManager:distanceUnitFormat:
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 keyColorForDisplayMode:3];
  id v12 = [a1 distanceWalkingRunning];
  uint64_t v13 = [MEMORY[0x263F0A830] meterUnit];
  [v12 doubleValueForUnit:v13];
  double v15 = v14;

  uint64_t v40 = *MEMORY[0x263F81748];
  uint64_t v16 = *MEMORY[0x263F817B0];
  v37[0] = *MEMORY[0x263F817B8];
  v37[1] = v16;
  v38[0] = &unk_26E806D78;
  v38[1] = &unk_26E806D90;
  id v17 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v39 = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
  v41[0] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];

  id v20 = [v10 multilineDataFont];
  uint64_t v21 = [v20 fontDescriptor];
  v22 = [v21 fontDescriptorByAddingAttributes:v19];

  v23 = (void *)MEMORY[0x263F81708];
  uint64_t v24 = [v10 multilineDataFont];

  [v24 pointSize];
  uint64_t v25 = objc_msgSend(v23, "fontWithDescriptor:size:", v22);

  if (v9)
  {
    uint64_t v34 = 0;
    v26 = [v8 localizedNaturalScaleStringWithDistanceInMeters:1 distanceType:0 unitStyle:&v34 usedUnit:v15];
    v27 = [v8 localizedShortUnitStringForDistanceUnit:v34 textCase:2];
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", v9, v26, v27);
  }
  else
  {
    uint64_t v28 = [v8 localizedNaturalScaleStringWithDistanceInMeters:1 distanceType:2 unitStyle:0 usedUnit:v15];
  }
  id v29 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v30 = *MEMORY[0x263F81500];
  v35[0] = *MEMORY[0x263F814F0];
  v35[1] = v30;
  v36[0] = v25;
  v36[1] = v11;
  v31 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint64_t v32 = (void *)[v29 initWithString:v28 attributes:v31];

  return v32;
}

- (id)as_pushesStringWithContext:()ActivitySharing
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 keyColorForDisplayMode:5];
  uint64_t v6 = NSNumber;
  id v7 = [a1 _pushCount];
  id v8 = [MEMORY[0x263F0A830] countUnit];
  [v7 doubleValueForUnit:v8];
  id v9 = objc_msgSend(v6, "numberWithDouble:");

  id v10 = [MEMORY[0x263F3F170] stringWithNumber:v9 decimalPrecision:1];
  id v11 = objc_alloc(MEMORY[0x263F089B8]);
  v16[0] = *MEMORY[0x263F814F0];
  id v12 = [v4 dataFont];

  v16[1] = *MEMORY[0x263F81500];
  v17[0] = v12;
  v17[1] = v5;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  double v14 = (void *)[v11 initWithString:v10 attributes:v13];

  return v14;
}

- (uint64_t)_isEmptyExerciseSummary
{
  if ([a1 isPaused]) {
    return 1;
  }
  v3 = [a1 appleExerciseTime];
  if ([v3 _isZero])
  {
    id v4 = [a1 appleExerciseTimeGoal];
    uint64_t v2 = [v4 _isZero];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end