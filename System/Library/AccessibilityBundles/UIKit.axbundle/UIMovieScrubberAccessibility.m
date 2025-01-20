@interface UIMovieScrubberAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (double)_accessibilitySliderDeltaForFrame:(double)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityClearChildren;
- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4;
- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4;
- (void)_accessibilityNotifyDelegateEditingEndValueDidChange:(void *)a1;
- (void)_accessibilityNotifyDelegateEditingStartValueDidChange:(void *)a1;
- (void)_accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:(void *)a1;
- (void)_accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:(void *)a1;
- (void)_accessibilityNotifyDelegateWillBeginEditing;
- (void)_initSubviews;
- (void)_setValue:(double)a3 andSendAction:(BOOL)a4;
- (void)_sliderAnimationDidStop:(BOOL)a3;
- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4;
- (void)_updateThumbLocation;
- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setThumbIsVisible:(BOOL)a3;
- (void)setTrimEndValue:(double)a3;
- (void)setTrimStartValue:(double)a3;
@end

@implementation UIMovieScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIMovieScrubber";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIMovieScrubber", @"_trimAnimationDidStop:glassView:", "v", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  BOOL v8 = a4;
  id v4 = (id)[(UIMovieScrubberAccessibility *)self safeValueForKey:@"isEditing"];
  char v5 = [v4 BOOLValue];

  char v7 = v5 & 1;
  v6.receiver = v11;
  v6.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v6 setEditing:v9 animated:v8];
  if ((v7 & 1) != v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)setThumbIsVisible:(BOOL)a3
{
  BOOL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v6 setThumbIsVisible:a3];
  id v5 = (id)[(UIMovieScrubberAccessibility *)v9 _accessibilityValueForKey:@"userInfo"];
  id location = (id)[v5 objectForKey:@"Scrubber"];
  if (location)
  {
    char v3 = [location isAccessibilityElement];
    if ((v3 & 1) != v7)
    {
      [location setIsAccessibilityElement:v7];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
  else
  {
    [(UIMovieScrubberAccessibility *)v9 _accessibilityRemoveValueForKey:@"userInfo"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v5, 0);
}

- (void)setTrimStartValue:(double)a3
{
  v23 = self;
  SEL v22 = a2;
  double v21 = a3;
  id v11 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  [v11 doubleValue];
  double v12 = v3;

  double v20 = v12;
  v19.receiver = v23;
  v19.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v19 setTrimStartValue:v21];
  id v13 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"_trimStartValue"];
  [v13 doubleValue];
  double v14 = v4;

  double v18 = v14;
  if (v14 != v20)
  {
    id v17 = (id)[(UIMovieScrubberAccessibility *)v23 _accessibilityValueForKey:@"userInfo", v14];
    id v16 = (id)[v17 objectForKey:@"LeftHandle"];
    id v9 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"isEditing"];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0)
    {
      id v8 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"_minimumValue"];
      [v8 doubleValue];
      double v18 = v5;
    }
    id v7 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"_maximumValue"];
    [v7 doubleValue];
    id v15 = _createFormatDurationString(v18, v6);

    [v16 setAccessibilityValue:v15];
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], v16);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
}

- (void)setTrimEndValue:(double)a3
{
  v23 = self;
  SEL v22 = a2;
  double v21 = a3;
  id v10 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  [v10 doubleValue];
  double v11 = v3;

  double v20 = v11;
  v19.receiver = v23;
  v19.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v19 setTrimEndValue:v21];
  id v12 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"_trimEndValue"];
  [v12 doubleValue];
  double v13 = v4;

  double v18 = v13;
  if (v13 != v20)
  {
    id v17 = (id)[(UIMovieScrubberAccessibility *)v23 _accessibilityValueForKey:@"userInfo", v13];
    id v16 = (id)[v17 objectForKey:@"RightHandle"];
    id v6 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"_maximumValue"];
    [v6 doubleValue];
    double v7 = v5;

    double v15 = v7;
    id v8 = (id)[(UIMovieScrubberAccessibility *)v23 safeValueForKey:@"isEditing"];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0) {
      double v18 = v15;
    }
    id v14 = _createFormatDurationString(v18, v15);
    [v16 setAccessibilityValue:v14];
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], v16);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
}

- (void)_setValue:(double)a3 andSendAction:(BOOL)a4
{
  SEL v22 = self;
  SEL v21 = a2;
  double v20 = a3;
  BOOL v19 = a4;
  id v9 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  [v9 doubleValue];
  double v10 = v4;

  double v18 = v10;
  v17.receiver = v22;
  v17.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v17 _setValue:v19 andSendAction:v20];
  id v11 = (id)[(UIMovieScrubberAccessibility *)v22 safeValueForKey:@"value"];
  [v11 doubleValue];
  double v12 = v5;

  double v16 = v12;
  if (v12 != v18)
  {
    id v15 = (id)[(UIMovieScrubberAccessibility *)v22 _accessibilityValueForKey:@"userInfo", v12];
    id v14 = (id)[v15 objectForKey:@"Scrubber"];
    double v7 = v16;
    id v8 = (id)[(UIMovieScrubberAccessibility *)v22 safeValueForKey:@"_maximumValue"];
    [v8 doubleValue];
    id v13 = _createFormatDurationString(v7, v6);

    [v14 setAccessibilityValue:v13];
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
}

- (void)_initSubviews
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  v5.receiver = v7;
  v5.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v5 _initSubviews];
  id v3 = location[0];
  id v2 = (id)[(UIMovieScrubberAccessibility *)v7 safeValueForKey:@"_editingView"];
  BOOL v4 = v3 == v2;

  if (!v4)
  {
    [(UIMovieScrubberAccessibility *)v7 _accessibilityRemoveValueForKey:@"userInfo"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4
{
  double v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v8 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v12, "safeValueForKey:");
  v7.receiver = v12;
  v7.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v7 _trimAnimationDidStop:v10 glassView:location];
  id v5 = v8;
  id v4 = (id)[(UIMovieScrubberAccessibility *)v12 safeValueForKey:@"_editingView"];
  BOOL v6 = v5 == v4;

  if (!v6)
  {
    [(UIMovieScrubberAccessibility *)v12 _accessibilityRemoveValueForKey:@"userInfo"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (void)_updateThumbLocation
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UIMovieScrubberAccessibility *)self _accessibilityValueForKey:@"userInfo"];
  id location = (id)[v14[0] objectForKey:@"Scrubber"];
  [location accessibilityFrame];
  rect1.origin.x = v2;
  rect1.origin.y = v3;
  rect1.size.width = v4;
  rect1.size.height = v5;
  v11.receiver = v15;
  v11.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v11 _updateThumbLocation];
  [location accessibilityFrame];
  rect2.origin.x = v6;
  rect2.origin.y = v7;
  rect2.size.width = v8;
  rect2.size.height = v9;
  if (!CGRectEqualToRect(rect1, rect2)) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], location);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  CGFloat v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v5 _sliderAnimationDidStop:a3];
  id v3 = (id)[(UIMovieScrubberAccessibility *)v8 _accessibilityValueForKey:@"userInfo"];
  id argument = (id)[v3 objectForKey:@"Scrubber"];

  if (argument) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], argument);
  }
  objc_storeStrong(&argument, 0);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  id v25 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:");
  [v25 doubleValue];
  double v26 = v4;

  double v44 = v26;
  id v27 = (id)[(UIMovieScrubberAccessibility *)v47 safeValueForKey:@"_trimEndValue"];
  [v27 doubleValue];
  double v28 = v5;

  double v43 = v28;
  id v29 = (id)[(UIMovieScrubberAccessibility *)v47 safeValueForKey:@"value"];
  [v29 doubleValue];
  double v30 = v6;

  double v42 = v30;
  char v41 = 0;
  v40.receiver = v47;
  v40.super_class = (Class)UIMovieScrubberAccessibility;
  char v41 = [(UIMovieScrubberAccessibility *)&v40 continueTrackingWithTouch:location[0] withEvent:v45];
  double v32 = v44;
  id v31 = (id)[(UIMovieScrubberAccessibility *)v47 safeValueForKey:@"_trimStartValue"];
  [v31 doubleValue];
  BOOL v33 = v32 == v7;

  if (!v33)
  {
    id v39 = (id)[(UIMovieScrubberAccessibility *)v47 _accessibilityValueForKey:@"userInfo"];
    id v38 = (id)[v39 objectForKey:@"LeftHandle"];
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v23 = (id)[v38 accessibilityValue];
    UIAccessibilityPostNotification(notification, v23);

    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  double v20 = v43;
  id v19 = (id)[(UIMovieScrubberAccessibility *)v47 safeValueForKey:@"_trimEndValue"];
  [v19 doubleValue];
  BOOL v21 = v20 == v8;

  if (!v21)
  {
    id v37 = (id)[(UIMovieScrubberAccessibility *)v47 _accessibilityValueForKey:@"userInfo"];
    id v36 = (id)[v37 objectForKey:@"RightHandle"];
    UIAccessibilityNotifications v17 = *MEMORY[0x263F1CDC8];
    id v18 = (id)[v36 accessibilityValue];
    UIAccessibilityPostNotification(v17, v18);

    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  double v15 = v42;
  id v14 = (id)[(UIMovieScrubberAccessibility *)v47 safeValueForKey:@"value"];
  [v14 doubleValue];
  BOOL v16 = v15 == v9;

  if (!v16)
  {
    id v35 = (id)[(UIMovieScrubberAccessibility *)v47 _accessibilityValueForKey:@"userInfo"];
    id v34 = (id)[v35 objectForKey:@"Scrubber"];
    UIAccessibilityNotifications v12 = *MEMORY[0x263F1CDC8];
    id v13 = (id)[v34 accessibilityValue];
    UIAccessibilityPostNotification(v12, v13);

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  char v11 = v41;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47[5] = *(id *)&a4;
  v47[4] = *(id *)&a5;
  v47[3] = *(id *)&a6;
  v47[2] = *(id *)&a7;
  v47[1] = *(id *)&a8;
  v47[0] = (id)[(UIMovieScrubberAccessibility *)v49 _accessibilityValueForKey:@"userInfo"];
  id v46 = (id)[v47[0] objectForKey:@"Scrubber"];
  [v46 accessibilityFrame];
  v45.origin.x = v8;
  v45.origin.y = v9;
  v45.size.width = v10;
  v45.size.height = v11;
  id v44 = (id)[v47[0] objectForKey:@"RightHandle"];
  [v44 accessibilityFrame];
  v43.origin.x = v12;
  v43.origin.y = v13;
  v43.size.width = v14;
  v43.size.height = v15;
  id v42 = (id)[v47[0] objectForKey:@"LeftHandle"];
  [v42 accessibilityFrame];
  rect1.origin.x = v16;
  rect1.origin.y = v17;
  rect1.size.width = v18;
  rect1.size.height = v19;
  v40.receiver = v49;
  v40.super_class = (Class)UIMovieScrubberAccessibility;
  [(UIMovieScrubberAccessibility *)&v40 movieScrubberTrackView:location[0] clampedSizeWidthDelta:a4 actualSizeWidthDelta:a5 originXDelta:a6 minimumVisibleValue:a7 maximumVisibleValue:a8];
  [v46 accessibilityFrame];
  rect2.origin.x = v20;
  rect2.origin.y = v21;
  rect2.size.width = v22;
  rect2.size.height = v23;
  if (!CGRectEqualToRect(v45, rect2)) {
    goto LABEL_4;
  }
  [v44 accessibilityFrame];
  v38.origin.x = v24;
  v38.origin.y = v25;
  v38.size.width = v26;
  v38.size.height = v27;
  if (!CGRectEqualToRect(v43, v38)
    || ([v42 accessibilityFrame],
        v37.origin.x = v28,
        v37.origin.y = v29,
        v37.size.width = v30,
        v37.size.height = v31,
        !CGRectEqualToRect(rect1, v37)))
  {
LABEL_4:
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], v46);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityClearChildren
{
  id v2 = a1;
  if (a1)
  {
    id location = (id)[v2 _accessibilityValueForKey:@"userInfo"];
    if (location) {
      [location removeObjectForKey:@"Children"];
    }
    objc_storeStrong(&location, 0);
  }
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityElements
{
  v54 = self;
  v53[1] = (id)a2;
  v53[0] = 0;
  id v52 = (id)[(UIMovieScrubberAccessibility *)self _accessibilityValueForKey:@"userInfo"];
  if (v52)
  {
    id v4 = (id)[v52 objectForKey:@"Children"];
    id v5 = v53[0];
    v53[0] = v4;

    if (v53[0])
    {
      id v55 = v53[0];
      int v51 = 1;
      goto LABEL_27;
    }
    v53[0] = (id)[MEMORY[0x263EFF980] array];

    [v52 setObject:v53[0] forKey:@"Children"];
  }
  else
  {
    id v52 = (id)[MEMORY[0x263EFF9A0] dictionary];

    id v2 = (id)[MEMORY[0x263EFF980] array];
    id v3 = v53[0];
    v53[0] = v2;

    [v52 setObject:v53[0] forKey:@"Children"];
    [(UIMovieScrubberAccessibility *)v54 _accessibilitySetRetainedValue:v52 forKey:@"userInfo"];
  }
  id v50 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_editingView"];
  id v24 = (id)[v50 safeValueForKey:@"isEnabled"];
  char v25 = [v24 BOOLValue];

  char v49 = v25 & 1;
  id v26 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"isEditing"];
  char v27 = [v26 BOOLValue];

  char v48 = v27 & 1;
  id v28 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_maximumValue"];
  [v28 doubleValue];
  double v29 = v6;

  double v47 = v29;
  id v46 = (id)[v50 safeValueForKey:@"_leftImageView"];
  if (v46 && (v49 & 1) != 0)
  {
    CGRect v45 = (id *)[objc_allocWithZone((Class)UIAccessibilityElementMockSlider) initWithAccessibilityContainer:v54];
    -[UIAccessibilityElementMockSlider setView:](v45, v46);
    -[UIAccessibilityElementMockSlider setDelegate:](v45, v54);
    [v45 setIsAccessibilityElement:1];
    id v23 = accessibilityLocalizedString(@"trim.beginning.slider");
    objc_msgSend(v45, "setAccessibilityLabel:");

    double v44 = 0.0;
    char v42 = 0;
    char v40 = 0;
    if (v48)
    {
      id v43 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_trimStartValue"];
      char v42 = 1;
      [v43 doubleValue];
    }
    else
    {
      id v41 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_minimumValue"];
      char v40 = 1;
      [v41 doubleValue];
    }
    double v22 = v7;
    if (v40) {

    }
    if (v42) {
    double v44 = v22;
    }
    id v39 = _createFormatDurationString(v22, v47);
    [v45 setAccessibilityValue:v39];
    [v53[0] addObject:v45];
    [v52 setObject:v45 forKey:@"LeftHandle"];
    objc_storeStrong(&v39, 0);
    objc_storeStrong((id *)&v45, 0);
  }
  id v38 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_thumbView"];
  if (v38)
  {
    id v8 = objc_allocWithZone((Class)UIAccessibilityElementMockSlider);
    CGRect v37 = (id *)[v8 initWithAccessibilityContainer:v54];
    -[UIAccessibilityElementMockSlider setView:](v37, v38);
    -[UIAccessibilityElementMockSlider setDelegate:](v37, v54);
    CGFloat v16 = v37;
    id v17 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"thumbIsVisible"];
    objc_msgSend(v16, "setIsAccessibilityElement:", objc_msgSend(v17, "BOOLValue") & 1);

    CGFloat v18 = v37;
    id v19 = accessibilityLocalizedString(@"current.position.slider");
    objc_msgSend(v18, "setAccessibilityLabel:");

    id v20 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"value"];
    [v20 doubleValue];
    CGFloat v21 = v9;

    v36[1] = v21;
    v36[0] = _createFormatDurationString(*(double *)&v21, v47);
    [v37 setAccessibilityValue:v36[0]];
    [v53[0] addObject:v37];
    [v52 setObject:v37 forKey:@"Scrubber"];
    objc_storeStrong(v36, 0);
    objc_storeStrong((id *)&v37, 0);
  }
  id v35 = (id)[v50 safeValueForKey:@"_rightImageView"];
  if (v35 && (v49 & 1) != 0)
  {
    id v10 = objc_allocWithZone((Class)UIAccessibilityElementMockSlider);
    id v34 = (id *)[v10 initWithAccessibilityContainer:v54];
    -[UIAccessibilityElementMockSlider setView:](v34, v35);
    -[UIAccessibilityElementMockSlider setDelegate:](v34, v54);
    [v34 setIsAccessibilityElement:1];
    id v15 = accessibilityLocalizedString(@"trim.end.slider");
    objc_msgSend(v34, "setAccessibilityLabel:");

    double v33 = 0.0;
    char v31 = 0;
    if (v48)
    {
      id v32 = (id)[(UIMovieScrubberAccessibility *)v54 safeValueForKey:@"_trimEndValue"];
      char v31 = 1;
      [v32 doubleValue];
      double v14 = v11;
    }
    else
    {
      double v14 = v47;
    }
    if (v31) {

    }
    double v33 = v14;
    id v30 = _createFormatDurationString(v14, v47);
    [v34 setAccessibilityValue:v30];
    [v53[0] addObject:v34];
    [v52 setObject:v34 forKey:@"RightHandle"];
    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  id v55 = v53[0];
  int v51 = 1;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v50, 0);
LABEL_27:
  objc_storeStrong(&v52, 0);
  objc_storeStrong(v53, 0);
  CGFloat v12 = v55;

  return v12;
}

- (double)_accessibilitySliderDeltaForFrame:(double)a3
{
  double v17 = a2;
  double v18 = a3;
  double v19 = a4;
  double v20 = a5;
  id v16 = a1;
  if (!a1) {
    return 0.0;
  }
  id v9 = (id)[v16 safeValueForKey:@"_minimumValue"];
  [v9 doubleValue];
  double v10 = v5;

  double v15 = v10;
  id v11 = (id)[v16 safeValueForKey:@"_maximumValue"];
  [v11 doubleValue];
  double v12 = v6;

  double v14 = v12;
  id v13 = (id)[v16 safeValueForKey:@"_trackView"];
  [v13 frame];
  double v21 = (v14 - v15) * (v19 * 0.200000003 / v7);
  objc_storeStrong(&v13, 0);
  return v21;
}

- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v64 = a4;
  id v63 = (id)[(UIMovieScrubberAccessibility *)v66 _accessibilityValueForKey:@"userInfo"];
  id v41 = location[0];
  id v4 = (id)[v63 objectForKey:@"LeftHandle"];
  BOOL v42 = v41 != v4;

  if (v42)
  {
    id v33 = location[0];
    id v11 = (id)[v63 objectForKey:@"RightHandle"];
    BOOL v34 = v33 != v11;

    if (v34)
    {
      id v26 = location[0];
      id v18 = (id)[v63 objectForKey:@"Scrubber"];
      BOOL v27 = v26 != v18;

      if (!v27)
      {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 0);
        id v44 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_thumbView"];
        [v44 frame];
        double v43 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v19, v20, v21, v22);
        if (v64) {
          double v43 = v43 * *(float *)&LargeStepMultiplier;
        }
        id v24 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"value"];
        [v24 doubleValue];
        double v25 = v23 + v43;

        [(UIMovieScrubberAccessibility *)v66 _setValue:1 andSendAction:v25];
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 0);
        objc_storeStrong(&v44, 0);
      }
    }
    else
    {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
      [(UIMovieScrubberAccessibility *)v66 setEditing:1 animated:0];
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 2u);
      id v30 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_editingView"];
      id v53 = (id)[v30 safeValueForKey:@"_rightImageView"];

      [v53 frame];
      double v49 = v12;
      double v50 = v13;
      double v51 = v14;
      double v52 = v15;
      id v31 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimEndValue"];
      [v31 doubleValue];
      double v32 = v16;

      double v48 = v32;
      double v47 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v49, v50, v51, v52);
      if (v64) {
        double v47 = v47 * *(float *)&LargeStepMultiplier;
      }
      double v46 = v48 + v47;
      [(UIMovieScrubberAccessibility *)v66 setTrimEndValue:v48 + v47];
      id v28 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimEndValue"];
      [v28 doubleValue];
      double v29 = v17;

      double v45 = v29;
      if (v48 != v29) {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingEndValueDidChange:](v66, v45);
      }
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 2u);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
    [(UIMovieScrubberAccessibility *)v66 setEditing:1 animated:0];
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 1u);
    id v37 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_editingView"];
    id v62 = (id)[v37 safeValueForKey:@"_leftImageView"];

    [v62 frame];
    double v58 = v5;
    double v59 = v6;
    double v60 = v7;
    double v61 = v8;
    id v38 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimStartValue"];
    [v38 doubleValue];
    double v39 = v9;

    double v57 = v39;
    double v56 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v58, v59, v60, v61);
    if (v64) {
      double v56 = v56 * *(float *)&LargeStepMultiplier;
    }
    double v55 = v57 + v56;
    [(UIMovieScrubberAccessibility *)v66 setTrimStartValue:v57 + v56];
    id v35 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimStartValue"];
    [v35 doubleValue];
    double v36 = v10;

    double v54 = v36;
    if (v57 != v36) {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingStartValueDidChange:](v66, v54);
    }
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 1u);
    objc_storeStrong(&v62, 0);
  }
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityNotifyDelegateWillBeginEditing
{
  id v2 = a1;
  if (a1)
  {
    id location = (id)[v2 safeValueForKey:@"_delegate"];
    if (objc_opt_respondsToSelector()) {
      [location movieScrubberWillBeginEditing:v2];
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:(void *)a1
{
  id v4 = a1;
  unsigned int v3 = a2;
  if (a1)
  {
    id location = (id)[v4 safeValueForKey:@"_delegate"];
    if (location)
    {
      if (objc_opt_respondsToSelector()) {
        [location movieScrubberDidBeginScrubbing:v4 withHandle:v3];
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateEditingStartValueDidChange:(void *)a1
{
  id v4 = a1;
  double v3 = a2;
  if (a1)
  {
    id location = (id)[v4 safeValueForKey:@"_delegate"];
    if (location)
    {
      if (objc_opt_respondsToSelector()) {
        [location movieScrubber:v4 editingStartValueDidChange:v3];
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:(void *)a1
{
  id v4 = a1;
  unsigned int v3 = a2;
  if (a1)
  {
    id location = (id)[v4 safeValueForKey:@"_delegate"];
    if (location)
    {
      if (objc_opt_respondsToSelector()) {
        [location movieScrubberDidEndScrubbing:v4 withHandle:v3];
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateEditingEndValueDidChange:(void *)a1
{
  id v4 = a1;
  double v3 = a2;
  if (a1)
  {
    id location = (id)[v4 safeValueForKey:@"_delegate"];
    if (location)
    {
      if (objc_opt_respondsToSelector()) {
        [location movieScrubber:v4 editingEndValueDidChange:v3];
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v64 = a4;
  id v63 = (id)[(UIMovieScrubberAccessibility *)v66 _accessibilityValueForKey:@"userInfo"];
  id v41 = location[0];
  id v4 = (id)[v63 objectForKey:@"LeftHandle"];
  BOOL v42 = v41 != v4;

  if (v42)
  {
    id v33 = location[0];
    id v11 = (id)[v63 objectForKey:@"RightHandle"];
    BOOL v34 = v33 != v11;

    if (v34)
    {
      id v26 = location[0];
      id v18 = (id)[v63 objectForKey:@"Scrubber"];
      BOOL v27 = v26 != v18;

      if (!v27)
      {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 0);
        id v44 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_thumbView"];
        [v44 frame];
        double v43 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v19, v20, v21, v22);
        if (v64) {
          double v43 = v43 * *(float *)&LargeStepMultiplier;
        }
        id v24 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"value"];
        [v24 doubleValue];
        double v25 = v23 - v43;

        [(UIMovieScrubberAccessibility *)v66 _setValue:1 andSendAction:v25];
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 0);
        objc_storeStrong(&v44, 0);
      }
    }
    else
    {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
      [(UIMovieScrubberAccessibility *)v66 setEditing:1 animated:0];
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 2u);
      id v30 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_editingView"];
      id v53 = (id)[v30 safeValueForKey:@"_rightImageView"];

      [v53 frame];
      double v49 = v12;
      double v50 = v13;
      double v51 = v14;
      double v52 = v15;
      id v31 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimEndValue"];
      [v31 doubleValue];
      double v32 = v16;

      double v48 = v32;
      double v47 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v49, v50, v51, v52);
      if (v64) {
        double v47 = v47 * *(float *)&LargeStepMultiplier;
      }
      double v46 = v48 - v47;
      [(UIMovieScrubberAccessibility *)v66 setTrimEndValue:v48 - v47];
      id v28 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimEndValue"];
      [v28 doubleValue];
      double v29 = v17;

      double v45 = v29;
      if (v48 != v29) {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingEndValueDidChange:](v66, v45);
      }
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 2u);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
    [(UIMovieScrubberAccessibility *)v66 setEditing:1 animated:0];
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 1u);
    id v37 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_editingView"];
    id v62 = (id)[v37 safeValueForKey:@"_leftImageView"];

    [v62 frame];
    double v58 = v5;
    double v59 = v6;
    double v60 = v7;
    double v61 = v8;
    id v38 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimStartValue"];
    [v38 doubleValue];
    double v39 = v9;

    double v57 = v39;
    double v56 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v58, v59, v60, v61);
    if (v64) {
      double v56 = v56 * *(float *)&LargeStepMultiplier;
    }
    double v55 = v57 - v56;
    [(UIMovieScrubberAccessibility *)v66 setTrimStartValue:v57 - v56];
    id v35 = (id)[(UIMovieScrubberAccessibility *)v66 safeValueForKey:@"_trimStartValue"];
    [v35 doubleValue];
    double v36 = v10;

    double v54 = v36;
    if (v57 != v36) {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingStartValueDidChange:](v66, v54);
    }
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 1u);
    objc_storeStrong(&v62, 0);
  }
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
}

@end