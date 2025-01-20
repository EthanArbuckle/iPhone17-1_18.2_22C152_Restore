@interface HUAlarmTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUAlarmTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAlarmTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAlarmTableViewCell", @"enabledSwitch", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAlarmTableViewCell", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAlarmTableViewCell", @"nameAndDescriptionLabel", "@", 0);
}

- (id)accessibilityValue
{
  v2 = [(HUAlarmTableViewCellAccessibility *)self safeUIViewForKey:@"enabledSwitch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(HUAlarmTableViewCellAccessibility *)self safeUIViewForKey:@"enabledSwitch"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return (id)[(HUAlarmTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"timeLabel, nameAndDescriptionLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF60];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end