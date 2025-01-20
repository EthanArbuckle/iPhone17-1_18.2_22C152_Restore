@interface _HKTimeScopeControlBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _HKTimeScopeControlBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_HKTimeScopeControlBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKTimeScopeControl"];
  [v3 validateClass:@"_HKTimeScopeControlBar" isKindOfClass:@"HKTimeScopeControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKTimeScopeControl", @"_timeScopeForIndex:", "q", 0);
  [v3 validateClass:@"_HKTimeScopeControlBar" hasInstanceVariable:@"_segments" withType:"UISegmentedControl"];
  [v3 validateClass:@"UISegmentedControl" hasInstanceVariable:@"_segments" withType:"NSMutableArray"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)_HKTimeScopeControlBarAccessibility;
  [(_HKTimeScopeControlBarAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_HKTimeScopeControlBarAccessibility *)self safeValueForKey:@"_segments"];
  v4 = [v3 safeArrayForKey:@"_segments"];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = v4;
      AXPerformSafeBlock();

      ++v5;
    }
    while (v5 < [v6 count]);
  }
}

@end