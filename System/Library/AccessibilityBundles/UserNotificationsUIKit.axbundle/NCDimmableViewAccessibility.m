@interface NCDimmableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation NCDimmableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCDimmableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  if (AXProcessIsSpringBoard()) {
    [v3 validateClass:@"SBBannerWindow"];
  }
  [v3 validateClass:@"NCNotificationViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_executeClearAction:", "v", "B", 0);
}

- (BOOL)accessibilityPerformEscape
{
  objc_opt_class();
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:self];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 presentingViewController];

  if (v5)
  {
    id v7 = v4;
    AXPerformSafeBlock();
  }
  return v5 != 0;
}

uint64_t __57__NCDimmableViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeClearAction:1];
}

- (int64_t)accessibilityContainerType
{
  v2 = [(NCDimmableViewAccessibility *)self _accessibilityWindow];
  MEMORY[0x2456680B0](@"SBBannerWindow");
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = 4;
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(NCDimmableViewAccessibility *)self _accessibilityWindow];
  MEMORY[0x2456680B0](@"SBBannerWindow");
  if (objc_opt_isKindOfClass())
  {
    int64_t v3 = accessibilityLocalizedString(@"notification.title");
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

@end