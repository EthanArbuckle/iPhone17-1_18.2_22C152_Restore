@interface RootSideBarProfileViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RootSideBarProfileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.RootSideBarProfileView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)MEMORY[0x263EFF9B0];
  v3 = [(RootSideBarProfileViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_14];
  v4 = objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_281);
  v5 = [v2 orderedSetWithArray:v4];

  v6 = [v5 array];
  v7 = AXLabelForElements();

  return v7;
}

uint64_t __57__RootSideBarProfileViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUILabel");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v3 = [v5 axContainsString:@"SideBarClockView"];
  }
  return v3;
}

uint64_t __57__RootSideBarProfileViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessibilityLabel];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CEF8];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"profile.switcher.button.hint");
}

@end