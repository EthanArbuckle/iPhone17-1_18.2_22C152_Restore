@interface UGCRatingCategoryLikeDislikeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupSubviews;
@end

@implementation UGCRatingCategoryLikeDislikeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCRatingCategoryLikeDislikeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UGCRatingCategoryLikeDislikeView" hasInstanceVariable:@"_likeButton" withType:"UGCGlyphButtonView"];
  [v3 validateClass:@"UGCRatingCategoryLikeDislikeView" hasInstanceVariable:@"_dislikeButton" withType:"UGCGlyphButtonView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)UGCRatingCategoryLikeDislikeViewAccessibility;
  [(UGCRatingCategoryLikeDislikeViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(UGCRatingCategoryLikeDislikeViewAccessibility *)self safeUIViewForKey:@"_likeButton"];
  v4 = AXMapsLocString(@"LIKE");
  [v3 setAccessibilityLabel:v4];

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v6 = [(UGCRatingCategoryLikeDislikeViewAccessibility *)self safeUIViewForKey:@"_dislikeButton"];
  v7 = AXMapsLocString(@"DISLIKE");
  [v6 setAccessibilityLabel:v7];

  [v6 setAccessibilityTraits:v5];
}

- (void)_setupSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UGCRatingCategoryLikeDislikeViewAccessibility;
  [(UGCRatingCategoryLikeDislikeViewAccessibility *)&v3 _setupSubviews];
  [(UGCRatingCategoryLikeDislikeViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end