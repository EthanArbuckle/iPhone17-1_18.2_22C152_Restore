@interface _PKColorAlphaSliderIOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (double)_accessibilityColorAlpha;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetColorAlpha:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)didPanSliderKnob:(id)a3;
@end

@implementation _PKColorAlphaSliderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PKColorAlphaSliderIOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKColorAlphaSliderIOS", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKColorAlphaSliderIOS", @"sliderKnobView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKColorAlphaSliderIOS", @"setColor:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_PKColorAlphaSliderIOS", @"didPanSliderKnob:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(@"tool.opacity");
}

- (double)_accessibilityColorAlpha
{
  objc_opt_class();
  id v3 = [(_PKColorAlphaSliderIOSAccessibility *)self safeValueForKey:@"color"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 alphaComponent];
  double v6 = v5;

  return v6;
}

- (void)_accessibilitySetColorAlpha:(double)a3
{
  objc_opt_class();
  double v5 = [(_PKColorAlphaSliderIOSAccessibility *)self safeValueForKey:@"color"];
  double v6 = __UIAccessibilityCastAsClass();

  v8 = [v6 colorWithAlphaComponent:a3];
  id v7 = v8;
  AXPerformSafeBlock();
}

- (id)accessibilityValue
{
  [(_PKColorAlphaSliderIOSAccessibility *)self _accessibilityColorAlpha];

  return (id)AXFormatFloatWithPercentage();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_PKColorAlphaSliderIOSAccessibility;
  return *MEMORY[0x263F1CED8] | [(_PKColorAlphaSliderIOSAccessibility *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  [(_PKColorAlphaSliderIOSAccessibility *)self _accessibilityColorAlpha];
  double v4 = fmin(v3 + 0.1, 1.0);

  [(_PKColorAlphaSliderIOSAccessibility *)self _accessibilitySetColorAlpha:v4];
}

- (void)accessibilityDecrement
{
  [(_PKColorAlphaSliderIOSAccessibility *)self _accessibilityColorAlpha];
  double v4 = v3 + -0.1;
  if (v4 < 0.0) {
    double v4 = 0.0;
  }

  [(_PKColorAlphaSliderIOSAccessibility *)self _accessibilitySetColorAlpha:v4];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(_PKColorAlphaSliderIOSAccessibility *)self safeUIViewForKey:@"sliderKnobView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)didPanSliderKnob:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PKColorAlphaSliderIOSAccessibility;
  [(_PKColorAlphaSliderIOSAccessibility *)&v6 didPanSliderKnob:a3];
  if (CFAbsoluteTimeGetCurrent() - *(double *)&didPanSliderKnob__LastOutput > 1.0)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
    double v5 = [(_PKColorAlphaSliderIOSAccessibility *)self accessibilityValue];
    UIAccessibilityPostNotification(v4, v5);

    didPanSliderKnob__LastOutput = CFAbsoluteTimeGetCurrent();
  }
}

@end