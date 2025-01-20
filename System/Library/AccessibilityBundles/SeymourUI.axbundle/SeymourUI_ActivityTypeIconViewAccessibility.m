@interface SeymourUI_ActivityTypeIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SeymourUI_ActivityTypeIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ActivityTypeIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(SeymourUI_ActivityTypeIconViewAccessibility *)self safeIntegerForKey:@"accessibilityActivityType"];
  if (v3 < 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)SeymourUI_ActivityTypeIconViewAccessibility;
    v4 = [(SeymourUI_ActivityTypeIconViewAccessibility *)&v6 accessibilityLabel];
  }
  else
  {
    v4 = _accessibilityStringForHealthKitWorkoutType(v3);
  }

  return v4;
}

@end