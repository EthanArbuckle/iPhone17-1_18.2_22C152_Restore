@interface CSiOSHostStudioDisplaySelfTriggerEnabledPolicy
- (CSiOSHostStudioDisplaySelfTriggerEnabledPolicy)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSiOSHostStudioDisplaySelfTriggerEnabledPolicy

- (void)_addVoiceTriggerEnabledConditions
{
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self addConditions:&stru_100251200];
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self addConditions:&stru_100251220];
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self addConditions:&stru_100251240];
}

- (void)_subscribeEventMonitors
{
  v3 = +[CSSiriEnabledMonitor sharedInstance];
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self subscribeEventMonitor:v3];

  v4 = +[CSSystemShellStartMonitorFactory defaultShellStartMonitor];
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self subscribeEventMonitor:v4];

  id v5 = +[CSFirstUnlockMonitor sharedInstance];
  [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)self subscribeEventMonitor:v5];
}

- (CSiOSHostStudioDisplaySelfTriggerEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSiOSHostStudioDisplaySelfTriggerEnabledPolicy;
  v2 = [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)v2 _addVoiceTriggerEnabledConditions];
    [(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end