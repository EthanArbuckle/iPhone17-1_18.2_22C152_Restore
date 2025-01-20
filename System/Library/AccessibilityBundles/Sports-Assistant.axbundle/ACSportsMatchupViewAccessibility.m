@interface ACSportsMatchupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsMatchupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsMatchupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = [(ACSportsMatchupViewAccessibility *)self safeValueForKey:@"_scoreboardView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end