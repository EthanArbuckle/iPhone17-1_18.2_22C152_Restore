@interface TVRatingBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TVRatingBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRatingBadgeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(TVRatingBadgeViewAccessibility *)self safeValueForKey:@"ratingValue"];
  [v3 floatValue];
  float v5 = v4;
  double v6 = v4;

  if (v5 < 0.0 || v5 > 1.0)
  {
    v10 = [NSNumber numberWithDouble:v6];
    _AXAssert();

    v11.receiver = self;
    v11.super_class = (Class)TVRatingBadgeViewAccessibility;
    v8 = [(TVRatingBadgeViewAccessibility *)&v11 accessibilityLabel];
  }
  else
  {
    v8 = UIAXStarRatingStringForRatingWithMaxRating();
  }

  return v8;
}

@end