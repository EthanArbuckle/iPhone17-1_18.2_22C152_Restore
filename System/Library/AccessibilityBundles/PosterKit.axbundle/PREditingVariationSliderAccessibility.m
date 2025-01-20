@interface PREditingVariationSliderAccessibility
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

@implementation PREditingVariationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingVariationSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditingVariationSlider" hasProperty:@"value" withType:"d"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingVariationSlider", @"_setSliderValue:", "v", "d", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editing.variation.slider.label");
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
  [(PREditingVariationSliderAccessibility *)self safeCGFloatForKey:@"value"];
  v2.n128_f64[0] = (v2.n128_f64[0] + 1.0) * 0.5;
  v2.n128_f32[0] = v2.n128_f64[0];

  return (id)MEMORY[0x270F0A108](0, v2);
}

- (void)_axAdjustSliderValue:(BOOL)a3
{
  BOOL v3 = a3;
  [(PREditingVariationSliderAccessibility *)self safeCGFloatForKey:@"value"];
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

uint64_t __62__PREditingVariationSliderAccessibility__axAdjustSliderValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSliderValue:*(double *)(a1 + 40)];
}

@end