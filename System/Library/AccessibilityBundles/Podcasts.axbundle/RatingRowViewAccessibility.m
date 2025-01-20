@interface RatingRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation RatingRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.RatingRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.RatingRowView", @"accessibilityRatingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.RatingRowView", @"accessibilityBarView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(RatingRowViewAccessibility *)self safeValueForKey:@"accessibilityRatingView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(RatingRowViewAccessibility *)self safeValueForKey:@"accessibilityBarView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

@end