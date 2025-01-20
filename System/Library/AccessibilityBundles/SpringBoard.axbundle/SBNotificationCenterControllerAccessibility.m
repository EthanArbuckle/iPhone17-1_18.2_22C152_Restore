@interface SBNotificationCenterControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityNotificationGestureInProgress;
- (void)_accessibilitySetNotificationGestureInProgress:(BOOL)a3;
- (void)_cleanupAfterTransition:(BOOL)a3;
- (void)_handleShowNotificationCenterGesture:(id)a3;
- (void)dismissAnimated:(BOOL)a3 fromCurrentState:(BOOL)a4 withStepper:(id)a5 completion:(id)a6;
@end

@implementation SBNotificationCenterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBNotificationCenterController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationCenterController", @"dismissAnimated: fromCurrentState: withStepper: completion:", "v", "B", "B", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationCenterController", @"_handleShowNotificationCenterGesture:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBNotificationCenterController", @"sharedInstance", "@", 0);
}

- (void)dismissAnimated:(BOOL)a3 fromCurrentState:(BOOL)a4 withStepper:(id)a5 completion:(id)a6
{
  v6.receiver = self;
  v6.super_class = (Class)SBNotificationCenterControllerAccessibility;
  [(SBNotificationCenterControllerAccessibility *)&v6 dismissAnimated:a3 fromCurrentState:a4 withStepper:a5 completion:a6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_cleanupAfterTransition:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBNotificationCenterControllerAccessibility;
  [(SBNotificationCenterControllerAccessibility *)&v3 _cleanupAfterTransition:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (BOOL)_accessibilityNotificationGestureInProgress
{
  return MEMORY[0x270F09620](self, &__SBNotificationCenterControllerAccessibility___accessibilityNotificationGestureInProgress);
}

- (void)_accessibilitySetNotificationGestureInProgress:(BOOL)a3
{
}

- (void)_handleShowNotificationCenterGesture:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBNotificationCenterControllerAccessibility;
  id v4 = a3;
  [(SBNotificationCenterControllerAccessibility *)&v6 _handleShowNotificationCenterGesture:v4];
  uint64_t v5 = objc_msgSend(v4, "state", v6.receiver, v6.super_class);

  [(SBNotificationCenterControllerAccessibility *)self _accessibilitySetNotificationGestureInProgress:v5 == 1];
}

@end