@interface VideosUI_CanonicalInfoCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation VideosUI_CanonicalInfoCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CanonicalInfoCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.CanonicalInfoCardView" hasProperty:@"accessibilityTitleLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalInfoCardView" hasProperty:@"accessibilitySubtitleLabel" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalInfoCardView" hasProperty:@"accessibilityImageView" withType:"@"];
  [v3 validateClass:@"VideosUI.CanonicalInfoCardView" hasProperty:@"accessibilityTableView" withType:"@"];
  [v3 validateClass:@"VideosUI.TomatometerTableView" hasProperty:@"accessibilityItemViews" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)VideosUI_CanonicalInfoCardViewAccessibility;
  [(VideosUI_CanonicalInfoCardViewAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VideosUI_CanonicalInfoCardViewAccessibility *)self safeValueForKey:@"accessibilityTableView"];
  v4 = [MEMORY[0x263F089D8] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [v3 safeValueForKey:@"accessibilityItemViews"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = AXLabelForElements();
        [v4 appendFormat:@"%@\n", v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setAccessibilityLabel:v4];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VideosUI_CanonicalInfoCardViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel, accessibilityImageView, accessibilityTableView"];
  v4 = [(VideosUI_CanonicalInfoCardViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245669780](@"VUITextView")];
  v5 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v6 = [v4 safeValueForKey:@"_accessibilityGetValue"];
  uint64_t v7 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v6);
  uint64_t v8 = AXLabelForElements();

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VideosUI_CanonicalInfoCardViewAccessibility;
  [(VideosUI_CanonicalInfoCardViewAccessibility *)&v3 layoutSubviews];
  [(VideosUI_CanonicalInfoCardViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end