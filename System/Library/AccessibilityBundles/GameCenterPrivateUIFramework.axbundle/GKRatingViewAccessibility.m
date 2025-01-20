@interface GKRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation GKRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(GKRatingViewAccessibility *)self safeValueForKey:@"_value"];
  [v2 floatValue];
  v3 = UIAXStarRatingStringForRating();

  return v3;
}

@end