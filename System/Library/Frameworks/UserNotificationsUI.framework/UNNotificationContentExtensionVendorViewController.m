@interface UNNotificationContentExtensionVendorViewController
@end

@implementation UNNotificationContentExtensionVendorViewController

void __106___UNNotificationContentExtensionVendorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) notificationExtensionVendorContext];
  [v1 _extensionWantsToUpdateMediaPlayPauseButton];
}

@end