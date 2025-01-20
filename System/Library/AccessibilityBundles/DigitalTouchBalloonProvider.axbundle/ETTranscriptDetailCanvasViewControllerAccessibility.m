@interface ETTranscriptDetailCanvasViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (ETTranscriptDetailCanvasViewControllerAccessibility)init;
- (id)_accessibilityCameraFlipButtonLabelForCurrentCamera;
- (id)_accessibilityStringForCurrentCameraPosition;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axFocusChanged:(id)a3;
- (void)_cameraFlipButtonTapped;
- (void)_expandColorPickerButtonTapped;
- (void)_sendButtonTapped;
- (void)_setShowingGestureInstructionView:(BOOL)a3;
- (void)_startShowCompositionControlsTimer;
- (void)colorPicker:(id)a3 requestsDismissColorWheel:(id)a4;
- (void)colorPicker:(id)a3 requestsPresentColorWheel:(id)a4;
- (void)dealloc;
- (void)expandUI;
- (void)updateVideoUI;
- (void)videoControllerDidStartPreview:(id)a3;
- (void)videoControllerDidStopPreview:(id)a3;
- (void)viewDidLoad;
@end

@implementation ETTranscriptDetailCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETTranscriptDetailCanvasViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DTSCanvasViewController"];
  [v3 validateClass:@"DTSCanvasViewController" hasInstanceVariable:@"_cancelButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSCanvasViewController", @"_cancelButton", "@", 0);
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" isKindOfClass:@"DTSCanvasViewController"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_videoOnButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_videoRecordButton" withType:"ETVideoRecordButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_cameraFlipButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_sendButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_videoController" withType:"ETVideoController"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_photoCaptureButton" withType:"ETVideoRecordButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_expandColorPickerButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_expandToCameraButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_gestureInstructionButton" withType:"UIButton"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_gestureInstructionView" withType:"GestureInstructionView"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_showingCompositionControls" withType:"B"];
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_expandToGestureInstructionView" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"colorPicker", "@", 0);
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasProperty:@"canvasView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"presentationDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"updateVideoUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"_cameraFlipButtonTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"_setShowingGestureInstructionView:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"_startShowCompositionControlsTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"expandUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"_expandColorPickerButtonTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"_sendButtonTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"videoControllerDidStartPreview:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"videoControllerDidStopPreview:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"colorPicker: requestsPresentColorWheel:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptDetailCanvasViewController", @"colorPicker: requestsDismissColorWheel:", "v", "@", "@", 0);
  [v3 validateClass:@"DTSColorPicker"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorPicker", @"paletteCircles", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorPicker", @"selectedCircle", "@", 0);
  [v3 validateClass:@"ETTranscriptDetailCanvasViewController" hasInstanceVariable:@"_showCompositionControlsTimer" withType:"NSTimer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETVideoController", @"videoDevice", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVCaptureDevice", @"position", "q", 0);
  [v3 validateProtocol:@"ETTranscriptDetailCanvasViewControllerPresentationDelegate" hasRequiredInstanceMethod:@"canvasViewController: requestsPresentationStyleExpanded:"];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  if ([v2 _accessibilityBoolValueForKey:@"_axExpanded"])
  {
    [v2 _accessibilitySetRetainedValue:MEMORY[0x263EFFA80] forKey:@"_axExpanded"];
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    AXPerformSafeBlock();
    BOOL v3 = *((unsigned char *)v6 + 24) != 0;
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void __81__ETTranscriptDetailCanvasViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_presentationDelegate"];
  [v2 canvasViewController:*(void *)(a1 + 32) requestsPresentationStyleExpanded:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v22.receiver = self;
  v22.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  BOOL v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_videoOnButton"];
  v4 = accessibilityLocalizedString(@"video.on.button.label");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_cameraFlipButton"];
  v6 = accessibilityLocalizedString(@"camera.chooser.button.hint");
  [v5 setAccessibilityHint:v6];

  objc_opt_class();
  uint64_t v7 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_expandColorPickerButton"];
  char v8 = __UIAccessibilityCastAsClass();

  v9 = accessibilityLocalizedString(@"expand.color.picker.button");
  [v8 setAccessibilityLabel:v9];

  [v8 setAccessibilityIdentifier:@"ETCompositionExpandColorPickerButton"];
  objc_opt_class();
  v10 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_expandToCameraButton"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = accessibilityLocalizedString(@"expand.camera.button");
  [v11 setAccessibilityLabel:v12];

  [v11 setAccessibilityIdentifier:@"ETCompositionExpandToCameraButton"];
  objc_opt_class();
  v13 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_cancelButton"];
  v14 = __UIAccessibilityCastAsClass();

  v15 = accessibilityLocalizedString(@"cancel.button");
  [v14 setAccessibilityLabel:v15];

  objc_opt_class();
  v16 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_gestureInstructionButton"];
  v17 = __UIAccessibilityCastAsClass();

  v18 = accessibilityLocalizedString(@"gesture.instruction.button");
  [v17 setAccessibilityLabel:v18];

  objc_opt_class();
  v19 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_sendButton"];
  v20 = __UIAccessibilityCastAsClass();

  v21 = accessibilityLocalizedString(@"send.button");
  [v20 setAccessibilityLabel:v21];
}

- (id)_accessibilityCameraFlipButtonLabelForCurrentCamera
{
  BOOL v3 = accessibilityLocalizedString(@"camera.chooser.button.label");
  v6 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityStringForCurrentCameraPosition];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilityStringForCurrentCameraPosition
{
  id v2 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_videoController"];
  BOOL v3 = [v2 safeValueForKey:@"videoDevice"];

  if (!v3) {
    goto LABEL_5;
  }
  v4 = [v3 safeValueForKey:@"position"];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1)
  {
    v6 = @"camera.chooser.back.facing";
    goto LABEL_7;
  }
  if (v5 != 2)
  {
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  v6 = @"camera.chooser.front.facing";
LABEL_7:
  v9 = accessibilityLocalizedString(v6);
  uint64_t v7 = __UIAXStringForVariables();

LABEL_8:

  return v7;
}

- (ETTranscriptDetailCanvasViewControllerAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  id v2 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v5 init];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v2 selector:sel__axFocusChanged_ name:*MEMORY[0x263F1CDF8] object:0];

  return v2;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDF8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v3 viewDidLoad];
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)updateVideoUI
{
  v9.receiver = self;
  v9.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v9 updateVideoUI];
  objc_super v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_photoCaptureButton"];
  objc_super v4 = accessibilityLocalizedString(@"take.picture.button.label");
  [v3 setAccessibilityLabel:v4];

  objc_super v5 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_videoRecordButton"];
  v6 = accessibilityLocalizedString(@"record.video.button.label");
  [v5 setAccessibilityLabel:v6];

  uint64_t v7 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_cameraFlipButton"];
  char v8 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityCameraFlipButtonLabelForCurrentCamera];
  [v7 setAccessibilityLabel:v8];
}

- (void)_cameraFlipButtonTapped
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v5 _cameraFlipButtonTapped];
  objc_super v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_cameraFlipButton"];
  objc_super v4 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityCameraFlipButtonLabelForCurrentCamera];
  [v3 setAccessibilityLabel:v4];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_setShowingGestureInstructionView:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  -[ETTranscriptDetailCanvasViewControllerAccessibility _setShowingGestureInstructionView:](&v8, sel__setShowingGestureInstructionView_);
  objc_super v5 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  BOOL v6 = !v3;
  [v5 setIsAccessibilityElement:v6];
  if (!v6)
  {
    uint64_t v7 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_gestureInstructionView"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v7);
  }
}

- (void)_expandColorPickerButtonTapped
{
  v7.receiver = self;
  v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v7 _expandColorPickerButtonTapped];
  BOOL v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"colorPicker"];
  objc_super v4 = [v3 safeValueForKey:@"selectedCircle"];
  if (!v4)
  {
    objc_opt_class();
    objc_super v5 = [v3 safeValueForKey:@"paletteCircles"];
    BOOL v6 = __UIAccessibilityCastAsClass();

    if ([v6 count])
    {
      objc_super v4 = [v6 objectAtIndex:0];
    }
    else
    {
      objc_super v4 = 0;
    }
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
}

- (void)expandUI
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  [v3 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"_axExpanded"];
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v4 expandUI];
}

- (void)_sendButtonTapped
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  [v3 _accessibilitySetRetainedValue:MEMORY[0x263EFFA80] forKey:@"_axExpanded"];
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v4 _sendButtonTapped];
}

- (void)videoControllerDidStartPreview:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v10 videoControllerDidStartPreview:a3];
  objc_super v4 = accessibilityLocalizedString(@"camera.activated");
  objc_super v9 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityStringForCurrentCameraPosition];
  objc_super v5 = __UIAXStringForVariables();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  BOOL v6 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_videoController", v9, @"__AXStringForVariablesSentinel"];
  objc_super v7 = [v6 safeValueForKey:@"view"];

  [v7 setIsAccessibilityElement:0];
  objc_super v8 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v8);
}

- (void)videoControllerDidStopPreview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v5 videoControllerDidStopPreview:a3];
  objc_super v4 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  [v4 setIsAccessibilityElement:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
}

- (void)colorPicker:(id)a3 requestsPresentColorWheel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  id v6 = a4;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v8 colorPicker:a3 requestsPresentColorWheel:v6];
  objc_super v7 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView", v8.receiver, v8.super_class];
  [v7 setIsAccessibilityElement:0];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
}

- (void)colorPicker:(id)a3 requestsDismissColorWheel:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v7 colorPicker:a3 requestsDismissColorWheel:a4];
  objc_super v5 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  [v5 setIsAccessibilityElement:1];

  LODWORD(v5) = *MEMORY[0x263F1CE18];
  id v6 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"canvasView"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v6);
}

- (void)_startShowCompositionControlsTimer
{
  if (UIAccessibilityIsSwitchControlRunning() || UIAccessibilityIsVoiceOverRunning())
  {
    BOOL v3 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilityValueForKey:@"ShowControlsTimer"];
    if (!v3)
    {
      id v4 = objc_alloc(MEMORY[0x263F22868]);
      BOOL v3 = (void *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
      [(ETTranscriptDetailCanvasViewControllerAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"ShowControlsTimer"];
    }
    [v3 cancel];
    char v9 = 0;
    objc_opt_class();
    objc_super v5 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"_showCompositionControlsTimer"];
    id v6 = __UIAccessibilityCastAsClass();

    [v6 invalidate];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__ETTranscriptDetailCanvasViewControllerAccessibility__startShowCompositionControlsTimer__block_invoke;
    v8[3] = &unk_26511C780;
    v8[4] = self;
    [v3 afterDelay:v8 processBlock:20.0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
    [(ETTranscriptDetailCanvasViewControllerAccessibility *)&v7 _startShowCompositionControlsTimer];
  }
}

id __89__ETTranscriptDetailCanvasViewControllerAccessibility__startShowCompositionControlsTimer__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ETTranscriptDetailCanvasViewControllerAccessibility;
  return objc_msgSendSuper2(&v2, sel__startShowCompositionControlsTimer);
}

- (void)_axFocusChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1CE00]];

  objc_super v7 = [v4 userInfo];
  objc_super v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1CF70]];

  char v9 = [(ETTranscriptDetailCanvasViewControllerAccessibility *)self safeValueForKey:@"colorPicker"];
  objc_opt_class();
  objc_super v10 = [v9 safeValueForKey:@"paletteCircles"];
  v11 = __UIAccessibilityCastAsClass();

  if (([v11 containsObject:v6] & 1) != 0 || objc_msgSend(v11, "containsObject:", v8)) {
    AXPerformSafeBlock();
  }
}

uint64_t __71__ETTranscriptDetailCanvasViewControllerAccessibility__axFocusChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startShowCompositionControlsTimer];
}

@end