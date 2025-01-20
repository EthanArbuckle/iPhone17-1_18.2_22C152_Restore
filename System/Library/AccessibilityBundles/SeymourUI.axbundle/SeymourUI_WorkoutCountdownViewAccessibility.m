@interface SeymourUI_WorkoutCountdownViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityUpdateCountdownToStep:(int64_t)a3;
@end

@implementation SeymourUI_WorkoutCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutCountdownView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)accessibilityUpdateCountdownToStep:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SeymourUI_WorkoutCountdownViewAccessibility;
  -[SeymourUI_WorkoutCountdownViewAccessibility accessibilityUpdateCountdownToStep:](&v7, sel_accessibilityUpdateCountdownToStep_);
  if ((unint64_t)(a3 - 1) > 2)
  {
    if (a3) {
      return;
    }
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    v4 = accessibilityLocalizedString(@"ready");
    UIAccessibilityNotifications v5 = v6;
  }
  else
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
  }
  UIAccessibilityPostNotification(v5, v4);
}

@end