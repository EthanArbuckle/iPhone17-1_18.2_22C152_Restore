@interface CHFriendDetailActionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CHFriendDetailActionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendDetailActionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(CHFriendDetailActionCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_1];
  v3 = [v2 accessibilityLabel];

  return v3;
}

BOOL __59__CHFriendDetailActionCellAccessibility_accessibilityLabel__block_invoke(id a1, UIView *a2)
{
  v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailActionCellAccessibility;
  return UIAccessibilityTraitButton | [(CHFriendDetailActionCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end