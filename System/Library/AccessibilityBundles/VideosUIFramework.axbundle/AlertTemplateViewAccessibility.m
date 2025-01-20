@interface AlertTemplateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation AlertTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.AlertTemplateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.AlertTemplateView" hasSwiftField:@"collectionView" withSwiftType:"VUILegacyCollectionView"];
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", @"VideosUI.AlertTemplateView", @"aboveCollectionComponents", "Array<(UIView, ViewLayout)>");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AlertTemplateViewAccessibility;
  [(AlertTemplateViewAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AlertTemplateViewAccessibility *)self safeSwiftArrayForKey:@"aboveCollectionComponents"];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__AlertTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_265166290;
  v15[4] = self;
  v4 = [v3 axMapObjectsUsingBlock:v15];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    uint64_t v9 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "setAccessibilityTraits:", v9 | objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "accessibilityTraits", (void)v11));
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v7);
  }
}

id __76__AlertTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"obj"];
  id v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AlertTemplateViewAccessibility;
  [(AlertTemplateViewAccessibility *)&v3 layoutSubviews];
  [(AlertTemplateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end