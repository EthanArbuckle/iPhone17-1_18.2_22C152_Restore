@interface CSFPreferences
+ (id)sharedPreferences;
- (BOOL)_isAdaptiveSiriVolumeDisabled;
- (BOOL)_isDirectory:(id)a3;
- (BOOL)_isRemoteVoiceTriggerAvailable;
- (BOOL)_storeModeEnabled;
- (BOOL)audioInjectionEnabled;
- (BOOL)bypassPersonalizedHeySiri;
- (BOOL)bypassSpeakerIdForMitigation;
- (BOOL)bypassTrialAssets;
- (BOOL)checkAOPConfigurationWatchDog;
- (BOOL)companionSyncVoiceTriggerUtterancesEnabled;
- (BOOL)enableAudioInjection:(BOOL)a3;
- (BOOL)enableAudioInjection:(BOOL)a3 withKey:(__CFString *)a4;
- (BOOL)enableBenchmarkService:(BOOL)a3;
- (BOOL)enableExclaveAudioInjection:(BOOL)a3;
- (BOOL)enableProgrammableAudioInjection:(BOOL)a3;
- (BOOL)exclaveAudioInjectionEnabled;
- (BOOL)fileLoggingIsEnabled;
- (BOOL)firstPassDebuggingEnabled;
- (BOOL)forceMitigateForHybridSDSD;
- (BOOL)forceRePromptVoiceTrigger;
- (BOOL)forceSetRePromptRequired;
- (BOOL)forceVoiceTriggerAOPMode;
- (BOOL)forceVoiceTriggerAPMode;
- (BOOL)getBooleanAccessorySettingValueForKey:(id)a3 forAccessory:(id)a4;
- (BOOL)isAdBlockerAudioLoggingEnabled;
- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled;
- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid;
- (BOOL)isAlarmPlayingOnAccessory:(id)a3;
- (BOOL)isAttentiveSiriAPIEnabled;
- (BOOL)isAttentiveSiriAudioLoggingEnabled;
- (BOOL)isAttentiveSiriEnabled;
- (BOOL)isBargeInSupportEnabled;
- (BOOL)isDeferredActivationEnabled;
- (BOOL)isDeferredAsrResultsEnabled;
- (BOOL)isEndpointAssetBypassTrialEnabled;
- (BOOL)isEndpointAssetOverridingEnabled;
- (BOOL)isEndpointEnhancedLoggingEnabled;
- (BOOL)isFlexibleFollowupsSupported;
- (BOOL)isFlexibleFollowupsUserDisabled;
- (BOOL)isGazeMandatory;
- (BOOL)isGazeSignalEnabled;
- (BOOL)isGazeSimlModelEnabled;
- (BOOL)isMediaPlayingOnAccessory:(id)a3;
- (BOOL)isMitigationAssetOverridingEnabled;
- (BOOL)isModelBenchmarkingEnabled;
- (BOOL)isMphVTEnabled;
- (BOOL)isMultiChannelAudioLoggingEnabled;
- (BOOL)isP2PTransferEnabled;
- (BOOL)isPHSSupported;
- (BOOL)isReducedPHSThresholdEnabled;
- (BOOL)isSelfTriggerEnabledAccessory;
- (BOOL)isSelfTriggerFileLoggingEnabled;
- (BOOL)isSelfTriggerNearMissAudioLoggingEnabled;
- (BOOL)isSpeakerRecognitionAvailable;
- (BOOL)isSpeechStudyLoggingEnabled;
- (BOOL)isTimerPlayingOnAccessory:(id)a3;
- (BOOL)isVoiceTriggerAssetOverridingEnabled;
- (BOOL)isVoiceTriggerRepromptAssetOverridingEnabled;
- (BOOL)jarvisAudioLoggingEnabled;
- (BOOL)myriadFileLoggingEnabled;
- (BOOL)opportuneSpeakListenerBypassEnabled;
- (BOOL)overwritingVoiceTriggerMLock;
- (BOOL)personalizedSiriEnrollmentAudioLoggingEnabled;
- (BOOL)personalizedSiriEnrollmentAudioLoggingEnabledFromRoot;
- (BOOL)phraseSpotterEnabled;
- (BOOL)programmableAudioInjectionEnabled;
- (BOOL)secondPassAudioLoggingEnabled;
- (BOOL)shouldDisableImplicitTraining;
- (BOOL)shouldOverwriteRemoteVADScore;
- (BOOL)shouldOverwriteVoiceTriggerMLock;
- (BOOL)smartSiriVolumeContextAwareEnabled;
- (BOOL)smartSiriVolumeContextAwareLoggingEnabled;
- (BOOL)smartSiriVolumeSoftVolumeEnabled;
- (BOOL)speakerRecognitionAudioLoggingEnabled;
- (BOOL)startOfSpeechAudioLoggingEnabled;
- (BOOL)twoShotNotificationEnabled;
- (BOOL)useSiriActivationSPIForHomePod;
- (BOOL)useSiriActivationSPIForwatchOS;
- (BOOL)useSpeexForAudioInjection;
- (BOOL)useVoiceIsolationDictation;
- (BOOL)voiceTriggerEnabled;
- (double)getMediaPlaybackInterruptedTime:(id)a3;
- (double)remoteVoiceTriggerDelayTime;
- (double)remoteVoiceTriggerEndpointTimeoutWithDefault:(double)a3;
- (float)adaptiveSiriVolumePermanentOffset;
- (float)getAttendingTimeoutConfig;
- (float)nearlyMutedPlaybackVolumeLevel;
- (float)overwritingRemoteVADScore;
- (id)_getCoreSpeechGroupContainerPath;
- (id)assistantAudioFileLogDirectory;
- (id)assistantLogDirectory;
- (id)audioInjectionFilePath;
- (id)baseDir;
- (id)dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated;
- (id)dateWhenVoiceTriggerRePrompted;
- (id)enrollmentIdForVoiceProfileiCloudMetrics;
- (id)fakeEndpointAssetPath;
- (id)fakeHearstModelPath;
- (id)fakeMitigationAssetPath;
- (id)fakeSpeakerRecognitionAssetPath;
- (id)fakeVoiceTriggerAssetPath;
- (id)fakeVoiceTriggerAudioAccessoryFirstPassAssetPath;
- (id)fakeVoiceTriggerRepromptAssetPath;
- (id)fileLoggingLevel;
- (id)geckoAudioLogDirectory;
- (id)getIdleUserPreventSleepAssertionAcquitionDate;
- (id)getLegacyOnDeviceCompilationCacheDirectory;
- (id)getOnDeviceCompilationCacheDirectory;
- (id)getOnDeviceCompilationCacheDirectoryForBenchmark;
- (id)getRPIAssistantAudioSamplingDateSubDirectory:(id)a3;
- (id)getRPIAssistantAudioSamplingDirectory;
- (id)getSSVLogFilePathWithSessionIdentifier:(id)a3;
- (id)getStartOfSpeechAudioLogFilePath;
- (id)interstitialAbsoluteDirForLevel:(int64_t)a3;
- (id)interstitialRelativeDirForLevel:(int64_t)a3;
- (id)languageCodeDarwin;
- (id)mhLogDirectory;
- (id)myriadHashDirectory;
- (id)myriadHashFilePath;
- (id)powerLoggingCurrentAssetConfigVersion;
- (id)powerLoggingCurrentLanguage;
- (id)readSpeakerIdScoreOverrrideConfig;
- (id)remoteGradingDataDirectory;
- (id)remoteP2pLogDirectory;
- (id)ssvLogDirectory;
- (id)trialBaseAssetDirectory;
- (id)voiceTriggerAudioLogDirectory;
- (id)whiteListedMultiPhraseLocales;
- (int)adaptiveSiriVolumeRecentIntent;
- (int64_t)geckoLoggingLevel;
- (int64_t)getJarvisTriggerMode;
- (unint64_t)maxNumGradingFiles;
- (unint64_t)maxNumLoggingFiles;
- (unint64_t)overridingFrameSkipRate;
- (unint64_t)speakerIdScoreReportingType;
- (void)_clearAccessorySettingForKeys:(id)a3 forAccessory:(id)a4;
- (void)_updatePreferenceSettingsForAccessory:(id)a3 settingsUpdateBlock:(id)a4;
- (void)clearAOPConfigurationWatchDog;
- (void)clearAlarmPlayingStatusOnAccessory:(id)a3;
- (void)clearMediaPlaybackInterruptedTimeOnAccessory:(id)a3;
- (void)clearMediaPlayingStatusOnAccessory:(id)a3;
- (void)clearMyriadSettingsOnAccessory:(id)a3;
- (void)clearTimerPlayingStatusOnAccessory:(id)a3;
- (void)disableAdaptiveSiriVolume:(id)a3;
- (void)enableAttentiveSiriAPI:(id)a3;
- (void)enableEndpointEnhancedLogging:(id)a3;
- (void)getASVUserIntent:(id)a3;
- (void)setAOPConfigurationWatchDog;
- (void)setASVUserIntent:(id)a3;
- (void)setAudioInjectionFilePath:(id)a3;
- (void)setBooleanAccessorySettingValue:(BOOL)a3 forKey:(id)a4 forAccessory:(id)a5;
- (void)setEnrollmentIdForVoiceProfileiCloudMetrics:(id)a3 on:(id)a4;
- (void)setFakeHearstModelPath:(id)a3;
- (void)setFileLoggingIsEnabled:(BOOL)a3;
- (void)setFileLoggingLevel:(id)a3;
- (void)setHearstFirstPassModelVersion:(id)a3;
- (void)setHearstSecondPassModelVersion:(id)a3;
- (void)setIdleUserPreventSleepAssertionAcquitionDate:(id)a3;
- (void)setIsAlarmPlayingOnAccessory:(id)a3 isAlarmPlaying:(BOOL)a4;
- (void)setIsTimerPlayingOnAccessory:(id)a3 isTimerPlaying:(BOOL)a4;
- (void)setJarvisTriggerMode:(int64_t)a3;
- (void)setMediaPlayingSettingForAccessory:(id)a3 isMediaPlaying:(BOOL)a4 isInterrupted:(BOOL)a5 interruptedTime:(double)a6;
- (void)setPowerLoggingCurrentAssetConfigVersion:(id)a3;
- (void)setPowerLoggingCurrentLanguage:(id)a3;
- (void)setRemoteDarwinEverConnectedWithNotifyKey:(const char *)a3;
- (void)setSelfTriggerEnabledAccessory:(BOOL)a3;
- (void)setSiriLanguageCodeDarwin:(id)a3;
- (void)setVoiceTriggerEverUsed;
- (void)voiceTriggerRePromptFinishedWithDate:(id)a3;
- (void)whiteListMultiPhraseLocale:(id)a3;
@end

@implementation CSFPreferences

- (BOOL)programmableAudioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && programmableAudioInjectionEnabled_onceToken != -1) {
    dispatch_once(&programmableAudioInjectionEnabled_onceToken, &__block_literal_global_263);
  }
  return programmableAudioInjectionEnabled_enabled;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_7725);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;
  return v2;
}

- (BOOL)useVoiceIsolationDictation
{
  if (useVoiceIsolationDictation_onceToken != -1) {
    dispatch_once(&useVoiceIsolationDictation_onceToken, &__block_literal_global_540);
  }
  return useVoiceIsolationDictation_useVoiceIsolateionDictation;
}

void __44__CSFPreferences_useVoiceIsolationDictation__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  id v0 = (id)CFPreferencesCopyAppValue(@"Use VoiceIsolation Dictation", @"com.apple.voicetrigger");
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      useVoiceIsolationDictation_useVoiceIsolateionDictation = [v0 BOOLValue];
    }
  }
}

- (BOOL)checkAOPConfigurationWatchDog
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  v2 = (void *)CFPreferencesCopyAppValue(@"AOPConfigurationWatchDog", @"com.apple.voicetrigger");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)clearAOPConfigurationWatchDog
{
}

- (void)setAOPConfigurationWatchDog
{
}

- (BOOL)isSpeechStudyLoggingEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (isSpeechStudyLoggingEnabled_onceToken != -1) {
    dispatch_once(&isSpeechStudyLoggingEnabled_onceToken, &__block_literal_global_532);
  }
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[CSFPreferences isSpeechStudyLoggingEnabled]";
    __int16 v6 = 1024;
    int v7 = isSpeechStudyLoggingEnabled_enabled;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s returnValue is :%u", (uint8_t *)&v4, 0x12u);
  }
  return isSpeechStudyLoggingEnabled_enabled;
}

void __45__CSFPreferences_isSpeechStudyLoggingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v0 = (id)CFPreferencesCopyAppValue(@"SpeechStudy Logging Enabled", @"com.apple.voicetrigger");
    if (v0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        isSpeechStudyLoggingEnabled_enabled = [v0 BOOLValue];
      }
    }
  }
}

- (id)_getCoreSpeechGroupContainerPath
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.CoreSpeech"];

  int v4 = [v3 path];

  return v4;
}

- (BOOL)isBargeInSupportEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4E540] sharedPreferences];
  int v3 = [v2 isSiriAccessibilityBargeInEnabled];

  int v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSFPreferences isBargeInSupportEnabled]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s isBargeInEnabled:%u", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (id)fakeVoiceTriggerRepromptAssetPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(@"VoiceTriggerReprompt Asset Overriding File Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)dateWhenVoiceTriggerRePrompted
{
  v2 = (void *)CFPreferencesCopyAppValue(@"Log when user was RePrompted ", @"com.apple.voicetrigger.notbackedup");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)voiceTriggerRePromptFinishedWithDate:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, @"Log when user was RePrompted ");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
}

- (float)nearlyMutedPlaybackVolumeLevel
{
  if (nearlyMutedPlaybackVolumeLevel_onceToken != -1) {
    dispatch_once(&nearlyMutedPlaybackVolumeLevel_onceToken, &__block_literal_global_521);
  }
  return *(float *)&nearlyMutedPlaybackVolumeLevel_volumeThreshold;
}

void __48__CSFPreferences_nearlyMutedPlaybackVolumeLevel__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v0 = (void *)CFPreferencesCopyAppValue(@"Nearly Muted Playback Volume", @"com.apple.voicetrigger.notbackedup");
    v1 = v0;
    if (v0)
    {
      [v0 floatValue];
      nearlyMutedPlaybackVolumeLevel_volumeThreshold = v2;
    }
  }
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[CSFPreferences nearlyMutedPlaybackVolumeLevel]_block_invoke";
    __int16 v6 = 2048;
    double v7 = *(float *)&nearlyMutedPlaybackVolumeLevel_volumeThreshold;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s NearlyMutedPlaybackVolumeLevel = %f", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)isVoiceTriggerRepromptAssetOverridingEnabled
{
  if (isVoiceTriggerRepromptAssetOverridingEnabled_onceToken != -1) {
    dispatch_once(&isVoiceTriggerRepromptAssetOverridingEnabled_onceToken, &__block_literal_global_516);
  }
  return isVoiceTriggerRepromptAssetOverridingEnabled_enabled;
}

void __62__CSFPreferences_isVoiceTriggerRepromptAssetOverridingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v0 = (void *)CFPreferencesCopyAppValue(@"VoiceTriggerReprompt Asset Overriding File Path", @"com.apple.voicetrigger");
    if (v0) {
      isVoiceTriggerRepromptAssetOverridingEnabled_enabled = 1;
    }
  }
}

- (BOOL)isFlexibleFollowupsSupported
{
  int v2 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  BOOL v3 = +[CSUtils supportsMagusForLanguageCode:v2];
  BOOL v4 = +[CSUtils isContinuousConversationSupported] && v3;

  return v4;
}

- (BOOL)isFlexibleFollowupsUserDisabled
{
  int v2 = (void *)CFPreferencesCopyAppValue(@"Flexible Followups User Disabled", @"com.apple.voicetrigger");
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)shouldDisableImplicitTraining
{
  if (shouldDisableImplicitTraining_onceToken != -1) {
    dispatch_once(&shouldDisableImplicitTraining_onceToken, &__block_literal_global_505);
  }
  return shouldDisableImplicitTraining_disabled;
}

void __47__CSFPreferences_shouldDisableImplicitTraining__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"Disable Implicit Enrollment", @"com.apple.voicetrigger.notbackedup");
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      id v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
      id v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      id v1 = v0;
      shouldDisableImplicitTraining_disabled = [v0 BOOLValue];
      id v0 = v1;
    }
  }
}

- (unint64_t)overridingFrameSkipRate
{
  if (overridingFrameSkipRate_onceToken != -1) {
    dispatch_once(&overridingFrameSkipRate_onceToken, &__block_literal_global_500);
  }
  return overridingFrameSkipRate_overridingFrameSkipRateValue;
}

void __41__CSFPreferences_overridingFrameSkipRate__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v0 = (id)CFPreferencesCopyAppValue(@"Overriding Fingerproint Frame Skip Rate", @"com.apple.voicetrigger.notbackedup");
    if (v0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        overridingFrameSkipRate_overridingFrameSkipRateValue = [v0 unsignedIntValue];
      }
    }
  }
}

- (id)powerLoggingCurrentLanguage
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Power Logging Current Language", @"com.apple.voicetrigger.notbackedup");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setPowerLoggingCurrentLanguage:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, @"Power Logging Current Language");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (void)whiteListMultiPhraseLocale:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    v5 = [(CSFPreferences *)self whiteListedMultiPhraseLocales];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v5 && [v5 count]) {
      [v6 addObjectsFromArray:v5];
    }
    [v6 addObject:v7];
    _CSNotBackedupPreferencesSetValueForKey(v6, @"Whitelisted Multiphrase Locales");

    id v4 = v7;
  }
}

- (id)whiteListedMultiPhraseLocales
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Whitelisted Multiphrase Locales", @"com.apple.voicetrigger.notbackedup");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)powerLoggingCurrentAssetConfigVersion
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Power Logging Current Asset Config Version", @"com.apple.voicetrigger.notbackedup");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setPowerLoggingCurrentAssetConfigVersion:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, @"Power Logging Current Asset Config Version");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)forceMitigateForHybridSDSD
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
    if (forceMitigateForHybridSDSD_onceToken != -1) {
      dispatch_once(&forceMitigateForHybridSDSD_onceToken, &__block_literal_global_485);
    }
  }
  return forceMitigateForHybridSDSD_forceMitigateForHybridSDSD;
}

uint64_t __44__CSFPreferences_forceMitigateForHybridSDSD__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"Force Mitigate For HybridSDSD", @"com.apple.voicetrigger.notbackedup");
  if (v0) {
    LOBYTE(v0) = [v0 BOOLValue];
  }
  forceMitigateForHybridSDSD_forceMitigateForHybridSDSD = (char)v0;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)forceSetRePromptRequired
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
    if (forceSetRePromptRequired_onceToken != -1) {
      dispatch_once(&forceSetRePromptRequired_onceToken, &__block_literal_global_480);
    }
  }
  return forceSetRePromptRequired_forceSetRePromptRequired;
}

uint64_t __42__CSFPreferences_forceSetRePromptRequired__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"Force Set Re-Prompt Required", @"com.apple.voicetrigger");
  if (v0) {
    LOBYTE(v0) = [v0 BOOLValue];
  }
  forceSetRePromptRequired_forceSetRePromptRequired = (char)v0;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)forceRePromptVoiceTrigger
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
    if (forceRePromptVoiceTrigger_onceToken != -1) {
      dispatch_once(&forceRePromptVoiceTrigger_onceToken, &__block_literal_global_475);
    }
  }
  return forceRePromptVoiceTrigger_forceReEnrollVoiceTrigger;
}

uint64_t __43__CSFPreferences_forceRePromptVoiceTrigger__block_invoke()
{
  id v0 = (void *)CFPreferencesCopyAppValue(@"Force Re-Prompt VoiceTrigger Buddy", @"com.apple.voicetrigger");
  if (v0) {
    LOBYTE(v0) = [v0 BOOLValue];
  }
  forceRePromptVoiceTrigger_forceReEnrollVoiceTrigger = (char)v0;
  return MEMORY[0x1F41817F8]();
}

- (id)enrollmentIdForVoiceProfileiCloudMetrics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CFPreferencesCopyAppValue(@"EnrollmentId Voice Profile iCloud Enrollment", @"com.apple.voicetrigger.notbackedup");
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSFPreferences enrollmentIdForVoiceProfileiCloudMetrics]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched enrollmentId %@", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

- (id)dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CFPreferencesCopyAppValue(@"Creation Date of EnrollmentId used in Voice Profile iCloud Enrollment", @"com.apple.voicetrigger.notbackedup");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = CSLogContextFacilityCoreSpeech;
  BOOL v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (isKindOfClass)
  {
    if (v5)
    {
      int v8 = 136315394;
      id v9 = "-[CSFPreferences dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated]";
      __int16 v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s date found %@", (uint8_t *)&v8, 0x16u);
    }
    id v6 = v2;
  }
  else
  {
    if (v5)
    {
      int v8 = 136315138;
      id v9 = "-[CSFPreferences dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s date not found. Return nil... ", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)setEnrollmentIdForVoiceProfileiCloudMetrics:(id)a3 on:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[CSFPreferences setEnrollmentIdForVoiceProfileiCloudMetrics:on:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting enrollmentId %@ on %@... ", (uint8_t *)&v8, 0x20u);
  }
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  _CSNotBackedupPreferencesSetValueForKey(v5, @"EnrollmentId Voice Profile iCloud Enrollment");
  _CSNotBackedupPreferencesSetValueForKey(v6, @"Creation Date of EnrollmentId used in Voice Profile iCloud Enrollment");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
}

- (BOOL)firstPassDebuggingEnabled
{
  if (firstPassDebuggingEnabled_onceToken != -1) {
    dispatch_once(&firstPassDebuggingEnabled_onceToken, &__block_literal_global_464);
  }
  return firstPassDebuggingEnabled_firstPassDebug;
}

void __43__CSFPreferences_firstPassDebuggingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v0 = (void *)CFPreferencesCopyAppValue(@"First Pass Debug", @"com.apple.voicetrigger.notbackedup");
    firstPassDebuggingEnabled_firstPassDebug = v0 != 0;
  }
}

- (id)readSpeakerIdScoreOverrrideConfig
{
  if (readSpeakerIdScoreOverrrideConfig_onceToken != -1) {
    dispatch_once(&readSpeakerIdScoreOverrrideConfig_onceToken, &__block_literal_global_459);
  }
  id v2 = (void *)readSpeakerIdScoreOverrrideConfig_scoreMap;
  return v2;
}

void __51__CSFPreferences_readSpeakerIdScoreOverrrideConfig__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"SpeakerID Score Override Map", @"com.apple.voicetrigger");
    id v1 = (void *)readSpeakerIdScoreOverrrideConfig_scoreMap;
    readSpeakerIdScoreOverrrideConfig_scoreMap = (uint64_t)v0;

    if (readSpeakerIdScoreOverrrideConfig_scoreMap && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v2 = [(id)readSpeakerIdScoreOverrrideConfig_scoreMap mutableCopy];
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    readSpeakerIdScoreOverrrideConfig_scoreMap = v2;
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)bypassSpeakerIdForMitigation
{
  if (bypassSpeakerIdForMitigation_onceToken != -1) {
    dispatch_once(&bypassSpeakerIdForMitigation_onceToken, &__block_literal_global_454);
  }
  return bypassSpeakerIdForMitigation_enabled;
}

void __46__CSFPreferences_bypassSpeakerIdForMitigation__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Bypass SpeakerId based Mitigation", @"com.apple.voicetrigger");
    if (v0 && (objc_opt_respondsToSelector() & 1) != 0) {
      char v1 = [v0 BOOLValue];
    }
    else {
      char v1 = 0;
    }
    id v3 = (void *)CFPreferencesCopyAppValue(@"Bypass SpeakerId based Mitigation", @"com.apple.voicetrigger.notbackedup");

    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        char v2 = [v3 BOOLValue];
      }
      else {
        char v2 = 0;
      }
    }
    else
    {
      char v2 = 0;
    }
    bypassSpeakerIdForMitigation_enabled = v1 | v2;
    MEMORY[0x1F4181820]();
  }
}

- (BOOL)overwritingVoiceTriggerMLock
{
  if (overwritingVoiceTriggerMLock_onceToken != -1) {
    dispatch_once(&overwritingVoiceTriggerMLock_onceToken, &__block_literal_global_452);
  }
  return overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled;
}

void __46__CSFPreferences_overwritingVoiceTriggerMLock__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"Enable VoiceTrigger Mlock", @"com.apple.voicetrigger.notbackedup");
    if (v0)
    {
      char v1 = (void *)v0;
      if (objc_opt_respondsToSelector()) {
        overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled = [v1 BOOLValue];
      }
    }
    MEMORY[0x1F4181820]();
  }
}

- (BOOL)shouldOverwriteVoiceTriggerMLock
{
  if (shouldOverwriteVoiceTriggerMLock_onceToken != -1) {
    dispatch_once(&shouldOverwriteVoiceTriggerMLock_onceToken, &__block_literal_global_447);
  }
  return shouldOverwriteVoiceTriggerMLock_shouldOverwrite;
}

void __50__CSFPreferences_shouldOverwriteVoiceTriggerMLock__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable VoiceTrigger Mlock", @"com.apple.voicetrigger.notbackedup");
    if (v0) {
      shouldOverwriteVoiceTriggerMLock_shouldOverwrite = 1;
    }
  }
}

- (BOOL)isSelfTriggerEnabledAccessory
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isDarwinOS])
  {
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
    char v2 = (void *)CFPreferencesCopyAppValue(@"SelfTrigger Enabled in Accessory", @"com.apple.voicetrigger");
    id v3 = v2;
    if (v2) {
      char v4 = [v2 BOOLValue];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    id v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      int v8 = "-[CSFPreferences isSelfTriggerEnabledAccessory]";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Called in unexpected platform!", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  return v4;
}

- (void)setSelfTriggerEnabledAccessory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isDarwinOS])
  {
    char v4 = [NSNumber numberWithBool:v3];
    _CSPreferencesSetValueForKey(v4, @"SelfTrigger Enabled in Accessory");

    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  }
  else
  {
    id v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[CSFPreferences setSelfTriggerEnabledAccessory:]";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Called in unexpected platform!", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)bypassTrialAssets
{
  if (bypassTrialAssets_onceToken != -1) {
    dispatch_once(&bypassTrialAssets_onceToken, &__block_literal_global_439);
  }
  return bypassTrialAssets_bypassTrial;
}

void __35__CSFPreferences_bypassTrialAssets__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"Bypass Trial Assets", @"com.apple.voicetrigger");
    if (v0)
    {
      char v1 = (void *)v0;
      if (objc_opt_respondsToSelector()) {
        bypassTrialAssets_bypassTrial = [v1 BOOLValue];
      }
    }
    MEMORY[0x1F4181820]();
  }
}

- (id)fakeMitigationAssetPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    char v2 = (void *)CFPreferencesCopyValue(@"Mitigation Asset Overriding File Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isMitigationAssetOverridingEnabled
{
  if (isMitigationAssetOverridingEnabled_onceToken != -1) {
    dispatch_once(&isMitigationAssetOverridingEnabled_onceToken, &__block_literal_global_434);
  }
  return isMitigationAssetOverridingEnabled_enabled;
}

void __52__CSFPreferences_isMitigationAssetOverridingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Mitigation Asset Overriding File Path", @"com.apple.voicetrigger");
    if (v0) {
      isMitigationAssetOverridingEnabled_enabled = 1;
    }
  }
}

- (id)fakeVoiceTriggerAudioAccessoryFirstPassAssetPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    char v2 = (void *)CFPreferencesCopyValue(@"VoiceTrigger Asset Overriding File Path", @"com.apple.voicetrigger", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)fakeSpeakerRecognitionAssetPath
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__7493;
  uint64_t v9 = __Block_byref_object_dispose__7494;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CSFPreferences_fakeSpeakerRecognitionAssetPath__block_invoke;
  block[3] = &unk_1E62010B0;
  block[4] = &v5;
  if (fakeSpeakerRecognitionAssetPath_onceToken != -1) {
    dispatch_once(&fakeSpeakerRecognitionAssetPath_onceToken, block);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __49__CSFPreferences_fakeSpeakerRecognitionAssetPath__block_invoke(uint64_t a1)
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id obj = (id)CFPreferencesCopyValue(@"SpeakerRecognition Asset Overriding File Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (obj)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
      }
    }
  }
}

- (id)fakeVoiceTriggerAssetPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v2 = (void *)CFPreferencesCopyValue(@"VoiceTrigger Asset Overriding File Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isVoiceTriggerAssetOverridingEnabled
{
  if (isVoiceTriggerAssetOverridingEnabled_onceToken != -1) {
    dispatch_once(&isVoiceTriggerAssetOverridingEnabled_onceToken, &__block_literal_global_426);
  }
  return isVoiceTriggerAssetOverridingEnabled_enabled;
}

void __54__CSFPreferences_isVoiceTriggerAssetOverridingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger Asset Overriding File Path", @"com.apple.voicetrigger");
    if (v0) {
      isVoiceTriggerAssetOverridingEnabled_enabled = 1;
    }
  }
}

- (BOOL)isEndpointAssetBypassTrialEnabled
{
  if (isEndpointAssetBypassTrialEnabled_onceToken != -1) {
    dispatch_once(&isEndpointAssetBypassTrialEnabled_onceToken, &__block_literal_global_421);
  }
  return isEndpointAssetBypassTrialEnabled_enabled;
}

void __51__CSFPreferences_isEndpointAssetBypassTrialEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Endpoint Asset Bypass Trial Enabled", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isEndpointAssetBypassTrialEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (id)fakeEndpointAssetPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v2 = (void *)CFPreferencesCopyValue(@"Endpoint Asset Overriding File Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isEndpointAssetOverridingEnabled
{
  if (isEndpointAssetOverridingEnabled_onceToken != -1) {
    dispatch_once(&isEndpointAssetOverridingEnabled_onceToken, &__block_literal_global_413);
  }
  return isEndpointAssetOverridingEnabled_enabled;
}

void __50__CSFPreferences_isEndpointAssetOverridingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Endpoint Asset Overriding Enabled", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isEndpointAssetOverridingEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isEndpointEnhancedLoggingEnabled
{
  if (isEndpointEnhancedLoggingEnabled_onceToken != -1) {
    dispatch_once(&isEndpointEnhancedLoggingEnabled_onceToken, &__block_literal_global_411);
  }
  return isEndpointEnhancedLoggingEnabled_enabled;
}

void __50__CSFPreferences_isEndpointEnhancedLoggingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Endpoint Enhanced Logging", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isEndpointEnhancedLoggingEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (void)enableEndpointEnhancedLogging:(id)a3
{
  _CSPreferencesSetValueForKeyFromRoot(a3, @"Endpoint Enhanced Logging");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)isAttentiveSiriAPIEnabled
{
  if (isAttentiveSiriAPIEnabled_onceToken != -1) {
    dispatch_once(&isAttentiveSiriAPIEnabled_onceToken, &__block_literal_global_406);
  }
  return isAttentiveSiriAPIEnabled_enabled;
}

void __43__CSFPreferences_isAttentiveSiriAPIEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Attentive Siri API", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isAttentiveSiriAPIEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (void)enableAttentiveSiriAPI:(id)a3
{
  _CSPreferencesSetValueForKeyFromRoot(a3, @"Attentive Siri API");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (int64_t)geckoLoggingLevel
{
  if (geckoLoggingLevel_onceToken != -1) {
    dispatch_once(&geckoLoggingLevel_onceToken, &__block_literal_global_398);
  }
  return geckoLoggingLevel_geckoLoggingLevel;
}

void __35__CSFPreferences_geckoLoggingLevel__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"NearMissAudioLoggingLevel", @"com.apple.voicetrigger.notbackedup");
  if (v0)
  {
    id v1 = v0;
    geckoLoggingLevel_geckoLoggingLevel = [v0 integerValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)isModelBenchmarkingEnabled
{
  if (isModelBenchmarkingEnabled_onceToken != -1) {
    dispatch_once(&isModelBenchmarkingEnabled_onceToken, &__block_literal_global_396);
  }
  return isModelBenchmarkingEnabled_enabled;
}

void __44__CSFPreferences_isModelBenchmarkingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable Model Benchmarking", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isModelBenchmarkingEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isReducedPHSThresholdEnabled
{
  if (isReducedPHSThresholdEnabled_onceToken != -1) {
    dispatch_once(&isReducedPHSThresholdEnabled_onceToken, &__block_literal_global_391);
  }
  return isReducedPHSThresholdEnabled_enabled;
}

void __46__CSFPreferences_isReducedPHSThresholdEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable Reduced PHS Threshold", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isReducedPHSThresholdEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isP2PTransferEnabled
{
  if (isP2PTransferEnabled_onceToken != -1) {
    dispatch_once(&isP2PTransferEnabled_onceToken, &__block_literal_global_386);
  }
  return isP2PTransferEnabled_enabled;
}

void __38__CSFPreferences_isP2PTransferEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable P2P Transfer", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    isP2PTransferEnabled_enabled = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (id)getIdleUserPreventSleepAssertionAcquitionDate
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Idle User Prevent Sleep Assertion Acquition Time", @"com.apple.voicetrigger.notbackedup");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setIdleUserPreventSleepAssertionAcquitionDate:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, @"Idle User Prevent Sleep Assertion Acquition Time");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
}

- (void)setRemoteDarwinEverConnectedWithNotifyKey:(const char *)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSFPreferences_setRemoteDarwinEverConnectedWithNotifyKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (setRemoteDarwinEverConnectedWithNotifyKey__onceToken != -1) {
    dispatch_once(&setRemoteDarwinEverConnectedWithNotifyKey__onceToken, block);
  }
}

uint64_t __60__CSFPreferences_setRemoteDarwinEverConnectedWithNotifyKey___block_invoke(uint64_t a1)
{
  _CSNotBackedupPreferencesSetValueForKey(MEMORY[0x1E4F1CC38], @"Remote Darwin Ever Connected");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  id v2 = *(const char **)(a1 + 32);
  return notify_post(v2);
}

- (id)languageCodeDarwin
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!+[CSUtils isDarwinOS])
  {
    id v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSFPreferences languageCodeDarwin]";
      _os_log_error_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_ERROR, "%s Not supported on this platform", (uint8_t *)&v6, 0xCu);
    }
  }
  id v3 = (void *)CFPreferencesCopyAppValue(@"Siri Language Code Darwin", @"com.apple.voicetrigger");
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setSiriLanguageCodeDarwin:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[CSUtils isDarwinOS])
  {
    _CSPreferencesSetValueForKey(v3, @"Siri Language Code Darwin");
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  }
  else
  {
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[CSFPreferences setSiriLanguageCodeDarwin:]";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Not supported on this platform", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)getASVUserIntent:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Type", @"com.apple.voicetrigger");
  int v5 = v4;
  if (v4)
  {
    objc_msgSend(v3, "setUserIntentType:", objc_msgSend(v4, "unsignedLongLongValue"));
    int v6 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Time", @"com.apple.voicetrigger");
    uint64_t v7 = v6;
    if (v6)
    {
      objc_msgSend(v3, "setUserIntentTime:", objc_msgSend(v6, "longLongValue"));
      uint64_t v8 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Volume", @"com.apple.voicetrigger");
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 floatValue];
        objc_msgSend(v3, "setUserIntentVolume:");
        id v10 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Latest Volume Time", @"com.apple.voicetrigger");
        id v11 = v10;
        if (v10)
        {
          objc_msgSend(v3, "setLatestVolumeTime:", objc_msgSend(v10, "longLongValue"));
          __int16 v12 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Latest Volume", @"com.apple.voicetrigger");
          id v13 = v12;
          if (v12)
          {
            [v12 floatValue];
            objc_msgSend(v3, "setLatestVolume:");
            uint64_t v14 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Permanent Offset Enabled", @"com.apple.voicetrigger");
            v15 = v14;
            if (v14)
            {
              uint64_t v16 = [v14 BOOLValue];
              v17 = v3;
            }
            else
            {
              v23 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v42 = "-[CSFPreferences getASVUserIntent:]";
                _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load permanent offset status. Defaulting to no permanent volume offset", buf, 0xCu);
              }
              v17 = v3;
              uint64_t v16 = 0;
            }
            [v17 setPermanentOffsetIsEnabled:v16];
            v24 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Permanent Offset Factor", @"com.apple.voicetrigger");
            v25 = v24;
            if (v24)
            {
              [v24 floatValue];
              float v27 = *(float *)&v26;
            }
            else
            {
              v28 = CSLogContextFacilityCoreSpeech;
              float v27 = 1.0;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v42 = "-[CSFPreferences getASVUserIntent:]";
                _os_log_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load permanent offset factor. Defaulting to unity permanent volume offset factor", buf, 0xCu);
              }
            }
            *(float *)&double v26 = v27;
            [v3 setPermanentOffsetFactor:v26];
            v29 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              log = v29;
              uint64_t v39 = [v3 userIntentType];
              uint64_t v38 = [v3 userIntentTime];
              [v3 userIntentVolume];
              double v31 = v30;
              uint64_t v32 = [v3 latestVolumeTime];
              [v3 latestVolume];
              double v34 = v33;
              v35 = v15;
              int v36 = [v3 permanentOffsetIsEnabled];
              [v3 permanentOffsetFactor];
              *(_DWORD *)buf = 136316930;
              v42 = "-[CSFPreferences getASVUserIntent:]";
              __int16 v43 = 2050;
              uint64_t v44 = v39;
              __int16 v45 = 2050;
              uint64_t v46 = v38;
              __int16 v47 = 2050;
              double v48 = v31;
              __int16 v49 = 2050;
              uint64_t v50 = v32;
              __int16 v51 = 2050;
              double v52 = v34;
              __int16 v53 = 1026;
              int v54 = v36;
              v15 = v35;
              __int16 v55 = 2050;
              double v56 = v37;
              _os_log_impl(&dword_1BA1A5000, log, OS_LOG_TYPE_DEFAULT, "%s Loaded Adaptive Siri Volume intentType: %{public}llu, intentTime: %{public}llu, intentVolume: %{public}f, latestVolumeTime: %{public}lld, latestVolume:%{public}f, permanentOffsetIsEnabled: %{public}d, permanentOffsetFactor: %{public}f", buf, 0x4Eu);
            }
          }
          else
          {
            v22 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v42 = "-[CSFPreferences getASVUserIntent:]";
              _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to latest volume. Ignoring intent", buf, 0xCu);
            }
            [v3 setUserIntentTime:0x8000000000000000];
          }
        }
        else
        {
          v21 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v42 = "-[CSFPreferences getASVUserIntent:]";
            _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load latest volume time. Ignoring intent", buf, 0xCu);
          }
          [v3 setUserIntentTime:0x8000000000000000];
        }
      }
      else
      {
        v20 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[CSFPreferences getASVUserIntent:]";
          _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent volume. Ignoring intent", buf, 0xCu);
        }
        [v3 setUserIntentTime:0x8000000000000000];
      }
    }
    else
    {
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[CSFPreferences getASVUserIntent:]";
        _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent time. Ignoring intent", buf, 0xCu);
      }
      [v3 setUserIntentTime:0x8000000000000000];
    }
  }
  else
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[CSFPreferences getASVUserIntent:]";
      _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent type. Ignoring intent", buf, 0xCu);
    }
    [v3 setUserIntentTime:0x8000000000000000];
  }
}

- (void)setASVUserIntent:(id)a3
{
  id v3 = NSNumber;
  id v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "userIntentType"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "userIntentTime"));
  int v6 = NSNumber;
  [v4 userIntentVolume];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "latestVolumeTime"));
  uint64_t v9 = NSNumber;
  [v4 latestVolume];
  id v10 = objc_msgSend(v9, "numberWithFloat:");
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "permanentOffsetIsEnabled"));
  __int16 v12 = NSNumber;
  [v4 permanentOffsetFactor];
  id v13 = objc_msgSend(v12, "numberWithFloat:");
  uint64_t v14 = NSNumber;
  uint64_t v15 = [v4 userIntentValidForSeconds];

  uint64_t v16 = [v14 numberWithUnsignedLongLong:v15];
  _CSPreferencesSetValueForKey(v17, @"Adaptive Siri Volume State Intent Type");
  _CSPreferencesSetValueForKey(v5, @"Adaptive Siri Volume State Intent Time");
  _CSPreferencesSetValueForKey(v7, @"Adaptive Siri Volume State Intent Volume");
  _CSPreferencesSetValueForKey(v8, @"Adaptive Siri Volume State Latest Volume Time");
  _CSPreferencesSetValueForKey(v10, @"Adaptive Siri Volume State Latest Volume");
  _CSPreferencesSetValueForKey(v11, @"Adaptive Siri Volume State Permanent Offset Enabled");
  _CSPreferencesSetValueForKey(v13, @"Adaptive Siri Volume State Permanent Offset Factor");
  _CSPreferencesSetValueForKey(v16, @"Adaptive Siri Volume State Intent Valid For Seconds");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)isSelfTriggerNearMissAudioLoggingEnabled
{
  if (isSelfTriggerNearMissAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&isSelfTriggerNearMissAudioLoggingEnabled_onceToken, &__block_literal_global_362);
  }
  return isSelfTriggerNearMissAudioLoggingEnabled_enabled;
}

void __58__CSFPreferences_isSelfTriggerNearMissAudioLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable Self Trigger Near-Miss Audio Logging", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    isSelfTriggerNearMissAudioLoggingEnabled_enabled = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)isSelfTriggerFileLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && isSelfTriggerFileLoggingEnabled_onceToken != -1) {
    dispatch_once(&isSelfTriggerFileLoggingEnabled_onceToken, &__block_literal_global_357);
  }
  return isSelfTriggerFileLoggingEnabled_enabled;
}

void __49__CSFPreferences_isSelfTriggerFileLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable Self Trigger Audio Logging", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    isSelfTriggerFileLoggingEnabled_enabled = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)isAdBlockerAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && isAdBlockerAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&isAdBlockerAudioLoggingEnabled_onceToken, &__block_literal_global_352);
  }
  return isAdBlockerAudioLoggingEnabled_enabled;
}

void __48__CSFPreferences_isAdBlockerAudioLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable AdBlocker Audio Logging", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    isAdBlockerAudioLoggingEnabled_enabled = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)isMultiChannelAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && isMultiChannelAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&isMultiChannelAudioLoggingEnabled_onceToken, &__block_literal_global_346);
  }
  return isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging;
}

void __51__CSFPreferences_isMultiChannelAudioLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"MultiChannelAudioLoggingEnabled", @"com.apple.voicetrigger");
  id v3 = v0;
  if (v0)
  {
    int v1 = [v0 BOOLValue];
    isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging = v1;
    if (v1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging)
  {
LABEL_3:
    id v2 = [MEMORY[0x1E4F4E540] sharedPreferences];
    isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging = [v2 fileLoggingIsEnabled];
  }
LABEL_4:
}

- (BOOL)isMphVTEnabled
{
  if (isMphVTEnabled_onceToken != -1) {
    dispatch_once(&isMphVTEnabled_onceToken, &__block_literal_global_341);
  }
  return isMphVTEnabled_mphVTEnabled;
}

void __32__CSFPreferences_isMphVTEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"MultiPhraseVTEnabled", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      isMphVTEnabled_mphVTEnabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)bypassPersonalizedHeySiri
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
    if (bypassPersonalizedHeySiri_onceToken != -1) {
      dispatch_once(&bypassPersonalizedHeySiri_onceToken, &__block_literal_global_336);
    }
  }
  return bypassPersonalizedHeySiri_bypassPersonalizedHeySiri;
}

uint64_t __43__CSFPreferences_bypassPersonalizedHeySiri__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Bypass Personalized HeySiri", @"com.apple.voicetrigger.notbackedup");
  if (v0) {
    LOBYTE(v0) = [v0 BOOLValue];
  }
  bypassPersonalizedHeySiri_bypassPersonalizedHeySiri = (char)v0;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)opportuneSpeakListenerBypassEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"Enable OpportuneSpeakListener Bypass", @"com.apple.voicetrigger");
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  char v4 = [v2 BOOLValue];

  return v4;
}

- (BOOL)companionSyncVoiceTriggerUtterancesEnabled
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return 0;
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger Companion Sync Enabled", @"com.apple.voicetrigger");
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  char v4 = [v2 BOOLValue];

  return v4;
}

- (void)setFakeHearstModelPath:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild_onceToken == -1)
  {
    if (!v3) {
      goto LABEL_5;
    }
  }
  else
  {
    id v5 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
    id v3 = v5;
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v4 = v3;
    _CSPreferencesSetValueForKeyFromRoot(v3, @"Hearst Fake Model Path");
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
    id v3 = v4;
  }
LABEL_5:
}

- (id)fakeHearstModelPath
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v2 = (void *)CFPreferencesCopyValue(@"Hearst Fake Model Path", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setHearstSecondPassModelVersion:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild_onceToken != -1)
  {
    id v4 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
    id v3 = v4;
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesSetValue(@"Hearst Second Pass Model Version", v3, @"com.apple.voicetrigger.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  }
  MEMORY[0x1F41817F8]();
}

- (void)setHearstFirstPassModelVersion:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild_onceToken != -1)
  {
    id v4 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
    id v3 = v4;
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesSetValue(@"Hearst First Pass Model Version", v3, @"com.apple.voicetrigger.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
  }
  MEMORY[0x1F41817F8]();
}

- (float)overwritingRemoteVADScore
{
  if (overwritingRemoteVADScore_onceToken != -1) {
    dispatch_once(&overwritingRemoteVADScore_onceToken, &__block_literal_global_319);
  }
  return *(float *)&overwritingRemoteVADScore_overrideScore;
}

void __43__CSFPreferences_overwritingRemoteVADScore__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Overwrite Remote VAD Score", @"com.apple.voicetrigger");
  if (v0)
  {
    id v2 = v0;
    [v0 floatValue];
    CFPropertyListRef v0 = v2;
    overwritingRemoteVADScore_overrideScore = v1;
  }
}

- (BOOL)shouldOverwriteRemoteVADScore
{
  if (shouldOverwriteRemoteVADScore_onceToken != -1) {
    dispatch_once(&shouldOverwriteRemoteVADScore_onceToken, &__block_literal_global_314);
  }
  return shouldOverwriteRemoteVADScore_ret;
}

void __47__CSFPreferences_shouldOverwriteRemoteVADScore__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Overwrite Remote VAD Score", @"com.apple.voicetrigger");
  if (v0) {
    shouldOverwriteRemoteVADScore_ret = 1;
  }
}

- (BOOL)useSiriActivationSPIForwatchOS
{
  if (useSiriActivationSPIForwatchOS_onceToken != -1) {
    dispatch_once(&useSiriActivationSPIForwatchOS_onceToken, &__block_literal_global_309);
  }
  return useSiriActivationSPIForwatchOS_ret;
}

void __48__CSFPreferences_useSiriActivationSPIForwatchOS__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable SiriActivation watchOS", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    useSiriActivationSPIForwatchOS_ret = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)useSiriActivationSPIForHomePod
{
  if (useSiriActivationSPIForHomePod_onceToken != -1) {
    dispatch_once(&useSiriActivationSPIForHomePod_onceToken, &__block_literal_global_304);
  }
  return useSiriActivationSPIForHomePod_ret;
}

void __48__CSFPreferences_useSiriActivationSPIForHomePod__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Enable SiriActivation HomePod", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    useSiriActivationSPIForHomePod_ret = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (unint64_t)maxNumGradingFiles
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Max Number Grading Files", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 50;
  }

  return v4;
}

- (unint64_t)maxNumLoggingFiles
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Max Number Logging Files", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 5;
  }

  return v4;
}

- (int)adaptiveSiriVolumeRecentIntent
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Type", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    int v4 = [v2 integerValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (float)adaptiveSiriVolumePermanentOffset
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Permanent Offset Factor", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 1.0;
  }

  return v5;
}

- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Permanent Offset Enabled", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Time", @"com.apple.voicetrigger");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"Adaptive Siri Volume State Intent Valid For Seconds", @"com.apple.voicetrigger");
  char v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v11 = 0;
  if (!v5)
  {
    uint64_t v6 = [v2 longLongValue];
    unint64_t v7 = [v4 unsignedLongLongValue];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSince1970];
    unint64_t v10 = (unint64_t)(v9 - (double)v6);

    if (v7 > v10) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (BOOL)smartSiriVolumeContextAwareEnabled
{
  return ![(CSFPreferences *)self _isAdaptiveSiriVolumeDisabled];
}

- (BOOL)smartSiriVolumeContextAwareLoggingEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CSFPreferences_smartSiriVolumeContextAwareLoggingEnabled__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  if (smartSiriVolumeContextAwareLoggingEnabled_onceToken != -1) {
    dispatch_once(&smartSiriVolumeContextAwareLoggingEnabled_onceToken, block);
  }
  return smartSiriVolumeContextAwareLoggingEnabled_enabled;
}

void __59__CSFPreferences_smartSiriVolumeContextAwareLoggingEnabled__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) smartSiriVolumeContextAwareEnabled])
  {
    id v1 = +[CSFPreferences sharedPreferences];
    int v2 = [v1 fileLoggingIsEnabled];

    if (v2) {
      smartSiriVolumeContextAwareLoggingEnabled_enabled = 1;
    }
  }
}

- (BOOL)smartSiriVolumeSoftVolumeEnabled
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return 0;
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  int v2 = (void *)CFPreferencesCopyAppValue(@"SmartSiriVolume SoftVolume Enabled", @"com.apple.voicetrigger");
  if (!v2) {
    return 0;
  }
  CFPropertyListRef v3 = v2;
  char v4 = [v2 BOOLValue];

  return v4;
}

- (unint64_t)speakerIdScoreReportingType
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSFPreferences_speakerIdScoreReportingType__block_invoke;
  block[3] = &unk_1E62010B0;
  block[4] = &v5;
  if (speakerIdScoreReportingType_onceToken != -1) {
    dispatch_once(&speakerIdScoreReportingType_onceToken, block);
  }
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__CSFPreferences_speakerIdScoreReportingType__block_invoke(uint64_t a1)
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    unint64_t v2 = (void *)CFPreferencesCopyAppValue(@"SpeakerId Score Type", @"com.apple.voicetrigger");
    if (v2)
    {
      id v4 = v2;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 unsignedIntegerValue];
      unint64_t v2 = v4;
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
      if ((unint64_t)(*(void *)(v3 + 24) - 4) <= 0xFFFFFFFFFFFFFFFCLL) {
        *(void *)(v3 + 24) = 3;
      }
    }
  }
}

- (BOOL)isSpeakerRecognitionAvailable
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 1;
  }
  unint64_t v2 = (void *)CFPreferencesCopyAppValue(@"SpeakerId Enabled", @"com.apple.voicetrigger");
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  char v4 = [v2 BOOLValue];

  return v4;
}

- (BOOL)_isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)isPHSSupported
{
  return 1;
}

- (id)audioInjectionFilePath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    goto LABEL_18;
  }
  id v2 = (id)CFPreferencesCopyAppValue(@"Audio Injection File Path", @"com.apple.voicetrigger");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSFPreferences audioInjectionFilePath]";
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s kCSAudioInjectionFilePathKey is not array type", buf, 0xCu);
    }
    goto LABEL_17;
  }
  id v2 = v2;
  uint64_t v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = v3;
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSFPreferences audioInjectionFilePath]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v2 count];
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s kCSAudioInjectionFilePathKey array size = %d", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v11 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__CSFPreferences_audioInjectionFilePath__block_invoke;
  v9[3] = &unk_1E62000D8;
  v9[4] = buf;
  [v2 enumerateObjectsUsingBlock:v9];
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = v5;
  _Block_object_dispose(buf, 8);

  if (v6)
  {
LABEL_17:

LABEL_18:
    id v2 = 0;
  }
  return v2;
}

void __40__CSFPreferences_audioInjectionFilePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      unint64_t v10 = "-[CSFPreferences audioInjectionFilePath]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s kCSAudioInjectionFilePathKey doesn't have NSString as an array entry", (uint8_t *)&v9, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)setAudioInjectionFilePath:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    _CSPreferencesSetValueForKey(v3, @"Audio Injection File Path");
    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  }
  else
  {
    char v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSFPreferences setAudioInjectionFilePath:]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s setAudioInjectionFilePath: is only available on internal builds", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)enableAudioInjection:(BOOL)a3 withKey:(__CFString *)a4
{
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    id v6 = (void *)CFPreferencesCopyValue(a4, @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v7 = v6;
    if (v6)
    {
      LODWORD(v8) = [v6 BOOLValue];
      if (v8 == v5) {
        goto LABEL_12;
      }
    }
    else if (!v5)
    {
      LOBYTE(v8) = 0;
      goto LABEL_12;
    }
    uint64_t v8 = [NSNumber numberWithBool:v5];
    _CSPreferencesSetValueForKeyFromRoot(v8, a4);

    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
    LOBYTE(v8) = v5;
LABEL_12:

    return (char)v8;
  }
  int v9 = CSLogContextFacilityCoreSpeech;
  LOBYTE(v8) = 0;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[CSFPreferences enableAudioInjection:withKey:]";
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s enableAudioInection: is only available on internal builds", (uint8_t *)&v11, 0xCu);
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)exclaveAudioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && exclaveAudioInjectionEnabled_onceToken != -1) {
    dispatch_once(&exclaveAudioInjectionEnabled_onceToken, &__block_literal_global_268);
  }
  return exclaveAudioInjectionEnabled_enabled;
}

void __46__CSFPreferences_exclaveAudioInjectionEnabled__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v0 = (void *)CFPreferencesCopyValue(@"Exclave Audio Injection Enabled", @"com.apple.voicetrigger.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v1 = v0;
  if (v0) {
    exclaveAudioInjectionEnabled_enabled = [v0 BOOLValue];
  }
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = @"YES";
    if (!exclaveAudioInjectionEnabled_enabled) {
      id v3 = @"NO";
    }
    int v4 = 136315394;
    BOOL v5 = "-[CSFPreferences exclaveAudioInjectionEnabled]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)enableExclaveAudioInjection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    BOOL v5 = (void *)CFPreferencesCopyValue(@"Exclave Audio Injection Enabled", @"com.apple.voicetrigger.notbackedup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    __int16 v6 = v5;
    if (v5)
    {
      LODWORD(v7) = [v5 BOOLValue];
      if (v7 == v3) {
        goto LABEL_13;
      }
    }
    else if (!v3)
    {
      LOBYTE(v7) = 0;
      goto LABEL_13;
    }
    uint64_t v7 = [NSNumber numberWithBool:v3];
    CFPreferencesSetValue(@"Exclave Audio Injection Enabled", v7, @"com.apple.voicetrigger.notbackedup", @"mobile", v4);

    CFPreferencesAppSynchronize(@"com.apple.voicetrigger.notbackedup");
    LOBYTE(v7) = v3;
LABEL_13:

    return (char)v7;
  }
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSFPreferences enableExclaveAudioInjection:]";
    _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Exclave Audio Injection is only available on internal builds", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v7) = 0;
  return (char)v7;
}

void __51__CSFPreferences_programmableAudioInjectionEnabled__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v0 = (void *)CFPreferencesCopyValue(@"Programmable Audio Injection Enabled", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v1 = v0;
  if (v0) {
    programmableAudioInjectionEnabled_enabled = [v0 BOOLValue];
  }
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = @"YES";
    if (!programmableAudioInjectionEnabled_enabled) {
      BOOL v3 = @"NO";
    }
    int v4 = 136315394;
    BOOL v5 = "-[CSFPreferences programmableAudioInjectionEnabled]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)useSpeexForAudioInjection
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && useSpeexForAudioInjection_onceToken != -1) {
    dispatch_once(&useSpeexForAudioInjection_onceToken, &__block_literal_global_258);
  }
  return useSpeexForAudioInjection_enabled;
}

void __43__CSFPreferences_useSpeexForAudioInjection__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Speex Audio Injection Enabled", @"com.apple.voicetrigger");
  if (v0)
  {
    id v1 = v0;
    useSpeexForAudioInjection_enabled = [v0 BOOLValue];
    CFPropertyListRef v0 = v1;
  }
}

- (BOOL)enableProgrammableAudioInjection:(BOOL)a3
{
  return [(CSFPreferences *)self enableAudioInjection:a3 withKey:@"Programmable Audio Injection Enabled"];
}

- (BOOL)audioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal && audioInjectionEnabled_onceToken != -1) {
    dispatch_once(&audioInjectionEnabled_onceToken, &__block_literal_global_253);
  }
  return audioInjectionEnabled_enabled;
}

void __39__CSFPreferences_audioInjectionEnabled__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v0 = (void *)CFPreferencesCopyValue(@"Audio Injection Enabled", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v1 = v0;
  if (v0) {
    audioInjectionEnabled_enabled = [v0 BOOLValue];
  }
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = @"YES";
    if (!audioInjectionEnabled_enabled) {
      BOOL v3 = @"NO";
    }
    int v4 = 136315394;
    BOOL v5 = "-[CSFPreferences audioInjectionEnabled]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)enableBenchmarkService:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__CSFPreferences_enableBenchmarkService___block_invoke;
    v7[3] = &unk_1E62000B0;
    v7[4] = &buf;
    BOOL v8 = a3;
    if (enableBenchmarkService__onceToken != -1) {
      dispatch_once(&enableBenchmarkService__onceToken, v7);
    }
    BOOL v4 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v5 = CSLogContextFacilityCoreSpeech;
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSFPreferences enableBenchmarkService:]";
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s benchmarkService: is only avaiable on internal builds", (uint8_t *)&buf, 0xCu);
      return 0;
    }
  }
  return v4;
}

void __41__CSFPreferences_enableBenchmarkService___block_invoke(uint64_t a1)
{
  id v2 = (void *)CFPreferencesCopyValue(@"Enable Model Benchmarking", @"com.apple.voicetrigger", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v5 = v2;
  if (v2) {
    LODWORD(v2) = [v2 BOOLValue];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (_BYTE)v2;
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    BOOL v4 = [NSNumber numberWithBool:v3 != 0];
    _CSPreferencesSetValueForKeyFromRoot(v4, @"Enable Model Benchmarking");

    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)enableAudioInjection:(BOOL)a3
{
  return [(CSFPreferences *)self enableAudioInjection:a3 withKey:@"Audio Injection Enabled"];
}

- (BOOL)myriadFileLoggingEnabled
{
  if (myriadFileLoggingEnabled_onceToken != -1) {
    dispatch_once(&myriadFileLoggingEnabled_onceToken, &__block_literal_global_242_7548);
  }
  return myriadFileLoggingEnabled_enabled;
}

void __42__CSFPreferences_myriadFileLoggingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Myriad File Logging Enabled", @"com.apple.voicetrigger");
    if (v0)
    {
      id v1 = v0;
      myriadFileLoggingEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (id)interstitialAbsoluteDirForLevel:(int64_t)a3
{
  id v5 = [(CSFPreferences *)self baseDir];
  __int16 v6 = [(CSFPreferences *)self interstitialRelativeDirForLevel:a3];
  uint64_t v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (id)interstitialRelativeDirForLevel:(int64_t)a3
{
  int v3 = objc_msgSend(NSString, "stringWithFormat:", @"%u", a3);
  BOOL v4 = [@"VoiceTrigger/interstitial" stringByAppendingPathComponent:v3];

  return v4;
}

- (double)remoteVoiceTriggerEndpointTimeoutWithDefault:(double)a3
{
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"Remote VoiceTrigger Endpoint Timeout", @"com.apple.voicetrigger");
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    a3 = v6;
  }

  return a3;
}

- (double)remoteVoiceTriggerDelayTime
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Remote VoiceTrigger Delay", @"com.apple.voicetrigger");
  int v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)_isDirectory:(id)a3
{
  BOOL v7 = 0;
  int v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  double v5 = [v3 defaultManager];
  [v5 fileExistsAtPath:v4 isDirectory:&v7];

  return v7;
}

- (id)getStartOfSpeechAudioLogFilePath
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [(CSFPreferences *)self baseDir];
  int v3 = [v2 stringByAppendingPathComponent:@"Logs/CrashReporter/CoreSpeech/sos/"];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3 isDirectory:0];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    char v8 = [v7 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v6 = v19;

    if ((v8 & 1) == 0)
    {
      int v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v17 = v9;
        v18 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 136315650;
        v21 = "-[CSFPreferences getStartOfSpeechAudioLogFilePath]";
        __int16 v22 = 2114;
        v23 = v3;
        __int16 v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't create SoS log directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      int v3 = @"/tmp";
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v10 setDateFormat:@"yyyyMMdd_HHmmss.SSS"];
  char v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [v10 stringFromDate:v11];

  uint64_t v13 = &stru_1F13A10B0;
  if (v12) {
    uint64_t v13 = v12;
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@/%@", v3, v13];
  uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  return v15;
}

- (void)clearMyriadSettingsOnAccessory:(id)a3
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Accessory Media Playback Interrupted Time";
  v7[1] = @"Accessory Media Playback Status";
  v7[2] = @"Accessory Alarm Playback Status";
  v7[3] = @"Accessory Timer Playback Status";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v7 count:4];
  [(CSFPreferences *)self _clearAccessorySettingForKeys:v6 forAccessory:v5];
}

- (void)clearTimerPlayingStatusOnAccessory:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = @"Accessory Timer Playback Status";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);
}

- (void)setIsTimerPlayingOnAccessory:(id)a3 isTimerPlaying:(BOOL)a4
{
}

- (BOOL)isTimerPlayingOnAccessory:(id)a3
{
  return [(CSFPreferences *)self getBooleanAccessorySettingValueForKey:@"Accessory Timer Playback Status" forAccessory:a3];
}

- (void)clearAlarmPlayingStatusOnAccessory:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = @"Accessory Alarm Playback Status";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);
}

- (void)setIsAlarmPlayingOnAccessory:(id)a3 isAlarmPlaying:(BOOL)a4
{
}

- (BOOL)isAlarmPlayingOnAccessory:(id)a3
{
  return [(CSFPreferences *)self getBooleanAccessorySettingValueForKey:@"Accessory Alarm Playback Status" forAccessory:a3];
}

- (void)clearMediaPlayingStatusOnAccessory:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = @"Accessory Media Playback Status";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);
}

- (BOOL)isMediaPlayingOnAccessory:(id)a3
{
  return [(CSFPreferences *)self getBooleanAccessorySettingValueForKey:@"Accessory Media Playback Status" forAccessory:a3];
}

- (void)clearMediaPlaybackInterruptedTimeOnAccessory:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = @"Accessory Media Playback Interrupted Time";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);
}

- (double)getMediaPlaybackInterruptedTime:(id)a3
{
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"RemoraDevices", @"com.apple.voicetrigger");
  double v5 = 0.0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v3)
      {
        id v6 = [v4 objectForKey:v3];
        if (v6)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v7 = [v6 objectForKey:@"Accessory Media Playback Interrupted Time"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v7 doubleValue];
              double v5 = v8;
            }
          }
        }
      }
      else
      {
        id v6 = (void *)CFPreferencesCopyAppValue(@"Accessory Media Playback Interrupted Time", @"com.apple.voicetrigger");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 doubleValue];
          double v5 = v9;
        }
      }
    }
  }

  return v5;
}

- (void)_clearAccessorySettingForKeys:(id)a3 forAccessory:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"RemoraDevices", @"com.apple.voicetrigger");
  if (v7)
  {
    double v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = (void *)[v8 mutableCopy];

      if (v6)
      {
        id v10 = [v9 objectForKey:v6];
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v11 = (void *)[v10 mutableCopy];
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            id v12 = v5;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v18;
              do
              {
                uint64_t v16 = 0;
                do
                {
                  if (*(void *)v18 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  objc_msgSend(v11, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
                }
                while (v14 != v16);
                uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
              }
              while (v14);
            }

            [v9 setObject:v11 forKey:v6];
            _CSPreferencesSetValueForKey(v9, @"RemoraDevices");
          }
        }
      }
    }
    else
    {
      double v9 = v8;
    }
  }
  else
  {
    double v9 = 0;
  }
}

- (BOOL)getBooleanAccessorySettingValueForKey:(id)a3 forAccessory:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  CFPropertyListRef v7 = (void *)CFPreferencesCopyAppValue(@"RemoraDevices", @"com.apple.voicetrigger");
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v6)
    {
      double v8 = [v7 objectForKey:v6];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v9 = [v8 objectForKey:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v10 = [v9 BOOLValue];
        }
        else {
          int v10 = 0;
        }
      }
      else
      {
        int v10 = 0;
      }

      char v11 = v10 != 0;
    }
    else
    {
      id v12 = (void *)CFPreferencesCopyAppValue(v5, @"com.apple.voicetrigger");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v11 = [v12 BOOLValue];
      }
      else {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)setMediaPlayingSettingForAccessory:(id)a3 isMediaPlaying:(BOOL)a4 isInterrupted:(BOOL)a5 interruptedTime:(double)a6
{
  BOOL v7 = a5;
  if (a3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__CSFPreferences_setMediaPlayingSettingForAccessory_isMediaPlaying_isInterrupted_interruptedTime___block_invoke;
    v10[3] = &__block_descriptor_42_e50___NSMutableDictionary_16__0__NSMutableDictionary_8l;
    BOOL v11 = a4;
    BOOL v12 = a5;
    *(double *)&v10[4] = a6;
    [(CSFPreferences *)self _updatePreferenceSettingsForAccessory:a3 settingsUpdateBlock:v10];
  }
  else
  {
    double v8 = [NSNumber numberWithBool:a4];
    _CSPreferencesSetValueForKey(v8, @"Accessory Media Playback Status");

    if (v7)
    {
      id v9 = [NSNumber numberWithDouble:a6];
      _CSPreferencesSetValueForKey(v9, @"Accessory Media Playback Interrupted Time");
    }
  }
}

id __98__CSFPreferences_setMediaPlayingSettingForAccessory_isMediaPlaying_isInterrupted_interruptedTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v3 setObject:v4 forKey:@"Accessory Media Playback Status"];

    if (*(unsigned char *)(a1 + 41))
    {
      id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      [v3 setObject:v5 forKey:@"Accessory Media Playback Interrupted Time"];
    }
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setBooleanAccessorySettingValue:(BOOL)a3 forKey:(id)a4 forAccessory:(id)a5
{
  BOOL v6 = a3;
  double v8 = (__CFString *)a4;
  id v9 = v8;
  if (a5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CSFPreferences_setBooleanAccessorySettingValue_forKey_forAccessory___block_invoke;
    v11[3] = &unk_1E6200068;
    BOOL v13 = v6;
    BOOL v12 = v8;
    [(CSFPreferences *)self _updatePreferenceSettingsForAccessory:a5 settingsUpdateBlock:v11];
  }
  else
  {
    int v10 = [NSNumber numberWithBool:v6];
    _CSPreferencesSetValueForKey(v10, v9);
  }
}

id __70__CSFPreferences_setBooleanAccessorySettingValue_forKey_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v3 setObject:v4 forKey:*(void *)(a1 + 32)];

    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_updatePreferenceSettingsForAccessory:(id)a3 settingsUpdateBlock:(id)a4
{
  id v13 = a3;
  id v5 = (void (**)(id, id))a4;
  BOOL v6 = (void *)CFPreferencesCopyAppValue(@"RemoraDevices", @"com.apple.voicetrigger");
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = (id)[v6 mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  double v8 = v7;

  if (v13)
  {
    id v9 = objc_msgSend(v8, "objectForKey:");
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v10 = (id)[v9 mutableCopy];
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    BOOL v11 = v10;
    BOOL v12 = v5[2](v5, v10);
    if (v12)
    {
      [v8 setObject:v12 forKey:v13];
      _CSPreferencesSetValueForKey(v8, @"RemoraDevices");
    }
  }
}

- (BOOL)forceVoiceTriggerAOPMode
{
  if (forceVoiceTriggerAOPMode_onceToken != -1) {
    dispatch_once(&forceVoiceTriggerAOPMode_onceToken, &__block_literal_global_177_7592);
  }
  return forceVoiceTriggerAOPMode_result;
}

void __42__CSFPreferences_forceVoiceTriggerAOPMode__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Force VoiceTrigger AOP Mode", @"com.apple.voicetrigger");
    id v1 = v0;
    if (v0) {
      forceVoiceTriggerAOPMode_result = [v0 BOOLValue];
    }
    id v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = @"YES";
      if (!forceVoiceTriggerAOPMode_result) {
        id v3 = @"NO";
      }
      int v4 = 136315394;
      id v5 = "-[CSFPreferences forceVoiceTriggerAOPMode]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v3;
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Force enabling VoiceTrigger AOP mode ? %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)forceVoiceTriggerAPMode
{
  if (forceVoiceTriggerAPMode_onceToken != -1) {
    dispatch_once(&forceVoiceTriggerAPMode_onceToken, &__block_literal_global_166_7598);
  }
  return forceVoiceTriggerAPMode_result;
}

void __41__CSFPreferences_forceVoiceTriggerAPMode__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Force VoiceTrigger AP Mode", @"com.apple.voicetrigger");
    id v1 = v0;
    if (v0) {
      forceVoiceTriggerAPMode_result = [v0 BOOLValue];
    }
    id v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = @"YES";
      if (!forceVoiceTriggerAPMode_result) {
        id v3 = @"NO";
      }
      int v4 = 136315394;
      id v5 = "-[CSFPreferences forceVoiceTriggerAPMode]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v3;
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Force enabling VoiceTrigger AP mode ? %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)startOfSpeechAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"Enable SoS Audio Logging", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)getJarvisTriggerMode
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"Jarvis Trigger Mode", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (void)setJarvisTriggerMode:(int64_t)a3
{
  int v4 = 5;
  while (1)
  {
    id v5 = [NSNumber numberWithInteger:a3];
    _CSPreferencesSetValueForKey(v5, @"Jarvis Trigger Mode");

    CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
    __int16 v6 = (void *)CFPreferencesCopyAppValue(@"Jarvis Trigger Mode", @"com.apple.voicetrigger");
    id v7 = v6;
    if (v6)
    {
      if ([v6 integerValue] == a3) {
        break;
      }
    }

    if (!--v4) {
      goto LABEL_7;
    }
  }

LABEL_7:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification", 0, 0, 1u);
}

- (BOOL)jarvisAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"Jarvis Audio Logging Enabled", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)personalizedSiriEnrollmentAudioLoggingEnabledFromRoot
{
  if (personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_onceToken != -1) {
    dispatch_once(&personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_onceToken, &__block_literal_global_153);
  }
  return personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_audioLoggingEnabled;
}

void __71__CSFPreferences_personalizedSiriEnrollmentAudioLoggingEnabledFromRoot__block_invoke()
{
  CFPropertyListRef v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.voicetrigger.notbackedup.plist"];
  if (v0)
  {
    id v3 = v0;
    id v1 = [v0 objectForKeyedSubscript:@"Personalized Siri Enrollment Audio Logging Enabled"];

    CFPropertyListRef v0 = v3;
    if (v1)
    {
      id v2 = [v3 objectForKeyedSubscript:@"Personalized Siri Enrollment Audio Logging Enabled"];
      personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_audioLoggingEnabled = [v2 BOOLValue];

      CFPropertyListRef v0 = v3;
    }
  }
}

- (BOOL)personalizedSiriEnrollmentAudioLoggingEnabled
{
  if (personalizedSiriEnrollmentAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&personalizedSiriEnrollmentAudioLoggingEnabled_onceToken, &__block_literal_global_148);
  }
  return personalizedSiriEnrollmentAudioLoggingEnabled_audioLoggingEnabled;
}

uint64_t __63__CSFPreferences_personalizedSiriEnrollmentAudioLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Personalized Siri Enrollment Audio Logging Enabled", @"com.apple.voicetrigger.notbackedup");
  if (v0) {
    LOBYTE(v0) = [v0 BOOLValue];
  }
  personalizedSiriEnrollmentAudioLoggingEnabled_audioLoggingEnabled = (char)v0;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)speakerRecognitionAudioLoggingEnabled
{
  if (speakerRecognitionAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&speakerRecognitionAudioLoggingEnabled_onceToken, &__block_literal_global_143);
  }
  return speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging;
}

void __55__CSFPreferences_speakerRecognitionAudioLoggingEnabled__block_invoke()
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Speaker Recognition Audio Logging Enabled", @"com.apple.voicetrigger");
    if (v0) {
      LOBYTE(v0) = [v0 BOOLValue];
    }
    speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging = (char)v0;
    MEMORY[0x1F41817F8]();
  }
  else
  {
    speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging = 0;
  }
}

- (BOOL)secondPassAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"Second Pass Audio Logging Enabled", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)myriadHashFilePath
{
  id v2 = [(CSFPreferences *)self myriadHashDirectory];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];
  }
  __int16 v6 = [v2 stringByAppendingPathComponent:@"siriBC"];

  return v6;
}

- (id)myriadHashDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"VoiceTrigger"];

  return v3;
}

- (id)assistantAudioFileLogDirectory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(CSFPreferences *)self assistantLogDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"SpeechLogs"];

  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      BOOL v11 = "-[CSFPreferences assistantAudioFileLogDirectory]";
      __int16 v12 = 2114;
      id v13 = v3;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Couldn't create speech log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v3;
}

- (id)assistantLogDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"/Logs/CrashReporter/Assistant/"];

  return v3;
}

- (id)trialBaseAssetDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"VoiceTrigger/TrialAssetData"];

  return v3;
}

- (id)getSSVLogFilePathWithSessionIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CSFPreferences *)self baseDir];
  id v6 = [v5 stringByAppendingPathComponent:@"Logs/CrashReporter/Assistant/smartSiriVolumeContextAwareLogs/"];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6 isDirectory:0];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    char v11 = [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v9 = v17;

    if ((v11 & 1) == 0)
    {
      __int16 v12 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        id v15 = v12;
        uint64_t v16 = [v9 localizedDescription];
        *(_DWORD *)long long buf = 136315650;
        long long v19 = "-[CSFPreferences getSSVLogFilePathWithSessionIdentifier:]";
        __int16 v20 = 2114;
        v21 = v6;
        __int16 v22 = 2114;
        v23 = v16;
        _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Couldn't create SSV log directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      id v6 = @"/tmp";
    }
  }
  id v13 = [NSString stringWithFormat:@"%@/SSV_%@.json", v6, v4];

  return v13;
}

- (id)ssvLogDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"/Logs/CrashReporter/Assistant/smartSiriVolumeContextAwareLogs/"];

  return v3;
}

- (id)remoteGradingDataDirectory
{
  id v2 = [(CSFPreferences *)self remoteP2pLogDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"RemoteGradingData/"];

  return v3;
}

- (id)remoteP2pLogDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"VoiceTrigger/RemoteP2PLogs/"];

  return v3;
}

- (id)mhLogDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"/Logs/CrashReporter/Assistant/MHLog/"];

  return v3;
}

- (id)getRPIAssistantAudioSamplingDateSubDirectory:(id)a3
{
  id v4 = a3;
  char v5 = +[CSUtils defaultDateFormatter];
  id v6 = [v5 stringFromDate:v4];

  id v7 = [(CSFPreferences *)self getRPIAssistantAudioSamplingDirectory];
  char v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

- (id)getRPIAssistantAudioSamplingDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [MEMORY[0x1E4F4E3D0] sampledSubDirectoryPath];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  char v5 = [v4 stringByAppendingPathComponent:@"RPIAssistantSampledAudio"];

  return v5;
}

- (id)getOnDeviceCompilationCacheDirectoryForBenchmark
{
  id v2 = [(CSFPreferences *)self _getCoreSpeechGroupContainerPath];
  id v3 = [v2 stringByAppendingPathComponent:@"Caches/benchmarkTempOnDeviceCompilationCaches/Siri/"];

  return v3;
}

- (id)getOnDeviceCompilationCacheDirectory
{
  id v2 = [(CSFPreferences *)self _getCoreSpeechGroupContainerPath];
  id v3 = [v2 stringByAppendingPathComponent:@"Caches/onDeviceCompilationCaches/"];

  return v3;
}

- (id)getLegacyOnDeviceCompilationCacheDirectory
{
  id v2 = [(CSFPreferences *)self baseDir];
  id v3 = [v2 stringByAppendingPathComponent:@"Caches/CoreSpeech/"];

  return v3;
}

- (id)geckoAudioLogDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CSFPreferences_geckoAudioLogDirectory__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  if (geckoAudioLogDirectory_onceToken != -1) {
    dispatch_once(&geckoAudioLogDirectory_onceToken, block);
  }
  return (id)geckoAudioLogDirectory_path;
}

void __40__CSFPreferences_geckoAudioLogDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) baseDir];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"VoiceTrigger/nearmiss/audio/"];
  id v2 = (void *)geckoAudioLogDirectory_path;
  geckoAudioLogDirectory_path = v1;
}

- (id)voiceTriggerAudioLogDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CSFPreferences_voiceTriggerAudioLogDirectory__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  if (voiceTriggerAudioLogDirectory_onceToken != -1) {
    dispatch_once(&voiceTriggerAudioLogDirectory_onceToken, block);
  }
  return (id)voiceTriggerAudioLogDirectory_path;
}

void __47__CSFPreferences_voiceTriggerAudioLogDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) baseDir];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"Logs/CrashReporter/VoiceTrigger/audio/"];
  id v2 = (void *)voiceTriggerAudioLogDirectory_path;
  voiceTriggerAudioLogDirectory_path = v1;
}

- (id)baseDir
{
  if (+[CSUtils isDarwinOS])
  {
    id v2 = [@"/var/mobile" stringByAppendingPathComponent:@"Library"];
  }
  else
  {
    id v3 = CPSharedResourcesDirectory();
    id v2 = [v3 stringByAppendingPathComponent:@"Library"];
  }
  return v2;
}

- (void)setFileLoggingLevel:(id)a3
{
  _CSPreferencesSetValueForKey(a3, @"File Logging Level");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (id)fileLoggingLevel
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal) {
    id v2 = (void *)CFPreferencesCopyAppValue(@"File Logging Level", @"com.apple.voicetrigger");
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)disableAdaptiveSiriVolume:(id)a3
{
  _CSPreferencesSetValueForKey(a3, @"Adaptive Siri Volume Disabled");
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)_isAdaptiveSiriVolumeDisabled
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman)
  {
    if (CSIsHorsemanJunior_onceToken != -1) {
      dispatch_once(&CSIsHorsemanJunior_onceToken, &__block_literal_global_20);
    }
    if (!CSIsHorsemanJunior_isHorsemanJunior) {
      return 1;
    }
  }
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"Adaptive Siri Volume Disabled", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)fileLoggingIsEnabled
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    goto LABEL_7;
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 0;
  }
LABEL_7:
  id v3 = [(CSFPreferences *)self fileLoggingLevel];
  BOOL v4 = (int)[v3 intValue] > 0;

  return v4;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  if (a3) {
    id v3 = &unk_1F13B83F8;
  }
  else {
    id v3 = 0;
  }
  [(CSFPreferences *)self setFileLoggingLevel:v3];
}

- (BOOL)_storeModeEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.demo-settings");
  id v2 = CFPreferencesCopyAppValue(@"StoreDemoMode", @"com.apple.demo-settings");
  id v3 = v2;
  if (v2)
  {
    char v4 = [v2 BOOLValue];
    CFRelease(v3);
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (float)getAttendingTimeoutConfig
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    float v2 = 10.0;
  }
  else {
    float v2 = 0.0;
  }
  id v3 = (void *)CFPreferencesCopyAppValue(@"Attending Timeout", @"com.apple.voicetrigger");
  if (v3)
  {
    if (CSIsInternalBuild_onceToken != -1) {
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
    }
    if (CSIsInternalBuild_isInternal)
    {
      [v3 floatValue];
      float v2 = v4;
    }
  }
  char v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    char v8 = "-[CSFPreferences getAttendingTimeoutConfig]";
    __int16 v9 = 2048;
    double v10 = v2;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s attendingTimeout: %f", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

- (BOOL)twoShotNotificationEnabled
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal) {
    return 1;
  }
  float v2 = (void *)CFPreferencesCopyAppValue(@"Enable Two Shot Notification", @"com.apple.voicetrigger");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isDeferredAsrResultsEnabled
{
  if (isDeferredAsrResultsEnabled_onceToken != -1) {
    dispatch_once(&isDeferredAsrResultsEnabled_onceToken, &__block_literal_global_51);
  }
  return isDeferredAsrResultsEnabled_deferredASRResultsEnabled;
}

void __45__CSFPreferences_isDeferredAsrResultsEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Deferred ASR Delivery", @"com.apple.voicetrigger");
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      id v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
      CFPropertyListRef v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      id v1 = v0;
      isDeferredAsrResultsEnabled_deferredASRResultsEnabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isDeferredActivationEnabled
{
  return 0;
}

- (BOOL)isGazeSignalEnabled
{
  if (isGazeSignalEnabled_onceToken != -1) {
    dispatch_once(&isGazeSignalEnabled_onceToken, &__block_literal_global_46);
  }
  return isGazeSignalEnabled_enableGaze;
}

void __37__CSFPreferences_isGazeSignalEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Gaze Signal Needed", @"com.apple.voicetrigger");
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      id v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
      CFPropertyListRef v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      id v1 = v0;
      isGazeSignalEnabled_enableGaze = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isGazeMandatory
{
  if (isGazeMandatory_onceToken != -1) {
    dispatch_once(&isGazeMandatory_onceToken, &__block_literal_global_41_7699);
  }
  return isGazeMandatory_gazeNeeded;
}

void __33__CSFPreferences_isGazeMandatory__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"Gaze Mandatory", @"com.apple.voicetrigger");
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      id v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
      CFPropertyListRef v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      id v1 = v0;
      isGazeMandatory_gazeNeeded = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isGazeSimlModelEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CFPreferencesCopyAppValue(@"Gaze SIML Model Enabled", @"com.apple.voicetrigger");
  if (!v2) {
    goto LABEL_6;
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal) {
    int v3 = [v2 BOOLValue];
  }
  else {
LABEL_6:
  }
    int v3 = 1;
  char v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSFPreferences isGazeSimlModelEnabled]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s enabled:%u", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

- (BOOL)isAttentiveSiriAudioLoggingEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (isAttentiveSiriAudioLoggingEnabled_onceToken != -1) {
    dispatch_once(&isAttentiveSiriAudioLoggingEnabled_onceToken, &__block_literal_global_33);
  }
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    char v5 = "-[CSFPreferences isAttentiveSiriAudioLoggingEnabled]";
    __int16 v6 = 1024;
    int v7 = isAttentiveSiriAudioLoggingEnabled_enabled;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled:%u", (uint8_t *)&v4, 0x12u);
  }
  return isAttentiveSiriAudioLoggingEnabled_enabled;
}

void __52__CSFPreferences_isAttentiveSiriAudioLoggingEnabled__block_invoke()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"AttentiveSiri AudioLogging Enabled", @"com.apple.voicetrigger");
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      id v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
      CFPropertyListRef v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      id v1 = v0;
      isAttentiveSiriAudioLoggingEnabled_enabled = [v0 BOOLValue];
      CFPropertyListRef v0 = v1;
    }
  }
}

- (BOOL)isAttentiveSiriEnabled
{
  return +[CSUtils isAttentiveSiriEnabled];
}

- (void)setVoiceTriggerEverUsed
{
  if (setVoiceTriggerEverUsed_onceToken != -1) {
    dispatch_once(&setVoiceTriggerEverUsed_onceToken, &__block_literal_global_27_7712);
  }
}

uint64_t __41__CSFPreferences_setVoiceTriggerEverUsed__block_invoke()
{
  _CSPreferencesSetValueForKey(MEMORY[0x1E4F1CC38], @"VoiceTriggerEverUsed");
  return CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
}

- (BOOL)phraseSpotterEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  int v3 = (void *)CFPreferencesCopyAppValue(@"Phrase Detector Enabled", @"com.apple.voicetrigger");
  int v4 = v3;
  if (v3) {
    LOBYTE(v5) = [v3 BOOLValue];
  }
  else {
    int v5 = ![(CSFPreferences *)self _storeModeEnabled];
  }

  return v5;
}

- (BOOL)voiceTriggerEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.voicetrigger");
  int v3 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger Enabled", @"com.apple.voicetrigger");
  int v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    [(CSFPreferences *)self _storeModeEnabled];
    char v5 = 0;
  }

  return v5;
}

void __35__CSFPreferences_sharedPreferences__block_invoke()
{
  CFPropertyListRef v0 = objc_alloc_init(CSFPreferences);
  id v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;

  CSLogInitIfNeededWithSubsystemType(0);
}

@end