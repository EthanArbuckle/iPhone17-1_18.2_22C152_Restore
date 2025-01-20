@interface CAMDynamicShutterControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axVC;
- (id)accessibilityCustomActions;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (int64_t)incrementCounter;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMDynamicShutterControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDynamicShutterControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentDevice", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"isRecording", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_shutterButtonModeForCameraMode:isCapturing:", "q", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_captureController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"dynamicShutterControlGesturesDidBegin:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_setShutterState:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_setDragHandleState:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_setInnerShapeState:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"_capturingCTMVideoRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_centerOuterView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_lockButtonOuterView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"_pauseResumeButtonOuterView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_beginCapturingBurst", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_stopCapturingBurst", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDynamicShutterControl", @"incrementCounter", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"isCapturingBurst", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)_axVC
{
  v2 = [(CAMDynamicShutterControlAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:1];
  id v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __46__CAMDynamicShutterControlAccessibility__axVC__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  if ([(CAMDynamicShutterControlAccessibility *)self isAccessibilityElement])
  {
    id v3 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
    v4 = [v3 safeValueForKey:@"_currentMode"];
    uint64_t v5 = [v4 integerValue];

    v6 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
    LOBYTE(v4) = [v6 safeBoolForKey:@"isRecording"];

    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    LOBYTE(v16) = (_BYTE)v4;
    AXPerformSafeBlock();
    uint64_t v7 = v18[3];
    _Block_object_dispose(&v17, 8);
    uint64_t v8 = v7 - 1;
    if (unint64_t)(v7 - 1) < 8 && ((0xE7u >> v8))
    {
      v9 = off_2650A0010[v8];
    }
    else
    {
      if (v5) {
        goto LABEL_5;
      }
      v11 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
      v12 = [v11 safeValueForKey:@"_captureController"];
      v13 = [v12 safeValueForKey:@"_capturingCTMVideoRequest"];

      if (!v13) {
LABEL_5:
      }
        v9 = @"camera.photo.button.text";
      else {
        v9 = @"camera.video.stop.record.button.text";
      }
    }
    v10 = accessibilityCameraKitLocalizedString(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __59__CAMDynamicShutterControlAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _axVC];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _shutterButtonModeForCameraMode:*(void *)(a1 + 48) isCapturing:*(unsigned __int8 *)(a1 + 56)];
}

- (id)accessibilityIdentifier
{
  if ((accessibilityIdentifier_CheckingAXElement & 1) != 0
    || (accessibilityIdentifier_CheckingAXElement = 1,
        BOOL v3 = [(CAMDynamicShutterControlAccessibility *)self isAccessibilityElement],
        accessibilityIdentifier_CheckingAXElement = 0,
        !v3))
  {
    uint64_t v7 = 0;
  }
  else
  {
    v4 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
    uint64_t v5 = [v4 safeValueForKey:@"_currentMode"];
    unint64_t v6 = [v5 integerValue];

    if (v6 >= 0xA)
    {
      v9.receiver = self;
      v9.super_class = (Class)CAMDynamicShutterControlAccessibility;
      uint64_t v7 = [(CAMDynamicShutterControlAccessibility *)&v9 accessibilityIdentifier];
    }
    else
    {
      uint64_t v7 = off_2650A0050[v6];
    }
  }

  return v7;
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)CAMDynamicShutterControlAccessibility;
  BOOL v2 = [(CAMDynamicShutterControlAccessibility *)&v4 accessibilityActivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (id)accessibilityPath
{
  BOOL v2 = [(CAMDynamicShutterControlAccessibility *)self safeUIViewForKey:@"_centerOuterView"];
  [v2 accessibilityFrame];
  BOOL v3 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:");

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)CAMDynamicShutterControlAccessibility;
  objc_super v4 = [(CAMDynamicShutterControlAccessibility *)&v12 _accessibilitySupplementaryFooterViews];
  uint64_t v5 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  uint64_t v8 = v7;

  objc_super v9 = [(CAMDynamicShutterControlAccessibility *)self safeUIViewForKey:@"_lockButtonOuterView"];
  [v9 _setAccessibilityLabelBlock:&__block_literal_global_421_0];
  [v9 _setIsAccessibilityElementBlock:&__block_literal_global_424];
  if (v9 && ([v9 isHidden] & 1) == 0) {
    [v8 axSafelyAddObject:v9];
  }
  v10 = [(CAMDynamicShutterControlAccessibility *)self safeUIViewForKey:@"_pauseResumeButtonOuterView"];
  [v10 _setAccessibilityLabelBlock:&__block_literal_global_426];
  [v10 _setIsAccessibilityElementBlock:&__block_literal_global_431];
  if (v10 && ([v10 isHidden] & 1) == 0) {
    [v8 axSafelyAddObject:v10];
  }

  return v8;
}

id __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityCameraKitLocalizedString(@"camera.photo.button.text");
}

uint64_t __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2()
{
  return 1;
}

id __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke_3()
{
  return accessibilityCameraUILocalizedString(@"pause.video");
}

uint64_t __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke_4()
{
  return 1;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  objc_super v4 = accessibilityCameraUILocalizedString(@"begin.burst.mode");
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke;
  v31[3] = &unk_26509FFF0;
  v31[4] = self;
  uint64_t v5 = (void *)[v3 initWithName:v4 actionHandler:v31];

  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  id v7 = accessibilityCameraUILocalizedString(@"stop.burst.mode");
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_3;
  v30[3] = &unk_26509FFF0;
  v30[4] = self;
  uint64_t v8 = (void *)[v6 initWithName:v7 actionHandler:v30];

  objc_super v9 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
  uint64_t v10 = [v9 safeIntegerForKey:@"currentCaptureMode"];

  BOOL v11 = (v10 & 0xFFFFFFFFFFFFFFFBLL) == 0
     && [(CAMDynamicShutterControlAccessibility *)self safeIntegerForKey:@"_shutterState"] != 3;
  id v12 = objc_alloc(MEMORY[0x263F1C390]);
  v13 = accessibilityCameraUILocalizedString(@"take.video.action");
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_5;
  v29[3] = &unk_26509FFF0;
  v29[4] = self;
  v14 = (void *)[v12 initWithName:v13 actionHandler:v29];

  uint64_t v15 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
  uint64_t v16 = [v15 safeValueForKey:@"_captureController"];
  LODWORD(v13) = [v16 safeBoolForKey:@"isCapturingBurst"];

  uint64_t v17 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
  v18 = [v17 safeValueForKey:@"_currentDevice"];
  uint64_t v19 = [v18 integerValue];

  uint64_t v20 = [(CAMDynamicShutterControlAccessibility *)self _axVC];
  v21 = [v20 safeValueForKey:@"_currentMode"];
  uint64_t v22 = [v21 integerValue];

  v23 = [MEMORY[0x263F30780] capabilities];
  int v24 = [v23 isBurstSupportedForMode:v22 device:v19];

  if (v13) {
    v25 = v8;
  }
  else {
    v25 = v5;
  }
  if (!v24) {
    v25 = 0;
  }
  if (v11) {
    v26 = v14;
  }
  else {
    v26 = 0;
  }
  v27 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v25, v26);

  return v27;
}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axVC];
  [v1 _beginCapturingBurst];
}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_3()
{
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axVC];
  [v1 _stopCapturingBurst];
}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_5()
{
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _axVC];
  [v2 dynamicShutterControlGesturesDidBegin:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _setDragHandleState:4 animated:1];
  [*(id *)(a1 + 32) _setInnerShapeState:1 animated:1];
  [*(id *)(a1 + 32) _setShutterState:3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];

  UIAccessibilityPostNotification(v3, &stru_26F403C30);
}

- (int64_t)incrementCounter
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDynamicShutterControlAccessibility;
  id v2 = [(CAMDynamicShutterControlAccessibility *)&v7 incrementCounter];
  UIAccessibilityNotifications v3 = NSString;
  objc_super v4 = accessibilityCameraUILocalizedString(@"camera.photo.burst.count");
  uint64_t v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);

  UIAccessibilitySpeakIfNotSpeaking();
  return (int64_t)v2;
}

@end