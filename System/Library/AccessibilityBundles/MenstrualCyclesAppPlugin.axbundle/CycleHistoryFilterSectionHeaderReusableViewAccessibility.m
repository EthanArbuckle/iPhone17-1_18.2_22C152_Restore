@interface CycleHistoryFilterSectionHeaderReusableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CycleHistoryFilterSectionHeaderReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.CycleHistoryFilterSectionHeaderReusableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  v3.receiver = self;
  v3.super_class = (Class)CycleHistoryFilterSectionHeaderReusableViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(CycleHistoryFilterSectionHeaderReusableViewAccessibility *)&v3 accessibilityTraits];
}

@end