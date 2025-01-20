@interface ModernProductReviewCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation ModernProductReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityRatingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityUsernameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ModernProductReviewCollectionViewCell", @"accessibilityReviewMoreButton", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(ModernProductReviewCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilityRatingView, accessibilityDateLabel, accessibilityUsernameLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ModernProductReviewCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ModernProductReviewCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  return (id)[(ModernProductReviewCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTextLabel"];
}

- (id)automationElements
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)ModernProductReviewCollectionViewCellAccessibility;
  v4 = [(ModernProductReviewCollectionViewCellAccessibility *)&v7 automationElements];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(ModernProductReviewCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityReviewMoreButton"];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

@end