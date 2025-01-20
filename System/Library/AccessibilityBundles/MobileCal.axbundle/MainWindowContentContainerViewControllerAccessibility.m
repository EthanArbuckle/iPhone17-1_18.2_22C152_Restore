@interface MainWindowContentContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MainWindowContentContainerViewControllerAccessibility)initWithRootNavigationController:(id *)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetAccessibilityElements;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
@end

@implementation MainWindowContentContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MainWindowContentContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MainWindowRootViewController"];
  [v3 validateClass:@"RootNavigationController"];
  [v3 validateClass:@"MainWindowContentContainerViewController" hasInstanceVariable:@"_containerViewController" withType:"UIViewController"];
  [v3 validateClass:@"MainWindowContentContainerViewController" hasInstanceVariable:@"_rootNavigationController" withType:"RootNavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MainWindowContentContainerViewController", @"initWithRootNavigationController:", "@", "@", 0);
  [v3 validateProtocol:@"UISplitViewControllerDelegate" hasOptionalInstanceMethod:@"splitViewController:willChangeToDisplayMode:"];
  [v3 validateClass:@"MainWindowContentContainerViewController" conformsToProtocol:@"UISplitViewControllerDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MainWindowContentContainerViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RootNavigationController", @"viewSwitcher", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MainWindowContentContainerViewControllerAccessibility;
  [(MainWindowContentContainerViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MainWindowContentContainerViewControllerAccessibility *)self _accessibilitySetAccessibilityElements];
}

- (MainWindowContentContainerViewControllerAccessibility)initWithRootNavigationController:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MainWindowContentContainerViewControllerAccessibility;
  objc_super v3 = [(MainWindowContentContainerViewControllerAccessibility *)&v6 initWithRootNavigationController:a3];
  v4 = v3;
  if (v3) {
    [(MainWindowContentContainerViewControllerAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  v7 = [(MainWindowContentContainerViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  v8 = __UIAccessibilityCastAsSafeCategory();

  [v8 _accessibilitySetAccessibilityElementsForDisplayMode:0x7FFFFFFFFFFFFFFFLL searchDisplayMode:a4];
}

- (void)_accessibilitySetAccessibilityElements
{
  objc_super v3 = [(MainWindowContentContainerViewControllerAccessibility *)self safeValueForKey:@"_rootNavigationController"];
  v4 = [v3 safeUIViewForKey:@"viewSwitcher"];

  v5 = [(MainWindowContentContainerViewControllerAccessibility *)self safeValueForKey:@"_containerViewController"];
  id v6 = [v5 safeUIViewForKey:@"view"];

  v7 = [v6 subviews];
  v8 = (void *)[v7 mutableCopy];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__MainWindowContentContainerViewControllerAccessibility__accessibilitySetAccessibilityElements__block_invoke;
  v10[3] = &unk_265131DD0;
  id v11 = v4;
  id v9 = v4;
  objc_msgSend(v8, "ax_removeObjectsFromArrayUsingBlock:", v10);
  [v6 setAccessibilityElements:v8];
}

BOOL __95__MainWindowContentContainerViewControllerAccessibility__accessibilitySetAccessibilityElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

@end