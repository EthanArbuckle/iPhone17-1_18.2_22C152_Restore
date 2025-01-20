@interface FaceIdViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityNotificationFeedbackGenerator;
- (id)_axNotificationFeedbackGenerator;
- (void)_setAXNotificationFeedbackGenerator:(id)a3;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
@end

@implementation FaceIdViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FaceIdViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_axNotificationFeedbackGenerator
{
}

- (void)_setAXNotificationFeedbackGenerator:(id)a3
{
}

- (id)_accessibilityNotificationFeedbackGenerator
{
  id v3 = [(FaceIdViewControllerAccessibility *)self _axNotificationFeedbackGenerator];
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1C810]);
    [(FaceIdViewControllerAccessibility *)self _setAXNotificationFeedbackGenerator:v3];
  }

  return v3;
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)FaceIdViewControllerAccessibility;
  [(FaceIdViewControllerAccessibility *)&v5 mechanismEvent:a3 value:a4 reply:a5];
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __64__FaceIdViewControllerAccessibility_mechanismEvent_value_reply___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 1:
    case 6:
    case 7:
      id v3 = [*(id *)(a1 + 32) _accessibilityNotificationFeedbackGenerator];
      [v3 notificationOccurred:2];
      goto LABEL_5;
    case 2:
      id v3 = [*(id *)(a1 + 32) _accessibilityNotificationFeedbackGenerator];
      [v3 notificationOccurred:0];
      v1 = accessibilityLocalizedString(@"pearl.authentication.success");
      UIAccessibilitySpeakAndDoNotBeInterrupted();

      goto LABEL_5;
    case 5:
      UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
      accessibilityLocalizedString(@"pearl.authentication.acquiring");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v2, v3);
LABEL_5:

      break;
    default:
      return;
  }
}

@end