@interface VideosUI_MultiPlayerGrabberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_axMultiviewController;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation VideosUI_MultiPlayerGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MultiPlayerGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.MultiPlayerViewController" hasSwiftField:@"isDetailsViewControllerVisible" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosUI.MultiPlayerViewController", @"setDetailsViewControllerVisible:animated:completion:", "v", "B", "B", "@?", 0);
}

- (id)_axMultiviewController
{
  v2 = [(VideosUI_MultiPlayerGrabberViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_17 startWithSelf:0];
  id v3 = [v2 _accessibilityViewController];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(VideosUI_MultiPlayerGrabberViewAccessibility *)self _axMultiviewController];
  int v3 = [v2 safeSwiftBoolForKey:@"isDetailsViewControllerVisible"];

  if (v3) {
    v4 = @"multiview.addMoreGames.grabber.hide";
  }
  else {
    v4 = @"multiview.addMoreGames.grabber.show";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VideosUI_MultiPlayerGrabberViewAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  v2 = [(VideosUI_MultiPlayerGrabberViewAccessibility *)self _axMultiviewController];
  [v2 safeSwiftBoolForKey:@"isDetailsViewControllerVisible"];
  v5 = v2;
  id v3 = v2;
  AXPerformSafeBlock();

  return 1;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
    [(VideosUI_MultiPlayerGrabberViewAccessibility *)&v6 setHidden:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  [(VideosUI_MultiPlayerGrabberViewAccessibility *)&v5 setHidden:v3];
}

- (void)setAlpha:(double)a3
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
    [(VideosUI_MultiPlayerGrabberViewAccessibility *)&v6 setAlpha:1.0];
  }
  v5.receiver = self;
  v5.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  [(VideosUI_MultiPlayerGrabberViewAccessibility *)&v5 setAlpha:a3];
}

@end