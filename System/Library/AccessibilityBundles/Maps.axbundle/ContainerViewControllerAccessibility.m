@interface ContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5;
@end

@implementation ContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContainerViewController", @"presentController: animated: useDefaultContaineeLayout:", "v", "@", "B", "B", 0);
  [v3 validateClass:@"ContainerViewController" hasInstanceVariable:@"_currentViewController" withType:"UIViewController<ContaineeProtocol>"];
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(ContainerViewControllerAccessibility *)self safeValueForKey:@"_currentViewController"];
  v13.receiver = self;
  v13.super_class = (Class)ContainerViewControllerAccessibility;
  [(ContainerViewControllerAccessibility *)&v13 presentController:v8 animated:v6 useDefaultContaineeLayout:v5];
  if (v9 != v8)
  {
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    UIAccessibilityNotifications v11 = *MEMORY[0x263F1CE68];
    v12 = [v10 _accessibilityFirstNonGrabberElement];
    UIAccessibilityPostNotification(v11, v12);
  }
}

@end