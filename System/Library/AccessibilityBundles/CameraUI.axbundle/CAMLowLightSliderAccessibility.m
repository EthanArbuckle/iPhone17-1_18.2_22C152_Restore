@interface CAMLowLightSliderAccessibility
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
@end

@implementation CAMLowLightSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMLowLightSlider";
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
  [v3 validateClass:@"CAMLowLightSlider" isKindOfClass:@"CEKDiscreteSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMLowLightSlider", @"_isPerformingCaptureAnimation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMLowLightSlider", @"_selectedIndexBeforeCaptureAnimation", "Q", 0);
  [v3 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleLowLightSliderDidChangeValue:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMLowLightSlider", @"setLowLightMode:", "v", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilityCameraUILocalizedString(@"low.light.slider");
  v6 = [(CAMLowLightSliderAccessibility *)self safeValueForKey:@"titleText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityValue
{
  return (id)[(CAMLowLightSliderAccessibility *)self safeValueForKey:@"valueText"];
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if ([(CAMLowLightSliderAccessibility *)self safeBoolForKey:@"_isPerformingCaptureAnimation"])v5 = @"_selectedIndexBeforeCaptureAnimation"; {
  else
  }
    v5 = @"selectedIndex";
  uint64_t v13 = [(CAMLowLightSliderAccessibility *)self safeUnsignedIntegerForKey:v5];
  v6 = [(CAMLowLightSliderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_13 startWithSelf:1];
  uint64_t v7 = v11[3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3) {
      unint64_t v8 = v7 + 1;
    }
    else {
      unint64_t v8 = v7 - 1;
    }
    v11[3] = v8;
    if (v8 < [(CAMLowLightSliderAccessibility *)self safeUnsignedIntegerForKey:@"indexCount"])
    {
      id v9 = v6;
      AXPerformSafeBlock();
    }
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
}

void __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLowLightMode:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 40) _accessibilityViewController];
  [v2 _handleLowLightSliderDidChangeValue:*(void *)(a1 + 32)];
}

- (void)accessibilityDecrement
{
}

- (void)accessibilityIncrement
{
}

@end