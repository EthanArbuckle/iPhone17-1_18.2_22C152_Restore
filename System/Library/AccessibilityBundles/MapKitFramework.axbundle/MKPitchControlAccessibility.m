@interface MKPitchControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMinValue;
- (double)_accessibilityNumberValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityOrientation;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityBumpValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MKPitchControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPitchControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPitchControl", @"sliderPercent", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPitchControl", @"setSliderPercent:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPitchControl", @"degreesForPercent:", "d", "d", 0);
}

- (id)accessibilityLabel
{
  return AXMapKitLocString(@"PITCH_BUTTON");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityValue
{
  [(MKPitchControlAccessibility *)self safeDoubleForKey:@"sliderPercent"];
  v2 = AXFormatFloatWithPercentage();
  id v3 = NSString;
  v4 = AXLocalizedString();
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  AXPerformSafeBlock();
  double v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  LODWORD(v6) = llround(v5);
  v9 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);
  v7 = __AXStringForVariables();

  return v7;
}

uint64_t __49__MKPitchControlAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 safeDoubleForKey:@"sliderPercent"];
  uint64_t result = objc_msgSend(v2, "degreesForPercent:");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)_accessibilityNumberValue
{
  [(MKPitchControlAccessibility *)self safeDoubleForKey:@"sliderPercent"];
  return result;
}

- (double)_accessibilityMinValue
{
  return 0.0;
}

- (double)_accessibilityMaxValue
{
  return 1.0;
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
}

uint64_t __55__MKPitchControlAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSliderPercent:*(double *)(a1 + 40)];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (int64_t)_accessibilityOrientation
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end