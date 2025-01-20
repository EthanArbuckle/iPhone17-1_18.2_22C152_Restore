@interface CAMSystemOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)_updateValueLabelText;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CAMSystemOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMSystemOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"indexCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"setSelectedIndex:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"_valueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"sliderIfLoaded", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"_menuVisibility", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayVisibility", @"_activeReasons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayVisibility", @"_delayedHidingTimer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"menu", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlayView", @"_updateValueLabelText", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlaySlider", @"_currentSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlaySlider", @"_discreteSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlaySlider", @"_continuousSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKDiscreteSlider", @"_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", "v", "Q", "B", "B", "B", "d", "@", "@?", 0);
  [v3 validateClass:@"CAMSystemOverlaySlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSystemOverlaySlider", @"_handleContinuousSliderValueChanged:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMSystemOverlayViewAccessibility;
  return *MEMORY[0x263F1CED8] | [(CAMSystemOverlayViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"camera.control");
}

- (id)accessibilityValue
{
  objc_opt_class();
  objc_super v3 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"_valueLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return v5;
}

- (CGRect)accessibilityFrame
{
  objc_super v3 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"sliderIfLoaded"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CAMSystemOverlayViewAccessibility;
    [(CAMSystemOverlayViewAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"menuVisibility"];
  id v21 = [v5 safeSetForKey:@"_activeReasons"];

  double v6 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"menuVisibility"];
  double v7 = [v6 safeValueForKey:@"_delayedHidingTimer"];

  if ([v21 count] || v7)
  {
    double v8 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"menu"];
    objc_super v17 = [v8 safeSwiftValueForKey:@"discreteSlider"];
    double v9 = v17;
    if (v17)
    {
      int v18 = [v17 safeIntForKey:@"selectedIndex"];
      if (v3) {
        uint64_t v19 = v18 + 1;
      }
      else {
        uint64_t v19 = v18 - 1;
      }
      [v8 setSelectedControlIndex:v19 animated:1];
    }
  }
  else
  {
    double v8 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"sliderIfLoaded"];
    double v9 = [v8 safeValueForKey:@"currentSlider"];
    MEMORY[0x2455E18B0](@"CEKDiscreteSlider");
    if (objc_opt_isKindOfClass())
    {
      double v10 = [v8 safeValueForKey:@"discreteSlider"];
      uint64_t v11 = (int)[v10 safeIntForKey:@"selectedIndex"];
      int v12 = [v10 safeIntForKey:@"indexCount"];
      if (v11 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v11;
      }
      uint64_t v14 = v13 - 1;
      uint64_t v15 = v12 - 1;
      if (v11 + 1 < v15) {
        uint64_t v15 = v11 + 1;
      }
      if (v3) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = v14;
      }
      [v10 _setSelectedIndex:v16 shouldDelegate:1 wantsFeedbackEmitted:1 shouldScroll:1 scrollDuration:0 scrollCurve:0 scrollCompletion:0.0];
    }
    else
    {
      v20 = [v8 safeValueForKey:@"continuousSlider"];
      double v10 = v20;
      if (v3) {
        [v20 accessibilityIncrement];
      }
      else {
        [v20 accessibilityDecrement];
      }
    }
  }
}

- (void)_updateValueLabelText
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSystemOverlayViewAccessibility;
  [(CAMSystemOverlayViewAccessibility *)&v6 _updateValueLabelText];
  objc_opt_class();
  BOOL v3 = [(CAMSystemOverlayViewAccessibility *)self safeValueForKey:@"_valueLabel"];
  v4 = __UIAccessibilityCastAsClass();

  double v5 = [v4 text];
  UIAccessibilitySpeak();
}

@end