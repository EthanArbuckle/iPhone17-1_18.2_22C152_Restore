@interface SBAppSwitcherPeopleContactViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
@end

@implementation SBAppSwitcherPeopleContactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPeopleContactView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"people.picker.hint");
  v5 = [(SBAppSwitcherPeopleContactViewAccessibility *)self accessibilityLabel];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

@end