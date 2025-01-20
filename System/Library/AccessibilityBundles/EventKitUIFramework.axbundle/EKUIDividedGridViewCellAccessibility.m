@interface EKUIDividedGridViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
@end

@implementation EKUIDividedGridViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIDividedGridViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKUIDividedGridViewCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)canBecomeFocused
{
  if ([(EKUIDividedGridViewCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)EKUIDividedGridViewCellAccessibility;
  return [(EKUIDividedGridViewCellAccessibility *)&v4 canBecomeFocused];
}

@end