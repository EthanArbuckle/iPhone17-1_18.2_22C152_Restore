@interface HKPercentageDisplayTypeValueFormatter
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKPercentageDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return [(HKPercentageDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:1];
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  return [(HKPercentageDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:a8 unitFormatString:0];
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
  v24 = [v23 localizedStringForKey:@"PERCENTAGE_QUANTITY_VALUE_FORMAT_STRING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v25 = [(HKQuantityDisplayTypeValueFormatter *)self attributedStringFromValue:v22 displayType:v21 unitController:v20 valueFont:v19 unitFont:v18 formatForChart:v9 unitFormatString:v17 formatString:v24];

  return v25;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 bundleWithIdentifier:@"com.apple.HealthUI"];
  v13 = [v12 localizedStringForKey:@"PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v14 = [(HKQuantityDisplayTypeValueFormatter *)self stringFromValue:v11 displayType:v10 unitController:v9 formatString:v13];

  return v14;
}

@end