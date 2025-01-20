@interface SessionOverlayPresenterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)accessibilityAnnounceEvent:(id)a3;
+ (void)accessibilityAnnounceTimer:(double)a3 start:(BOOL)a4;
@end

@implementation SessionOverlayPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.AccessibilitySessionOverlayPresenter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionOverlayPresenter", @"accessibilityAnnounceEvent:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SeymourUI.AccessibilitySessionOverlayPresenter", @"accessibilityAnnounceTimer:start:", "v", "d", "B", 0);
}

+ (void)accessibilityAnnounceEvent:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionOverlayPresenterAccessibility;
  id v3 = a3;
  objc_msgSendSuper2(&v4, sel_accessibilityAnnounceEvent_, v3);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v3);
}

+ (void)accessibilityAnnounceTimer:(double)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___SessionOverlayPresenterAccessibility;
  objc_msgSendSuper2(&v13, sel_accessibilityAnnounceTimer_start_);
  if (v4)
  {
    uint64_t v6 = ((int)a3 % 60);
    v7 = NSString;
    if ((int)a3 < 60)
    {
      v8 = accessibilityLocalizedString(@"timer.start.short.format");
      objc_msgSend(v7, "stringWithFormat:", v8, v6, v12);
    }
    else
    {
      v8 = accessibilityLocalizedString(@"timer.start.long.format");
      objc_msgSend(v7, "stringWithFormat:", v8, (int)a3 / 0x3CuLL, v6);
    v10 = };

    UIAccessibilityNotifications v11 = *MEMORY[0x263F1CDC8];
  }
  else
  {
    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
    v10 = accessibilityLocalizedString(@"timer.end");
    UIAccessibilityNotifications v11 = v9;
  }
  UIAccessibilityPostNotification(v11, v10);
}

@end