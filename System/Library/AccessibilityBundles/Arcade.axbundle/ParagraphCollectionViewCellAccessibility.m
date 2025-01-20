@interface ParagraphCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ParagraphCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.ParagraphCollectionViewCell";
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
  return (id)[(ParagraphCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityExpandableTextView"];
}

@end