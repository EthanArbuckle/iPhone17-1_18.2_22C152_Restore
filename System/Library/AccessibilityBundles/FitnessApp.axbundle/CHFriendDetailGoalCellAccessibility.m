@interface CHFriendDetailGoalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CHFriendDetailGoalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendDetailGoalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendDetailGoalCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"CHFriendDetailGoalCell" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CHFriendDetailGoalCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CHFriendDetailGoalCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end