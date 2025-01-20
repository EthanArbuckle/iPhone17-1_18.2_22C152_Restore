@interface CAMPreviewViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateForCaptureDevice;
- (void)_setGraphConfiguration:(id)a3;
- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4;
- (void)captureControllerWillResetFocusAndExposure:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CAMPreviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPreviewViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMPreviewViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewViewController", @"_setUserLockedFocusAndExposure: shouldAnimate:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewViewController", @"captureControllerWillResetFocusAndExposure:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewViewController", @"previewView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewViewController", @"_device", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMPreviewViewController", @"_setGraphConfiguration:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(CAMPreviewViewControllerAccessibility *)self safeValueForKey:@"previewView"];
  v4 = +[AXCameraVisionEngine sharedEngine];
  [v4 setSceneObjectElementContainerView:v3];

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  [(CAMPreviewViewControllerAccessibility *)self _axUpdateForCaptureDevice];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(CAMPreviewViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v4 viewDidDisappear:a3];
  id v3 = +[AXCameraVisionEngine sharedEngine];
  [v3 setSceneObjectElementContainerView:0];
}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v6 _setUserLockedFocusAndExposure:a3 shouldAnimate:a4];
  objc_super v5 = [(CAMPreviewViewControllerAccessibility *)self safeValueForKey:@"previewView"];
  [v5 _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"AXCameraIsFocusedKey"];
}

- (void)captureControllerWillResetFocusAndExposure:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v5 captureControllerWillResetFocusAndExposure:a3];
  objc_super v4 = [(CAMPreviewViewControllerAccessibility *)self safeValueForKey:@"previewView"];
  [v4 _accessibilitySetRetainedValue:MEMORY[0x263EFFA80] forKey:@"AXCameraIsFocusedKey"];
}

- (void)_setGraphConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  [(CAMPreviewViewControllerAccessibility *)&v4 _setGraphConfiguration:a3];
  [(CAMPreviewViewControllerAccessibility *)self _axUpdateForCaptureDevice];
}

- (void)_axUpdateForCaptureDevice
{
  uint64_t v3 = [(CAMPreviewViewControllerAccessibility *)self _device];
  if ((unint64_t)(v3 - 8) < 4 || v3 == 1)
  {
    objc_super v5 = [(CAMPreviewViewControllerAccessibility *)self safeValueForKey:@"previewView"];
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  else
  {
    objc_super v5 = [(CAMPreviewViewControllerAccessibility *)self safeValueForKey:@"previewView"];
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  id v7 = v5;
  [v5 _accessibilitySetRetainedValue:v6 forKey:@"AXIsBackCamera"];
}

@end