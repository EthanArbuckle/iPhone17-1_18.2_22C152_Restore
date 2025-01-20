@interface AVCMediaStreamNegotiatorSettingsNearbySystemAudio
- (AVCMediaStreamNegotiatorSettingsNearbySystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)rtcpTimeOutEnabled;
- (double)rtcpSendInterval;
- (double)rtcpTimeOutInterval;
- (int)operatingMode;
- (int)preferredAudioCodec;
- (int64_t)audioStreamMode;
- (unint64_t)audioChannelCount;
- (unint64_t)preferredMediaBitRate;
- (unint64_t)ptime;
- (unsigned)jitterBufferMode;
@end

@implementation AVCMediaStreamNegotiatorSettingsNearbySystemAudio

- (AVCMediaStreamNegotiatorSettingsNearbySystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsNearbySystemAudio;
  v7 = -[AVCMediaStreamNegotiatorSettings initWithOptions:deviceRole:error:](&v14, sel_initWithOptions_deviceRole_error_, a3);
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
LABEL_9:

    return v8;
  }
  v7->_preferredAudioPayload = 101;
  v9 = [[VCAudioRuleCollection alloc] initWithPhoneContinuity:0 allowAudioSwitching:0 sbr:0 aacBlockSize:480 isLowLatencyAudio:1];
  if (v9)
  {
    v8->super._accessNetworkType = 1;
    v10 = [[VCMediaNegotiatorAudioConfiguration alloc] initWithAllowAudioSwitching:0 allowAudioRecording:0 useSBR:0 ssrc:v8->super._localSSRC audioUnitNumber:0 audioRuleCollection:v9];
    v8->super._audioConfiguration = v10;
    if (v10)
    {
      if (v6 == 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      v8->super._mediaStreamDirection = v11;
      v8->super._shouldSetJitterBufferMode = 1;
      [(AVCMediaStreamNegotiatorSettingsNearbySystemAudio *)v8 setAudioDeviceUIDForDeviceRole:v6];
      goto LABEL_9;
    }
    v13 = @"_audioConfiguration init failed";
  }
  else
  {
    v13 = @"audioRules init failed";
  }

  if (a5) {
    *a5 = v13;
  }

  return 0;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioPayload;
}

- (int64_t)audioStreamMode
{
  return 10;
}

- (int)operatingMode
{
  return 12;
}

- (unint64_t)ptime
{
  return 10;
}

- (unint64_t)preferredMediaBitRate
{
  return 320000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 1;
}

- (double)rtcpTimeOutInterval
{
  return 8.0;
}

- (double)rtcpSendInterval
{
  return 1.0;
}

- (unsigned)jitterBufferMode
{
  return 0;
}

- (unint64_t)audioChannelCount
{
  return 2;
}

@end