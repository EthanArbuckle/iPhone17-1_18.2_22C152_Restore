@interface MRUSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityBumpValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MRUSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MRUSliderAccessibility *)self isAccessibilityUserDefinedElement];

  if (v3)
  {
    v4 = [(MRUSliderAccessibility *)self isAccessibilityUserDefinedElement];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    char v5 = [v4 _accessibilityViewIsVisible];
  }
  BOOL v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MRUSliderAccessibility;
  return *MEMORY[0x263F1CED8] | [(MRUSliderAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  [(MRUSliderAccessibility *)self safeFloatForKey:@"minimumValue"];
  [(MRUSliderAccessibility *)self safeFloatForKey:@"maximumValue"];
  [(MRUSliderAccessibility *)self safeFloatForKey:@"value"];

  return (id)AXFormatFloatWithPercentage();
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
}

void __50__MRUSliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  [*(id *)(a1 + 32) setValue:1 animated:v1];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 sendActionsForControlEvents:4096];
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v3 = a3;
  [(MRUSliderAccessibility *)self safeFloatForKey:@"minimumValue"];
  double v6 = v5;
  [(MRUSliderAccessibility *)self safeFloatForKey:@"maximumValue"];
  double v8 = v7;
  [(MRUSliderAccessibility *)self safeFloatForKey:@"value"];
  double v10 = v9;
  double v11 = (v8 - v6) / 10.0;
  if (!v3) {
    double v11 = -v11;
  }
  double v12 = v11 + v10;
  if (v12 >= v6 && vabdd_f64(v12, v6) >= 0.001)
  {
    if (v12 > v8) {
      return v8;
    }
    double v6 = v12;
    if (vabdd_f64(v12, v8) < 0.001) {
      return v8;
    }
  }
  return v6;
}

@end