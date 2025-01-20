@interface UGCPOIEnrichmentHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UGCPOIEnrichmentHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCPOIEnrichmentHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UGCPOIEnrichmentHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"UGCPOIEnrichmentHeaderView" hasInstanceVariable:@"_secondaryLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UGCPOIEnrichmentHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _secondaryLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48];
}

@end