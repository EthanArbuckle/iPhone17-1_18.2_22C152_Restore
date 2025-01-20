@interface NTKExtraLargeTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NTKExtraLargeTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKExtraLargeTimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKExtraLargeTimeView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)AXClockTimeVoiceOverSpokenStringForWatchFaces();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  if ([(NTKExtraLargeTimeViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)NTKExtraLargeTimeViewAccessibility;
  return [(NTKExtraLargeTimeViewAccessibility *)&v4 canBecomeFocused];
}

@end