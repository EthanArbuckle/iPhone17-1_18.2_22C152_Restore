@interface ProductPageLinkCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ProductPageLinkCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.ProductPageLinkCollectionViewCell";
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
  return (id)[(ProductPageLinkCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"acccessibilityTextLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ProductPageLinkCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ProductPageLinkCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end