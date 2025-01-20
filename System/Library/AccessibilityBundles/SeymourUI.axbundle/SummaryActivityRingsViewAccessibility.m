@interface SummaryActivityRingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SummaryActivityRingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SummaryActivityRingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF8C0] axArrayByIgnoringNilElementsWithCount:1, MEMORY[0x245660210](@"ARUIRingsView", a2)];
  v4 = [(SummaryActivityRingsViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0 classExclusions:v3];

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SummaryActivityRingsViewAccessibility;
  return *MEMORY[0x263F1CF48] | [(SummaryActivityRingsViewAccessibility *)&v3 accessibilityTraits];
}

@end