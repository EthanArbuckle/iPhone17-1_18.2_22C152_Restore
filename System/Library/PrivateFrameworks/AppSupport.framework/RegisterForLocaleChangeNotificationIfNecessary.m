@interface RegisterForLocaleChangeNotificationIfNecessary
@end

@implementation RegisterForLocaleChangeNotificationIfNecessary

void ___RegisterForLocaleChangeNotificationIfNecessary_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_LocaleWillChangeCallback, @"kCFLocaleCurrentLocaleDidChangeNotification-2", 0, CFNotificationSuspensionBehaviorDrop);
}

@end