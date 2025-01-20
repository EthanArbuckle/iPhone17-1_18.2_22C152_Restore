@interface SBWorkspaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBWorkspaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBWorkspace";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)transactionDidComplete:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceAccessibility;
  [(SBWorkspaceAccessibility *)&v3 transactionDidComplete:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], (id)*MEMORY[0x263F21A78]);
}

@end