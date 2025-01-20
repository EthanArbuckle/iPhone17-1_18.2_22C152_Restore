@interface PSSetupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (void)viewWillBecomeVisible:(void *)a3;
@end

@implementation PSSetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSetupController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillBecomeVisible:(void *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PSSetupControllerAccessibility;
  [(PSSetupControllerAccessibility *)&v3 viewWillBecomeVisible:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

@end