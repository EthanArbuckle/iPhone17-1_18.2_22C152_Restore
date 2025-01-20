@interface CaptureSelfieViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axHandleAnnouncementMachine:(id)a3 polite:(BOOL)a4 moveToView:(BOOL)a5;
- (void)_axHandleNonInterruptableCoachingAnnouncement;
- (void)setCoachingPromptText:(id)a3;
@end

@implementation CaptureSelfieViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVRGBLiveness.CaptureSelfieView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setCoachingPromptText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CaptureSelfieViewAccessibility;
  [(CaptureSelfieViewAccessibility *)&v4 setCoachingPromptText:a3];
  [(CaptureSelfieViewAccessibility *)self _axHandleNonInterruptableCoachingAnnouncement];
}

- (void)_axHandleNonInterruptableCoachingAnnouncement
{
  id v3 = [(CaptureSelfieViewAccessibility *)self safeValueForKey:@"coachingPrompt"];
  [(CaptureSelfieViewAccessibility *)self _axHandleAnnouncementMachine:v3 polite:0 moveToView:0];
}

- (void)_axHandleAnnouncementMachine:(id)a3 polite:(BOOL)a4 moveToView:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 _accessibilityViewIsVisible])
  {
    v8 = [v7 accessibilityLabel];
    if (([v8 isEqualToString:_axHandleAnnouncementMachine_polite_moveToView__LastPrompt] & 1) == 0
      && [v8 length])
    {
      id v9 = (id)*MEMORY[0x263F1CE40];
      if (v6)
      {
        id v10 = (id)*MEMORY[0x263F1CE48];

        id v9 = v10;
      }
      id v11 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v15 = *MEMORY[0x263F1CE80];
      v16[0] = v9;
      v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v13 = (void *)[v11 initWithString:v8 attributes:v12];

      v14 = (UIAccessibilityNotifications *)MEMORY[0x263F1CE18];
      if (!v5) {
        v14 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
      }
      UIAccessibilityPostNotification(*v14, v13);
      objc_storeStrong((id *)&_axHandleAnnouncementMachine_polite_moveToView__LastPrompt, v8);
    }
  }
}

@end