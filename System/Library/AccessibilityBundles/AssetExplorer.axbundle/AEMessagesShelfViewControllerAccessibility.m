@interface AEMessagesShelfViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_toggleIris:(id)a3;
@end

@implementation AEMessagesShelfViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AEMessagesShelfViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_toggleIris:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AEMessagesShelfViewControllerAccessibility;
  id v3 = a3;
  [(AEMessagesShelfViewControllerAccessibility *)&v4 _toggleIris:v3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
}

@end