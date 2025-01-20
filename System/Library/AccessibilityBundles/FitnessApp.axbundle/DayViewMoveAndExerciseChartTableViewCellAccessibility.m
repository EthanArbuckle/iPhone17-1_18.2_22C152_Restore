@interface DayViewMoveAndExerciseChartTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation DayViewMoveAndExerciseChartTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.DayViewMoveAndExerciseChartTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.DayViewMoveAndExerciseChartTableViewCell", @"chartView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.DayViewMoveAndExerciseChartTableViewCell", @"auxiliaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.DayViewMoveAndExerciseChartTableViewCell", @"labelPair", "@", 0);
  [v3 validateClass:@"FitnessApp.DayViewTitleAndValueLabelPair"];
}

- (id)accessibilityElements
{
  id v3 = [(DayViewMoveAndExerciseChartTableViewCellAccessibility *)self safeValueForKey:@"labelPair"];
  [v3 setIsAccessibilityElement:1];
  v4 = [v3 _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  [v3 setAccessibilityLabel:v4];

  [v3 _accessibilityAddTrait:UIAccessibilityTraitHeader];
  v5 = [(DayViewMoveAndExerciseChartTableViewCellAccessibility *)self safeValueForKey:@"auxiliaryLabel"];
  v6 = [(DayViewMoveAndExerciseChartTableViewCellAccessibility *)self safeValueForKey:@"chartView"];
  v7 = [(DayViewMoveAndExerciseChartTableViewCellAccessibility *)self safeValueForKey:@"editGoalButton"];
  v8 = accessibilityLocalizedString(@"edit.goal");
  [v7 setAccessibilityLabel:v8];

  v9 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 4, v3, v7, v6, v5);

  return v9;
}

@end