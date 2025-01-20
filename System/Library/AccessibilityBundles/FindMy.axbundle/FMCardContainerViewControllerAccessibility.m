@interface FMCardContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityManageFMMapOptionsView;
- (void)handleCloseAction;
- (void)viewDidLayoutSubviews;
@end

@implementation FMCardContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMCardContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FindMy.FMCardContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FindMy.FMCardContainerViewController", @"handleCloseAction", "v", 0);
  [v3 validateClass:@"FindMy.FMCardContainerViewController" hasSwiftFieldOfAnyClass:@"passthroughView"];
  [v3 validateClass:@"FindMy.FMMapOptionsView"];
  [v3 validateClass:@"MKMapView"];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FMCardContainerViewControllerAccessibility;
  [(FMCardContainerViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(FMCardContainerViewControllerAccessibility *)self _accessibilityManageFMMapOptionsView];
}

- (void)_accessibilityManageFMMapOptionsView
{
  objc_opt_class();
  objc_super v3 = [(FMCardContainerViewControllerAccessibility *)self safeSwiftValueForKey:@"passthroughView"];
  __UIAccessibilityCastAsClass();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [v7 _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:1];
  v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_294];
  v6 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_296];
  objc_msgSend(v5, "setAccessibilityElementsHidden:", objc_msgSend(v6, "_accessibilityIsVisibleByCompleteHitTest") ^ 1);
}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentification];
  uint64_t v3 = [v2 isEqualToString:@"FMMainView"];

  return v3;
}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24564C960](@"FindMy.FMMapOptionsView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__FMCardContainerViewControllerAccessibility__accessibilityManageFMMapOptionsView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24564C960](@"MKMapView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)handleCloseAction
{
  v7.receiver = self;
  v7.super_class = (Class)FMCardContainerViewControllerAccessibility;
  [(FMCardContainerViewControllerAccessibility *)&v7 handleCloseAction];
  objc_opt_class();
  uint64_t v3 = [(FMCardContainerViewControllerAccessibility *)self safeSwiftValueForKey:@"passthroughView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityFindAncestor:&__block_literal_global_300 startWithSelf:1];
  v6 = [v5 _accessibilityFindSubviewDescendant:&__block_literal_global_302];
  [v6 setAccessibilityElementsHidden:0];
}

uint64_t __63__FMCardContainerViewControllerAccessibility_handleCloseAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessibilityIdentification];
  uint64_t v3 = [v2 isEqualToString:@"FMMainView"];

  return v3;
}

uint64_t __63__FMCardContainerViewControllerAccessibility_handleCloseAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24564C960](@"FindMy.FMMapOptionsView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end