@interface UISliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)_accessibilityMaxScrubberPosition;
- (CGPoint)_accessibilityMinScrubberPosition;
- (CGPoint)accessibilityActivationPoint;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMinValue;
- (double)_accessibilityNumberValue;
- (id)_accessibilityAbsoluteValue;
- (id)_viewToAddFocusLayer;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAnnounceNewValue;
- (void)_accessibilityBumpValue:(BOOL)a3;
- (void)_accessibilitySetValue:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)sendActionsForControlEvents:(unint64_t)a3;
@end

@implementation UISliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UISlider";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = @"UIControl";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UISlider");
  v4 = "@";
  [location[0] validateClass:@"UISlider" hasInstanceMethod:@"_thumbView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_thumbViewNeue", v4, 0);
  v5 = "Q";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_sendActionsForEvents:withEvent:", "Q", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"sendActionsForControlEvents:", v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)_accessibilityAutomationType
{
  return 33;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v44 = self;
  SEL v43 = a2;
  long long v42 = 0uLL;
  long long v42 = *MEMORY[0x263F00148];
  id v41 = (id)[(UISliderAccessibility *)self safeValueForKey:@"_thumbView"];
  if (v41)
  {
    [v41 accessibilityActivationPoint];
    *(void *)&long long v40 = v2;
    *((void *)&v40 + 1) = v3;
    long long v42 = v40;
LABEL_25:
    *(_OWORD *)v45 = v42;
    int v32 = 1;
    goto LABEL_26;
  }
  id v39 = (id)[(UISliderAccessibility *)v44 safeValueForKey:@"_thumbViewNeue"];
  if (v39)
  {
    [v39 accessibilityActivationPoint];
    *(void *)&long long v38 = v4;
    *((void *)&v38 + 1) = v5;
    long long v42 = v38;
LABEL_23:
    int v32 = 0;
    goto LABEL_24;
  }
  id location = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(UISliderAccessibility *)v44 safeArrayForKey:@"subviews"];
  uint64_t v29 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
  if (v29)
  {
    uint64_t v25 = *(void *)__b[2];
    uint64_t v26 = 0;
    unint64_t v27 = v29;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)__b[2] != v25) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(__b[1] + 8 * v26);
      id v21 = location;
      v20 = v36;
      id v23 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
      id v22 = (id)objc_msgSend(v20, "_accessibilityLeafDescendantsWithOptions:");
      objc_msgSend(v21, "addObjectsFromArray:");

      ++v26;
      if (v24 + 1 >= v27)
      {
        uint64_t v26 = 0;
        unint64_t v27 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  memset(v33, 0, sizeof(v33));
  id v18 = location;
  uint64_t v19 = [v18 countByEnumeratingWithState:v33 objects:v46 count:16];
  if (v19)
  {
    uint64_t v15 = *(void *)v33[2];
    uint64_t v16 = 0;
    unint64_t v17 = v19;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)v33[2] != v15) {
        objc_enumerationMutation(v18);
      }
      id v34 = *(id *)(v33[1] + 8 * v16);
      id v12 = (id)[v34 accessibilityIdentifier];
      char v13 = [v12 isEqualToString:@"AXSliderKnob"];

      if (v13) {
        break;
      }
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [v18 countByEnumeratingWithState:v33 objects:v46 count:16];
        if (!v17) {
          goto LABEL_19;
        }
      }
    }
    [v34 accessibilityActivationPoint];
    v45[0] = v6;
    v45[1] = v7;
    int v32 = 1;
  }
  else
  {
LABEL_19:
    int v32 = 0;
  }

  if (!v32)
  {
    v30.receiver = v44;
    v30.super_class = (Class)UISliderAccessibility;
    [(UISliderAccessibility *)&v30 accessibilityActivationPoint];
    *(void *)&long long v31 = v8;
    *((void *)&v31 + 1) = v9;
    long long v42 = v31;
    int v32 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v32) {
    goto LABEL_23;
  }
LABEL_24:
  objc_storeStrong(&v39, 0);
  if (!v32) {
    goto LABEL_25;
  }
LABEL_26:
  objc_storeStrong(&v41, 0);
  double v10 = v45[1];
  double v11 = v45[0];
  result.y = v10;
  result.x = v11;
  return result;
}

- (BOOL)isAccessibilityElement
{
  double v11 = self;
  SEL v10 = a2;
  id v2 = (id)[(UISliderAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v6 = v2 == 0;

  if (v6)
  {
    char v9 = 0;
    objc_opt_class();
    id v8 = (id)__UIAccessibilityCastAsClass();
    id v7 = v8;
    objc_storeStrong(&v8, 0);
    char v4 = [v7 _accessibilityViewIsVisible];

    return (v4 & 1) != 0;
  }
  else
  {
    id v5 = (id)[(UISliderAccessibility *)v11 isAccessibilityUserDefinedElement];
    BOOL v12 = [v5 BOOLValue] & 1;
  }
  return v12;
}

- (id)_accessibilityAbsoluteValue
{
  id v7 = (id)[(UISliderAccessibility *)self safeValueForKey:@"minimumValue"];
  [v7 floatValue];
  float v8 = v2;

  id v9 = (id)[(UISliderAccessibility *)self safeValueForKey:@"maximumValue"];
  [v9 floatValue];
  float v10 = v3;

  id v11 = (id)[(UISliderAccessibility *)self safeValueForKey:@"value"];
  [v11 floatValue];
  float v12 = v4;

  *(float *)&double v5 = (float)(v12 - v8) / (float)(v10 - v8);
  return (id)[NSNumber numberWithFloat:v5];
}

- (id)accessibilityValue
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)[(UISliderAccessibility *)self accessibilityUserDefinedValue];
  if (v19[0])
  {
    id v21 = v19[0];
    int v18 = 1;
  }
  else
  {
    id v7 = (id)[(UISliderAccessibility *)v20 safeValueForKey:@"minimumValue"];
    [v7 floatValue];
    float v8 = v2;

    float v17 = v8;
    id v9 = (id)[(UISliderAccessibility *)v20 safeValueForKey:@"maximumValue"];
    [v9 floatValue];
    float v10 = v3;

    float v16 = v10;
    id v11 = (id)[(UISliderAccessibility *)v20 safeValueForKey:@"value"];
    [v11 floatValue];
    float v12 = v4;

    float v15 = v12;
    float v14 = (float)(v12 - v17) / (float)(v10 - v17);
    id v13 = (id)AXFormatFloatWithPercentage();
    id v21 = v13;
    int v18 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v19, 0);
  double v5 = v21;

  return v5;
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  [(UISliderAccessibility *)self bounds];
  -[UISliderAccessibility trackRectForBounds:](self, "trackRectForBounds:", v2, v3, v4, v5);
  CGRectGetMidY(v10);
  CGRectMake_1();
  UIAccessibilityFrameForBounds();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  [(UISliderAccessibility *)self bounds];
  -[UISliderAccessibility trackRectForBounds:](self, "trackRectForBounds:", v2, v3, v4, v5);
  CGRect rect = v11;
  CGRectGetMaxX(v11);
  CGRectGetMidY(rect);
  CGRectMake_1();
  UIAccessibilityFrameForBounds();
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)_accessibilitySetValue:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UISliderAccessibility *)v4 setValue:location[0] forKey:@"value"];
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  id v13 = self;
  SEL v12 = a2;
  id v2 = (id)[(UISliderAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v9 = v2 == 0;

  if (v9)
  {
    unint64_t v11 = 0;
    v10.receiver = v13;
    v10.super_class = (Class)UISliderAccessibility;
    unint64_t v11 = [(UISliderAccessibility *)&v10 accessibilityTraits] | *MEMORY[0x263F1CED8];
    id v3 = (id)[(UISliderAccessibility *)v13 accessibilityUserDefinedTraits];
    BOOL v7 = v3 == 0;

    if (!v7)
    {
      id v6 = (id)[(UISliderAccessibility *)v13 accessibilityUserDefinedTraits];
      uint64_t v4 = [v6 unsignedLongLongValue];
      v11 |= v4;
    }
    return v11;
  }
  else
  {
    id v8 = (id)[(UISliderAccessibility *)v13 accessibilityUserDefinedTraits];
    unint64_t v14 = [v8 unsignedLongLongValue];
  }
  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  unint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  char v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UISliderAccessibility;
  char v8 = [(UISliderAccessibility *)&v7 continueTrackingWithTouch:location[0] withEvent:v9];
  [(UISliderAccessibility *)v11 _accessibilityAnnounceNewValue];
  char v6 = v8;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  char v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISliderAccessibility;
  [(UISliderAccessibility *)&v3 sendActionsForControlEvents:a3];
  if (v4 == 4) {
    [(UISliderAccessibility *)v6 _accessibilityAnnounceNewValue];
  }
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v7.receiver = v10;
  v7.super_class = (Class)UISliderAccessibility;
  [(UISliderAccessibility *)&v7 endTrackingWithTouch:location[0] withEvent:v8];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  id v6 = (id)[(UISliderAccessibility *)v10 _accessibilityAXAttributedValue];
  UIAccessibilityPostNotification(notification, v6);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v11 = a3;
  [(UISliderAccessibility *)self safeCGFloatForKey:@"minimumValue"];
  double v10 = v3;
  [(UISliderAccessibility *)self safeCGFloatForKey:@"maximumValue"];
  double v9 = v4;
  [(UISliderAccessibility *)self safeCGFloatForKey:@"value"];
  double v7 = (v9 - v10) / 10.0;
  if (v11) {
    double v8 = v5 + v7;
  }
  else {
    double v8 = v5 - v7;
  }
  if (v8 < v10 || AXCGFAbs_1(v8 - v10) < 0.001) {
    return v10;
  }
  if (v8 > v9 || AXCGFAbs_1(v8 - v9) < 0.001) {
    return v9;
  }
  return v8;
}

- (void)_accessibilityAnnounceNewValue
{
  argument[2] = self;
  argument[1] = (id)a2;
  argument[0] = (id)[(UISliderAccessibility *)self _accessibilityAXAttributedValue];
  if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityAnnounceNewValue_LastOutput > 0.3
    && ([(id)_accessibilityAnnounceNewValue_LastValue isEqualToString:argument[0]] & 1) == 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument[0]);
    objc_storeStrong((id *)&_accessibilityAnnounceNewValue_LastValue, argument[0]);
    _accessibilityAnnounceNewValue_LastOutput = CFAbsoluteTimeGetCurrent();
  }
  objc_storeStrong(argument, 0);
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  SEL v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  [(UISliderAccessibility *)self _accessibilityIncreaseAmount:a3];
  v9[1] = v3;
  *(float *)&double v3 = *(double *)&v3;
  [(UISliderAccessibility *)v12 setValue:1 animated:*(double *)&v3];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  double v7 = __49__UISliderAccessibility__accessibilityBumpValue___block_invoke;
  double v8 = &unk_2650ADF18;
  v9[0] = v12;
  AXPerformSafeBlock();
  objc_storeStrong(v9, 0);
}

uint64_t __49__UISliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendActionsForEvents:withEvent:", 4096, 0, a1, a1);
}

- (double)_accessibilityNumberValue
{
  id v4 = (id)[(UISliderAccessibility *)self safeValueForKey:@"value"];
  [v4 floatValue];
  double v5 = v2;

  return v5;
}

- (double)_accessibilityMinValue
{
  id v4 = (id)[(UISliderAccessibility *)self safeValueForKey:@"minimumValue"];
  [v4 floatValue];
  double v5 = v2;

  return v5;
}

- (double)_accessibilityMaxValue
{
  id v4 = (id)[(UISliderAccessibility *)self safeValueForKey:@"maximumValue"];
  [v4 floatValue];
  double v5 = v2;

  return v5;
}

- (void)accessibilityIncrement
{
  id v2 = (id)[(UISliderAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  char v3 = [v2 BOOLValue];

  if (v3) {
    [(UISliderAccessibility *)self _accessibilityBumpValue:1];
  }
}

- (void)accessibilityDecrement
{
  id v2 = (id)[(UISliderAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  char v3 = [v2 BOOLValue];

  if (v3) {
    [(UISliderAccessibility *)self _accessibilityBumpValue:0];
  }
}

- (id)accessibilityPath
{
  id v22 = (UIView *)self;
  SEL v21 = a2;
  uint64_t v20 = AXRequestingClient();
  if (v20 == 3 || v20 == 4)
  {
    id v23 = 0;
  }
  else
  {
    if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0) {
      goto LABEL_16;
    }
    id v13 = (id)[(UIView *)v22 safeUIViewForKey:@"_thumbView"];
    char v17 = 0;
    if (v13)
    {
      id v2 = v13;
    }
    else
    {
      id v18 = (id)[(UIView *)v22 safeUIViewForKey:@"_thumbViewNeue"];
      char v17 = 1;
      id v2 = v18;
    }
    id v19 = v2;
    if (v17) {

    }
    if ([v19 _accessibilityViewIsVisible])
    {
      float v16 = (UIBezierPath *)(id)[v19 accessibilityPath];
      if (!v16)
      {
        [v19 bounds];
        objc_msgSend(v19, "convertRect:toView:", v22, v3, v4, v5, v6);
        CGRectMake_1();
        AX_CGRectGetCenter();
        UIRectCenteredAboutPoint();
        double v15 = v7;
        SEL v12 = (void *)MEMORY[0x263F1C478];
        AX_CGRectGetCenter();
        float v16 = (UIBezierPath *)(id)objc_msgSend(v12, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v9, v15 / 2.0 + 3.0, 0.0, 6.28318531);
      }
      id v23 = UIAccessibilityConvertPathToScreenCoordinates(v16, v22);
      int v14 = 1;
      objc_storeStrong((id *)&v16, 0);
    }
    else
    {
      int v14 = 0;
    }
    objc_storeStrong(&v19, 0);
    if (!v14) {
LABEL_16:
    }
      id v23 = 0;
  }
  BOOL v10 = v23;

  return v10;
}

- (void)layoutSubviews
{
  double v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UISliderAccessibility;
  [(UISliderAccessibility *)&v6 layoutSubviews];
  if ([(UISliderAccessibility *)v8 _accessibilityIsFKARunningForFocusItem])
  {
    id v2 = (void *)MEMORY[0x263F1C648];
    char v5 = 0;
    objc_opt_class();
    id v4 = (id)__UIAccessibilityCastAsClass();
    id v3 = v4;
    objc_storeStrong(&v4, 0);
    objc_msgSend(v2, "updateRingForFocusItem:");
  }
}

- (id)_viewToAddFocusLayer
{
  double v15 = self;
  v14[1] = (id)a2;
  id v6 = (id)[(UISliderAccessibility *)self safeUIViewForKey:@"_thumbView"];
  char v12 = 0;
  if (v6)
  {
    id v2 = v6;
  }
  else
  {
    id v13 = (id)[(UISliderAccessibility *)v15 safeUIViewForKey:@"_thumbViewNeue"];
    char v12 = 1;
    id v2 = v13;
  }
  v14[0] = v2;
  if (v12) {

  }
  char v7 = 0;
  if ([v14[0] _accessibilityViewIsVisible])
  {
    id v3 = v14[0];
  }
  else
  {
    char v11 = 0;
    objc_opt_class();
    id v10 = (id)__UIAccessibilityCastAsClass();
    id v9 = v10;
    objc_storeStrong(&v10, 0);
    id v8 = v9;
    char v7 = 1;
    id v3 = v9;
  }
  id v16 = v3;
  if (v7) {

  }
  objc_storeStrong(v14, 0);
  id v4 = v16;

  return v4;
}

@end