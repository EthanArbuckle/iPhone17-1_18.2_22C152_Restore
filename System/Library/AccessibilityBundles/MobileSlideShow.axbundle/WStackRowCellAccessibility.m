@interface WStackRowCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAlwaysReturnsChild;
- (void)_addLabel:(id)a3;
@end

@implementation WStackRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WStackRowCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 0;
}

- (void)_addLabel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WStackRowCellAccessibility;
  id v3 = a3;
  [(WStackRowCellAccessibility *)&v4 _addLabel:v3];
  objc_msgSend(v3, "setIsAccessibilityElement:", 0, v4.receiver, v4.super_class);
}

@end