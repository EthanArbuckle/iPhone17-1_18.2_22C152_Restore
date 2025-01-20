@interface MessageListSearchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setSearchSuggestionsVisible:(BOOL)a3;
@end

@implementation MessageListSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessageListSearchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListSearchViewController", @"setSearchSuggestionsVisible:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageListSearchViewController", @"isSearchSuggestionsVisible", "B", 0);
  [v3 validateClass:@"MessageListSearchViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewControllerAccessibility;
  [(MessageListSearchViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MessageListSearchViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = [v3 _accessibilityFindAncestor:&__block_literal_global_10 startWithSelf:1];
  if ([(MessageListSearchViewControllerAccessibility *)self safeBoolForKey:@"isSearchSuggestionsVisible"])
  {
    v5 = &__block_literal_global_292;
    v6 = v4;
  }
  else
  {
    v6 = v4;
    v5 = 0;
  }
  [v6 _setIsAccessibilityElementBlock:v5];
}

uint64_t __90__MessageListSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentification];
  uint64_t v3 = [v2 isEqualToString:@"AXUISearchControllerDimmingView"];

  return v3;
}

uint64_t __90__MessageListSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 0;
}

- (void)setSearchSuggestionsVisible:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessageListSearchViewControllerAccessibility;
  [(MessageListSearchViewControllerAccessibility *)&v4 setSearchSuggestionsVisible:a3];
  [(MessageListSearchViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end