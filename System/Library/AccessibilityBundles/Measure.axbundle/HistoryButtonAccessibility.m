@interface HistoryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)showHistoryFrom:(id)a3;
@end

@implementation HistoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.HistoryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.HistoryView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.HistoryButton", @"showHistoryFrom:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"HISTORY_BUTTON");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HistoryButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HistoryButtonAccessibility *)&v3 accessibilityTraits];
}

- (void)showHistoryFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HistoryButtonAccessibility;
  [(HistoryButtonAccessibility *)&v4 showHistoryFrom:a3];
  uint64_t v3 = MEMORY[0x245653970](@"Measure.HistoryView");
  AXMeasureDidPotentiallyShowCardViewWithAncestorClass(v3);
}

@end