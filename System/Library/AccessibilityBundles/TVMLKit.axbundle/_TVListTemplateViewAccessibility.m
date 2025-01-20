@interface _TVListTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setBannerView:(id)a3;
- (void)setListView:(id)a3;
- (void)setPreviewView:(id)a3;
@end

@implementation _TVListTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVListTemplateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListTemplateView", @"setBannerView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListTemplateView", @"setListView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVListTemplateView", @"setPreviewView:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)_TVListTemplateViewAccessibility;
  [(_TVListTemplateViewAccessibility *)&v39 _accessibilityLoadAccessibilityInformation];
  Class v3 = NSClassFromString(&cfstr_Tvlabel_0.isa);
  NSClassFromString(&cfstr_Tvcollectionwr_0.isa);
  NSClassFromString(&cfstr_Tvlistview.isa);
  v29 = self;
  v4 = [(_TVListTemplateViewAccessibility *)self safeValueForKey:@"bannerView"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __78___TVListTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v34[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v34[4] = v3;
  v28 = v4;
  v5 = [v4 _accessibilityFindSubviewDescendantsPassingTest:v34];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    uint64_t v9 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v10), "setAccessibilityTraits:", v9 | objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v10), "accessibilityTraits"));
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  v11 = [(_TVListTemplateViewAccessibility *)v29 safeValueForKey:@"listView"];
  if (objc_opt_isKindOfClass())
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v27 = v11;
    v12 = [v11 subviews];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
          if (objc_opt_isKindOfClass())
          {
            [v17 setAccessibilityContainerType:4];
            v18 = UIKitAccessibilityLocalizedString();
            v19 = [v17 accessibilityLabel];
            if (([v19 containsString:v18] & 1) == 0)
            {
              v20 = __UIAXStringForVariables();
              objc_msgSend(v17, "setAccessibilityLabel:", v20, v19, @"__AXStringForVariablesSentinel");
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v14);
    }

    v11 = v27;
  }
  v21 = [(_TVListTemplateViewAccessibility *)v29 safeValueForKey:@"previewView"];
  if (v21)
  {
    v22 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    [v22 setLeafNodePredicate:&__block_literal_global_6];
    v23 = [v21 _accessibilityLeafDescendantsWithCount:1 options:v22];
    v24 = [v23 firstObject];

    if (!v24)
    {
      [v22 setLeafNodePredicate:&__block_literal_global_312];
      v25 = [v21 _accessibilityLeafDescendantsWithCount:1 options:v22];
      v26 = [v25 firstObject];

      [v26 _accessibilitySetUserDefinedIsGuideElement:1];
    }
  }
}

- (void)setBannerView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  [(_TVListTemplateViewAccessibility *)&v4 setBannerView:a3];
  [(_TVListTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setListView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  [(_TVListTemplateViewAccessibility *)&v4 setListView:a3];
  [(_TVListTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setPreviewView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  [(_TVListTemplateViewAccessibility *)&v4 setPreviewView:a3];
  [(_TVListTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end