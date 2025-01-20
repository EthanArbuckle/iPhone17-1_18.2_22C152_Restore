@interface SBNotificationBannerDestinationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dismissPresentableCompleted:(id)a3;
- (void)notificationViewControllerWillBeginUserInteraction:(id)a3;
@end

@implementation SBNotificationBannerDestinationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBNotificationBannerDestination";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"_cancelReplaceTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"_cancelDismissTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"_dismissPresentableCompleted:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"notificationViewControllerWillBeginUserInteraction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNotificationBannerDestination", @"notificationViewControllerDidEndUserInteraction:", "v", "@", 0);
}

- (void)_dismissPresentableCompleted:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBNotificationBannerDestinationAccessibility;
  [(SBNotificationBannerDestinationAccessibility *)&v3 _dismissPresentableCompleted:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __77__SBNotificationBannerDestinationAccessibility__dismissPresentableCompleted___block_invoke()
{
  id v0 = [MEMORY[0x263F22968] server];
  [v0 didPotentiallyDismissNonExclusiveSystemUI];
}

- (void)notificationViewControllerWillBeginUserInteraction:(id)a3
{
  id v4 = a3;
  if (([v4 safeBoolForKey:@"_axHasFinishedAnnouncement"] & 1) != 0
    || !UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)SBNotificationBannerDestinationAccessibility;
    [(SBNotificationBannerDestinationAccessibility *)&v5 notificationViewControllerWillBeginUserInteraction:v4];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __99__SBNotificationBannerDestinationAccessibility_notificationViewControllerWillBeginUserInteraction___block_invoke;
    v9 = &unk_265153D50;
    v10 = self;
    AXPerformSafeBlock();
  }
}

uint64_t __99__SBNotificationBannerDestinationAccessibility_notificationViewControllerWillBeginUserInteraction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDismissTimer];
}

@end