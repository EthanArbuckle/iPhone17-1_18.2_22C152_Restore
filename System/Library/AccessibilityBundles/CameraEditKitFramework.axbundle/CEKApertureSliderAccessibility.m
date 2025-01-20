@interface CEKApertureSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_axValidApertureIndexForDiscreteIndex:(unint64_t)a3;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation CEKApertureSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKApertureSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"_valueLabel", "@", 0);
  [v3 validateClass:@"CEKApertureSlider" isKindOfClass:@"CEKDiscreteSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKApertureSlider", @"apertureValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKApertureSlider", @"markedApertureValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKApertureSlider", @"setApertureValueClosestTo:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"markedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKApertureSlider", @"_validApertureIndexForDiscreteIndex:", "Q", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(CEKApertureSliderAccessibility *)self safeDoubleForKey:@"apertureValue"];
  double v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)CEKApertureSliderAccessibility;
  [(CEKApertureSliderAccessibility *)&v10 scrollViewDidScroll:v4];

  [(CEKApertureSliderAccessibility *)self safeDoubleForKey:@"apertureValue"];
  if (v6 != v7)
  {
    v8 = [(CEKApertureSliderAccessibility *)self safeUIViewForKey:@"_valueLabel"];
    v9 = [v8 accessibilityLabel];
    UIAccessibilitySpeak();
  }
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(id)objc_opt_class() safeArrayForKey:@"validApertureValues"];
  unint64_t v6 = [(CEKApertureSliderAccessibility *)self _axValidApertureIndexForDiscreteIndex:[(CEKApertureSliderAccessibility *)self safeUnsignedIntegerForKey:@"selectedIndex"]];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v3 ? v6 + 1 : v6 - 1;
    if (v7 < [v5 count])
    {
      id v14 = v5;
      AXPerformSafeBlock();
      v8 = [(CEKApertureSliderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:1];
      v9 = v8;
      if (v8)
      {
        id v13 = v8;
        AXPerformSafeBlock();
      }
      objc_super v10 = [(CEKApertureSliderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_345 startWithSelf:1];
      v11 = v10;
      if (v10)
      {
        id v12 = v10;
        AXPerformSafeBlock();
      }
    }
  }
}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  [v3 floatValue];
  [v1 setApertureValueClosestTo:v2];
}

uint64_t __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1, void *a2)
{
  float v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E1420](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityViewController];
  [v2 _apertureSliderDidChangeApertureValue:*(void *)(a1 + 40)];
}

uint64_t __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E1420](@"PUPhotoEditApertureToolbar");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityViewController];
  [v2 _apertureSliderDidChangeValue:*(void *)(a1 + 40)];
}

- (void)accessibilityDecrement
{
}

- (void)accessibilityIncrement
{
}

- (id)accessibilityLabel
{
  id v2 = [(CEKApertureSliderAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)_axValidApertureIndexForDiscreteIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  AXPerformSafeBlock();
  unint64_t v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __72__CEKApertureSliderAccessibility__axValidApertureIndexForDiscreteIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _validApertureIndexForDiscreteIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(CEKApertureSliderAccessibility *)self safeUIViewForKey:@"_valueLabel"];
  id v4 = [v3 accessibilityLabel];

  unint64_t v5 = [(CEKApertureSliderAccessibility *)self _axValidApertureIndexForDiscreteIndex:[(CEKApertureSliderAccessibility *)self safeUnsignedIntegerForKey:@"selectedIndex"]];
  if (v5 == [(CEKApertureSliderAccessibility *)self _axValidApertureIndexForDiscreteIndex:[(CEKApertureSliderAccessibility *)self safeUnsignedIntegerForKey:@"markedIndex"]])
  {
    uint64_t v8 = accessibilityCameraEditKitD2xLocalizedString(@"original.depth");
    uint64_t v6 = __UIAXStringForVariables();

    id v4 = (void *)v6;
  }

  return v4;
}

@end