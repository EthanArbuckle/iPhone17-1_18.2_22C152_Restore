@interface PUTrimToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_handlePlayPauseButton:(id)a3;
- (void)_handleScrubberTimelineOverlayButton:(id)a3;
- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5;
- (void)viewDidLoad;
@end

@implementation PUTrimToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUTrimToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"_handlePlayPauseButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"playerWrapper", "@", 0);
  [v3 validateProtocol:@"PXTrimToolPlayerWrapper" hasMethod:@"isPlaying" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"focusTimeline:presentAction:locationInTimeline:", "v", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"_handleScrubberTimelineOverlayButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXLivePhotoTrimScrubber", @"keyTime", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"trimScrubberTimelineOverlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"trimScrubberTimelineOverlayButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTrimToolController", @"focusTimelineAction", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFocusTimelineAction", @"kind", "q", 0);
  [v3 validateClass:@"PUTrimToolController" hasInstanceVariable:@"_trimScrubber" withType:"PXLivePhotoTrimScrubber"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUTrimToolControllerAccessibility;
  [(PUTrimToolControllerAccessibility *)&v3 viewDidLoad];
  [(PUTrimToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_handlePlayPauseButton:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUTrimToolControllerAccessibility;
  [(PUTrimToolControllerAccessibility *)&v8 _handlePlayPauseButton:a3];
  v4 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"_trimScrubber"];
  uint64_t v5 = [v4 accessibilityTraits];
  if ((*MEMORY[0x263F1CF20] & v5) != 0) {
    uint64_t v6 = ~*MEMORY[0x263F1CF20];
  }
  else {
    uint64_t v6 = -1;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PUTrimToolControllerAccessibility__handlePlayPauseButton___block_invoke;
  v7[3] = &__block_descriptor_40_e5_Q8__0l;
  v7[4] = v6 & v5;
  [v4 _setAccessibilityTraitsBlock:v7];
  [(PUTrimToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

uint64_t __60__PUTrimToolControllerAccessibility__handlePlayPauseButton___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)PUTrimToolControllerAccessibility;
  [(PUTrimToolControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"playPauseButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __79__PUTrimToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10 = &unk_2650A7D50;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityLabelBlock:&v7];
  uint64_t v5 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"trimScrubberTimelineOverlayView", v7, v8, v9, v10];
  uint64_t v6 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"trimScrubberTimelineOverlayButton"];
  objc_msgSend(v6, "setIsAccessibilityElement:", objc_msgSend(v5, "_accessibilityViewIsVisible"));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __79__PUTrimToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"playerWrapper"];

  if ([v2 safeBoolForKey:@"isPlaying"]) {
    objc_super v3 = @"pause.button";
  }
  else {
    objc_super v3 = @"play.button";
  }
  v4 = accessibilityPULocalizedString(v3);

  return v4;
}

- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility focusTimeline:presentAction:locationInTimeline:](&v34, sel_focusTimeline_presentAction_locationInTimeline_, v9, v10, x, y);
  [(PUTrimToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  id v11 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"_trimScrubber"];
  uint64_t v12 = [v11 accessibilityTraits];
  objc_super v13 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"trimScrubberTimelineOverlayButton"];
  uint64_t v14 = [v10 safeIntegerForKey:@"kind"];
  uint64_t v15 = *MEMORY[0x263F1CF20];
  if (v14)
  {
    uint64_t v16 = v12 & ~v15;
  }
  else
  {
    time.value = 0;
    *(void *)&time.timescale = &time;
    time.epoch = 0x3810000000;
    v29 = &unk_2402616BD;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke;
    v25 = &unk_2650A7CE8;
    p_CMTime time = &time;
    id v26 = v11;
    AXPerformSafeBlock();
    uint64_t v16 = v15 | v12;
    CMTime v33 = *(CMTime *)(*(void *)&time.timescale + 32);

    _Block_object_dispose(&time, 8);
    CMTime time = v33;
    CMTimeGetSeconds(&time);
    v17 = UIAXTimeStringForDuration();
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_2;
    v20[3] = &unk_2650A7F00;
    id v21 = v17;
    id v18 = v17;
    [v13 _setAccessibilityLabelBlock:v20];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v13);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_3;
  v19[3] = &__block_descriptor_40_e5_Q8__0l;
  v19[4] = v16;
  [v11 _setAccessibilityTraitsBlock:v19];
}

double __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) keyTime];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(void *)(v2 + 48) = v5;
  return result;
}

id __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_2()
{
  v0 = accessibilityPULocalizedString(@"delete.focus");
  v1 = __UIAXStringForVariables();

  return v1;
}

uint64_t __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_3(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)_handleScrubberTimelineOverlayButton:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUTrimToolControllerAccessibility;
  [(PUTrimToolControllerAccessibility *)&v10 _handleScrubberTimelineOverlayButton:a3];
  long long v4 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"focusTimelineAction"];
  uint64_t v5 = [v4 safeUnsignedIntegerForKey:@"kind"];

  uint64_t v6 = [(PUTrimToolControllerAccessibility *)self safeValueForKey:@"_trimScrubber"];
  uint64_t v7 = [v6 accessibilityTraits];
  if (!v5)
  {
    uint64_t v8 = accessibilityPULocalizedString(@"deleted.focus");
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    v7 &= ~*MEMORY[0x263F1CF20];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__PUTrimToolControllerAccessibility__handleScrubberTimelineOverlayButton___block_invoke;
  v9[3] = &__block_descriptor_40_e5_Q8__0l;
  v9[4] = v7;
  [v6 _setAccessibilityTraitsBlock:v9];
}

uint64_t __74__PUTrimToolControllerAccessibility__handleScrubberTimelineOverlayButton___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

@end