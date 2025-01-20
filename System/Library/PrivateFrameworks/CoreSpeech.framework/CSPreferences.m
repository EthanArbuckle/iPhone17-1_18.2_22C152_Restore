@interface CSPreferences
+ (id)sharedPreferences;
- (BOOL)enableAudioInjection:(BOOL)a3;
- (BOOL)fileLoggingIsEnabled;
- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled;
- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid;
- (BOOL)isAttentiveSiriAudioLoggingEnabled;
- (BOOL)isAttentiveSiriEnabled;
- (BOOL)isFlexibleFollowupsSupported;
- (BOOL)isFlexibleFollowupsUserDisabled;
- (BOOL)isGazeMandatory;
- (BOOL)isGazeSignalEnabled;
- (BOOL)isGazeSimlModelEnabled;
- (BOOL)isPHSSupported;
- (BOOL)smartSiriVolumeContextAwareEnabled;
- (BOOL)twoShotNotificationEnabled;
- (BOOL)useSiriActivationSPIForHomePod;
- (BOOL)voiceTriggerEnabled;
- (float)adaptiveSiriVolumePermanentOffset;
- (float)getAttendingTimeoutConfig;
- (id)dateWhenVoiceTriggerRePrompted;
- (id)getStartOfSpeechAudioLogFilePath;
- (id)trialBaseAssetDirectory;
- (id)voiceTriggerAudioLogDirectory;
- (int)adaptiveSiriVolumeRecentIntent;
- (void)disableAdaptiveSiriVolume:(id)a3;
- (void)setAudioInjectionFilePath:(id)a3;
- (void)setFileLoggingIsEnabled:(BOOL)a3;
@end

@implementation CSPreferences

- (id)dateWhenVoiceTriggerRePrompted
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  v3 = [v2 dateWhenVoiceTriggerRePrompted];

  return v3;
}

- (BOOL)isFlexibleFollowupsSupported
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isFlexibleFollowupsSupported];

  return v3;
}

- (BOOL)isFlexibleFollowupsUserDisabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isFlexibleFollowupsUserDisabled];

  return v3;
}

- (int)adaptiveSiriVolumeRecentIntent
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  int v3 = [v2 adaptiveSiriVolumeRecentIntent];

  return v3;
}

- (float)adaptiveSiriVolumePermanentOffset
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  [v2 adaptiveSiriVolumePermanentOffset];
  float v4 = v3;

  return v4;
}

- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isAdaptiveSiriVolumePermanentOffsetEnabled];

  return v3;
}

- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isAdaptiveSiriVolumeTemporaryIntentValid];

  return v3;
}

- (void)disableAdaptiveSiriVolume:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F5D2F8];
  id v4 = a3;
  id v5 = [v3 sharedPreferences];
  [v5 disableAdaptiveSiriVolume:v4];
}

- (BOOL)smartSiriVolumeContextAwareEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 smartSiriVolumeContextAwareEnabled];

  return v3;
}

- (id)trialBaseAssetDirectory
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 trialBaseAssetDirectory];

  return v3;
}

- (BOOL)useSiriActivationSPIForHomePod
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 useSiriActivationSPIForHomePod];

  return v3;
}

- (BOOL)enableAudioInjection:(BOOL)a3
{
  uint64_t v3 = a3;
  id v4 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  LOBYTE(v3) = [v4 enableAudioInjection:v3];

  return v3;
}

- (void)setAudioInjectionFilePath:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5D2F8];
  id v4 = a3;
  id v5 = [v3 sharedPreferences];
  [v5 setAudioInjectionFilePath:v4];
}

- (id)getStartOfSpeechAudioLogFilePath
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  uint64_t v3 = [v2 getStartOfSpeechAudioLogFilePath];

  return v3;
}

- (BOOL)twoShotNotificationEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 twoShotNotificationEnabled];

  return v3;
}

- (float)getAttendingTimeoutConfig
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  [v2 getAttendingTimeoutConfig];
  float v4 = v3;

  return v4;
}

- (BOOL)isGazeSignalEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isGazeSignalEnabled];

  return v3;
}

- (BOOL)isGazeMandatory
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isGazeMandatory];

  return v3;
}

- (BOOL)isGazeSimlModelEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isGazeSimlModelEnabled];

  return v3;
}

- (BOOL)isAttentiveSiriAudioLoggingEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isAttentiveSiriAudioLoggingEnabled];

  return v3;
}

- (BOOL)isAttentiveSiriEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isAttentiveSiriEnabled];

  return v3;
}

- (BOOL)isPHSSupported
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 isPHSSupported];

  return v3;
}

- (BOOL)voiceTriggerEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

- (id)voiceTriggerAudioLogDirectory
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 voiceTriggerAudioLogDirectory];

  return v3;
}

- (BOOL)fileLoggingIsEnabled
{
  v2 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  char v3 = [v2 fileLoggingIsEnabled];

  return v3;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  [v4 setFileLoggingIsEnabled:v3];
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_19729);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;
  return v2;
}

void __34__CSPreferences_sharedPreferences__block_invoke()
{
  v0 = objc_alloc_init(CSPreferences);
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;
}

@end