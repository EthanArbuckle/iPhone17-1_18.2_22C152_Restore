@interface _ActivityGoalLineAnnotationFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation _ActivityGoalLineAnnotationFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6 = a3;
  v7 = HKDecimalFormatter([a4 roundingMode]);
  v8 = NSString;
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = [v9 localizedStringForKey:@"GOAL_LINE_AXIS_LABEL %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v11 = [v7 stringFromNumber:v6];

  v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);

  return v12;
}

@end