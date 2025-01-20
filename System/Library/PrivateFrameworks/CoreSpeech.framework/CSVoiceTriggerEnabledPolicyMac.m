@interface CSVoiceTriggerEnabledPolicyMac
- (CSVoiceTriggerEnabledPolicyMac)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyMac

- (void)_addVoiceTriggerEnabledConditions
{
  [(CSPolicy *)self addConditions:&__block_literal_global_22408];
  [(CSPolicy *)self addConditions:&__block_literal_global_7_22409];
  [(CSPolicy *)self addConditions:&__block_literal_global_10_22410];
  [(CSPolicy *)self addConditions:&__block_literal_global_13_22411];
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_11()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F5D448] sharedInstance];
  uint64_t v1 = [v0 isUserActive];

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since current user doesn't activated", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_8()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = +[CSSRFUserSettingMonitor sharedInstance];
  if (([v0 isSiriRestrictedOnLockScreen] & 1) == 0)
  {

    return 1;
  }
  uint64_t v1 = [MEMORY[0x1E4F5D3D8] sharedInstance];
  int v2 = [v1 isScreenLocked];

  if (!v2) {
    return 1;
  }
  v3 = *MEMORY[0x1E4F5D180];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v4)
  {
    int v6 = 136315138;
    v7 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since Siri restricted on lock screen AND screen is locked", (uint8_t *)&v6, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke_5()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F5D470] sharedInstance];
  uint64_t v1 = [v0 isEnabled];

  if ((v1 & 1) == 0)
  {
    int v2 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since VoiceTrigger is disabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

uint64_t __67__CSVoiceTriggerEnabledPolicyMac__addVoiceTriggerEnabledConditions__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[CSClamshellStateMonitor sharedInstance];
  int v1 = [v0 isClamshellClosed];

  if (v1)
  {
    int v2 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[CSVoiceTriggerEnabledPolicyMac _addVoiceTriggerEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger cannot be turned on since clamshell is closed", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1 ^ 1u;
}

- (void)_subscribeEventMonitors
{
  v3 = [MEMORY[0x1E4F5D470] sharedInstance];
  [(CSPolicy *)self subscribeEventMonitor:v3];

  int v4 = +[CSClamshellStateMonitor sharedInstance];
  [(CSPolicy *)self subscribeEventMonitor:v4];

  v5 = +[CSSRFUserSettingMonitor sharedInstance];
  [(CSPolicy *)self subscribeEventMonitor:v5];

  uint64_t v6 = [MEMORY[0x1E4F5D3D8] sharedInstance];
  [(CSPolicy *)self subscribeEventMonitor:v6];

  id v7 = [MEMORY[0x1E4F5D448] sharedInstance];
  [(CSPolicy *)self subscribeEventMonitor:v7];
}

- (CSVoiceTriggerEnabledPolicyMac)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSVoiceTriggerEnabledPolicyMac;
  int v2 = [(CSPolicy *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSVoiceTriggerEnabledPolicyMac *)v2 _addVoiceTriggerEnabledConditions];
    [(CSVoiceTriggerEnabledPolicyMac *)v3 _subscribeEventMonitors];
  }
  return v3;
}

@end