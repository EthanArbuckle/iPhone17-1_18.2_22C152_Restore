@interface UIPopoverControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5;
@end

@implementation UIPopoverControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPopoverController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  BOOL v6 = a5;
  v5.receiver = self;
  v5.super_class = (Class)UIPopoverControllerAccessibility;
  [(UIPopoverControllerAccessibility *)&v5 _dismissPopoverAnimated:a3 stateOnly:a4 notifyDelegate:a5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end