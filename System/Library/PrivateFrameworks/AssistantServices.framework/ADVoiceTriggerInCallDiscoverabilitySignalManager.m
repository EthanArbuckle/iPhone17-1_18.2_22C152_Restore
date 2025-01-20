@interface ADVoiceTriggerInCallDiscoverabilitySignalManager
- (ADVoiceTriggerInCallDiscoverabilitySignalManager)init;
- (void)voiceTriggerInCallAvailabilityChanged:(BOOL)a3;
@end

@implementation ADVoiceTriggerInCallDiscoverabilitySignalManager

- (void).cxx_destruct
{
}

- (void)voiceTriggerInCallAvailabilityChanged:(BOOL)a3
{
}

- (ADVoiceTriggerInCallDiscoverabilitySignalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADVoiceTriggerInCallDiscoverabilitySignalManager;
  v2 = [(ADVoiceTriggerInCallDiscoverabilitySignalManager *)&v6 init];
  if (v2)
  {
    +[AFTipKitDonator donateCallHangUpAvailabilityChanged:AFSupportsCallHangUp()];
    uint64_t v3 = +[ADVoiceTriggerInCallAvailabilityObserver sharedObserver];
    observer = v2->_observer;
    v2->_observer = (ADVoiceTriggerInCallAvailabilityObserver *)v3;

    [(ADVoiceTriggerInCallAvailabilityObserver *)v2->_observer addDelegate:v2];
  }
  return v2;
}

@end