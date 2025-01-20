@interface STUsageSummaryTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation STUsageSummaryTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUsageSummaryTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageSummaryTitleView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageSummaryTitleView", @"usageLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageSummaryTitleView", @"deltaAverageLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageSummaryTitleView", @"usageReport", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageSummaryTitleView", @"usageItemType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"totalScreenTime", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"type", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReport", @"activePickupDateIntervals", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(STUsageSummaryTitleViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(STUsageSummaryTitleViewAccessibility *)self safeValueForKey:@"usageReport"];
  if ([(STUsageSummaryTitleViewAccessibility *)self safeUnsignedIntegerForKey:@"usageItemType"] != 1)goto LABEL_9; {
  [v5 safeDoubleForKey:@"totalScreenTime"];
  }
  double v7 = v6;
  uint64_t v8 = [v5 safeUnsignedIntegerForKey:@"type"];
  if (v8)
  {
    if (v8 != 1 || (MEMORY[0x24565EF70](v7 < 60.0, v7), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_9:
      v14 = [(STUsageSummaryTitleViewAccessibility *)self safeValueForKey:@"usageLabel"];
      v9 = [v14 accessibilityLabel];
    }
  }
  else
  {
    v10 = objc_opt_new();
    [v10 setAllowedUnits:96];
    [v10 setUnitsStyle:1];
    [v5 safeCGFloatForKey:@"activePickupDateIntervals"];
    double v11 = v7 / v13.n128_f64[0];
    BOOL v12 = v13.n128_f64[0] <= 0.0;
    v13.n128_u64[0] = 0;
    if (!v12) {
      v13.n128_f64[0] = v11;
    }
    v9 = MEMORY[0x24565EF70](0, v13);

    if (!v9) {
      goto LABEL_9;
    }
  }
  v15 = [(STUsageSummaryTitleViewAccessibility *)self safeValueForKey:@"deltaAverageLabel"];
  v16 = [v15 accessibilityLabel];

  v17 = __AXStringForVariables();

  return v17;
}

@end