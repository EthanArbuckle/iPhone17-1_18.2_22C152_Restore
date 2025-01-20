@interface VideosExtrasGridCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VideosExtrasGridCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosExtrasGridCollectionViewCell";
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
  return (id)[(VideosExtrasGridCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasGridCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VideosExtrasGridCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end