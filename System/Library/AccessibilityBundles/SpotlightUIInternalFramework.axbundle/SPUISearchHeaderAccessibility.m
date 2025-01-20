@interface SPUISearchHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (SPUISearchHeaderAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDictationButton;
@end

@implementation SPUISearchHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUISearchHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchHeader", @"init", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPUISearchHeader", @"searchField", "@", 0);
  [v3 validateClass:@"SPUITextField" isKindOfClass:@"UITextField"];
  if (AXProcessIsSpringBoard())
  {
    [v3 validateClass:@"SBIconController"];
    objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"_isShowingSearchableTodayView", "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"dismissSpotlightOrTodayViewAnimated:", "B", "B", 0);
  }
}

- (void)_axAnnotateDictationButton
{
  id v3 = accessibilityLocalizedString(@"dictate.button");
  objc_opt_class();
  v4 = [(SPUISearchHeaderAccessibility *)self safeValueForKey:@"searchField"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 rightView];
  [v6 setAccessibilityLabel:v3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SPUISearchHeaderAccessibility;
  [(SPUISearchHeaderAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SPUISearchHeaderAccessibility *)self _axAnnotateDictationButton];
}

- (SPUISearchHeaderAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPUISearchHeaderAccessibility;
  v2 = [(SPUISearchHeaderAccessibility *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(SPUISearchHeaderAccessibility *)v2 _axAnnotateDictationButton];
  }
  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v4 = objc_msgSend((id)MEMORY[0x2456626E0](@"SBIconController", a2), "safeValueForKey:", @"sharedInstance");
  objc_super v5 = [v4 safeValueForKey:@"iconManager"];

  int v6 = [v5 safeBoolForKey:@"_isShowingSearchableTodayView"];
  if (a3 == 2) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v9 = v5;
    AXPerformSafeBlock();
  }
  return v7;
}

uint64_t __53__SPUISearchHeaderAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissSpotlightOrTodayViewAnimated:1];
}

@end