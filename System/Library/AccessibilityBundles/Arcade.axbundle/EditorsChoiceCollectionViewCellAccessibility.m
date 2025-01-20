@interface EditorsChoiceCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation EditorsChoiceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.EditorsChoiceCollectionViewCell";
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
  if ([(EditorsChoiceCollectionViewCellAccessibility *)self safeBoolForKey:@"accessibilityShowsBadge"])v3 = @"accessibilityBadgeView, accessibilityTitleLabel, accessibilityTextLabel"; {
  else
  }
    v3 = @"accessibilityTitleLabel, accessibilityTextLabel";
  v4 = [(EditorsChoiceCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:v3];

  return v4;
}

@end