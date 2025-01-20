@interface _TVAlertTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation _TVAlertTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVAlertTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVAlertTemplateControllerAccessibility;
  [(_TVAlertTemplateControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
}

@end