@interface SKUIReviewsHistogramViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SKUIReviewsHistogramViewAccessibility)initWithClientContext:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setHistogramValues:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(double)a3;
@end

@implementation SKUIReviewsHistogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIReviewsHistogramView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewsHistogramView", @"initWithClientContext:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewsHistogramView", @"setHistogramValues:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIReviewsHistogramView", @"setUserRating:", "v", "d", 0);
  [v3 validateClass:@"SKUIReviewsHistogramView" hasInstanceVariable:@"_histogramImageView" withType:"UIImageView"];
  [v3 validateClass:@"SKUIReviewsHistogramView" hasInstanceVariable:@"_userRatingStarsView" withType:"UIImageView"];
  [v3 validateClass:@"SKUIReviewsHistogramView" hasInstanceVariable:@"_histogramValues" withType:"NSArray"];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIReviewsHistogramViewAccessibility;
  [(SKUIReviewsHistogramViewAccessibility *)&v5 setTitle:a3];
  v4 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)setUserRating:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIReviewsHistogramViewAccessibility;
  [(SKUIReviewsHistogramViewAccessibility *)&v8 setUserRating:a3];
  v4 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_userRatingStarsView"];
  objc_super v5 = [v4 safeValueForKey:@"image"];
  v6 = [v5 accessibilityLabel];
  [v4 setAccessibilityValue:v6];

  v7 = accessibilitySKLocalizedString(@"starRating.label");
  [v4 setAccessibilityLabel:v7];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIReviewsHistogramViewAccessibility;
  [(SKUIReviewsHistogramViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_histogramImageView"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilitySKUILocalizedString(@"histogram.star.rating");
  [v3 setAccessibilityLabel:v4];

  objc_super v5 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_userRatingStarsView"];
  [v5 setIsAccessibilityElement:1];
}

- (void)setHistogramValues:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)SKUIReviewsHistogramViewAccessibility;
  [(SKUIReviewsHistogramViewAccessibility *)&v20 setHistogramValues:a3];
  v15 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_histogramImageView"];
  v4 = [(SKUIReviewsHistogramViewAccessibility *)self safeValueForKey:@"_histogramValues"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    v9 = &stru_26F441D68;
    do
    {
      uint64_t v10 = 0;
      v11 = v9;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * v10++);
        v13 = UIAXStarRatingStringForRating();
        [v12 floatValue];
        v14 = AXFormatFloatWithPercentage();
        __UIAXStringForVariables();
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v11 = v9;
      }
      while (v6 != v10);
      uint64_t v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16, v13, v14, @"__AXStringForVariablesSentinel");
      v7 += v10;
    }
    while (v6);
  }
  else
  {
    v9 = &stru_26F441D68;
  }
  [v15 setAccessibilityValue:v9];
}

- (SKUIReviewsHistogramViewAccessibility)initWithClientContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIReviewsHistogramViewAccessibility;
  id v3 = [(SKUIReviewsHistogramViewAccessibility *)&v5 initWithClientContext:a3];
  [(SKUIReviewsHistogramViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end