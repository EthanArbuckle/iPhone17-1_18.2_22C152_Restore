@interface SKUIRatingStarsCacheAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)ratingStarsImageForRating:(double)a3;
@end

@implementation SKUIRatingStarsCacheAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIRatingStarsCache";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)ratingStarsImageForRating:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIRatingStarsCacheAccessibility;
  v3 = -[SKUIRatingStarsCacheAccessibility ratingStarsImageForRating:](&v6, sel_ratingStarsImageForRating_);
  v4 = UIAXStarRatingStringForRating();
  [v3 setAccessibilityLabel:v4];

  return v3;
}

@end