@interface SBSwitchAppSystemGestureWorkspaceTransactionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)swipeTransactionFinishedAnimating:(id)a3;
@end

@implementation SBSwitchAppSystemGestureWorkspaceTransactionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitchAppSystemGestureWorkspaceTransaction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)swipeTransactionFinishedAnimating:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBSwitchAppSystemGestureWorkspaceTransactionAccessibility;
  [(SBSwitchAppSystemGestureWorkspaceTransactionAccessibility *)&v3 swipeTransactionFinishedAnimating:a3];
}

@end