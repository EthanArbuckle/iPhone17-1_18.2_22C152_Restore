@interface CSVoiceTriggerEnabledPolicyAOP
- (CSVoiceTriggerEnabledPolicyAOP)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyAOP

- (void)_addVoiceTriggerEnabledConditions
{
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_1002512B0];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_1002512D0];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_1002512F0];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_100251310];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_100251330];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_100251350];
  [(CSVoiceTriggerEnabledPolicyAOP *)self addConditions:&stru_100251370];
}

- (void)_subscribeEventMonitors
{
  v3 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v3];

  v4 = +[CSSiriEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v4];

  v5 = +[CSSystemShellStartMonitorFactory defaultShellStartMonitor];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v5];

  v6 = +[CSFirstUnlockMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v6];

  v7 = +[CSScreenLockMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v7];

  v8 = +[CSSiriRestrictionOnLockScreenMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v8];

  v9 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v9];

  v10 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v10];

  v11 = +[CSOtherAppRecordingStateMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v11];

  v12 = +[CSHangUpEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v12];

  id v13 = +[CSSiriInCallEnabledMonitor sharedInstance];
  [(CSVoiceTriggerEnabledPolicyAOP *)self subscribeEventMonitor:v13];
}

- (CSVoiceTriggerEnabledPolicyAOP)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyAOP;
  v2 = [(CSVoiceTriggerEnabledPolicyAOP *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSVoiceTriggerEnabledPolicyAOP *)v2 _addVoiceTriggerEnabledConditions];
    [(CSVoiceTriggerEnabledPolicyAOP *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end