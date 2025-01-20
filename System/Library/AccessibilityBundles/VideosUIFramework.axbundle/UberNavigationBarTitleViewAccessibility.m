@interface UberNavigationBarTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.UberNavigationBarTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  [(UberNavigationBarTitleViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(UberNavigationBarTitleViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_6];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityTraits];
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
  }
}

uint64_t __85__UberNavigationBarTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245669780](@"VUILabel");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  [(UberNavigationBarTitleViewAccessibility *)&v3 layoutSubviews];
  [(UberNavigationBarTitleViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end