@interface NCNotificationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAppearanceAnnouncementHandledByEnclosingEntity;
- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation;
- (BOOL)_axHasFinishedAnnouncement;
- (BOOL)_axHasSentAnnouncement;
- (id)_axLongLookView;
- (void)_axAnnounceNotification;
- (void)_axHandleAnnouncementFinished;
- (void)_axNotifyDidEndUserInteraction;
- (void)_axNotifyWillBeginUserInteraction:(BOOL)a3;
- (void)_axSetHasFinishedAnnouncement:(BOOL)a3;
- (void)_axSetHasSentAnnouncement:(BOOL)a3;
- (void)_logNotificationMessage:(id)a3;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation NCNotificationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLPlatterView"];
  [v3 validateClass:@"PLPlatterHeaderContentView"];
  [v3 validateClass:@"NCNotificationShortLookView"];
  [v3 validateClass:@"NCNotificationLongLookView"];
  [v3 validateClass:@"NCNotificationLongLookViewController"];
  [v3 validateClass:@"NCNotificationLongLookView" hasInstanceVariable:@"_headerContentView" withType:"PLPlatterHeaderContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"notificationRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCDimmableView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookView", @"_notificationContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_notifyObserversWithBlock:", "v", "@?", 0);
  [v3 validateClass:@"NCNotificationStructuredListViewController"];
  [v3 validateClass:@"NCNotificationViewController" isKindOfClass:@"UIViewController"];
  [v3 validateProtocol:@"NCNotificationViewControllerObserving" hasOptionalInstanceMethod:@"notificationViewControllerWillBeginUserInteraction:"];
  [v3 validateProtocol:@"NCNotificationViewControllerObserving" hasOptionalInstanceMethod:@"notificationViewControllerDidEndUserInteraction:"];
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"notificationDispatcher", "@", 0);
    [v3 validateClass:@"SBNCNotificationDispatcher" hasInstanceVariable:@"_dispatcher" withType:"NCNotificationDispatcher"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCAlertingController", @"screenController", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCScreenController", @"canTurnOnScreenForNotificationRequest:", "B", "@", 0);
  }
}

- (BOOL)_accessibilityAppearanceAnnouncementHandledByEnclosingEntity
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  v4 = [v3 _accessibilityFindAncestor:&__block_literal_global_10 startWithSelf:0];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __105__NCNotificationViewControllerAccessibility__accessibilityAppearanceAnnouncementHandledByEnclosingEntity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
    MEMORY[0x2456680B0](@"NCNotificationStructuredListViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  id v2 = [(NCNotificationViewControllerAccessibility *)self _axLongLookView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationViewControllerAccessibility;
  [(NCNotificationViewControllerAccessibility *)&v5 viewDidAppear:a3];
  v4 = [(NCNotificationViewControllerAccessibility *)self _axLongLookView];
  if (!v4)
  {
    if (_AXSAutomationEnabled()) {
      UIAccessibilityPostNotification(0x3EEu, 0);
    }
    MEMORY[0x2456681A0](*MEMORY[0x263F1CE68]);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    if (![(NCNotificationViewControllerAccessibility *)self _accessibilityAppearanceAnnouncementHandledByEnclosingEntity])AXPerformBlockOnMainThreadAfterDelay(); {
  }
    }
}

uint64_t __59__NCNotificationViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _axHasSentAnnouncement];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) _axSetHasSentAnnouncement:1];
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _axAnnounceNotification];
  }
  return result;
}

- (BOOL)_axHasSentAnnouncement
{
  return MEMORY[0x270F0A438](self, &__NCNotificationViewControllerAccessibility___axHasSentAnnouncement);
}

- (void)_axSetHasSentAnnouncement:(BOOL)a3
{
}

- (BOOL)_axHasFinishedAnnouncement
{
  return MEMORY[0x270F0A438](self, &__NCNotificationViewControllerAccessibility___axHasFinishedAnnouncement);
}

- (void)_axSetHasFinishedAnnouncement:(BOOL)a3
{
}

- (void)_axAnnounceNotification
{
  BOOL v3 = [(NCNotificationViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = __UIAccessibilitySafeClass();

  objc_super v5 = [v4 safeValueForKey:@"contentView"];
  [(NCNotificationViewControllerAccessibility *)self _logNotificationMessage:@"Notification tried to appear"];
  if ([v5 _accessibilityViewIsVisible])
  {
    MEMORY[0x2456680B0](@"NCNotificationShortLookView");
    if (objc_opt_isKindOfClass())
    {
      v6 = (void *)MEMORY[0x263F21660];
      v7 = [v5 accessibilityLabel];
      v8 = [v6 axAttributedStringWithString:v7];

      uint64_t v9 = MEMORY[0x263EFFA88];
      [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F218C8]];
      [v8 setAttribute:v9 forKey:*MEMORY[0x263F21828]];
      v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 addObserver:self selector:sel__axHandleAnnouncementFinished name:*MEMORY[0x263F1CDB0] object:0];

      [(NCNotificationViewControllerAccessibility *)self _logNotificationMessage:@"Notification posting announcement to VO"];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);
      if (UIAccessibilityIsVoiceOverRunning()) {
        [(NCNotificationViewControllerAccessibility *)self _axNotifyWillBeginUserInteraction:0];
      }
    }
  }
}

- (void)_axHandleAnnouncementFinished
{
  [(NCNotificationViewControllerAccessibility *)self _logNotificationMessage:@"Notification announcement finished"];
  [(NCNotificationViewControllerAccessibility *)self _axSetHasFinishedAnnouncement:1];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDB0] object:0];

  [(NCNotificationViewControllerAccessibility *)self _axNotifyWillBeginUserInteraction:0];

  [(NCNotificationViewControllerAccessibility *)self _axNotifyDidEndUserInteraction];
}

- (void)_axNotifyWillBeginUserInteraction:(BOOL)a3
{
  if (a3)
  {
    [(NCNotificationViewControllerAccessibility *)self _logNotificationMessage:@"Notification notifying did begin interaction for focus"];
    [(NCNotificationViewControllerAccessibility *)self _axSetHasFinishedAnnouncement:1];
  }
  AXPerformSafeBlock();
}

uint64_t __79__NCNotificationViewControllerAccessibility__axNotifyWillBeginUserInteraction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversWithBlock:&__block_literal_global_378];
}

void __79__NCNotificationViewControllerAccessibility__axNotifyWillBeginUserInteraction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v5 _logNotificationMessage:@"Notification notifying did begin interaction"];
    [v4 notificationViewControllerWillBeginUserInteraction:v5];
  }
}

- (void)_axNotifyDidEndUserInteraction
{
}

uint64_t __75__NCNotificationViewControllerAccessibility__axNotifyDidEndUserInteraction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversWithBlock:&__block_literal_global_385];
}

void __75__NCNotificationViewControllerAccessibility__axNotifyDidEndUserInteraction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v5 _logNotificationMessage:@"Notification notifying did end interaction"];
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

- (void)_logNotificationMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  buf[0] = 0;
  id v5 = [(NCNotificationViewControllerAccessibility *)self safeValueForKey:@"view"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [v6 safeValueForKey:@"contentView"];
  v8 = [MEMORY[0x263F22990] sharedInstance];
  char v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    v10 = [MEMORY[0x263F22990] identifier];
    v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v14;
        _os_log_impl(&dword_24268C000, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(NCNotificationViewControllerAccessibility *)self _axLongLookView];
  BOOL v8 = v7 == 0;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke;
  v12[3] = &unk_2651619E0;
  BOOL v14 = v8;
  id v13 = v6;
  id v9 = v6;
  v10 = (void *)MEMORY[0x245668480](v12);
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationViewControllerAccessibility;
  [(NCNotificationViewControllerAccessibility *)&v11 dismissViewControllerWithTransition:v4 completion:v10];
}

uint64_t __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  AXPerformBlockOnMainThreadAfterDelay();
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __92__NCNotificationViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (id)_axLongLookView
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  BOOL v3 = [v2 view];

  MEMORY[0x2456680B0](@"NCNotificationLongLookViewController");
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end