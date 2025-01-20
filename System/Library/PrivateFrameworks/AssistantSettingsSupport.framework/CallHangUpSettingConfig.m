@interface CallHangUpSettingConfig
+ (BOOL)enabled;
+ (BOOL)supported;
+ (id)localizationFooterKey;
+ (id)localizationKey;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation CallHangUpSettingConfig

+ (id)localizationKey
{
  return @"CALL_HANG_UP";
}

+ (id)localizationFooterKey
{
  BOOL v3 = +[AssistantUtilities deviceIsiPhone];
  v4 = @"_IPAD";
  if (v3) {
    v4 = @"_IPHONE";
  }
  v5 = v4;
  v6 = [a1 localizationKey];
  v7 = [v6 stringByAppendingString:v5];

  return v7;
}

+ (BOOL)supported
{
  return MEMORY[0x270F0EFA8](a1, a2);
}

+ (BOOL)enabled
{
  v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 canUseVoiceTriggerDuringPhoneCall];

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    v4 = objc_alloc_init(AssistantSettingsSignalEmitter);
    [(AssistantSettingsSignalEmitter *)v4 emitCallHangUpEnabledSignal];
  }
  id v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v5 setCanUseVoiceTriggerDuringPhoneCall:v3];
}

@end