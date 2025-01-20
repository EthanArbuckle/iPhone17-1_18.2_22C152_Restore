@interface HKHeightDisplayTypeValueFormatter
- (BOOL)_unitsAreFeetWithDisplayType:(id)a3 unitController:(id)a4;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKHeightDisplayTypeValueFormatter

- (BOOL)_unitsAreFeetWithDisplayType:(id)a3 unitController:(id)a4
{
  v4 = [a4 unitForDisplayType:a3];
  v5 = [MEMORY[0x1E4F2B618] footUnit];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return [(HKHeightDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:1];
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a3;
  if ([(HKHeightDisplayTypeValueFormatter *)self _unitsAreFeetWithDisplayType:v14 unitController:v15])
  {
    [v18 doubleValue];
    double v20 = v19;

    v28 = HKFormattedFeetAndInches(v20);
    v21 = HKGenerateAttributedStringsWithUnitValue(v28, &stru_1F3B9CF20, v16, v17, 0, v8);
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3B9CF20];
    [v21 addObject:v22];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3B9CF20];
    [v21 addObject:v23];
    v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v25 = [v24 localizedStringForKey:@"QUANTITY_VALUE_FORMAT_STRING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v26 = HKUIJoinAttributedStringsWithFormat(v21, v25);
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)HKHeightDisplayTypeValueFormatter;
    v26 = [(HKQuantityDisplayTypeValueFormatter *)&v29 attributedStringFromValue:v18 displayType:v14 unitController:v15 valueFont:v16 unitFont:v17 formatForChart:v8];
  }
  return v26;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HKHeightDisplayTypeValueFormatter *)self _unitsAreFeetWithDisplayType:v9 unitController:v10])
  {
    v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:0.0];
    v12 = [(HKHeightDisplayTypeValueFormatter *)self attributedStringFromValue:v8 displayType:v9 unitController:v10 valueFont:v11 unitFont:v11];
    v13 = [v12 string];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HKHeightDisplayTypeValueFormatter;
    v13 = [(HKQuantityDisplayTypeValueFormatter *)&v15 stringFromValue:v8 displayType:v9 unitController:v10];
  }

  return v13;
}

@end