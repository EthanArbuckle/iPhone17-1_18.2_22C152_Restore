@interface CSVoiceTriggerEnabledPolicyDarwin
- (CSVoiceTriggerEnabledPolicyDarwin)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyDarwin

- (void)_addVoiceTriggerEnabledConditions
{
}

- (void)_subscribeEventMonitors
{
  id v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyDarwin *)self subscribeEventMonitor:v3];
}

- (CSVoiceTriggerEnabledPolicyDarwin)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyDarwin;
  v2 = [(CSVoiceTriggerEnabledPolicyDarwin *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(CSVoiceTriggerEnabledPolicyDarwin *)v2 _addVoiceTriggerEnabledConditions];
    [(CSVoiceTriggerEnabledPolicyDarwin *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end