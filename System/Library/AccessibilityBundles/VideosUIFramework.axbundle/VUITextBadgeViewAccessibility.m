@interface VUITextBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VUITextBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUITextBadgeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(VUITextBadgeViewAccessibility *)self safeValueForKey:@"attributedTitle"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 string];

  v6 = AXAttributedStringForBetterPronuciation();

  return v6;
}

@end