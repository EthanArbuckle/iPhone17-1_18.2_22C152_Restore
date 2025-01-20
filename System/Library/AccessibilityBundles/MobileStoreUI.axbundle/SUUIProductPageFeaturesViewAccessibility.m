@interface SUUIProductPageFeaturesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation SUUIProductPageFeaturesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageFeaturesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIProductPageFeaturesView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"SUUIProductPageFeaturesView" hasInstanceVariable:@"_featureViews" withType:"NSMutableArray"];
  [v3 validateClass:@"SUUIProductPageFeaturesView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(SUUIProductPageFeaturesViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF980] array];
    v4 = [(SUUIProductPageFeaturesViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
    v14 = v4;
    [v3 axSafelyAddObject:v4];
    v15 = self;
    [(SUUIProductPageFeaturesViewAccessibility *)self safeValueForKey:@"_featureViews"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [v9 safeValueForKey:@"title"];
          v11 = [v9 safeValueForKey:@"subtitle"];
          v12 = __UIAXStringForVariables();
          objc_msgSend(v9, "setIsAccessibilityElement:", 1, v11, @"__AXStringForVariablesSentinel");
          [v9 setAccessibilityLabel:v12];
          [v3 addObject:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    [(SUUIProductPageFeaturesViewAccessibility *)v15 _accessibilitySetRetainedValue:v3 forKey:*MEMORY[0x263F81490]];
  }

  return v3;
}

@end