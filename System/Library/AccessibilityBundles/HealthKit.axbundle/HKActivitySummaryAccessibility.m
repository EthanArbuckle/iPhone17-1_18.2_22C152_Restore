@interface HKActivitySummaryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation HKActivitySummaryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKActivitySummary";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = __UIAccessibilitySafeClass();
  v3 = [v2 activeEnergyBurnedGoal];
  v4 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  if (v6 > 0.0)
  {
    v7 = [v2 activeEnergyBurned];
    v8 = [MEMORY[0x263F0A830] kilocalorieUnit];
    [v7 doubleValueForUnit:v8];
  }
  v9 = [v2 appleExerciseTimeGoal];
  v10 = [MEMORY[0x263F0A830] minuteUnit];
  [v9 doubleValueForUnit:v10];
  double v12 = v11;

  if (v12 > 0.0)
  {
    v13 = [v2 appleExerciseTime];
    v14 = [MEMORY[0x263F0A830] minuteUnit];
    [v13 doubleValueForUnit:v14];
  }
  v15 = [v2 appleStandHoursGoal];
  v16 = [MEMORY[0x263F0A830] countUnit];
  [v15 doubleValueForUnit:v16];
  double v18 = v17;

  if (v18 > 0.0)
  {
    v19 = [v2 appleStandHours];
    v20 = [MEMORY[0x263F0A830] countUnit];
    [v19 doubleValueForUnit:v20];
  }
  v35 = v2;
  v21 = NSString;
  v22 = accessibilityLocalizedString(@"move.percentage");
  v23 = AXFormatFloatWithPercentage();
  v24 = objc_msgSend(v21, "stringWithFormat:", v22, v23);
  v25 = NSString;
  v26 = accessibilityLocalizedString(@"exercise.percentage");
  v27 = AXFormatFloatWithPercentage();
  v28 = objc_msgSend(v25, "stringWithFormat:", v26, v27);
  v29 = NSString;
  v30 = accessibilityLocalizedString(@"stand.percentage");
  v31 = AXFormatFloatWithPercentage();
  v34 = objc_msgSend(v29, "stringWithFormat:", v30, v31);
  v32 = __UIAXStringForVariables();

  return v32;
}

@end