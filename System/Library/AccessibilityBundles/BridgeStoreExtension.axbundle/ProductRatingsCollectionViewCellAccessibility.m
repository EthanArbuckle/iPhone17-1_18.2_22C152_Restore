@interface ProductRatingsCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ProductRatingsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.ProductRatingsCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BridgeStoreExtension.ProductRatingsCollectionViewCell" hasSwiftField:@"productRatingView" withSwiftType:"Optional<ProductRatingsView>"];
  [v3 validateClass:@"BridgeStoreExtension.ProductRatingsView" hasSwiftField:@"currentRatingLabel" withSwiftType:"DynamicLabel"];
  [v3 validateClass:@"BridgeStoreExtension.ProductRatingsView" hasSwiftField:@"currentRatingStarsView" withSwiftType:"RatingView"];
  [v3 validateClass:@"BridgeStoreExtension.ProductRatingsView" hasSwiftField:@"ratingsCountLabel" withSwiftType:"DynamicLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_opt_new();
  v4 = [(ProductRatingsCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"productRatingView"];
  v5 = [v4 safeSwiftValueForKey:@"currentRatingLabel"];
  [v3 axSafelyAddObject:v5];
  v6 = [v4 safeSwiftValueForKey:@"currentRatingStarsView"];
  [v3 axSafelyAddObject:v6];
  v7 = [v4 safeSwiftValueForKey:@"ratingsCountLabel"];
  [v3 axSafelyAddObject:v7];
  v8 = AXLabelForElements();

  return v8;
}

@end