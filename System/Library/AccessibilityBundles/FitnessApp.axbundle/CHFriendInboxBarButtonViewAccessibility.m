@interface CHFriendInboxBarButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CHFriendInboxBarButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendInboxBarButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendInboxBarButtonView" hasInstanceVariable:@"_badgeView" withType:"CHFriendInboxBadgeView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendInboxBadgeView", @"badgeText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"sharing");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendInboxBarButtonViewAccessibility;
  return UIAccessibilityTraitButton | [(CHFriendInboxBarButtonViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  v2 = [(CHFriendInboxBarButtonViewAccessibility *)self safeValueForKey:@"_badgeView"];
  objc_super v3 = [v2 safeStringForKey:@"badgeText"];

  v4 = objc_opt_new();
  v5 = [v4 numberFromString:v3];
  int v6 = [v5 intValue];

  if (v6 < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = accessibilityLocalizedString(@"badge.format");
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v6);
  }

  return v8;
}

@end