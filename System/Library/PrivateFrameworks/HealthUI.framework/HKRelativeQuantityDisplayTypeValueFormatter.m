@interface HKRelativeQuantityDisplayTypeValueFormatter
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6;
@end

@implementation HKRelativeQuantityDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  BOOL v10 = a8;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  [v16 doubleValue];
  if (v23 == 1.79769313e308)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
    v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    [v24 localizedStringForKey:@"ESTABLISHING_BASELINE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
    id v25 = v21;
    id v26 = v22;
    id v27 = v20;
    id v28 = v18;
    v30 = id v29 = v17;
    uint64_t v46 = *MEMORY[0x1E4FB06F8];
    v47[0] = v19;
    v31 = (void *)MEMORY[0x1E4F1C9E8];
    v32 = (id *)v47;
    v33 = &v46;
LABEL_5:
    [v31 dictionaryWithObjects:v32 forKeys:v33 count:1];
    id v35 = v16;
    v37 = id v36 = v19;
    id v42 = (id)[v41 initWithString:v30 attributes:v37];

    id v19 = v36;
    id v16 = v35;

    id v17 = v29;
    id v18 = v28;
    id v20 = v27;
    id v22 = v26;
    id v21 = v25;

    goto LABEL_6;
  }
  [v16 doubleValue];
  if (v34 == -1.79769313e308)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
    v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    [v24 localizedStringForKey:@"NOT_ENOUGH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
    id v25 = v21;
    id v26 = v22;
    id v27 = v20;
    id v28 = v18;
    v30 = id v29 = v17;
    uint64_t v44 = *MEMORY[0x1E4FB06F8];
    id v45 = v19;
    v31 = (void *)MEMORY[0x1E4F1C9E8];
    v32 = &v45;
    v33 = &v44;
    goto LABEL_5;
  }
  if (!v21)
  {
    [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v40 = id v39 = v19;
    id v21 = [v40 localizedStringForKey:@"%@_DEGREES_FROM_BASELINE_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

    id v19 = v39;
  }
  v43.receiver = self;
  v43.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
  id v42 = [(HKQuantityDisplayTypeValueFormatter *)&v43 attributedStringFromValue:v16 displayType:v17 unitController:v18 valueFont:v19 unitFont:v20 formatForChart:v10 unitFormatString:v21 formatString:v22];
LABEL_6:

  return v42;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 doubleValue];
  if (v14 == 1.79769313e308)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v16 = v15;
    id v17 = @"ESTABLISHING_BASELINE";
LABEL_5:
    id v19 = [v15 localizedStringForKey:v17 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

    goto LABEL_6;
  }
  [v10 doubleValue];
  if (v18 == -1.79769313e308)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v16 = v15;
    id v17 = @"NOT_ENOUGH_DATA";
    goto LABEL_5;
  }
  v21.receiver = self;
  v21.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
  id v19 = [(HKQuantityDisplayTypeValueFormatter *)&v21 stringFromValue:v10 displayType:v11 unitController:v12 formatString:v13];
LABEL_6:

  return v19;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 doubleValue];
  if (v11 == 1.79769313e308)
  {
    id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v13 = v12;
    double v14 = @"ESTABLISHING_BASELINE";
LABEL_5:
    id v16 = [v12 localizedStringForKey:v14 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

    goto LABEL_6;
  }
  [v8 doubleValue];
  if (v15 == -1.79769313e308)
  {
    id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v13 = v12;
    double v14 = @"NOT_ENOUGH_DATA";
    goto LABEL_5;
  }
  v18.receiver = self;
  v18.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
  id v16 = [(HKQuantityDisplayTypeValueFormatter *)&v18 stringFromValue:v8 displayType:v9 unitController:v10];
LABEL_6:

  return v16;
}

@end