@interface VideosUI_CanonicalFooterSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axHeaderView;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VideosUI_CanonicalFooterSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CanonicalFooterSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIImageView"];
  [v3 validateClass:@"VUIImageView" hasProperty:@"image" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalFooterSectionView" hasProperty:@"accessibilityHeaderView" withType:"@"];
}

- (id)_axHeaderView
{
  return (id)[(VideosUI_CanonicalFooterSectionViewAccessibility *)self safeValueForKey:@"accessibilityHeaderView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)VideosUI_CanonicalFooterSectionViewAccessibility;
  [(VideosUI_CanonicalFooterSectionViewAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VideosUI_CanonicalFooterSectionViewAccessibility *)self _axHeaderView];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = [v4 subviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        MEMORY[0x245669780](@"VUIImageView");
        if (objc_opt_isKindOfClass())
        {
          v11 = [v10 safeValueForKey:@"image"];
          v12 = [v11 accessibilityIdentifier];

          v13 = [MEMORY[0x263F22248] sharedInstance];
          v14 = [v13 accessibilityLabelForID:v12];
          [v10 setAccessibilityLabel:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(VideosUI_CanonicalFooterSectionViewAccessibility *)self _axHeaderView];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_CanonicalFooterSectionViewAccessibility;
  [(VideosUI_CanonicalFooterSectionViewAccessibility *)&v3 layoutSubviews];
  [(VideosUI_CanonicalFooterSectionViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end