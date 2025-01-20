@interface SKUIStarRatingControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axSetRating:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SKUIStarRatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStarRatingControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)accessibilityDecrement
{
  v3 = [(SKUIStarRatingControlAccessibility *)self safeValueForKey:@"userRating"];
  uint64_t v4 = [v3 integerValue];

  [(SKUIStarRatingControlAccessibility *)self _axSetRating:v4 - 1];
}

- (void)accessibilityIncrement
{
  v3 = [(SKUIStarRatingControlAccessibility *)self safeValueForKey:@"userRating"];
  uint64_t v4 = [v3 integerValue];

  [(SKUIStarRatingControlAccessibility *)self _axSetRating:v4 + 1];
}

- (void)_axSetRating:(int64_t)a3
{
}

void __51__SKUIStarRatingControlAccessibility__axSetRating___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserRating:*(void *)(a1 + 40)];
  objc_opt_class();
  v1 = __UIAccessibilityCastAsClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityLabel
{
  return accessibilitySKLocalizedString(@"starRating.label");
}

- (id)accessibilityValue
{
  v2 = [(SKUIStarRatingControlAccessibility *)self safeValueForKey:@"userRating"];
  [v2 integerValue];
  v3 = UIAXStarRatingStringForRating();

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2 = -1.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end