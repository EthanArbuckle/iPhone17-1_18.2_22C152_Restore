@interface PBAPasscodeEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PBAPasscodeEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBAPasscodeEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PBAPasscodeEntryViewControllerAccessibility;
  [(PBAPasscodeEntryViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end