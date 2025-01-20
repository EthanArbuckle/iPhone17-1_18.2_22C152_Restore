@interface MUPlaceReviewPlatterViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation MUPlaceReviewPlatterViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceReviewPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(MUPlaceReviewPlatterViewInvertColorsAccessibility *)self safeUIViewForKey:@"_userAvatarImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceReviewPlatterViewInvertColorsAccessibility;
  [(MUPlaceReviewPlatterViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(MUPlaceReviewPlatterViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end