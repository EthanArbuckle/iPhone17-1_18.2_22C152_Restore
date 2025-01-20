@interface HUQuickControlSingleControlViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3;
- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4;
@end

@implementation HUQuickControlSingleControlViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSingleControlViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"interactionCoordinator:showAuxiliaryView:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"hideAuxiliaryViewForInteractionCoordinator:", "v", "@", 0);
}

- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewControllerAccessibility;
  [(HUQuickControlSingleControlViewControllerAccessibility *)&v5 interactionCoordinator:a3 showAuxiliaryView:a4];
  if (objc_opt_respondsToSelector()) {
    [(HUQuickControlSingleControlViewControllerAccessibility *)self _accessibilityMoveToActiveControl];
  }
}

- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewControllerAccessibility;
  [(HUQuickControlSingleControlViewControllerAccessibility *)&v4 hideAuxiliaryViewForInteractionCoordinator:a3];
  if (objc_opt_respondsToSelector()) {
    [(HUQuickControlSingleControlViewControllerAccessibility *)self _accessibilityMoveToActiveControl];
  }
}

@end