@interface ARQuickLookOverlayControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)axShouldDisableAutoHidingControls;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSpeakUpdateToStatusPill;
- (void)axUpdateAutoHideControlsTimer;
- (void)enableWorldModeControl:(BOOL)a3;
- (void)startAutoHideControlsTimer;
- (void)updateStatusPill;
@end

@implementation ARQuickLookOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AssetViewer.ARQuickLookOverlayController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"dismissButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"shareButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVButton", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"startAutoHideControlsTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"enableWorldModeControl:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"updateStatusPill", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"statusPill", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVTrackingStateStatusLabel", @"text", "@", 0);
}

- (void)axUpdateAutoHideControlsTimer
{
}

uint64_t __74__ARQuickLookOverlayControllerAccessibility_axUpdateAutoHideControlsTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAutoHideControlsTimer];
}

- (BOOL)axShouldDisableAutoHidingControls
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  [(ARQuickLookOverlayControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ARQuickLookOverlayControllerAccessibility *)self safeValueForKey:@"dismissButton"];
  v4 = [v3 safeValueForKey:@"button"];
  v5 = accessibilityLocalizedString(@"CLOSE_BUTTON");
  [v4 setAccessibilityLabel:v5];

  v6 = [(ARQuickLookOverlayControllerAccessibility *)self safeValueForKey:@"shareButton"];
  v7 = [v6 safeValueForKey:@"button"];
  v8 = accessibilityLocalizedString(@"SHARE_BUTTON");
  [v7 setAccessibilityLabel:v8];
}

- (void)startAutoHideControlsTimer
{
  if ([(ARQuickLookOverlayControllerAccessibility *)self axShouldDisableAutoHidingControls])
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    uint64_t v5 = 3221225472;
    v6 = __71__ARQuickLookOverlayControllerAccessibility_startAutoHideControlsTimer__block_invoke;
    v7 = &unk_265108668;
    v8 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
    [(ARQuickLookOverlayControllerAccessibility *)&v3 startAutoHideControlsTimer];
  }
}

uint64_t __71__ARQuickLookOverlayControllerAccessibility_startAutoHideControlsTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAutoHideControlsTimerWithShouldRestart:0];
}

- (void)enableWorldModeControl:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  [(ARQuickLookOverlayControllerAccessibility *)&v3 enableWorldModeControl:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_axSpeakUpdateToStatusPill
{
  id v5 = [(ARQuickLookOverlayControllerAccessibility *)self safeUIViewForKey:@"statusPill"];
  [v5 alpha];
  v2 = v5;
  if (v3 > 0.0)
  {
    uint64_t v4 = [v5 safeStringForKey:@"text"];
    if ([v4 length]) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
    }

    v2 = v5;
  }
}

- (void)updateStatusPill
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__axSpeakUpdateToStatusPill object:0];
  v3.receiver = self;
  v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  [(ARQuickLookOverlayControllerAccessibility *)&v3 updateStatusPill];
  [(ARQuickLookOverlayControllerAccessibility *)self performSelector:sel__axSpeakUpdateToStatusPill withObject:0 afterDelay:0.5];
}

@end