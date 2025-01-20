@interface SKUIBarRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SKUIBarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIBarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIBarRatingViewAccessibility;
  v3 = [(SKUIBarRatingViewAccessibility *)&v7 accessibilityLabel];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIBarRatingViewAccessibility;
    v4 = [(SKUIBarRatingViewAccessibility *)&v6 accessibilityLabel];
  }
  else
  {
    v4 = accessibilitySKUILocalizedString(@"bar.rating");
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(SKUIBarRatingViewAccessibility *)self safeValueForKey:@"_ratingValue"];
  [v2 floatValue];
  float v4 = v3 * 11.0;

  v5 = NSString;
  objc_super v6 = accessibilitySKUILocalizedString(@"BAR_RATING_VALUE");
  objc_super v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, vcvtps_s32_f32(v4), 11);

  return v7;
}

@end