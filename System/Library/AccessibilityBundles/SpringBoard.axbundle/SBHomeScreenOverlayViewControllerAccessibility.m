@interface SBHomeScreenOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBHomeScreenOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayViewController", @"isFromLeading", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"view", "@", 0);
  [v3 validateClass:@"SBHomeScreenOverlayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryViewController", @"popNestedViewControllerAnimated:withCompletion:", "v", "B", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenOverlayViewControllerAccessibility;
  [(SBHomeScreenOverlayViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBHomeScreenOverlayViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 _setAccessibilityElementsHiddenBlock:&__block_literal_global_19];
}

uint64_t __92__SBHomeScreenOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = +[AXSpringBoardGlue sharedInstance];
  int v1 = [v0 _axIsAppLibraryOrTodayViewPresent];

  return v1 ^ 1u;
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = AXSBHIconManagerFromSharedIconController();
  int v4 = [v3 safeBoolForKey:@"isMainDisplayLibraryViewVisible"];

  if (v4)
  {
    v5 = AXLibraryViewController(@"activeDisplayWindowScene");
    if ([v5 safeBoolForKey:@"isPresentingFolder"])
    {
      id v6 = v5;
      AXPerformSafeBlock();

      return 1;
    }
  }
  v8 = [(SBHomeScreenOverlayViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  char v9 = [v8 accessibilityPerformEscape];

  return v9;
}

uint64_t __76__SBHomeScreenOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) popNestedViewControllerAnimated:1 withCompletion:0];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5 = [(SBHomeScreenOverlayViewControllerAccessibility *)self safeBoolForKey:@"isFromLeading"];
  if (a3 == 1)
  {
    if (v5
      && ![(SBHomeScreenOverlayViewControllerAccessibility *)self _accessibilityIsRTL])
    {
      return 0;
    }
  }
  else if (a3 != 2 {
         || (v5 & 1) == 0
  }
         && ([(SBHomeScreenOverlayViewControllerAccessibility *)self _accessibilityIsRTL] & 1) == 0)
  {
    return 0;
  }

  return [(SBHomeScreenOverlayViewControllerAccessibility *)self accessibilityPerformEscape];
}

@end