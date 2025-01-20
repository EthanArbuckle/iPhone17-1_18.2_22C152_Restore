@interface UIMultiColumnViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModalizeViewControllerViews;
- (void)setNavControllers:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation UIMultiColumnViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIMultiColumnViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "@";
  v5 = @"UIMultiColumnViewController";
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"setNavControllers:", v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"navControllers", v6, 0);
  v4 = "UIBarButtonItem";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, @"_hideSecondColumnBarButtonItem");
  [location[0] validateClass:v5 hasInstanceVariable:@"_showSecondColumnBarButtonItem" withType:v4];
  [location[0] validateClass:v5 isKindOfClass:@"UIViewController"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_secondColumnBarButtonItem:createIfNecessary:", v6, "q", "B", 0);
  objc_storeStrong(v8, v7);
}

- (void)_axModalizeViewControllerViews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v17 = a1;
  if (a1)
  {
    id v16 = (id)[v17 safeValueForKey:@"navControllers"];
    memset(__b, 0, 0x40uLL);
    id obj = v16;
    uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v7)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0;
      unint64_t v5 = v7;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        __b[8] = *(void *)(__b[1] + 8 * v4);
        char v13 = 0;
        id v12 = (id)__UIAccessibilitySafeClass();
        if (v13) {
          abort();
        }
        id v11 = v12;
        objc_storeStrong(&v12, 0);
        id v14 = (id)[v11 view];

        [v14 setShouldGroupAccessibilityChildren:1];
        objc_storeStrong(&v14, 0);
        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }

    char v10 = 0;
    objc_opt_class();
    id v9 = (id)__UIAccessibilityCastAsClass();
    id v8 = v9;
    objc_storeStrong(&v9, 0);
    id v1 = (id)[v8 view];
    [v1 _accessibilitySetSortPriority:1];

    objc_storeStrong(&v16, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  [(UIMultiColumnViewControllerAccessibility *)&v3 viewDidAppear:a3];
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v6);
}

- (void)setViewControllers:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  [(UIMultiColumnViewControllerAccessibility *)&v3 setViewControllers:location[0]];
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (void)setNavControllers:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  [(UIMultiColumnViewControllerAccessibility *)&v3 setViewControllers:location[0]];
  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  id v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  BOOL v8 = a4;
  v6.receiver = self;
  v6.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  id v7 = [(UIMultiColumnViewControllerAccessibility *)&v6 _secondColumnBarButtonItem:a3 createIfNecessary:a4];
  [(UIMultiColumnViewControllerAccessibility *)v11 _accessibilityLoadAccessibilityInformation];
  id v5 = v7;
  objc_storeStrong(&v7, 0);

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  BOOL v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIMultiColumnViewControllerAccessibility;
  [(UIMultiColumnViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(UIMultiColumnViewControllerAccessibility *)v8 safeValueForKey:@"_hideSecondColumnBarButtonItem"];
  id v2 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v3, "setAccessibilityLabel:");

  id v5 = (id)[(UIMultiColumnViewControllerAccessibility *)v8 safeValueForKey:@"_showSecondColumnBarButtonItem"];
  id v4 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(v5, "setAccessibilityLabel:");

  -[UIMultiColumnViewControllerAccessibility _axModalizeViewControllerViews](v8);
}

@end