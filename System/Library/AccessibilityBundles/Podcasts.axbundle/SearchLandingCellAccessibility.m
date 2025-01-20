@interface SearchLandingCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation SearchLandingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.SearchLandingCell";
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
  return (id)[(SearchLandingCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel"];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchLandingCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchLandingCellAccessibility *)&v3 accessibilityTraits];
}

@end