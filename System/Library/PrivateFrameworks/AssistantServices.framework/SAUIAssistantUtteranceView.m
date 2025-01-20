@interface SAUIAssistantUtteranceView
- (BOOL)_adui_should_adui_notifyOthersOfArrival;
- (BOOL)ad_shouldUseExtendedFlowTimeout;
- (void)_adui_notifyOthersOfArrival;
@end

@implementation SAUIAssistantUtteranceView

- (void)_adui_notifyOthersOfArrival
{
  id v3 = +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher];
  [v3 publishObjectHasArrived:self];
}

- (BOOL)_adui_should_adui_notifyOthersOfArrival
{
  return +[ADUserNotificationAnnouncementSpeakingStatePublisher supportsPublishingArrivalForAceObject:self];
}

- (BOOL)ad_shouldUseExtendedFlowTimeout
{
  id v3 = [(SAUIAssistantUtteranceView *)self speakableText];
  if (v3)
  {
    v4 = [(SAUIAssistantUtteranceView *)self speakableText];
    unsigned int v5 = [v4 isEqualToString:&stru_10050F7D8] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end