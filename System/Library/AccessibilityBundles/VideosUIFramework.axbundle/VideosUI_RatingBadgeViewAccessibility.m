@interface VideosUI_RatingBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VideosUI_RatingBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.RatingBadgeView";
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
  [(VideosUI_RatingBadgeViewAccessibility *)self safeSwiftCGFloatForKey:@"rating"];
  uint64_t v3 = v2;
  v4 = NSString;
  v5 = accessibilityLocalizedString(@"rating.stars");
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

  return v6;
}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  if ([(VideosUI_RatingBadgeViewAccessibility *)self _accessibilityIsFocusForFocusEverywhereRunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)VideosUI_RatingBadgeViewAccessibility;
  return [(VideosUI_RatingBadgeViewAccessibility *)&v4 canBecomeFocused];
}

@end