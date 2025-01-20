@interface SBRestartManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)rebootWithContext:(id)a3;
@end

@implementation SBRestartManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRestartManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)rebootWithContext:(id)a3
{
  id v4 = a3;
  v5 = accessibilityLocalizedString(@"shutting.down.format");
  if (v5)
  {
    id v6 = [NSString alloc];
    v7 = [MEMORY[0x263F1C5C0] currentDevice];
    v8 = [v7 localizedModel];
    v9 = objc_msgSend(v6, "initWithFormat:", v5, v8);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBRestartManagerAccessibility;
  [(SBRestartManagerAccessibility *)&v10 rebootWithContext:v4];
}

@end