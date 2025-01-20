@interface ACSportsTeamHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsTeamHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsTeamHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(ACSportsTeamHeaderViewAccessibility *)self safeValueForKey:@"_headerLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(ACSportsTeamHeaderViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

@end