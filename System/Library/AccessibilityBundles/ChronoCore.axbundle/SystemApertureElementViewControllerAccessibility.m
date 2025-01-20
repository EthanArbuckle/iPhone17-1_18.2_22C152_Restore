@interface SystemApertureElementViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)_accessibilityApertureLayoutMode;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)addChildViewController:(id)a3;
- (void)updateSystemApertureElements;
@end

@implementation SystemApertureElementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChronoCore.SystemApertureElementViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ChronoCore.SystemApertureElementViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"ChronoCore.SystemApertureElementViewController" hasSwiftField:@"leadingUIHostingController" withSwiftType:"Optional<_JindoAccessoryViewController>"];
  [v3 validateClass:@"ChronoCore.SystemApertureElementViewController" hasSwiftField:@"leadingUIHostingController" withSwiftType:"Optional<_JindoAccessoryViewController>"];
  [v3 validateClass:@"ChronoCore.SystemApertureElementViewController" hasSwiftField:@"minimalUIHostingController" withSwiftType:"Optional<_JindoAccessoryViewController>"];
  [v3 validateClass:@"ChronoCore.SystemApertureElementViewController" hasSwiftField:@"expandedUIHostingController" withSwiftType:"Optional<_JindoAccessoryViewController>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUISystemApertureElementSource", @"layoutMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowScene", @"systemApertureElementSource", "@", 0);
}

- (int64_t)_accessibilityApertureLayoutMode
{
  v2 = [(SystemApertureElementViewControllerAccessibility *)self view];
  id v3 = [v2 _accessibilityWindowScene];

  v4 = [v3 safeValueForKey:@"systemApertureElementSource"];
  v5 = __UIAccessibilitySafeClass();

  int64_t v6 = (int)[v5 safeIntForKey:@"layoutMode"];
  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SystemApertureElementViewControllerAccessibility;
  [(SystemApertureElementViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SystemApertureElementViewControllerAccessibility *)self updateSystemApertureElements];
}

- (void)updateSystemApertureElements
{
  objc_opt_class();
  objc_super v3 = [(SystemApertureElementViewControllerAccessibility *)self safeSwiftValueForKey:@"leadingUIHostingController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];

  objc_opt_class();
  int64_t v6 = [(SystemApertureElementViewControllerAccessibility *)self safeSwiftValueForKey:@"trailingUIHostingController"];
  v7 = __UIAccessibilityCastAsClass();

  v8 = [v7 view];

  objc_opt_class();
  v9 = [(SystemApertureElementViewControllerAccessibility *)self safeSwiftValueForKey:@"minimalUIHostingController"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 view];

  LOBYTE(location) = 0;
  objc_opt_class();
  v12 = [(SystemApertureElementViewControllerAccessibility *)self safeSwiftValueForKey:@"expandedUIHostingController"];
  v13 = __UIAccessibilityCastAsClass();

  v14 = [v13 view];

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke;
  v21[3] = &unk_265115F90;
  objc_copyWeak(&v22, &location);
  [v5 _setAccessibilityElementsHiddenBlock:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_2;
  v19[3] = &unk_265115F90;
  objc_copyWeak(&v20, &location);
  [v8 _setAccessibilityElementsHiddenBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_3;
  v17[3] = &unk_265115F90;
  objc_copyWeak(&v18, &location);
  [v11 _setAccessibilityElementsHiddenBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_4;
  v15[3] = &unk_265115F90;
  objc_copyWeak(&v16, &location);
  [v14 _setAccessibilityElementsHiddenBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained _accessibilityApertureLayoutMode] != 3;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained _accessibilityApertureLayoutMode] != 3;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained _accessibilityApertureLayoutMode] != 2;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained _accessibilityApertureLayoutMode] != 4;

  return v2;
}

- (void)addChildViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SystemApertureElementViewControllerAccessibility;
  [(SystemApertureElementViewControllerAccessibility *)&v4 addChildViewController:a3];
  [(SystemApertureElementViewControllerAccessibility *)self updateSystemApertureElements];
}

@end