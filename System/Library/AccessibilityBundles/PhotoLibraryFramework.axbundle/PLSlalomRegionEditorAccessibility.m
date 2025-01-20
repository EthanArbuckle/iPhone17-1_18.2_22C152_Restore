@interface PLSlalomRegionEditorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (double)_accessibilitySliderDeltaForFrame:(CGRect)a3;
- (id)accessibilityElements;
- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4;
- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4;
- (void)layoutSubviews;
- (void)setEndValue:(double)a3 notify:(BOOL)a4;
- (void)setStartValue:(double)a3 notify:(BOOL)a4;
@end

@implementation PLSlalomRegionEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLSlalomRegionEditor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLSlalomRegionEditor"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLSlalomRegionEditor", @"setStartValue: notify:", "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLSlalomRegionEditor", @"setEndValue: notify:", "v", "d", "B", 0);
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_startValue" withType:"d"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_endValue" withType:"d"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_maxValue" withType:"d"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_minValue" withType:"d"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_delegate" withType:"<PLSlalomRegionEditorDelegate>"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_startHandleView" withType:"UIImageView"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_endHandleView" withType:"UIImageView"];
  [v3 validateClass:@"PLSlalomRegionEditor" hasInstanceVariable:@"_trackImageView" withType:"UIImageView"];
}

- (void)setStartValue:(double)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
  [v7 doubleValue];
  double v9 = v8;

  v22.receiver = self;
  v22.super_class = (Class)PLSlalomRegionEditorAccessibility;
  [(PLSlalomRegionEditorAccessibility *)&v22 setStartValue:v4 notify:a3];
  v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 != v9)
  {
    v13 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    v14 = [v13 objectForKey:@"StartHandle"];

    v15 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_maxValue"];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
    [v18 doubleValue];
    double v20 = v19;

    v21 = _createFormatDurationString(v20, v17);
    [v14 setAccessibilityValue:v21];
  }
}

- (void)setEndValue:(double)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
  [v7 doubleValue];
  double v9 = v8;

  v22.receiver = self;
  v22.super_class = (Class)PLSlalomRegionEditorAccessibility;
  [(PLSlalomRegionEditorAccessibility *)&v22 setEndValue:v4 notify:a3];
  v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 != v9)
  {
    v13 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    v14 = [v13 objectForKey:@"EndHandle"];

    v15 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_maxValue"];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
    [v18 doubleValue];
    double v20 = v19;

    v21 = _createFormatDurationString(v20, v17);
    [v14 setAccessibilityValue:v21];
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
  [v11 doubleValue];
  double v13 = v12;

  v31.receiver = self;
  v31.super_class = (Class)PLSlalomRegionEditorAccessibility;
  BOOL v14 = [(PLSlalomRegionEditorAccessibility *)&v31 continueTrackingWithTouch:v7 withEvent:v6];

  v15 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
  if (v10 != v17)
  {
    double v19 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    double v20 = [v19 objectForKey:@"StartHandle"];
    UIAccessibilityNotifications v21 = *v18;
    objc_super v22 = [v20 accessibilityValue];
    UIAccessibilityPostNotification(v21, v22);
  }
  v23 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
  [v23 doubleValue];
  double v25 = v24;

  if (v13 != v25)
  {
    v26 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    v27 = [v26 objectForKey:@"EndHandle"];
    UIAccessibilityNotifications v28 = *v18;
    v29 = [v27 accessibilityValue];
    UIAccessibilityPostNotification(v28, v29);
  }
  return v14;
}

- (void)layoutSubviews
{
  id v3 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startHandleView"];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endHandleView"];
  [v12 accessibilityFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v37.receiver = self;
  v37.super_class = (Class)PLSlalomRegionEditorAccessibility;
  [(PLSlalomRegionEditorAccessibility *)&v37 layoutSubviews];
  [v3 accessibilityFrame];
  v40.origin.x = v21;
  v40.origin.y = v22;
  v40.size.width = v23;
  v40.size.height = v24;
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  BOOL v25 = CGRectEqualToRect(v38, v40);
  v26 = (UIAccessibilityNotifications *)MEMORY[0x263F81298];
  if (!v25)
  {
    UIAccessibilityNotifications v27 = *MEMORY[0x263F81298];
    UIAccessibilityNotifications v28 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    v29 = [v28 objectForKey:@"StartHandle"];
    UIAccessibilityPostNotification(v27, v29);
  }
  [v12 accessibilityFrame];
  v41.origin.x = v30;
  v41.origin.y = v31;
  v41.size.width = v32;
  v41.size.height = v33;
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  if (!CGRectEqualToRect(v39, v41))
  {
    UIAccessibilityNotifications v34 = *v26;
    v35 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
    v36 = [v35 objectForKey:@"EndHandle"];
    UIAccessibilityPostNotification(v34, v36);
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
  if (v3)
  {
    double v4 = v3;
    CGFloat v5 = [v3 objectForKey:@"Children"];
    if (v5)
    {
      id v6 = v5;
      goto LABEL_11;
    }
    CGFloat v7 = [MEMORY[0x263EFF980] array];
    [v4 setObject:v7 forKey:@"Children"];
  }
  else
  {
    double v4 = [MEMORY[0x263EFF9A0] dictionary];
    CGFloat v7 = [MEMORY[0x263EFF980] array];
    [v4 setObject:v7 forKey:@"Children"];
    [(PLSlalomRegionEditorAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:@"userInfo"];
  }
  double v8 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_maxValue"];
  [v8 doubleValue];
  double v10 = v9;

  CGFloat v11 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startHandleView"];
  if (v11)
  {
    double v12 = (void *)[objc_allocWithZone((Class)PLUIAccessibilityMockSlider) initWithAccessibilityContainer:self];
    [v12 setView:v11];
    [v12 setMockSliderDelegate:self];
    [v12 setIsAccessibilityElement:1];
    double v13 = accessibilityLocalizedString(@"slomo.trim.begin");
    [v12 setAccessibilityLabel:v13];

    CGFloat v14 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
    [v14 doubleValue];
    double v16 = v15;

    double v17 = _createFormatDurationString(v16, v10);
    [v12 setAccessibilityValue:v17];
    [v7 addObject:v12];
    [v4 setObject:v12 forKey:@"StartHandle"];
  }
  CGFloat v18 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endHandleView"];
  if (v18)
  {
    double v19 = (void *)[objc_allocWithZone((Class)PLUIAccessibilityMockSlider) initWithAccessibilityContainer:self];
    [v19 setView:v18];
    [v19 setMockSliderDelegate:self];
    [v19 setIsAccessibilityElement:1];
    CGFloat v20 = accessibilityLocalizedString(@"slomo.trim.end");
    [v19 setAccessibilityLabel:v20];

    CGFloat v21 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
    [v21 doubleValue];
    double v23 = v22;

    CGFloat v24 = _createFormatDurationString(v23, v10);
    [v19 setAccessibilityValue:v24];
    [v7 addObject:v19];
    [v4 setObject:v19 forKey:@"EndHandle"];
  }
  id v6 = v7;

LABEL_11:

  return v6;
}

- (double)_accessibilitySliderDeltaForFrame:(CGRect)a3
{
  double v4 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_minValue", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  [v4 doubleValue];
  double v6 = v5;

  CGFloat v7 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_maxValue"];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_trackImageView"];
  [v10 frame];
  double v12 = (v9 - v6) * (4.0 / v11);

  return v12;
}

- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  BOOL v4 = a4;
  id v35 = a3;
  double v6 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_delegate"];
  CGFloat v7 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
  id v8 = [v7 objectForKey:@"StartHandle"];

  if (v8 == v35)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 slalomRegionEditorDidBeginEditing:self withStartHandle:1];
    }
    double v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startHandleView"];
    [v10 frame];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    CGFloat v31 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
    [v31 doubleValue];
    double v33 = v32;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v24, v26, v28, v30);
    if (v4) {
      double v34 = v34 * 5.0;
    }
    [(PLSlalomRegionEditorAccessibility *)self setStartValue:1 notify:v33 + v34];
  }
  else
  {
    id v9 = [v7 objectForKey:@"EndHandle"];

    if (v9 != v35) {
      goto LABEL_16;
    }
    if (objc_opt_respondsToSelector()) {
      [v6 slalomRegionEditorDidBeginEditing:self withStartHandle:0];
    }
    double v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endHandleView"];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
    [v19 doubleValue];
    double v21 = v20;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v12, v14, v16, v18);
    if (v4) {
      double v22 = v22 * 5.0;
    }
    [(PLSlalomRegionEditorAccessibility *)self setEndValue:1 notify:v21 + v22];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 slalomRegionEditorDidEndEditing:self];
  }

LABEL_16:
}

- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  BOOL v4 = a4;
  id v35 = a3;
  double v6 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_delegate"];
  CGFloat v7 = [(PLSlalomRegionEditorAccessibility *)self _accessibilityValueForKey:@"userInfo"];
  id v8 = [v7 objectForKey:@"StartHandle"];

  if (v8 == v35)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 slalomRegionEditorDidBeginEditing:self withStartHandle:1];
    }
    double v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startHandleView"];
    [v10 frame];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    CGFloat v31 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_startValue"];
    [v31 doubleValue];
    double v33 = v32;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v24, v26, v28, v30);
    if (v4) {
      double v34 = v34 * 5.0;
    }
    [(PLSlalomRegionEditorAccessibility *)self setStartValue:1 notify:v33 - v34];
  }
  else
  {
    id v9 = [v7 objectForKey:@"EndHandle"];

    if (v9 != v35) {
      goto LABEL_16;
    }
    if (objc_opt_respondsToSelector()) {
      [v6 slalomRegionEditorDidBeginEditing:self withStartHandle:0];
    }
    double v10 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endHandleView"];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(PLSlalomRegionEditorAccessibility *)self safeValueForKey:@"_endValue"];
    [v19 doubleValue];
    double v21 = v20;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v12, v14, v16, v18);
    if (v4) {
      double v22 = v22 * 5.0;
    }
    [(PLSlalomRegionEditorAccessibility *)self setEndValue:1 notify:v21 - v22];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 slalomRegionEditorDidEndEditing:self];
  }

LABEL_16:
}

@end