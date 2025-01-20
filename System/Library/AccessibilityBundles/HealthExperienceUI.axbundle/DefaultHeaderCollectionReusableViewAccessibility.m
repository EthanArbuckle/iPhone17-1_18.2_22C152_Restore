@interface DefaultHeaderCollectionReusableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation DefaultHeaderCollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.DefaultHeaderCollectionReusableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)DefaultHeaderCollectionReusableViewAccessibility;
  [(DefaultHeaderCollectionReusableViewAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  v3 = [(DefaultHeaderCollectionReusableViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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

uint64_t __94__DefaultHeaderCollectionReusableViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end