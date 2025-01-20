@interface VCAudioUnitProperties
- (BOOL)allowAudioRecording;
- (BOOL)enableDNNVAD;
- (BOOL)isFarEndVersionInfoValid;
- (BOOL)vpEnableSpatialChat;
- (VCAudioUnitSpatialContext)spatialContext;
- (VoiceIOFarEndVersionInfo)farEndVersionInfo;
- (double)remoteCodecSampleRate;
- (id)description;
- (int)deviceRole;
- (int)operatingMode;
- (tagVCAudioFrameFormat)frameFormatMic;
- (tagVCAudioFrameFormat)frameFormatSpeaker;
- (unsigned)audioSessionId;
- (unsigned)audioUnitType;
- (unsigned)remoteCodecType;
- (unsigned)vpOperatingMode;
- (void)dealloc;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setAudioSessionId:(unsigned int)a3;
- (void)setAudioUnitType:(unsigned int)a3;
- (void)setDeviceRole:(int)a3;
- (void)setEnableDNNVAD:(BOOL)a3;
- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3;
- (void)setOperatingMode:(int)a3;
- (void)setRemoteCodecSampleRate:(double)a3;
- (void)setRemoteCodecType:(unsigned int)a3;
- (void)setSpatialContext:(id)a3;
- (void)setVpEnableSpatialChat:(BOOL)a3;
- (void)setVpOperatingMode:(unsigned int)a3;
@end

@implementation VCAudioUnitProperties

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioUnitProperties;
  [(VCAudioUnitProperties *)&v3 dealloc];
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = self->_audioUnitType - 1;
  if (v3 > 3) {
    uint64_t v4 = "unknown";
  }
  else {
    uint64_t v4 = off_1E6DB7890[v3];
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v5;
  long long v19 = v5;
  *(_OWORD *)__str = v5;
  long long v17 = v5;
  *(_OWORD *)v12 = v5;
  long long v13 = v5;
  long long v14 = v5;
  long long v15 = v5;
  v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)VCAudioUnitProperties;
  id v7 = [(VCAudioUnitProperties *)&v11 description];
  uint64_t audioUnitType = self->_audioUnitType;
  v9 = FormatToCStr((uint64_t)&self->_frameFormatMic, __str, 0x40uLL);
  return (id)[v6 stringWithFormat:@"%@ type=%s(%d) micFormat=%s, %u speakerFormat=%s, %u operatingRole=%d deviceRole=%d vpOperatingMode=%d vpEnableSpatialChat=%d audioRecording=%d enableDNNVAD=%d", v7, v4, audioUnitType, v9, self->_frameFormatMic.samplesPerFrame, FormatToCStr((uint64_t)&self->_frameFormatSpeaker, v12, 0x40uLL), self->_frameFormatSpeaker.samplesPerFrame, self->_operatingMode, self->_deviceRole, self->_vpOperatingMode, self->_vpEnableSpatialChat, self->_allowAudioRecording, self->_enableDNNVAD];
}

- (VoiceIOFarEndVersionInfo)farEndVersionInfo
{
  long long v3 = *(_OWORD *)&self[1].farEndOSVersion[16];
  long long v4 = *(_OWORD *)&self[1].farEndOSVersion[48];
  *(_OWORD *)&retstr->farEndOSVersion[32] = *(_OWORD *)&self[1].farEndOSVersion[32];
  *(_OWORD *)&retstr->farEndOSVersion[48] = v4;
  retstr->farEndAUVersion = self[1].farEndAUVersion;
  long long v5 = *(_OWORD *)&self[1].farEndHwModel[16];
  long long v6 = *(_OWORD *)&self[1].farEndHwModel[48];
  *(_OWORD *)&retstr->farEndHwModel[32] = *(_OWORD *)&self[1].farEndHwModel[32];
  *(_OWORD *)&retstr->farEndHwModel[48] = v6;
  *(_OWORD *)retstr->farEndOSVersion = *(_OWORD *)self[1].farEndOSVersion;
  *(_OWORD *)&retstr->farEndOSVersion[16] = v3;
  *(_OWORD *)retstr->farEndHwModel = *(_OWORD *)self[1].farEndHwModel;
  *(_OWORD *)&retstr->farEndHwModel[16] = v5;
  return self;
}

- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3
{
  *(_OWORD *)self->_farEndVersionInfo.farEndHwModel = *(_OWORD *)a3->farEndHwModel;
  long long v3 = *(_OWORD *)&a3->farEndHwModel[16];
  long long v4 = *(_OWORD *)&a3->farEndHwModel[32];
  long long v5 = *(_OWORD *)&a3->farEndHwModel[48];
  *(_OWORD *)self->_farEndVersionInfo.farEndOSVersion = *(_OWORD *)a3->farEndOSVersion;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[48] = v5;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[32] = v4;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[16] = v3;
  long long v6 = *(_OWORD *)&a3->farEndOSVersion[16];
  long long v7 = *(_OWORD *)&a3->farEndOSVersion[32];
  long long v8 = *(_OWORD *)&a3->farEndOSVersion[48];
  self->_farEndVersionInfo.farEndAUVersion = a3->farEndAUVersion;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[48] = v8;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[32] = v7;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[16] = v6;
  self->_isFarEndVersionInfoValid = 1;
}

- (tagVCAudioFrameFormat)frameFormatMic
{
  return &self->_frameFormatMic;
}

- (tagVCAudioFrameFormat)frameFormatSpeaker
{
  return &self->_frameFormatSpeaker;
}

- (unsigned)audioUnitType
{
  return self->_audioUnitType;
}

- (void)setAudioUnitType:(unsigned int)a3
{
  self->_uint64_t audioUnitType = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (double)remoteCodecSampleRate
{
  return self->_remoteCodecSampleRate;
}

- (void)setRemoteCodecSampleRate:(double)a3
{
  self->_remoteCodecSampleRate = a3;
}

- (unsigned)remoteCodecType
{
  return self->_remoteCodecType;
}

- (void)setRemoteCodecType:(unsigned int)a3
{
  self->_remoteCodecType = a3;
}

- (unsigned)vpOperatingMode
{
  return self->_vpOperatingMode;
}

- (void)setVpOperatingMode:(unsigned int)a3
{
  self->_vpOperatingMode = a3;
}

- (BOOL)vpEnableSpatialChat
{
  return self->_vpEnableSpatialChat;
}

- (void)setVpEnableSpatialChat:(BOOL)a3
{
  self->_vpEnableSpatialChat = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (BOOL)isFarEndVersionInfoValid
{
  return self->_isFarEndVersionInfoValid;
}

- (BOOL)enableDNNVAD
{
  return self->_enableDNNVAD;
}

- (void)setEnableDNNVAD:(BOOL)a3
{
  self->_enableDNNVAD = a3;
}

- (VCAudioUnitSpatialContext)spatialContext
{
  return self->_spatialContext;
}

- (void)setSpatialContext:(id)a3
{
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  self->_audioSessionId = a3;
}

@end