@interface MediaControlsTimeControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axPostUpdate;
- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MediaControlsTimeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsTimeControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MediaControlsTimeControl" hasInstanceVariable:@"_currentTimeInTrack" withType:"d"];
  [v3 validateClass:@"MediaControlsTimeControl" hasInstanceVariable:@"_sliderValue" withType:"d"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"setSliderValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"knobView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"liveBackground", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"isCurrentlyTracking", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"_updateLabels:withRemainingDuration:", "v", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTimeControl", @"continueTrackingWithTouch:withEvent:", "B", "@", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"track.position.label");
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MediaControlsTimeControlAccessibility *)self safeUIViewForKey:@"knobView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;
  [v2 frame];
  double v8 = v4 - v7 * 0.5;
  [v2 frame];
  double v10 = v6 - v9 * 0.5;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsTimeControlAccessibility;
  -[MediaControlsTimeControlAccessibility _updateLabels:withRemainingDuration:](&v7, sel__updateLabels_withRemainingDuration_, a3);
  double v6 = [NSNumber numberWithDouble:a4];
  [(MediaControlsTimeControlAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"AXRemaining"];
}

- (id)accessibilityValue
{
  double v3 = [(MediaControlsTimeControlAccessibility *)self safeUIViewForKey:@"liveBackground"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    double v5 = accessibilityLocalizedString(@"slider.live");
  }
  else
  {
    [(MediaControlsTimeControlAccessibility *)self safeDoubleForKey:@"_currentTimeInTrack"];
    double v6 = [(MediaControlsTimeControlAccessibility *)self _accessibilityValueForKey:@"AXRemaining"];
    [v6 doubleValue];

    objc_super v7 = UIAXTimeStringForDuration();
    double v8 = UIAXTimeStringForDuration();
    int v9 = [(MediaControlsTimeControlAccessibility *)self safeBoolForKey:@"isCurrentlyTracking"];
    id v10 = objc_allocWithZone(MEMORY[0x263F089D8]);
    double v11 = v10;
    if (v9)
    {
      double v12 = (void *)[v10 initWithFormat:@"%@", @"__1__"];
    }
    else
    {
      v13 = accessibilityLocalizedString(@"slider.time.position");
      double v12 = objc_msgSend(v11, "initWithFormat:", v13, @"__1__", @"__2__");
    }
    uint64_t v15 = [v12 rangeOfString:@"__1__"];
    uint64_t v16 = v14;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v15, v14, v7);
      uint64_t v16 = [v7 length];
    }
    uint64_t v18 = [v12 rangeOfString:@"__2__"];
    uint64_t v19 = v17;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v18, v17, v8);
      uint64_t v19 = [v8 length];
    }
    v20 = [MEMORY[0x263F21660] axAttributedStringWithString:v12];
    double v5 = v20;
    v21 = (void *)MEMORY[0x263EFFB40];
    v22 = (void *)MEMORY[0x263F21740];
    if (v16) {
      objc_msgSend(v20, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21740], v15, v16);
    }
    if (v19) {
      objc_msgSend(v5, "setAttribute:forKey:withRange:", *v21, *v22, v18, v19);
    }
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  return @"TrackPosition";
}

- (void)_axPostUpdate
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [(MediaControlsTimeControlAccessibility *)self accessibilityValue];
  UIAccessibilityPostNotification(v2, v3);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsTimeControlAccessibility;
  BOOL v5 = [(MediaControlsTimeControlAccessibility *)&v9 continueTrackingWithTouch:a3 withEvent:a4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(MediaControlsTimeControlAccessibility *)self safeCGFloatForKey:@"_sliderValue"];
    uint64_t v7 = *(void *)&v6;
    if (vabdd_f64(v6, *(double *)&continueTrackingWithTouch_withEvent__LastValue) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&continueTrackingWithTouch_withEvent__LastTime > 5.0)
    {
      [(MediaControlsTimeControlAccessibility *)self _axPostUpdate];
      continueTrackingWithTouch_withEvent__LastValue = v7;
      continueTrackingWithTouch_withEvent__LastTime = CFAbsoluteTimeGetCurrent();
    }
  }
  return v5;
}

- (void)accessibilityDecrement
{
}

uint64_t __63__MediaControlsTimeControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSliderValue:*(double *)(a1 + 40) + -0.1];
  UIAccessibilityNotifications v2 = *(void **)(a1 + 32);

  return [v2 endTrackingWithTouch:0 withEvent:0];
}

- (void)accessibilityIncrement
{
}

uint64_t __63__MediaControlsTimeControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSliderValue:*(double *)(a1 + 40) + 0.1];
  UIAccessibilityNotifications v2 = *(void **)(a1 + 32);

  return [v2 endTrackingWithTouch:0 withEvent:0];
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTimeControlAccessibility;
  unint64_t v3 = [(MediaControlsTimeControlAccessibility *)&v5 accessibilityTraits];
  if ([(MediaControlsTimeControlAccessibility *)self safeBoolForKey:@"isUserInteractionEnabled"])return *MEMORY[0x263F1CED8] | v3; {
  else
  }
    return _AXTraitsRemoveTrait();
}

@end