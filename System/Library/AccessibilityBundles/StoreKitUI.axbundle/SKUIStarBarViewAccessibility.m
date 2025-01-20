@interface SKUIStarBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SKUIStarBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStarBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIStarBarView" hasInstanceVariable:@"_numberOfStars" withType:"q"];
  [v3 validateClass:@"SKUIStarBarView" hasInstanceVariable:@"_value" withType:"d"];
}

- (id)accessibilityLabel
{
  v2 = [(SKUIStarBarViewAccessibility *)self safeValueForKey:@"_numberOfStars"];
  [v2 floatValue];
  id v3 = UIAXStarRatingStringForRating();

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(SKUIStarBarViewAccessibility *)self safeValueForKey:@"_value"];
  [v2 floatValue];
  id v3 = AXFormatFloatWithPercentage();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end