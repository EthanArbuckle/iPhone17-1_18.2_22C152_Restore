@interface HSPCDetectedViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCDetectedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HSPCDetectedViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSPCDetectedViewControllerAccessibility;
  [(HSPCDetectedViewControllerAccessibility *)&v6 viewWillAppear:a3];
  v3 = (void *)MEMORY[0x263F21660];
  v4 = accessibilityLocalizedString(@"camera.scan.discovered.accessory");
  v5 = [v3 stringWithString:v4];

  [v5 setAttribute:&unk_26F6D34D8 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

@end