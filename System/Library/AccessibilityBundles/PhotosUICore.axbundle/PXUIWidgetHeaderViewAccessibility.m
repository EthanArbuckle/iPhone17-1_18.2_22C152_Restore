@interface PXUIWidgetHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_titleLabelCreateIfNeeded:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PXUIWidgetHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXUIWidgetHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIWidgetHeaderView", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIWidgetHeaderView", @"_titleLabelCreateIfNeeded:", "@", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PXUIWidgetHeaderViewAccessibility;
  [(PXUIWidgetHeaderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXUIWidgetHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

- (id)_titleLabelCreateIfNeeded:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXUIWidgetHeaderViewAccessibility;
  uint64_t v4 = [(PXUIWidgetHeaderViewAccessibility *)&v6 _titleLabelCreateIfNeeded:a3];
  [(PXUIWidgetHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end