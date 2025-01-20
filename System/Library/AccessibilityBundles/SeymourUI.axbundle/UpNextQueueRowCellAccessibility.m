@interface UpNextQueueRowCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UpNextQueueRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.UpNextQueueRowCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"SeymourUI.WorkoutPlanBrickItemCell" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(UpNextQueueRowCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(UpNextQueueRowCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v6 = [v5 accessibilityLabel];
  v10 = _accessibilityReplaceStylsticBulletsForSpeaking(v4, v7);
  v8 = __UIAXStringForVariables();

  return v8;
}

@end