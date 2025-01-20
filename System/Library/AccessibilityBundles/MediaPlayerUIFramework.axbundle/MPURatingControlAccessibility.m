@interface MPURatingControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityChangeValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MPURatingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPURatingControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPURatingControl", @"rating", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPURatingControl", @"setRating:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPURatingControl", @"delegate", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityChangeValue:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(MPURatingControlAccessibility *)self safeValueForKey:@"rating"];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = -0.2;
  if (v3) {
    double v7 = 0.2;
  }
  double v8 = v7 + v6;
  if (v8 >= 0.0 && v8 <= 1.0) {
    AXPerformSafeBlock();
  }
}

void __59__MPURatingControlAccessibility__accessibilityChangeValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRating:*(double *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 ratingDidChangeForRatingControl:*(void *)(a1 + 32)];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityValue
{
  id v2 = [(MPURatingControlAccessibility *)self safeValueForKey:@"rating"];
  [v2 doubleValue];
  double v4 = v3 * 5.0;

  v5.n128_f64[0] = v4;

  return (id)MEMORY[0x270F80920](v5);
}

- (id)accessibilityLabel
{
  return accessibilityMPUILocalizedString(@"starRating.label");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MPURatingControlAccessibility;
  return *MEMORY[0x263F1CED8] | [(MPURatingControlAccessibility *)&v3 accessibilityTraits];
}

@end