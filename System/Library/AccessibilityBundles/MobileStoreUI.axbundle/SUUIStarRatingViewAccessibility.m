@interface SUUIStarRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUUIStarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIStarRatingView" hasInstanceVariable:@"_ratingStarsImageView" withType:"UIImageView"];
  [v3 validateClass:@"SUUIStarRatingView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIStarRatingViewAccessibility *)self safeValueForKey:@"_ratingStarsImageView"];
  v4 = [v3 accessibilityLabel];
  v5 = [(SUUIStarRatingViewAccessibility *)self safeValueForKey:@"_textLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end