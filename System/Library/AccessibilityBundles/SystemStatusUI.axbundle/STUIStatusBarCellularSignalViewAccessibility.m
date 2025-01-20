@interface STUIStatusBarCellularSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STUIStatusBarCellularSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarCellularSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(STUIStatusBarCellularSignalViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x245665C20](@"STUIStatusBarDualCellularSignalView", a2)];

  if (!v3
    || ([(STUIStatusBarCellularSignalViewAccessibility *)self _accessibilityValueForKey:@"AXStatusBarSignalViewServiceKey"], (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = (void *)MEMORY[0x263F21660];
    v6 = accessibilityLocalizedString(@"status.cellular.service");
    v4 = [v5 axAttributedStringWithString:v6];

    if ([(STUIStatusBarCellularSignalViewAccessibility *)self _accessibilityBoolValueForKey:@"PrimaryCellular"])
    {
      v7 = (void *)MEMORY[0x263F21660];
      v8 = accessibilityLocalizedString(@"primary.cellular");
      v9 = [v7 axAttributedStringWithString:v8];

      uint64_t v10 = *MEMORY[0x263F21840];
      v11 = @"Primary";
    }
    else
    {
      if (![(STUIStatusBarCellularSignalViewAccessibility *)self _accessibilityBoolValueForKey:@"SecondaryCellular"])goto LABEL_8; {
      v12 = (void *)MEMORY[0x263F21660];
      }
      v13 = accessibilityLocalizedString(@"secondary.cellular");
      v9 = [v12 axAttributedStringWithString:v13];

      uint64_t v10 = *MEMORY[0x263F21840];
      v11 = @"Secondary";
    }
    [v9 setAttribute:v11 forKey:v10];
    v4 = v9;
  }
LABEL_8:

  return v4;
}

@end