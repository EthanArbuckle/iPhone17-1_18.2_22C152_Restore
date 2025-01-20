@interface PKSwitchSpinnerTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKSwitchSpinnerTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSwitchSpinnerTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSwitchSpinnerTableCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"titleLabel", "@", 0);
  [v3 validateClass:@"PKSwitchSpinnerTableCell" hasInstanceVariable:@"_switch" withType:"UISwitch"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKSwitchSpinnerTableCellAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 safeStringForKey:@"text"];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKSwitchSpinnerTableCellAccessibility *)self safeValueForKey:@"_switch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81418];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PKSwitchSpinnerTableCellAccessibility *)self safeValueForKey:@"_switch"];
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