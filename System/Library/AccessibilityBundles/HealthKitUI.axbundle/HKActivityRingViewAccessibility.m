@interface HKActivityRingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation HKActivityRingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKActivityRingView";
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
  return accessibilityHealthKitUILocalizedString(@"activity.rings");
}

- (id)accessibilityValue
{
  v2 = [(HKActivityRingViewAccessibility *)self safeValueForKey:@"activitySummary"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end