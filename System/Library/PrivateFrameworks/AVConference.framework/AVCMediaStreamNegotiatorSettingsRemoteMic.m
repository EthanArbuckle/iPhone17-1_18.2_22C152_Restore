@interface AVCMediaStreamNegotiatorSettingsRemoteMic
- (AVCMediaStreamNegotiatorSettingsRemoteMic)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5;
- (int)operatingMode;
- (int)preferredAudioCodec;
- (int64_t)audioStreamMode;
- (unint64_t)ptime;
@end

@implementation AVCMediaStreamNegotiatorSettingsRemoteMic

- (AVCMediaStreamNegotiatorSettingsRemoteMic)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteMic;
  v8 = [(AVCMediaStreamNegotiatorSettings *)&v14 init];
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
LABEL_12:

    return v9;
  }
  v8->_channelCount = 1;
  v10 = [[VCAudioRuleCollection alloc] initWithPhoneContinuity:0 allowAudioSwitching:0 sbr:0 aacBlockSize:480 isLowLatencyAudio:1];
  if (v10)
  {
    v9->super._audioConfiguration = [[VCMediaNegotiatorAudioConfiguration alloc] initWithAllowAudioSwitching:0 allowAudioRecording:0 useSBR:0 ssrc:v9->super._localSSRC audioUnitNumber:0 audioRuleCollection:v10];
    if (a3
      && objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorRemoteMicChannelCount"), "intValue") == 4)
    {
      v9->_preferredAudioPayload = 119;
      v9->_channelCount = 4;
    }
    else
    {
      v9->_preferredAudioPayload = 101;
    }
    if (v9->super._audioConfiguration)
    {
      uint64_t v11 = 1;
      if (v6 != 1) {
        uint64_t v11 = 2;
      }
      v9->super._mediaStreamDirection = v11;
      goto LABEL_12;
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
  return 7;
}

- (int)operatingMode
{
  return 11;
}

- (unint64_t)ptime
{
  return 10;
}

@end