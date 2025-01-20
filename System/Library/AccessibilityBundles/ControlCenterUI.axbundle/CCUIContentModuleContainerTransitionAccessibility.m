@interface CCUIContentModuleContainerTransitionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axElementToFocusForViewController:(id)a3;
- (id)_axExpandedPlatterModalParentOfView:(id)a3;
- (void)transitionDidEnd:(BOOL)a3;
@end

@implementation CCUIContentModuleContainerTransitionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIContentModuleContainerTransition";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerTransition", @"transitionDidEnd:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerTransition", @"viewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerTransition", @"isAppearanceTransition", "B", 0);
  [v3 validateClass:@"_UIInteractiveHighlightContentView"];
  [v3 validateClass:@"CCUIContentModuleContainerViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"moduleContentView", "@", 0);
}

- (void)transitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CCUIContentModuleContainerTransitionAccessibility;
  -[CCUIContentModuleContainerTransitionAccessibility transitionDidEnd:](&v10, sel_transitionDidEnd_);
  if (v3)
  {
    objc_opt_class();
    v5 = [(CCUIContentModuleContainerTransitionAccessibility *)self safeValueForKey:@"viewController"];
    v6 = __UIAccessibilityCastAsClass();

    v7 = [(CCUIContentModuleContainerTransitionAccessibility *)self _axElementToFocusForViewController:v6];
    uint64_t v8 = [(CCUIContentModuleContainerTransitionAccessibility *)self safeBoolForKey:@"isAppearanceTransition"];
    v9 = [(CCUIContentModuleContainerTransitionAccessibility *)self _axExpandedPlatterModalParentOfView:v7];
    [v9 setAccessibilityViewIsModal:v8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v7);
  }
}

- (id)_axExpandedPlatterModalParentOfView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MEMORY[0x245648D60](@"_UIInteractiveHighlightContentView");
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__CCUIContentModuleContainerTransitionAccessibility__axExpandedPlatterModalParentOfView___block_invoke;
    v7[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v7[4] = v4;
    v5 = [v3 _accessibilityFindAncestor:v7 startWithSelf:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __89__CCUIContentModuleContainerTransitionAccessibility__axExpandedPlatterModalParentOfView___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_axElementToFocusForViewController:(id)a3
{
  id v3 = a3;
  if ([v3 safeBoolForKey:@"expanded"])
  {
    uint64_t v4 = [v3 safeValueForKey:@"moduleContentView"];
  }
  else
  {
    v5 = [v3 safeValueForKey:@"contentViewController"];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v5 _accessibilityControlCenterElementToFocusAfterClose],
          (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v4 = [v3 safeValueForKey:@"moduleContentView"];
    }
  }

  return v4;
}

@end