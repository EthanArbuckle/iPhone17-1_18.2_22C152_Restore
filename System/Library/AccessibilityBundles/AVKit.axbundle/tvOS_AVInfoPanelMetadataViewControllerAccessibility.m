@interface tvOS_AVInfoPanelMetadataViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation tvOS_AVInfoPanelMetadataViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVInfoPanelMetadataViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVInfoPanelMetadataViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoPanelMetadataViewController", @"descriptionViewController", "@", 0);
  [v3 validateClass:@"AVInfoPanelDescriptionViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoPanelDescriptionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoPanelDescriptionView", @"summaryView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)tvOS_AVInfoPanelMetadataViewControllerAccessibility;
  [(tvOS_AVInfoPanelMetadataViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(tvOS_AVInfoPanelMetadataViewControllerAccessibility *)self accessibilityHeaderElements];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = *MEMORY[0x263F1CEF8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAccessibilityTraits:v7];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)accessibilityHeaderElements
{
  v2 = [(tvOS_AVInfoPanelMetadataViewControllerAccessibility *)self safeValueForKeyPath:@"descriptionViewController.view"];
  id v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [v2 safeValueForKey:@"titleLabel"];
  uint64_t v5 = [v2 safeValueForKey:@"summaryView"];
  uint64_t v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

@end