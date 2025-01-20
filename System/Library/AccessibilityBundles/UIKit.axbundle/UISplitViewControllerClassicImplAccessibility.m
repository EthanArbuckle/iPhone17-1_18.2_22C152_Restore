@interface UISplitViewControllerClassicImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
- (id)displayModeButtonItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyDisplayModeLabel;
- (void)_loadNewSubviews:(id)a3;
- (void)_updateDisplayModeButtonItem;
@end

@implementation UISplitViewControllerClassicImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISplitViewControllerClassicImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UISplitViewControllerClassicImpl";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "v";
  [location[0] validateClass:v4 hasInstanceMethod:@"_updateDisplayModeButtonItem" withFullSignature:0];
  [location[0] validateClass:v4 hasInstanceVariable:@"_displayModeButtonItem" withType:"UISplitViewControllerDisplayModeBarButtonItem"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_effectiveTargetDisplayMode", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_loadNewSubviews:", v3, v5, 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_svc" withType:"UISplitViewController"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"viewControllers", v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_loadNewSubviews:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  [(UISplitViewControllerClassicImplAccessibility *)&v5 _loadNewSubviews:location[0]];
  objc_opt_class();
  id v3 = (id)[(UISplitViewControllerClassicImplAccessibility *)v7 safeValueForKey:@"_svc"];
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();

  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (id)displayModeButtonItem
{
  id v6 = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  v5[0] = [(UISplitViewControllerClassicImplAccessibility *)&v4 displayModeButtonItem];
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v6);
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (void)_axApplyDisplayModeLabel
{
  id v5 = a1;
  if (a1)
  {
    id location = (id)[v5 safeValueForKey:@"_displayModeButtonItem"];
    if (location)
    {
      id v2 = (id)[v5 safeValueForKey:@"_effectiveTargetDisplayMode"];
      uint64_t v3 = [v2 integerValue];

      if (v3 == 1)
      {
        id v1 = (id)accessibilityUIKitLocalizedString();
        objc_msgSend(location, "setAccessibilityLabel:");

        [location accessibilitySetIdentification:@"DisplayMode"];
        [location setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
      }
      else
      {
        objc_msgSend(location, "setAccessibilityLabel:");
        [location accessibilitySetIdentification:0];
        [location setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F81370]];
      }
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_updateDisplayModeButtonItem
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  [(UISplitViewControllerClassicImplAccessibility *)&v2 _updateDisplayModeButtonItem];
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v4);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerClassicImplAccessibility;
  [(UISplitViewControllerClassicImplAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UISplitViewControllerClassicImplAccessibility _axApplyDisplayModeLabel](v4);
}

- (id)_accessibilitySpeakThisViewController
{
  v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  id v9 = (id)[(UISplitViewControllerClassicImplAccessibility *)self safeArrayForKey:@"viewControllers"];
  if ((unint64_t)[v9 count] > 2) {
    _AXAssert();
  }
  if ([v9 count] == 2) {
    id v2 = (id)[v9 objectAtIndex:1];
  }
  else {
    id v2 = (id)[v9 firstObject];
  }
  id v3 = v10[0];
  v10[0] = v2;

  char v8 = 0;
  objc_opt_class();
  id v7 = (id)__UIAccessibilityCastAsSafeCategory();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v5 = (id)[v6 _accessibilitySpeakThisViewController];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);

  return v5;
}

@end