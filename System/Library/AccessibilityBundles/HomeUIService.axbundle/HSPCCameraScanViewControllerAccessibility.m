@interface HSPCCameraScanViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_handleSetupCode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCCameraScanViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HSPCCameraScanViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCCameraScanViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCCameraScanViewController", @"_handleSetupCode:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HSPCCameraScanViewController", @"cameraReader", "@", 0);
  [v3 validateClass:@"CRCameraReader" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"HSPCCameraScanViewController" hasInstanceVariable:@"_contentView" withType:"PRXCardContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardContentView", @"subtitleLabel", "@", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  [(HSPCCameraScanViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HSPCCameraScanViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  [(HSPCCameraScanViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HSPCCameraScanViewControllerAccessibility *)self safeValueForKey:@"cameraReader"];
  objc_super v4 = [v3 safeValueForKey:@"view"];
  v5 = accessibilityLocalizedString(@"camera.scan.setupcode.hint");
  [v4 setAccessibilityHint:v5];

  v6 = [(HSPCCameraScanViewControllerAccessibility *)self safeValueForKey:@"_contentView"];
  v7 = [v6 safeValueForKey:@"subtitleLabel"];

  [v7 setAccessibilityTraits:*MEMORY[0x263F1CF10]];
  v8 = accessibilityLocalizedString(@"hint.activate.embedded.link");
  [v7 setAccessibilityHint:v8];
}

- (void)_handleSetupCode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  id v3 = a3;
  [(HSPCCameraScanViewControllerAccessibility *)&v7 _handleSetupCode:v3];
  objc_super v4 = NSString;
  v5 = accessibilityLocalizedString(@"setupcode.complete");
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);
}

@end