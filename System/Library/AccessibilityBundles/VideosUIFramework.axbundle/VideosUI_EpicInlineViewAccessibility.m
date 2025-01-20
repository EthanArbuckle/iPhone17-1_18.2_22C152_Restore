@interface VideosUI_EpicInlineViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VideosUI_EpicInlineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.EpicInlineView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.EpicInlineView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"VideosUI.VerticalStackView"];
  [v3 validateClass:@"VUILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)VideosUI_EpicInlineViewAccessibility;
  [(VideosUI_EpicInlineViewAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VideosUI_EpicInlineViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_8];
  v4 = [v3 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_284];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    uint64_t v8 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "setAccessibilityTraits:", v8 | objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "accessibilityTraits"));
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_EpicInlineViewAccessibility;
  [(VideosUI_EpicInlineViewAccessibility *)&v3 layoutSubviews];
  [(VideosUI_EpicInlineViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end