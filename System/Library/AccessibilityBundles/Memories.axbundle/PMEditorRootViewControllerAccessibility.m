@interface PMEditorRootViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMEditorRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMEditorRootViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMEditorRootViewController", @"orientationButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMEditorRootViewController", @"viewWillAppear:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PMEditorRootViewControllerAccessibility;
  [(PMEditorRootViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(PMEditorRootViewControllerAccessibility *)self safeUIViewForKey:@"orientationButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  v5 = accessibilityMemoriesLocalizedString(@"aspect.ratio");
  [v4 setAccessibilityLabel:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__PMEditorRootViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_2650A3728;
  objc_copyWeak(&v7, &location);
  [v4 _setAccessibilityValueBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __85__PMEditorRootViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"vertical.aspect.ratio";
  }
  else {
    v2 = @"horizontal.aspect.ratio";
  }
  id v3 = accessibilityMemoriesLocalizedString(v2);

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PMEditorRootViewControllerAccessibility;
  [(PMEditorRootViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(PMEditorRootViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end