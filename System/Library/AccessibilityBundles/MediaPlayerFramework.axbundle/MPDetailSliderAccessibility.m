@interface MPDetailSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCommitPositionChange;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axPostUpdate;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
@end

@implementation MPDetailSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPDetailSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"timeLabelStyle", "q", 0);
  [v3 validateClass:@"MPDetailSlider" hasInstanceVariable:@"_downloadingTrackOverlay" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"duration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"_maxTrackView", "@", 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MPDetailSliderAccessibility;
  [(MPDetailSliderAccessibility *)&v3 layoutSubviews];
  [(MPDetailSliderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MPDetailSliderAccessibility;
  [(MPDetailSliderAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"_maxTrackView"];
  v4 = __UIAccessibilitySafeClass();

  [v4 setUserInteractionEnabled:0];
  v5 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"_downloadingTrackOverlay"];
  v6 = __UIAccessibilitySafeClass();

  [v6 setUserInteractionEnabled:0];
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)MPDetailSliderAccessibility;
  unint64_t v3 = [(MPDetailSliderAccessibility *)&v5 accessibilityTraits];
  if ([(MPDetailSliderAccessibility *)self safeBoolForKey:@"isUserInteractionEnabled"]) {
    return *MEMORY[0x263F1CED8] | v3;
  }
  else {
    return _AXTraitsRemoveTrait();
  }
}

- (CGRect)accessibilityFrame
{
  [(MPDetailSliderAccessibility *)self bounds];

  MEMORY[0x270F80998](self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  [(MPDetailSliderAccessibility *)self safeCGRectForKey:@"thumbHitRect"];
  CGRect v8 = UIAccessibilityConvertFrameToScreenCoordinates(v7, (UIView *)self);

  MEMORY[0x270F0A3B0]((__n128)v8.origin, *(__n128 *)&v8.origin.y, (__n128)v8.size, *(__n128 *)&v8.size.height);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_accessibilityCommitPositionChange
{
  id v10 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"_delegate"];
  double v3 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"value"];
  [v3 doubleValue];
  double v5 = v4;

  [(MPDetailSliderAccessibility *)self safeDoubleForKey:@"duration"];
  double v7 = v6;
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v8 = v5;
    if (v7 > 0.0)
    {
      float v9 = v7 * *(float *)&v8;
      *(float *)&double v8 = v9;
    }
    [v10 detailSlider:self didChangeValue:v8];
  }
  if (objc_opt_respondsToSelector()) {
    [v10 detailSliderTrackingDidEnd:self];
  }
}

- (void)accessibilityIncrement
{
  [(MPDetailSliderAccessibility *)self safeDoubleForKey:@"duration"];
  double v4 = v3;
  [(MPDetailSliderAccessibility *)self _accessibilityIncreaseAmount:1];
  float v6 = v4 * v5;
  double v7 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"availableDuration"];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 >= v6)
  {
    id v11 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"_delegate"];
    if (objc_opt_respondsToSelector()) {
      [v11 detailSliderTrackingDidBegin:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(MPDetailSliderAccessibility *)self _updateTimeDisplayForTime:v6];
    }
    *(float *)&double v10 = v6;
    [(MPDetailSliderAccessibility *)self setValue:0 animated:v10];
    [(MPDetailSliderAccessibility *)self _accessibilityCommitPositionChange];
  }
}

- (void)accessibilityDecrement
{
  [(MPDetailSliderAccessibility *)self safeDoubleForKey:@"duration"];
  double v4 = v3;
  [(MPDetailSliderAccessibility *)self _accessibilityIncreaseAmount:0];
  float v6 = v4 * v5;
  double v7 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"availableDuration"];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 >= v6)
  {
    id v11 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"_delegate"];
    if (objc_opt_respondsToSelector()) {
      [v11 detailSliderTrackingDidBegin:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(MPDetailSliderAccessibility *)self _updateTimeDisplayForTime:v6];
    }
    *(float *)&double v10 = v6;
    [(MPDetailSliderAccessibility *)self setValue:0 animated:v10];
    [(MPDetailSliderAccessibility *)self _accessibilityCommitPositionChange];
  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"track.slider");
}

- (id)accessibilityIdentifier
{
  return @"TrackPosition";
}

- (void)_axPostUpdate
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [(MPDetailSliderAccessibility *)self accessibilityValue];
  UIAccessibilityPostNotification(v2, v3);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MPDetailSliderAccessibility;
  BOOL v5 = [(MPDetailSliderAccessibility *)&v10 continueTrackingWithTouch:a3 withEvent:a4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    float v6 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"value"];
    [v6 floatValue];
    float v8 = v7;

    if (vabds_f32(v8, *(float *)&continueTrackingWithTouch_withEvent__LastValue) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&continueTrackingWithTouch_withEvent__LastTime > 5.0)
    {
      [(MPDetailSliderAccessibility *)self _axPostUpdate];
      continueTrackingWithTouch_withEvent__LastValue = LODWORD(v8);
      continueTrackingWithTouch_withEvent__LastTime = CFAbsoluteTimeGetCurrent();
    }
  }
  return v5;
}

- (id)accessibilityValue
{
  [(MPDetailSliderAccessibility *)self safeDoubleForKey:@"duration"];
  id v3 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"value"];
  [v3 floatValue];

  double v4 = UIAXTimeStringForDuration();
  BOOL v5 = UIAXTimeStringForDuration();
  float v6 = [(MPDetailSliderAccessibility *)self safeValueForKey:@"isTracking"];
  int v7 = [v6 BOOLValue];

  id v8 = objc_allocWithZone(MEMORY[0x263F089D8]);
  double v9 = v8;
  if (v7)
  {
    objc_super v10 = (void *)[v8 initWithFormat:@"%@", @"__1__"];
  }
  else
  {
    id v11 = accessibilityLocalizedString(@"slider.time.position");
    objc_super v10 = objc_msgSend(v9, "initWithFormat:", v11, @"__1__", @"__2__");
  }
  uint64_t v13 = [v10 rangeOfString:@"__1__"];
  uint64_t v14 = v12;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "replaceCharactersInRange:withString:", v13, v12, v4);
    uint64_t v14 = [v4 length];
  }
  uint64_t v16 = [v10 rangeOfString:@"__2__"];
  uint64_t v17 = v15;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "replaceCharactersInRange:withString:", v16, v15, v5);
    uint64_t v17 = [v5 length];
  }
  v18 = [MEMORY[0x263F21660] axAttributedStringWithString:v10];
  v19 = v18;
  v20 = (void *)MEMORY[0x263EFFB40];
  v21 = (void *)MEMORY[0x263F21740];
  if (v14) {
    objc_msgSend(v18, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21740], v13, v14);
  }
  if (v17) {
    objc_msgSend(v19, "setAttribute:forKey:withRange:", *v20, *v21, v16, v17);
  }

  return v19;
}

- (BOOL)isAccessibilityElement
{
  return ([(MPDetailSliderAccessibility *)self safeIntegerForKey:@"timeLabelStyle"] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

@end