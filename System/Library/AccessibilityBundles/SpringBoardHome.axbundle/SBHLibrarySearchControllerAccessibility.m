@interface SBHLibrarySearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setActive:(BOOL)a3;
@end

@implementation SBHLibrarySearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibrarySearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibrarySearchController", @"isActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibrarySearchController", @"setActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibrarySearchController", @"searchResultsController", "@", 0);
  [v3 validateClass:@"SBHIconLibraryTableViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)SBHLibrarySearchControllerAccessibility;
  [(SBHLibrarySearchControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(SBHLibrarySearchControllerAccessibility *)self safeValueForKey:@"searchResultsController"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = [v4 view];
    v6 = [v5 superview];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __85__SBHLibrarySearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v7[3] = &unk_265158088;
    objc_copyWeak(&v8, &location);
    [v6 _setAccessibilityViewIsModalBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

uint64_t __85__SBHLibrarySearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isActive"];

  return v2;
}

- (BOOL)accessibilityPerformEscape
{
  int v2 = [(SBHLibrarySearchControllerAccessibility *)self safeBoolForKey:@"isActive"];
  if (v2) {
    AXPerformSafeBlock();
  }
  return v2;
}

uint64_t __69__SBHLibrarySearchControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActive:0];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBHLibrarySearchControllerAccessibility *)self safeBoolForKey:@"isActive"];
  v6.receiver = self;
  v6.super_class = (Class)SBHLibrarySearchControllerAccessibility;
  [(SBHLibrarySearchControllerAccessibility *)&v6 setActive:v3];
  if (v5 != v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end