@interface EditorsChoiceCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation EditorsChoiceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.EditorsChoiceCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorsChoiceCollectionViewCell", @"accessibilityBadgeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorsChoiceCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorsChoiceCollectionViewCell", @"accessibilityTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorsChoiceCollectionViewCell", @"accessibilityShowsBadge", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(EditorsChoiceCollectionViewCellAccessibility *)self safeBoolForKey:@"accessibilityShowsBadge"])id v3 = @"accessibilityBadgeView, accessibilityTitleLabel, accessibilityTextLabel"; {
  else
  }
    id v3 = @"accessibilityTitleLabel, accessibilityTextLabel";
  v4 = [(EditorsChoiceCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:v3];

  return v4;
}

@end