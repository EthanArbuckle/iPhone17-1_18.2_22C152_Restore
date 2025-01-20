@interface CSAsset
+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5;
+ (unint64_t)getSSVDeviceType;
+ (unsigned)SSVDefaultDistanceChannelCount;
+ (unsigned)SSVDefaultLKFSChannelCount;
+ (unsigned)SSVDefaultNoiseChannelCount;
- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4;
- (BOOL)containsMultiUserThresholds;
- (BOOL)containsSpeakerRecognitionCategory;
- (BOOL)satImplicitTrainingEnabled;
- (BOOL)useSpeakerRecognitionAsset;
- (BOOL)useTDTIEnrollment;
- (NSDictionary)SSVParameterDirectionary;
- (NSString)keywordDetectorConfigPathRecognizer;
- (NSString)keywordDetectorNDAPIConfigFilePath;
- (NSString)keywordDetectorQuasarConfigFilePath;
- (NSString)voiceProfilePruningCookie;
- (double)SSVCADistanceModelConfidenceThreshold;
- (float)SSVCADBToTTSMaximumOutput;
- (float)SSVCADBToTTSMinimumOutput;
- (float)SSVCADBToTTSPostTransitionDC;
- (float)SSVCADBToTTSPostTransitionMultiplier;
- (float)SSVCADBToTTSPostTransitionOffset;
- (float)SSVCADBToTTSPreTransitionMultiplier;
- (float)SSVCADBToTTSPreTransitionOffset;
- (float)SSVCADBToTTSTransitionPoint;
- (float)SSVCADecibelToLinearLogBase;
- (float)SSVCADefaultMusicStrength;
- (float)SSVCADefaultOutputTTSVolume;
- (float)SSVCADefaultSpeechStrength;
- (float)SSVCADefaultZeroFloatingPointValue;
- (float)SSVCADeviceDefaultASVOffMinTTSVolume;
- (float)SSVCADeviceDefaultMaxTTSVolume;
- (float)SSVCADeviceDefaultMicSensitivityOffset;
- (float)SSVCADeviceDefaultMinTTSVolume;
- (float)SSVCADeviceSimpleASVOffMinTTSVolume;
- (float)SSVCADeviceSimpleDBToSystemVolSlope;
- (float)SSVCADeviceSimpleMaxTTSVolume;
- (float)SSVCADeviceSimpleMaxTargetDB;
- (float)SSVCADeviceSimpleMicSensitivityOffset;
- (float)SSVCADeviceSimpleMinTTSVolume;
- (float)SSVCADeviceSimpleMinTargetDB;
- (float)SSVCADeviceSimpleOutputMaxTargetDB;
- (float)SSVCADeviceSimpleOutputMinTargetDB;
- (float)SSVCADeviceSimpleOutputSlope;
- (float)SSVCADropInCallAnnouncementMinTTSVolume;
- (float)SSVCAExponentialDistanceHistoryDegradationFactor;
- (float)SSVCALinearToDecibelConstantMultiplier;
- (float)SSVCAListenPollingIntervalAtStartInSeconds;
- (float)SSVCAMaxTTSSystemVolume;
- (float)SSVCAMaximumCompensatedSpeechLevelNearField;
- (float)SSVCAMaximumLinearSoundLevel;
- (float)SSVCAMinTTSSystemVolume;
- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds;
- (float)SSVCAMinimumLinearSoundLevel;
- (float)SSVCAMusicHistoricalSamplesInSeconds;
- (float)SSVCANoiseActivityThreshold;
- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault;
- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple;
- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicHOffsetDeviceSimple;
- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault;
- (float)SSVCASignalToSigmoidMusicSteepnessDeviceSimple;
- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVOffsetDeviceSimple;
- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVSpreadDeviceSimple;
- (float)SSVCASignalToSigmoidNoiseDilationFactor;
- (float)SSVCASignalToSigmoidNoiseHOffset;
- (float)SSVCASignalToSigmoidNoiseSteepness;
- (float)SSVCASignalToSigmoidNoiseVOffset;
- (float)SSVCASignalToSigmoidNoiseVSpread;
- (float)SSVCASignalToSigmoidSpeechDilationFactor;
- (float)SSVCASignalToSigmoidSpeechHOffset;
- (float)SSVCASignalToSigmoidSpeechSteepness;
- (float)SSVCASignalToSigmoidSpeechVOffset;
- (float)SSVCASignalToSigmoidSpeechVSpread;
- (float)SSVCASpeakerDistanceFarBoostFactor;
- (float)SSVCASpeakerDistanceMidBoostFactor;
- (float)SSVCASpeakerDistanceNearBoostFactor;
- (float)SSVCAUserIntentPermanentOffsetFactorDelta;
- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound;
- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound;
- (float)SSVCAUserIntentVolumeDecreaseFactor;
- (float)SSVCAUserIntentVolumeIncreaseFactor;
- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds;
- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds;
- (float)SSVCAVolumeHalfLifeSeconds;
- (float)SSVLKFSMicSensitivityOffset;
- (float)SSVLKFSTTSMappingInputRangeHigh;
- (float)SSVLKFSTTSMappingInputRangeLow;
- (float)SSVLKFSTTSMappingOutputRangeHigh;
- (float)SSVLKFSTTSMappingOutputRangeLow;
- (float)SSVLKFSTimeConstant;
- (float)SSVNoiseMicSensitivityOffset;
- (float)SSVNoiseMicSensitivityOffsetDeviceSimple;
- (float)SSVNoiseTTSMappingInputRangeHigh;
- (float)SSVNoiseTTSMappingInputRangeLow;
- (float)SSVNoiseTTSMappingOutputRangeHigh;
- (float)SSVNoiseTTSMappingOutputRangeLow;
- (float)SSVNoiseTimeConstant;
- (float)SSVNoiseWeight;
- (float)SSVTTSVolumeLowerLimitDB;
- (float)SSVTTSVolumeUpperLimitDB;
- (float)SSVUserOffsetInputRangeHigh;
- (float)SSVUserOffsetInputRangeLow;
- (float)SSVUserOffsetOutputRangeHigh;
- (float)SSVUserOffsetOutputRangeLow;
- (float)keywordDetectorThreshold;
- (float)keywordDetectorWaitTimeSinceVT;
- (float)pruningExplicitUttThresholdPSR;
- (float)pruningExplicitUttThresholdSAT;
- (float)pruningThresholdPSR;
- (float)pruningThresholdSAT;
- (float)psrCombinationWeight;
- (float)satImplicitProfileDeltaThreshold;
- (float)satImplicitProfileThreshold;
- (float)satScoreThreshold;
- (float)satScoreThresholdForPhId:(unint64_t)a3;
- (float)satVTImplicitThreshold;
- (id)RTModelWithFallbackLanguage:(id)a3;
- (id)_adaptiveSiriVolumeDictionary;
- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4;
- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5;
- (id)_getNumberFromASVDictionaryForKey:(id)a3 category:(id)a4 default:(id)a5;
- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4;
- (id)_sha1:(id)a3;
- (id)_sha256:(id)a3;
- (id)_splitBlobsByPhraseType:(id)a3;
- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3;
- (id)createRTModelWithLocale:(id)a3;
- (id)getPhraseConfig:(unint64_t)a3;
- (id)hearstRTModelLocaleMap;
- (id)hearstRTModelWithRequestOptions:(id)a3;
- (id)jarvisRTModelLocaleMap;
- (id)latestHearstRTModelWithRequestOptions:(id)a3;
- (id)localeMapWithName:(id)a3;
- (id)remoraRTModelLocaleMap;
- (id)rtModelLocaleMapWithModelType:(int64_t)a3;
- (id)rtModelWithRequestOptions:(id)a3;
- (int)SSVCADistanceInputBufferDurationSeconds;
- (int)SSVCANoiseActivityCountThreshold;
- (int)SSVCASmartSiriVolumeSyncedMetricLogsToRetain;
- (int)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain;
- (int64_t)multiUserConfidentScoreThreshold;
- (int64_t)multiUserConfidentScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserDeltaScoreThreshold;
- (int64_t)multiUserDeltaScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserHighScoreThreshold;
- (int64_t)multiUserHighScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserLowScoreThreshold;
- (int64_t)multiUserLowScoreThresholdForPhId:(unint64_t)a3;
- (unint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount;
- (unint64_t)SSVCADistanceResultSampleCountTolerance;
- (unint64_t)SSVCADistanceResultsBufferSize;
- (unint64_t)SSVCADspCoefsCount;
- (unint64_t)SSVCADspNumStages;
- (unint64_t)SSVCAHistoricalVolumeBufferSize;
- (unint64_t)SSVCAMusicResultsBufferSize;
- (unint64_t)SSVCANoiseActivityHistoricalSampleCount;
- (unint64_t)SSVCANoiseResultsBufferSize;
- (unint64_t)SSVCAUserIntentValidForSeconds;
- (unint64_t)SSVDistanceChannelBitset;
- (unint64_t)SSVLKFSChannelBitset;
- (unint64_t)SSVNoiseLevelChannelBitset;
- (unint64_t)maxAllowedEnrollmentUtterances;
- (unint64_t)pruningNumRetentionUtterance;
- (unsigned)SSVCAAnnouncementStatusFetchTimeoutMs;
- (unsigned)SSVCAMaxFrameSize;
- (unsigned)SSVEnergyBufferSize;
- (unsigned)SSVLKFSLowerPercentile;
- (unsigned)SSVLKFSUpperPercentile;
- (unsigned)SSVNoiseLowerPercentile;
- (unsigned)SSVNoiseUpperPercentile;
@end

@implementation CSAsset

- (NSDictionary)SSVParameterDirectionary
{
  v32[0] = @"noiseLevelChannelBitset";
  v31 = +[NSNumber numberWithUnsignedLongLong:[(CSAsset *)self SSVNoiseLevelChannelBitset]];
  v33[0] = v31;
  v32[1] = @"LKFSChannelBitset";
  v30 = +[NSNumber numberWithUnsignedLongLong:[(CSAsset *)self SSVLKFSChannelBitset]];
  v33[1] = v30;
  v32[2] = @"energyBufferSize";
  v29 = +[NSNumber numberWithUnsignedInt:[(CSAsset *)self SSVEnergyBufferSize]];
  v33[2] = v29;
  v32[3] = @"noiseLowerPercentile";
  v28 = +[NSNumber numberWithUnsignedInt:[(CSAsset *)self SSVNoiseLowerPercentile]];
  v33[3] = v28;
  v32[4] = @"noiseUpperPercentile";
  v27 = +[NSNumber numberWithUnsignedInt:[(CSAsset *)self SSVNoiseUpperPercentile]];
  v33[4] = v27;
  v32[5] = @"LKFSLowerPercentile";
  v26 = +[NSNumber numberWithUnsignedInt:[(CSAsset *)self SSVLKFSLowerPercentile]];
  v33[5] = v26;
  v32[6] = @"LKFSUpperPercentile";
  v25 = +[NSNumber numberWithUnsignedInt:[(CSAsset *)self SSVLKFSUpperPercentile]];
  v33[6] = v25;
  v32[7] = @"noiseTimeConstant";
  [(CSAsset *)self SSVNoiseTimeConstant];
  v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[7] = v24;
  v32[8] = @"noiseMicSensitivityOffset";
  [(CSAsset *)self SSVNoiseMicSensitivityOffset];
  v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[8] = v23;
  v32[9] = @"LKFSTimeConstant";
  [(CSAsset *)self SSVLKFSTimeConstant];
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[9] = v22;
  v32[10] = @"LKFSMicSensitivityOffset";
  [(CSAsset *)self SSVLKFSMicSensitivityOffset];
  v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[10] = v21;
  v32[11] = @"noiseTTSMappingInputRangeLow";
  [(CSAsset *)self SSVNoiseTTSMappingInputRangeLow];
  v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[11] = v20;
  v32[12] = @"noiseTTSMappingInputRangeHigh";
  [(CSAsset *)self SSVNoiseTTSMappingInputRangeHigh];
  v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[12] = v19;
  v32[13] = @"noiseTTSMappingOutputRangeLow";
  [(CSAsset *)self SSVNoiseTTSMappingOutputRangeLow];
  v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[13] = v18;
  v32[14] = @"noiseTTSMappingOutputRangeHigh";
  [(CSAsset *)self SSVNoiseTTSMappingOutputRangeHigh];
  v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[14] = v17;
  v32[15] = @"LKFSTTSMappingInputRangeLow";
  [(CSAsset *)self SSVLKFSTTSMappingInputRangeLow];
  v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[15] = v16;
  v32[16] = @"LKFSTTSMappingInputRangeHigh";
  [(CSAsset *)self SSVLKFSTTSMappingInputRangeHigh];
  v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[16] = v15;
  v32[17] = @"LKFSTTSMappingOutputRangeLow";
  [(CSAsset *)self SSVLKFSTTSMappingOutputRangeLow];
  v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[17] = v14;
  v32[18] = @"LKFSTTSMappingOutputRangeHigh";
  [(CSAsset *)self SSVLKFSTTSMappingOutputRangeHigh];
  v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[18] = v3;
  v32[19] = @"userOffsetInputRangeLow";
  [(CSAsset *)self SSVUserOffsetInputRangeLow];
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[19] = v4;
  v32[20] = @"userOffsetInputRangeHigh";
  [(CSAsset *)self SSVUserOffsetInputRangeHigh];
  v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[20] = v5;
  v32[21] = @"userOffsetOutputRangeLow";
  [(CSAsset *)self SSVUserOffsetOutputRangeLow];
  v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[21] = v6;
  v32[22] = @"userOffsetOutputRangeHigh";
  [(CSAsset *)self SSVUserOffsetOutputRangeHigh];
  v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[22] = v7;
  v32[23] = @"TTSVolumeLowerLimitDB";
  [(CSAsset *)self SSVTTSVolumeLowerLimitDB];
  v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[23] = v8;
  v32[24] = @"TTSVolumeUpperLimitDB";
  [(CSAsset *)self SSVTTSVolumeUpperLimitDB];
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[24] = v9;
  v32[25] = @"noiseWeight";
  [(CSAsset *)self SSVNoiseWeight];
  v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v33[25] = v10;
  v32[26] = @"DistanceChannelBitset";
  v11 = +[NSNumber numberWithUnsignedLongLong:[(CSAsset *)self SSVDistanceChannelBitset]];
  v33[26] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:27];

  return (NSDictionary *)v12;
}

- (id)_getNumberFromASVDictionaryForKey:(id)a3 category:(id)a4 default:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CSAsset *)self _adaptiveSiriVolumeDictionary];
  v12 = v11;
  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v13 = [v11 objectForKeyedSubscript:v9];
  if (!v13) {
    goto LABEL_5;
  }
  v14 = (void *)v13;
  v15 = [v12 objectForKeyedSubscript:v9];
  v16 = [v15 objectForKeyedSubscript:v8];

  if (v16)
  {
    v17 = [v12 objectForKeyedSubscript:v9];
    v18 = [v17 objectForKeyedSubscript:v8];
  }
  else
  {
LABEL_5:
    v19 = CSLogCategoryASV;
    v18 = v10;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      v22 = "-[CSAsset(SmartSiriVolume) _getNumberFromASVDictionaryForKey:category:default:]";
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v21, 0x2Au);
      v18 = v10;
    }
  }

  return v18;
}

- (float)SSVCADropInCallAnnouncementMinTTSVolume
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v4 = @"SSVCADeviceSimpleDropInCallAnnouncementMinTTSVolume";
    v5 = &off_10025EF88;
  }
  else
  {
    if (v3 == (id)1) {
      CFStringRef v4 = @"SSVCADeviceDefaultDropInCallAnnouncementMinTTSVolume";
    }
    else {
      CFStringRef v4 = @"SSVCADeviceSimple2DropInCallAnnouncementMinTTSVolume";
    }
    v5 = &off_10025EF18;
  }
  v6 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:v5];
  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (float)SSVCAMaximumCompensatedSpeechLevelNearField
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMaximumCompensatedSpeechLevelNearField" category:@"smartSiriVolume" default:&off_10025EF78];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCAHistoricalVolumeBufferSize
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAHistoricalVolumeBufferSize" category:@"smartSiriVolume" default:&off_10025DAC8];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAVolumeHalfLifeSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAVolumeHalfLifeSeconds" category:@"smartSiriVolume" default:&off_10025EF68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceDefaultMicSensitivityOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceDefaultMicSensitivityOffset" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleASVOffMinTTSVolume
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCADeviceSimpleASVOffMinTTSVolume";
    float v7 = &off_10025EF48;
LABEL_8:
    float v8 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:v7];
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCADeviceSimple2ASVOffMinTTSVolume";
    float v7 = &off_10025EF58;
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCADeviceSimpleASVOffMinTTSVolume]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Minimum TTS volume for ASV disabled case requested for device default!", (uint8_t *)&v11, 0xCu);
  }
  return 0.15;
}

- (float)SSVCADeviceDefaultASVOffMinTTSVolume
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceDefaultASVOffMinTTSVolume" category:@"smartSiriVolume" default:&off_10025EF38];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceDefaultMaxTTSVolume
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMaxTTSSystemVolumeSimple2" category:@"smartSiriVolume" default:&off_10025EEC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceDefaultMinTTSVolume
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMinTTSSystemVolumeSimple2" category:@"smartSiriVolume" default:&off_10025EDD8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMaxTTSVolume
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCADeviceSimpleMaxTTSVolume";
    float v4 = &off_10025EF28;
  }
  else
  {
    CFStringRef v3 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v4 = &off_10025EEC8;
  }
  v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceSimpleMinTTSVolume
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCADeviceSimpleMinTTSVolume";
    float v4 = &off_10025EF18;
  }
  else
  {
    CFStringRef v3 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v4 = &off_10025EDD8;
  }
  v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorUpperBound" category:@"smartSiriVolume" default:&off_10025ECC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorLowerBound" category:@"smartSiriVolume" default:&off_10025EF08];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentPermanentOffsetFactorDelta
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorDelta" category:@"smartSiriVolume" default:&off_10025EEF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentVolumeDecreaseFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentVolumeDecreaseFactor" category:@"smartSiriVolume" default:&off_10025EEE8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentVolumeIncreaseFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentVolumeIncreaseFactor" category:@"smartSiriVolume" default:&off_10025EED8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCAUserIntentValidForSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentValidForSeconds" category:@"smartSiriVolume" default:&off_10025DAB0];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAMaxTTSSystemVolume
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCAMaxTTSSystemVolume";
    float v4 = &off_10025EC88;
  }
  else
  {
    CFStringRef v3 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v4 = &off_10025EEC8;
  }
  v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCAMinTTSSystemVolume
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCAMinTTSSystemVolume";
    float v4 = &off_10025EB98;
  }
  else
  {
    CFStringRef v3 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v4 = &off_10025EDD8;
  }
  v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (unint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimplePreTriggerSilenceSampleCount" category:@"smartSiriVolume" default:&off_10025DA98];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCADeviceSimpleMicSensitivityOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMicSensitivityOffset" category:@"smartSiriVolume" default:&off_10025EB58];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleDBToSystemVolSlope
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleDBToSystemVolSlope" category:@"smartSiriVolume" default:&off_10025EEB8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMaxTargetDB
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMaxTargetDB" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMinTargetDB
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMinTargetDB" category:@"smartSiriVolume" default:&off_10025EC28];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleOutputSlope
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCADeviceSimpleOutputSlope";
    float v4 = &off_10025EE98;
  }
  else
  {
    CFStringRef v3 = @"SSVCADeviceSimple2OutputSlope";
    float v4 = &off_10025EEA8;
  }
  v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceSimpleOutputMaxTargetDB
{
  if (+[CSUtils horsemanDeviceType] == (id)2) {
    CFStringRef v3 = @"SSVCADeviceSimpleOutputMaxTargetDB";
  }
  else {
    CFStringRef v3 = @"SSVCADeviceSimple2OutputMaxTargetDB";
  }
  float v4 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:&off_10025EB98];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleOutputMinTargetDB
{
  if (+[CSUtils horsemanDeviceType] == (id)2)
  {
    CFStringRef v3 = @"SSVCADeviceSimpleOutputMinTargetDB";
    float v4 = &off_10025EE78;
  }
  else
  {
    CFStringRef v3 = @"SSVCADeviceSimple2OutputMinTargetDB";
    float v4 = &off_10025EE88;
  }
  float v5 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCAMusicHistoricalSamplesInSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMusicHistoricalSamplesInSeconds" category:@"smartSiriVolume" default:&off_10025EC78];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCADistanceResultSampleCountTolerance
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADistanceResultSampleCountTolerance" category:@"smartSiriVolume" default:&off_10025DA80];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAExponentialDistanceHistoryDegradationFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAExponentialDistanceHistoryDegradationFactor" category:@"smartSiriVolume" default:&off_10025EE68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCADistanceResultsBufferSize
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADistanceResultsBufferSize" category:@"smartSiriVolume" default:&off_10025DA68];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCADspNumStages
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADspNumStages" category:@"smartSiriVolume" default:&off_10025DA50];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCADspCoefsCount
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADspCoefsCount" category:@"smartSiriVolume" default:&off_10025DA38];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCANoiseActivityHistoricalSampleCount
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityHistoricalSampleCount" category:@"smartSiriVolume" default:&off_10025DA20];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCADefaultMusicStrength
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADefaultMusicStrength" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADefaultSpeechStrength
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADefaultSpeechStrength" category:@"smartSiriVolume" default:&off_10025EE58];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCAMusicResultsBufferSize
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMusicResultsBufferSize" category:@"smartSiriVolume" default:&off_10025DA08];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCANoiseResultsBufferSize
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCANoiseResultsBufferSize" category:@"smartSiriVolume" default:&off_10025DA08];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCANoiseActivityThreshold
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityThreshold" category:@"smartSiriVolume" default:&off_10025EE48];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMinimumDistanceUpdateWaitPeriodSeconds" category:@"smartSiriVolume" default:&off_10025EC88];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionMultiplier
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionMultiplier" category:@"smartSiriVolume" default:&off_10025EE38];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionDC
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionDC" category:@"smartSiriVolume" default:&off_10025EC98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionOffset" category:@"smartSiriVolume" default:&off_10025EE28];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPreTransitionMultiplier
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPreTransitionMultiplier" category:@"smartSiriVolume" default:&off_10025EE18];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPreTransitionOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPreTransitionOffset" category:@"smartSiriVolume" default:&off_10025EE08];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSTransitionPoint
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSTransitionPoint" category:@"smartSiriVolume" default:&off_10025EBC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSMaximumOutput
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSMaximumOutput" category:@"smartSiriVolume" default:&off_10025EDF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSMinimumOutput
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSMinimumOutput" category:@"smartSiriVolume" default:&off_10025EDE8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechSteepness
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechSteepness" category:@"smartSiriVolume" default:&off_10025EDD8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseSteepness
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseSteepness" category:@"smartSiriVolume" default:&off_10025EDC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple";
LABEL_8:
    float v7 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:&off_10025EDB8];
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple2";
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicSteepnessDeviceSimple]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Music steepness requested for device default!", (uint8_t *)&v10, 0xCu);
  }
  return 0.1;
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicSteepnessDeviceDefault" category:@"smartSiriVolume" default:&off_10025EDB8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechHOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechHOffset" category:@"smartSiriVolume" default:&off_10025EDA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple";
    float v7 = &off_10025ED98;
LABEL_8:
    float v8 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:v7];
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple2";
    float v7 = &off_10025ED88;
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicHOffsetDeviceSimple]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s H Offset requested for device default!", (uint8_t *)&v11, 0xCu);
  }
  return -28.0;
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicHOffsetDeviceDefault" category:@"smartSiriVolume" default:&off_10025ED88];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseHOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseHOffset" category:@"smartSiriVolume" default:&off_10025ED78];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechVOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechVOffset" category:@"smartSiriVolume" default:&off_10025ED68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple";
LABEL_8:
    float v7 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:&off_10025EBC8];
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple2";
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVOffsetDeviceSimple]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s V Offset requested for device default!", (uint8_t *)&v10, 0xCu);
  }
  return -30.0;
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicVOffsetDeviceDefault" category:@"smartSiriVolume" default:&off_10025EBC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseVOffset
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseVOffset" category:@"smartSiriVolume" default:&off_10025ED68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechVSpread
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechVSpread" category:@"smartSiriVolume" default:&off_10025ED58];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple";
LABEL_8:
    float v7 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:&off_10025ECF8];
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple2";
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVSpreadDeviceSimple]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s V Spread requested for device default!", (uint8_t *)&v10, 0xCu);
  }
  return 20.0;
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicVSpreadDeviceDefault" category:@"smartSiriVolume" default:&off_10025ECF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseVSpread
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseVSpread" category:@"smartSiriVolume" default:&off_10025ED48];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechDilationFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechDilationFactor" category:@"smartSiriVolume" default:&off_10025EC18];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType];
  if (v3 == (id)2)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple";
    float v7 = &off_10025ED38;
LABEL_8:
    float v8 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:v6 category:@"smartSiriVolume" default:v7];
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }
  if (v3 != (id)1)
  {
    CFStringRef v6 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple2";
    float v7 = &off_10025ED28;
    goto LABEL_8;
  }
  float v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicDilationFactorDeviceSimple]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Dilation factor requested for device default!", (uint8_t *)&v11, 0xCu);
  }
  return 4.2;
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicDilationFactorDeviceDefault" category:@"smartSiriVolume" default:&off_10025ED28];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseDilationFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseDilationFactor" category:@"smartSiriVolume" default:&off_10025ED18];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADecibelToLinearLogBase
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADecibelToLinearLogBase" category:@"smartSiriVolume" default:&off_10025ED08];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCALinearToDecibelConstantMultiplier
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCALinearToDecibelConstantMultiplier" category:@"smartSiriVolume" default:&off_10025ECF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAMaximumLinearSoundLevel
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMaximumLinearSoundLevel" category:@"smartSiriVolume" default:&off_10025ECE8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAMinimumLinearSoundLevel
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMinimumLinearSoundLevel" category:@"smartSiriVolume" default:&off_10025ECD8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (double)SSVCADistanceModelConfidenceThreshold
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADistanceModelConfidenceThreshold" category:@"smartSiriVolume" default:&off_10025E408];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (float)SSVCASpeakerDistanceNearBoostFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceNearBoostFactor" category:@"smartSiriVolume" default:&off_10025ECC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASpeakerDistanceMidBoostFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceMidBoostFactor" category:@"smartSiriVolume" default:&off_10025ECB8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASpeakerDistanceFarBoostFactor
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceFarBoostFactor" category:@"smartSiriVolume" default:&off_10025ECA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCANoiseActivityCountThreshold
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityCountThreshold" category:@"smartSiriVolume" default:&off_10025D9F0];
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCADefaultOutputTTSVolume
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADefaultOutputTTSVolume" category:@"smartSiriVolume" default:&off_10025EC98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unsigned)SSVCAAnnouncementStatusFetchTimeoutMs
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAAnnouncementStatusFetchTimeoutMs" category:@"smartSiriVolume" default:&off_10025D9D8];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCADefaultZeroFloatingPointValue
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADefaultZeroFloatingPointValue" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAListenPollingIntervalAtStartInSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAListenPollingIntervalAtStartInSeconds" category:@"smartSiriVolume" default:&off_10025EC88];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCADistanceInputBufferDurationSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCADistanceInputBufferDurationSeconds" category:@"smartSiriVolume" default:&off_10025D9C0];
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAVoiceTriggerInitialSilenceDurationSeconds" category:@"smartSiriVolume" default:&off_10025EC68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCASmartSiriVolumeSyncedMetricLogsToRetain
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASmartSiriVolumeSyncedMetricLogsToRetain" category:@"smartSiriVolume" default:&off_10025D9A8];
  int v3 = [v2 intValue];

  return v3;
}

- (int)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain" category:@"smartSiriVolume" default:&off_10025D9A8];
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAVoiceTriggerBasedTTSValidForSeconds" category:@"smartSiriVolume" default:&off_10025EC78];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unsigned)SSVCAMaxFrameSize
{
  v2 = [(CSAsset *)self _getNumberFromASVDictionaryForKey:@"SSVCAMaxFrameSize" category:@"smartSiriVolume" default:&off_10025D990];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVDistanceChannelBitset
{
  unsigned int v3 = &off_10025D930;
  if (CSIsHorseman())
  {
    id v4 = +[CSUtils horsemanDeviceType];
    float v5 = &off_10025D918;
    if (v4 != (id)3) {
      float v5 = &off_10025D930;
    }
    if (v4 == (id)2) {
      unsigned int v3 = &off_10025D978;
    }
    else {
      unsigned int v3 = v5;
    }
  }
  CFStringRef v6 = [(CSAsset *)self getNumberForKey:@"DistanceChannelBitset" category:@"smartSiriVolume" default:v3];
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (unint64_t)SSVLKFSChannelBitset
{
  unsigned int v3 = &off_10025D948;
  if (CSIsHorseman()
    && +[CSUtils horsemanDeviceType] == (id)3)
  {
    unsigned int v3 = &off_10025D960;
  }
  id v4 = [(CSAsset *)self getNumberForKey:@"LKFSChannelBitset" category:@"smartSiriVolume" default:v3];
  id v5 = [v4 unsignedLongLongValue];

  return (unint64_t)v5;
}

- (unint64_t)SSVNoiseLevelChannelBitset
{
  unsigned int v3 = &off_10025D930;
  if (CSIsHorseman())
  {
    id v4 = +[CSUtils horsemanDeviceType];
    id v5 = &off_10025D918;
    if (v4 != (id)3) {
      id v5 = &off_10025D930;
    }
    if (v4 == (id)2) {
      unsigned int v3 = &off_10025D900;
    }
    else {
      unsigned int v3 = v5;
    }
  }
  CFStringRef v6 = [(CSAsset *)self getNumberForKey:@"noiseLevelChannelBitset" category:@"smartSiriVolume" default:v3];
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (float)SSVNoiseWeight
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseWeight" category:@"smartSiriVolume" default:&off_10025EC68];
  [v2 floatValue];
  float v4 = v3;

  float result = fminf(v4, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (float)SSVTTSVolumeUpperLimitDB
{
  v2 = [(CSAsset *)self getNumberForKey:@"TTSVolumeUpperLimitDB" category:@"smartSiriVolume" default:&off_10025EC48];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVTTSVolumeLowerLimitDB
{
  v2 = [(CSAsset *)self getNumberForKey:@"TTSVolumeLowerLimitDB" category:@"smartSiriVolume" default:&off_10025EC58];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetOutputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"userOffsetOutputRangeHigh" category:@"smartSiriVolume" default:&off_10025EC48];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetOutputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"userOffsetOutputRangeLow" category:@"smartSiriVolume" default:&off_10025EC38];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetInputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"userOffsetInputRangeHigh" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetInputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"userOffsetInputRangeLow" category:@"smartSiriVolume" default:&off_10025EC28];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingOutputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSTTSMappingOutputRangeHigh" category:@"smartSiriVolume" default:&off_10025EC18];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingOutputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSTTSMappingOutputRangeLow" category:@"smartSiriVolume" default:&off_10025EC08];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingInputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSTTSMappingInputRangeHigh" category:@"smartSiriVolume" default:&off_10025EBF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingInputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSTTSMappingInputRangeLow" category:@"smartSiriVolume" default:&off_10025EBE8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingOutputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseTTSMappingOutputRangeHigh" category:@"smartSiriVolume" default:&off_10025EBD8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingOutputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseTTSMappingOutputRangeLow" category:@"smartSiriVolume" default:&off_10025EBC8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingInputRangeHigh
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseTTSMappingInputRangeHigh" category:@"smartSiriVolume" default:&off_10025EBB8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingInputRangeLow
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseTTSMappingInputRangeLow" category:@"smartSiriVolume" default:&off_10025EBA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSMicSensitivityOffset
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSMicSensitivityOffset" category:@"smartSiriVolume" default:&off_10025EB98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTimeConstant
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSTimeConstant" category:@"smartSiriVolume" default:&off_10025EB88];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseMicSensitivityOffsetDeviceSimple
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseMicSensitivityOffsetDeviceSimple" category:@"smartSiriVolume" default:&off_10025EB78];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseMicSensitivityOffset
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseMicSensitivityOffset" category:@"smartSiriVolume" default:&off_10025EB68];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTimeConstant
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseTimeConstant" category:@"smartSiriVolume" default:&off_10025EB58];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unsigned)SSVLKFSUpperPercentile
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSUpperPercentile" category:@"smartSiriVolume" default:&off_10025D8E8];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVLKFSLowerPercentile
{
  v2 = [(CSAsset *)self getNumberForKey:@"LKFSLowerPercentile" category:@"smartSiriVolume" default:&off_10025D8D0];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVNoiseUpperPercentile
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseUpperPercentile" category:@"smartSiriVolume" default:&off_10025D8E8];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVNoiseLowerPercentile
{
  v2 = [(CSAsset *)self getNumberForKey:@"noiseLowerPercentile" category:@"smartSiriVolume" default:&off_10025D8D0];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVEnergyBufferSize
{
  v2 = [(CSAsset *)self getNumberForKey:@"energyBufferSize" category:@"smartSiriVolume" default:&off_10025D8B8];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)_adaptiveSiriVolumeDictionary
{
  v2 = [(CSAsset *)self resourcePath];
  unsigned int v3 = [v2 stringByAppendingPathComponent:@"siriVolume.json"];
  float v4 = +[CSAsset decodeJson:v3];

  return v4;
}

+ (unint64_t)getSSVDeviceType
{
  if (CSIsHorsemanJunior()) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (unsigned)SSVDefaultDistanceChannelCount
{
  if (CSIsHorseman())
  {
    id v2 = +[CSUtils horsemanDeviceType];
    uint64_t v3 = 16128;
    if (v2 == (id)3) {
      uint64_t v3 = 3840;
    }
    if (v2 == (id)2) {
      uint64_t v4 = 896;
    }
    else {
      uint64_t v4 = v3;
    }
  }
  else
  {
    uint64_t v4 = 16128;
  }
  return +[CSUtils getNumElementInBitset:v4];
}

+ (unsigned)SSVDefaultLKFSChannelCount
{
  if (CSIsHorseman())
  {
    if (+[CSUtils horsemanDeviceType] == (id)3) {
      uint64_t v2 = 0x100000;
    }
    else {
      uint64_t v2 = 16;
    }
  }
  else
  {
    uint64_t v2 = 16;
  }
  return +[CSUtils getNumElementInBitset:v2];
}

+ (unsigned)SSVDefaultNoiseChannelCount
{
  if (CSIsHorseman())
  {
    id v2 = +[CSUtils horsemanDeviceType];
    uint64_t v3 = 16128;
    if (v2 == (id)3) {
      uint64_t v3 = 3840;
    }
    if (v2 == (id)2) {
      uint64_t v4 = 960;
    }
    else {
      uint64_t v4 = v3;
    }
  }
  else
  {
    uint64_t v4 = 16128;
  }
  return +[CSUtils getNumElementInBitset:v4];
}

- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3
{
  if ([a3 unsignedIntegerValue] == (id)1) {
    return @"HSJS";
  }
  else {
    return @"HSOnly";
  }
}

- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  CFStringRef v6 = [v5 accessoryInfo];
  unsigned int v7 = [v6 supportsJustSiri];

  float v8 = [v5 engineMajorVersion];
  unsigned int v9 = [v8 unsignedIntValue];

  float v10 = [v5 engineMinorVersion];
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (a4) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  unsigned int v15 = [v5 allowMph];

  char v16 = v7 & v14 & v15;
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    __int16 v21 = 1024;
    int v22 = v7 & v14 & v15;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, device allows multi-phrase: %d", (uint8_t *)&v19, 0x24u);
  }
  return v16;
}

- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4
{
  id v6 = a3;
  unsigned int v7 = [(CSAsset *)self _getFilteredAccessoryRTBlobListForRequestOptions:v6 accessoryBlobs:a4 forceSkipEngineVersionCheck:0];
  float v8 = [v6 engineMajorVersion];
  unsigned int v9 = [v8 unsignedIntValue];

  float v10 = [v6 engineMinorVersion];
  unsigned int v11 = [v10 unsignedIntValue];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    unsigned int v24 = self;
    id v25 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:@"majorVersion"];
        unsigned int v18 = [v17 unsignedIntValue];

        int v19 = [v16 objectForKeyedSubscript:@"minorVersion"];
        unsigned int v20 = [v19 unsignedIntValue];

        if (v18 == v9 && v11 >= v20)
        {
          id v6 = v25;
          int v22 = [(CSAsset *)v24 _buildRTModelWithBlobConfig:v16 requestOptions:v25];
          goto LABEL_15;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    int v22 = 0;
    id v6 = v25;
  }
  else
  {
    int v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = [(CSAsset *)self _splitBlobsByPhraseType:a4];
  float v10 = [v8 userSelectedPhraseType];
  unsigned int v11 = [(CSAsset *)self _userSelectedPhraseTypeToRTModelPhraseType:v10];

  if ([(CSAsset *)self _allowMultiPhrase:v8 forceSkipEngineVersionCheck:v5])
  {
    if (!v11)
    {
      id v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      __int16 v18 = 1024;
      *(_DWORD *)int v19 = 0;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@", (uint8_t *)&v16, 0x1Cu);
    }

    unsigned int v11 = @"HSOnly";
  }
  id v12 = [v9 objectForKeyedSubscript:v11];
LABEL_8:
  uint64_t v14 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315651;
    v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    __int16 v18 = 2113;
    *(void *)int v19 = v11;
    *(_WORD *)&v19[8] = 2113;
    *(void *)&v19[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

- (id)_splitBlobsByPhraseType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        float v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"phraseType"];
        id v12 = (void *)v11;
        if (v11) {
          id v13 = (__CFString *)v11;
        }
        else {
          id v13 = @"HSOnly";
        }
        uint64_t v14 = v13;

        id v15 = [v4 objectForKey:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init((Class)NSMutableArray);
          [v4 setObject:v15 forKey:v14];
        }
        [v15 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  int v16 = [v4 allKeys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        int v22 = [v4 objectForKeyedSubscript:v21];
        id v23 = [v22 sortedArrayUsingComparator:&stru_10024FD58];

        if (v23) {
          [v4 setObject:v23 forKeyedSubscript:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  return v4;
}

- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"blob"];
  if (v8)
  {
    unsigned int v9 = [(CSAsset *)self resourcePath];
    float v10 = [v9 stringByAppendingPathComponent:v8];

    uint64_t v11 = +[NSFileManager defaultManager];
    unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

    id v13 = CSLogContextFacilityCoreSpeech;
    if (v12)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Reading blob from : %{public}@", buf, 0x16u);
      }
      uint64_t v14 = +[NSData dataWithContentsOfFile:v10];
      if (v14)
      {
        id v15 = [(CSAsset *)self _sha1:v14];
        v39 = objc_msgSend(v15, "substringWithRange:", 0, 20);

        v38 = [(CSAsset *)self _sha256:v14];
        uint64_t v16 = [v6 objectForKeyedSubscript:@"signature"];
        v37 = (void *)v16;
        if (v16)
        {
          uint64_t v17 = v16;
          id v18 = [(CSAsset *)self resourcePath];
          uint64_t v19 = [v18 stringByAppendingPathComponent:v17];

          unsigned int v20 = +[NSFileManager defaultManager];
          unsigned int v21 = [v20 fileExistsAtPath:v19];

          if (v21)
          {
            v36 = +[NSData dataWithContentsOfFile:v19];
          }
          else
          {
            v36 = 0;
          }
        }
        else
        {
          v36 = 0;
        }
        uint64_t v25 = [v6 objectForKeyedSubscript:@"cert"];
        v35 = (void *)v25;
        if (v25)
        {
          uint64_t v26 = v25;
          long long v27 = [(CSAsset *)self resourcePath];
          long long v28 = [v27 stringByAppendingPathComponent:v26];

          long long v29 = +[NSFileManager defaultManager];
          unsigned int v30 = [v29 fileExistsAtPath:v28];

          if (v30)
          {
            long long v31 = +[NSData dataWithContentsOfFile:v28];
          }
          else
          {
            long long v31 = 0;
          }
        }
        else
        {
          long long v31 = 0;
        }
        long long v32 = [CSVoiceTriggerRTModel alloc];
        v33 = [v7 siriLocale];
        id v23 = [(CSVoiceTriggerRTModel *)v32 initWithData:v14 hash:v39 locale:v33 digest:v38 signature:v36 certificate:v31];
      }
      else
      {
        unsigned int v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          __int16 v42 = 2114;
          v43 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Blob is nil : %{public}@", buf, 0x16u);
        }
        id v23 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        v43 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s blob file is not exists at %{public}@", buf, 0x16u);
      }
      id v23 = 0;
    }
  }
  else
  {
    int v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s blob file name is not exists", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

- (id)_sha256:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableData dataWithLength:32];
  id v5 = v3;
  id v6 = [v5 bytes];
  CC_LONG v7 = [v5 length];

  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  return v8;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  id v4 = +[NSMutableString stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)localeMapWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSAsset *)self dictionary];
  if (v5)
  {
    id v6 = (void *)v5;
    CC_LONG v7 = [(CSAsset *)self dictionary];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      float v10 = [(CSAsset *)self dictionary];
      uint64_t v11 = [v10 objectForKeyedSubscript:v4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = [(CSAsset *)self dictionary];
        uint64_t v14 = [v13 objectForKeyedSubscript:v4];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v15 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v17 = 136315394;
    id v18 = "-[CSAsset(RTModel) localeMapWithName:]";
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Locale map for %{public}@ is not available on asset", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)rtModelLocaleMapWithModelType:(int64_t)a3
{
  if (a3 == 1) {
    [(CSAsset *)self remoraRTModelLocaleMap];
  }
  else {
  id v3 = [(CSAsset *)self hearstRTModelLocaleMap];
  }
  return v3;
}

- (id)remoraRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"adklocalemap"];
}

- (id)jarvisRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"jarvislocalemap"];
}

- (id)hearstRTModelLocaleMap
{
  return [(CSAsset *)self localeMapWithName:@"rtlocalemap"];
}

- (id)hearstRTModelWithRequestOptions:(id)a3
{
  return [(CSAsset *)self rtModelWithRequestOptions:a3];
}

- (id)rtModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 accessoryModelType];
  id v6 = [v5 integerValue];

  if (v6) {
    CFStringRef v7 = @"adkblobs";
  }
  else {
    CFStringRef v7 = @"rtblobs";
  }
  uint64_t v8 = [(CSAsset *)self dictionary];
  if (!v8) {
    goto LABEL_7;
  }
  unsigned int v9 = (void *)v8;
  float v10 = [(CSAsset *)self dictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:v7];

  if (v11)
  {
    unsigned __int8 v12 = [(CSAsset *)self dictionary];
    id v13 = [v12 objectForKeyedSubscript:v7];

    uint64_t v14 = [(CSAsset *)self _rtModelWithRequestOptions:v4 accessoryBlobs:v13];
  }
  else
  {
LABEL_7:
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s corespeech.json doesn't contains rtblobs", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)latestHearstRTModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSAsset *)self dictionary];
  if (!v5) {
    goto LABEL_18;
  }
  id v6 = (void *)v5;
  CFStringRef v7 = [(CSAsset *)self dictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"rtblobs"];

  if (!v8)
  {
LABEL_18:
    uint64_t v25 = 0;
    goto LABEL_23;
  }
  unsigned int v9 = [(CSAsset *)self dictionary];
  float v10 = [v9 objectForKeyedSubscript:@"rtblobs"];
  long long v29 = self;
  id v30 = v4;
  uint64_t v11 = [(CSAsset *)self _getFilteredAccessoryRTBlobListForRequestOptions:v4 accessoryBlobs:v10 forceSkipEngineVersionCheck:1];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v12)
  {
    unint64_t v14 = 0;
    unint64_t v32 = 0;
    id v15 = 0;
    goto LABEL_20;
  }
  id v13 = v12;
  unint64_t v14 = 0;
  unint64_t v32 = 0;
  id v15 = 0;
  uint64_t v16 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      __int16 v19 = [v18 objectForKeyedSubscript:@"majorVersion"];
      unint64_t v20 = [v19 unsignedIntValue];

      unsigned int v21 = [v18 objectForKeyedSubscript:@"minorVersion"];
      unint64_t v22 = [v21 unsignedIntValue];

      if (v14 < v20)
      {
        unint64_t v14 = v20;
LABEL_14:
        id v24 = v18;

        unint64_t v32 = v22;
        id v15 = v24;
        continue;
      }
      if (v14 == v20 && v32 < v22) {
        goto LABEL_14;
      }
    }
    id v13 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  }
  while (v13);
LABEL_20:

  uint64_t v26 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v39 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    __int16 v40 = 1024;
    int v41 = v14;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2113;
    v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@", buf, 0x22u);
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100074248;
  v33[3] = &unk_10024FD18;
  v33[4] = v14;
  v33[5] = v32;
  id v4 = v30;
  long long v27 = [[CSVoiceTriggerRTModelRequestOptions alloc] initWithCSRTModelRequestOptions:v30 builder:v33];
  uint64_t v25 = [(CSAsset *)v29 _buildRTModelWithBlobConfig:v15 requestOptions:v27];

LABEL_23:
  return v25;
}

- (id)RTModelWithFallbackLanguage:(id)a3
{
  id v4 = +[CSUtils getSiriLanguageWithFallback:a3];
  uint64_t v5 = [(CSAsset *)self createRTModelWithLocale:v4];

  return v5;
}

- (id)createRTModelWithLocale:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = [(CSAsset *)self resourcePath];
  id v6 = CESRUaapData_ptr;
  if (v5
    && (CFStringRef v7 = (void *)v5,
        [(CSAsset *)self path],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    unsigned int v9 = [(CSAsset *)self resourcePath];
    float v10 = [v9 stringByAppendingPathComponent:@"config_rtv2.txt"];

    uint64_t v11 = [(CSAsset *)self resourcePath];
    id v12 = [v11 stringByAppendingPathComponent:@"config_rt.txt"];

    id v13 = [(CSAsset *)self resourcePath];
    unint64_t v14 = [v13 stringByAppendingPathComponent:@"config.txt"];

    int v15 = CSHasAOP();
    uint64_t v16 = v14;
    if (v15)
    {
      int v17 = +[NSFileManager defaultManager];
      unsigned __int8 v18 = [v17 fileExistsAtPath:v10 isDirectory:0];

      uint64_t v16 = v10;
      if ((v18 & 1) == 0)
      {
        __int16 v19 = +[NSFileManager defaultManager];
        unsigned __int8 v20 = [v19 fileExistsAtPath:v12 isDirectory:0];

        uint64_t v16 = v12;
        if ((v20 & 1) == 0)
        {
          unsigned int v21 = CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          uint64_t v16 = v14;
          if (v22)
          {
            int v38 = 136315650;
            v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            __int16 v40 = 2114;
            int v41 = 0;
            __int16 v42 = 2114;
            int v43 = v14;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", (uint8_t *)&v38, 0x20u);
            uint64_t v16 = v14;
          }
        }
      }
    }
    id v23 = v16;
    id v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315394;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      int v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Creating RT blob using: %{public}@", (uint8_t *)&v38, 0x16u);
    }
    uint64_t v25 = [(CSAsset *)self resourcePath];
    uint64_t v26 = +[VTBlobBuilder getBlobWithConfigFilename:v23 rootDirectory:v25];

    long long v27 = CSLogContextFacilityCoreSpeech;
    if (v26)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315394;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        __int16 v40 = 2114;
        int v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s CorealisRT model creation done successfully : %{public}@", (uint8_t *)&v38, 0x16u);
      }
      long long v28 = [(CSAsset *)self assetHashInResourcePath:v23];
    }
    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v38 = 136315138;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Failed to create CorealisRT model", (uint8_t *)&v38, 0xCu);
      }
      long long v28 = 0;
    }
    id v6 = CESRUaapData_ptr;

    if (v26)
    {
      uint64_t v35 = [(CSAsset *)self resourcePath];
      if (v35)
      {
        long long v36 = (void *)v35;
        long long v37 = [(CSAsset *)self path];

        if (v37) {
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    long long v28 = 0;
    uint64_t v26 = 0;
  }
  long long v29 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Defaulting to en_US CorealisRT model", (uint8_t *)&v38, 0xCu);
  }
  uint64_t v30 = [v6[236] getDefaultBlob];

  long long v31 = CSLogContextFacilityCoreSpeech;
  if (v30)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315138;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Default CorealisRT model creation done successfully", (uint8_t *)&v38, 0xCu);
    }

    long long v28 = @"nohash";
    uint64_t v26 = (void *)v30;
LABEL_21:
    unint64_t v32 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315650;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      int v41 = v4;
      __int16 v42 = 2114;
      int v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s RT Model queried - %{public}@ %{public}@", (uint8_t *)&v38, 0x20u);
    }
    v33 = [[CSVoiceTriggerRTModel alloc] initWithData:v26 hash:v28 locale:v4];

    goto LABEL_27;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Failed to create default CorealisRT model", (uint8_t *)&v38, 0xCu);
  }
  v33 = 0;
LABEL_27:

  return v33;
}

+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 unsignedIntegerValue];
  id v11 = [v8 unsignedIntegerValue];
  id v12 = [v9 unsignedIntegerValue];

  id v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    __int16 v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Incoming Major version:%@, Incoming Minor version:%@", (uint8_t *)&v18, 0x20u);
  }
  if (v10) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  if ((unint64_t)v12 <= 1) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)useTDTIEnrollment
{
  return [(CSAsset *)self getBoolForKey:@"useTDTIEnrollment" category:@"speakerRecognition" default:0];
}

- (BOOL)useSpeakerRecognitionAsset
{
  id v2 = [(CSAsset *)self getNumberForKey:@"useSpeakerRecognitionAsset" category:@"speakerRecognition" default:0];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)containsMultiUserThresholds
{
  id v2 = [(CSAsset *)self path];
  unsigned __int8 v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    uint64_t v5 = +[NSData dataWithContentsOfFile:v2];
    if (!v5)
    {
      id v11 = CSLogContextFacilityCoreSpeech;
      BOOL v9 = 0;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
        __int16 v19 = 2114;
        __int16 v20 = v2;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
        BOOL v9 = 0;
      }
      goto LABEL_17;
    }
    id v16 = 0;
    id v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v16];
    id v7 = v16;
    if (v7)
    {
      id v8 = CSLogContextFacilityCoreSpeech;
      BOOL v9 = 0;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315650;
      int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
      __int16 v19 = 2114;
      __int16 v20 = v2;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
    }
    else if (v6)
    {
      id v12 = [v6 objectForKeyedSubscript:@"speakerRecognition"];
      if (v12)
      {
        id v13 = [v6 objectForKeyedSubscript:@"speakerRecognition"];
        BOOL v14 = [v13 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"];
        BOOL v9 = v14 != 0;
      }
      else
      {
        BOOL v9 = 0;
      }

      goto LABEL_16;
    }
    BOOL v9 = 0;
    goto LABEL_16;
  }
  id v10 = CSLogContextFacilityCoreSpeech;
  BOOL v9 = 0;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
    __int16 v19 = 2114;
    __int16 v20 = v2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    BOOL v9 = 0;
  }
LABEL_18:

  return v9;
}

- (BOOL)satImplicitTrainingEnabled
{
  BOOL v3 = (CSIsIOS() & 1) != 0 || CSIsMac();
  return [(CSAsset *)self getBoolForKey:@"implicit_training_enabled" category:@"speakerRecognition" default:v3];
}

- (NSString)keywordDetectorNDAPIConfigFilePath
{
  BOOL v3 = [(CSAsset *)self resourcePath];
  unsigned __int8 v4 = [(CSAsset *)self getStringForKey:@"configFileNDAPI" category:@"voiceTriggerSecondPassAOP" default:@"config.txt"];
  uint64_t v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (NSString)keywordDetectorQuasarConfigFilePath
{
  BOOL v3 = [(CSAsset *)self resourcePath];
  if (+[CSUtils horsemanDeviceType] != (id)1
    || (+[CSVoiceTriggerSecondPassConfigDecoder getDefaultRecognizerForB238], unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(), [(CSAsset *)self getStringForKey:v4 category:@"voiceTriggerSecondPass" default:0], v5 = objc_claimAutoreleasedReturnValue(), v4, !v5))
  {
    uint64_t v5 = [(CSAsset *)self getStringForKey:@"configFileRecognizer" category:@"voiceTriggerSecondPassAOP" default:@"recognizer.json"];
  }
  id v6 = [v3 stringByAppendingPathComponent:v5];

  return (NSString *)v6;
}

- (NSString)voiceProfilePruningCookie
{
  return (NSString *)[(CSAsset *)self getStringForKey:@"pruningCookie" category:@"speakerRecognition" default:0];
}

- (unint64_t)maxAllowedEnrollmentUtterances
{
  id v2 = [(CSAsset *)self getNumberForKey:@"maxEnrollmentUtterances" category:@"speakerRecognition" default:&off_10025DEA0];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)pruningNumRetentionUtterance
{
  id v2 = [(CSAsset *)self getNumberForKey:@"numPruningRetentionUtt" category:@"speakerRecognition" default:&off_10025DE88];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (float)pruningThresholdPSR
{
  id v2 = [(CSAsset *)self getNumberForKey:@"pruningPSRThreshold" category:@"speakerRecognition" default:&off_10025EFA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningThresholdSAT
{
  id v2 = [(CSAsset *)self getNumberForKey:@"pruningSATThreshold" category:@"speakerRecognition" default:&off_10025EFA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningExplicitUttThresholdPSR
{
  id v2 = [(CSAsset *)self getNumberForKey:@"pruningExplicitPSRThreshold" category:@"speakerRecognition" default:&off_10025EFA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningExplicitUttThresholdSAT
{
  id v2 = [(CSAsset *)self getNumberForKey:@"pruningExplicitSATThreshold" category:@"speakerRecognition" default:&off_10025EFA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satVTImplicitThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"implicitVTThreshold" category:@"speakerRecognition" default:&off_10025EFA8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satImplicitProfileDeltaThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"implicitProfileDeltaThreshold" category:@"speakerRecognition" default:&off_10025E458];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satImplicitProfileThreshold
{
  [(CSAsset *)self satScoreThreshold];
  float v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  float v4 = [(CSAsset *)self getNumberForKey:@"implicitProfileThreshold" category:@"speakerRecognition" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)psrCombinationWeight
{
  id v2 = [(CSAsset *)self getNumberForKey:@"combinationWeight" category:@"speakerRecognition" default:&off_10025E448];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int64_t)multiUserDeltaScoreThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"multiUserDeltaScoreThreshold" category:@"speakerRecognition" default:&off_10025DE70];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserDeltaScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getPhraseConfig:a3];
  float v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"];
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }
  else
  {
    int64_t v9 = [(CSAsset *)self multiUserDeltaScoreThreshold];
  }

  return v9;
}

- (int64_t)multiUserConfidentScoreThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"multiUserConfidentScoreThreshold" category:@"speakerRecognition" default:&off_10025DE58];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserConfidentScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getPhraseConfig:a3];
  float v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"];
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }
  else
  {
    int64_t v9 = [(CSAsset *)self multiUserConfidentScoreThreshold];
  }

  return v9;
}

- (int64_t)multiUserHighScoreThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"multiUserHighScoreThreshold" category:@"speakerRecognition" default:&off_10025DE40];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserHighScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getPhraseConfig:a3];
  float v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"multiUserHighScoreThreshold"],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"multiUserHighScoreThreshold"];
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }
  else
  {
    int64_t v9 = [(CSAsset *)self multiUserHighScoreThreshold];
  }

  return v9;
}

- (int64_t)multiUserLowScoreThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"multiUserLowScoreThreshold" category:@"speakerRecognition" default:&off_10025DE28];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserLowScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getPhraseConfig:a3];
  float v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"multiUserLowScoreThreshold"],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"multiUserLowScoreThreshold"];
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }
  else
  {
    int64_t v9 = [(CSAsset *)self multiUserLowScoreThreshold];
  }

  return v9;
}

- (float)satScoreThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"satThreshold" category:@"speakerRecognition" default:&off_10025EF98];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getPhraseConfig:a3];
  float v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"satThreshold"],
        float v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v5 objectForKeyedSubscript:@"satThreshold"];
    [v7 floatValue];
    float v9 = v8;
  }
  else
  {
    [(CSAsset *)self satScoreThreshold];
    float v9 = v10;
  }

  return v9;
}

- (id)getPhraseConfig:(unint64_t)a3
{
  float v4 = [(CSAsset *)self getValueForKey:@"phrase" category:@"speakerRecognition"];
  float v5 = v4;
  if (v4 && (unint64_t)[v4 count] <= a3)
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      float v10 = "-[CSAsset(SpeakerRecognition) getPhraseConfig:]";
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Config for ph: %d doesn't exist, use default", (uint8_t *)&v9, 0x12u);
    }
    float v6 = 0;
  }
  else
  {
    float v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (BOOL)containsSpeakerRecognitionCategory
{
  return [(CSAsset *)self containsCategory:@"speakerRecognition"];
}

- (float)keywordDetectorWaitTimeSinceVT
{
  id v2 = [(CSAsset *)self getNumberForKey:@"waitTimeSinceVT" category:@"keywordDetector" default:&off_10025EFF8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (NSString)keywordDetectorConfigPathRecognizer
{
  float v3 = [(CSAsset *)self resourcePath];
  float v4 = [(CSAsset *)self getStringForKey:@"configFileRecognizer" category:@"keywordDetector" default:@"keyword_detector.json"];
  float v5 = [v3 stringByAppendingPathComponent:v4];

  return (NSString *)v5;
}

- (float)keywordDetectorThreshold
{
  id v2 = [(CSAsset *)self getNumberForKey:@"threshold" category:@"keywordDetector" default:&off_10025EFE8];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

@end