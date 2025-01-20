@interface IPCAURegistrar
@end

@implementation IPCAURegistrar

void __IPCAURegistrar_InitServer_block_invoke()
{
  FindIPCAURegistrationsFromAppBundles2();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F22318];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)ApplicationsChanged, v1, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end