@interface HUSwitchCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUSwitchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUSwitchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUSwitchCell" conformsToProtocol:@"HUDisableableCellProtocol"];
  [v3 validateProtocol:@"HUDisableableCellProtocol" hasRequiredInstanceMethod:@"isDisabled"];
}

- (id)accessibilityLabel
{
  id v3 = [(HUSwitchCellAccessibility *)self textLabel];
  v4 = [v3 text];
  v5 = [(HUSwitchCellAccessibility *)self detailTextLabel];
  v8 = [v5 text];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF60];
  int v3 = [(HUSwitchCellAccessibility *)self safeBoolForKey:@"isDisabled"];
  v4 = (void *)MEMORY[0x263F1CF20];
  if (!v3) {
    v4 = (void *)MEMORY[0x263F1CF18];
  }
  return *v4 | v2;
}

- (id)accessibilityValue
{
  uint64_t v2 = [(HUSwitchCellAccessibility *)self safeUIViewForKey:@"accessoryView"];
  int v3 = [v2 accessibilityValue];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2 = [(HUSwitchCellAccessibility *)self safeUIViewForKey:@"accessoryView"];
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