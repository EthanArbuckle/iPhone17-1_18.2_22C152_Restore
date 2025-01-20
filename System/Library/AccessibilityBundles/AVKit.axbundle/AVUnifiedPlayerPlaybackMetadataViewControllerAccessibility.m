@interface AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVUnifiedPlayerPlaybackMetadataViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVUnifiedPlayerPlaybackMetadataViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVUnifiedPlayerPlaybackMetadataViewController", @"auxiliaryMetadataView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility;
  [(AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility *)self accessibilityHeaderElements];
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
  id v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [(AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  uint64_t v6 = [(AVUnifiedPlayerPlaybackMetadataViewControllerAccessibility *)self safeUIViewForKey:@"auxiliaryMetadataView"];
  uint64_t v7 = [v6 accessibilityElements];
  uint64_t v8 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 2, v5, v7);

  return v8;
}

@end