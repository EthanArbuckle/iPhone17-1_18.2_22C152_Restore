@interface EKUIDividedGridViewTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation EKUIDividedGridViewTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIDividedGridViewTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKUIDividedGridViewTableViewCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  if ([(EKUIDividedGridViewTableViewCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)EKUIDividedGridViewTableViewCellAccessibility;
  return [(EKUIDividedGridViewTableViewCellAccessibility *)&v4 canBecomeFocused];
}

@end