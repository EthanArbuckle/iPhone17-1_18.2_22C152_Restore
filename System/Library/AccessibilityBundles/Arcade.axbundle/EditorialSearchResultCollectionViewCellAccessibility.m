@interface EditorialSearchResultCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation EditorialSearchResultCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.EditorialSearchResultCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.EditorialSearchResultCollectionViewCell", @"accessibilityEditorialTypeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.EditorialSearchResultCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Arcade.EditorialSearchResultCollectionViewCell", @"accessibilitySummaryLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)EditorialSearchResultCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(EditorialSearchResultCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)[(EditorialSearchResultCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityEditorialTypeLabel, accessibilityTitleLabel, accessibilitySummaryLabel"];
}

@end