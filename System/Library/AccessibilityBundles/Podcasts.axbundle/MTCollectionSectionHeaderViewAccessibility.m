@interface MTCollectionSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTCollectionSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTCollectionSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  [(MTCollectionSectionHeaderViewAccessibility *)self accessibilityFrame];
  return v3 == *(double *)(MEMORY[0x263F001B0] + 8) && v2 == *MEMORY[0x263F001B0];
}

- (id)accessibilityLabel
{
  double v2 = [(MTCollectionSectionHeaderViewAccessibility *)self safeValueForKey:@"textLabel"];
  double v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

@end