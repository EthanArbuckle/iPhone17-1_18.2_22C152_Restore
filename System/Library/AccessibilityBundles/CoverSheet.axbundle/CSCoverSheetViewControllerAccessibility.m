@interface CSCoverSheetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShowWallpaperCollections;
- (BOOL)_axDismissTodayView;
- (BOOL)_axIsCapabilityRestricted:(unint64_t)a3;
- (BOOL)_axIsTodayViewShowing;
- (BOOL)_axShowCameraView;
- (BOOL)_axShowTodayView;
- (id)accessibilityCustomActions;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_presentModalViewController:(id)a3 shouldDismissOverlays:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)viewDidLoad;
@end

@implementation CSCoverSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSCoverSheetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"dateViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"dateView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_presentModalViewController:shouldDismissOverlays:animated:completion:", "v", "@", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"isPasscodeLockVisible", "B", 0);
  [v3 validateClass:@"CSCoverSheetViewController" hasInstanceVariable:@"_posterSwitcherGestureRecognizer" withType:"UILongPressGestureRecognizer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_isPresentingPosterSwitcher", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"_handlePosterSwitcherActivation:", "v", "@", 0);
  [v3 validateClass:@"CSCoverSheetViewController" hasProperty:@"activeBehavior" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"activateTodayViewWithCompletion:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"deactivateTodayViewWithCompletion:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"activateCameraViewAnimated:sendingActions:completion:", "v", "B", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSBehavior", @"areRestrictedCapabilities:", "B", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  [(CSCoverSheetViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CSCoverSheetViewControllerAccessibility *)self safeValueForKeyPath:@"dateViewController.dateView"];
  [v3 _accessibilitySetAssignedValue:self forKey:@"AXSBFDateViewDashboardController"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  [(CSCoverSheetViewControllerAccessibility *)&v3 viewDidLoad];
  [(CSCoverSheetViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_presentModalViewController:(id)a3 shouldDismissOverlays:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  [(CSCoverSheetViewControllerAccessibility *)&v6 _presentModalViewController:a3 shouldDismissOverlays:a4 animated:a5 completion:a6];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __113__CSCoverSheetViewControllerAccessibility__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke()
{
}

- (id)accessibilityCustomActions
{
  if (!_AXSAssistiveTouchScannerEnabled())
  {
    v17.receiver = self;
    v17.super_class = (Class)CSCoverSheetViewControllerAccessibility;
    uint64_t v3 = [(CSCoverSheetViewControllerAccessibility *)&v17 accessibilityCustomActions];
    goto LABEL_5;
  }
  if ([(CSCoverSheetViewControllerAccessibility *)self safeBoolForKey:@"isPasscodeLockVisible"])
  {
    uint64_t v3 = objc_opt_new();
LABEL_5:
    id v4 = (id)v3;
    goto LABEL_16;
  }
  v5 = [MEMORY[0x263EFF980] array];
  objc_super v6 = [(CSCoverSheetViewControllerAccessibility *)self safeValueForKey:@"_posterSwitcherGestureRecognizer"];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"wallpaper.collections");
    v9 = (void *)[v7 initWithName:v8 target:self selector:sel__accessibilityShowWallpaperCollections];

    [v9 setIgnoreWhenVoiceOverTouches:1];
    [v9 setShouldSuppressActionHint:1];
    [v5 addObject:v9];
  }
  if (![(CSCoverSheetViewControllerAccessibility *)self _axIsCapabilityRestricted:64])
  {
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v11 = accessibilityLocalizedString(@"today.visible.key");
    v12 = (void *)[v10 initWithName:v11 target:self selector:sel__axShowTodayView];

    [v12 setIgnoreWhenVoiceOverTouches:1];
    [v5 addObject:v12];
  }
  if (![(CSCoverSheetViewControllerAccessibility *)self _axIsCapabilityRestricted:4])
  {
    id v13 = objc_alloc(MEMORY[0x263F1C390]);
    v14 = accessibilityLocalizedString(@"camera.visible");
    v15 = (void *)[v13 initWithName:v14 target:self selector:sel__axShowCameraView];

    [v15 setIgnoreWhenVoiceOverTouches:1];
    [v5 addObject:v15];
  }
  if ([v5 count]) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }

LABEL_16:

  return v4;
}

- (BOOL)_axShowTodayView
{
  if ([(CSCoverSheetViewControllerAccessibility *)self _axIsTodayViewShowing])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    AXPerformSafeBlock();
    BOOL v3 = [(CSCoverSheetViewControllerAccessibility *)self _axIsTodayViewShowing];
    if (v3)
    {
      id v4 = accessibilityLocalizedString(@"did.show.today.view.announcement");
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
  }
  return v3;
}

uint64_t __59__CSCoverSheetViewControllerAccessibility__axShowTodayView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateTodayViewWithCompletion:&__block_literal_global_352];
}

- (BOOL)_axDismissTodayView
{
  BOOL v3 = [(CSCoverSheetViewControllerAccessibility *)self _axIsTodayViewShowing];
  if (v3)
  {
    AXPerformSafeBlock();
    LOBYTE(v3) = ![(CSCoverSheetViewControllerAccessibility *)self _axIsTodayViewShowing];
  }
  return v3;
}

uint64_t __62__CSCoverSheetViewControllerAccessibility__axDismissTodayView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateTodayViewWithCompletion:&__block_literal_global_357];
}

- (BOOL)_axIsTodayViewShowing
{
  return [(CSCoverSheetViewControllerAccessibility *)self safeBoolForKey:@"_isTodayViewOverlayShowing"];
}

- (BOOL)_axShowCameraView
{
  return 1;
}

uint64_t __60__CSCoverSheetViewControllerAccessibility__axShowCameraView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateCameraViewAnimated:1 sendingActions:0 completion:&__block_literal_global_363];
}

- (BOOL)_accessibilityShowWallpaperCollections
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v2 = objc_alloc_init(MEMORY[0x263F1C7A0]);
  [v2 setState:1];
  id v3 = v2;
  AXPerformSafeBlock();
  if (*((unsigned char *)v8 + 24))
  {
    id v4 = accessibilityLocalizedString(@"wallpaper.collections");
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    BOOL v5 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v5;
}

uint64_t __81__CSCoverSheetViewControllerAccessibility__accessibilityShowWallpaperCollections__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handlePosterSwitcherActivation:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) _isPresentingPosterSwitcher];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_axIsCapabilityRestricted:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v5 = [(CSCoverSheetViewControllerAccessibility *)self safeValueForKey:@"activeBehavior"];
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__CSCoverSheetViewControllerAccessibility__axIsCapabilityRestricted___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) areRestrictedCapabilities:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end