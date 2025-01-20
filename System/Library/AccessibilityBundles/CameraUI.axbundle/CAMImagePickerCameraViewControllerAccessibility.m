@interface CAMImagePickerCameraViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)cropOverlayWasCancelled:(id)a3;
@end

@implementation CAMImagePickerCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMImagePickerCameraViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMImagePickerCameraViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMImagePickerCameraViewController", @"cropOverlayWasCancelled:", "v", "@", 0);
}

- (void)cropOverlayWasCancelled:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMImagePickerCameraViewControllerAccessibility;
  [(CAMImagePickerCameraViewControllerAccessibility *)&v5 cropOverlayWasCancelled:a3];
  v4 = [(CAMImagePickerCameraViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v4 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end