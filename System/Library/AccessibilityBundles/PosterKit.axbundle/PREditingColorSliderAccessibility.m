@interface PREditingColorSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustSliderValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PREditingColorSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingColorSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingColorSlider" isKindOfClass:@"UIControl"];
  [v3 validateClass:@"PREditingColorSlider" hasProperty:@"value" withType:"d"];
  [v3 validateClass:@"PREditingColorSlider" hasProperty:@"displayCurrentColor" withType:"@"];
  [v3 validateClass:@"PRPosterColor" hasProperty:@"color" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingColorSlider", @"_setSliderValue:", "v", "d", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editing.color.slider.label");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityValue
{
  id v3 = [(PREditingColorSliderAccessibility *)self safeValueForKeyPath:@"displayCurrentColor.color"];
  v4 = AXColorStringForColor();

  [(PREditingColorSliderAccessibility *)self safeCGFloatForKey:@"value"];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%.1f", v5);
  v7 = __UIAXStringForVariables();

  return v7;
}

- (void)_axAdjustSliderValue:(BOOL)a3
{
  BOOL v3 = a3;
  [(PREditingColorSliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v5 = -0.1;
  if (v3) {
    double v5 = 0.1;
  }
  double v6 = v5 + v4;
  if (v6 >= -1.0 && v6 <= 1.0)
  {
    AXPerformSafeBlock();
    objc_opt_class();
    v8 = __UIAccessibilityCastAsClass();
    [v8 sendActionsForControlEvents:4096];
  }
}

uint64_t __58__PREditingColorSliderAccessibility__axAdjustSliderValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSliderValue:*(double *)(a1 + 40)];
}

@end