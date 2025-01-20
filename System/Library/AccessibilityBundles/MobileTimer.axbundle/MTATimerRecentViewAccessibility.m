@interface MTATimerRecentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation MTATimerRecentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerRecentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerRecentView", @"durationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerRecentView", @"controlButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerRecentView", @"duration", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MTATimerRecentViewAccessibility *)self safeValueForKey:@"duration"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(MTATimerRecentViewAccessibility *)self safeUIViewForKey:@"durationLabel"];
  v6 = [v5 accessibilityLabel];
  [v4 duration];
  v9 = AXDurationStringForDuration();
  v7 = __AXStringForVariables();

  return v7;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"timer.recent.hint");
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MTATimerRecentViewAccessibility *)self safeUIViewForKey:@"controlButton"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end