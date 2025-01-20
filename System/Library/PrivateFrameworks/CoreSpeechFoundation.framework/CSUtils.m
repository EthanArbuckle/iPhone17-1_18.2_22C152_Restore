@interface CSUtils
+ ($115C4C562B26FF47E01F9F4EA65B5887)getTokenFromDictionary:(SEL)a3 withTokenKey:(id)a4;
+ (BOOL)_createLoggingDirectoryIfNeeded:(id)a3;
+ (BOOL)allowExtendedRingBufferSize;
+ (BOOL)checkEntitlementForToken:(id *)a3 withEntitlement:(id)a4;
+ (BOOL)deviceRequirePowerAssertionHeld;
+ (BOOL)deviceRequirePreventStandbyAssertion;
+ (BOOL)faultPagesWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 filePath:(id)a5;
+ (BOOL)hasRemoteBuiltInMic;
+ (BOOL)hasRemoteCoreSpeech;
+ (BOOL)isASRViaSpeechAPIEnabled;
+ (BOOL)isAttentiveSiriEnabled;
+ (BOOL)isBluetoothAudioDeviceConnected;
+ (BOOL)isBluetoothVehicleOutput;
+ (BOOL)isBridgeOS;
+ (BOOL)isBuiltInRecordRoute:(id)a3;
+ (BOOL)isBuiltInRouteWithRecordRoute:(id)a3 playbackRoute:(id)a4;
+ (BOOL)isCarplayWithFlexibleFollowupEnabled;
+ (BOOL)isContinuousConversationEnabled;
+ (BOOL)isContinuousConversationSupported;
+ (BOOL)isDarwinOS;
+ (BOOL)isDisplayPortRouteWithRecordRoute:(id)a3;
+ (BOOL)isDoAPAudioRouteWithRecordRoute:(id)a3;
+ (BOOL)isExclaveHardware;
+ (BOOL)isFirstPassSourceTypeRingtoneWithVTEI:(id)a3;
+ (BOOL)isFlexibleEndpointingEnabled;
+ (BOOL)isHFPWithRecordRoute:(id)a3;
+ (BOOL)isHeadphoneDeviceWithRecordRoute:(id)a3 playbackRoute:(id)a4;
+ (BOOL)isHypotheticalAudioRouteBluetoothFromAudioSessinoId:(unsigned int)a3;
+ (BOOL)isIOSDeviceSupportingBargeIn;
+ (BOOL)isJarvisAudioRouteWithRecordRoute:(id)a3;
+ (BOOL)isLocalVoiceTriggerAvailable;
+ (BOOL)isM9Device;
+ (BOOL)isMagusDisabledForLanguageCode:(id)a3;
+ (BOOL)isMedocFeatureEnabled;
+ (BOOL)isMultiUserMedocFeatureEnabled;
+ (BOOL)isNNVADFallbackUnexpectedForLanguageCode:(id)a3;
+ (BOOL)isOnDeviceASRAudioLoggingEnabled;
+ (BOOL)isOutOfBandAudioRouteWithRecordRoute:(id)a3;
+ (BOOL)isOutputDevice:(unsigned int)a3 relatedToInputDevice:(unsigned int)a4;
+ (BOOL)isRecordContextAutoPrompt:(id)a3;
+ (BOOL)isRecordContextBuiltInVoiceTrigger:(id)a3;
+ (BOOL)isRecordContextDarwinVoiceTrigger:(id)a3;
+ (BOOL)isRecordContextHearstDoubleTap:(id)a3;
+ (BOOL)isRecordContextHearstVoiceTrigger:(id)a3;
+ (BOOL)isRecordContextHomeButtonPress:(id)a3;
+ (BOOL)isRecordContextJarvisButtonPress:(id)a3;
+ (BOOL)isRecordContextJarvisVoiceTrigger:(id)a3;
+ (BOOL)isRecordContextRaiseToSpeak:(id)a3;
+ (BOOL)isRecordContextRemoraVoiceTrigger:(id)a3;
+ (BOOL)isRecordContextSpeakerIdTrainingTrigger:(id)a3;
+ (BOOL)isRecordContextVoiceTrigger:(id)a3;
+ (BOOL)isRemoteDarwinWithDeviceId:(id)a3;
+ (BOOL)isSiriDSPTurnedOn;
+ (BOOL)isTCUSupported;
+ (BOOL)isValidRecordContext:(id)a3;
+ (BOOL)isVoiceTriggerFromExclaveWithVTEI:(id)a3;
+ (BOOL)machXPCConnection:(id)a3 hasEntitlement:(id)a4;
+ (BOOL)platformSupportsImplicitUttAddition;
+ (BOOL)readOptimizationMadviseWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 preLoadChunkSize:(unint64_t)a5;
+ (BOOL)shouldBlockVoiceTriggerWhenOtherAppRecording;
+ (BOOL)shouldDeinterleaveAudioOnCS;
+ (BOOL)shouldDelayTwoShotFeedbackForMyriadDecision;
+ (BOOL)shouldDownloadVTAssetsOnDaemon;
+ (BOOL)shouldUseHorsemanSpeechEndpointAssets;
+ (BOOL)supportAcousticProgressiveChecker;
+ (BOOL)supportAdBlocker;
+ (BOOL)supportAudioTappingSelfTrigger;
+ (BOOL)supportBeepCanceller:(unint64_t)a3 recordType:(int64_t)a4;
+ (BOOL)supportBluetoothDeviceVoiceTrigger;
+ (BOOL)supportCSTwoShotDecision;
+ (BOOL)supportCircularBuffer;
+ (BOOL)supportCompactPlus;
+ (BOOL)supportContinuousVoiceTrigger;
+ (BOOL)supportEarconRemoval;
+ (BOOL)supportEndpointerWhileHostAsleep;
+ (BOOL)supportHandsFree;
+ (BOOL)supportHangUp;
+ (BOOL)supportHearstVoiceTrigger;
+ (BOOL)supportHomeKitAccessory;
+ (BOOL)supportHybridEndpointer;
+ (BOOL)supportJarvisVoiceTrigger;
+ (BOOL)supportKeywordDetector;
+ (BOOL)supportLanguageDetector;
+ (BOOL)supportMedocAnnounce;
+ (BOOL)supportMph;
+ (BOOL)supportMphAssets;
+ (BOOL)supportMyriadLightHouse;
+ (BOOL)supportNonInterruptibleSiri;
+ (BOOL)supportOpportuneSpeakListener;
+ (BOOL)supportOpportunisticZLL;
+ (BOOL)supportPhatic;
+ (BOOL)supportPremiumAssets;
+ (BOOL)supportPremiumModel;
+ (BOOL)supportPremiumWatchAssets;
+ (BOOL)supportRaiseToSpeak;
+ (BOOL)supportRelayCall;
+ (BOOL)supportRemoraVoiceTrigger;
+ (BOOL)supportRemoteDarwinVoiceTrigger;
+ (BOOL)supportRingtoneA2DP;
+ (BOOL)supportSAT;
+ (BOOL)supportSelfTriggerSuppression:(unint64_t)a3 refChannelIdx:(unint64_t)a4;
+ (BOOL)supportSelfTriggerSuppressionWatch;
+ (BOOL)supportSessionActivateDelay;
+ (BOOL)supportSmartVolume;
+ (BOOL)supportStateFeedback;
+ (BOOL)supportTTS;
+ (BOOL)supportTelephonyAudioTap;
+ (BOOL)supportTrialMitigationAssets;
+ (BOOL)supportVoiceID;
+ (BOOL)supportVoiceTriggerChannelSelection;
+ (BOOL)supportZeroFilter:(unint64_t)a3;
+ (BOOL)supportsANE;
+ (BOOL)supportsAudioMessage;
+ (BOOL)supportsDictationOnDevice;
+ (BOOL)supportsDispatchWorkloop;
+ (BOOL)supportsEndpointingOnATV;
+ (BOOL)supportsHybridUnderstandingOnDevice;
+ (BOOL)supportsLogger;
+ (BOOL)supportsMagusForLanguageCode:(id)a3;
+ (BOOL)supportsMphForLanguageCode:(id)a3;
+ (BOOL)supportsMphForLanguageCode:(id)a3 forDeviceType:(unint64_t)a4;
+ (BOOL)supportsSCDAFramework;
+ (BOOL)supportsSiriLiminal;
+ (BOOL)supportsSpeakerRecognitionAssets;
+ (BOOL)supportsSpeechRecognitionOnDevice;
+ (BOOL)supportsUnderstandingOnDevice;
+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4;
+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4 withStringValue:(id)a5;
+ (double)systemUpTime;
+ (id)FourCCToString:(unsigned int)a3;
+ (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6;
+ (id)_readValuesInNestedDictionary:(id)a3 keyword:(id)a4 depth:(int64_t)a5 limitedDepth:(int64_t)a6;
+ (id)_sharedDisposeLoggingQueue;
+ (id)_timeStampString;
+ (id)audioPortSubtypeAsString:(unsigned int)a3;
+ (id)auditTokenToString:(id *)a3;
+ (id)dateWithSaltGrain;
+ (id)defaultDateFormatter;
+ (id)deviceBuildVersion;
+ (id)deviceHwRevision;
+ (id)deviceIdentifier;
+ (id)deviceProductType;
+ (id)deviceProductVersion;
+ (id)deviceUserAssignedName;
+ (id)dispatchWorkloopWithWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(int)a5;
+ (id)fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:(unsigned int)a3;
+ (id)fetchHypotheticalRouteFromAudioSession:(id)a3;
+ (id)getAudioSessionFromAudioSessionId:(unsigned int)a3;
+ (id)getResourcePathInSystemDomainMaskByAppending:(id)a3;
+ (id)getResourcePathInSystemDomainMaskFromRootPathByAppending:(id)a3;
+ (id)getSerialQueue:(id)a3 qualityOfService:(unsigned int)a4;
+ (id)getSerialQueue:(id)a3 withQualityOfService:(unsigned int)a4 andTargetQueue:(id)a5;
+ (id)getSerialQueueWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(unsigned __int8)a5;
+ (id)getSiriLanguageWithEndpointId:(id)a3 fallbackLanguage:(id)a4;
+ (id)getSiriLanguageWithFallback:(id)a3;
+ (id)loggingFilePathWithDirectory:(id)a3 requestId:(id)a4 token:(id)a5 postfix:(id)a6;
+ (id)loggingFilePathWithDirectory:(id)a3 token:(id)a4 postfix:(id)a5;
+ (id)readValuesFromJsonFile:(id)a3 keyword:(id)a4;
+ (id)recordContextString:(id)a3;
+ (id)rootQueueWithFixedPriority:(int)a3;
+ (id)timeStampWithSaltGrain;
+ (int)getFileDescriptor:(id)a3;
+ (int64_t)processIdentifier;
+ (unint64_t)fetchHypotheticalRouteType;
+ (unint64_t)fetchHypotheticalRouteTypeFromAudioSessionId:(unsigned int)a3;
+ (unint64_t)getFileSizeWithFd:(int)a3;
+ (unint64_t)horsemanDeviceType;
+ (unsigned)getAudioDeviceForHalUID:(id)a3;
+ (unsigned)getDefaultOutputAudioDevice;
+ (unsigned)getNumElementInBitset:(unint64_t)a3;
+ (unsigned)loggingHeartbeatRate;
+ (void)URLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5;
+ (void)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5;
+ (void)clearLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 exceedNumber:(unint64_t)a5;
+ (void)iterateBitset:(unint64_t)a3 block:(id)a4;
+ (void)mmapWithFile:(id)a3 mappedSizeOut:(id *)a4;
+ (void)purgeFilesWithExtensionInDirectory:(id)a3 extension:(id)a4 withFileToKep:(id)a5;
+ (void)removeDirectory:(id)a3;
+ (void)removeLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 beforeDays:(float)a5;
+ (void)withElapsedTimeLogging:(id)a3 execute:(id)a4;
@end

@implementation CSUtils

+ (BOOL)supportHangUp
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLocalVoiceTriggerAvailable
{
  if (isLocalVoiceTriggerAvailable_onceToken != -1) {
    dispatch_once(&isLocalVoiceTriggerAvailable_onceToken, &__block_literal_global_69);
  }
  return isLocalVoiceTriggerAvailable_defaultValue;
}

+ (BOOL)isDarwinOS
{
  return MEMORY[0x1F40CD660](0, a2);
}

+ (BOOL)checkEntitlementForToken:(id *)a3 withEntitlement:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a4;
  if (v6)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v8 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v8;
    v9 = SecTaskCreateWithAuditToken(v7, &token);
    CFErrorRef error = 0;
    long long v10 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v10;
    v11 = [a1 auditTokenToString:&token];
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 136315650;
      *(void *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
      LOWORD(token.val[3]) = 2112;
      *(void *)((char *)&token.val[3] + 2) = v11;
      HIWORD(token.val[5]) = 2112;
      *(void *)&token.val[6] = v6;
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Attempting to check %@ for entitlement: %@", (uint8_t *)&token, 0x20u);
    }
    if (!v9)
    {
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 136315394;
        *(void *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
        LOWORD(token.val[3]) = 2112;
        *(void *)((char *)&token.val[3] + 2) = v11;
        _os_log_error_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_ERROR, "%s Error creating audit token for: %@", (uint8_t *)&token, 0x16u);
      }
      BOOL v17 = 0;
      goto LABEL_20;
    }
    CFTypeRef v13 = SecTaskCopyValueForEntitlement(v9, v6, &error);
    v14 = error;
    if (error
      && (v15 = (void *)CSLogContextFacilityCoreSpeech,
          os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)))
    {
      v20 = v15;
      CFIndex Code = CFErrorGetCode(v14);
      token.val[0] = 136315650;
      *(void *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
      LOWORD(token.val[3]) = 2112;
      *(void *)((char *)&token.val[3] + 2) = v11;
      HIWORD(token.val[5]) = 2048;
      *(void *)&token.val[6] = Code;
      _os_log_error_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_ERROR, "%s Warning SecTaskCopyValueForEntitlement failed for token %@ with error (%ld)", (uint8_t *)&token, 0x20u);

      if (v13) {
        goto LABEL_8;
      }
    }
    else if (v13)
    {
LABEL_8:
      CFTypeID v16 = CFGetTypeID(v13);
      BOOL v17 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v13) != 0;
      CFRelease(v13);
LABEL_19:
      CFRelease(v9);
      if (!v14)
      {
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 136315138;
        *(void *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
        _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Error Issue retrieving entitlement", (uint8_t *)&token, 0xCu);
      }
      goto LABEL_22;
    }
    BOOL v17 = 0;
    goto LABEL_19;
  }
  v18 = CSLogContextFacilityCoreSpeech;
  BOOL v17 = 0;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    token.val[0] = 136315138;
    *(void *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
    _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Entitlement was nil. We will assume process is not entitled.", (uint8_t *)&token, 0xCu);
    BOOL v17 = 0;
  }
LABEL_23:

  return v17;
}

+ (id)auditTokenToString:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a3->var0[0]);
  [v4 appendString:v5];
  for (uint64_t i = 1; i != 8; ++i)
  {
    [v4 appendString:@"|"];

    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a3->var0[i]);
    [v4 appendString:v5];
  }

  return v4;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)getTokenFromDictionary:(SEL)a3 withTokenKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v7 = (const __CFDictionary *)a4;
  id v8 = a5;
  v9 = v8;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  if (v7 && v8)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v7, v8);
    v20.location = 0;
    v20.length = 32;
    CFDataGetBytes(Value, v20, (UInt8 *)retstr);
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "+[CSUtils(Security) getTokenFromDictionary:withTokenKey:]";
      __int16 v15 = 2112;
      CFDictionaryRef v16 = v7;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Token dict: %@ and tokenString: %@ both must be non nil", (uint8_t *)&v13, 0x20u);
    }
  }

  return result;
}

+ (int64_t)processIdentifier
{
  if (processIdentifier_onceToken != -1) {
    dispatch_once(&processIdentifier_onceToken, &__block_literal_global_184);
  }
  return processIdentifier_pid;
}

+ (BOOL)supportHandsFree
{
  if (supportHandsFree_onceToken != -1) {
    dispatch_once(&supportHandsFree_onceToken, &__block_literal_global_155);
  }
  return supportHandsFree_result;
}

+ (BOOL)isIOSDeviceSupportingBargeIn
{
  if (isIOSDeviceSupportingBargeIn_onceToken != -1) {
    dispatch_once(&isIOSDeviceSupportingBargeIn_onceToken, &__block_literal_global_89);
  }
  return isIOSDeviceSupportingBargeIn_supportBargeIn;
}

+ (BOOL)supportRelayCall
{
  if (CSIsIPad_onceToken != -1) {
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_22);
  }
  return CSIsIPad_isIPad;
}

+ (id)FourCCToString:(unsigned int)a3
{
  v5[0] = HIBYTE(a3);
  v5[1] = BYTE2(a3);
  v5[2] = BYTE1(a3);
  v5[3] = a3;
  v5[4] = 0;
  v3 = [NSString stringWithUTF8String:v5];
  return v3;
}

+ (BOOL)shouldUseHorsemanSpeechEndpointAssets
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)isNNVADFallbackUnexpectedForLanguageCode:(id)a3
{
  return 1;
}

+ (BOOL)isVoiceTriggerFromExclaveWithVTEI:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"firstPassTriggerSource"];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
      if ([v6 isEqualToString:@"ApplicationProcessorExclave"])
      {
        char v7 = 1;
      }
      else
      {
        id v8 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
        if ([v8 isEqualToString:@"BuiltInAlwaysOnProcessorExclave"])
        {
          char v7 = 1;
        }
        else
        {
          v9 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
          if ([v9 isEqualToString:@"ApplicationProcessorExclaveWithRingtone"])
          {
            char v7 = 1;
          }
          else
          {
            long long v10 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
            char v7 = [v10 isEqualToString:@"ApplicationProcessorExclaveWithConnectedCall"];
          }
        }
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isFirstPassSourceTypeRingtoneWithVTEI:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"firstPassTriggerSource"];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
      if ([v6 isEqualToString:@"ApplicationProcessorWithRingtone"])
      {
        char v7 = 1;
      }
      else
      {
        id v8 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
        char v7 = [v8 isEqualToString:@"ApplicationProcessorWithRingtone"];
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isOnDeviceASRAudioLoggingEnabled
{
  return 1;
}

+ (unint64_t)getFileSizeWithFd:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v5, 0, sizeof(v5));
  if (!fstat(a3, &v5)) {
    return v5.st_size;
  }
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    char v7 = "+[CSUtils getFileSizeWithFd:]";
    _os_log_error_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_ERROR, "%s failed to get file stats", buf, 0xCu);
  }
  return 0;
}

+ (unsigned)loggingHeartbeatRate
{
  return 60;
}

+ (BOOL)supportsLogger
{
  v2 = +[CSFPreferences sharedPreferences];
  char v3 = [v2 isAttentiveSiriAudioLoggingEnabled];

  return v3;
}

+ (BOOL)isExclaveHardware
{
  if (isExclaveHardware_onceToken != -1) {
    dispatch_once(&isExclaveHardware_onceToken, &__block_literal_global_254);
  }
  return isExclaveHardware_isExclaveHardware;
}

void __28__CSUtils_isExclaveHardware__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v0 = MGGetBoolAnswer();
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1) {
    [v1 isEqualToString:@"t8132"];
  }
  int v3 = _os_feature_enabled_impl();
  isExclaveHardware_isExclaveHardware = v0 & v3;
  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    stat v5 = @"NO";
    uint64_t v8 = "+[CSUtils isExclaveHardware]_block_invoke";
    if (v0) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    int v7 = 136315650;
    __int16 v9 = 2114;
    long long v10 = v6;
    if (v3) {
      stat v5 = @"YES";
    }
    __int16 v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s isExclaveCapable: %{public}@, isExclaveFeatureEnabledForPlatform: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

+ (BOOL)faultPagesWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 filePath:(id)a5
{
  *(void *)&v25[13] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (a3 && a4 && v7)
  {
    int v10 = +[CSUtils getFileDescriptor:v7];
    if (v10 < 0)
    {
      __int16 v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[CSUtils faultPagesWithVaddr:mmapedSize:filePath:]";
        __int16 v24 = 2112;
        *(void *)v25 = v8;
        _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s failed to open file of: %@", buf, 0x16u);
      }
      BOOL v9 = 0;
    }
    else
    {
      int v11 = v10;
      v21[0] = 0;
      v21[1] = a4;
      int v12 = fcntl(v10, 44, v21);
      BOOL v9 = v12 != -1;
      if (v12 == -1)
      {
        CFDictionaryRef v16 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v18 = v16;
          uint64_t v19 = __error();
          CFRange v20 = strerror(*v19);
          *(_DWORD *)buf = 136315650;
          v23 = "+[CSUtils faultPagesWithVaddr:mmapedSize:filePath:]";
          __int16 v24 = 1024;
          *(_DWORD *)v25 = v11;
          v25[2] = 2080;
          *(void *)&v25[3] = v20;
          _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, "%s failed to fcntl fd: %d with error: %s", buf, 0x1Cu);
        }
      }
      else
      {
        buf[0] = 0;
        uint64_t v13 = sysconf(29);
        unint64_t v14 = 0;
        do
        {
          buf[0] = *((unsigned char *)a3 + v14);
          v14 += v13;
        }
        while (v14 < a4);
      }
      close(v11);
    }
  }

  return v9;
}

+ (int)getFileDescriptor:(id)a3
{
  int v3 = (const char *)[a3 UTF8String];
  return open(v3, 0);
}

+ (BOOL)readOptimizationMadviseWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 preLoadChunkSize:(unint64_t)a5
{
  BOOL result = 0;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v6 = a4;
    if (a4)
    {
      if (a5)
      {
        BOOL v9 = 0;
        while (1)
        {
          size_t v10 = v6 >= a5 ? a5 : v6;
          if (madvise(&v9[(void)a3], v10, 3) < 0) {
            break;
          }
          v9 += v10;
          v6 -= v10;
          if (!v6)
          {
            int v11 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              int v17 = 136315394;
              v18 = "+[CSUtils readOptimizationMadviseWithVaddr:mmapedSize:preLoadChunkSize:]";
              __int16 v19 = 2048;
              CFRange v20 = v9;
              _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s read optimization processed size: %lu", (uint8_t *)&v17, 0x16u);
            }
            return 1;
          }
        }
        int v12 = (void *)CSLogContextFacilityCoreSpeech;
        BOOL v13 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
        BOOL result = 0;
        if (v13)
        {
          unint64_t v14 = v12;
          __int16 v15 = __error();
          CFDictionaryRef v16 = strerror(*v15);
          int v17 = 136315394;
          v18 = "+[CSUtils readOptimizationMadviseWithVaddr:mmapedSize:preLoadChunkSize:]";
          __int16 v19 = 2080;
          CFRange v20 = v16;
          _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to madvise() because error: %s", (uint8_t *)&v17, 0x16u);

          return 0;
        }
      }
    }
  }
  return result;
}

+ (void)mmapWithFile:(id)a3 mappedSizeOut:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[CSUtils getFileDescriptor:v5];
  if ((v6 & 0x80000000) != 0)
  {
    BOOL v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      int v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s failed to open file of: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_15;
  }
  int v7 = v6;
  unint64_t v8 = +[CSUtils getFileSizeWithFd:v6];
  if (!v8)
  {
    close(v7);
LABEL_15:
    int v11 = 0;
    goto LABEL_16;
  }
  size_t v9 = v8;
  size_t v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    int v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2048;
    size_t v21 = v9;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s readed file: %@ with mmaped size: %lu", (uint8_t *)&v16, 0x20u);
  }
  int v11 = mmap(0, v9, 1, 1, v7, 0);
  close(v7);
  if (!v11)
  {
    unint64_t v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      int v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot mmap the graph: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_15;
  }
  if (a4)
  {
    *a4 = [NSNumber numberWithUnsignedLong:v9];
  }
  int v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    int v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2048;
    size_t v21 = v9;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s mmaped file: %@ with mapped size: %lu is successful", (uint8_t *)&v16, 0x20u);
  }
LABEL_16:

  return v11;
}

+ (BOOL)supportsSCDAFramework
{
  if (supportsSCDAFramework_onceToken != -1) {
    dispatch_once(&supportsSCDAFramework_onceToken, &__block_literal_global_251);
  }
  return supportsSCDAFramework_scdaFrameworkEnabled;
}

uint64_t __32__CSUtils_supportsSCDAFramework__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F4E480] isSCDAFrameworkEnabled];
  supportsSCDAFramework_scdaFrameworkEnabled = result;
  return result;
}

+ (BOOL)isASRViaSpeechAPIEnabled
{
  if (isASRViaSpeechAPIEnabled_onceToken != -1) {
    dispatch_once(&isASRViaSpeechAPIEnabled_onceToken, &__block_literal_global_249);
  }
  return isASRViaSpeechAPIEnabled_isAvailable;
}

uint64_t __35__CSUtils_isASRViaSpeechAPIEnabled__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F4E480] isASRViaSpeechAPIEnabled];
  isASRViaSpeechAPIEnabled_isAvailable = result;
  return result;
}

+ (void)withElapsedTimeLogging:(id)a3 execute:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  int v7 = (void (**)(void))a4;
  unint64_t v8 = [v6 date];
  v7[2](v7);

  size_t v9 = [MEMORY[0x1E4F1C9C8] date];
  size_t v10 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = v10;
    [v9 timeIntervalSinceDate:v8];
    int v13 = 136315650;
    unint64_t v14 = "+[CSUtils withElapsedTimeLogging:execute:]";
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2050;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ elapsed time = %{public}lf", (uint8_t *)&v13, 0x20u);
  }
}

+ (BOOL)isSiriDSPTurnedOn
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportEarconRemoval
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportVoiceID
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportMedocAnnounce
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportStateFeedback
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTCUSupported
{
  return 1;
}

+ (BOOL)platformSupportsImplicitUttAddition
{
  return !+[CSUtils isDarwinOS];
}

+ (BOOL)allowExtendedRingBufferSize
{
  return !+[CSUtils isDarwinOS];
}

+ (id)getResourcePathInSystemDomainMaskFromRootPathByAppending:(id)a3
{
  return CSResourcePathInSystemDomainMaskByAppending(a3, 1);
}

+ (id)getResourcePathInSystemDomainMaskByAppending:(id)a3
{
  return CSResourcePathInSystemDomainMaskByAppending(a3, 0);
}

+ (unint64_t)horsemanDeviceType
{
  return 0;
}

+ (BOOL)supportTelephonyAudioTap
{
  return +[CSUtils isIOSDeviceSupportingBargeIn];
}

+ (BOOL)supportAudioTappingSelfTrigger
{
  if (+[CSUtils isExclaveHardware]) {
    return 1;
  }
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

+ (BOOL)supportsMagusForLanguageCode:(id)a3
{
  uint64_t v3 = supportsMagusForLanguageCode__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&supportsMagusForLanguageCode__onceToken, &__block_literal_global_242);
  }
  char v5 = [(id)supportsMagusForLanguageCode__magusSupportedLocales containsObject:v4];

  return v5;
}

uint64_t __40__CSUtils_supportsMagusForLanguageCode___block_invoke()
{
  supportsMagusForLanguageCode__magusSupportedLocales = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en-US", @"en-GB", @"en-CA", @"en-AU", @"de-DE", @"fr-FR", 0);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsMphForLanguageCode:(id)a3 forDeviceType:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = 0;
  if (a4 <= 9)
  {
    if (((1 << a4) & 0x1F7) != 0)
    {
      int v7 = &unk_1F13B84A0;
    }
    else
    {
      if (a4 == 3)
      {
        char v12 = 1;
        goto LABEL_20;
      }
      int v7 = &unk_1F13B84B8;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    unint64_t v8 = +[CSFPreferences sharedPreferences];
    size_t v9 = [v8 whiteListedMultiPhraseLocales];

    size_t v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      __int16 v15 = "+[CSUtils supportsMphForLanguageCode:forDeviceType:]";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s whiteListLocales: %@", (uint8_t *)&v14, 0x16u);
    }
    if (v9 && [v9 count]) {
      [v6 addObjectsFromArray:v9];
    }
  }
  int v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int16 v15 = "+[CSUtils supportsMphForLanguageCode:forDeviceType:]";
    __int16 v16 = 2112;
    __int16 v17 = v6;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s supportsMph language list: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 && +[CSUtils supportMph]) {
    char v12 = [v6 containsObject:v5];
  }
  else {
    char v12 = 0;
  }
LABEL_20:

  return v12;
}

+ (BOOL)supportsMphForLanguageCode:(id)a3
{
  id v3 = a3;
  if (+[CSUtils isDarwinOS])
  {
    id v4 = v3;
    uint64_t v5 = 3;
  }
  else
  {
    if (CSIsIPad_onceToken != -1) {
      dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_22);
    }
    id v4 = v3;
    if (CSIsIPad_isIPad) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  BOOL v6 = +[CSUtils supportsMphForLanguageCode:v4 forDeviceType:v5];

  return v6;
}

+ (BOOL)isM9Device
{
  if (isM9Device_onceToken != -1) {
    dispatch_once(&isM9Device_onceToken, &__block_literal_global_199);
  }
  return isM9Device_isM9Device;
}

uint64_t __21__CSUtils_isM9Device__block_invoke()
{
  int v0 = (void *)MGCopyAnswer();
  if (v0) {
    LOBYTE(v0) = [v0 isEqualToString:@"t8006"];
  }
  isM9Device_isM9Device = (char)v0;
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportMphAssets
{
  if (+[CSUtils isDarwinOS]) {
    return 1;
  }
  return AFDeviceSupportsSiriUOD();
}

+ (BOOL)supportMph
{
  BOOL v2 = +[CSUtils supportMphAssets];
  BOOL result = +[CSUtils isDarwinOS];
  if (!result && v2)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

+ (BOOL)shouldBlockVoiceTriggerWhenOtherAppRecording
{
  return 0;
}

+ (BOOL)supportRingtoneA2DP
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportTrialMitigationAssets
{
  return 1;
}

+ (BOOL)supportsEndpointingOnATV
{
  return 0;
}

void __28__CSUtils_processIdentifier__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28F80] processInfo];
  processIdentifier_pid = [v0 processIdentifier];
}

+ (BOOL)supportsAudioMessage
{
  return +[CSUtils isMedocFeatureEnabled];
}

+ (BOOL)deviceRequirePreventStandbyAssertion
{
  return +[CSUtils isDarwinOS];
}

+ (BOOL)deviceRequirePowerAssertionHeld
{
  return +[CSUtils isDarwinOS];
}

+ (BOOL)isFlexibleEndpointingEnabled
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (isFlexibleEndpointingEnabled_onceToken != -1) {
    dispatch_once(&isFlexibleEndpointingEnabled_onceToken, &__block_literal_global_181);
  }
  return isFlexibleEndpointingEnabled_result != 0;
}

uint64_t __39__CSUtils_isFlexibleEndpointingEnabled__block_invoke()
{
  uint64_t result = AFDeviceSupportsSiriUOD();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  isFlexibleEndpointingEnabled_uint64_t result = result;
  return result;
}

+ (BOOL)isMedocFeatureEnabled
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (isMedocFeatureEnabled_onceToken != -1) {
    dispatch_once(&isMedocFeatureEnabled_onceToken, &__block_literal_global_179);
  }
  return isMedocFeatureEnabled_result != 0;
}

uint64_t __32__CSUtils_isMedocFeatureEnabled__block_invoke()
{
  uint64_t result = AFDeviceSupportsMedoc();
  isMedocFeatureEnabled_uint64_t result = result;
  return result;
}

+ (BOOL)isMultiUserMedocFeatureEnabled
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (isMultiUserMedocFeatureEnabled_onceToken != -1) {
    dispatch_once(&isMultiUserMedocFeatureEnabled_onceToken, &__block_literal_global_177);
  }
  return isMultiUserMedocFeatureEnabled_result != 0;
}

uint64_t __41__CSUtils_isMultiUserMedocFeatureEnabled__block_invoke()
{
  uint64_t result = AFDeviceSupportsMedoc();
  if (result) {
    uint64_t result = AFDeviceSupportsSiriMUX();
  }
  isMultiUserMedocFeatureEnabled_uint64_t result = result;
  return result;
}

+ (BOOL)isCarplayWithFlexibleFollowupEnabled
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (isCarplayWithFlexibleFollowupEnabled_onceToken != -1) {
    dispatch_once(&isCarplayWithFlexibleFollowupEnabled_onceToken, &__block_literal_global_174);
  }
  return isCarplayWithFlexibleFollowupEnabled_result != 0;
}

uint64_t __47__CSUtils_isCarplayWithFlexibleFollowupEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  isCarplayWithFlexibleFollowupEnabled_uint64_t result = result;
  return result;
}

+ (BOOL)isContinuousConversationEnabled
{
  return +[CSUtils isContinuousConversationSupported];
}

+ (BOOL)isContinuousConversationSupported
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (isContinuousConversationSupported_onceToken != -1) {
    dispatch_once(&isContinuousConversationSupported_onceToken, &__block_literal_global_172);
  }
  return isContinuousConversationSupported_result;
}

void __44__CSUtils_isContinuousConversationSupported__block_invoke()
{
  int v0 = MGGetBoolAnswer();
  if (AFDeviceSupportsSiriUOD()
    && [MEMORY[0x1E4F4E480] isContinuousConversationEnabled])
  {
    if (+[CSUtils supportsANE] & v0) {
      goto LABEL_10;
    }
    if (CSIsInternalBuild_onceToken != -1) {
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
    }
    if (CSIsInternalBuild_isInternal)
    {
      if (CSIsVirtualMachine_onceToken != -1) {
        dispatch_once(&CSIsVirtualMachine_onceToken, &__block_literal_global_27);
      }
      if (CSIsVirtualMachine_isVM) {
LABEL_10:
      }
        isContinuousConversationSupported_uint64_t result = 1;
    }
  }
}

+ (BOOL)isMagusDisabledForLanguageCode:(id)a3
{
  uint64_t v3 = isMagusDisabledForLanguageCode__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isMagusDisabledForLanguageCode__onceToken, &__block_literal_global_166);
  }
  char v5 = [(id)isMagusDisabledForLanguageCode__magusNotSupportedLocales containsObject:v4];

  if (v4) {
    return v5;
  }
  else {
    return 1;
  }
}

uint64_t __42__CSUtils_isMagusDisabledForLanguageCode___block_invoke()
{
  isMagusDisabledForLanguageCode__magusNotSupportedLocales = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zh-CN", 0);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isAttentiveSiriEnabled
{
  return !+[CSUtils isDarwinOS];
}

+ (BOOL)supportsSpeechRecognitionOnDevice
{
  if (+[CSUtils supportsUnderstandingOnDevice]) {
    return 1;
  }
  return +[CSUtils supportsDictationOnDevice];
}

+ (BOOL)supportsDictationOnDevice
{
  if (supportsDictationOnDevice_onceToken != -1) {
    dispatch_once(&supportsDictationOnDevice_onceToken, &__block_literal_global_163);
  }
  return supportsDictationOnDevice_result;
}

uint64_t __36__CSUtils_supportsDictationOnDevice__block_invoke()
{
  uint64_t result = AFOfflineDictationCapable();
  if (result) {
    uint64_t result = [MEMORY[0x1E4F4E480] isDictationOnSRDEnabled];
  }
  supportsDictationOnDevice_uint64_t result = result;
  return result;
}

+ (BOOL)supportsHybridUnderstandingOnDevice
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (supportsHybridUnderstandingOnDevice_onceToken != -1) {
    dispatch_once(&supportsHybridUnderstandingOnDevice_onceToken, &__block_literal_global_161);
  }
  return supportsHybridUnderstandingOnDevice_result != 0;
}

uint64_t __46__CSUtils_supportsHybridUnderstandingOnDevice__block_invoke()
{
  uint64_t result = AFDeviceSupportsHybridUOD();
  supportsHybridUnderstandingOnDevice_uint64_t result = result;
  return result;
}

+ (BOOL)supportsUnderstandingOnDevice
{
  if (+[CSUtils isDarwinOS]) {
    return 0;
  }
  if (supportsUnderstandingOnDevice_onceToken != -1) {
    dispatch_once(&supportsUnderstandingOnDevice_onceToken, &__block_literal_global_159);
  }
  return supportsUnderstandingOnDevice_result != 0;
}

uint64_t __40__CSUtils_supportsUnderstandingOnDevice__block_invoke()
{
  uint64_t result = AFDeviceSupportsSiriUOD();
  supportsUnderstandingOnDevice_uint64_t result = result;
  return result;
}

+ (BOOL)supportsANE
{
  return MGGetBoolAnswer();
}

uint64_t __27__CSUtils_supportHandsFree__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    supportHandsFree_uint64_t result = 1;
  }
  return result;
}

+ (BOOL)supportNonInterruptibleSiri
{
  return +[CSUtils isIOSDeviceSupportingBargeIn];
}

+ (BOOL)supportsSiriLiminal
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return 1;
}

+ (BOOL)supportsSpeakerRecognitionAssets
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return supportsSpeakerRecognitionAssets_result;
  }
  BOOL result = 1;
  supportsSpeakerRecognitionAssets_BOOL result = 1;
  return result;
}

+ (BOOL)isBridgeOS
{
  return 0;
}

+ (id)dateWithSaltGrain
{
  BOOL v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = (double)arc4random_uniform(7u) * -86400.0;
  return (id)[v2 dateWithTimeIntervalSinceNow:v3];
}

+ (id)defaultDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  double v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd"];
  return v2;
}

+ (id)timeStampWithSaltGrain
{
  id v2 = [a1 defaultDateFormatter];
  double v3 = +[CSUtils dateWithSaltGrain];
  id v4 = [v2 stringFromDate:v3];

  return v4;
}

+ (id)deviceHwRevision
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"config-number", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      int v7 = (void *)[[NSString alloc] initWithData:CFProperty encoding:4];
      unint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/"];
      size_t v9 = [v7 componentsSeparatedByCharactersInSet:v8];

      if ((unint64_t)[v9 count] < 2)
      {
        char v12 = @"???";
      }
      else
      {
        size_t v10 = NSString;
        int v11 = [v9 objectAtIndexedSubscript:1];
        char v12 = [v10 stringWithFormat:@"%@", v11];
      }
      __int16 v16 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "+[CSUtils deviceHwRevision]";
        __int16 v20 = 2114;
        size_t v21 = v12;
        _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_INFO, "%s Fetched hardware revision : %{public}@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "+[CSUtils deviceHwRevision]";
        _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Failed to find property \"config-number\"", buf, 0xCu);
      }
      char v12 = @"???";
    }
    IOObjectRelease(v5);
    int v14 = v12;
  }
  else
  {
    int v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "+[CSUtils deviceHwRevision]";
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Failed to find matching service to IOPlatformExpertDevice", buf, 0xCu);
    }
    int v14 = @"???";
  }

  return v14;
}

+ (id)deviceBuildVersion
{
  mach_port_t v2 = (__CFString *)MGCopyAnswer();
  CFDictionaryRef v3 = v2;
  if (!v2) {
    mach_port_t v2 = @"???";
  }
  id v4 = v2;

  return v4;
}

+ (id)deviceUserAssignedName
{
  mach_port_t v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (double)systemUpTime
{
  if (systemUpTime_onceToken != -1) {
    dispatch_once(&systemUpTime_onceToken, &__block_literal_global_123);
  }
  double result = -1.0;
  if (systemUpTime_result != -1 && systemUpTime_bootTime != 0)
  {
    v4.tv_sec = 0;
    *(void *)&v4.tv_usec = 0;
    gettimeofday(&v4, 0);
    return (double)(v4.tv_usec - dword_1E9F40AA0) / 1000000.0 + (double)(v4.tv_sec - systemUpTime_bootTime);
  }
  return result;
}

uint64_t __23__CSUtils_systemUpTime__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)mach_port_t v2 = 0x1500000001;
  size_t v1 = 16;
  uint64_t result = sysctl(v2, 2u, &systemUpTime_bootTime, &v1, 0, 0);
  systemUpTime_uint64_t result = result;
  return result;
}

+ (id)deviceIdentifier
{
  if (deviceIdentifier_onceToken != -1) {
    dispatch_once(&deviceIdentifier_onceToken, &__block_literal_global_118);
  }
  mach_port_t v2 = deviceIdentifier_deviceId;
  return v2;
}

void __27__CSUtils_deviceIdentifier__block_invoke()
{
  int v0 = (__CFString *)MGCopyAnswer();
  size_t v1 = deviceIdentifier_deviceId;
  deviceIdentifier_deviceId = v0;

  if (deviceIdentifier_deviceId) {
    mach_port_t v2 = deviceIdentifier_deviceId;
  }
  else {
    mach_port_t v2 = @"???";
  }
  objc_storeStrong((id *)&deviceIdentifier_deviceId, v2);
}

+ (id)deviceProductVersion
{
  if (deviceProductVersion_onceToken != -1) {
    dispatch_once(&deviceProductVersion_onceToken, &__block_literal_global_113);
  }
  mach_port_t v2 = deviceProductVersion_currDeviceProductVersion[0];
  return v2;
}

void __31__CSUtils_deviceProductVersion__block_invoke()
{
  int v0 = (__CFString *)MGCopyAnswer();
  size_t v1 = deviceProductVersion_currDeviceProductVersion[0];
  deviceProductVersion_currDeviceProductVersion[0] = v0;

  if (deviceProductVersion_currDeviceProductVersion[0]) {
    mach_port_t v2 = deviceProductVersion_currDeviceProductVersion[0];
  }
  else {
    mach_port_t v2 = @"???";
  }
  objc_storeStrong((id *)deviceProductVersion_currDeviceProductVersion, v2);
}

+ (id)deviceProductType
{
  if (deviceProductType_onceToken != -1) {
    dispatch_once(&deviceProductType_onceToken, &__block_literal_global_108);
  }
  mach_port_t v2 = deviceProductType_currDeviceProductType;
  return v2;
}

void __28__CSUtils_deviceProductType__block_invoke()
{
  int v0 = (__CFString *)MGCopyAnswer();
  size_t v1 = deviceProductType_currDeviceProductType;
  deviceProductType_currDeviceProductType = v0;

  if (deviceProductType_currDeviceProductType) {
    mach_port_t v2 = deviceProductType_currDeviceProductType;
  }
  else {
    mach_port_t v2 = @"???";
  }
  objc_storeStrong((id *)&deviceProductType_currDeviceProductType, v2);
}

+ (id)getSerialQueue:(id)a3 withQualityOfService:(unsigned int)a4 andTargetQueue:(id)a5
{
  int v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  id v8 = a3;
  size_t v9 = a5;
  dispatch_queue_t v10 = dispatch_queue_create_with_target_V2((const char *)[v8 UTF8String], v7, v9);

  return v10;
}

+ (id)getSerialQueue:(id)a3 qualityOfService:(unsigned int)a4
{
  io_object_t v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[a3 UTF8String], v5);

  return v6;
}

+ (id)getSerialQueueWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  if (+[CSUtils supportsDispatchWorkloop]) {
    +[CSUtils dispatchWorkloopWithWithQOS:v6 name:v7 fixedPriority:v5];
  }
  else {
  id v8 = +[CSUtils rootQueueWithFixedPriority:v5];
  }
  size_t v9 = [NSString stringWithFormat:@"%@-serialq", v7];

  id v10 = v9;
  dispatch_queue_t v11 = dispatch_queue_create_with_target_V2((const char *)[v10 UTF8String], 0, v8);

  return v11;
}

+ (id)dispatchWorkloopWithWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(int)a5
{
  inactive = dispatch_workloop_create_inactive((const char *)[a4 cStringUsingEncoding:4]);
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_workloop_set_scheduler_priority();
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);
  return inactive;
}

+ (id)rootQueueWithFixedPriority:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  pthread_attr_init(&v7);
  sched_param v6 = 0;
  pthread_attr_getschedparam(&v7, &v6);
  v6.sched_priority = a3;
  pthread_attr_setschedparam(&v7, &v6);
  pthread_attr_setschedpolicy(&v7, 2);
  pthread_attr_setinheritsched(&v7, 2);
  timeval v4 = (void *)dispatch_pthread_root_queue_create();
  pthread_attr_destroy(&v7);
  return v4;
}

+ (BOOL)supportsDispatchWorkloop
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportZeroFilter:(unint64_t)a3
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return a3 < 2 && CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportBeepCanceller:(unint64_t)a3 recordType:(int64_t)a4
{
  if (a4 == 21) {
    return 0;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return a3 == 1 && CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportCircularBuffer
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 1;
  }
  return +[CSUtils supportBluetoothDeviceVoiceTrigger];
}

+ (BOOL)shouldDeinterleaveAudioOnCS
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 1;
  }
  return +[CSUtils isLocalVoiceTriggerAvailable];
}

+ (BOOL)supportRemoteDarwinVoiceTrigger
{
  if (supportRemoteDarwinVoiceTrigger_onceToken != -1) {
    dispatch_once(&supportRemoteDarwinVoiceTrigger_onceToken, &__block_literal_global_96);
  }
  return supportRemoteDarwinVoiceTrigger_supportDarwinVT;
}

uint64_t __42__CSUtils_supportRemoteDarwinVoiceTrigger__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportRemoteDarwinVoiceTrigger_supportDarwinVT = result;
  return result;
}

+ (BOOL)supportBluetoothDeviceVoiceTrigger
{
  if (+[CSUtils supportHearstVoiceTrigger]
    || (BOOL v2 = +[CSUtils supportJarvisVoiceTrigger]))
  {
    LOBYTE(v2) = !+[CSUtils isDarwinOS];
  }
  return v2;
}

+ (BOOL)supportHomeKitAccessory
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportVoiceTriggerChannelSelection
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportRemoraVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return !+[CSUtils isDarwinOS];
}

+ (BOOL)supportJarvisVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 0;
  }
  else {
    return !+[CSUtils isDarwinOS];
  }
}

+ (BOOL)supportOpportuneSpeakListener
{
  return 1;
}

+ (BOOL)supportHearstVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 0;
  }
  else {
    return !+[CSUtils isDarwinOS];
  }
}

+ (BOOL)hasRemoteCoreSpeech
{
  return 0;
}

+ (BOOL)supportAcousticProgressiveChecker
{
  if (!+[CSUtils isDarwinOS]) {
    return 1;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman != 0;
}

+ (BOOL)supportMyriadLightHouse
{
  return 0;
}

+ (BOOL)shouldDownloadVTAssetsOnDaemon
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportLanguageDetector
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportSessionActivateDelay
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return 1;
}

+ (BOOL)shouldDelayTwoShotFeedbackForMyriadDecision
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportPhatic
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return 1;
}

+ (BOOL)supportPremiumModel
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return 1;
  }
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  return CSHasAOP_hasAOP != 0;
}

+ (BOOL)supportAdBlocker
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

void __39__CSUtils_isIOSDeviceSupportingBargeIn__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    int v0 = 0;
  }
  else {
    int v0 = MGGetBoolAnswer();
  }
  isIOSDeviceSupportingBargeIn_supportBargeIn = v0;
  size_t v1 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = @"YES";
    if (!v0) {
      BOOL v2 = @"NO";
    }
    int v3 = 136315394;
    timeval v4 = "+[CSUtils isIOSDeviceSupportingBargeIn]_block_invoke";
    __int16 v5 = 2114;
    sched_param v6 = v2;
    _os_log_impl(&dword_1BA1A5000, v1, OS_LOG_TYPE_DEFAULT, "%s Device supporting barge-in ? %{public}@", (uint8_t *)&v3, 0x16u);
  }
}

+ (BOOL)supportPremiumWatchAssets
{
  return 0;
}

+ (BOOL)supportCompactPlus
{
  if (supportCompactPlus_onceToken != -1) {
    dispatch_once(&supportCompactPlus_onceToken, &__block_literal_global_85);
  }
  return 0;
}

+ (BOOL)supportRaiseToSpeak
{
  if (supportRaiseToSpeak_onceToken != -1) {
    dispatch_once(&supportRaiseToSpeak_onceToken, &__block_literal_global_83);
  }
  return 0;
}

+ (BOOL)supportTTS
{
  if (supportTTS_onceToken != -1) {
    dispatch_once(&supportTTS_onceToken, &__block_literal_global_78);
  }
  return supportTTS_supportTTS;
}

uint64_t __21__CSUtils_supportTTS__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportTTS_supportTTS = result;
  return result;
}

+ (BOOL)supportSAT
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportSmartVolume
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportEndpointerWhileHostAsleep
{
  return 0;
}

+ (BOOL)supportHybridEndpointer
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return 1;
}

+ (BOOL)supportCSTwoShotDecision
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return !+[CSUtils isDarwinOS];
  }
  return [a1 isLocalVoiceTriggerAvailable];
}

+ (BOOL)supportSelfTriggerSuppressionWatch
{
  return 0;
}

+ (BOOL)supportSelfTriggerSuppression:(unint64_t)a3 refChannelIdx:(unint64_t)a4
{
  if (+[CSUtils supportSelfTriggerSuppressionWatch])
  {
    BOOL v6 = +[CSUtils isLocalVoiceTriggerAvailable];
    BOOL result = 0;
    if (a3 < 2 || !v6) {
      return result;
    }
    return a3 > a4;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return a3 > a4;
  }
  BOOL v8 = +[CSUtils isLocalVoiceTriggerAvailable];
  BOOL result = 0;
  if (a3 >= 2 && v8) {
    return a3 > a4;
  }
  return result;
}

+ (BOOL)supportOpportunisticZLL
{
  if ([a1 isLocalVoiceTriggerAvailable])
  {
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    if (CSIsHorseman_isHorseman) {
      return 1;
    }
  }
  [a1 isLocalVoiceTriggerAvailable];
  return 0;
}

+ (BOOL)supportPremiumAssets
{
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  if (CSHasAOP_hasAOP) {
    return !+[CSUtils isDarwinOS];
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman) {
    return !+[CSUtils isDarwinOS];
  }
  else {
    return 0;
  }
}

+ (BOOL)supportKeywordDetector
{
  return 0;
}

+ (BOOL)supportContinuousVoiceTrigger
{
  return 1;
}

void __39__CSUtils_isLocalVoiceTriggerAvailable__block_invoke()
{
  isLocalVoiceTriggerAvailable_defaultCFDataRef Value = 1;
}

+ (unsigned)getAudioDeviceForHalUID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  timeval v4 = v3;
  id v19 = v3;
  if (v3 && [v3 length])
  {
    unsigned int v17 = 0;
    UInt32 ioPropertyDataSize = 32;
    outPropertyData[0] = &v19;
    outPropertyData[1] = 8;
    outPropertyData[2] = &v17;
    outPropertyData[3] = 4;
    OSStatus Property = AudioHardwareGetProperty(0x64756964u, &ioPropertyDataSize, outPropertyData);
    OSStatus v15 = Property;
    if (Property)
    {
      OSStatus v6 = Property;
      uint64_t v7 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 136316162;
      size_t v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
      __int16 v22 = 2112;
      id v23 = v19;
      __int16 v24 = 1024;
      OSStatus v25 = v6;
      __int16 v26 = 1040;
      int v27 = 4;
      __int16 v28 = 2080;
      v29 = &v15;
      char v12 = "%s Error getting device from UID '%@': %d (%.4s).";
      int v13 = v7;
      uint32_t v14 = 44;
    }
    else
    {
      unsigned int v8 = v17;
      if (v17) {
        goto LABEL_10;
      }
      uint64_t v11 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        unsigned int v8 = 0;
LABEL_10:
        timeval v4 = v19;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315138;
      size_t v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
      char v12 = "%s Retrieved AudioDeviceID is unknown.";
      int v13 = v11;
      uint32_t v14 = 12;
    }
    _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_5;
  }
  size_t v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    size_t v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
    _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s UID is nil or empty. Returning AudioDeviceID as unknown", buf, 0xCu);
  }
  unsigned int v8 = 0;
LABEL_11:

  return v8;
}

+ (BOOL)isOutputDevice:(unsigned int)a3 relatedToInputDevice:(unsigned int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *(void *)&inAddress.mSelector = *(void *)"nikabolg";
  inAddress.mElement = 0;
  UInt32 outDataSize = 0;
  OSStatus PropertyDataSize = AudioObjectGetPropertyDataSize(a4, &inAddress, 0, 0, &outDataSize);
  if (PropertyDataSize)
  {
    OSStatus v7 = PropertyDataSize;
    uint64_t v8 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
    __int16 v29 = 1024;
    OSStatus v30 = v7;
    uint64_t v18 = "%s Error getting related devices data size: %d";
    id v19 = v8;
    uint32_t v20 = 18;
LABEL_20:
    _os_log_error_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    return 0;
  }
  unint64_t v11 = outDataSize;
  char v12 = malloc_type_malloc(outDataSize, 0x15251241uLL);
  if (!v12)
  {
    uint64_t v17 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
    uint64_t v18 = "%s Error allocating memory";
    id v19 = v17;
    uint32_t v20 = 12;
    goto LABEL_20;
  }
  int v13 = v12;
  OSStatus PropertyData = AudioObjectGetPropertyData(a4, &inAddress, 0, 0, &outDataSize, v12);
  if (PropertyData)
  {
    OSStatus v15 = PropertyData;
    __int16 v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
      __int16 v29 = 1024;
      OSStatus v30 = v15;
      _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, "%s Error getting related devices: %d", buf, 0x12u);
    }
    free(v13);
    return 0;
  }
  if (v11 < 4)
  {
    BOOL v9 = 0;
  }
  else
  {
    unint64_t v21 = v11 >> 2;
    if ((v11 >> 2) <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
    if (*v13 == a3)
    {
      BOOL v9 = 1;
    }
    else
    {
      unint64_t v23 = 0;
      while (v22 - 1 != v23)
      {
        int v24 = v13[++v23];
        if (v24 == a3) {
          goto LABEL_26;
        }
      }
      unint64_t v23 = v22;
LABEL_26:
      BOOL v9 = v23 < v21;
    }
  }
  free(v13);
  return v9;
}

+ (unsigned)getDefaultOutputAudioDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t inAddress = *(void *)"tuOdbolg";
  uint64_t inAddress_8 = 0;
  UInt32 ioDataSize = 4;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, (const AudioObjectPropertyAddress *)&inAddress, 0, 0, &ioDataSize, (char *)&inAddress_8 + 4);
  if (!PropertyData) {
    return HIDWORD(inAddress_8);
  }
  OSStatus v3 = PropertyData;
  timeval v4 = CSLogCategoryAudio;
  unsigned int result = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "+[CSUtils(AudioDevice) getDefaultOutputAudioDevice]";
    __int16 v11 = 1024;
    OSStatus v12 = v3;
    _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Error getting default output device ID: %d", buf, 0x12u);
    return 0;
  }
  return result;
}

+ (unint64_t)fetchHypotheticalRouteType
{
  return +[CSUtils fetchHypotheticalRouteTypeFromAudioSessionId:0];
}

+ (BOOL)isHypotheticalAudioRouteBluetoothFromAudioSessinoId:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  OSStatus v6 = [a1 fetchHypotheticalRouteFromAudioSession:v5];
  OSStatus v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    uint64_t v13 = "+[CSUtils(AudioDevice) isHypotheticalAudioRouteBluetoothFromAudioSessinoId:]";
    __int16 v14 = 2114;
    OSStatus v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = a3;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v12, 0x20u);
  }
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F74D88];
    BOOL v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74D88]];

    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:*v8];
      LOBYTE(v9) = [v10 BOOLValue];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

+ (id)fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  OSStatus v6 = [a1 fetchHypotheticalRouteFromAudioSession:v5];
  OSStatus v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    __int16 v16 = "+[CSUtils(AudioDevice) fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:]";
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    __int16 v19 = 2048;
    uint64_t v20 = a3;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v15, 0x20u);
  }
  if (v6
    && ([v6 objectForKey:*MEMORY[0x1E4F74D98]],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLValue],
        v8,
        v9))
  {
    id v10 = (void *)MEMORY[0x1E4F74D68];
    __int16 v11 = [v6 objectForKey:*MEMORY[0x1E4F74D68]];

    if (v11
      && (([v6 objectForKeyedSubscript:*v10],
           __int16 v11 = objc_claimAutoreleasedReturnValue(),
           int v12 = @"BTHeadphones",
           ([v11 hasPrefix:@"BTHeadphones"] & 1) != 0)
       || (int v12 = @"BTHeadset", [v11 hasPrefix:@"BTHeadset"])))
    {
      uint64_t v13 = objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v12, "length"));
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    __int16 v11 = 0;
  }

  return v13;
}

+ (id)fetchHypotheticalRouteFromAudioSession:(id)a3
{
  return (id)[a3 pickedRoute];
}

+ (unint64_t)fetchHypotheticalRouteTypeFromAudioSessionId:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  OSStatus v6 = [a1 fetchHypotheticalRouteFromAudioSession:v5];
  OSStatus v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    uint64_t v18 = "+[CSUtils(AudioDevice) fetchHypotheticalRouteTypeFromAudioSessionId:]";
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v17, 0x20u);
  }
  if (v6
    && (uint64_t v8 = (void *)MEMORY[0x1E4F74CF0],
        [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74CF0]],
        int v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = [v6 objectForKeyedSubscript:*v8];
    if ([v10 isEqualToString:*MEMORY[0x1E4F15110]])
    {
      unint64_t v11 = 1;
    }
    else
    {
      int v12 = [v6 objectForKey:*MEMORY[0x1E4F74D98]];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        __int16 v14 = [v6 objectForKey:*MEMORY[0x1E4F74D78]];
        int v15 = [v14 BOOLValue];

        if (v15) {
          unint64_t v11 = 2;
        }
        else {
          unint64_t v11 = 0;
        }
      }
      else
      {
        unint64_t v11 = 0;
      }
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (id)getAudioSessionFromAudioSessionId:(unsigned int)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F153D8], "retrieveSessionWithID:");
  }
  else {
  OSStatus v3 = [MEMORY[0x1E4F153D8] sharedInstance];
  }
  return v3;
}

+ (BOOL)isOutOfBandAudioRouteWithRecordRoute:(id)a3
{
  id v4 = a3;
  if ([a1 isDoAPAudioRouteWithRecordRoute:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isJarvisAudioRouteWithRecordRoute:v4];
  }

  return v5;
}

+ (BOOL)isJarvisAudioRouteWithRecordRoute:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F15330]];
}

+ (BOOL)isDisplayPortRouteWithRecordRoute:(id)a3
{
  return 0;
}

+ (BOOL)isDoAPAudioRouteWithRecordRoute:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F15300]];
}

+ (id)audioPortSubtypeAsString:(unsigned int)a3
{
  if (a3)
  {
    cStr[0] = HIBYTE(a3);
    cStr[1] = BYTE2(a3);
    cStr[2] = BYTE1(a3);
    cStr[3] = a3;
    cStr[4] = 0;
    id v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BOOL)isBuiltInRecordRoute:(id)a3
{
  id v3 = a3;
  id v4 = +[CSFPreferences sharedPreferences];
  int v5 = [v4 programmableAudioInjectionEnabled];

  if (v5) {
    char v6 = [v3 containsString:@"BuiltInMic"];
  }
  else {
    char v6 = [v3 isEqualToString:*MEMORY[0x1E4F150E8]];
  }
  BOOL v7 = v6;

  return v7;
}

+ (BOOL)isBuiltInRouteWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[CSFPreferences sharedPreferences];
  int v8 = [v7 programmableAudioInjectionEnabled];

  if (v8)
  {
    if ([v5 containsString:@"BuiltInMic"])
    {
      int v9 = @"BuiltInSpeaker";
LABEL_10:
      char v10 = [v6 isEqualToString:v9];
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (![v5 isEqualToString:*MEMORY[0x1E4F150E8]]
    || ([v6 isEqualToString:*MEMORY[0x1E4F15110]] & 1) == 0)
  {
    if (+[CSUtils isExclaveHardware]
      && [v5 isEqualToString:@"HACBuiltIn"])
    {
      int v9 = (__CFString *)*MEMORY[0x1E4F15110];
      goto LABEL_10;
    }
LABEL_11:
    char v10 = 0;
    goto LABEL_12;
  }
  char v10 = 1;
LABEL_12:

  return v10;
}

+ (BOOL)isBluetoothVehicleOutput
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [MEMORY[0x1E4F153D8] sharedInstance];
  id v4 = [v3 currentRoute];
  id v5 = [v4 outputs];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    [v6 timeIntervalSinceDate:v2];
    *(_DWORD *)buf = 136315394;
    OSStatus v25 = "+[CSUtils(AudioDevice) isBluetoothVehicleOutput]";
    __int16 v26 = 2050;
    uint64_t v27 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch output port descriptions elapsed time = %{public}lf", buf, 0x16u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    int v17 = v6;
    uint64_t v18 = v2;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "endpointType", v17, v18);
        int v15 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          OSStatus v25 = "+[CSUtils(AudioDevice) isBluetoothVehicleOutput]";
          __int16 v26 = 2050;
          uint64_t v27 = v14;
          _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Device endpointType = %{public}lu", buf, 0x16u);
        }
        if (v14 == 1986552684)
        {
          LOBYTE(v11) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_15:
    id v6 = v17;
    BOOL v2 = v18;
  }

  return v11;
}

+ (BOOL)isBluetoothAudioDeviceConnected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F153D8] sharedInstance];
  id v4 = [a1 fetchHypotheticalRouteFromAudioSession:v3];

  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "+[CSUtils(AudioDevice) isBluetoothAudioDeviceConnected]";
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s hypotheticalRoute = %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [v4 objectForKeyedSubscript:@"BTDetails_IsHFPRoute"];
  if (!v6) {
    goto LABEL_10;
  }
  BOOL v7 = [v4 objectForKeyedSubscript:@"BTDetails_IsHFPRoute"];
  int v8 = [v7 BOOLValue];

  if (!v8)
  {
LABEL_9:
    LOBYTE(v6) = 0;
    goto LABEL_10;
  }
  uint64_t v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "+[CSUtils(AudioDevice) isBluetoothAudioDeviceConnected]";
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Audio route changing to HFP is expected", (uint8_t *)&v11, 0xCu);
  }
  LOBYTE(v6) = 1;
LABEL_10:

  return (char)v6;
}

+ (BOOL)isHeadphoneDeviceWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v28 = "+[CSUtils(AudioDevice) isHeadphoneDeviceWithRecordRoute:playbackRoute:]";
    __int16 v29 = 2114;
    uint64_t v30 = (uint64_t)v5;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_INFO, "%s Record route = %{public}@, playback route = %{public}@", buf, 0x20u);
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F15148]]
    && ([v6 isEqualToString:*MEMORY[0x1E4F15140]] & 1) != 0)
  {
    BOOL v8 = 1;
  }
  else if (([v6 isEqualToString:*MEMORY[0x1E4F150C8]] & 1) != 0 {
         || [v6 isEqualToString:*MEMORY[0x1E4F150D0]])
  }
  {
    uint64_t v9 = [MEMORY[0x1E4F153D8] sharedInstance];
    id v10 = [v9 currentRoute];
    int v11 = [v10 outputs];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v20 = v6;
      id v21 = v5;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "endpointType", v20, v21);
          uint64_t v18 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v28 = "+[CSUtils(AudioDevice) isHeadphoneDeviceWithRecordRoute:playbackRoute:]";
            __int16 v29 = 2050;
            uint64_t v30 = v17;
            _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Device endpointType = %{public}lu", buf, 0x16u);
          }
          if (v17 != 1751412846)
          {
            BOOL v8 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      BOOL v8 = 1;
LABEL_20:
      id v6 = v20;
      id v5 = v21;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isHFPWithRecordRoute:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F150D0]];
}

+ (id)_readValuesInNestedDictionary:(id)a3 keyword:(id)a4 depth:(int64_t)a5 limitedDepth:(int64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = 0;
  if (v9 && a5 < a6)
  {
    [MEMORY[0x1E4F1CA48] array];
    v23 = id v22 = v9;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      int64_t v16 = a5 + 1;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v19 = objc_msgSend(v12, "objectForKeyedSubscript:", v18, v22);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 isEqualToString:v10])
          {
            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v23 addObject:v19];
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v20 = [a1 _readValuesInNestedDictionary:v19 keyword:v10 depth:v16 limitedDepth:a6];
              if (v20) {
                [v23 addObjectsFromArray:v20];
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    int v11 = (void *)[v23 copy];
    id v9 = v22;
  }

  return v11;
}

+ (id)readValuesFromJsonFile:(id)a3 keyword:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v8 fileExistsAtPath:v6])
  {
LABEL_7:
    int v11 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  if (!v9)
  {
    uint64_t v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "+[CSUtils(Json) readValuesFromJsonFile:keyword:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Invalid json file is being read: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  id v10 = (void *)v9;
  uint64_t v16 = 0;
  int v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v16];
  uint64_t v12 = v16;

  if (!v12)
  {
    uint64_t v13 = [a1 _readValuesInNestedDictionary:v11 keyword:v7 depth:0 limitedDepth:10];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

+ (BOOL)machXPCConnection:(id)a3 hasEntitlement:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (_xpc_connection_s *)a3;
  id v6 = a4;
  id v7 = [(id)machXPCEntitlementPrefix stringByAppendingString:v6];

  id v8 = v7;
  [v8 UTF8String];
  uint64_t v9 = (void *)xpc_connection_copy_entitlement_value();
  id v10 = v9;
  if (v9 && xpc_BOOL_get_value(v9))
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      uint64_t v15 = "+[CSUtils(machXPC) machXPCConnection:hasEntitlement:]";
      __int16 v16 = 2050;
      uint64_t v17 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Connection %{public}p rejected due to missing entitlement", (uint8_t *)&v14, 0x16u);
    }
    xpc_connection_cancel(v5);
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)recordContextString:(id)a3
{
  id v4 = a3;
  if ([a1 isRecordContextBuiltInVoiceTrigger:v4])
  {
    id v5 = @"voic";
  }
  else if ([a1 isRecordContextJarvisVoiceTrigger:v4])
  {
    id v5 = @"carplay";
  }
  else if ([a1 isRecordContextHearstDoubleTap:v4])
  {
    id v5 = @"hearst";
  }
  else if ([a1 isRecordContextRaiseToSpeak:v4])
  {
    id v5 = @"raisetospeak";
  }
  else if ([a1 isRecordContextAutoPrompt:v4])
  {
    id v5 = @"auto";
  }
  else
  {
    id v5 = @"unknown";
  }

  return v5;
}

+ (BOOL)isValidRecordContext:(id)a3
{
  return 1;
}

+ (BOOL)isRecordContextJarvisButtonPress:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1986357346;

  return v4;
}

+ (BOOL)isRecordContextJarvisVoiceTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1668314723;

  return v4;
}

+ (BOOL)isRecordContextRaiseToSpeak:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1918986611;

  return v4;
}

+ (BOOL)isRecordContextHearstDoubleTap:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1651795060;

  return v4;
}

+ (BOOL)isRecordContextHearstVoiceTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1751414371;

  return v4;
}

+ (BOOL)isRecordContextSpeakerIdTrainingTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1936746852;

  return v4;
}

+ (BOOL)isRecordContextAutoPrompt:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1635087471;

  return v4;
}

+ (BOOL)isRecordContextHomeButtonPress:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1752132965;

  return v4;
}

+ (BOOL)isRecordContextRemoraVoiceTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1919776372;

  return v4;
}

+ (BOOL)isRecordContextDarwinVoiceTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1684108899;

  return v4;
}

+ (BOOL)isRecordContextBuiltInVoiceTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]];
  BOOL v4 = [v3 integerValue] == 1987012963;

  return v4;
}

+ (BOOL)isRecordContextVoiceTrigger:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CSUtils isRecordContextBuiltInVoiceTrigger:v3]
    || +[CSUtils isRecordContextHearstVoiceTrigger:v3]
    || +[CSUtils isRecordContextJarvisVoiceTrigger:v3];
  if (+[CSUtils isRecordContextDarwinVoiceTrigger:v3]) {
    LOBYTE(v5) = 1;
  }
  else {
    int v5 = +[CSUtils isRecordContextRemoraVoiceTrigger:v3]
  }
      || v4;

  return v5;
}

+ (id)getSiriLanguageWithEndpointId:(id)a3 fallbackLanguage:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      BOOL v11 = "+[CSUtils(LanguageCode) getSiriLanguageWithEndpointId:fallbackLanguage:]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Failed to query language code with endpointId %@, trying legacy query", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    BOOL v11 = "+[CSUtils(LanguageCode) getSiriLanguageWithEndpointId:fallbackLanguage:]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_INFO, "%s endpointUUID not provided, fallback to legacy query", (uint8_t *)&v10, 0xCu);
  }
  id v8 = +[CSUtils getSiriLanguageWithFallback:v6];

  return v8;
}

+ (id)getSiriLanguageWithFallback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[CSUtils isDarwinOS])
  {
    BOOL v4 = +[CSFPreferences sharedPreferences];
    id v5 = [v4 languageCodeDarwin];
  }
  else
  {
    id v5 = AFPreferencesMobileUserSessionLanguage();
  }
  id v6 = v5;
  if (!v5)
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    BOOL v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR);
    id v6 = v3;
    if (v8)
    {
      int v11 = 136315394;
      __int16 v12 = "+[CSUtils(LanguageCode) getSiriLanguageWithFallback:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Siri language is nil, falling back to %@", (uint8_t *)&v11, 0x16u);
      id v6 = v3;
    }
  }
  id v9 = v6;

  return v9;
}

+ (BOOL)isRemoteDarwinWithDeviceId:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v13[0] = 0;
    v13[1] = 0;
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
    [v4 getUUIDBytes:v13];
    id v5 = (void *)remote_device_copy_device_with_uuid();
    if (v5)
    {
      BOOL v6 = remote_device_get_type() == 11;
    }
    else
    {
      id v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        int v10 = "+[CSUtils(AudioHardware) isRemoteDarwinWithDeviceId:]";
        __int16 v11 = 2114;
        id v12 = v3;
        _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Invalid device with deviceId %{public}@", (uint8_t *)&v9, 0x16u);
      }
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)hasRemoteBuiltInMic
{
  return 0;
}

+ (void)purgeFilesWithExtensionInDirectory:(id)a3 extension:(id)a4 withFileToKep:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  id v8 = a5;
  [MEMORY[0x1E4F28CB8] defaultManager];
  id v32 = v41 = 0;
  v35 = v7;
  int v9 = [v32 contentsOfDirectoryAtPath:v7 error:&v41];
  id v10 = v41;
  if (v10)
  {
    __int16 v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
      __int16 v45 = 2112;
      id v46 = v10;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Error reading contents of directory: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v30 = 0;
    __int16 v31 = v9;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v35, "stringByAppendingPathComponent:", v17, v30, v31);
          __int16 v19 = v18;
          if (!v8
            || ([v18 stringByStandardizingPath],
                id v20 = objc_claimAutoreleasedReturnValue(),
                [v8 stringByStandardizingPath],
                uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                char v22 = [v20 isEqualToString:v21],
                v21,
                v20,
                (v22 & 1) == 0))
          {
            long long v23 = [v17 pathExtension];
            int v24 = [v23 isEqualToString:v34];

            if (v24)
            {
              id v36 = v14;
              [v32 removeItemAtPath:v19 error:&v36];
              id v25 = v36;

              long long v26 = CSLogContextFacilityCoreSpeech;
              BOOL v27 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
              if (v25)
              {
                if (v27)
                {
                  *(_DWORD *)buf = 136315394;
                  v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
                  __int16 v45 = 2112;
                  id v46 = v25;
                  _os_log_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Error purging file: %@", buf, 0x16u);
                }
                id v14 = v25;
              }
              else
              {
                if (v27)
                {
                  long long v28 = v26;
                  __int16 v29 = [v35 stringByAppendingPathComponent:v19];
                  *(_DWORD *)buf = 136315394;
                  v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
                  __int16 v45 = 2112;
                  id v46 = v29;
                  _os_log_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_DEFAULT, "%s file is purged: %@", buf, 0x16u);
                }
                id v14 = 0;
              }
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }
    else
    {
      id v14 = 0;
    }

    id v10 = v30;
    int v9 = v31;
  }
}

+ (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:a4 options:17 error:a6];
  uint64_t v12 = (void *)v11;
  if (v9 && v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v14 = [v13 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v10 options:0 error:a6];
    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __97__CSUtils_Directory___contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
      v21[3] = &unk_1E6200370;
      id v22 = v12;
      __int16 v16 = [v15 predicateWithBlock:v21];
      uint64_t v17 = [v14 filteredArrayUsingPredicate:v16];
    }
    else
    {
      uint64_t v17 = 0;
    }

    goto LABEL_13;
  }
  if (!v11)
  {
    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v18 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    int v24 = "+[CSUtils(Directory) _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:]";
    __int16 v19 = "%s Directory URL is nil!";
    goto LABEL_17;
  }
  uint64_t v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v24 = "+[CSUtils(Directory) _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:]";
    __int16 v19 = "%s Regular expression is nil!";
LABEL_17:
    _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }
LABEL_10:
  uint64_t v17 = 0;
LABEL_13:

  return v17;
}

BOOL __97__CSUtils_Directory___contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

+ (void)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id *))a5;
  if (v10)
  {
    id v11 = (id)*MEMORY[0x1E4F1C540];
    uint64_t v23 = 0;
    int v24 = (id *)&v23;
    uint64_t v25 = 0x3032000000;
    long long v26 = __Block_byref_object_copy__8556;
    BOOL v27 = __Block_byref_object_dispose__8557;
    id v28 = 0;
    v29[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v13 = v24 + 5;
    id obj = v24[5];
    id v14 = [a1 _contentsOfDirectoryAtURL:v8 matchingPattern:v9 includingPropertiesForKeys:v12 error:&obj];
    objc_storeStrong(v13, obj);

    if (v14)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__CSUtils_Directory___sortedURLsInDirectory_matchingPattern_completion___block_invoke;
      v19[3] = &unk_1E6200348;
      id v20 = v11;
      uint64_t v21 = &v23;
      uint64_t v15 = [v14 sortedArrayUsingComparator:v19];
    }
    else
    {
      uint64_t v15 = 0;
    }
    __int16 v16 = v24;
    id v17 = v24[5];
    if (v17)
    {

      uint64_t v15 = 0;
      __int16 v16 = v24;
      id v17 = v24[5];
    }
    id v18 = v17;
    v10[2](v10, v15, &v18);
    objc_storeStrong(v16 + 5, v18);

    _Block_object_dispose(&v23, 8);
  }
}

uint64_t __72__CSUtils_Directory___sortedURLsInDirectory_matchingPattern_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id obj = 0;
  id v18 = 0;
  id v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v8 = [v5 getResourceValue:&v18 forKey:*(void *)(a1 + 32) error:&obj];
  id v9 = v18;
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0) {
    NSLog(&cfstr_UnableToGetFor.isa, *(void *)(a1 + 32), v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  id v15 = 0;
  id v16 = 0;
  id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v11 = [v6 getResourceValue:&v16 forKey:*(void *)(a1 + 32) error:&v15];
  id v12 = v16;
  objc_storeStrong(v10, v15);
  if ((v11 & 1) == 0) {
    NSLog(&cfstr_UnableToGetFor.isa, *(void *)(a1 + 32), v6, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  uint64_t v13 = [v12 compare:v9];

  return v13;
}

+ (void)URLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v13 = 0;
    char v8 = (void (**)(id, void *, id *))a5;
    id v9 = [a1 _contentsOfDirectoryAtURL:a3 matchingPattern:a4 includingPropertiesForKeys:0 error:&v13];
    id v10 = v13;
    id v12 = v10;
    v8[2](v8, v9, &v12);

    id v11 = v12;
  }
}

+ (id)_timeStampString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (BOOL)_createLoggingDirectoryIfNeeded:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v4 fileExistsAtPath:v3])
    {
      id v5 = 0;
    }
    else
    {
      id v12 = 0;
      char v7 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
      id v5 = v12;
      if ((v7 & 1) == 0)
      {
        char v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          id v10 = v8;
          id v11 = [v5 localizedDescription];
          *(_DWORD *)buf = 136315650;
          id v14 = "+[CSUtils(Directory) _createLoggingDirectoryIfNeeded:]";
          __int16 v15 = 2114;
          id v16 = v3;
          __int16 v17 = 2114;
          id v18 = v11;
          _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create logging directory at path %{public}@ %{public}@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "+[CSUtils(Directory) _createLoggingDirectoryIfNeeded:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Invalid log directory", buf, 0xCu);
    }
  }

  return v3 != 0;
}

+ (void)removeDirectory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v9 = 0;
  char v6 = [v5 removeItemAtPath:v4 error:&v9];

  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    char v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "+[CSUtils(Directory) removeDirectory:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Error purging directory: %@", buf, 0x16u);
    }
  }
}

+ (id)loggingFilePathWithDirectory:(id)a3 requestId:(id)a4 token:(id)a5 postfix:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v11 && v12)
  {
    if (+[CSUtils _createLoggingDirectoryIfNeeded:v9])
    {
      uint64_t v14 = [NSString stringWithFormat:@"%@-%@.%@", v10, v11, v13];
      __int16 v15 = [v9 stringByAppendingPathComponent:v14];

      goto LABEL_8;
    }
  }
  else
  {
    id v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "+[CSUtils(Directory) loggingFilePathWithDirectory:requestId:token:postfix:]";
      _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, "%s Invalid token or postfix", buf, 0xCu);
    }
  }
  __int16 v15 = 0;
LABEL_8:

  return v15;
}

+ (id)loggingFilePathWithDirectory:(id)a3 token:(id)a4 postfix:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    if (+[CSUtils _createLoggingDirectoryIfNeeded:v7])
    {
      id v11 = NSString;
      id v12 = +[CSUtils _timeStampString];
      id v13 = [v11 stringWithFormat:@"%@-%@.%@", v12, v8, v10];

      uint64_t v14 = [v7 stringByAppendingPathComponent:v13];

      goto LABEL_8;
    }
  }
  else
  {
    __int16 v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "+[CSUtils(Directory) loggingFilePathWithDirectory:token:postfix:]";
      _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Invalid token or postfix", buf, 0xCu);
    }
  }
  uint64_t v14 = 0;
LABEL_8:

  return v14;
}

+ (void)clearLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 exceedNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[CSUtils _sharedDisposeLoggingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke;
  void v13[3] = &unk_1E6200320;
  id v14 = v8;
  id v15 = v9;
  id v16 = a1;
  unint64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke(uint64_t *a1)
{
  id v2 = (void *)a1[5];
  id v3 = (void *)a1[6];
  uint64_t v4 = a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke_2;
  v5[3] = &unk_1E62002F8;
  uint64_t v8 = a1[7];
  id v6 = v2;
  id v7 = (id)a1[4];
  [v3 _sortedURLsInDirectory:v4 matchingPattern:v6 completion:v5];
}

void __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke_2(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [v3 count];
  unint64_t v5 = a1[6];
  if (v4 > v5)
  {
    id v6 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = [v3 count];
      id v9 = (void *)a1[4];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[6];
      *(_DWORD *)buf = 136316162;
      int v24 = "+[CSUtils(Directory) clearLogFilesInDirectory:matchingPattern:exceedNumber:]_block_invoke_2";
      __int16 v25 = 2050;
      uint64_t v26 = v8;
      __int16 v27 = 2114;
      id v28 = v9;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      __int16 v31 = 2050;
      uint64_t v32 = v11;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s CS logging files number %{public}lu with pattern %{public}@ under %{public}@ exceeding limit, only keep the latest %{public}lu ones", buf, 0x34u);

      unint64_t v5 = a1[6];
    }
    if (v5 < [v3 count])
    {
      id v13 = 0;
      *(void *)&long long v12 = 136315650;
      long long v21 = v12;
      do
      {
        id v14 = v13;
        id v15 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        id v16 = [v3 objectAtIndex:v5];
        id v22 = v13;
        [v15 removeItemAtURL:v16 error:&v22];
        id v13 = v22;

        if (v13)
        {
          unint64_t v17 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            id v18 = v17;
            uint64_t v19 = [v3 objectAtIndex:v5];
            uint64_t v20 = [v13 localizedDescription];
            *(_DWORD *)buf = v21;
            int v24 = "+[CSUtils(Directory) clearLogFilesInDirectory:matchingPattern:exceedNumber:]_block_invoke";
            __int16 v25 = 2114;
            uint64_t v26 = (uint64_t)v19;
            __int16 v27 = 2114;
            id v28 = v20;
            _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, "%s Could not remove %{public}@: %{public}@", buf, 0x20u);
          }
        }
        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count", v21));
    }
  }
}

+ (void)removeLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 beforeDays:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[CSUtils _sharedDisposeLoggingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke;
  void v13[3] = &unk_1E62002D0;
  float v17 = a5;
  id v15 = v9;
  id v16 = a1;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(float *)(a1 + 56) * -3600.0 * 24.0];
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v13 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    __int16 v16 = 2114;
    float v17 = v2;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CS logging files under %{public}@ created before %{public}@ will be removed.", buf, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v8 = a1 + 40;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v8 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke_3;
  v10[3] = &unk_1E62002A8;
  id v11 = v2;
  id v9 = v2;
  [v7 URLsInDirectory:v5 matchingPattern:v6 completion:v10];
}

void __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v27;
    uint64_t v8 = *MEMORY[0x1E4F1C540];
    *(void *)&long long v4 = 136315650;
    long long v20 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture", v20);
        id v24 = 0;
        id v25 = 0;
        [v10 getResourceValue:&v25 forKey:v8 error:&v24];
        id v12 = v25;

        id v13 = v24;
        if (v13)
        {
          __int16 v14 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            float v17 = v14;
            uint64_t v18 = [v13 localizedDescription];
            *(_DWORD *)buf = 136315394;
            __int16 v31 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
            __int16 v32 = 2114;
            uint64_t v33 = v18;
            _os_log_error_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't get creation date: %{public}@", buf, 0x16u);
          }
          id v6 = v13;
        }
        else if ([v12 compare:*(void *)(a1 + 32)] == -1)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
          id v23 = 0;
          [v15 removeItemAtURL:v10 error:&v23];
          id v6 = v23;

          if (v6)
          {
            __int16 v16 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              log = v16;
              uint64_t v19 = [v6 localizedDescription];
              *(_DWORD *)buf = v20;
              __int16 v31 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
              __int16 v32 = 2114;
              uint64_t v33 = v10;
              __int16 v34 = 2114;
              v35 = v19;
              _os_log_error_impl(&dword_1BA1A5000, log, OS_LOG_TYPE_ERROR, "%s Could not remove %{public}@: %{public}@", buf, 0x20u);
            }
          }
        }
        else
        {
          id v6 = 0;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v5);
  }
}

+ (id)_sharedDisposeLoggingQueue
{
  if (_sharedDisposeLoggingQueue_onceToken != -1) {
    dispatch_once(&_sharedDisposeLoggingQueue_onceToken, &__block_literal_global_8583);
  }
  id v2 = (void *)_sharedDisposeLoggingQueue_disposeLogQueue;
  return v2;
}

void __48__CSUtils_Directory___sharedDisposeLoggingQueue__block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, -2);
  dispatch_queue_t v1 = dispatch_queue_create("Dispose Log Queue", v0);
  id v2 = (void *)_sharedDisposeLoggingQueue_disposeLogQueue;
  _sharedDisposeLoggingQueue_disposeLogQueue = (uint64_t)v1;
}

+ (void)iterateBitset:(unint64_t)a3 block:(id)a4
{
  for (uint64_t i = 0; i != 64; ++i)
  {
    if ((a3 >> i)) {
      (*((void (**)(id, uint64_t))a4 + 2))(a4, i);
    }
  }
}

+ (unsigned)getNumElementInBitset:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CSUtils_Bitset__getNumElementInBitset___block_invoke;
  v5[3] = &unk_1E6201058;
  void v5[4] = &v6;
  +[CSUtils iterateBitset:a3 block:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__CSUtils_Bitset__getNumElementInBitset___block_invoke(uint64_t result)
{
  return result;
}

+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4 withStringValue:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)entitlementPrefix stringByAppendingString:v8];

  id v11 = [v9 valueForEntitlement:v10];

  id v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    __int16 v16 = "+[CSUtils(NSXPC) xpcConnection:hasEntitlement:withStringValue:]";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s entitlement value: %@", (uint8_t *)&v15, 0x16u);
  }
  BOOL v13 = 0;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v11 isEqualToString:v7]) {
      BOOL v13 = 1;
    }
  }

  return v13;
}

+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)entitlementPrefix stringByAppendingString:v5];

  id v8 = [v6 valueForEntitlement:v7];

  return v8 != 0;
}

@end