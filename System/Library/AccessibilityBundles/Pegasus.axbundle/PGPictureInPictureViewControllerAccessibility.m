@interface PGPictureInPictureViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setHostedWindowHostingHandle:(id)a3;
- (void)viewDidLoad;
@end

@implementation PGPictureInPictureViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGPictureInPictureViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PGPictureInPictureViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PGControlsContainerView"];
  [v3 validateClass:@"PGLayerHostView"];
  [v3 validateClass:@"_UIRemoteView"];
  [v3 validateClass:@"PGPictureInPictureViewController" hasInstanceVariable:@"_controlsContainerView" withType:"PGControlsContainerView"];
  [v3 validateClass:@"PGPictureInPictureViewController" hasInstanceVariable:@"_contentView" withType:"PGLayerHostView"];
  [v3 validateClass:@"PGLayerHostView" hasInstanceVariable:@"_remoteView" withType:"_UIRemoteView"];
  [v3 validateClass:@"_UIHostedWindowHostingHandle" hasInstanceVariable:@"_pid" withType:"i"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGPictureInPictureViewController", @"setStashed:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGPictureInPictureViewController", @"setHostedWindowHostingHandle:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  [(PGPictureInPictureViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PGPictureInPictureViewControllerAccessibility *)self safeValueForKey:@"_controlsContainerView"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  [(PGPictureInPictureViewControllerAccessibility *)&v3 viewDidLoad];
  [(PGPictureInPictureViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  [(PGPictureInPictureViewControllerAccessibility *)&v10 setHostedWindowHostingHandle:v4];
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 safeIntForKey:@"_pid"];
  v7 = [(PGPictureInPictureViewControllerAccessibility *)self safeValueForKeyPath:@"_contentView._remoteView"];
  v8 = [NSNumber numberWithInt:v6];
  [v7 _accessibilitySetRetainedValue:v8 forKey:@"ax-pid"];

  v9 = [NSNumber numberWithInt:_AXUIElementRemoteBridgeMachPortForAXServer()];
  [v7 _accessibilitySetRetainedValue:v9 forKey:@"ax-machport"];
}

@end