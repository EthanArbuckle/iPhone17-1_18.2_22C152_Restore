@interface UISplitViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModalizeViewControllerViews;
- (void)setViewControllers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation UISplitViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISplitViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UISplitViewController" hasInstanceVariable:@"_impl" withType:"<UISplitViewControllerImpl>"];
  objc_msgSend(location[0], "validateClass:conformsToProtocol:", @"UISplitViewControllerClassicImpl");
  [location[0] validateClass:@"UISplitViewControllerPanelImpl" conformsToProtocol:@"UISplitViewControllerImpl"];
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewControllerAccessibility;
  [(UISplitViewControllerAccessibility *)&v3 viewDidAppear:a3];
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v6);
}

- (void)_axModalizeViewControllerViews
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = a1;
  if (a1)
  {
    char v10 = 1;
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v11 safeValueForKey:@"viewControllers"];
    uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0;
      unint64_t v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(__b[1] + 8 * v3);
        id location = (id)[v9 view];
        [location setShouldGroupAccessibilityChildren:1];
        if ((v10 & 1) != 0 && ([v11 isCollapsed] & 1) == 0 && objc_msgSend(v11, "displayMode") == 2)
        {
          [location _accessibilitySetIsScannerGroup:1];
          [location _accessibilitySetScannerGroupTraits:16];
        }
        else
        {
          [location _accessibilitySetIsScannerGroup:0];
          [location _accessibilitySetScannerGroupTraits:0];
        }
        char v10 = 0;
        objc_storeStrong(&location, 0);
        ++v3;
        if (v1 + 1 >= v4)
        {
          uint64_t v3 = 0;
          unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }
  }
}

- (void)setViewControllers:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISplitViewControllerAccessibility;
  [(UISplitViewControllerAccessibility *)&v3 setViewControllers:location[0]];
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewControllerAccessibility;
  [(UISplitViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v11);
  id v8 = (id)[(UISplitViewControllerAccessibility *)v11 safeValueForKey:@"_impl"];
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  SEL v5 = __80__UISplitViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  uint64_t v6 = &unk_2650ADF18;
  id v7 = v8;
  AXPerformSafeBlock();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
}

uint64_t __80__UISplitViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformation", a1, a1);
}

- (id)_accessibilitySpeakThisViewController
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UISplitViewControllerAccessibility *)self safeValueForKey:@"_impl"];
  id v3 = (id)[v4[0] _accessibilitySpeakThisViewController];
  objc_storeStrong(v4, 0);

  return v3;
}

@end