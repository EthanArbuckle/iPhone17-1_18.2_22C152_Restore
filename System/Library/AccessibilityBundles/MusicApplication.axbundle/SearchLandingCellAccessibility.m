@interface SearchLandingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchLandingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SearchLandingCell";
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
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SearchLandingCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitle"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchLandingCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchLandingCellAccessibility *)&v3 accessibilityTraits];
}

@end