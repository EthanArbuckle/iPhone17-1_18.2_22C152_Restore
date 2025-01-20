@interface VideosPlaybackViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axOverlayViewVisible;
- (BOOL)_canHideOverlayView;
- (void)_axAnnounceControlsVisible:(BOOL)a3;
- (void)_handleSingleTap:(id)a3;
- (void)_hideOverlayViewWithCompletionBlock:(id)a3;
- (void)_overlayIdleTimerFired:(id)a3;
- (void)_showOverlayViewQuickHide:(BOOL)a3;
@end

@implementation VideosPlaybackViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosPlaybackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosPlaybackViewController" hasInstanceVariable:@"_overlayView" withType:"VideosPlaybackOverlayView"];
  [v3 validateClass:@"VideosPlaybackViewController" hasInstanceVariable:@"_overlayViewVisible" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_canHideOverlayView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_hideOverlayViewWithCompletionBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_showOverlayViewQuickHide:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_handleSingleTap:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_overlayIdleTimerFired:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPlaybackViewController", @"_cancelOverlayIdleTimer:", "v", ":", 0);
}

- (BOOL)_canHideOverlayView
{
  int v3 = [(VideosPlaybackViewControllerAccessibility *)self _accessibilityBoolValueForKey:@"AXConsumeSingleTap"];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (v3)
    {
      [(VideosPlaybackViewControllerAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"AXConsumeSingleTap"];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosPlaybackViewControllerAccessibility;
    return [(VideosPlaybackViewControllerAccessibility *)&v5 _canHideOverlayView];
  }
}

- (BOOL)_axOverlayViewVisible
{
  return [(VideosPlaybackViewControllerAccessibility *)self safeBoolForKey:@"_overlayViewVisible"];
}

- (void)_hideOverlayViewWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VideosPlaybackViewControllerAccessibility *)self _axOverlayViewVisible];
  v7.receiver = self;
  v7.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  [(VideosPlaybackViewControllerAccessibility *)&v7 _hideOverlayViewWithCompletionBlock:v4];

  BOOL v6 = [(VideosPlaybackViewControllerAccessibility *)self _axOverlayViewVisible];
  if (v5 != v6) {
    [(VideosPlaybackViewControllerAccessibility *)self _axAnnounceControlsVisible:v6];
  }
}

- (void)_axAnnounceControlsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21988]);
  if (v3) {
    id v4 = @"controls.shown";
  }
  else {
    id v4 = @"controls.hidden";
  }
  accessibilityLocalizedString(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)_handleSingleTap:(id)a3
{
  id v4 = a3;
  if ([(VideosPlaybackViewControllerAccessibility *)self _axOverlayViewVisible]) {
    [(VideosPlaybackViewControllerAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXConsumeSingleTap"];
  }
  v5.receiver = self;
  v5.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  [(VideosPlaybackViewControllerAccessibility *)&v5 _handleSingleTap:v4];
}

- (void)_showOverlayViewQuickHide:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(VideosPlaybackViewControllerAccessibility *)self _axOverlayViewVisible];
  v7.receiver = self;
  v7.super_class = (Class)VideosPlaybackViewControllerAccessibility;
  [(VideosPlaybackViewControllerAccessibility *)&v7 _showOverlayViewQuickHide:v3];
  BOOL v6 = [(VideosPlaybackViewControllerAccessibility *)self _axOverlayViewVisible];
  if (v5 != v6) {
    [(VideosPlaybackViewControllerAccessibility *)self _axAnnounceControlsVisible:v6];
  }
}

- (void)_overlayIdleTimerFired:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    BOOL v5 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x263F1CE20]);
    char v9 = 0;
    objc_opt_class();
    BOOL v6 = [(VideosPlaybackViewControllerAccessibility *)self safeValueForKey:@"_overlayView"];
    objc_super v7 = __UIAccessibilityCastAsClass();

    if ([v5 _accessibilityIsDescendantOfElement:v7])
    {
      AXPerformSafeBlock();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)VideosPlaybackViewControllerAccessibility;
      [(VideosPlaybackViewControllerAccessibility *)&v8 _overlayIdleTimerFired:v4];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosPlaybackViewControllerAccessibility;
    [(VideosPlaybackViewControllerAccessibility *)&v10 _overlayIdleTimerFired:v4];
  }
}

uint64_t __68__VideosPlaybackViewControllerAccessibility__overlayIdleTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelOverlayIdleTimer:sel__accessibilitySnarfed];
}

@end