@interface SKStarRatingControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SKStarRatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKStarRatingControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
  v2 = [(SKStarRatingControlAccessibility *)self safeValueForKey:@"value"];
  [v2 floatValue];
  float v4 = v3;

  if (v4 < 1.0) {
    AXPerformSafeBlock();
  }
}

uint64_t __58__SKStarRatingControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(a1 + 32) setValue:v1];
}

- (void)accessibilityDecrement
{
  v2 = [(SKStarRatingControlAccessibility *)self safeValueForKey:@"value"];
  [v2 floatValue];
  float v4 = v3;

  if (v4 > 0.0) {
    AXPerformSafeBlock();
  }
}

uint64_t __58__SKStarRatingControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(a1 + 32) setValue:v1];
}

- (id)accessibilityValue
{
  v2 = [(SKStarRatingControlAccessibility *)self safeValueForKey:@"value"];
  [v2 floatValue];
  double v4 = (float)(v3 * 5.0);

  v5.n128_f64[0] = v4;

  return (id)MEMORY[0x270F80920](v5);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"starRating.label");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SKStarRatingControlAccessibility;
  return *MEMORY[0x263F1CED8] | [(SKStarRatingControlAccessibility *)&v3 accessibilityTraits];
}

@end