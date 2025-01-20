@interface MKRAPIsAvailable
@end

@implementation MKRAPIsAvailable

void ___MKRAPIsAvailable_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v1 = (void *)qword_1EB315F58;
  qword_1EB315F58 = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, &_MergedGlobals_154, (CFNotificationCallback)_MKRAPiCloudAccountChanged, @"ACDAccountStoreDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end