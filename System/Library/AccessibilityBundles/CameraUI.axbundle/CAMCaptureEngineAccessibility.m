@interface CAMCaptureEngineAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityDetectFaces:(BOOL)a3 completionBlock:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_handleSessionDidStartRunning:(id)a3;
- (void)_handleSessionDidStopRunning:(id)a3;
- (void)_updateCurrentlyConfiguredObjects;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6;
- (void)ensureControlsForGraphConfiguration:(id)a3;
@end

@implementation CAMCaptureEngineAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMCaptureEngine";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureEngine", @"_handleSessionDidStartRunning:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureEngine", @"_handleSessionDidStopRunning:", "v", "@", 0);
  [v3 validateClass:@"CAMCaptureEngine" hasInstanceVariable:@"__captureSession" withType:"AVCaptureSession"];
  [v3 validateClass:@"CAMCaptureEngine" hasInstanceVariable:@"__captureSessionQueue" withType:"NSObject<OS_dispatch_queue>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureEngine", @"captureOutput:didOutputMetadataObjects:forMetadataObjectTypes:fromConnection:", "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureEngine", @"_updateCurrentlyConfiguredObjects", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureEngine", @"ensureControlsForGraphConfiguration:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureGraphConfiguration", @"videoConfiguration", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMCaptureGraphConfiguration", @"videoEncodingBehavior", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CAMCaptureEngineAccessibility;
  [(CAMCaptureEngineAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CAMCaptureEngineAccessibility *)self _handleSessionDidStartRunning:0];
}

- (void)_accessibilityDetectFaces:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = +[AXCameraVisionEngine sharedEngine];
  if (v4)
  {
    v6 = [(CAMCaptureEngineAccessibility *)self safeValueForKey:@"__captureSession"];
    [v7 setCaptureSession:v6];
  }
  else
  {
    [v7 setCaptureSession:0];
  }
}

- (void)_handleSessionDidStartRunning:(id)a3
{
  BOOL v4 = (void *)*MEMORY[0x263F1D020];
  id v5 = a3;
  [v4 _accessibilitySetCameraIrisOpen:1];
  v12.receiver = self;
  v12.super_class = (Class)CAMCaptureEngineAccessibility;
  [(CAMCaptureEngineAccessibility *)&v12 _handleSessionDidStartRunning:v5];

  UIAccessibilityPostNotification(0xFA2u, &unk_26F4117B0);
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263F1CF90];
  v8 = [MEMORY[0x263F08A48] mainQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__CAMCaptureEngineAccessibility__handleSessionDidStartRunning___block_invoke;
  v11[3] = &unk_26509FF08;
  v11[4] = self;
  uint64_t v9 = [v6 addObserverForName:v7 object:0 queue:v8 usingBlock:v11];
  v10 = (void *)VOObserver;
  VOObserver = v9;

  if (UIAccessibilityIsVoiceOverRunning()) {
    [(CAMCaptureEngineAccessibility *)self _accessibilityDetectFaces:1 completionBlock:0];
  }
}

uint64_t __63__CAMCaptureEngineAccessibility__handleSessionDidStartRunning___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();

  return [v1 _accessibilityDetectFaces:IsVoiceOverRunning completionBlock:0];
}

- (void)_handleSessionDidStopRunning:(id)a3
{
  BOOL v4 = (void *)*MEMORY[0x263F1D020];
  id v5 = a3;
  [v4 _accessibilitySetCameraIrisOpen:0];
  v6.receiver = self;
  v6.super_class = (Class)CAMCaptureEngineAccessibility;
  [(CAMCaptureEngineAccessibility *)&v6 _handleSessionDidStopRunning:v5];

  UIAccessibilityPostNotification(0xFA2u, &unk_26F4117D8);
}

- (void)_updateCurrentlyConfiguredObjects
{
  v2.receiver = self;
  v2.super_class = (Class)CAMCaptureEngineAccessibility;
  [(CAMCaptureEngineAccessibility *)&v2 _updateCurrentlyConfiguredObjects];
  UIAccessibilityIsVoiceOverRunning();
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureEngineAccessibility;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(CAMCaptureEngineAccessibility *)&v14 captureOutput:v12 didOutputMetadataObjects:v11 forMetadataObjectTypes:v10 fromConnection:v9];
  v13 = +[AXCameraVisionEngine sharedEngine];
  [v13 captureOutput:v12 didOutputMetadataObjects:v11 forMetadataObjectTypes:v10 fromConnection:v9];
}

- (void)ensureControlsForGraphConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCaptureEngineAccessibility;
  id v4 = a3;
  [(CAMCaptureEngineAccessibility *)&v8 ensureControlsForGraphConfiguration:v4];
  unint64_t v5 = objc_msgSend(v4, "safeIntegerForKey:", @"videoConfiguration", v8.receiver, v8.super_class);
  uint64_t v6 = [v4 safeIntegerForKey:@"videoEncodingBehavior"];

  if (v5 <= 0xE)
  {
    if (((1 << v5) & 0x1420) != 0)
    {
      BOOL v7 = v6 != 2;
      goto LABEL_7;
    }
    if (((1 << v5) & 0x6200) != 0)
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
  }
  UIAccessibilityIsVoiceOverRunning();
  BOOL v7 = 1;
LABEL_7:
  if (UIAccessibilityIsVoiceOverRunning()) {
    [(CAMCaptureEngineAccessibility *)self _accessibilityDetectFaces:v7 completionBlock:0];
  }
}

@end