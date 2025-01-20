@interface SeymourUI_MarketingHeaderBannerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)accessibilityConfigureForPlayback:(BOOL)a3;
@end

@implementation SeymourUI_MarketingHeaderBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.MarketingHeaderBannerCell";
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
  v3 = [MEMORY[0x263EFF8C0] axArrayByIgnoringNilElementsWithCount:1, MEMORY[0x245660210](@"SeymourUI.PlayButton", a2)];
  v4 = [(SeymourUI_MarketingHeaderBannerCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0 classExclusions:v3];

  return v4;
}

- (void)accessibilityConfigureForPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SeymourUI_MarketingHeaderBannerCellAccessibility;
  unint64_t v5 = *MEMORY[0x263F1CEE8] | (unint64_t)[(SeymourUI_MarketingHeaderBannerCellAccessibility *)&v7 accessibilityTraits];
  v6 = (void *)MEMORY[0x263F1CF40];
  if (!v3) {
    v6 = (void *)MEMORY[0x263F1CF10];
  }
  [(SeymourUI_MarketingHeaderBannerCellAccessibility *)self setAccessibilityTraits:*v6 | v5];
}

@end