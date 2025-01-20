@interface HMDCompositeSettingsControllerManagerOnboardingLogEvent
- (HMDCompositeSettingsControllerManagerOnboardingLogEvent)initWithError:(id)a3 siriEndpointCertificationReason:(int64_t)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)siriEndpointCertificationReason;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCompositeSettingsControllerManagerOnboardingLogEvent

- (int64_t)siriEndpointCertificationReason
{
  return self->_siriEndpointCertificationReason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"siriEndpointCertificationReason";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCompositeSettingsControllerManagerOnboardingLogEvent siriEndpointCertificationReason](self, "siriEndpointCertificationReason"));
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.CompositeSettings.ControllerManager.OnboardingLogEvent";
}

- (HMDCompositeSettingsControllerManagerOnboardingLogEvent)initWithError:(id)a3 siriEndpointCertificationReason:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerManagerOnboardingLogEvent;
  v7 = [(HMMLogEvent *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v10.receiver = v7;
    v10.super_class = (Class)HMDCompositeSettingsControllerManagerOnboardingLogEvent;
    [(HMMLogEvent *)&v10 setError:v6];
    v8->_siriEndpointCertificationReason = a4;
  }

  return v8;
}

@end