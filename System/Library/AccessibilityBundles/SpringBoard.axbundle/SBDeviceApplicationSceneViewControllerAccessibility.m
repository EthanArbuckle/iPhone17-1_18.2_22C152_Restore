@interface SBDeviceApplicationSceneViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupView;
- (void)viewDidLoad;
@end

@implementation SBDeviceApplicationSceneViewControllerAccessibility

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewControllerAccessibility;
  [(SBDeviceApplicationSceneViewControllerAccessibility *)&v3 viewDidLoad];
  [(SBDeviceApplicationSceneViewControllerAccessibility *)self _accessibilityMarkupView];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewControllerAccessibility;
  [(SBDeviceApplicationSceneViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBDeviceApplicationSceneViewControllerAccessibility *)self _accessibilityMarkupView];
}

- (void)_accessibilityMarkupView
{
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__SBDeviceApplicationSceneViewControllerAccessibility__accessibilityMarkupView__block_invoke;
  v5[3] = &unk_265153DC0;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &location);
  [v4 _setAccessibilityElementsBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

+ (id)safeCategoryTargetClassName
{
  return @"SBDeviceApplicationSceneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBDeviceApplicationSceneViewController" hasInstanceVariable:@"_activeOverlayViewProviders" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneOverlayViewProvider", @"_realOverlayViewController", "@", 0);
}

id __79__SBDeviceApplicationSceneViewControllerAccessibility__accessibilityMarkupView__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained subviews];
  v25 = v2;
  [v2 axSafelyAddObjectsFromArray:v5];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v6 safeArrayForKey:@"_activeOverlayViewProviders"];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        v13 = [v12 safeValueForKey:@"_realOverlayViewController"];
        v14 = __UIAccessibilityCastAsClass();

        v15 = [v14 view];
        v16 = [v15 window];

        id v17 = objc_loadWeakRetained(v3);
        v18 = [v17 window];

        if (v16 != v18)
        {
          v19 = [v16 subviews];
          [v25 axSafelyAddObjectsFromArray:v19];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  v20 = (void *)MEMORY[0x263F1CB60];
  v21 = [v25 reverseObjectEnumerator];
  v22 = [v21 allObjects];
  v23 = [v20 _subviewsReplacedByModalViewSubviewsIfNecessary:v22];

  return v23;
}

@end