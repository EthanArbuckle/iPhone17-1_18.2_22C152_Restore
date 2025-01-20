@interface CNAvatarCardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CNAvatarCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAvatarCardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CNAvatarCardViewControllerAccessibility;
  [(CNAvatarCardViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  v3 = [(CNAvatarCardViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 superview];

  v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_5];
  v6 = v5;
  if (v5)
  {
    [v5 setIsAccessibilityElement:1];
    v7 = accessibilityLocalizedString(@"context.menu.dismiss");
    [v6 setAccessibilityLabel:v7];

    [v6 _accessibilitySetSortPriority:-1];
  }
}

uint64_t __85__CNAvatarCardViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456487F0](@"UIVisualEffectView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewControllerAccessibility;
  [(CNAvatarCardViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(CNAvatarCardViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end