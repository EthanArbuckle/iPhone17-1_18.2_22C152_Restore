@interface ChartOrCategoryBrickCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation ChartOrCategoryBrickCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ChartOrCategoryBrickCollectionViewCell";
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

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ChartOrCategoryBrickCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ChartOrCategoryBrickCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(ChartOrCategoryBrickCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"titleText"];
  objc_super v3 = __UIAXStringForVariables();

  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end