@interface WFComposeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)collapseDrawerAsAuxiliaryViewPresenter;
- (void)expandDrawerAsAuxiliaryViewPresenter;
@end

@implementation WFComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFComposeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFComposeViewController", @"expandDrawerAsAuxiliaryViewPresenter", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFComposeViewController", @"collapseDrawerAsAuxiliaryViewPresenter", "v", 0);
}

- (void)expandDrawerAsAuxiliaryViewPresenter
{
  v2.receiver = self;
  v2.super_class = (Class)WFComposeViewControllerAccessibility;
  [(WFComposeViewControllerAccessibility *)&v2 expandDrawerAsAuxiliaryViewPresenter];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)collapseDrawerAsAuxiliaryViewPresenter
{
  v2.receiver = self;
  v2.super_class = (Class)WFComposeViewControllerAccessibility;
  [(WFComposeViewControllerAccessibility *)&v2 collapseDrawerAsAuxiliaryViewPresenter];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end