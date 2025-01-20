@interface AccountStatusSummaryTileFeedItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AccountStatusSummaryTileFeedItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthRecordsUI.AccountStatusSummaryTileFeedItemView";
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
  v4.receiver = self;
  v4.super_class = (Class)AccountStatusSummaryTileFeedItemViewAccessibility;
  [(AccountStatusSummaryTileFeedItemViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(AccountStatusSummaryTileFeedItemViewAccessibility *)self safeValueForKey:@"accessibilityActionLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end