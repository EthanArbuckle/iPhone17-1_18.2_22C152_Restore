@interface PKLinkedAppUserRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKLinkedAppUserRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKLinkedAppUserRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKLinkedAppUserRatingViewAccessibility *)self safeValueForKey:@"userRating"];
  [v2 floatValue];
  v3 = UIAXStarRatingStringForRating();

  return v3;
}

@end