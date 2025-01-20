@interface SUUIChartColumnHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SUUIChartColumnHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIChartColumnHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIChartColumnHeaderView" hasInstanceVariable:@"_buttons" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIChartColumnHeaderView", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUUIChartColumnHeaderViewAccessibility;
  [(SUUIChartColumnHeaderViewAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(SUUIChartColumnHeaderViewAccessibility *)self safeValueForKey:@"_buttons", 0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CEF8];
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

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIChartColumnHeaderViewAccessibility;
  [(SUUIChartColumnHeaderViewAccessibility *)&v3 layoutSubviews];
  [(SUUIChartColumnHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end