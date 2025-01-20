@interface SessionRingsPresenterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)onAllRingsCompletion;
+ (void)onExerciseRingCompletion;
+ (void)onMoveRingCompletion;
+ (void)onStandRingCompletion;
@end

@implementation SessionRingsPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.AccessibilitySessionRingsPresenter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionRingsPresenter", @"onMoveRingCompletion", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionRingsPresenter", @"onExerciseRingCompletion", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionRingsPresenter", @"onStandRingCompletion", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionRingsPresenter", @"onAllRingsCompletion", "v", 0);
}

+ (void)onMoveRingCompletion
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onMoveRingCompletion);
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = accessibilityLocalizedString(@"rings.closed.move");
  UIAccessibilityPostNotification(v2, v3);
}

+ (void)onExerciseRingCompletion
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onExerciseRingCompletion);
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = accessibilityLocalizedString(@"rings.closed.exercise");
  UIAccessibilityPostNotification(v2, v3);
}

+ (void)onStandRingCompletion
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onStandRingCompletion);
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = accessibilityLocalizedString(@"rings.closed.stand");
  UIAccessibilityPostNotification(v2, v3);
}

+ (void)onAllRingsCompletion
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onAllRingsCompletion);
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = accessibilityLocalizedString(@"rings.closed.all");
  UIAccessibilityPostNotification(v2, v3);
}

@end