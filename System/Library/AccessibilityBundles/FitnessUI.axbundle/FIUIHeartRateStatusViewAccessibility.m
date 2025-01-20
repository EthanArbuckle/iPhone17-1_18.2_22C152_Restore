@interface FIUIHeartRateStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation FIUIHeartRateStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIHeartRateStatusView";
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
  return [(FIUIHeartRateStatusViewAccessibility *)self safeUnsignedIntegerForKey:@"_state"] == (char *)&dword_4 + 1|| [(FIUIHeartRateStatusViewAccessibility *)self safeUnsignedIntegerForKey:@"_state"] == (char *)&dword_4 + 2;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"measure.heartrate");
}

@end