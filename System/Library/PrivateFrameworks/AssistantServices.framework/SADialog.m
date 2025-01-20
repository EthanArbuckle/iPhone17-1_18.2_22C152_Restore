@interface SADialog
- (BOOL)_adui_shouldNotifyOthersOfArrival;
- (void)_adui_notifyOthersOfArrival;
@end

@implementation SADialog

- (void)_adui_notifyOthersOfArrival
{
  id v3 = +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher];
  [v3 publishObjectHasArrived:self];
}

- (BOOL)_adui_shouldNotifyOthersOfArrival
{
  return +[ADUserNotificationAnnouncementSpeakingStatePublisher supportsPublishingArrivalForAceObject:self];
}

@end