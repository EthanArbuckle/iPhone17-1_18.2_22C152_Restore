@interface AFFeatureFlags
+ (BOOL)forceAsrOnServerForUOD;
+ (BOOL)isASRAdoptingUAFEnabled;
+ (BOOL)isASRSpeechProfileMigrationEnabled;
+ (BOOL)isASRSpeechProfileSharedDataEnabled;
+ (BOOL)isASRViaSpeechAPIEnabled;
+ (BOOL)isAWDLFallbackForPersonalRequestsEnabled;
+ (BOOL)isAccessibleAnnounceEnabled;
+ (BOOL)isAnnounceEnabled;
+ (BOOL)isAnnounceGroupFaceTimeInviteEnabled;
+ (BOOL)isAnnounceMessagesInCarPlayEnabled;
+ (BOOL)isAnnounceNotificationsEnabled;
+ (BOOL)isAnnouncePolicyEnhancementsEnabled;
+ (BOOL)isAnnounceTelephonyEnabled;
+ (BOOL)isAsrOnServerForUODEnabled;
+ (BOOL)isAssistantEngineEnabled;
+ (BOOL)isAudioAppPredictionOnHomePodEnabled;
+ (BOOL)isAudioSessionCoordinationEnabled;
+ (BOOL)isBlindedSphinxEnabled;
+ (BOOL)isBlushingPhantomEnabled;
+ (BOOL)isBobbleEnabled;
+ (BOOL)isCDAFaceDetectionEnabled;
+ (BOOL)isCaballeroEnabled;
+ (BOOL)isContinuousConversationEnabled;
+ (BOOL)isCrossDeviceArbitrationFeedbackEnabled;
+ (BOOL)isCrossDeviceMediaControlFromWatchEnabled;
+ (BOOL)isCrossDeviceTVControlEnabled;
+ (BOOL)isCrossDeviceTVControlFromWatchEnabled;
+ (BOOL)isCrossDeviceVoiceFollowUpEnabled;
+ (BOOL)isDictationAutoPunctuationEnabled;
+ (BOOL)isDictationEmojiRecognitionEnabled;
+ (BOOL)isDictationEuclidAlternativesEnabled;
+ (BOOL)isDictationOnSRDEnabled;
+ (BOOL)isDictationUserEditClassificationEnabled;
+ (BOOL)isDictationVoiceCommandsEnabled;
+ (BOOL)isDictationVoiceTriggerEnabled;
+ (BOOL)isDomainServerFallbackDisabled;
+ (BOOL)isDomainServerFallbackDisabledForLocale:(id)a3;
+ (BOOL)isFileARadarSupported;
+ (BOOL)isForceBLEDiscoveryForCompanionLinkEnabled;
+ (BOOL)isHSAnswerCallNotificationEnabled;
+ (BOOL)isHighSpeedSiriTTSEnabled;
+ (BOOL)isHintsEnabled;
+ (BOOL)isHomeAutomationBackgroundRequestEnabled;
+ (BOOL)isIFFlowEnabled;
+ (BOOL)isIdentityBridgeInstrumentationEnabled;
+ (BOOL)isIdentityScoreConsumptionEnabled;
+ (BOOL)isInfoDomainsRFEnabled;
+ (BOOL)isIntuitiveConversationAnnounceEnabled;
+ (BOOL)isLassoEnabled;
+ (BOOL)isListeningOnBothStereoPairUnitsEnabled;
+ (BOOL)isLocationSearchContinuityEnabled;
+ (BOOL)isMediaEntitySyncDisabled;
+ (BOOL)isMedocFeatureEnabled;
+ (BOOL)isMedocFeatureEnabledForHybridMode;
+ (BOOL)isMultilingualResponseVariantSelectorEnabled;
+ (BOOL)isMyriadNonSpeakerRawScoreThresholdEnabled;
+ (BOOL)isMyriadSelfMetricsEnabled;
+ (BOOL)isNLRouterEnabled;
+ (BOOL)isNLServerFallbackDisabled;
+ (BOOL)isNLServerFallbackDisabledForLocale:(id)a3;
+ (BOOL)isNLServerFallbackDisabledWithExperiment;
+ (BOOL)isNanoSiriUIRefreshEnabled;
+ (BOOL)isNotificationVoiceActionsEnabled;
+ (BOOL)isNotifyConnectionIssuesEnabled;
+ (BOOL)isOlympusEnabled;
+ (BOOL)isOnDeviceHistoryDeletionEnabled;
+ (BOOL)isOptOutLogRedactionEnabled;
+ (BOOL)isPatientSiriFeatureEnabled;
+ (BOOL)isPersistentIDLoggingDisabledForType:(int64_t)a3;
+ (BOOL)isPersistentIDLoggingInternalBuildRuleEnabled;
+ (BOOL)isPersistentIDLoggingInternalSettingEnabled;
+ (BOOL)isPersonalRequestDefinedErrorDialogsServerEnabled;
+ (BOOL)isRemoraEnabled;
+ (BOOL)isResponseFrameworkEnabled;
+ (BOOL)isRingtoneOverA2DPEnabled;
+ (BOOL)isSAELocaleOverrideEnabled;
+ (BOOL)isSAEOverrideEnabled;
+ (BOOL)isSCDAFrameworkEnabled;
+ (BOOL)isSCDAProximityEnabled;
+ (BOOL)isSCDATrialEnabled;
+ (BOOL)isSDTForASREnabled;
+ (BOOL)isServerFallbackDisabledWhenMissingAsset;
+ (BOOL)isShimToolsEnabled;
+ (BOOL)isSiriBackgroundSessionEnabled;
+ (BOOL)isSiriCapellaEnabledForTVOS;
+ (BOOL)isSiriDataSharingRepromptEnabled;
+ (BOOL)isSiriEntityMatcherMigrationEnabled;
+ (BOOL)isSiriHybridUODEnabledForATV;
+ (BOOL)isSiriHybridUODEnabledForHomePod;
+ (BOOL)isSiriHybridUODEnabledForMacOS;
+ (BOOL)isSiriHybridUODEnabledForRemora;
+ (BOOL)isSiriHybridUODEnabledForWatchOS;
+ (BOOL)isSiriLocationServicesPromptingEnabled;
+ (BOOL)isSiriMUSessionsEnabled;
+ (BOOL)isSiriMUXEnabledForTVOS;
+ (BOOL)isSiriPommesEnabled;
+ (BOOL)isSiriPommesEnabledForLanguage:(id)a3;
+ (BOOL)isSiriRelayEnabled;
+ (BOOL)isSiriRequestDispatcherEnabled;
+ (BOOL)isSiriUODAvailableForLanguage:(id)a3;
+ (BOOL)isSiriUODEnabledForMacOS;
+ (BOOL)isSiriUODEnabledForTVOS;
+ (BOOL)isSiriUODEnabledForWatchOS;
+ (BOOL)isSiriUODForceDisabledForTVOS;
+ (BOOL)isSiriUODForceEnabledForDevice;
+ (BOOL)isSiriXEnabled;
+ (BOOL)isStateFeedbackEnabled;
+ (BOOL)isStationaryDeviceLocationManagerEnabled;
+ (BOOL)isSystemAssistantExperienceEnabled;
+ (BOOL)isTVAirPodsEnabled;
+ (BOOL)isTVPolyglotEnabled;
+ (BOOL)isTVPushToTalkEnabled;
+ (BOOL)isThemisABEnabled;
+ (BOOL)isTimerAlarmCoordinationEnabled;
+ (BOOL)isTrialDictationAssetDeliveryEnabled;
+ (BOOL)isUnifiedAssetNamespaceEnabled;
+ (BOOL)isiPadFallbackForPersonalRequestsEnabled;
+ (id)featureFlags;
+ (id)sharedInstance;
+ (void)dump;
+ (void)setLocationSearchContinuityEnabled:(BOOL)a3;
@end

@implementation AFFeatureFlags

+ (BOOL)isSiriDataSharingRepromptEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAccessibleAnnounceEnabled
{
  return _os_feature_enabled_impl();
}

+ (void)dump
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = +[AFFeatureFlags featureFlags];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    v5 = "+[AFFeatureFlags dump]";
    __int16 v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (id)featureFlags
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    CFArrayRef v2 = CFPreferencesCopyKeyList(@"com.apple.assistant.features", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    CFArrayRef obj = v2;
    uint64_t v3 = [(__CFArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v7 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v8 = [NSString stringWithFormat:@"%@%@", @"X-Dev-ConfigOverride-", v7];
          v9 = (void *)CFPreferencesCopyAppValue(v7, @"com.apple.assistant.features");
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 BOOLValue]) {
            [v13 setObject:@"true" forKey:v8];
          }
        }
        uint64_t v4 = [(__CFArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }
  }
  if (+[AFFeatureFlags isOlympusEnabled])
  {
    v10 = [NSString stringWithFormat:@"%@%@", @"X-Dev-ConfigOverride-", @"assistant.service.olympus.enabled"];
    [v13 setObject:@"true" forKey:v10];
  }
  if (+[AFFeatureFlags isInfoDomainsRFEnabled])
  {
    v11 = [NSString stringWithFormat:@"%@%@", @"X-Dev-ConfigOverride-", @"assistant.service.InfoDomainsRF.enabled"];
    [v13 setObject:@"true" forKey:v11];
  }
  return v13;
}

+ (void)setLocationSearchContinuityEnabled:(BOOL)a3
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  CFPreferencesSetAppValue(@"assistant.service.location-search.continuity.enabled", v3, @"com.apple.assistant.features");
  CFPreferencesAppSynchronize(@"com.apple.assistant.features");
}

+ (BOOL)isLocationSearchContinuityEnabled
{
  CFArrayRef v2 = (void *)CFPreferencesCopyAppValue(@"assistant.service.location-search.continuity.enabled", @"com.apple.assistant.features");
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14500);
  }
  CFArrayRef v2 = (void *)sharedInstance_sFeatureFlags;
  return v2;
}

void __32__AFFeatureFlags_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AFFeatureFlags);
  v1 = (void *)sharedInstance_sFeatureFlags;
  sharedInstance_sFeatureFlags = (uint64_t)v0;
}

+ (BOOL)isSiriRelayEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriBackgroundSessionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriMUSessionsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isIFFlowEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isShimToolsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriLocationServicesPromptingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnouncePolicyEnhancementsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriCapellaEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isIdentityScoreConsumptionEnabled
{
  return 0;
}

+ (BOOL)isIdentityBridgeInstrumentationEnabled
{
  return 0;
}

+ (BOOL)isBobbleEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingInternalBuildRuleEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingInternalSettingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOnDeviceHistoryDeletionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersistentIDLoggingDisabledForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return 0;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

+ (BOOL)isSAEOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSystemAssistantExperienceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSAELocaleOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAssistantEngineEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLRouterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriEntityMatcherMigrationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isiPadFallbackForPersonalRequestsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAWDLFallbackForPersonalRequestsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHighSpeedSiriTTSEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPersonalRequestDefinedErrorDialogsServerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isForceBLEDiscoveryForCompanionLinkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHSAnswerCallNotificationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNotifyConnectionIssuesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOptOutLogRedactionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPatientSiriFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMedocFeatureEnabledForHybridMode
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMedocFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMultilingualResponseVariantSelectorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDomainServerFallbackDisabledForLocale:(id)a3
{
  return +[AFFeatureFlags isDomainServerFallbackDisabled];
}

+ (BOOL)isNLServerFallbackDisabledForLocale:(id)a3
{
  return +[AFFeatureFlags isNLServerFallbackDisabled];
}

+ (BOOL)isNLServerFallbackDisabledWithExperiment
{
  return 1;
}

+ (BOOL)isServerFallbackDisabledWhenMissingAsset
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDomainServerFallbackDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLServerFallbackDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStateFeedbackEnabled
{
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (AFIsHorseman_isHorseman) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

+ (BOOL)isIntuitiveConversationAnnounceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceArbitrationFeedbackEnabled
{
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal && (_os_feature_enabled_impl() & 1) != 0) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

+ (BOOL)isMediaEntitySyncDisabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriPommesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriPommesEnabledForLanguage:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (isSiriPommesEnabledForLanguage__once != -1)
  {
    dispatch_once(&isSiriPommesEnabledForLanguage__once, &__block_literal_global_253);
    if (v4) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  if (!v3) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v5 = [(id)isSiriPommesEnabledForLanguage__supportByLanguage objectForKey:v4];
  int v6 = [v5 BOOLValue];

  if (!v6 || !_os_feature_enabled_impl()) {
    goto LABEL_7;
  }
  CFStringRef v7 = [(id)isSiriPommesEnabledForLanguage__supportByLanguage objectForKeyedSubscript:v4];
  BOOL v8 = v7 != 0;

LABEL_8:
  return v8;
}

void __66__AFFeatureFlags_SWEFeatureFlags__isSiriPommesEnabledForLanguage___block_invoke()
{
  v46[43] = *MEMORY[0x1E4F143B8];
  v45[0] = @"en-US";
  v44 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[0] = v44;
  v45[1] = @"zh-CN";
  v43 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[1] = v43;
  v45[2] = @"en-GB";
  v42 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[2] = v42;
  v45[3] = @"en-AU";
  v41 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[3] = v41;
  v45[4] = @"en-CA";
  v40 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[4] = v40;
  v45[5] = @"en-IN";
  v39 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[5] = v39;
  v45[6] = @"de-DE";
  v38 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[6] = v38;
  v45[7] = @"ja-JP";
  v37 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[7] = v37;
  v45[8] = @"fr-FR";
  v36 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[8] = v36;
  v45[9] = @"es-MX";
  v35 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[9] = v35;
  v45[10] = @"es-ES";
  v34 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[10] = v34;
  v45[11] = @"es-US";
  v33 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[11] = v33;
  v45[12] = @"zh-HK";
  v32 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[12] = v32;
  v45[13] = @"ar-SA";
  v31 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[13] = v31;
  v45[14] = @"en-SG";
  v30 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[14] = v30;
  v45[15] = @"it-IT";
  v29 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[15] = v29;
  v45[16] = @"ko-KR";
  v28 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[16] = v28;
  v45[17] = @"ru-RU";
  v27 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[17] = v27;
  v45[18] = @"tr-TR";
  v26 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[18] = v26;
  v45[19] = @"yue-CN";
  v25 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[19] = v25;
  v45[20] = @"zh-TW";
  v24 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[20] = v24;
  v45[21] = @"da-DK";
  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[21] = v23;
  v45[22] = @"de-AT";
  v22 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[22] = v22;
  v45[23] = @"de-CH";
  v21 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[23] = v21;
  v45[24] = @"en-IE";
  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[24] = v20;
  v45[25] = @"en-NZ";
  v19 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[25] = v19;
  v45[26] = @"en-ZA";
  long long v18 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[26] = v18;
  v45[27] = @"es-CL";
  long long v17 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[27] = v17;
  v45[28] = @"fi-FI";
  long long v16 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[28] = v16;
  v45[29] = @"fr-BE";
  long long v15 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[29] = v15;
  v45[30] = @"fr-CA";
  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[30] = v14;
  v45[31] = @"fr-CH";
  id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[31] = v13;
  v45[32] = @"he-IL";
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[32] = v12;
  v45[33] = @"it-CH";
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[33] = v11;
  v45[34] = @"ms-MY";
  v0 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[34] = v0;
  v45[35] = @"nb-NO";
  v1 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[35] = v1;
  v45[36] = @"nl-BE";
  CFArrayRef v2 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[36] = v2;
  v45[37] = @"nl-NL";
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[37] = v3;
  v45[38] = @"pt-BR";
  char v4 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[38] = v4;
  v45[39] = @"sv-SE";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[39] = v5;
  v45[40] = @"th-TH";
  int v6 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[40] = v6;
  v45[41] = @"id-ID";
  CFStringRef v7 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[41] = v7;
  v45[42] = @"vi-VN";
  BOOL v8 = [MEMORY[0x1E4F28ED0] numberWithBool:_os_feature_enabled_impl()];
  v46[42] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:43];
  v10 = (void *)isSiriPommesEnabledForLanguage__supportByLanguage;
  isSiriPommesEnabledForLanguage__supportByLanguage = v9;
}

+ (BOOL)isOlympusEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTVAirPodsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isInfoDomainsRFEnabled
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

+ (BOOL)isAudioAppPredictionOnHomePodEnabled
{
  CFArrayRef v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.assistant"];
  char v3 = [v2 BOOLForKey:@"AudioAppPredictionHomePod"];
  char v4 = _os_feature_enabled_impl() | v3;

  return v4;
}

+ (BOOL)isASRViaSpeechAPIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRSpeechProfileSharedDataEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRSpeechProfileMigrationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isASRAdoptingUAFEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUnifiedAssetNamespaceEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStationaryDeviceLocationManagerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFileARadarSupported
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContinuousConversationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSDTForASREnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNanoSiriUIRefreshEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMyriadSelfMetricsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDATrialEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDAProximityEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSCDAFrameworkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCDAFaceDetectionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRingtoneOverA2DPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNotificationVoiceActionsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTVPolyglotEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationOnSRDEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTVPushToTalkEnabled
{
  return 0;
}

+ (BOOL)isBlindedSphinxEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isBlushingPhantomEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isResponseFrameworkEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceTVControlFromWatchEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceVoiceFollowUpEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceMessagesInCarPlayEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceMediaControlFromWatchEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCrossDeviceTVControlEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceNotificationsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriRequestDispatcherEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHomeAutomationBackgroundRequestEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isListeningOnBothStereoPairUnitsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTimerAlarmCoordinationEnabled
{
  return 0;
}

+ (BOOL)isAnnounceGroupFaceTimeInviteEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceTelephonyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLassoEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCaballeroEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMyriadNonSpeakerRawScoreThresholdEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRemoraEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isThemisABEnabled
{
  return 1;
}

+ (BOOL)isAudioSessionCoordinationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHintsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationEuclidAlternativesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationUserEditClassificationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationVoiceCommandsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTrialDictationAssetDeliveryEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationEmojiRecognitionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationAutoPunctuationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDictationVoiceTriggerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForATV
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForRemora
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForHomePod
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForMacOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriHybridUODEnabledForWatchOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriMUXEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODForceEnabledForDevice
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForMacOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForWatchOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODForceDisabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODEnabledForTVOS
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAsrOnServerForUODEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)forceAsrOnServerForUOD
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriUODAvailableForLanguage:(id)a3
{
  id v3 = a3;
  if (isSiriUODAvailableForLanguage__once != -1) {
    dispatch_once(&isSiriUODAvailableForLanguage__once, &__block_literal_global_42_14839);
  }
  if ([(id)isSiriUODAvailableForLanguage__top13Locales containsObject:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [(id)isSiriUODAvailableForLanguage__bottom28Locales containsObject:v3];
  }

  return v4;
}

void __65__AFFeatureFlags_SWEFeatureFlags__isSiriUODAvailableForLanguage___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEE99640];
  v1 = (void *)isSiriUODAvailableForLanguage__top13Locales;
  isSiriUODAvailableForLanguage__top13Locales = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEE99658];
  id v3 = (void *)isSiriUODAvailableForLanguage__bottom28Locales;
  isSiriUODAvailableForLanguage__bottom28Locales = v2;
}

+ (BOOL)isSiriXEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAnnounceEnabled
{
  id ANAnnounceFeatureStatusClass = getANAnnounceFeatureStatusClass();
  return [ANAnnounceFeatureStatusClass isEnabled];
}

@end