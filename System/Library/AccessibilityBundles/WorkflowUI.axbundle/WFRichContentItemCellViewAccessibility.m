@interface WFRichContentItemCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WFRichContentItemCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFRichContentItemCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFRichContentItemCellView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFRichContentItemCellView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFRichContentItemCellView", @"altLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(WFRichContentItemCellViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel, altLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)WFRichContentItemCellViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(WFRichContentItemCellViewAccessibility *)&v3 accessibilityTraits];
}

@end