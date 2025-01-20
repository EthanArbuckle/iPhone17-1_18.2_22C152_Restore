@interface SBDashBoardSetupViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_infoButtonTapped:(id)a3;
- (void)_regulatoryInfoButtonTapped:(id)a3;
@end

@implementation SBDashBoardSetupViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDashBoardSetupViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardSetupViewController", @"_infoButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardSetupViewController", @"_regulatoryInfoButtonTapped:", "v", "@", 0);
}

- (void)_infoButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewControllerAccessibility;
  [(SBDashBoardSetupViewControllerAccessibility *)&v3 _infoButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_regulatoryInfoButtonTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewControllerAccessibility;
  [(SBDashBoardSetupViewControllerAccessibility *)&v3 _regulatoryInfoButtonTapped:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end