@interface SidebarMenuViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SidebarMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.SidebarMenuViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.SidebarMenuViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.SidebarMenuViewController", @"setEditing:animated:", "v", "B", "B", 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SidebarMenuViewControllerAccessibility;
  [(SidebarMenuViewControllerAccessibility *)&v7 setEditing:a3 animated:a4];
  if (v4)
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 editButtonItem];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
  }
}

@end