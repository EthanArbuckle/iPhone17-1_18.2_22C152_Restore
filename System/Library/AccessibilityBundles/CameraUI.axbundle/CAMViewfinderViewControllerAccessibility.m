@interface CAMViewfinderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_shouldHideZoomControlForGraphConfiguration:(id)a3;
- (BOOL)_startCapturingVideoWithRequest:(id)a3;
- (BOOL)_stopCapturingVideo;
- (BOOL)accessibilityPerformMagicTap;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateForGraphConfiguration;
- (void)_axUpdateInternalMotionManager;
- (void)_embedDescriptionOverlayView:(id)a3 forMode:(int64_t)a4;
- (void)_handleFilterButtonTapped:(id)a3;
- (void)_handleSmartStylePadValueChanged:(CGPoint)a3;
- (void)_presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4;
- (void)_setCurrentGraphConfiguration:(id)a3;
- (void)_updateBadgeVisibilityAnimated:(BOOL)a3;
- (void)_updateForShallowDepthOfFieldStatusChangedAnimated:(BOOL)a3;
- (void)_updateLevelMotionTracking;
- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CAMViewfinderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMViewfinderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMPreviewView"];
  [v3 validateClass:@"CAMPortraitModeInstructionLabel" isKindOfClass:@"CAMInstructionLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_shallowDepthOfFieldStatus", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_portraitModeInstructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentGraphConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_setCurrentGraphConfiguration:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_motionController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMInstructionLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderView", @"previewView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_captureController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleFilterButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleShutterButtonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleShutterButtonReleased:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_updateForShallowDepthOfFieldStatusChangedAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_updateBadgeVisibilityAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_shouldHideFlashBadgeForGraphConfiguration:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"viewfinderView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_presentCameraRollViewControllerAnimated:interactive:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_isShowingCameraRoll", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureGraphConfiguration", @"device", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureGraphConfiguration", @"mode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_embedDescriptionOverlayView:forMode:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_shouldHideZoomControlForGraphConfiguration:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"controlStatusBar:didReceiveTapInIndicatorForType:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_controlDrawer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_startCapturingVideoWithRequest:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_stopCapturingVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_dynamicShutterControl", "@", 0);
  [v3 validateClass:@"CAMDynamicShutterControl" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"externalButtonPressedWithBehavior:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"externalButtonReleased", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_descriptionOverlayViewByMode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureGraphConfiguration", @"mode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleSmartStylePadValueChanged:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_fullscreenViewfinder", "@", 0);
}

- (BOOL)_startCapturingVideoWithRequest:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  BOOL v3 = [(CAMViewfinderViewControllerAccessibility *)&v5 _startCapturingVideoWithRequest:a3];
  AXPerformBlockAsynchronouslyOnMainThread();
  return v3;
}

uint64_t __76__CAMViewfinderViewControllerAccessibility__startCapturingVideoWithRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axUpdateInternalMotionManager];
}

- (BOOL)_stopCapturingVideo
{
  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  BOOL v2 = [(CAMViewfinderViewControllerAccessibility *)&v4 _stopCapturingVideo];
  AXPerformBlockAsynchronouslyOnMainThread();
  return v2;
}

uint64_t __63__CAMViewfinderViewControllerAccessibility__stopCapturingVideo__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axUpdateInternalMotionManager];
}

- (BOOL)accessibilityPerformMagicTap
{
  BOOL v3 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_dynamicShutterControl"];
  objc_super v4 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"__shutterButton"];
  objc_super v5 = v4;
  if (!v3)
  {
    if ([v4 safeBoolForKey:@"isEnabled"])
    {
      v7 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_bottomBar"];
      int v8 = [v7 safeBoolForKey:@"isEnabled"];

      if (v8)
      {
        id v11 = v5;
        AXPerformSafeBlock();
        v6 = v11;
        goto LABEL_7;
      }
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  if (![v3 safeBoolForKey:@"isEnabled"]) {
    goto LABEL_8;
  }
  id v12 = v3;
  AXPerformSafeBlock();
  v6 = v12;
LABEL_7:

  BOOL v9 = 1;
LABEL_9:

  return v9;
}

uint64_t __72__CAMViewfinderViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) externalButtonPressedWithBehavior:1];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 externalButtonReleased];
}

uint64_t __72__CAMViewfinderViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleShutterButtonPressed:*(void *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _handleShutterButtonReleased:v3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateForGraphConfiguration];
}

- (void)_updateLevelMotionTracking
{
  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v3 _updateLevelMotionTracking];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
}

- (void)_presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v5 _presentCameraRollViewControllerAnimated:a3 interactive:a4];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
}

- (void)_embedDescriptionOverlayView:(id)a3 forMode:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v5 _embedDescriptionOverlayView:a3 forMode:a4];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
}

- (BOOL)_shouldHideZoomControlForGraphConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  BOOL v4 = [(CAMViewfinderViewControllerAccessibility *)&v6 _shouldHideZoomControlForGraphConfiguration:a3];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateInternalMotionManager];
  return v4;
}

- (void)_axUpdateInternalMotionManager
{
  LOBYTE(v20) = 0;
  objc_opt_class();
  objc_super v3 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_currentGraphConfiguration"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = [v5 applicationState];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v7 = v4;
  AXPerformSafeBlock();
  int v8 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  BOOL v9 = +[AXCameraVisionEngine sharedEngine];
  [v9 setAppActive:v6 == 0];

  LOBYTE(v20) = 0;
  objc_opt_class();
  v10 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_motionController"];
  id v11 = __UIAccessibilityCastAsSafeCategory();

  if ((_BYTE)v20) {
    goto LABEL_13;
  }
  id v12 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_captureController"];
  LOBYTE(v20) = 0;
  objc_opt_class();
  v13 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_descriptionOverlayViewByMode"];
  v14 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v20) {
    goto LABEL_13;
  }
  LOBYTE(v20) = 0;
  objc_opt_class();
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "mode"));
  v16 = [v14 objectForKeyedSubscript:v15];
  v17 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v20) {
LABEL_13:
  }
    abort();
  int v18 = [v17 _accessibilityViewIsVisible];
  if (([v12 safeBoolForKey:@"isCapturingVideo"] & 1) != 0
    || (char v19 = [v12 safeBoolForKey:@"isCapturingStandardVideo"], v8)
    || v6
    || (v19 & 1) != 0
    || (([(CAMViewfinderViewControllerAccessibility *)self safeBoolForKey:@"_isShowingCameraRoll"] | v18) & 1) != 0)
  {
    [v11 axStopInternalMotionManager];
  }
  else
  {
    [v11 axStartInternalMotionManagerIfNecessary];
  }
}

uint64_t __74__CAMViewfinderViewControllerAccessibility__axUpdateInternalMotionManager__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldMonitorDeviceMotionForGraphConfiguration:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_handleFilterButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v3 _handleFilterButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_updateForShallowDepthOfFieldStatusChangedAnimated:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v8 _updateForShallowDepthOfFieldStatusChangedAnimated:a3];
  if ([(CAMViewfinderViewControllerAccessibility *)self safeIntegerForKey:@"_currentMode"] == 6)
  {
    if (([(CAMViewfinderViewControllerAccessibility *)self safeIntegerForKey:@"_shallowDepthOfFieldStatus"] & 0xFFFFFFFFFFFFFFF7) == 1)
    {
      BOOL v4 = accessibilityCameraUILocalizedString(@"depth.enabled");
      UIAccessibilitySpeak();
    }
    else
    {
      objc_opt_class();
      objc_super v5 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKeyPath:@"_portraitModeInstructionLabel.text"];
      BOOL v4 = __UIAccessibilityCastAsClass();

      uint64_t v6 = accessibilityCameraUILocalizedString(@"depth.disabled");
      id v7 = __AXStringForVariables();
      UIAccessibilitySpeak();
    }
  }
}

- (void)_updateBadgeVisibilityAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v3 _updateBadgeVisibilityAnimated:a3];
  AXPerformSafeBlock();
}

void __75__CAMViewfinderViewControllerAccessibility__updateBadgeVisibilityAnimated___block_invoke(uint64_t a1)
{
  objc_opt_class();
  BOOL v2 = [*(id *)(a1 + 32) safeValueForKey:@"_currentGraphConfiguration"];
  objc_super v3 = __UIAccessibilityCastAsClass();

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) safeValueForKey:@"viewfinderView"];
    objc_super v5 = [v4 safeValueForKey:@"previewView"];
    MEMORY[0x2455E18B0](@"CAMPreviewView");
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideFlashBadgeForGraphConfiguration:", v3) ^ 1, @"AXCameraWillUseFlashKey");
    }
  }
}

- (void)_setCurrentGraphConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  [(CAMViewfinderViewControllerAccessibility *)&v4 _setCurrentGraphConfiguration:a3];
  [(CAMViewfinderViewControllerAccessibility *)self _axUpdateForGraphConfiguration];
}

- (void)_axUpdateForGraphConfiguration
{
  objc_opt_class();
  objc_super v3 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_currentGraphConfiguration"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 device];
  uint64_t v6 = [v4 mode];
  if ((unint64_t)(v5 - 1) > 0xA) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_2401C1980[v5 - 1];
  }
  objc_super v8 = +[AXCameraVisionEngine sharedEngine];
  [v8 setCaptureDevicePosition:v7 mode:v6];
}

- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility controlStatusBar:didReceiveTapInIndicatorForType:](&v8, sel_controlStatusBar_didReceiveTapInIndicatorForType_, a3);
  if (a4 >= 3)
  {
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CE68];
    uint64_t v7 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_controlDrawer"];
    UIAccessibilityPostNotification(v6, v7);
  }
}

- (void)_handleSmartStylePadValueChanged:(CGPoint)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _handleSmartStylePadValueChanged:](&v5, sel__handleSmartStylePadValueChanged_, a3.x, a3.y);
  objc_super v4 = [(CAMViewfinderViewControllerAccessibility *)self safeValueForKey:@"_fullscreenViewfinder"];
  [v4 _accessibilityLoadAccessibilityInformation];
}

@end