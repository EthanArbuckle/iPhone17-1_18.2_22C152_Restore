@interface SearchUICompactCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SearchUICompactCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUICompactCardSectionView";
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
  return (id)[(SearchUICompactCardSectionViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end