@interface CSAdBlockerEnabledPolicyHomePod
- (void)_addContinuousAudioFingerprintEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSAdBlockerEnabledPolicyHomePod

- (void)_addContinuousAudioFingerprintEnabledConditions
{
  v3.receiver = self;
  v3.super_class = (Class)CSAdBlockerEnabledPolicyHomePod;
  [(CSAdBlockerEnabledPolicy *)&v3 _addContinuousAudioFingerprintEnabledConditions];
  [(CSAdBlockerEnabledPolicyHomePod *)self addConditions:&stru_10024E758];
}

- (void)_subscribeEventMonitors
{
  v4.receiver = self;
  v4.super_class = (Class)CSAdBlockerEnabledPolicyHomePod;
  [(CSAdBlockerEnabledPolicy *)&v4 _subscribeEventMonitors];
  objc_super v3 = +[CSHomePodSettingsMonitor sharedInstance];
  [(CSAdBlockerEnabledPolicyHomePod *)self subscribeEventMonitor:v3];
}

@end