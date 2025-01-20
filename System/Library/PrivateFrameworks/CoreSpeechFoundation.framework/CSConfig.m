@interface CSConfig
+ (BOOL)inputRecordingIsFloat;
+ (double)defaultContinuousFingerprintBufferDuration;
+ (double)defaultContinuousFingerprintBufferDurationForRemora;
+ (double)inputRecordingBufferDuration;
+ (float)daysBeforeRemovingLogFiles;
+ (float)inputRecordingDurationInSecs;
+ (float)inputRecordingDurationInSecsExtended;
+ (float)inputRecordingSampleRate;
+ (float)inputRecordingSampleRateNarrowBand;
+ (float)remoteVADDuration;
+ (id)inputRecordingSampleRateConverterAlgorithm;
+ (int64_t)inputRecordingEncoderAudioQuality;
+ (unint64_t)channelForOutputReference;
+ (unint64_t)channelForProcessedInput;
+ (unint64_t)exclaveHALInputNumChannelsWithDSP;
+ (unint64_t)exclaveHALInputNumChannelsWithoutDSP;
+ (unint64_t)exclaveRecordingNumChannels;
+ (unint64_t)exclaveRecordingNumSamples;
+ (unint64_t)serverLoggingChannelBitset;
+ (unint64_t)zeroFilterCSLoggingHeartBeatThresholdInMS;
+ (unint64_t)zeroFilterWindowSizeInMs;
+ (unint64_t)zeroFilterWindowSizeInMsForCSLogging;
+ (unint64_t)zeroFilterWindowSizeInMsForReport;
+ (unsigned)EncryptionAudioSampleByteDepth;
+ (unsigned)audioConverterBitrate;
+ (unsigned)hearstNumberOfBytesPerChunk;
+ (unsigned)hearstNumberOfSamplesPerChunk;
+ (unsigned)inputRecordingBytesPerFrame;
+ (unsigned)inputRecordingBytesPerPacket;
+ (unsigned)inputRecordingFramesPerPacket;
+ (unsigned)inputRecordingNumberOfChannels;
+ (unsigned)inputRecordingSampleBitDepth;
+ (unsigned)inputRecordingSampleByteDepth;
+ (unsigned)zeroFilterApproxAbsSpeechThreshold;
@end

@implementation CSConfig

+ (unint64_t)exclaveHALInputNumChannelsWithDSP
{
  return 2;
}

+ (unint64_t)exclaveHALInputNumChannelsWithoutDSP
{
  return 4;
}

+ (unint64_t)exclaveRecordingNumChannels
{
  return 1;
}

+ (unint64_t)exclaveRecordingNumSamples
{
  return 1024;
}

+ (double)defaultContinuousFingerprintBufferDurationForRemora
{
  return 6.0;
}

+ (double)defaultContinuousFingerprintBufferDuration
{
  return 12.0;
}

+ (unint64_t)serverLoggingChannelBitset
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  unint64_t v2 = 67092735;
  if (CSIsHorseman_isHorseman)
  {
    unint64_t v3 = +[CSUtils horsemanDeviceType];
    unint64_t v4 = 2093311;
    if (v3 != 3) {
      unint64_t v4 = 67092735;
    }
    if (v3 == 2) {
      return 261183;
    }
    else {
      return v4;
    }
  }
  return v2;
}

+ (float)remoteVADDuration
{
  return *(float *)"\nף<(knN";
}

+ (float)daysBeforeRemovingLogFiles
{
  return 15.0;
}

+ (unsigned)zeroFilterApproxAbsSpeechThreshold
{
  return 1000;
}

+ (unint64_t)zeroFilterCSLoggingHeartBeatThresholdInMS
{
  return 1000;
}

+ (unint64_t)zeroFilterWindowSizeInMsForCSLogging
{
  return 1000;
}

+ (unint64_t)zeroFilterWindowSizeInMsForReport
{
  return 100;
}

+ (unint64_t)zeroFilterWindowSizeInMs
{
  return 10;
}

+ (unint64_t)channelForProcessedInput
{
  return 0;
}

+ (unint64_t)channelForOutputReference
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman) {
    return 1;
  }
  if (+[CSUtils horsemanDeviceType] == 3) {
    return 20;
  }
  return 4;
}

+ (unsigned)audioConverterBitrate
{
  return 32000;
}

+ (double)inputRecordingBufferDuration
{
  return 0.04;
}

+ (id)inputRecordingSampleRateConverterAlgorithm
{
  return (id)*MEMORY[0x1E4F15250];
}

+ (int64_t)inputRecordingEncoderAudioQuality
{
  return 64;
}

+ (unsigned)EncryptionAudioSampleByteDepth
{
  return 2;
}

+ (BOOL)inputRecordingIsFloat
{
  return 0;
}

+ (unsigned)inputRecordingSampleByteDepth
{
  return 2;
}

+ (unsigned)inputRecordingSampleBitDepth
{
  return 8 * +[CSConfig inputRecordingSampleByteDepth];
}

+ (float)inputRecordingDurationInSecsExtended
{
  if (+[CSUtils allowExtendedRingBufferSize]) {
    return 6.0;
  }
  [a1 inputRecordingDurationInSecs];
  return result;
}

+ (float)inputRecordingDurationInSecs
{
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  float result = 5.0;
  if (!CSIsHorseman_isHorseman) {
    return 4.0;
  }
  return result;
}

+ (unsigned)inputRecordingNumberOfChannels
{
  if (+[CSUtils isDarwinOS]) {
    return 2;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    unint64_t v3 = +[CSFPreferences sharedPreferences];
    int v4 = [v3 fileLoggingIsEnabled];

    unint64_t v5 = +[CSUtils horsemanDeviceType];
    if (v5 == 3)
    {
      BOOL v6 = v4 == 0;
      unsigned int v7 = 21;
      unsigned int v8 = 29;
    }
    else
    {
      BOOL v6 = v4 == 0;
      if (v5 == 2)
      {
        unsigned int v7 = 10;
        unsigned int v8 = 23;
      }
      else
      {
        unsigned int v7 = 14;
        unsigned int v8 = 34;
      }
    }
    if (v6) {
      return v7;
    }
    else {
      return v8;
    }
  }
  else
  {
    if (+[CSUtils isLocalVoiceTriggerAvailable]
      && +[CSUtils isIOSDeviceSupportingBargeIn])
    {
      return 2;
    }
    return 1;
  }
}

+ (unsigned)hearstNumberOfSamplesPerChunk
{
  return 160;
}

+ (unsigned)hearstNumberOfBytesPerChunk
{
  return 320;
}

+ (unsigned)inputRecordingBytesPerPacket
{
  unsigned int v2 = +[CSConfig inputRecordingSampleByteDepth];
  return +[CSConfig inputRecordingFramesPerPacket] * v2;
}

+ (unsigned)inputRecordingBytesPerFrame
{
  return +[CSConfig inputRecordingSampleByteDepth];
}

+ (unsigned)inputRecordingFramesPerPacket
{
  return 1;
}

+ (float)inputRecordingSampleRateNarrowBand
{
  return 8000.0;
}

+ (float)inputRecordingSampleRate
{
  return 16000.0;
}

@end