@interface CAMExposureSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation CAMExposureSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExposureSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"valueText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"indexCount", "Q", 0);
  [v3 validateClass:@"CAMExposureSlider" isKindOfClass:@"CEKDiscreteSlider"];
  [v3 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleExposureSliderDidChangeValue:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExposureSlider", @"exposureValue", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilityCameraUILocalizedString(@"exposure.slider");
  v6 = [(CAMExposureSliderAccessibility *)self safeValueForKey:@"titleText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityValue
{
  return (id)[(CAMExposureSliderAccessibility *)self safeValueForKey:@"valueText"];
}

- (void)accessibilityDecrement
{
}

- (void)accessibilityIncrement
{
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v12 = [(CAMExposureSliderAccessibility *)self safeUnsignedIntegerForKey:@"selectedIndex"];
  v5 = [(CAMExposureSliderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_9 startWithSelf:1];
  uint64_t v6 = v10[3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3) {
      unint64_t v7 = v6 + 1;
    }
    else {
      unint64_t v7 = v6 - 1;
    }
    v10[3] = v7;
    if (v7 < [(CAMExposureSliderAccessibility *)self safeUnsignedIntegerForKey:@"indexCount"])
    {
      id v8 = v5;
      AXPerformSafeBlock();
    }
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __49__CAMExposureSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CAMExposureSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  id v2 = [*(id *)(a1 + 40) _accessibilityViewController];
  [v2 _handleExposureSliderDidChangeValue:*(void *)(a1 + 32)];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(CAMExposureSliderAccessibility *)self safeDoubleForKey:@"exposureValue"];
  double v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureSliderAccessibility;
  [(CAMExposureSliderAccessibility *)&v9 scrollViewDidScroll:v4];

  [(CAMExposureSliderAccessibility *)self safeDoubleForKey:@"exposureValue"];
  if (v6 != v7)
  {
    id v8 = [(CAMExposureSliderAccessibility *)self safeValueForKey:@"valueText"];
    UIAccessibilitySpeak();
  }
}

@end