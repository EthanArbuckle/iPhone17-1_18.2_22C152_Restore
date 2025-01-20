@interface IdentityProofingTCViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityProofingTCViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVUI.IdentityProofingTCViewController";
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
  v3.receiver = self;
  v3.super_class = (Class)IdentityProofingTCViewControllerAccessibility;
  [(IdentityProofingTCViewControllerAccessibility *)&v3 viewWillAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end