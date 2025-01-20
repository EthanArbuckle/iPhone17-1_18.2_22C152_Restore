@interface ProductReviewCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityProductReviewCollectionViewCellElements;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_setAccessibilityProductReviewCollectionViewCellElements:(id)a3;
@end

@implementation ProductReviewCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.ProductReviewCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductReviewCollectionViewCellElements
{
}

- (void)_setAccessibilityProductReviewCollectionViewCellElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityRatingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityAuthorLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityBodyLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityResponseTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityResponseDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.ProductReviewCollectionViewCell", @"accessibilityResponseBodyLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ProductReviewCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ProductReviewCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseTitleLabel"];
  int v4 = [v3 _accessibilityViewIsVisible];
  if (v4)
  {
    v5 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseTitleLabel"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseDateLabel"];
  int v7 = [v6 _accessibilityViewIsVisible];
  if (v7)
  {
    v8 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseDateLabel"];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseBodyLabel"];
  if ([v9 _accessibilityViewIsVisible])
  {
    v15 = [(ProductReviewCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityResponseBodyLabel"];
    v14 = v8;
    v10 = __UIAXStringForVariables();
  }
  else
  {
    v15 = 0;
    v14 = v8;
    v10 = __UIAXStringForVariables();
  }

  if (v7) {
  if (v4)
  }

  v11 = [(ProductReviewCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilityDateLabel, accessibilityRatingView, accessibilityAuthorLabel, accessibilityBodyLabel", v14, v15, @"__AXStringForVariablesSentinel"];
  v12 = __UIAXStringForVariables();

  return v12;
}

@end