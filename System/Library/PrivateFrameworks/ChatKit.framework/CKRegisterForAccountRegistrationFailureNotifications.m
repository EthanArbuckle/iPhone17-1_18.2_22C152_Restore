@interface CKRegisterForAccountRegistrationFailureNotifications
@end

@implementation CKRegisterForAccountRegistrationFailureNotifications

void ___CKRegisterForAccountRegistrationFailureNotifications_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E4F6E4C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E4F43CA8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F43708];

  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, v1, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end