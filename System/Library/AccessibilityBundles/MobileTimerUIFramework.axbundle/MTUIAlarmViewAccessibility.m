@interface MTUIAlarmViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MTUIAlarmViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTUIAlarmView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"enabledSwitch", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"repeatText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIAlarmView", @"detailLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(MTUIAlarmViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];

  if (v3) {
    return 0;
  }
  v5 = [(MTUIAlarmViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v5) {
    return 1;
  }
  v6 = [(MTUIAlarmViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)accessibilityLabel
{
  id v3 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"name"];
  v4 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"timeLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"repeatText"];
  char v7 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"detailLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityValue
{
  v2 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"enabledSwitch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"enabledSwitch"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MTUIAlarmViewAccessibility *)self safeValueForKey:@"enabledSwitch"];
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