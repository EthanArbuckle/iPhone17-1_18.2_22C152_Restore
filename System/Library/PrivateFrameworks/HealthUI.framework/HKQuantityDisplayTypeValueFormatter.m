@interface HKQuantityDisplayTypeValueFormatter
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10;
- (id)attributedStringFromValue:(id)a3 unit:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10;
- (id)attributedStringFromValueString:(id)a3 valueFont:(id)a4 unitString:(id)a5 unitFont:(id)a6 unitIcon:(id)a7 formatForChart:(BOOL)a8 formatString:(id)a9;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6;
@end

@implementation HKQuantityDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  return [(HKQuantityDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:a8 unitFormatString:0];
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9
{
  BOOL v9 = a8;
  v16 = (void *)MEMORY[0x1E4F28B50];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [v16 bundleWithIdentifier:@"com.apple.HealthUI"];
  v24 = [v23 localizedStringForKey:@"QUANTITY_VALUE_FORMAT_STRING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v25 = [(HKQuantityDisplayTypeValueFormatter *)self attributedStringFromValue:v22 displayType:v21 unitController:v20 valueFont:v19 unitFont:v18 formatForChart:v9 unitFormatString:v17 formatString:v24];

  return v25;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  BOOL v30 = a8;
  id v15 = a4;
  id v16 = a9;
  v29 = self;
  numberFormatter = self->super._numberFormatter;
  id v18 = a10;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = HKFormattedStringFromValue(v22, v15, v21, 1, numberFormatter);
  v24 = [v21 localizedDisplayNameForDisplayType:v15 value:v22];

  if (v16)
  {
    uint64_t v25 = [NSString stringWithValidatedFormat:v16, @"%@", 0, v24 validFormatSpecifiers error];

    v24 = (void *)v25;
  }
  v26 = [v15 unitIcon];
  v27 = [(HKQuantityDisplayTypeValueFormatter *)v29 attributedStringFromValueString:v23 valueFont:v20 unitString:v24 unitFont:v19 unitIcon:v26 formatForChart:v30 formatString:v18];

  return v27;
}

- (id)attributedStringFromValueString:(id)a3 valueFont:(id)a4 unitString:(id)a5 unitFont:(id)a6 unitIcon:(id)a7 formatForChart:(BOOL)a8 formatString:(id)a9
{
  BOOL v9 = a8;
  id v14 = a4;
  id v15 = a7;
  id v16 = a9;
  id v17 = HKGenerateAttributedStringsWithUnitValue(a3, a5, v14, a6, 2, v9);
  if (v15)
  {
    [v14 ascender];
    double v19 = v18;
    [v14 descender];
    double v21 = v19 + v20;
    [v15 size];
    double v23 = v21 - v22;
    v24 = objc_msgSend(MEMORY[0x1E4F28B18], "hk_attributedStringForSpacing:", 1);
    uint64_t v25 = objc_msgSend(&stru_1F3B9CF20, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:", v15, v23, 0.0);
  }
  else
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3B9CF20];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3B9CF20];
  }
  v26 = (void *)v25;
  [v17 addObject:v24];
  [v17 addObject:v26];
  v27 = HKUIJoinAttributedStringsWithFormat(v17, v16);

  return v27;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return [(HKQuantityDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:1];
}

- (id)attributedStringFromValue:(id)a3 unit:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  BOOL v27 = a8;
  id v28 = a6;
  id v15 = a7;
  id v16 = a9;
  id v17 = a10;
  numberFormatter = self->super._numberFormatter;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  double v22 = HKFormattedStringFromValue(v21, 0, v19, 1, numberFormatter);
  double v23 = [v19 localizedDisplayNameForUnit:v20 value:v21];

  if (v16)
  {
    uint64_t v24 = [NSString stringWithValidatedFormat:v16, @"%@", 0, v23 validFormatSpecifiers error];

    double v23 = (void *)v24;
  }
  uint64_t v25 = [(HKQuantityDisplayTypeValueFormatter *)self attributedStringFromValueString:v22 valueFont:v28 unitString:v23 unitFont:v15 unitIcon:0 formatForChart:v27 formatString:v17];

  return v25;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6
{
  id v10 = a6;
  numberFormatter = self->super._numberFormatter;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = HKFormattedStringFromValue(v14, v13, v12, 1, numberFormatter);
  id v16 = [v12 localizedDisplayNameForDisplayType:v13 value:v14];

  if ([v16 length])
  {
    objc_msgSend(NSString, "stringWithFormat:", v10, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = v15;
  }
  double v18 = v17;

  return v18;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:@"QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v14 = [(HKQuantityDisplayTypeValueFormatter *)self stringFromValue:v11 displayType:v10 unitController:v9 formatString:v13];

  return v14;
}

@end