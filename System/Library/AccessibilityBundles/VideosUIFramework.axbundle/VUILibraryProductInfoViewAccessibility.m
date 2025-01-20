@interface VUILibraryProductInfoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityGetInfoSections;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkHeaders;
- (void)didMoveToWindow;
@end

@implementation VUILibraryProductInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUILibraryProductInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryProductInfoView", @"infos", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryProductInfoSection", @"headerContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUILibraryProductInfoSection", @"dataViews", "@", 0);
  [v3 validateClass:@"VUILibraryProductInfoView" isKindOfClass:@"UIView"];
}

- (id)_accessibilityGetInfoSections
{
  v2 = [(VUILibraryProductInfoViewAccessibility *)self safeValueForKey:@"infos"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_10];

  return v4;
}

BOOL __71__VUILibraryProductInfoViewAccessibility__accessibilityGetInfoSections__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __UIAccessibilitySafeClass();
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)accessibilityElements
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [(VUILibraryProductInfoViewAccessibility *)self _accessibilityGetInfoSections];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "safeValueForKey:", @"headerContentView", (void)v13);
        [v3 axSafelyAddObject:v10];

        v11 = [v9 safeValueForKey:@"dataViews"];
        [v3 axSafelyAddObjectsFromArray:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_accessibilityMarkHeaders
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(VUILibraryProductInfoViewAccessibility *)self _accessibilityGetInfoSections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x263F1CEF8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        v9 = [v8 safeValueForKey:@"headerContentView"];
        v10 = __UIAccessibilityCastAsClass();

        objc_msgSend(v10, "setAccessibilityTraits:", v6 | objc_msgSend(v10, "accessibilityTraits"));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryProductInfoViewAccessibility;
  [(VUILibraryProductInfoViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VUILibraryProductInfoViewAccessibility *)self _accessibilityMarkHeaders];
}

- (void)didMoveToWindow
{
  [(VUILibraryProductInfoViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryProductInfoViewAccessibility;
  [(VUILibraryProductInfoViewAccessibility *)&v3 didMoveToWindow];
}

@end