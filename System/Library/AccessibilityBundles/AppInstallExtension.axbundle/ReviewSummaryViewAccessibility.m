@interface ReviewSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ReviewSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ReviewSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStoreKitInternal.DynamicTypeLabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"AppInstallExtension.ReviewSummaryView" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicTypeLabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)ReviewSummaryViewAccessibility;
  [(ReviewSummaryViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ReviewSummaryViewAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__ReviewSummaryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265104BB0;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityLabelBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __76__ReviewSummaryViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"attributedText"];

  if (v2)
  {
    id v3 = [v2 string];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end