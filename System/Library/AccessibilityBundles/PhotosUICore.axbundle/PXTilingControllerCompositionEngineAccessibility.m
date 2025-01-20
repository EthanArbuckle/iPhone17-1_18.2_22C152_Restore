@interface PXTilingControllerCompositionEngineAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PXTilingControllerCompositionEngineAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXTilingControllerCompositionEngine";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)PXTilingControllerCompositionEngineAccessibility;
  [(PXTilingControllerCompositionEngineAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_opt_class();
  v3 = [(PXTilingControllerCompositionEngineAccessibility *)self safeValueForKey:@"_tilingControllers"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) _accessibilityLoadAccessibilityInformation];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

@end