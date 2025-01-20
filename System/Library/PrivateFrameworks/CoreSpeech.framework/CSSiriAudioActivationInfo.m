@interface CSSiriAudioActivationInfo
+ (BOOL)_doesRecordRouteSupportZLL:(id)a3;
+ (BOOL)_requestIsUsingHFPWithRecordRoute:(id)a3 playbackRoute:(id)a4;
+ (BOOL)_shouldAllowRecordWhileBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4 supportsEchoCancellation:(BOOL)a5 speechRecordingMode:(int64_t)a6 recordingInfo:(id)a7;
+ (BOOL)_shouldPlayAlertIfNotPrelisteningForSpeechEvent:(int64_t)a3 isVoiceOverTouchEnabled:(BOOL)a4;
+ (id)_alertBehaviorForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 speechRecordingMode:(int64_t)a6 ringerState:(int64_t)a7 startingAlertBeepOverideID:(int64_t)a8 presentationMode:(int64_t)a9 usePrelistening:(BOOL)a10 isOnPhoneCall:(BOOL)a11 hasPlayedStartAlert:(BOOL)a12 supportsEchoCancellation:(BOOL)a13 isVoiceOverTouchEnabled:(BOOL)a14 isVibrationEnabled:(BOOL)a15 isVibrationSupported:(BOOL)a16 suppressStartAlert:(BOOL)a17 activationHostTime:(unint64_t)a18;
+ (id)_alertDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 ringerState:(int64_t)a6 startingAlertBeepOverideID:(int64_t)a7 presentationMode:(int64_t)a8 hasPlayedStartAlert:(BOOL)a9 supportsEchoCancellation:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11 isVibrationEnabled:(BOOL)a12 isVibrationSupported:(BOOL)a13 activationHostTime:(unint64_t)a14;
+ (id)_dictationAlertBehaviorDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 ringerState:(int64_t)a5 usePrelistening:(BOOL)a6 suppressStartAlert:(BOOL)a7 supportsEchoCancellation:(BOOL)a8 isVibrationEnabled:(BOOL)a9 isVibrationSupported:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11;
- (AFLanguageDetectionUserContext)languageDetectionUserContext;
- (AFSpeechRecordingAlertPolicy)speechRecordingAlertPolicy;
- (BOOL)_canUseZLL;
- (BOOL)_eventIsTVRemote;
- (BOOL)_eventIsVoiceTrigger;
- (BOOL)_isRequestFromSpokenNotification:(int64_t)a3;
- (BOOL)_isSystemHapticEnabled;
- (BOOL)_isVibrationDisabledInAccessibility;
- (BOOL)_isVoiceOverTouchEnabledInAccessibility;
- (BOOL)_shouldSkipStartRecordingAlertForRecordingInfo:(id)a3;
- (BOOL)canEnterTwoShot;
- (BOOL)canGetPCMStream;
- (BOOL)canPrepareWithoutInterruption;
- (BOOL)canPrewarm;
- (BOOL)hasPlayedStartAlert;
- (BOOL)isOnPhoneCall;
- (BOOL)isSpokenNotification;
- (BOOL)isTriggerlessFollowup;
- (BOOL)needsUpdateToPostVoiceMode;
- (BOOL)requiresBorealisConsumerCheck;
- (BOOL)shouldExplicitlyPlayAlertOnStart;
- (BOOL)shouldPlayAlertIfNotPrelistening;
- (BOOL)shouldSuppressRecordingErrorAlert;
- (BOOL)shouldSuppressRecordingStopAlert;
- (BOOL)useBorealisBuffer;
- (BOOL)usePrelistening;
- (CSSiriAudioActivationInfo)initWithSpeechRecordingMode:(int64_t)a3 clientConfiguration:(id)a4 experimentContext:(id)a5;
- (NSDictionary)activationMetadata;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationDisplayName;
- (NSString)deviceIdentifier;
- (NSUUID)turnIdentifier;
- (double)activationSystemUptime;
- (id)_appendDictationApplicationInfoSettings:(id)a3;
- (id)_audioSessionActiveDelayCoreSpeechWithType:(unint64_t)a3;
- (id)_audioSessionActiveDelayOverride;
- (id)_audioSessionActiveDelayServerConfiguration;
- (id)_audioSessionActiveDelayUserPerceptionWithType:(unint64_t)a3;
- (id)audioSessionActivationTargetDate;
- (id)dateByAddingTimeIntervalSinceActivation:(double)a3;
- (id)description;
- (id)recordContext;
- (id)recordContextForSpeechEvent:(int64_t)a3;
- (id)recordSettingsWithOptions:(unint64_t)a3 appendingSettings:(id)a4;
- (id)startRecordingSettingsWithRecordRoute:(id)a3 recordingInfo:(id)a4 playbackRoute:(id)a5;
- (id)startingAlertBeepURL;
- (int64_t)_activationMode;
- (int64_t)_csAudioRecordType;
- (int64_t)_csAudioRecordTypeForSpeechRequestOptions:(id)a3 useBorealisBuffer:(BOOL)a4 currentClientConfiguration:(id)a5;
- (int64_t)audioAlertStyle;
- (int64_t)dictationInputOrigin;
- (int64_t)event;
- (int64_t)overrideStartingAlertBeepSoundID;
- (int64_t)presentationMode;
- (int64_t)saeToneIDWithCarPlayConnected:(BOOL)a3;
- (int64_t)speechEndpointerOperationMode;
- (int64_t)speechEvent;
- (int64_t)speechRecordingMode;
- (int64_t)twoShotFeedbackAlertOverrideForRecordRoute:(id)a3 playbackRoute:(id)a4 deviceSupportsVibrator:(BOOL)a5 deviceSupportsEC:(BOOL)a6;
- (int64_t)twoShotPromptTypeForRecordRoute:(id)a3 playbackRoute:(id)a4;
- (unint64_t)activationHostTime;
- (unint64_t)beginUpdateToPostVoice;
- (unint64_t)buttonDownHostTime;
- (unint64_t)dictationVoiceTriggerAbsStartSampleId;
- (unint64_t)voiceTriggerEndHostTime;
- (void)audioSessionActivated;
- (void)endUpdateToPostVoiceWithContext:(unint64_t)a3 success:(BOOL)a4;
- (void)setClientConfiguration:(id)a3;
- (void)setSpeechRecordingMode:(int64_t)a3;
- (void)setSpeechRequestOptions:(id)a3 currentActivationInfo:(id)a4;
@end

@implementation CSSiriAudioActivationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_activationMetadata, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_magusSupportedPolicy, 0);
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_currentClientConfiguration, 0);
}

- (unint64_t)dictationVoiceTriggerAbsStartSampleId
{
  return self->_dictationVoiceTriggerAbsStartSampleId;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (BOOL)isSpokenNotification
{
  return self->_isSpokenNotification;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (AFSpeechRecordingAlertPolicy)speechRecordingAlertPolicy
{
  return self->_speechRecordingAlertPolicy;
}

- (int64_t)speechEndpointerOperationMode
{
  return self->_speechEndpointerOperationMode;
}

- (BOOL)hasPlayedStartAlert
{
  return self->_hasPlayedStartAlert;
}

- (NSDictionary)activationMetadata
{
  return self->_activationMetadata;
}

- (BOOL)isOnPhoneCall
{
  return self->_isOnPhoneCall;
}

- (void)setSpeechRecordingMode:(int64_t)a3
{
  self->_speechRecordingMode = a3;
}

- (int64_t)speechRecordingMode
{
  return self->_speechRecordingMode;
}

- (unint64_t)voiceTriggerEndHostTime
{
  return self->_voiceTriggerEndHostTime;
}

- (unint64_t)buttonDownHostTime
{
  return self->_buttonDownHostTime;
}

- (unint64_t)activationHostTime
{
  return self->_activationHostTime;
}

- (double)activationSystemUptime
{
  return self->_activationSystemUptime;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)audioAlertStyle
{
  return self->_audioAlertStyle;
}

- (BOOL)usePrelistening
{
  return self->_usePrelistening;
}

- (BOOL)useBorealisBuffer
{
  return self->_useBorealisBuffer;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (id)_audioSessionActiveDelayServerConfiguration
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    double activeMediaPlaybackVolume = self->_activeMediaPlaybackVolume;
    int v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    __int16 v21 = 2048;
    double v22 = activeMediaPlaybackVolume;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s double activeMediaPlaybackVolume = %f", (uint8_t *)&v19, 0x16u);
  }
  if (self->_activeMediaPlaybackVolume <= 0.0) {
    goto LABEL_11;
  }
  v6 = [MEMORY[0x1E4F5D3F0] sharedPreferences];
  v7 = [v6 serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay];

  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    __int16 v21 = 2112;
    double v22 = *(double *)&v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s mediaPlaybackVolumeThreshold = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!v7
    || ([v7 floatValue], v9 <= 0.0)
    || ([v7 floatValue], v10 >= 1.0)
    || (float v11 = self->_activeMediaPlaybackVolume, [v7 floatValue], v11 < v12))
  {

LABEL_11:
    v13 = [MEMORY[0x1E4F5D3F0] sharedPreferences];
    v14 = [v13 serverAudioSessionActivationDelay];

    v15 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
      __int16 v21 = 2112;
      double v22 = *(double *)&v14;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Default)", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_13;
  }
  v17 = [MEMORY[0x1E4F5D3F0] sharedPreferences];
  v14 = [v17 serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold];

  v18 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayServerConfiguration]";
    __int16 v21 = 2112;
    double v22 = *(double *)&v14;
    _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Above Media Playback Volume Threshold)", (uint8_t *)&v19, 0x16u);
  }

  if (!v14) {
    goto LABEL_11;
  }
LABEL_13:
  return v14;
}

- (id)_audioSessionActiveDelayOverride
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5D3F0] sharedPreferences];
  v3 = [v2 overrideAudioSessionActiveDelay];

  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayOverride]";
    __int16 v8 = 2112;
    float v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)_audioSessionActiveDelayUserPerceptionWithType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CSSiriAudioActivationInfo__audioSessionActiveDelayUserPerceptionWithType___block_invoke;
  v12[3] = &unk_1E658AEF8;
  v12[4] = self;
  uint64_t v4 = MEMORY[0x1CB785210](v12, a2, a3);
  v5 = (void (**)(void, void))v4;
  if (self->_speechEvent == 15)
  {
    int v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, &unk_1F23C4EA8);
    v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
      __int16 v15 = 2112;
      v16 = v6;
      __int16 v8 = "%s audioSessionActiveDelay = %@ (Hearst Voice)";
LABEL_8:
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, v8, buf, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ([MEMORY[0x1E4F15510] supportsDuckingOnSpeakerOutput] && self->_speechEvent == 8)
  {
    int v6 = ((void (**)(void, void *))v5)[2](v5, &unk_1F23C4EA8);
    v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
      __int16 v15 = 2112;
      v16 = v6;
      __int16 v8 = "%s audioSessionActiveDelay = %@ (Built In Voice)";
      goto LABEL_8;
    }
LABEL_9:
    id v9 = v6;
    goto LABEL_13;
  }
  uint64_t v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayUserPerceptionWithType:]";
    __int16 v15 = 2112;
    v16 = 0;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (Others)", buf, 0x16u);
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

id __76__CSSiriAudioActivationInfo__audioSessionActiveDelayUserPerceptionWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _audioSessionActiveDelayOverride];
  if (!v4)
  {
    id v4 = [*(id *)(a1 + 32) _audioSessionActiveDelayServerConfiguration];
    if (!v4) {
      id v4 = v3;
    }
  }

  return v4;
}

- (id)_audioSessionActiveDelayCoreSpeechWithType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_speechEvent == 17)
  {
    id v3 = *MEMORY[0x1E4F4E380];
    id v4 = &unk_1F23C4E98;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    int v11 = 136315394;
    float v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
    __int16 v13 = 2112;
    v14 = &unk_1F23C4E98;
    v5 = "%s audioSessionActiveDelay = %@ (Triggerless Listening)";
LABEL_7:
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v11, 0x16u);
    goto LABEL_11;
  }
  if (AFSupportsAudioSessionCoordination())
  {
    id v3 = *MEMORY[0x1E4F4E380];
    id v4 = &unk_1F23C4E98;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    int v11 = 136315394;
    float v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
    __int16 v13 = 2112;
    v14 = &unk_1F23C4E98;
    v5 = "%s audioSessionActiveDelay = %@ (Audio Session Coordination)";
    goto LABEL_7;
  }
  __int16 v8 = [(CSSiriAudioActivationInfo *)self _audioSessionActiveDelayUserPerceptionWithType:a3];
  id v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    float v12 = "-[CSSiriAudioActivationInfo _audioSessionActiveDelayCoreSpeechWithType:]";
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s audioSessionActiveDelay = %@ (User Perception)", (uint8_t *)&v11, 0x16u);
  }
  id v4 = v8;
LABEL_11:

  return v4;
}

- (BOOL)_isVibrationDisabledInAccessibility
{
  v2 = [(AFClientConfiguration *)self->_currentClientConfiguration accessibilityState];
  uint64_t v3 = [v2 isVibrationDisabled];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F4E390] sharedObserver];
    v5 = [v4 state];
    uint64_t v3 = [v5 isVibrationDisabled];
  }
  return v3 == 2;
}

- (BOOL)_isSystemHapticEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.preferences.sounds"];
  uint64_t v3 = [v2 objectForKey:@"effects-haptic"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_isVoiceOverTouchEnabledInAccessibility
{
  v2 = [(AFClientConfiguration *)self->_currentClientConfiguration accessibilityState];
  uint64_t v3 = [v2 isVoiceOverTouchEnabled];

  if (!v3)
  {
    char v4 = [MEMORY[0x1E4F4E390] sharedObserver];
    v5 = [v4 state];
    uint64_t v3 = [v5 isVoiceOverTouchEnabled];
  }
  return v3 == 2;
}

- (id)dateByAddingTimeIntervalSinceActivation:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  int v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v25 = 136315394;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    __int16 v27 = 2048;
    double v28 = a3;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s timeInterval = %f", (uint8_t *)&v25, 0x16u);
  }
  if (AFSpeechEventIsVoiceTrigger())
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t voiceTriggerEndHostTime = self->_voiceTriggerEndHostTime;
      int v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      __int16 v27 = 2048;
      double v28 = *(double *)&voiceTriggerEndHostTime;
      _os_log_debug_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEBUG, "%s unint64_t voiceTriggerEndHostTime = %llu", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v8 = 128;
  }
  else
  {
    id v9 = *v5;
    if (self->_speechEvent != 1) {
      goto LABEL_13;
    }
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t buttonDownHostTime = self->_buttonDownHostTime;
      int v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      __int16 v27 = 2048;
      double v28 = *(double *)&buttonDownHostTime;
      _os_log_debug_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEBUG, "%s unint64_t buttonDownHostTime = %llu", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v8 = 120;
  }
  if (*(Class *)((char *)&self->super.isa + v8))
  {
LABEL_16:
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    float v12 = [v10 dateWithTimeIntervalSinceNow:a3 - v11];
    goto LABEL_17;
  }
  id v9 = *v5;
LABEL_13:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v22 = self->_buttonDownHostTime;
    int v25 = 136315394;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    __int16 v27 = 2048;
    double v28 = *(double *)&v22;
    _os_log_debug_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEBUG, "%s activationHostTime = %llu", (uint8_t *)&v25, 0x16u);
  }
  if (self->_activationHostTime) {
    goto LABEL_16;
  }
  double activationSystemUptime = self->_activationSystemUptime;
  if (activationSystemUptime <= 0.0)
  {
    float v12 = 0;
  }
  else
  {
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 136315394;
      v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
      __int16 v27 = 2048;
      double v28 = activationSystemUptime;
      _os_log_debug_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEBUG, "%s double activationSystemUptime = %f", (uint8_t *)&v25, 0x16u);
    }
    int v19 = (void *)MEMORY[0x1E4F1C9C8];
    v20 = [MEMORY[0x1E4F28F80] processInfo];
    [v20 systemUptime];
    float v12 = [v19 dateWithTimeIntervalSinceNow:a3 - (v21 - self->_activationSystemUptime)];
  }
LABEL_17:
  os_log_t v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    [v12 timeIntervalSinceNow];
    int v25 = 136315650;
    v26 = "-[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:]";
    __int16 v27 = 2112;
    double v28 = *(double *)&v12;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_INFO, "%s date = %@ (%f)", (uint8_t *)&v25, 0x20u);
  }
  return v12;
}

- (id)audioSessionActivationTargetDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSSiriAudioActivationInfo *)self _audioSessionActiveDelayUserPerceptionWithType:0];
  char v4 = (os_log_t *)MEMORY[0x1E4F4E380];
  v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    float v12 = "-[CSSiriAudioActivationInfo audioSessionActivationTargetDate]";
    __int16 v13 = 2112;
    v14 = v3;
    _os_log_debug_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEBUG, "%s audioSessionActiveDelay = %@ (User Perception)", (uint8_t *)&v11, 0x16u);
    if (v3) {
      goto LABEL_3;
    }
  }
  else if (v3)
  {
LABEL_3:
    [v3 doubleValue];
    int v6 = -[CSSiriAudioActivationInfo dateByAddingTimeIntervalSinceActivation:](self, "dateByAddingTimeIntervalSinceActivation:");
    goto LABEL_6;
  }
  int v6 = 0;
LABEL_6:
  os_log_t v7 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    [v6 timeIntervalSinceNow];
    int v11 = 136315650;
    float v12 = "-[CSSiriAudioActivationInfo audioSessionActivationTargetDate]";
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s targetDate = %@ (%f)", (uint8_t *)&v11, 0x20u);
  }
  return v6;
}

- (int64_t)overrideStartingAlertBeepSoundID
{
  v2 = [(AFSpeechRecordingAlertPolicy *)self->_speechRecordingAlertPolicy startingAlertBehavior];
  int64_t v3 = [v2 beepSoundID];

  return v3;
}

- (int64_t)saeToneIDWithCarPlayConnected:(BOOL)a3
{
  if (a3) {
    return 13;
  }
  else {
    return MEMORY[0x1F410AEC0](@"siriActivationSAE", a2);
  }
}

- (id)startingAlertBeepURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F5D1F8] sharedInstance];
  uint64_t v4 = [v3 carPlayConnected];

  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEBUG, "%s For dictation, not overriding recording sound.", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_4;
  }
  if ((v4 & 1) != 0 || [MEMORY[0x1E4F5D450] isBluetoothVehicleOutput])
  {
    os_log_t v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEBUG, "%s For CarPlay, use a more shortened start recording sound.", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = @"/System/Library/Audio/UISounds/jbl_begin_short_carplay.caf";
LABEL_10:
    int v6 = [v8 URLWithString:v9];
    goto LABEL_11;
  }
  int64_t speechEvent = self->_speechEvent;
  if (speechEvent == 5 || speechEvent == 3)
  {
    uint64_t v16 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315138;
      v18 = "-[CSSiriAudioActivationInfo startingAlertBeepURL]";
      _os_log_debug_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEBUG, "%s For BT button press and handover cases, use shortened start recording sound.", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = @"/System/Library/Audio/UISounds/jbl_begin_short.caf";
    goto LABEL_10;
  }
LABEL_4:
  int v6 = 0;
LABEL_11:
  if (AFDeviceSupportsSAE() && (self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    int64_t v10 = [(CSSiriAudioActivationInfo *)self saeToneIDWithCarPlayConnected:v4];
  }
  else {
    int64_t v10 = [(CSSiriAudioActivationInfo *)self overrideStartingAlertBeepSoundID];
  }
  int64_t v11 = v10;
  if (AFSoundIDGetIsValidAndSpecified())
  {
    float v12 = [MEMORY[0x1E4F4E408] sharedManager];
    uint64_t v13 = [v12 URLForSoundID:v11];

    int v6 = (void *)v13;
  }
  return v6;
}

- (int64_t)twoShotFeedbackAlertOverrideForRecordRoute:(id)a3 playbackRoute:(id)a4 deviceSupportsVibrator:(BOOL)a5 deviceSupportsEC:(BOOL)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = v9;
  if (!v6) {
    goto LABEL_8;
  }
  if (![v9 isEqualToString:*MEMORY[0x1E4F15108]])
  {
    if (AFRecordRouteIsHearst())
    {
      int64_t v11 = 3;
      goto LABEL_9;
    }
LABEL_8:
    int64_t v11 = 2;
    goto LABEL_9;
  }
  if (CSIsWatch()) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = 3;
  }
LABEL_9:

  return v11;
}

- (int64_t)twoShotPromptTypeForRecordRoute:(id)a3 playbackRoute:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    uint64_t v16 = "-[CSSiriAudioActivationInfo twoShotPromptTypeForRecordRoute:playbackRoute:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@", (uint8_t *)&v15, 0x20u);
  }
  if (!AFIsHorseman())
  {
    int64_t speechEvent = self->_speechEvent;
    int64_t v10 = 0;
    switch(speechEvent)
    {
      case 8:
        if (!self->_isOnPhoneCall || ![v7 isEqualToString:*MEMORY[0x1E4F150D8]]) {
          goto LABEL_16;
        }
        goto LABEL_23;
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        goto LABEL_16;
      case 15:
        if ((CSIsTV() & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_21;
      case 16:
        goto LABEL_23;
      case 17:
        goto LABEL_26;
      default:
        if (speechEvent == 31)
        {
          if (!AFIsMac() || ([MEMORY[0x1E4F5D450] hasRemoteCoreSpeech] & 1) == 0)
          {
            int64_t v10 = 2;
            goto LABEL_26;
          }
        }
        else
        {
LABEL_16:
          if (MEMORY[0x1CB783E60]()
            && [v6 isEqualToString:*MEMORY[0x1E4F150F0]]
            && [v7 isEqualToString:*MEMORY[0x1E4F15108]]
            || [v7 isEqualToString:*MEMORY[0x1E4F15138]]
            && (-[AFExperimentContext invocationFeedbackExperiment](self->_experimentContext, "invocationFeedbackExperiment"), float v12 = objc_claimAutoreleasedReturnValue(), v13 = [v12 isFeatureGroupOneEnabled], v12, v13))
          {
LABEL_23:
            if (AFDeviceSupportsSystemAssistantExperience()) {
              int64_t v10 = 1;
            }
            else {
              int64_t v10 = 2;
            }
            goto LABEL_26;
          }
        }
LABEL_21:
        int64_t v10 = 1;
        goto LABEL_26;
    }
  }
  id v9 = [MEMORY[0x1E4F4E538] sharedPreferences];
  if ([v9 startAlertEnabled]) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2;
  }

LABEL_26:
  return v10;
}

- (BOOL)shouldSuppressRecordingErrorAlert
{
  return (self->_speechEvent < 0x21uLL) & (0x100220000uLL >> self->_speechEvent);
}

- (BOOL)shouldSuppressRecordingStopAlert
{
  return (self->_speechEvent < 0x21uLL) & (0x10822C000uLL >> self->_speechEvent);
}

- (BOOL)shouldPlayAlertIfNotPrelistening
{
  int64_t speechEvent = self->_speechEvent;
  BOOL v3 = [(CSSiriAudioActivationInfo *)self _isVoiceOverTouchEnabledInAccessibility];
  return +[CSSiriAudioActivationInfo _shouldPlayAlertIfNotPrelisteningForSpeechEvent:speechEvent isVoiceOverTouchEnabled:v3];
}

- (BOOL)shouldExplicitlyPlayAlertOnStart
{
  if ([(CSSiriAudioActivationInfo *)self _eventIsVoiceTrigger] || !self->_useBorealisBuffer) {
    return 0;
  }
  unint64_t speechEvent = self->_speechEvent;
  BOOL v4 = speechEvent > 0x20;
  unint64_t v5 = (0xFFDDFFFFuLL >> speechEvent) & 1;
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)canEnterTwoShot
{
  BOOL v3 = [(CSSiriAudioActivationInfo *)self _eventIsVoiceTrigger];
  if (v3)
  {
    int64_t activationMode = self->_activationMode;
    LOBYTE(v3) = activationMode == 1987012963 || activationMode == 1751414371;
  }
  return v3;
}

- (BOOL)_eventIsTVRemote
{
  return MEMORY[0x1F410AEF8](self->_speechEvent, a2);
}

- (BOOL)_eventIsVoiceTrigger
{
  return AFSpeechEventIsVoiceTrigger();
}

- (BOOL)_canUseZLL
{
  if ([(CSSiriAudioActivationInfo *)self _isVoiceOverTouchEnabledInAccessibility]|| self->_speechRecordingMode != 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int64_t activationMode = self->_activationMode;
    BOOL v5 = activationMode == 1752132965 || activationMode == 1969840752 || activationMode == 1986357346;
    if (v5 || (int v7 = AFIsHorseman(), v7 && self->_activationMode == 1635087471))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      int v6 = [MEMORY[0x1E4F5D450] isContinuousConversationSupported];
      if (v6) {
        LOBYTE(v6) = self->_activationMode == 1635087471;
      }
    }
  }
  return v6;
}

- (BOOL)canGetPCMStream
{
  return self->_activationMode != 1651797093;
}

- (BOOL)requiresBorealisConsumerCheck
{
  if (self->_useBorealisBuffer) {
    return ![(CSSiriAudioActivationInfo *)self _eventIsVoiceTrigger];
  }
  else {
    return 0;
  }
}

- (BOOL)canPrepareWithoutInterruption
{
  return 0;
}

- (BOOL)canPrewarm
{
  if (self->_activationMode == 1752132965) {
    return AFIsNano() ^ 1;
  }
  else {
    return 0;
  }
}

- (void)endUpdateToPostVoiceWithContext:(unint64_t)a3 success:(BOOL)a4
{
  if (!a4)
  {
    self->_csAudioRecordType = a3;
    self->_int64_t activationMode = self->_storedActivationMode;
  }
}

- (unint64_t)beginUpdateToPostVoice
{
  unint64_t csAudioRecordType = self->_csAudioRecordType;
  int64_t activationMode = self->_activationMode;
  self->_int64_t activationMode = 1886352244;
  self->_storedActivationMode = activationMode;
  self->_unint64_t csAudioRecordType = 14;
  return csAudioRecordType;
}

- (BOOL)needsUpdateToPostVoiceMode
{
  if (!self->_isActivated) {
    return 0;
  }
  int v3 = CSIsTV();
  int64_t activationMode = self->_activationMode;
  if (v3)
  {
    if (activationMode == 1751414371) {
      return 0;
    }
  }
  return activationMode == 1668314723 || activationMode == 1751414371 || activationMode == 1987012963;
}

- (void)audioSessionActivated
{
  self->_isActivated = 1;
}

- (BOOL)_shouldSkipStartRecordingAlertForRecordingInfo:(id)a3
{
  return [a3 speechEvent] == 14 && self->_hasPlayedStartAlert;
}

- (id)startRecordingSettingsWithRecordRoute:(id)a3 recordingInfo:(id)a4 playbackRoute:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v84 = a4;
  id v9 = a5;
  int64_t v10 = (os_log_t *)MEMORY[0x1E4F4E380];
  int64_t v11 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v86 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    __int16 v87 = 2112;
    *(void *)v88 = v8;
    *(_WORD *)&v88[8] = 2112;
    *(void *)v89 = v9;
    _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v13 = [(id)objc_opt_class() _doesRecordRouteSupportZLL:v8];
  os_log_t v14 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    int v15 = v14;
    BOOL v16 = [(CSSiriAudioActivationInfo *)self _canUseZLL];
    int64_t activationMode = self->_activationMode;
    *(_DWORD *)buf = 136315906;
    v86 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    __int16 v87 = 1024;
    *(_DWORD *)v88 = v13;
    *(_WORD *)&v88[4] = 1024;
    *(_DWORD *)&v88[6] = v16;
    *(_WORD *)v89 = 2048;
    *(void *)&v89[2] = activationMode;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s doesRecordRouteSupportZLL = %u, [self _canUseZLL] = %u _activationMode:%ld", buf, 0x22u);
  }
  if ([MEMORY[0x1E4F4E488] isDictationVoiceTriggerEnabled]) {
    BOOL v18 = self->_dictationVoiceTriggerAbsStartSampleId != 0;
  }
  else {
    BOOL v18 = 0;
  }
  v81 = v8;
  v82 = v12;
  id v83 = v9;
  if (([(CSSiriAudioActivationInfo *)self _canUseZLL] & v13) == 1)
  {
    unint64_t activationHostTime = self->_activationHostTime;
    if (activationHostTime)
    {
      if (!v18) {
        goto LABEL_20;
      }
    }
    else
    {
      double activationSystemUptime = self->_activationSystemUptime;
      char v21 = activationSystemUptime <= 0.0 || v18;
      if ((v21 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  if (self->_speechEvent != 17)
  {
    int v79 = 0;
    goto LABEL_24;
  }
  unint64_t activationHostTime = self->_activationHostTime;
  if (!activationHostTime)
  {
    double activationSystemUptime = self->_activationSystemUptime;
LABEL_19:
    unint64_t activationHostTime = [MEMORY[0x1E4F153F8] hostTimeForSeconds:activationSystemUptime];
  }
LABEL_20:
  os_log_t v22 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F28F80];
    v24 = v22;
    int v25 = [v23 processInfo];
    [v25 systemUptime];
    double v27 = v26;
    [MEMORY[0x1E4F153F8] secondsForHostTime:activationHostTime];
    *(_DWORD *)buf = 136315394;
    v86 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    __int16 v87 = 2048;
    *(double *)v88 = v27 - v28;
    _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_INFO, "%s Requesting historical buffer of duration %lf seconds", buf, 0x16u);
  }
  __int16 v29 = [NSNumber numberWithUnsignedLongLong:activationHostTime];
  [v12 setObject:v29 forKey:*MEMORY[0x1E4F15338]];

  int v79 = 1;
LABEL_24:
  uint64_t v30 = [MEMORY[0x1E4F4E440] sharedObserver];
  uint64_t v31 = [v30 state];

  int64_t v32 = [(CSSiriAudioActivationInfo *)self overrideStartingAlertBeepSoundID];
  v33 = [MEMORY[0x1E4F4E538] sharedPreferences];
  uint64_t v34 = [v33 useDeviceSpeakerForTTS];

  uint64_t v35 = MEMORY[0x1CB783E60]();
  BOOL v36 = [(CSSiriAudioActivationInfo *)self _isVoiceOverTouchEnabledInAccessibility];
  int v37 = [(AFClientConfiguration *)self->_currentClientConfiguration isDeviceInCarDNDMode];
  BOOL v38 = [(CSSiriAudioActivationInfo *)self _isVibrationDisabledInAccessibility];
  char v39 = !v38;
  char v40 = AFSupportsVibration();
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2 && !v38) {
    v39 &= [(CSSiriAudioActivationInfo *)self _isSystemHapticEnabled];
  }
  v41 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int64_t v42 = self->_activationMode;
    *(_DWORD *)buf = 136316162;
    v86 = "-[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:]";
    __int16 v87 = 2048;
    *(void *)v88 = v42;
    *(_WORD *)&v88[8] = 2048;
    *(void *)v89 = v34;
    *(_WORD *)&v89[8] = 1024;
    int v90 = v79;
    __int16 v91 = 1024;
    int v92 = v37;
    _os_log_impl(&dword_1C9338000, v41, OS_LOG_TYPE_INFO, "%s int64_t activationMode = %ld, usesDeviceSpeakerForTTS = %lu, attemptsToUsePastDataBufferFrames = %d, isDeviceInCarDNDMode = %d", buf, 0x2Cu);
  }
  HIBYTE(v74) = self->_suppressStartAlert;
  BYTE6(v74) = v40;
  BYTE5(v74) = v39;
  BYTE4(v74) = v36;
  BYTE3(v74) = v35;
  *(_WORD *)((char *)&v74 + 1) = *(_WORD *)&self->_isOnPhoneCall;
  LOBYTE(v74) = self->_usePrelistening;
  v43 = v83;
  v44 = +[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerState:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:](CSSiriAudioActivationInfo, "_alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerState:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:", v81, v83, self->_speechEvent, self->_speechRecordingMode, v31, v32, self->_presentationMode, v74, self->_activationHostTime);
  v45 = v82;
  if ([v44 count]) {
    [v82 setObject:v44 forKey:*MEMORY[0x1E4F152F0]];
  }
  v46 = v84;
  if ([(CSSiriAudioActivationInfo *)self _shouldSkipStartRecordingAlertForRecordingInfo:v84])
  {
    v47 = [NSNumber numberWithBool:1];
    [v82 setObject:v47 forKey:@"CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"];
  }
  if (+[CSSiriAudioActivationInfo _shouldAllowRecordWhileBeepWithRecordRoute:v81 playbackRoute:v83 supportsEchoCancellation:v35 speechRecordingMode:self->_speechRecordingMode recordingInfo:v84])
  {
    v48 = [NSNumber numberWithBool:1];
    [v82 setObject:v48 forKey:@"CSSpeechRecordSettingsKey_allowRecordWhileBeep"];
  }
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (_AFPreferencesDictationLanguageDetectorEnabled())
    {
      languageDetectionUserContext = self->_languageDetectionUserContext;
      if (languageDetectionUserContext)
      {
        v50 = (void *)MEMORY[0x1E4F1CA60];
        v51 = languageDetectionUserContext;
        v52 = [v50 dictionary];
        v53 = [(AFLanguageDetectionUserContext *)v51 languageDetectorUserContext];
        uint64_t v54 = [(AFLanguageDetectionUserContext *)v51 finalFilteredDictationLanguages];

        if (v54)
        {
          v55 = [MEMORY[0x1E4F1CAD0] setWithArray:v54];
          [v52 setObject:v55 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"];
        }
        v56 = (void *)MEMORY[0x1E4F4E690];
        uint64_t v57 = [v53 objectForKey:*(void *)(MEMORY[0x1E4F4E690] + 8)];
        if (v57) {
          [v52 setObject:v57 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorCurrentKeyboard"];
        }
        v80 = (void *)v54;
        uint64_t v58 = [v53 objectForKey:*v56];
        if (v58) {
          [v52 setObject:v58 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorWasLanguageToggled"];
        }
        uint64_t v59 = [v53 objectForKey:v56[4]];
        if (v59) {
          [v52 setObject:v59 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorMultilingualKeyboardLanguages"];
        }
        v76 = (void *)v59;
        v77 = (void *)v58;
        uint64_t v60 = [v53 objectForKey:v56[7]];
        if (v60) {
          [v52 setObject:v60 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorKeyboardConvoLanguagePriors"];
        }
        v61 = [v53 objectForKey:v56[8]];
        if (v61) {
          [v52 setObject:v61 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorKeyboardGlobalLanguagePriors"];
        }
        v78 = (void *)v57;
        v62 = [v53 objectForKey:v56[2]];
        if (v62) {
          [v52 setObject:v62 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorPreviousMessageLanguage"];
        }
        v75 = (void *)v60;
        v63 = [v53 objectForKey:v56[3]];
        if (v63) {
          [v52 setObject:v63 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorGlobalLastKeyboardUsed"];
        }
        v64 = [v53 objectForKey:v56[5]];
        if (v64) {
          [v52 setObject:v64 forKey:@"CSSpeechRecordSettingsKey_LanguageDetectorConversationalMessages"];
        }
        v65 = *MEMORY[0x1E4F4E368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315395;
          v86 = "_CSSiriLanguageDetectorSettings";
          __int16 v87 = 2113;
          *(void *)v88 = v52;
          _os_log_impl(&dword_1C9338000, v65, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
        }

        if (v52)
        {
          v43 = v83;
          v46 = v84;
          v45 = v82;
          if ([v52 count]) {
            [v82 addEntriesFromDictionary:v52];
          }
        }
        else
        {
          v43 = v83;
          v46 = v84;
          v45 = v82;
        }
      }
      else
      {
        v52 = 0;
      }
    }
    applicationDisplayName = self->_applicationDisplayName;
    if (applicationDisplayName) {
      [v45 setObject:applicationDisplayName forKey:@"CSSpeechRecordSettingsKey_DictationRequestAppName"];
    }
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    if (applicationBundleIdentifier) {
      [v45 setObject:applicationBundleIdentifier forKey:@"CSSpeechRecordSettingsKey_DictationRequestAppBundleID"];
    }
    if ([MEMORY[0x1E4F4E488] isDictationVoiceTriggerEnabled]
      && self->_dictationVoiceTriggerAbsStartSampleId)
    {
      v68 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      [v45 setObject:v68 forKey:@"CSSpeechRecordSettingsKey_DictationStartSampleId"];
    }
  }
  int64_t speechEndpointerOperationMode = self->_speechEndpointerOperationMode;
  if (speechEndpointerOperationMode == 1
    || !speechEndpointerOperationMode
    && (self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2
    && self->_dictationInputOrigin != 1)
  {
    [v45 setObject:MEMORY[0x1E4F1CC38] forKey:@"CSSpeechRecordSettingsKey_disableEndpointer"];
  }
  v70 = [(CSSiriAudioActivationInfo *)self _audioSessionActiveDelayCoreSpeechWithType:2];
  if (v70) {
    [v45 setObject:v70 forKey:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
  }
  [v45 setObject:&unk_1F23C49E8 forKey:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
  if ([v45 count]) {
    v71 = v45;
  }
  else {
    v71 = 0;
  }
  id v72 = v71;

  return v72;
}

- (int64_t)_csAudioRecordTypeForSpeechRequestOptions:(id)a3 useBorealisBuffer:(BOOL)a4 currentClientConfiguration:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 activationEvent];
  if (a4)
  {
    int64_t v8 = 6;
  }
  else
  {
    uint64_t v9 = v7;
    if (v7 == 21 && ([v6 announcementPlatform] == 3 || objc_msgSend(v6, "announcementPlatform") == 4))
    {
      int64_t v10 = *MEMORY[0x1E4F4E380];
      int64_t v8 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        int v13 = "-[CSSiriAudioActivationInfo _csAudioRecordTypeForSpeechRequestOptions:useBorealisBuffer:currentClientConfiguration:]";
        int64_t v8 = 1;
        _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s announcement platform is hearing aids or built in speaker, using CSAudioRecordTypeHomePress", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      int64_t v8 = +[CSRecordTypeSpeechEventConverter getRecordTypeForSpeechEvent:v9];
    }
  }

  return v8;
}

- (BOOL)_isRequestFromSpokenNotification:(int64_t)a3
{
  if (_os_feature_enabled_impl()) {
    return a3 == 21 || a3 == 32 || self->_isOnPhoneCall;
  }
  if ((unint64_t)a3 <= 0x20) {
    return (0x100220000uLL >> a3) & 1;
  }
  else {
    return 0;
  }
}

- (id)recordContextForSpeechEvent:(int64_t)a3
{
  int64_t v5 = +[CSRecordTypeSpeechEventConverter getRecordTypeForSpeechEvent:](CSRecordTypeSpeechEventConverter, "getRecordTypeForSpeechEvent:");
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5D1E8]) initWithRecordType:v5 deviceId:self->_deviceIdentifier];
  [v6 setIsRequestDuringActiveCall:self->_isOnPhoneCall];
  [v6 setIsRequestFromSpokenNotification:self->_isSpokenNotification];
  [v6 setIsRequestFromTriggerless:self->_isTriggerlessFollowup];
  [v6 setSpeechEvent:a3];
  return v6;
}

- (id)recordContext
{
  int64_t v3 = [(CSSiriAudioActivationInfo *)self _csAudioRecordType];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F5D1E8]) initWithRecordType:v3 deviceId:self->_deviceIdentifier];
  [v4 setIsRequestDuringActiveCall:self->_isOnPhoneCall];
  int64_t v5 = MEMORY[0x1CB784120](self->_turnIdentifier);
  [v4 setTurnIdentifier:v5];

  if (self->_activationMetadata) {
    objc_msgSend(v4, "setActivationMetadata:");
  }
  [v4 setIsRequestFromSpokenNotification:self->_isSpokenNotification];
  [v4 setIsRequestFromTriggerless:self->_isTriggerlessFollowup];
  [v4 setSpeechEvent:self->_speechEvent];
  return v4;
}

- (int64_t)_csAudioRecordType
{
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return self->_csAudioRecordType;
  }
  if (AFIsATV()) {
    return 8;
  }
  return 13;
}

- (int64_t)_activationMode
{
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return self->_activationMode;
  }
  if (AFIsATV()) {
    return 1651797093;
  }
  return 1684628340;
}

- (id)recordSettingsWithOptions:(unint64_t)a3 appendingSettings:(id)a4
{
  char v4 = a3;
  v29[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((AFIsNano() & 1) == 0
    && AFIsInternalInstall()
    && _AFPreferencesForceUncompressedAudioRecording())
  {
    uint64_t v7 = *MEMORY[0x1E4F15270];
    v28[0] = *MEMORY[0x1E4F151E0];
    v28[1] = v7;
    v29[0] = &unk_1F23C4988;
    v29[1] = &unk_1F23C4E88;
    uint64_t v8 = *MEMORY[0x1E4F15208];
    v28[2] = *MEMORY[0x1E4F151F0];
    v28[3] = v8;
    v29[2] = &unk_1F23C49A0;
    v29[3] = MEMORY[0x1E4F1CC28];
    uint64_t v9 = *MEMORY[0x1E4F15238];
    v28[4] = *MEMORY[0x1E4F15228];
    v28[5] = v9;
    uint64_t v10 = *MEMORY[0x1E4F15248];
    v29[4] = &unk_1F23C49B8;
    v29[5] = v10;
    int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];
    int v12 = [(CSSiriAudioActivationInfo *)self _appendDictationApplicationInfoSettings:v11];
    goto LABEL_27;
  }
  uint64_t v13 = 1936745848;
  if (self->_activationMode != 1651797093)
  {
    uint64_t v13 = 1869641075;
    if ((AFIsNano() & 1) == 0)
    {
      if (AFIsInternalInstall())
      {
        if (_AFPreferencesForceSpeexAudioRecording()) {
          uint64_t v13 = 1936745848;
        }
        else {
          uint64_t v13 = 1869641075;
        }
      }
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    int v15 = [(CSSiriAudioActivationInfo *)self _audioSessionActiveDelayCoreSpeechWithType:1];
    if (v15) {
      [v14 setObject:v15 forKey:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
    }
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v16 = 1;
    goto LABEL_21;
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v16 = 2;
    goto LABEL_21;
  }
  if ((v4 & 0x10) != 0)
  {
    uint64_t v16 = 3;
LABEL_21:
    __int16 v17 = [NSNumber numberWithUnsignedInteger:v16];
    [v14 setObject:v17 forKey:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
  }
  v26[0] = *MEMORY[0x1E4F151E0];
  BOOL v18 = [NSNumber numberWithUnsignedInt:v13];
  uint64_t v19 = *MEMORY[0x1E4F15270];
  v27[0] = v18;
  v27[1] = &unk_1F23C4E88;
  uint64_t v20 = *MEMORY[0x1E4F151C0];
  v26[1] = v19;
  v26[2] = v20;
  uint64_t v21 = *MEMORY[0x1E4F15228];
  v27[2] = &unk_1F23C49D0;
  v27[3] = &unk_1F23C49B8;
  uint64_t v22 = *MEMORY[0x1E4F15238];
  v26[3] = v21;
  v26[4] = v22;
  v27[4] = *MEMORY[0x1E4F15248];
  int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];

  if (v6) {
    [v14 addEntriesFromDictionary:v6];
  }
  if ([v14 count])
  {
    uint64_t v23 = (void *)[v11 mutableCopy];
    [v23 addEntriesFromDictionary:v14];
    uint64_t v24 = [v23 copy];

    int64_t v11 = (void *)v24;
  }
  int v12 = [(CSSiriAudioActivationInfo *)self _appendDictationApplicationInfoSettings:v11];

LABEL_27:
  return v12;
}

- (id)_appendDictationApplicationInfoSettings:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if ((self->_speechRecordingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = v6;
    applicationDisplayName = self->_applicationDisplayName;
    if (applicationDisplayName) {
      [v6 setObject:applicationDisplayName forKey:@"CSSpeechRecordSettingsKey_DictationRequestAppName"];
    }
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    if (applicationBundleIdentifier) {
      [v7 setObject:applicationBundleIdentifier forKey:@"CSSpeechRecordSettingsKey_DictationRequestAppBundleID"];
    }
    uint64_t v10 = [v7 copy];

    int64_t v5 = (void *)v10;
  }
  return v5;
}

- (int64_t)event
{
  return self->_speechEvent;
}

- (void)setClientConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[CSSiriAudioActivationInfo setClientConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s clientConfiguration = %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = (AFClientConfiguration *)[v4 copy];
  currentClientConfiguration = self->_currentClientConfiguration;
  self->_currentClientConfiguration = v6;
}

- (void)setSpeechRequestOptions:(id)a3 currentActivationInfo:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (int64_t *)a4;
  int v8 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v47 = "-[CSSiriAudioActivationInfo setSpeechRequestOptions:currentActivationInfo:]";
    __int16 v48 = 2048;
    double v49 = *(double *)&self;
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    v53 = v7;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s %p speechRequestOptions = %@, currentActivationInfo = %@", buf, 0x2Au);
  }
  int64_t v10 = [v6 activationEvent];
  [v6 activationEventTime];
  double v12 = v11;
  self->_suppressStartAlert = [v6 suppressStartAlert];
  self->_int64_t speechEndpointerOperationMode = [v6 endpointerOperationMode];
  self->_speechRecordingAlertPolicy = (AFSpeechRecordingAlertPolicy *)(id)[v6 recordingAlertPolicy];
  if ([v6 useAutomaticEndpointing] && !self->_speechEndpointerOperationMode) {
    self->_int64_t speechEndpointerOperationMode = 3;
  }
  uint64_t v13 = [v6 useBorealisBuffer];
  BOOL v14 = v13;
  if (v7 && !v10 && self->_useBorealisBuffer == v13)
  {
    self->_int64_t activationMode = v7[1];
    self->_unint64_t csAudioRecordType = v7[3];
LABEL_12:
    self->_speechRecordingMode = [v7 speechRecordingMode];
    goto LABEL_13;
  }
  int64_t v15 = 1987012963;
  id v16 = v6;
  __int16 v17 = v16;
  if (!v14)
  {
    int64_t v15 = 1752132965;
    switch([v16 activationEvent])
    {
      case 2:
        int64_t v15 = 2003329648;
        break;
      case 3:
        int64_t v15 = 1651794544;
        break;
      case 4:
        int64_t v15 = 1969840752;
        break;
      case 5:
        int64_t v15 = 1635087471;
        break;
      case 6:
        int64_t v15 = 845504882;
        break;
      case 7:
        int64_t v15 = 1635213689;
        break;
      case 8:
      case 11:
      case 30:
        int64_t v15 = 1987012963;
        break;
      case 9:
      case 32:
        int64_t v15 = 1986357346;
        break;
      case 10:
      case 22:
      case 23:
      case 24:
        int64_t v15 = 1651797093;
        break;
      case 13:
        int64_t v15 = 1918986611;
        break;
      case 14:
      case 27:
        int64_t v15 = 1651795060;
        break;
      case 15:
      case 34:
        int64_t v15 = 1751414371;
        break;
      case 16:
      case 35:
        int64_t v15 = 1668314723;
        break;
      case 17:
      case 21:
        if ((unint64_t)([v17 announcementPlatform] - 3) >= 2) {
          int64_t v15 = 1751414371;
        }
        break;
      case 31:
      case 36:
        int64_t v15 = 1684108899;
        break;
      default:
        break;
    }
  }

  self->_int64_t activationMode = v15;
  self->_unint64_t csAudioRecordType = [(CSSiriAudioActivationInfo *)self _csAudioRecordTypeForSpeechRequestOptions:v17 useBorealisBuffer:v14 currentClientConfiguration:self->_currentClientConfiguration];
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:
  self->_unint64_t speechEvent = v10;
  self->_useBorealisBuffer = v14;
  self->_double activationSystemUptime = v12;
  self->_unint64_t activationHostTime = [v6 activationEventMachAbsoluteTime];
  self->_unint64_t buttonDownHostTime = [v6 homeButtonDownEventMachAbsoluteTime];
  BOOL v18 = [v6 voiceTriggerEventInfo];
  uint64_t v19 = [v18 objectForKey:@"triggerEndMachTime"];
  self->_unint64_t voiceTriggerEndHostTime = [v19 unsignedLongLongValue];

  uint64_t v20 = [v6 activationDeviceIdentifier];
  uint64_t v21 = (NSString *)[v20 copy];
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v21;

  self->_usePrelistening = [v6 usePrelisteningMode];
  self->_isOnPhoneCall = [v6 isOnPhoneCall];
  self->_hasPlayedStartAlert = [v6 hasPlayedStartAlert];
  uint64_t v23 = [v6 languageDetectionUserContext];
  uint64_t v24 = (AFLanguageDetectionUserContext *)[v23 copy];
  languageDetectionUserContext = self->_languageDetectionUserContext;
  self->_languageDetectionUserContext = v24;

  self->_dictationInputOrigin = [v6 dictationInputOrigin];
  double v26 = [v6 turnIdentifier];
  turnIdentifier = self->_turnIdentifier;
  self->_turnIdentifier = v26;

  double v28 = [v6 applicationDisplayName];
  applicationDisplayName = self->_applicationDisplayName;
  self->_applicationDisplayName = v28;

  uint64_t v30 = [v6 applicationBundleIdentifier];
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v30;

  self->_presentationMode = [v6 presentationMode];
  float v32 = 0.0;
  if ([v6 isMediaPlaying])
  {
    [v6 mediaPlaybackVolume];
    float v32 = v33;
  }
  self->_double activeMediaPlaybackVolume = v32;
  uint64_t v34 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[CSSiriAudioActivationInfo setSpeechRequestOptions:currentActivationInfo:]";
    __int16 v48 = 2048;
    double v49 = v32;
    _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_INFO, "%s double activeMediaPlaybackVolume = %f", buf, 0x16u);
  }
  self->_dictationVoiceTriggerAbsStartSampleId = [v6 dictationVoiceTriggerAbsStartSampleId];
  uint64_t v35 = [v6 voiceTriggerEventInfo];
  uint64_t v36 = *MEMORY[0x1E4F5D788];
  int v37 = [v35 objectForKey:*MEMORY[0x1E4F5D788]];

  if (v37)
  {
    uint64_t v44 = v36;
    v45 = v37;
    BOOL v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    activationMetadata = self->_activationMetadata;
    self->_activationMetadata = v38;
  }
  unint64_t csAudioRecordType = self->_csAudioRecordType;
  if (csAudioRecordType <= 0x1B && ((1 << csAudioRecordType) & 0x8D00000) != 0)
  {
    v41 = [v6 continuousConversationInfo];
    int64_t v42 = (NSDictionary *)[v41 copy];
    v43 = self->_activationMetadata;
    self->_activationMetadata = v42;
  }
  self->_isSpokenNotification = [(CSSiriAudioActivationInfo *)self _isRequestFromSpokenNotification:v10];
  self->_isTriggerlessFollowup = v10 == 17;
}

- (CSSiriAudioActivationInfo)initWithSpeechRecordingMode:(int64_t)a3 clientConfiguration:(id)a4 experimentContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSSiriAudioActivationInfo;
  int64_t v10 = [(CSSiriAudioActivationInfo *)&v20 init];
  if (v10)
  {
    double v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "-[CSSiriAudioActivationInfo initWithSpeechRecordingMode:clientConfiguration:experimentContext:]";
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s %p speechRecordingMode = %zd, clientConfiguration = %@", buf, 0x2Au);
    }
    v10->_speechRecordingMode = a3;
    uint64_t v12 = [v8 copy];
    currentClientConfiguration = v10->_currentClientConfiguration;
    v10->_currentClientConfiguration = (AFClientConfiguration *)v12;

    uint64_t v14 = [v9 copy];
    experimentContext = v10->_experimentContext;
    v10->_experimentContext = (AFExperimentContext *)v14;

    v10->_int64_t activationMode = 1752132965;
    v10->_unint64_t csAudioRecordType = 0;
    int v16 = AFIsHorseman();
    v10->_useBorealisBuffer = v16;
    if (v16)
    {
      v10->_int64_t activationMode = 1987012963;
      v10->_unint64_t csAudioRecordType = 6;
    }
    uint64_t v17 = +[CSAttSiriMagusSupportedPolicy sharedInstance];
    magusSupportedPolicy = v10->_magusSupportedPolicy;
    v10->_magusSupportedPolicy = (CSAttSiriMagusSupportedPolicy *)v17;
  }
  return v10;
}

- (id)description
{
  unsigned int v8 = bswap32([(CSSiriAudioActivationInfo *)self _activationMode]);
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)CSSiriAudioActivationInfo;
  id v4 = [(CSSiriAudioActivationInfo *)&v7 description];
  int64_t v5 = (void *)[v3 initWithFormat:@"%@ {activationMode = %.4s, deviceIdentifier = %@, activated = %d}", v4, &v8, self->_deviceIdentifier, self->_isActivated];

  return v5;
}

+ (BOOL)_shouldPlayAlertIfNotPrelisteningForSpeechEvent:(int64_t)a3 isVoiceOverTouchEnabled:(BOOL)a4
{
  return a4 & ~AFSpeechEventIsVoiceTrigger();
}

+ (BOOL)_shouldAllowRecordWhileBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4 supportsEchoCancellation:(BOOL)a5 speechRecordingMode:(int64_t)a6 recordingInfo:(id)a7
{
  BOOL v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = v14;
    int v16 = [v13 route];
    int v21 = 136316418;
    uint64_t v22 = "+[CSSiriAudioActivationInfo _shouldAllowRecordWhileBeepWithRecordRoute:playbackRoute:supportsEchoCancellation:"
          "speechRecordingMode:recordingInfo:]";
    __int16 v23 = 1024;
    BOOL v24 = v9;
    __int16 v25 = 2048;
    int64_t v26 = a6;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2114;
    float v32 = v16;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s supportsEchoCancellation:%u speechRecordingMode:%ld recordRoute:%{public}@ playbackRoute:%{public}@, route in recordingInfo: %{public}@", (uint8_t *)&v21, 0x3Au);
  }
  if (a6 == 1
    && v9
    && [v11 isEqualToString:*MEMORY[0x1E4F150F0]]
    && ([v12 isEqualToString:*MEMORY[0x1E4F15108]] & 1) != 0)
  {
    goto LABEL_15;
  }
  if (CSIsASMacWithAOP())
  {
    uint64_t v17 = [v13 route];
    BOOL v18 = v17;
    if (a6 == 1
      && [v17 isEqualToString:@"BuiltInMicrophoneDevice"]
      && ([v12 isEqualToString:*MEMORY[0x1E4F15108]] & 1) != 0)
    {

      goto LABEL_15;
    }
  }
  if (a6 != 1 || ([v11 isEqualToString:*MEMORY[0x1E4F15328]] & 1) == 0)
  {
    BOOL v19 = 0;
    goto LABEL_17;
  }
LABEL_15:
  BOOL v19 = 1;
LABEL_17:

  return v19;
}

+ (BOOL)_requestIsUsingHFPWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F150D8];
  if ([a3 isEqualToString:*MEMORY[0x1E4F150D8]]) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 isEqualToString:v6];
  }

  return v7;
}

+ (id)_alertDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 ringerState:(int64_t)a6 startingAlertBeepOverideID:(int64_t)a7 presentationMode:(int64_t)a8 hasPlayedStartAlert:(BOOL)a9 supportsEchoCancellation:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11 isVibrationEnabled:(BOOL)a12 isVibrationSupported:(BOOL)a13 activationHostTime:(unint64_t)a14
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  __int16 v48 = v17;
  if ([v17 isEqualToString:*MEMORY[0x1E4F15328]]
    && ([v18 isEqualToString:*MEMORY[0x1E4F150D8]] & 1) == 0)
  {
    BOOL v19 = v18;
    int v20 = [v18 isEqualToString:*MEMORY[0x1E4F150C0]] ^ 1;
  }
  else
  {
    BOOL v19 = v18;
    int v20 = 0;
  }
  if (AFIsATV())
  {
    BOOL v21 = a11;
    if ((a11 & ~a9) != 0) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    goto LABEL_9;
  }
  uint64_t v29 = AFIsHorseman();
  uint64_t v22 = v29 << 63 >> 63;
  if ((v29 & 1) != 0 || a9) {
    goto LABEL_68;
  }
  if ((AFSpeechEventIsVoiceTrigger() & 1) != 0 || a5 == 17 || a5 == 13)
  {
    __int16 v23 = v48;
    char v30 = [a1 _requestIsUsingHFPWithRecordRoute:v48 playbackRoute:v19];
    int v31 = [a1 _doesRecordRouteSupportZLL:v48];
    uint64_t v22 = 0;
    BOOL v21 = a11;
    if ((v30 & 1) == 0 && (v31 & v20 & 1) == 0)
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (AFSoundIDGetIsValidAndSpecified())
  {
    uint64_t v22 = 2;
LABEL_30:
    BOOL v21 = a11;
LABEL_9:
    __int16 v23 = v48;
    goto LABEL_10;
  }
  uint64_t v22 = a12 & a13;
  if (a5 == 5)
  {
    int v32 = [v48 isEqualToString:*MEMORY[0x1E4F150F0]];
    uint64_t v33 = *MEMORY[0x1E4F15118];
    int v34 = [v48 isEqualToString:*MEMORY[0x1E4F15118]];
    int v35 = [v19 isEqualToString:v33];
    int v36 = [MEMORY[0x1E4F5D450] supportEarconRemoval];
    if (a8 != 3)
    {
      if (a8 == 2)
      {
        v43 = *MEMORY[0x1E4F5D180];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v50 = "+[CSSiriAudioActivationInfo _alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startin"
                "gAlertBeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnable"
                "d:isVibrationEnabled:isVibrationSupported:activationHostTime:]";
          _os_log_fault_impl(&dword_1C9338000, v43, OS_LOG_TYPE_FAULT, "%s Unexpected use of AFPresentationModeMixed", buf, 0xCu);
        }
      }
      else if (a8 == 1)
      {
        if ((v34 & v35 ^ 1 | v36) == 1) {
          uint64_t v22 = (v22 ^ 1 | v20 | v34) ^ 1;
        }
        else {
          uint64_t v22 = 2;
        }
        goto LABEL_63;
      }
      uint64_t v22 = -1;
      goto LABEL_63;
    }
    int v42 = v22 ^ 1;
    if (a6 != 2) {
      int v42 = 1;
    }
    if ((v35 | v42) == 1)
    {
      if ((v35 & v32) != 0) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 2;
      }
    }
    else
    {
      uint64_t v22 = 1;
    }
LABEL_63:
    int v44 = [MEMORY[0x1E4F5D450] isContinuousConversationSupported];
    if (a14 && v44)
    {
      v45 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v50 = "+[CSSiriAudioActivationInfo _alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingA"
              "lertBeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:is"
              "VibrationEnabled:isVibrationSupported:activationHostTime:]";
        __int16 v51 = 2048;
        unint64_t v52 = a14;
        _os_log_impl(&dword_1C9338000, v45, OS_LOG_TYPE_INFO, "%s Override startRecording to mute, since user already started speaking before serverInvoke activated (unint64_t activationHostTime = %llu)", buf, 0x16u);
      }
      uint64_t v22 = 0;
      goto LABEL_30;
    }
LABEL_68:
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v21 = a11;
    __int16 v23 = v48;
    if (v22 == -1) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  __int16 v23 = v48;
  if (v22 & AFRecordRouteIsHearst())
  {
    uint64_t v22 = 3;
  }
  else if (AFPlaybackRouteIsHandsFree())
  {
    int v37 = [a1 _requestIsUsingHFPWithRecordRoute:v48 playbackRoute:v19];
    if (a5 != 1 || !v37)
    {
      BOOL v38 = a5 == 1 && a12 && a13;
      BOOL v39 = !a13;
      if (a5 != 1) {
        BOOL v39 = 1;
      }
      BOOL v40 = !v39 && !a12;
      uint64_t v41 = 2;
      if (v40) {
        uint64_t v41 = 0;
      }
      if (v38) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v41;
      }
    }
  }
  else if (a6 != 2 && a10)
  {
    BOOL v21 = a11;
    if (a12 && a13)
    {
      if (AFDeviceSupportsSystemAssistantExperience()) {
        uint64_t v22 = 3;
      }
      else {
        uint64_t v22 = 1;
      }
    }
    else
    {
      uint64_t v22 = 2;
    }
    goto LABEL_10;
  }
  BOOL v21 = a11;
LABEL_10:
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_11:
  __int16 v25 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v50 = "+[CSSiriAudioActivationInfo _alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingAlert"
          "BeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibratio"
          "nEnabled:isVibrationSupported:activationHostTime:]";
    __int16 v51 = 2048;
    unint64_t v52 = v22;
    _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, "%s Setting alertBehavior recordStarting as %ld", buf, 0x16u);
  }
  int64_t v26 = [NSNumber numberWithInteger:v22];
  [v24 setObject:v26 forKey:&unk_1F23C4A00];

LABEL_14:
  if (v21) {
    __int16 v27 = &unk_1F23C4A18;
  }
  else {
    __int16 v27 = &unk_1F23C4A48;
  }
  objc_msgSend(v24, "setObject:forKey:", v27);
  [v24 setObject:v27 forKey:&unk_1F23C4A30];

  return v24;
}

+ (id)_dictationAlertBehaviorDictionaryForRecordRoute:(id)a3 playbackRoute:(id)a4 ringerState:(int64_t)a5 usePrelistening:(BOOL)a6 suppressStartAlert:(BOOL)a7 supportsEchoCancellation:(BOOL)a8 isVibrationEnabled:(BOOL)a9 isVibrationSupported:(BOOL)a10 isVoiceOverTouchEnabled:(BOOL)a11
{
  BOOL v12 = a6;
  id v14 = a4;
  if (AFIsATV())
  {
    if (a11) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (v12) {
      goto LABEL_6;
    }
    if (a7)
    {
      uint64_t v15 = -1;
      goto LABEL_14;
    }
    if (!AFPlaybackRouteIsHandsFree() && a5 == 2)
    {
LABEL_6:
      uint64_t v15 = a9 & a10;
      goto LABEL_14;
    }
    if (AFIsVision()) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 2;
    }
  }
LABEL_14:
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = [NSNumber numberWithInteger:v15];
  [v16 setObject:v17 forKey:&unk_1F23C4A00];

  id v18 = [NSNumber numberWithInteger:v15];
  [v16 setObject:v18 forKey:&unk_1F23C4A18];

  BOOL v19 = [NSNumber numberWithInteger:v15];
  [v16 setObject:v19 forKey:&unk_1F23C4A30];

  return v16;
}

+ (id)_alertBehaviorForRecordRoute:(id)a3 playbackRoute:(id)a4 speechEvent:(int64_t)a5 speechRecordingMode:(int64_t)a6 ringerState:(int64_t)a7 startingAlertBeepOverideID:(int64_t)a8 presentationMode:(int64_t)a9 usePrelistening:(BOOL)a10 isOnPhoneCall:(BOOL)a11 hasPlayedStartAlert:(BOOL)a12 supportsEchoCancellation:(BOOL)a13 isVoiceOverTouchEnabled:(BOOL)a14 isVibrationEnabled:(BOOL)a15 isVibrationSupported:(BOOL)a16 suppressStartAlert:(BOOL)a17 activationHostTime:(unint64_t)a18
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  __int16 v23 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v24 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    id v25 = v21;
    int64_t v26 = v24;
    AFDeviceRingerSwitchStateGetName();
    int64_t v39 = a7;
    v28 = id v27 = v22;
    uint64_t v29 = AFSoundIDGetName();
    *(_DWORD *)buf = 136319234;
    int v44 = "+[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerS"
          "tate:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEch"
          "oCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:]";
    __int16 v45 = 2112;
    v46 = v25;
    __int16 v47 = 2112;
    __int16 v48 = v27;
    __int16 v49 = 2048;
    int64_t v50 = a5;
    __int16 v51 = 2048;
    int64_t v52 = a6;
    __int16 v53 = 2112;
    uint64_t v54 = v28;
    __int16 v55 = 2112;
    v56 = v29;
    __int16 v57 = 2048;
    int64_t v58 = a9;
    __int16 v59 = 1024;
    BOOL v60 = a10;
    __int16 v61 = 1024;
    BOOL v62 = a11;
    __int16 v63 = 1024;
    BOOL v64 = a12;
    __int16 v65 = 1024;
    BOOL v66 = a13;
    __int16 v67 = 1024;
    BOOL v68 = a14;
    __int16 v69 = 1024;
    BOOL v70 = a15;
    __int16 v71 = 1024;
    BOOL v72 = a16;
    __int16 v73 = 1024;
    BOOL v74 = a17;
    __int16 v75 = 2048;
    unint64_t v76 = a18;
    _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_INFO, "%s recordRoute = %@, playbackRoute = %@, unint64_t speechEvent = %lu, speechRecordingMode = %lu, AFDeviceRingerSwitchState = %@, AFSoundID = %@, AFPresentationMode = %lu, usePrelistening = %d, isOnPhoneCall = %d, hasPlayedStartAlert = %d, supportsEchoCancellation = %d, isVoiceOverTouchEnabled = %d, isVibrationEnabled = %d, isVibrationSupported = %d, suppressStartAlert = %d, activationHostTime = %llu", buf, 0x8Cu);

    id v22 = v27;
    a7 = v39;

    id v21 = v25;
    __int16 v23 = (os_log_t *)MEMORY[0x1E4F4E380];
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BYTE4(v38) = a16;
    BYTE3(v38) = a15;
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a13, a12);
    uint64_t v30 = objc_msgSend(a1, "_alertDictionaryForRecordRoute:playbackRoute:speechEvent:ringerState:startingAlertBeepOverideID:presentationMode:hasPlayedStartAlert:supportsEchoCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:activationHostTime:", v21, v22, a5, a7, a8, a9, v38, a18);
  }
  else
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      int v31 = 0;
      goto LABEL_10;
    }
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a16, a15);
    uint64_t v30 = objc_msgSend(a1, "_dictationAlertBehaviorDictionaryForRecordRoute:playbackRoute:ringerState:usePrelistening:suppressStartAlert:supportsEchoCancellation:isVibrationEnabled:isVibrationSupported:isVoiceOverTouchEnabled:", v21, v22, a7, a10, a17, a13, v38);
  }
  int v31 = (void *)v30;
  os_log_t v32 = *v23;
  if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = v32;
    int v34 = [v31 objectForKey:&unk_1F23C4A00];
    int v35 = [v31 objectForKey:&unk_1F23C4A18];
    int v36 = [v31 objectForKey:&unk_1F23C4A30];
    *(_DWORD *)buf = 136315906;
    int v44 = "+[CSSiriAudioActivationInfo _alertBehaviorForRecordRoute:playbackRoute:speechEvent:speechRecordingMode:ringerS"
          "tate:startingAlertBeepOverideID:presentationMode:usePrelistening:isOnPhoneCall:hasPlayedStartAlert:supportsEch"
          "oCancellation:isVoiceOverTouchEnabled:isVibrationEnabled:isVibrationSupported:suppressStartAlert:activationHostTime:]";
    __int16 v45 = 2112;
    v46 = v34;
    __int16 v47 = 2112;
    __int16 v48 = v35;
    __int16 v49 = 2112;
    int64_t v50 = (int64_t)v36;
    _os_log_impl(&dword_1C9338000, v33, OS_LOG_TYPE_INFO, "%s alertBehaviorStart = %@, alertBehaviorEnd = %@ alertBehaviorError = %@", buf, 0x2Au);
  }
LABEL_10:

  return v31;
}

+ (BOOL)_doesRecordRouteSupportZLL:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F150F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F15328]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F152F8]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"HACBuiltIn"];
  }

  return v4;
}

@end