@interface VUITextBadgeAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VUITextBadgeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUITextBadge";
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
  objc_opt_class();
  v3 = [(VUITextBadgeAccessibility *)self safeValueForKey:@"attributedTitle"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 string];

  v6 = AXAttributedStringForBetterPronuciation();

  return v6;
}

@end