@interface VUIMenuCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VUIMenuCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIMenuCollectionViewCell";
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
  return (id)[(VUIMenuCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
}

@end