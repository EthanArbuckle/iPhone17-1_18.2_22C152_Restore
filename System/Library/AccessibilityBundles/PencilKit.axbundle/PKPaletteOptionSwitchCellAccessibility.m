@interface PKPaletteOptionSwitchCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axSwitchButton;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PKPaletteOptionSwitchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteOptionSwitchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteOptionSwitchCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteOptionSwitchCell", @"switchButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKPaletteOptionSwitchCellAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKPaletteOptionSwitchCellAccessibility *)self _axSwitchButton];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PKPaletteOptionSwitchCellAccessibility *)self _axSwitchButton];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PKPaletteOptionSwitchCellAccessibility *)self _axSwitchButton];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)_axSwitchButton
{
  return (id)[(PKPaletteOptionSwitchCellAccessibility *)self safeValueForKey:@"switchButton"];
}

@end