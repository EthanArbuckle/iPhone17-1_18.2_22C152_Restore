@interface SBAlertItemsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)activateAlertItem:(id)a3;
- (void)deactivateAlertItem:(id)a3;
@end

@implementation SBAlertItemsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAlertItemsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateAlertItem:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBAlertItemsControllerAccessibility;
  [(SBAlertItemsControllerAccessibility *)&v3 activateAlertItem:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)deactivateAlertItem:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBAlertItemsControllerAccessibility;
  [(SBAlertItemsControllerAccessibility *)&v3 deactivateAlertItem:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end