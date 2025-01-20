@interface VUIMediaTagsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateAccessibilityInformation;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation VUIMediaTagsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIMediaTagsView";
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
  [v3 validateClass:@"VUIMediaTagsView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"VUIMediaTagsView" hasProperty:@"viewsMap" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)VUIMediaTagsViewAccessibility;
  [(VUIMediaTagsViewAccessibility *)&v34 _accessibilityLoadAccessibilityInformation];
  char v33 = 0;
  objc_opt_class();
  id v3 = [(VUIMediaTagsViewAccessibility *)self safeValueForKey:@"viewsMap"];
  v4 = __UIAccessibilityCastAsClass();

  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    v27 = v5;
    uint64_t v28 = *MEMORY[0x263F1CF18];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v10 isEqualToString:@"VUIMediaTagKeySeparator"])
          {
            v11 = [v4 objectForKey:@"VUIMediaTagKeySeparator"];
            [v11 setIsAccessibilityElement:0];
            goto LABEL_38;
          }
          if ([v10 isEqualToString:@"VUIMediaTagKeyBrandLinkButton"])
          {
            v11 = [v4 objectForKey:v10];
            [v11 setAccessibilityIdentifier:@"BrandLinkButton"];
            goto LABEL_38;
          }
          if (([v10 isEqualToString:@"VUIMediaTagKeyRatingImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyClosedCaptionImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyVideoResolutionImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyVideoDynamicRangeImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyADLocalesImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeySDHLocalesImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyDolbyAtmosImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyAvailabilityImage"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyItunesExtras"] & 1) != 0
            || ([v10 isEqualToString:@"VUIMediaTagKeyCommonSenseImage"] & 1) != 0
            || [v10 isEqualToString:@"VUIMediaTagKeyTomatoFreshnessImage"])
          {
            v11 = [v4 objectForKey:v10];
            MEMORY[0x245669780](@"VUIImageView");
            if (objc_opt_isKindOfClass())
            {
              v12 = [v11 safeValueForKey:@"image"];
            }
            else
            {
              char v33 = 0;
              objc_opt_class();
              v12 = __UIAccessibilityCastAsClass();
              if (v33) {
                goto LABEL_42;
              }
            }
            v13 = v12;
            v14 = [v12 accessibilityIdentifier];

            v15 = [MEMORY[0x263F22248] sharedInstance];
            v16 = [v15 accessibilityLabelForID:v14];

            [v11 setAccessibilityTraits:v28];
            if ([v10 isEqualToString:@"VUIMediaTagKeyCommonSenseImage"])
            {
              char v33 = 0;
              objc_opt_class();
              v17 = v4;
              v18 = @"VUIMediaTagKeyCommonSenseRating";
              goto LABEL_30;
            }
            if ([v10 isEqualToString:@"VUIMediaTagKeyTomatoFreshnessImage"])
            {
              char v33 = 0;
              objc_opt_class();
              v17 = v4;
              v18 = @"VUIMediaTagKeyTomatoPercentage";
LABEL_30:
              v19 = [v17 objectForKey:v18];
              v20 = __UIAccessibilityCastAsClass();

              if (v33) {
LABEL_42:
              }
                abort();
              v21 = [v20 text];
              v22 = __UIAXStringForVariables();
              objc_msgSend(v20, "setAccessibilityLabel:", v22, v21, @"__AXStringForVariablesSentinel");
            }
            else
            {
              if ([v10 isEqualToString:@"VUIMediaTagKeyAvailabilityImage"]
                && ([v11 accessibilityIdentifier],
                    v23 = objc_claimAutoreleasedReturnValue(),
                    int v24 = [v23 isEqualToString:@"Punchout"],
                    v23,
                    v24))
              {
                v25 = v11;
                uint64_t v26 = 0;
              }
              else
              {
                [v11 setAccessibilityLabel:v16];
                v25 = v11;
                uint64_t v26 = 1;
              }
              [v25 setIsAccessibilityElement:v26];
            }

            v5 = v27;
LABEL_38:

            continue;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }
}

- (void)_accessibilityUpdateAccessibilityInformation
{
  id v3 = [(VUIMediaTagsViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_12];
  if (v3)
  {
    id v4 = v3;
    -[VUIMediaTagsViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", [v3 accessibilityTraits]);
    [v4 accessibilityActivationPoint];
    -[VUIMediaTagsViewAccessibility setAccessibilityActivationPoint:](self, "setAccessibilityActivationPoint:");
    id v3 = v4;
  }
}

uint64_t __77__VUIMediaTagsViewAccessibility__accessibilityUpdateAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"BrandLinkButton"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return [(VUIMediaTagsViewAccessibility *)self _accessibilityIsFocusForFocusEverywhereRunningForFocusItem] ^ 1;
}

- (id)accessibilityLabel
{
  v2 = [(VUIMediaTagsViewAccessibility *)self subviews];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_374);
  id v4 = AXLabelForElements();

  return v4;
}

uint64_t __51__VUIMediaTagsViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

- (void)didMoveToWindow
{
  [(VUIMediaTagsViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaTagsViewAccessibility;
  [(VUIMediaTagsViewAccessibility *)&v3 didMoveToWindow];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaTagsViewAccessibility;
  [(VUIMediaTagsViewAccessibility *)&v3 layoutSubviews];
  [(VUIMediaTagsViewAccessibility *)self _accessibilityUpdateAccessibilityInformation];
}

@end