@interface SKUIStarRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SKUIStarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIStarRatingView" hasInstanceVariable:@"_ratingStarsImageView" withType:"UIImageView"];
  [v3 validateClass:@"SKUIStarRatingView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(SKUIStarRatingViewAccessibility *)self safeValueForKey:@"_ratingStarsImageView"];
  v4 = [v3 accessibilityLabel];
  v5 = [(SKUIStarRatingViewAccessibility *)self safeValueForKey:@"_textLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end