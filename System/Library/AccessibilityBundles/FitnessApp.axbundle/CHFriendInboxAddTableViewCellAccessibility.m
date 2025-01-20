@interface CHFriendInboxAddTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation CHFriendInboxAddTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendInboxAddTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendInboxAddTableViewCellAccessibility;
  return UIAccessibilityTraitButton | [(CHFriendInboxAddTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end