@interface AAUIBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AAUIBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIBadgeView";
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
  v3 = [(AAUIBadgeViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(AAUIBadgeViewAccessibility *)self isAccessibilityUserDefinedElement];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = [(AAUIBadgeViewAccessibility *)self safeValueForKey:@"_badgeDelegate"];
  v4 = [v3 safeValueForKey:@"_formatter"];
  unsigned __int8 v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 localizedAttributedTitleString];
  v7 = [v6 string];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  if ([v8 length])
  {
    v9 = accessibilityLocalizedString(@"achievement.badge.format");
    v10 = AXCFormattedString();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AAUIBadgeViewAccessibility;
    v10 = [(AAUIBadgeViewAccessibility *)&v12 accessibilityLabel];
  }

  return v10;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIBadgeViewAccessibility;
  return UIAccessibilityTraitImage | [(AAUIBadgeViewAccessibility *)&v3 accessibilityTraits];
}

@end