@interface _PUIStylePickerHomeScreenVariationSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsGradientSlider;
- (BOOL)_axIsLumaSlider;
- (BOOL)isAccessibilityElement;
- (double)_axSliderValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation _PUIStylePickerHomeScreenVariationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PUIStylePickerHomeScreenVariationSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_PUIStylePickerHomeScreenVariationSlider" isKindOfClass:@"PUIStyleVariationSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUIStyleVariationSlider", @"styleCoordinator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUIStyleVariationSlider", @"contextIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUIStyleVariationSlider", @"value", "d", 0);
  [v3 validateClass:@"PUIStyleUICoordinator" hasInstanceVariable:@"_coordinatorImpl" withType:"<PUIStyleUICoordinatorImpl>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl", @"effectiveColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUIStyleVariationSlider", @"_setSliderValue:layout:fireActions:", "v", "d", "B", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self _axIsGradientSlider])
  {
    id v3 = @"home.screen.gradient.slider";
LABEL_5:
    v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self _axIsLumaSlider])
  {
    id v3 = @"home.screen.luma.slider";
    goto LABEL_5;
  }
  v6.receiver = self;
  v6.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
  v4 = [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)&v6 accessibilityLabel];
LABEL_7:

  return v4;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
  return *MEMORY[0x263F1CED8] | [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  if ([(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self _axIsLumaSlider])
  {
    [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self _axSliderValue];
    uint64_t v3 = AXFormatFloatWithPercentage();
  }
  else
  {
    if ([(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self _axIsGradientSlider])
    {
      v4 = [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self safeValueForKeyPath:@"styleCoordinator._coordinatorImpl.effectiveColor"];
      v5 = AXColorStringForColor();

      goto LABEL_7;
    }
    v7.receiver = self;
    v7.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
    uint64_t v3 = [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)&v7 accessibilityValue];
  }
  v5 = (void *)v3;
LABEL_7:

  return v5;
}

- (BOOL)_axIsGradientSlider
{
  v2 = [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self safeStringForKey:@"contextIdentifier"];
  char v3 = [v2 isEqualToString:@"_gradientColorSlider"];

  return v3;
}

- (BOOL)_axIsLumaSlider
{
  v2 = [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self safeStringForKey:@"contextIdentifier"];
  char v3 = [v2 isEqualToString:@"_lumaSlider"];

  return v3;
}

- (double)_axSliderValue
{
  [(_PUIStylePickerHomeScreenVariationSliderAccessibility *)self safeCGFloatForKey:@"value"];
  return result;
}

@end