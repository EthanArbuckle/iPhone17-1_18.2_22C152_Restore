@interface SFHighlightBannerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (SFHighlightBannerAccessibility)initWithHighlight:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupButton;
@end

@implementation SFHighlightBannerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFHighlightBanner";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFHighlightBanner", @"initWithHighlight:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFHighlightBanner", @"_close", "v", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SFHighlightBannerAccessibility;
  [(SFHighlightBannerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SFHighlightBannerAccessibility *)self _accessibilityMarkupButton];
}

- (void)_accessibilityMarkupButton
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          v11 = [v10 actionsForTarget:self forControlEvent:64];
          int v12 = [v11 containsObject:@"_close"];

          if (v12)
          {
            v13 = accessibilitySafariServicesLocalizedString(@"dismiss.shared.with.you.banner");
            [v10 setAccessibilityLabel:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (SFHighlightBannerAccessibility)initWithHighlight:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFHighlightBannerAccessibility;
  objc_super v3 = [(SFHighlightBannerAccessibility *)&v5 initWithHighlight:a3];
  [(SFHighlightBannerAccessibility *)v3 _accessibilityMarkupButton];

  return v3;
}

@end