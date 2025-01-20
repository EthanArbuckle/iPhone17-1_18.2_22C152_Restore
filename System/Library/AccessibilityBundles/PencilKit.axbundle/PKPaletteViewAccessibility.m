@interface PKPaletteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
@end

@implementation PKPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4 = a3;
  if (([(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"AXIsHitTestingPKPaletteHostViewKey"] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteViewAccessibility;
    [(PKPaletteViewAccessibility *)&v5 dismissPalettePopoverWithCompletion:v4];
  }
}

@end