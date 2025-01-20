@interface PHCallParticipantsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsDisplayedInBanner;
- (BOOL)isAccessibilityElement;
- (void)updateParticipantsAnimated:(BOOL)a3;
@end

@implementation PHCallParticipantsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHCallParticipantsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"callDisplayStyleManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ICSCallDisplayStyleManager", @"callDisplayStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"singleCallLabelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"shouldIgnoreUpdates", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallParticipantsView", @"updateParticipantsAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSingleCallParticipantLabelView", @"bannerButtonsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBannerButtonsView", @"rightButton", "@", 0);
}

- (void)updateParticipantsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHCallParticipantsViewAccessibility *)self safeUIViewForKey:@"singleCallLabelView"];

  v9.receiver = self;
  v9.super_class = (Class)PHCallParticipantsViewAccessibility;
  [(PHCallParticipantsViewAccessibility *)&v9 updateParticipantsAnimated:v3];
  if (([(PHCallParticipantsViewAccessibility *)self safeBoolForKey:@"shouldIgnoreUpdates"] & 1) == 0
    && !v5)
  {
    v6 = [(PHCallParticipantsViewAccessibility *)self safeValueForKeyPath:@"singleCallLabelView.bannerButtonsView"];
    v8 = [v6 safeUIViewForKey:@"rightButton"];
    id v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __66__PHCallParticipantsViewAccessibility_updateParticipantsAnimated___block_invoke(uint64_t a1)
{
}

- (BOOL)isAccessibilityElement
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    BOOL v3 = [MEMORY[0x263F22938] sharedInstance];
    if ([v3 assistiveTouchScannerSpeechEnabled]) {
      LOBYTE(v4) = 0;
    }
    else {
      BOOL v4 = ![(PHCallParticipantsViewAccessibility *)self _accessibilityIsDisplayedInBanner];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityIsDisplayedInBanner
{
  v2 = [(PHCallParticipantsViewAccessibility *)self safeValueForKey:@"callDisplayStyleManager"];
  BOOL v3 = [v2 safeIntegerForKey:@"callDisplayStyle"] == 0;

  return v3;
}

@end