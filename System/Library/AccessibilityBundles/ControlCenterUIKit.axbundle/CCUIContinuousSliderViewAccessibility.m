@interface CCUIContinuousSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsVerticalAdjustableElement;
- (double)_axVolumeValue;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetVolumeValue:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CCUIContinuousSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIContinuousSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIContinuousSliderView" isKindOfClass:@"UIControl"];
  [v3 validateClass:@"CCUIBaseSliderView" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIBaseSliderView", @"value", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIBaseSliderView", @"setValue:animated:", "v", "f", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIBaseSliderView", @"setValue:", "v", "f", 0);
  [v3 validateClass:@"CCUIContinuousSliderView" hasInstanceVariable:@"_continuousSliderCornerRadius" withType:"d"];
  [v3 validateClass:@"CCUIContinuousSliderView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContinuousSliderViewAccessibility;
  [(CCUIContinuousSliderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CCUIContinuousSliderViewAccessibility *)self safeCGFloatForKey:@"value"];
  -[CCUIContinuousSliderViewAccessibility _axSetVolumeValue:](self, "_axSetVolumeValue:");
}

- (id)accessibilityValue
{
  uint64_t v3 = [(CCUIContinuousSliderViewAccessibility *)self _accessibilityGetBlockForAttribute:3];
  v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    [(CCUIContinuousSliderViewAccessibility *)self safeCGFloatForKey:@"value"];
    v6 = [(CCUIContinuousSliderViewAccessibility *)self safeUIViewForKey:@"superview"];
    MEMORY[0x245648F70](@"MRUVolumeView");
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(CCUIContinuousSliderViewAccessibility *)self _axVolumeValue];
    }
    uint64_t v5 = AXFormatFloatWithPercentage();
  }
  v8 = (void *)v5;

  return v8;
}

- (id)accessibilityPath
{
  v2 = (void *)MEMORY[0x263F1C478];
  uint64_t v3 = self;
  [(CCUIContinuousSliderViewAccessibility *)v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CCUIContinuousSliderViewAccessibility *)v3 safeCGFloatForKey:@"_continuousSliderCornerRadius"];
  objc_msgSend(v2, "_bezierPathWithPillRect:cornerRadius:", v5, v7, v9, v11, v12);
  v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v14 = UIAccessibilityConvertPathToScreenCoordinates(v13, (UIView *)v3);

  return v14;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (double)_axVolumeValue
{
  MEMORY[0x270F0A440](self, &__CCUIContinuousSliderViewAccessibility___axVolumeValue);
  return result;
}

- (void)_axSetVolumeValue:(double)a3
{
}

- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3
{
}

void __91__CCUIContinuousSliderViewAccessibility__accessibilityAdjustSliderValueInForwardDirection___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = [*(id *)(a1 + 32) safeUIViewForKey:@"superview"];
  MEMORY[0x245648F70](@"MRUVolumeView");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = *(double *)(a1 + 40);
    *(float *)&double v5 = v5;
    [*(id *)(a1 + 32) setValue:v5];
    [*(id *)(a1 + 32) _axSetVolumeValue:*(double *)(a1 + 40)];
    uint64_t v6 = 4096;
  }
  else
  {
    [v2 sendActionsForControlEvents:0x10000];
    double v7 = *(double *)(a1 + 40);
    *(float *)&double v7 = v7;
    [*(id *)(a1 + 32) setValue:0 animated:v7];
    uint64_t v6 = 0x40000;
  }
  [v2 sendActionsForControlEvents:v6];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIContinuousSliderViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(CCUIContinuousSliderViewAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return 1;
}

@end