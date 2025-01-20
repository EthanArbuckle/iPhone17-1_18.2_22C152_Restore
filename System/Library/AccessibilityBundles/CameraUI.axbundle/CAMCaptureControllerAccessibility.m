@interface CAMCaptureControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CAMCaptureControllerAccessibility)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CAMCaptureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CUCaptureController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"_captureEngine", "@", 0);
  [v3 validateClass:@"CAMCaptureEngine" hasInstanceVariable:@"__captureSession" withType:"AVCaptureSession"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVCaptureSession", @"isRunning", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUCaptureController", @"initWithCaptureConfiguration: zoomFactor: outputToExternalStorage: engineOptions: locationController: motionController: burstController: protectionController: powerController: irisVideoController: remoteShutterController:", "@", "@", "d", "B", "q", "@", "@", "@", "@", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CAMCaptureControllerAccessibility;
  [(CAMCaptureControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMCaptureControllerAccessibility *)self safeValueForKey:@"_captureEngine"];
  v4 = __UIAccessibilitySafeClass();

  v5 = (void *)*MEMORY[0x263F1D020];
  v6 = [v4 safeValueForKey:@"__captureSession"];
  objc_msgSend(v5, "_accessibilitySetCameraIrisOpen:", objc_msgSend(v6, "safeBoolForKey:", @"isRunning"));

  [v4 _accessibilityLoadAccessibilityInformation];
}

- (CAMCaptureControllerAccessibility)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13
{
  v15.receiver = self;
  v15.super_class = (Class)CAMCaptureControllerAccessibility;
  v13 = [(CAMCaptureControllerAccessibility *)&v15 initWithCaptureConfiguration:a3 zoomFactor:a5 outputToExternalStorage:a6 engineOptions:a7 locationController:a8 motionController:a9 burstController:a4 protectionController:a10 powerController:a11 irisVideoController:a12 remoteShutterController:a13];
  [(CAMCaptureControllerAccessibility *)v13 _accessibilityLoadAccessibilityInformation];

  return v13;
}

@end