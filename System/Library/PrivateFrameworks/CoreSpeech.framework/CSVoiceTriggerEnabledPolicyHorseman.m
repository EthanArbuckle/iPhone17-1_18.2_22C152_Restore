@interface CSVoiceTriggerEnabledPolicyHorseman
- (CSVoiceTriggerEnabledPolicyHorseman)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyHorseman

- (void)_addVoiceTriggerEnabledConditions
{
  [(CSVoiceTriggerEnabledPolicyHorseman *)self addConditions:&stru_100253498];
  [(CSVoiceTriggerEnabledPolicyHorseman *)self addConditions:&stru_1002534B8];
  [(CSVoiceTriggerEnabledPolicyHorseman *)self addConditions:&stru_1002534D8];
}

- (void)_subscribeEventMonitors
{
  v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyHorseman *)self subscribeEventMonitor:v3];

  id v4 = +[CSHomePodSettingsMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyHorseman *)self subscribeEventMonitor:v4];
}

- (CSVoiceTriggerEnabledPolicyHorseman)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyHorseman;
  v2 = [(CSVoiceTriggerEnabledPolicyHorseman *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSVoiceTriggerEnabledPolicyHorseman *)v2 _addVoiceTriggerEnabledConditions];
    [(CSVoiceTriggerEnabledPolicyHorseman *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end