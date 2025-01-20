@interface DayViewActivityRingsTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityPath;
@end

@implementation DayViewActivityRingsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.DayViewActivityRingsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ARUIRingsView"];
  [v3 validateClass:@"FitnessApp.DayViewActivityRingsTableViewCell" hasSwiftField:@"ringsView" withSwiftType:"ARUIRingsView"];
  [v3 validateClass:@"FitnessApp.DayViewActivityRingsTableViewCell" hasSwiftField:@"pauseRingsDescriptionLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"FitnessApp.DayViewActivityRingsTableViewCell" hasSwiftField:@"pauseRingsResumeDateLabel" withSwiftType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(DayViewActivityRingsTableViewCellAccessibility *)self safeSwiftValueForKey:@"ringsView"];
  v4 = [(DayViewActivityRingsTableViewCellAccessibility *)self safeSwiftValueForKey:@"pauseRingsDescriptionLabel"];
  v5 = [(DayViewActivityRingsTableViewCellAccessibility *)self safeSwiftValueForKey:@"pauseRingsResumeDateLabel"];
  v6 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v5);
  v7 = AXLabelForElements();

  return v7;
}

- (CGRect)accessibilityFrame
{
  v2 = [(DayViewActivityRingsTableViewCellAccessibility *)self safeSwiftValueForKey:@"ringsView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityPath
{
  v2 = [(DayViewActivityRingsTableViewCellAccessibility *)self safeSwiftValueForKey:@"ringsView"];
  double v3 = [v2 _accessibilityCirclePathBasedOnBoundsWidth];

  return v3;
}

@end