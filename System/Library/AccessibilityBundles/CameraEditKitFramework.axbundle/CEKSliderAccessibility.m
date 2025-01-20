@interface CEKSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (double)_axGetDeltaForCurrentValue:(double)a3 toIncrement:(BOOL)a4;
- (double)_axNumberOfTickSegments;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation CEKSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"value", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"maximumValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"minimumValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"tickMarkSize", "{CGSize=dd}", 0);
  [v3 validateClass:@"CameraEditKit.TickMarksModel" hasSwiftField:@"tickMarkSpacing" withSwiftType:"CGFloat"];
  [v3 validateClass:@"CameraEditKit.TickMarksModel" hasSwiftField:@"mainTickMarkInterval" withSwiftType:"Int"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"setValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"_tickMarksView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSliderTickMarksView", @"tickMarksModel", "@", 0);
}

- (double)_axNumberOfTickSegments
{
  [(CEKSliderAccessibility *)self safeCGSizeForKey:@"tickMarkSize"];
  double v4 = v3;
  v5 = [(CEKSliderAccessibility *)self safeValueForKeyPath:@"_tickMarksView.tickMarksModel"];
  [v5 safeSwiftCGFloatForKey:@"tickMarkSpacing"];
  double v7 = v4 / ((v4 + v6) * (double)[v5 safeSwiftIntForKey:@"mainTickMarkInterval"]);

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CEKSliderAccessibility;
  unint64_t v3 = [(CEKSliderAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CEKSliderAccessibility *)self safeBoolForKey:@"isEnabled"];
  uint64_t v5 = *MEMORY[0x263F1CED8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(CEKSliderAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v22) = 0;
    objc_opt_class();
    int v4 = [v3 safeValueForKey:@"_scrubberView"];
    __UIAccessibilityCastAsSafeCategory();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    double v6 = NSString;
    objc_super v7 = accessibilityCameraEditKitD2xLocalizedString(@"intensity.slider");
    v8 = [v5 _axPhotoFilterName];
    v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

LABEL_5:
    goto LABEL_7;
  }
  MEMORY[0x2455E1420](@"PUAdjustmentsViewController");
  if (objc_opt_isKindOfClass())
  {
    v10 = [v3 safeValueForKey:@"selectedIndexPath"];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __44__CEKSliderAccessibility_accessibilityLabel__block_invoke;
    v18 = &unk_26509F088;
    id v19 = v3;
    id v5 = v10;
    id v20 = v5;
    v21 = &v22;
    AXPerformSafeBlock();
    v11 = NSString;
    v12 = accessibilityCameraEditKitD2xLocalizedString(@"intensity.slider");
    v9 = objc_msgSend(v11, "stringWithFormat:", v12, v23[5]);

    _Block_object_dispose(&v22, 8);
    goto LABEL_5;
  }
  v14.receiver = self;
  v14.super_class = (Class)CEKSliderAccessibility;
  v9 = [(CEKSliderAccessibility *)&v14 accessibilityLabel];
LABEL_7:

  return v9;
}

void __44__CEKSliderAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"dataSource"];
  id v6 = [v2 infoForItemAtIndexPath:*(void *)(a1 + 40)];

  uint64_t v3 = [v6 safeStringForKey:@"localizedName"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityValue
{
  if ([(CEKSliderAccessibility *)self safeBoolForKey:@"isEnabled"])
  {
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
    double v4 = v3;
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
    double v6 = v5;
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"value"];
    double v8 = v7;
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"defaultValue"];
    AXScaledSliderValues(v8, v6, v4, v9);
    v10 = AXFormatFloatWithPercentage();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CEKSliderAccessibility;
    v10 = [(CEKSliderAccessibility *)&v12 accessibilityValue];
  }

  return v10;
}

- (double)_axGetDeltaForCurrentValue:(double)a3 toIncrement:(BOOL)a4
{
  BOOL v4 = a4;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
  double v8 = v7;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
  double v10 = v9;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"defaultValue"];
  if (v10 == 0.0) {
    return (v8 - v10) / 100.0;
  }
  double v13 = v11;
  BOOL v14 = vabdd_f64(v10, v11) == vabdd_f64(v11, v8);
  double result = (v11 - v10) / 100.0;
  if (!v14)
  {
    if (v13 == a3)
    {
      if (v4) {
        return (v8 - v13) / 100.0;
      }
    }
    else if (v10 >= a3 || v13 <= a3)
    {
      double result = 0.01;
      if (v8 > a3) {
        return (v8 - v13) / 100.0;
      }
    }
  }
  return result;
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
  double v6 = v5;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
  double v8 = v7;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v10 = v9;
  -[CEKSliderAccessibility _axGetDeltaForCurrentValue:toIncrement:](self, "_axGetDeltaForCurrentValue:toIncrement:", v3);
  double v12 = v11;
  double v13 = [(CEKSliderAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"CAMSystemOverlaySlider");
  char isKindOfClass = objc_opt_isKindOfClass();
  double v15 = v12 * 10.0;
  if ((isKindOfClass & 1) == 0) {
    double v15 = v12;
  }
  double v16 = v10 - v15;
  if (v10 - v15 < v8) {
    double v16 = v8;
  }
  double v17 = v10 + v15;
  if (v17 > v6) {
    double v17 = v6;
  }
  v22[6] = MEMORY[0x263EF8330];
  v22[7] = 3221225472;
  v22[8] = __41__CEKSliderAccessibility__axAdjustValue___block_invoke;
  v22[9] = &unk_26509F060;
  if (!v3) {
    double v17 = v16;
  }
  v22[10] = self;
  *(double *)&v22[11] = v17;
  AXPerformSafeBlock();
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass())
  {
    v18 = v22;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    id v19 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_2;
LABEL_15:
    v18[2] = v19;
    v18[3] = &unk_26509EFC0;
    v18[4] = v13;
    v18[5] = self;
    AXPerformSafeBlock();

    goto LABEL_16;
  }
  MEMORY[0x2455E1420](@"PUAdjustmentsViewController");
  if (objc_opt_isKindOfClass())
  {
    v18 = v21;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    id v19 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_3;
    goto LABEL_15;
  }
  MEMORY[0x2455E1420](@"CAMSystemOverlaySlider");
  if (objc_opt_isKindOfClass())
  {
    v18 = v20;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    id v19 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_4;
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(double *)(a1 + 40)];
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) sliderWillBeginScrolling:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sliderDidScroll:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 sliderDidEndScrolling:v3];
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sliderValueChanged:*(void *)(a1 + 40)];
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleContinuousSliderValueChanged:*(void *)(a1 + 40)];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v6 = v5;
  v24.receiver = self;
  v24.super_class = (Class)CEKSliderAccessibility;
  [(CEKSliderAccessibility *)&v24 scrollViewDidScroll:v4];
  double v7 = [(CEKSliderAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass())
  {
    id v23 = v7;
    AXPerformSafeBlock();
  }
  MEMORY[0x2455E1420](@"PUAdjustmentsViewController");
  if (objc_opt_isKindOfClass())
  {
    id v22 = v7;
    AXPerformSafeBlock();
  }
  [(CEKSliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v9 = v8;
  double v10 = vabdd_f64(v6, v8);
  [(CEKSliderAccessibility *)self _axNumberOfTickSegments];
  if (v10 > v11)
  {
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
    double v13 = v12;
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
    double v15 = v14;
    [(CEKSliderAccessibility *)self safeCGFloatForKey:@"defaultValue"];
    double v17 = v16;
    MEMORY[0x2455E1420](@"CAMSystemOverlaySlider");
    if (objc_opt_isKindOfClass())
    {
      v18 = [v7 safeValueForKey:@"delegate"];
      objc_opt_class();
      id v19 = [v18 safeValueForKey:@"_valueLabel"];
      id v20 = __UIAccessibilityCastAsClass();

      if (v20) {
        [v20 text];
      }
      else {
      v21 = AXFormatFloat();
      }
      UIAccessibilitySpeak();
    }
    else
    {
      AXScaledSliderValues(v9, v15, v13, v17);
      v18 = AXFormatFloatWithPercentage();
      UIAccessibilitySpeak();
    }
  }
}

uint64_t __46__CEKSliderAccessibility_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sliderDidScroll:*(void *)(a1 + 40)];
}

uint64_t __46__CEKSliderAccessibility_scrollViewDidScroll___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) sliderWillBeginScrolling:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 sliderDidEndScrolling:v3];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CEKSliderAccessibility *)self safeValueForKey:@"_tickMarksView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end