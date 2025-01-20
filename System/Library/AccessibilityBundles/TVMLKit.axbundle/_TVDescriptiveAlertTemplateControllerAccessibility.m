@interface _TVDescriptiveAlertTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation _TVDescriptiveAlertTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVDescriptiveAlertTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVDescriptiveAlertTemplateControllerAccessibility;
  [(_TVDescriptiveAlertTemplateControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
}

@end