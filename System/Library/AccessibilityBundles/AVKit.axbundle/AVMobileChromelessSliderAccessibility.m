@interface AVMobileChromelessSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilityAnnounceNewValue;
@end

@implementation AVMobileChromelessSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVMobileChromelessSlider" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessSlider", @"continueTrackingWithTouch:withEvent:", "B", "@", "@", 0);
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasProperty:@"playerController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessTimelineView", @"trailingTimeText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessSlider", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessSlider", @"accessibilityIncrement", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessSlider", @"accessibilityDecrement", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"seekByTimeInterval:", "v", "d", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"time.position.scrubber");
}

- (id)accessibilityValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 superview];

  v4 = [v3 safeStringForKey:@"trailingTimeText"];
  if (v4)
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"media.time.remaining");
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_accessibilityAnnounceNewValue
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [(AVMobileChromelessSliderAccessibility *)self _accessibilityAXAttributedValue];
  UIAccessibilityPostNotification(v2, v3);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessSliderAccessibility;
  BOOL v4 = [(AVMobileChromelessSliderAccessibility *)&v6 continueTrackingWithTouch:a3 withEvent:a4];
  AXPerformSafeBlock();
  return v4;
}

uint64_t __77__AVMobileChromelessSliderAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceNewValue];
}

@end