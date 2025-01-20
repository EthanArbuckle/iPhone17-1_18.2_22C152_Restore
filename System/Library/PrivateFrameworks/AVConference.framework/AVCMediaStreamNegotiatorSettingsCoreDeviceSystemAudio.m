@interface AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio
- (AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (int)operatingMode;
- (int)preferredAudioCodec;
- (int64_t)audioStreamMode;
- (unint64_t)audioChannelCount;
- (unint64_t)preferredMediaBitRate;
- (unint64_t)ptime;
- (unsigned)jitterBufferMode;
@end

@implementation AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio

- (AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v16 init];
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
LABEL_13:

    return v9;
  }
  v8->_preferredAudioPayload = 101;
  v10 = [[VCAudioRuleCollection alloc] initWithPhoneContinuity:0 allowAudioSwitching:0 sbr:0 aacBlockSize:480 isLowLatencyAudio:1];
  if (!v10)
  {

    v9 = 0;
    *a5 = @"audioRules init failed";
    goto LABEL_13;
  }
  if (v6 == 1 && [a3 objectForKey:@"AVCMediaStreamNegotiatorAccessNetworkType"])
  {
    v11 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorAccessNetworkType"];
    if (!v11)
    {
      v15 = @"cannot get accessNetworkType from Init options";
      goto LABEL_18;
    }
    v9->super._accessNetworkType = (int)[v11 intValue];
  }
  v12 = [[VCMediaNegotiatorAudioConfiguration alloc] initWithAllowAudioSwitching:0 allowAudioRecording:0 useSBR:0 ssrc:v9->super._localSSRC audioUnitNumber:0 audioRuleCollection:v10];
  v9->super._audioConfiguration = v12;
  if (v12)
  {
    if (v6 == 1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    v9->super._mediaStreamDirection = v13;
    v9->super._shouldSetJitterBufferMode = 1;
    goto LABEL_13;
  }
  v15 = @"_audioConfiguration init failed";
LABEL_18:

  if (a5) {
    *a5 = v15;
  }

  return 0;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioPayload;
}

- (int64_t)audioStreamMode
{
  return 8;
}

- (int)operatingMode
{
  return 12;
}

- (unint64_t)audioChannelCount
{
  return 2;
}

- (unint64_t)ptime
{
  if ([(AVCMediaStreamNegotiatorSettings *)self accessNetworkType] == 1) {
    return 10;
  }
  else {
    return 20;
  }
}

- (unint64_t)preferredMediaBitRate
{
  if ([(AVCMediaStreamNegotiatorSettings *)self accessNetworkType] == 1) {
    return 320000;
  }
  else {
    return 128000;
  }
}

- (unsigned)jitterBufferMode
{
  return [(AVCMediaStreamNegotiatorSettings *)self accessNetworkType] != 1;
}

@end