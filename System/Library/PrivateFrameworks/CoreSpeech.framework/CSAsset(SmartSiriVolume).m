@interface CSAsset(SmartSiriVolume)
+ (uint64_t)SSVDefaultDistanceChannelCount;
+ (uint64_t)SSVDefaultLKFSChannelCount;
+ (uint64_t)SSVDefaultNoiseChannelCount;
+ (uint64_t)getSSVDeviceType;
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
- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault;
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
- (float)SSVTTSVolumeLowerLimitDB;
- (float)SSVTTSVolumeUpperLimitDB;
- (float)SSVUserOffsetInputRangeHigh;
- (float)SSVUserOffsetInputRangeLow;
- (float)SSVUserOffsetOutputRangeHigh;
- (float)SSVUserOffsetOutputRangeLow;
- (id)SSVParameterDirectionary;
- (id)_adaptiveSiriVolumeDictionary;
- (id)_getNumberFromASVDictionaryForKey:()SmartSiriVolume category:default:;
- (uint64_t)SSVCAAnnouncementStatusFetchTimeoutMs;
- (uint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount;
- (uint64_t)SSVCADistanceInputBufferDurationSeconds;
- (uint64_t)SSVCADistanceResultSampleCountTolerance;
- (uint64_t)SSVCADistanceResultsBufferSize;
- (uint64_t)SSVCADspCoefsCount;
- (uint64_t)SSVCADspNumStages;
- (uint64_t)SSVCAHistoricalVolumeBufferSize;
- (uint64_t)SSVCAMaxFrameSize;
- (uint64_t)SSVCAMusicResultsBufferSize;
- (uint64_t)SSVCANoiseActivityCountThreshold;
- (uint64_t)SSVCANoiseActivityHistoricalSampleCount;
- (uint64_t)SSVCANoiseResultsBufferSize;
- (uint64_t)SSVCASmartSiriVolumeSyncedMetricLogsToRetain;
- (uint64_t)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain;
- (uint64_t)SSVCAUserIntentValidForSeconds;
- (uint64_t)SSVDistanceChannelBitset;
- (uint64_t)SSVEnergyBufferSize;
- (uint64_t)SSVLKFSChannelBitset;
- (uint64_t)SSVLKFSLowerPercentile;
- (uint64_t)SSVLKFSUpperPercentile;
- (uint64_t)SSVNoiseLevelChannelBitset;
- (uint64_t)SSVNoiseLowerPercentile;
- (uint64_t)SSVNoiseUpperPercentile;
- (void)SSVCADeviceSimpleASVOffMinTTSVolume;
- (void)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple;
- (void)SSVCASignalToSigmoidMusicHOffsetDeviceSimple;
- (void)SSVCASignalToSigmoidMusicSteepnessDeviceSimple;
- (void)SSVCASignalToSigmoidMusicVOffsetDeviceSimple;
- (void)SSVCASignalToSigmoidMusicVSpreadDeviceSimple;
- (void)SSVNoiseWeight;
@end

@implementation CSAsset(SmartSiriVolume)

- (id)SSVParameterDirectionary
{
  v51[27] = *MEMORY[0x1E4F143B8];
  v50[0] = @"noiseLevelChannelBitset";
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVNoiseLevelChannelBitset"));
  v51[0] = v49;
  v50[1] = @"LKFSChannelBitset";
  v48 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVLKFSChannelBitset"));
  v51[1] = v48;
  v50[2] = @"energyBufferSize";
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "SSVEnergyBufferSize"));
  v51[2] = v47;
  v50[3] = @"noiseLowerPercentile";
  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "SSVNoiseLowerPercentile"));
  v51[3] = v46;
  v50[4] = @"noiseUpperPercentile";
  v45 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "SSVNoiseUpperPercentile"));
  v51[4] = v45;
  v50[5] = @"LKFSLowerPercentile";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "SSVLKFSLowerPercentile"));
  v51[5] = v44;
  v50[6] = @"LKFSUpperPercentile";
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "SSVLKFSUpperPercentile"));
  v51[6] = v43;
  v50[7] = @"noiseTimeConstant";
  v2 = NSNumber;
  [a1 SSVNoiseTimeConstant];
  v42 = objc_msgSend(v2, "numberWithFloat:");
  v51[7] = v42;
  v50[8] = @"noiseMicSensitivityOffset";
  v3 = NSNumber;
  [a1 SSVNoiseMicSensitivityOffset];
  v41 = objc_msgSend(v3, "numberWithFloat:");
  v51[8] = v41;
  v50[9] = @"LKFSTimeConstant";
  v4 = NSNumber;
  [a1 SSVLKFSTimeConstant];
  v40 = objc_msgSend(v4, "numberWithFloat:");
  v51[9] = v40;
  v50[10] = @"LKFSMicSensitivityOffset";
  v5 = NSNumber;
  [a1 SSVLKFSMicSensitivityOffset];
  v39 = objc_msgSend(v5, "numberWithFloat:");
  v51[10] = v39;
  v50[11] = @"noiseTTSMappingInputRangeLow";
  v6 = NSNumber;
  [a1 SSVNoiseTTSMappingInputRangeLow];
  v38 = objc_msgSend(v6, "numberWithFloat:");
  v51[11] = v38;
  v50[12] = @"noiseTTSMappingInputRangeHigh";
  v7 = NSNumber;
  [a1 SSVNoiseTTSMappingInputRangeHigh];
  v37 = objc_msgSend(v7, "numberWithFloat:");
  v51[12] = v37;
  v50[13] = @"noiseTTSMappingOutputRangeLow";
  v8 = NSNumber;
  [a1 SSVNoiseTTSMappingOutputRangeLow];
  v36 = objc_msgSend(v8, "numberWithFloat:");
  v51[13] = v36;
  v50[14] = @"noiseTTSMappingOutputRangeHigh";
  v9 = NSNumber;
  [a1 SSVNoiseTTSMappingOutputRangeHigh];
  v35 = objc_msgSend(v9, "numberWithFloat:");
  v51[14] = v35;
  v50[15] = @"LKFSTTSMappingInputRangeLow";
  v10 = NSNumber;
  [a1 SSVLKFSTTSMappingInputRangeLow];
  v34 = objc_msgSend(v10, "numberWithFloat:");
  v51[15] = v34;
  v50[16] = @"LKFSTTSMappingInputRangeHigh";
  v11 = NSNumber;
  [a1 SSVLKFSTTSMappingInputRangeHigh];
  v33 = objc_msgSend(v11, "numberWithFloat:");
  v51[16] = v33;
  v50[17] = @"LKFSTTSMappingOutputRangeLow";
  v12 = NSNumber;
  [a1 SSVLKFSTTSMappingOutputRangeLow];
  v32 = objc_msgSend(v12, "numberWithFloat:");
  v51[17] = v32;
  v50[18] = @"LKFSTTSMappingOutputRangeHigh";
  v13 = NSNumber;
  [a1 SSVLKFSTTSMappingOutputRangeHigh];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  v51[18] = v14;
  v50[19] = @"userOffsetInputRangeLow";
  v15 = NSNumber;
  [a1 SSVUserOffsetInputRangeLow];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  v51[19] = v16;
  v50[20] = @"userOffsetInputRangeHigh";
  v17 = NSNumber;
  [a1 SSVUserOffsetInputRangeHigh];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  v51[20] = v18;
  v50[21] = @"userOffsetOutputRangeLow";
  v19 = NSNumber;
  [a1 SSVUserOffsetOutputRangeLow];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  v51[21] = v20;
  v50[22] = @"userOffsetOutputRangeHigh";
  v21 = NSNumber;
  [a1 SSVUserOffsetOutputRangeHigh];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  v51[22] = v22;
  v50[23] = @"TTSVolumeLowerLimitDB";
  v23 = NSNumber;
  [a1 SSVTTSVolumeLowerLimitDB];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  v51[23] = v24;
  v50[24] = @"TTSVolumeUpperLimitDB";
  v25 = NSNumber;
  [a1 SSVTTSVolumeUpperLimitDB];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  v51[24] = v26;
  v50[25] = @"noiseWeight";
  v27 = NSNumber;
  [a1 SSVNoiseWeight];
  v28 = objc_msgSend(v27, "numberWithFloat:");
  v51[25] = v28;
  v50[26] = @"DistanceChannelBitset";
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "SSVDistanceChannelBitset"));
  v51[26] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:27];

  return v30;
}

- (id)_getNumberFromASVDictionaryForKey:()SmartSiriVolume category:default:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _adaptiveSiriVolumeDictionary];
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
    v19 = *MEMORY[0x1E4F5D140];
    v18 = v10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      v22 = "-[CSAsset(SmartSiriVolume) _getNumberFromASVDictionaryForKey:category:default:]";
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v21, 0x2Au);
      v18 = v10;
    }
  }

  return v18;
}

- (float)SSVCADropInCallAnnouncementMinTTSVolume
{
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    v3 = @"SSVCADeviceSimpleDropInCallAnnouncementMinTTSVolume";
    v4 = &unk_1F23C5348;
  }
  else
  {
    if (v2 == 1) {
      v3 = @"SSVCADeviceDefaultDropInCallAnnouncementMinTTSVolume";
    }
    else {
      v3 = @"SSVCADeviceSimple2DropInCallAnnouncementMinTTSVolume";
    }
    v4 = &unk_1F23C52D8;
  }
  v5 = [a1 _getNumberFromASVDictionaryForKey:v3 category:@"smartSiriVolume" default:v4];
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCAMaximumCompensatedSpeechLevelNearField
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMaximumCompensatedSpeechLevelNearField" category:@"smartSiriVolume" default:&unk_1F23C5338];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCAHistoricalVolumeBufferSize
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAHistoricalVolumeBufferSize" category:@"smartSiriVolume" default:&unk_1F23C46A0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCAVolumeHalfLifeSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAVolumeHalfLifeSeconds" category:@"smartSiriVolume" default:&unk_1F23C5328];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceDefaultMicSensitivityOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceDefaultMicSensitivityOffset" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCADeviceSimpleASVOffMinTTSVolume
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    v4 = @"SSVCADeviceSimpleASVOffMinTTSVolume";
    v5 = &unk_1F23C5308;
LABEL_8:
    float v6 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:v5];
    [v6 floatValue];

    return;
  }
  if (v2 != 1)
  {
    v4 = @"SSVCADeviceSimple2ASVOffMinTTSVolume";
    v5 = &unk_1F23C5318;
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    id v8 = "-[CSAsset(SmartSiriVolume) SSVCADeviceSimpleASVOffMinTTSVolume]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s Minimum TTS volume for ASV disabled case requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCADeviceDefaultASVOffMinTTSVolume
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceDefaultASVOffMinTTSVolume" category:@"smartSiriVolume" default:&unk_1F23C52F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceDefaultMaxTTSVolume
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMaxTTSSystemVolumeSimple2" category:@"smartSiriVolume" default:&unk_1F23C5288];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceDefaultMinTTSVolume
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMinTTSSystemVolumeSimple2" category:@"smartSiriVolume" default:&unk_1F23C5198];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMaxTTSVolume
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    float v2 = @"SSVCADeviceSimpleMaxTTSVolume";
    float v3 = &unk_1F23C52E8;
  }
  else
  {
    float v2 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v3 = &unk_1F23C5288;
  }
  v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleMinTTSVolume
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    float v2 = @"SSVCADeviceSimpleMinTTSVolume";
    float v3 = &unk_1F23C52D8;
  }
  else
  {
    float v2 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v3 = &unk_1F23C5198;
  }
  v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorUpperBound" category:@"smartSiriVolume" default:&unk_1F23C5088];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorLowerBound" category:@"smartSiriVolume" default:&unk_1F23C52C8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentPermanentOffsetFactorDelta
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentPermanentOffsetFactorDelta" category:@"smartSiriVolume" default:&unk_1F23C52B8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentVolumeDecreaseFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentVolumeDecreaseFactor" category:@"smartSiriVolume" default:&unk_1F23C52A8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAUserIntentVolumeIncreaseFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentVolumeIncreaseFactor" category:@"smartSiriVolume" default:&unk_1F23C5298];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCAUserIntentValidForSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAUserIntentValidForSeconds" category:@"smartSiriVolume" default:&unk_1F23C4688];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCAMaxTTSSystemVolume
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    uint64_t v2 = @"SSVCAMaxTTSSystemVolume";
    float v3 = &unk_1F23C5048;
  }
  else
  {
    uint64_t v2 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v3 = &unk_1F23C5288;
  }
  v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCAMinTTSSystemVolume
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    uint64_t v2 = @"SSVCAMinTTSSystemVolume";
    float v3 = &unk_1F23C4F58;
  }
  else
  {
    uint64_t v2 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v3 = &unk_1F23C5198;
  }
  v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (uint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimplePreTriggerSilenceSampleCount" category:@"smartSiriVolume" default:&unk_1F23C4670];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCADeviceSimpleMicSensitivityOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMicSensitivityOffset" category:@"smartSiriVolume" default:&unk_1F23C4F18];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleDBToSystemVolSlope
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleDBToSystemVolSlope" category:@"smartSiriVolume" default:&unk_1F23C5278];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMaxTargetDB
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMaxTargetDB" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleMinTargetDB
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADeviceSimpleMinTargetDB" category:@"smartSiriVolume" default:&unk_1F23C4FE8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADeviceSimpleOutputSlope
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    float v2 = @"SSVCADeviceSimpleOutputSlope";
    float v3 = &unk_1F23C5258;
  }
  else
  {
    float v2 = @"SSVCADeviceSimple2OutputSlope";
    float v3 = &unk_1F23C5268;
  }
  v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleOutputMaxTargetDB
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2) {
    float v2 = @"SSVCADeviceSimpleOutputMaxTargetDB";
  }
  else {
    float v2 = @"SSVCADeviceSimple2OutputMaxTargetDB";
  }
  float v3 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)SSVCADeviceSimpleOutputMinTargetDB
{
  if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 2)
  {
    float v2 = @"SSVCADeviceSimpleOutputMinTargetDB";
    float v3 = &unk_1F23C5238;
  }
  else
  {
    float v2 = @"SSVCADeviceSimple2OutputMinTargetDB";
    float v3 = &unk_1F23C5248;
  }
  float v4 = [a1 _getNumberFromASVDictionaryForKey:v2 category:@"smartSiriVolume" default:v3];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCAMusicHistoricalSamplesInSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMusicHistoricalSamplesInSeconds" category:@"smartSiriVolume" default:&unk_1F23C5038];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCADistanceResultSampleCountTolerance
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADistanceResultSampleCountTolerance" category:@"smartSiriVolume" default:&unk_1F23C4658];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCAExponentialDistanceHistoryDegradationFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAExponentialDistanceHistoryDegradationFactor" category:@"smartSiriVolume" default:&unk_1F23C5228];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCADistanceResultsBufferSize
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADistanceResultsBufferSize" category:@"smartSiriVolume" default:&unk_1F23C4640];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVCADspNumStages
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADspNumStages" category:@"smartSiriVolume" default:&unk_1F23C4628];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVCADspCoefsCount
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADspCoefsCount" category:@"smartSiriVolume" default:&unk_1F23C4610];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVCANoiseActivityHistoricalSampleCount
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityHistoricalSampleCount" category:@"smartSiriVolume" default:&unk_1F23C45F8];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCADefaultMusicStrength
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADefaultMusicStrength" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADefaultSpeechStrength
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADefaultSpeechStrength" category:@"smartSiriVolume" default:&unk_1F23C5218];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCAMusicResultsBufferSize
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMusicResultsBufferSize" category:@"smartSiriVolume" default:&unk_1F23C45E0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVCANoiseResultsBufferSize
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCANoiseResultsBufferSize" category:@"smartSiriVolume" default:&unk_1F23C45E0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCANoiseActivityThreshold
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityThreshold" category:@"smartSiriVolume" default:&unk_1F23C5208];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMinimumDistanceUpdateWaitPeriodSeconds" category:@"smartSiriVolume" default:&unk_1F23C5048];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionMultiplier
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionMultiplier" category:@"smartSiriVolume" default:&unk_1F23C51F8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionDC
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionDC" category:@"smartSiriVolume" default:&unk_1F23C5058];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPostTransitionOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPostTransitionOffset" category:@"smartSiriVolume" default:&unk_1F23C51E8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPreTransitionMultiplier
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPreTransitionMultiplier" category:@"smartSiriVolume" default:&unk_1F23C51D8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSPreTransitionOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSPreTransitionOffset" category:@"smartSiriVolume" default:&unk_1F23C51C8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSTransitionPoint
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSTransitionPoint" category:@"smartSiriVolume" default:&unk_1F23C4F88];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSMaximumOutput
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSMaximumOutput" category:@"smartSiriVolume" default:&unk_1F23C51B8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADBToTTSMinimumOutput
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADBToTTSMinimumOutput" category:@"smartSiriVolume" default:&unk_1F23C51A8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechSteepness
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechSteepness" category:@"smartSiriVolume" default:&unk_1F23C5198];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseSteepness
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseSteepness" category:@"smartSiriVolume" default:&unk_1F23C5188];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicSteepnessDeviceSimple
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    float v4 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple";
LABEL_8:
    float v5 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:&unk_1F23C5178];
    [v5 floatValue];

    return;
  }
  if (v2 != 1)
  {
    float v4 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple2";
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicSteepnessDeviceSimple]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s Music steepness requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicSteepnessDeviceDefault" category:@"smartSiriVolume" default:&unk_1F23C5178];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechHOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechHOffset" category:@"smartSiriVolume" default:&unk_1F23C5168];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicHOffsetDeviceSimple
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    float v4 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple";
    float v5 = &unk_1F23C5158;
LABEL_8:
    int v6 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:v5];
    [v6 floatValue];

    return;
  }
  if (v2 != 1)
  {
    float v4 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple2";
    float v5 = &unk_1F23C5148;
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicHOffsetDeviceSimple]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s H Offset requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicHOffsetDeviceDefault" category:@"smartSiriVolume" default:&unk_1F23C5148];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseHOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseHOffset" category:@"smartSiriVolume" default:&unk_1F23C5138];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechVOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechVOffset" category:@"smartSiriVolume" default:&unk_1F23C5128];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicVOffsetDeviceSimple
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    float v4 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple";
LABEL_8:
    float v5 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:&unk_1F23C4F88];
    [v5 floatValue];

    return;
  }
  if (v2 != 1)
  {
    float v4 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple2";
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVOffsetDeviceSimple]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s V Offset requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicVOffsetDeviceDefault" category:@"smartSiriVolume" default:&unk_1F23C4F88];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseVOffset
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseVOffset" category:@"smartSiriVolume" default:&unk_1F23C5128];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechVSpread
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechVSpread" category:@"smartSiriVolume" default:&unk_1F23C5118];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicVSpreadDeviceSimple
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    float v4 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple";
LABEL_8:
    float v5 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:&unk_1F23C50B8];
    [v5 floatValue];

    return;
  }
  if (v2 != 1)
  {
    float v4 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple2";
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVSpreadDeviceSimple]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s V Spread requested for device default!", (uint8_t *)&v6, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicVSpreadDeviceDefault" category:@"smartSiriVolume" default:&unk_1F23C50B8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseVSpread
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseVSpread" category:@"smartSiriVolume" default:&unk_1F23C5108];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidSpeechDilationFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidSpeechDilationFactor" category:@"smartSiriVolume" default:&unk_1F23C4FD8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (void)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
  if (v2 == 2)
  {
    float v4 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple";
    float v5 = &unk_1F23C50F8;
LABEL_8:
    int v6 = [a1 _getNumberFromASVDictionaryForKey:v4 category:@"smartSiriVolume" default:v5];
    [v6 floatValue];

    return;
  }
  if (v2 != 1)
  {
    float v4 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple2";
    float v5 = &unk_1F23C50E8;
    goto LABEL_8;
  }
  float v3 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicDilationFactorDeviceSimple]";
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s Dilation factor requested for device default!", (uint8_t *)&v7, 0xCu);
  }
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidMusicDilationFactorDeviceDefault" category:@"smartSiriVolume" default:&unk_1F23C50E8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASignalToSigmoidNoiseDilationFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASignalToSigmoidNoiseDilationFactor" category:@"smartSiriVolume" default:&unk_1F23C50D8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCADecibelToLinearLogBase
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADecibelToLinearLogBase" category:@"smartSiriVolume" default:&unk_1F23C50C8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCALinearToDecibelConstantMultiplier
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCALinearToDecibelConstantMultiplier" category:@"smartSiriVolume" default:&unk_1F23C50B8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAMaximumLinearSoundLevel
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMaximumLinearSoundLevel" category:@"smartSiriVolume" default:&unk_1F23C50A8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAMinimumLinearSoundLevel
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMinimumLinearSoundLevel" category:@"smartSiriVolume" default:&unk_1F23C5098];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (double)SSVCADistanceModelConfidenceThreshold
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADistanceModelConfidenceThreshold" category:@"smartSiriVolume" default:&unk_1F23C4E78];
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (float)SSVCASpeakerDistanceNearBoostFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceNearBoostFactor" category:@"smartSiriVolume" default:&unk_1F23C5088];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASpeakerDistanceMidBoostFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceMidBoostFactor" category:@"smartSiriVolume" default:&unk_1F23C5078];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCASpeakerDistanceFarBoostFactor
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASpeakerDistanceFarBoostFactor" category:@"smartSiriVolume" default:&unk_1F23C5068];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCANoiseActivityCountThreshold
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCANoiseActivityCountThreshold" category:@"smartSiriVolume" default:&unk_1F23C45C8];
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (float)SSVCADefaultOutputTTSVolume
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADefaultOutputTTSVolume" category:@"smartSiriVolume" default:&unk_1F23C5058];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCAAnnouncementStatusFetchTimeoutMs
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAAnnouncementStatusFetchTimeoutMs" category:@"smartSiriVolume" default:&unk_1F23C45B0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (float)SSVCADefaultZeroFloatingPointValue
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADefaultZeroFloatingPointValue" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVCAListenPollingIntervalAtStartInSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAListenPollingIntervalAtStartInSeconds" category:@"smartSiriVolume" default:&unk_1F23C5048];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCADistanceInputBufferDurationSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCADistanceInputBufferDurationSeconds" category:@"smartSiriVolume" default:&unk_1F23C4598];
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAVoiceTriggerInitialSilenceDurationSeconds" category:@"smartSiriVolume" default:&unk_1F23C5028];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCASmartSiriVolumeSyncedMetricLogsToRetain
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASmartSiriVolumeSyncedMetricLogsToRetain" category:@"smartSiriVolume" default:&unk_1F23C4580];
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (uint64_t)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain" category:@"smartSiriVolume" default:&unk_1F23C4580];
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAVoiceTriggerBasedTTSValidForSeconds" category:@"smartSiriVolume" default:&unk_1F23C5038];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVCAMaxFrameSize
{
  v1 = [a1 _getNumberFromASVDictionaryForKey:@"SSVCAMaxFrameSize" category:@"smartSiriVolume" default:&unk_1F23C4568];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVDistanceChannelBitset
{
  uint64_t v2 = &unk_1F23C4508;
  if (CSIsHorseman())
  {
    uint64_t v3 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
    float v4 = &unk_1F23C44F0;
    if (v3 != 3) {
      float v4 = &unk_1F23C4508;
    }
    if (v3 == 2) {
      uint64_t v2 = &unk_1F23C4550;
    }
    else {
      uint64_t v2 = v4;
    }
  }
  float v5 = [a1 getNumberForKey:@"DistanceChannelBitset" category:@"smartSiriVolume" default:v2];
  uint64_t v6 = [v5 unsignedLongLongValue];

  return v6;
}

- (uint64_t)SSVLKFSChannelBitset
{
  uint64_t v2 = &unk_1F23C4520;
  if (CSIsHorseman() && [MEMORY[0x1E4F5D450] horsemanDeviceType] == 3) {
    uint64_t v2 = &unk_1F23C4538;
  }
  uint64_t v3 = [a1 getNumberForKey:@"LKFSChannelBitset" category:@"smartSiriVolume" default:v2];
  uint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (uint64_t)SSVNoiseLevelChannelBitset
{
  uint64_t v2 = &unk_1F23C4508;
  if (CSIsHorseman())
  {
    uint64_t v3 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
    uint64_t v4 = &unk_1F23C44F0;
    if (v3 != 3) {
      uint64_t v4 = &unk_1F23C4508;
    }
    if (v3 == 2) {
      uint64_t v2 = &unk_1F23C44D8;
    }
    else {
      uint64_t v2 = v4;
    }
  }
  float v5 = [a1 getNumberForKey:@"noiseLevelChannelBitset" category:@"smartSiriVolume" default:v2];
  uint64_t v6 = [v5 unsignedLongLongValue];

  return v6;
}

- (void)SSVNoiseWeight
{
  v1 = [a1 getNumberForKey:@"noiseWeight" category:@"smartSiriVolume" default:&unk_1F23C5028];
  [v1 floatValue];
}

- (float)SSVTTSVolumeUpperLimitDB
{
  v1 = [a1 getNumberForKey:@"TTSVolumeUpperLimitDB" category:@"smartSiriVolume" default:&unk_1F23C5008];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVTTSVolumeLowerLimitDB
{
  v1 = [a1 getNumberForKey:@"TTSVolumeLowerLimitDB" category:@"smartSiriVolume" default:&unk_1F23C5018];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVUserOffsetOutputRangeHigh
{
  v1 = [a1 getNumberForKey:@"userOffsetOutputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C5008];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVUserOffsetOutputRangeLow
{
  v1 = [a1 getNumberForKey:@"userOffsetOutputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4FF8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVUserOffsetInputRangeHigh
{
  v1 = [a1 getNumberForKey:@"userOffsetInputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVUserOffsetInputRangeLow
{
  v1 = [a1 getNumberForKey:@"userOffsetInputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4FE8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingOutputRangeHigh
{
  v1 = [a1 getNumberForKey:@"LKFSTTSMappingOutputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C4FD8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingOutputRangeLow
{
  v1 = [a1 getNumberForKey:@"LKFSTTSMappingOutputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4FC8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingInputRangeHigh
{
  v1 = [a1 getNumberForKey:@"LKFSTTSMappingInputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C4FB8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSTTSMappingInputRangeLow
{
  v1 = [a1 getNumberForKey:@"LKFSTTSMappingInputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4FA8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingOutputRangeHigh
{
  v1 = [a1 getNumberForKey:@"noiseTTSMappingOutputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C4F98];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingOutputRangeLow
{
  v1 = [a1 getNumberForKey:@"noiseTTSMappingOutputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4F88];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingInputRangeHigh
{
  v1 = [a1 getNumberForKey:@"noiseTTSMappingInputRangeHigh" category:@"smartSiriVolume" default:&unk_1F23C4F78];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseTTSMappingInputRangeLow
{
  v1 = [a1 getNumberForKey:@"noiseTTSMappingInputRangeLow" category:@"smartSiriVolume" default:&unk_1F23C4F68];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSMicSensitivityOffset
{
  v1 = [a1 getNumberForKey:@"LKFSMicSensitivityOffset" category:@"smartSiriVolume" default:&unk_1F23C4F58];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVLKFSTimeConstant
{
  v1 = [a1 getNumberForKey:@"LKFSTimeConstant" category:@"smartSiriVolume" default:&unk_1F23C4F48];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseMicSensitivityOffsetDeviceSimple
{
  v1 = [a1 getNumberForKey:@"noiseMicSensitivityOffsetDeviceSimple" category:@"smartSiriVolume" default:&unk_1F23C4F38];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseMicSensitivityOffset
{
  v1 = [a1 getNumberForKey:@"noiseMicSensitivityOffset" category:@"smartSiriVolume" default:&unk_1F23C4F28];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (float)SSVNoiseTimeConstant
{
  v1 = [a1 getNumberForKey:@"noiseTimeConstant" category:@"smartSiriVolume" default:&unk_1F23C4F18];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (uint64_t)SSVLKFSUpperPercentile
{
  v1 = [a1 getNumberForKey:@"LKFSUpperPercentile" category:@"smartSiriVolume" default:&unk_1F23C44C0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVLKFSLowerPercentile
{
  v1 = [a1 getNumberForKey:@"LKFSLowerPercentile" category:@"smartSiriVolume" default:&unk_1F23C44A8];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVNoiseUpperPercentile
{
  v1 = [a1 getNumberForKey:@"noiseUpperPercentile" category:@"smartSiriVolume" default:&unk_1F23C44C0];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVNoiseLowerPercentile
{
  v1 = [a1 getNumberForKey:@"noiseLowerPercentile" category:@"smartSiriVolume" default:&unk_1F23C44A8];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)SSVEnergyBufferSize
{
  v1 = [a1 getNumberForKey:@"energyBufferSize" category:@"smartSiriVolume" default:&unk_1F23C4490];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (id)_adaptiveSiriVolumeDictionary
{
  v1 = [a1 resourcePath];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"siriVolume.json"];
  float v3 = [MEMORY[0x1E4F5D1A0] decodeJson:v2];

  return v3;
}

+ (uint64_t)getSSVDeviceType
{
  if (CSIsHorsemanJunior()) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (uint64_t)SSVDefaultDistanceChannelCount
{
  if (CSIsHorseman())
  {
    uint64_t v0 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
    uint64_t v1 = 16128;
    if (v0 == 3) {
      uint64_t v1 = 3840;
    }
    if (v0 == 2) {
      uint64_t v2 = 896;
    }
    else {
      uint64_t v2 = v1;
    }
  }
  else
  {
    uint64_t v2 = 16128;
  }
  float v3 = (void *)MEMORY[0x1E4F5D450];
  return [v3 getNumElementInBitset:v2];
}

+ (uint64_t)SSVDefaultLKFSChannelCount
{
  if (CSIsHorseman())
  {
    if ([MEMORY[0x1E4F5D450] horsemanDeviceType] == 3) {
      uint64_t v0 = 0x100000;
    }
    else {
      uint64_t v0 = 16;
    }
  }
  else
  {
    uint64_t v0 = 16;
  }
  uint64_t v1 = (void *)MEMORY[0x1E4F5D450];
  return [v1 getNumElementInBitset:v0];
}

+ (uint64_t)SSVDefaultNoiseChannelCount
{
  if (CSIsHorseman())
  {
    uint64_t v0 = [MEMORY[0x1E4F5D450] horsemanDeviceType];
    uint64_t v1 = 16128;
    if (v0 == 3) {
      uint64_t v1 = 3840;
    }
    if (v0 == 2) {
      uint64_t v2 = 960;
    }
    else {
      uint64_t v2 = v1;
    }
  }
  else
  {
    uint64_t v2 = 16128;
  }
  float v3 = (void *)MEMORY[0x1E4F5D450];
  return [v3 getNumElementInBitset:v2];
}

@end