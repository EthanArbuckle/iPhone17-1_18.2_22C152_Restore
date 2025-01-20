@interface MKStarRatingViewAccessibility_iOS
+ (Class)safeCategoryBaseClass;
+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MKStarRatingViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return @"MKStarRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKStarRatingView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKStarRatingView", @"rating", "d", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MKStarRatingView", @"ratingAsAttributedString: baseFont: style:theme:", "d", "@", "q", "@", 0);
}

+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MKStarRatingViewAccessibility_iOS;
  v6 = objc_msgSendSuper2(&v9, sel_ratingAsAttributedString_baseFont_style_theme_, a4, a5, a6);
  v7 = UIAXStarRatingStringForRating();
  [v6 setAccessibilityLabel:v7];

  return v6;
}

- (id)accessibilityLabel
{
  [(MKStarRatingViewAccessibility_iOS *)self safeFloatForKey:@"rating"];

  return (id)UIAXStarRatingStringForRating();
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

@end