@interface CAMPreviewViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (BOOL)_axIsBackFacing;
- (BOOL)_axIsFocusLocked;
- (BOOL)_axIsPortraitMode;
- (BOOL)_axIsUsingFlash;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (CAMPreviewViewAccessibility)initWithFrame:(CGRect)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityZoomIn:(BOOL)a3;
- (void)_showFocusAtPoint:(CGPoint)a3 startAnimating:(BOOL)a4;
@end

@implementation CAMPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPreviewView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMPreviewView" hasInstanceVariable:@"_indicatorContainerView" withType:"CAMInterfaceModulationView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewView", @"videoPreviewView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewView", @"videoPreviewLayer", "@", 0);
  [v3 validateClass:@"CAMViewfinderView"];
  [v3 validateClass:@"CAMViewfinderViewController"];
  [v3 validateClass:@"CAMShallowDepthOfFieldBadge"];
  [v3 validateClass:@"CAMPortraitModeInstructionLabel"];
  [v3 validateClass:@"CAMFullscreenViewfinder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_cachedVideoZoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentMaximumZoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_setCachedVideoZoomFactor:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_updateZoomUIWithZoomFactor: animated:", "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"changeToVideoZoomFactor:graphConfiguration:", "v", "d", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentGraphConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderView", @"bottomBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderView", @"shallowDepthOfFieldBadge", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderView", @"portraitModeInstructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"modeDial", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDial", @"selectedMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_shallowDepthOfFieldStatus", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_targetPortraitModeInstructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMInstructionLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_captureController", "@", 0);
  [v3 validateClass:@"CAMPortraitModeInstructionLabel" isKindOfClass:@"CAMInstructionLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"isCapturingVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"isCapturingStandardVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewView", @"viewportFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_zoomControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_buttonPlatter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomButtonPlatter", @"_platterBackgroundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_modeDial", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_primaryShutterControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomDial", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomDial", @"_contentMaskView", "@", 0);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"viewfinder.label.text");
}

- (id)accessibilityHint
{
  if ([(CAMPreviewViewAccessibility *)self _axIsBackFacing])
  {
    double v3 = accessibilityCameraKitLocalizedString(@"viewfinder.hint");
    if ([(CAMPreviewViewAccessibility *)self _axIsFocusLocked])
    {
      v6 = accessibilityCameraKitLocalizedString(@"viewfinder.hint.focus-locked");
      v4 = __UIAXStringForVariables();
    }
    else
    {
      v4 = __UIAXStringForVariables();
    }
  }
  else
  {
    v4 = accessibilityCameraKitLocalizedString(@"viewfinder.hint.focus-locked");
  }

  return v4;
}

- (BOOL)_axIsPortraitMode
{
  double v2 = [(CAMPreviewViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMFullscreenViewfinder", a2)];
  double v3 = [v2 safeValueForKeyPath:@"modeDial"];
  MEMORY[0x2455E18B0](@"CAMModeDial");
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 safeIntegerForKey:@"selectedMode"] == 6;

  return v4;
}

- (id)accessibilityValue
{
  if ([(CAMPreviewViewAccessibility *)self _axIsPortraitMode])
  {
    double v3 = [(CAMPreviewViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMFullscreenViewfinder")];
    BOOL v4 = __UIAccessibilitySafeClass();

    v5 = [v4 _accessibilityViewController];
    if (v5 && (MEMORY[0x2455E18B0](@"CAMViewfinderViewController"), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (([v5 safeIntegerForKey:@"_shallowDepthOfFieldStatus"] & 0xFFFFFFFFFFFFFFF7) == 1)
      {
        v6 = accessibilityCameraUILocalizedString(@"depth.enabled");
      }
      else
      {
        objc_opt_class();
        v11 = [v5 safeValueForKeyPath:@"_targetPortraitModeInstructionLabel.text"];
        v12 = __UIAccessibilityCastAsClass();

        v13 = accessibilityCameraUILocalizedString(@"depth.disabled");
        v14 = v12;
        v17 = @"__AXStringForVariablesSentinel";
        v6 = __AXStringForVariables();
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  if ([(CAMPreviewViewAccessibility *)self _axIsBackFacing])
  {
    if ([(CAMPreviewViewAccessibility *)self _axIsFocusLocked]) {
      v7 = @"focus.value.locked";
    }
    else {
      v7 = @"focus.value.unlocked";
    }
    v15 = accessibilityCameraKitLocalizedString(v7);
    v18 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __AXStringForVariables();

    v6 = (void *)v8;
  }
  if ([(CAMPreviewViewAccessibility *)self _axIsUsingFlash])
  {
    v16 = accessibilityCameraUILocalizedString(@"flash.enabled");
    uint64_t v9 = __AXStringForVariables();

    v6 = (void *)v9;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00] | *MEMORY[0x263F21B48];
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  double v2 = [(CAMPreviewViewAccessibility *)self accessibilityElements];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)_showFocusAtPoint:(CGPoint)a3 startAnimating:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CAMPreviewViewAccessibility;
  -[CAMPreviewViewAccessibility _showFocusAtPoint:startAnimating:](&v13, sel__showFocusAtPoint_startAnimating_, a4, a3.x, a3.y);
  uint64_t v6 = [(CAMPreviewViewAccessibility *)self window];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [(CAMPreviewViewAccessibility *)self safeValueForKey:@"_continuousAutoFocusView"];
    if (!v8)
    {
      BOOL v4 = [(CAMPreviewViewAccessibility *)self safeValueForKey:@"_focusView"];
      if (!v4) {
        goto LABEL_9;
      }
    }
    double v9 = CFAbsoluteTimeGetCurrent() - *(double *)&_showFocusAtPoint_startAnimating__LastOutputTime;
    if (v8) {

    }
    else {
    if (v9 > 10.0)
    {
      v10 = (void *)MEMORY[0x263F21660];
      v11 = accessibilityCameraKitLocalizedString(@"auto.focused");
      v7 = [v10 axAttributedStringWithString:v11];

      v12 = [NSNumber numberWithInteger:10];
      [v7 setAttribute:v12 forKey:*MEMORY[0x263F216D8]];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
      _showFocusAtPoint_startAnimating__LastOutputTime = CFAbsoluteTimeGetCurrent();
LABEL_9:
    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewAccessibility;
  [(CAMPreviewViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  BOOL v3 = [(CAMPreviewViewAccessibility *)self safeUIViewForKey:@"_indicatorContainerView"];
  [v3 setAccessibilityViewIsModal:0];
}

- (CAMPreviewViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewAccessibility;
  BOOL v3 = -[CAMPreviewViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CAMPreviewViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (void)_accessibilityZoomIn:(BOOL)a3
{
  BOOL v3 = [(CAMPreviewViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMViewfinderView", a2)];
  objc_super v4 = __UIAccessibilitySafeClass();

  objc_super v5 = [MEMORY[0x263F1CB68] viewControllerForView:v4];
  uint64_t v6 = __UIAccessibilitySafeClass();

  [v6 safeCGFloatForKey:@"_cachedVideoZoomFactor"];
  [v6 safeCGFloatForKey:@"_currentMaximumZoomFactor"];
  [v6 safeValueForKey:@"_currentGraphConfiguration"];
  v10 = double v9 = v6;
  id v7 = v10;
  id v8 = v6;
  AXPerformSafeBlock();
  AXPerformSafeBlock();
}

void __52__CAMPreviewViewAccessibility__accessibilityZoomIn___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCachedVideoZoomFactor:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateZoomUIWithZoomFactor:1 animated:*(double *)(a1 + 48)];
  double v2 = [*(id *)(a1 + 32) safeValueForKey:@"_captureController"];
  BOOL v3 = __UIAccessibilitySafeClass();

  [v3 changeToVideoZoomFactor:*(void *)(a1 + 40) graphConfiguration:*(double *)(a1 + 48)];
}

void __52__CAMPreviewViewAccessibility__accessibilityZoomIn___block_invoke_2()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CDC8];
  AXFormatMagnificationFactor();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (BOOL)_axIsFocusLocked
{
  objc_opt_class();
  BOOL v3 = [(CAMPreviewViewAccessibility *)self _accessibilityValueForKey:@"AXCameraIsFocusedKey"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)_axIsBackFacing
{
  objc_opt_class();
  BOOL v3 = [(CAMPreviewViewAccessibility *)self _accessibilityValueForKey:@"AXIsBackCamera"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)_axIsUsingFlash
{
  return [(CAMPreviewViewAccessibility *)self _accessibilityBoolValueForKey:@"AXCameraWillUseFlashKey"];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  BOOL v3 = [(CAMPreviewViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMFullscreenViewfinder", a2)];
  objc_super v4 = __UIAccessibilitySafeClass();

  char v5 = [MEMORY[0x263F1CB68] viewControllerForView:v4];
  uint64_t v6 = __UIAccessibilitySafeClass();

  char v12 = 0;
  id v7 = [v6 safeValueForKey:@"_captureController"];
  id v8 = __UIAccessibilitySafeClass();

  if (([v8 safeBoolForKey:@"isCapturingVideo"] & 1) != 0
    || ([v8 safeBoolForKey:@"isCapturingStandardVideo"] & 1) != 0
    || ![(CAMPreviewViewAccessibility *)self isAccessibilityElement])
  {
    unsigned int v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMPreviewViewAccessibility;
    unsigned int v9 = [(CAMPreviewViewAccessibility *)&v11 _accessibilityMediaAnalysisOptions] | 0x40000;
  }

  return v9;
}

- (CGRect)accessibilityFrame
{
  [(CAMPreviewViewAccessibility *)self safeCGRectForKey:@"viewportFrame"];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (AXDeviceIsPhone())
  {
    objc_super v11 = [(CAMPreviewViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_15 startWithSelf:1];
    char v12 = [v11 _accessibilityViewController];

    uint64_t v13 = [v12 safeIntegerForKey:@"_currentMode"];
    if (v13 == 6)
    {
      v14 = @"_zoomControl._zoomDial._contentMaskView";
    }
    else
    {
      v14 = @"_zoomControl._buttonPlatter._platterBackgroundView";
      if (v13)
      {
        v15 = [v12 safeValueForKeyPath:@"_zoomControl._buttonPlatter._platterBackgroundView"];
        [v15 accessibilityFrame];
        double v17 = v16;

        v18 = [v12 safeValueForKey:@"_modeDial"];
        [v18 accessibilityFrame];
        double v20 = v19;

        v21 = [v12 safeValueForKey:@"_primaryShutterControl"];
        [v21 accessibilityFrame];
        double v23 = v22;

        double v10 = v10 - v17 - v20 - v23;
LABEL_7:

        goto LABEL_8;
      }
    }
    v24 = [v12 safeValueForKeyPath:v14];
    [v24 accessibilityFrame];
    double v26 = v25;

    double v10 = v10 - v26;
    goto LABEL_7;
  }
LABEL_8:
  double v27 = v4;
  double v28 = v6;
  double v29 = v8;
  double v30 = v10;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

uint64_t __49__CAMPreviewViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  double v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end