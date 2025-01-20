@interface HKInteractiveChartAnnotationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKInteractiveChartAnnotationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKInteractiveChartAnnotationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartAnnotationView", @"bodyMarginsLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKBodyMarginsLayout", @"bodyView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKDateContentLayout", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKAnnotationColumnLayout", @"columnViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartAnnotationViewKeyValueLabel", @"tapOutBlock", "@?", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HKInteractiveChartAnnotationViewAccessibility *)self safeValueForKeyPath:@"bodyMarginsLayout.bodyView.contentView"];
  v4 = [v3 safeArrayForKey:@"columnViews"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) safeValueForKey:@"tapOutBlock"];
        v7 |= v10 != 0;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)HKInteractiveChartAnnotationViewAccessibility;
  unint64_t v11 = [(HKInteractiveChartAnnotationViewAccessibility *)&v14 accessibilityTraits];
  if (v7) {
    uint64_t v12 = *MEMORY[0x263F1CEE8];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12 | v11;
}

@end