@interface VCAudioIOControllerClient
- (BOOL)allowAudioRecording;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMediaPriorityEnabled;
- (BOOL)isOuputMeteringEnabled;
- (BOOL)isPrewarmingClient;
- (BOOL)isRemoteCodecInfoValid;
- (BOOL)isRemoteVersionInfoValid;
- (BOOL)isVoiceActivityEnabled;
- (BOOL)networkUplinkClockUsesBaseband;
- (BOOL)optOutOfSmartRouting;
- (BOOL)spatialAudioDisabled;
- (VCAudioIOControllerClient)initWithDelegate:(id)a3 audioSessionId:(unsigned int)a4 channelIndex:(unsigned int)a5 sourceContext:(void *)a6 sourceProcess:(void *)a7 sinkContext:(void *)a8 sinkProcess:(void *)a9 clientPid:(int)a10 isPrewarmingClient:(BOOL)a11 spatialToken:(unint64_t)a12 isVoiceActivityEnabled:(BOOL)a13 isMediaPriorityEnabled:(BOOL)a14;
- (VCAudioIOControllerDelegate)delegate;
- (VoiceIOFarEndVersionInfo)farEndVersionInfo;
- (_VCAudioIOControllerClientIO)sinkIO;
- (_VCAudioIOControllerClientIO)sourceIO;
- (const)clientFormat;
- (const)controllerFormat;
- (double)remoteCodecSampleRate;
- (id)description;
- (int)clientPid;
- (int)deviceRole;
- (int)operatingMode;
- (unint64_t)spatialToken;
- (unsigned)audioSessionId;
- (unsigned)channelIndex;
- (unsigned)direction;
- (unsigned)remoteCodecType;
- (void)dealloc;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setChannelIndex:(unsigned int)a3;
- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3;
- (void)setControllerFormat:(const tagVCAudioFrameFormat *)a3;
- (void)setDeviceRole:(int)a3;
- (void)setDirection:(unsigned __int8)a3;
- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3;
- (void)setInputMeteringEnabled:(BOOL)a3;
- (void)setIsMediaPriorityEnabled:(BOOL)a3;
- (void)setIsVoiceActivityEnabled:(BOOL)a3;
- (void)setNetworkUplinkClockUsesBaseband:(BOOL)a3;
- (void)setOperatingMode:(int)a3;
- (void)setOptOutOfSmartRouting:(BOOL)a3;
- (void)setOutputMeteringEnabled:(BOOL)a3;
- (void)setRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4;
- (void)setSpatialAudioDisabled:(BOOL)a3;
@end

@implementation VCAudioIOControllerClient

- (VCAudioIOControllerClient)initWithDelegate:(id)a3 audioSessionId:(unsigned int)a4 channelIndex:(unsigned int)a5 sourceContext:(void *)a6 sourceProcess:(void *)a7 sinkContext:(void *)a8 sinkProcess:(void *)a9 clientPid:(int)a10 isPrewarmingClient:(BOOL)a11 spatialToken:(unint64_t)a12 isVoiceActivityEnabled:(BOOL)a13 isMediaPriorityEnabled:(BOOL)a14
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)VCAudioIOControllerClient;
  v20 = [(VCAudioIOControllerClient *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_clientPid = a10;
    objc_storeWeak(&v20->_delegate, a3);
    v21->_sourceIO.processSamplesContext = a6;
    v21->_sourceIO.processSamples = a7;
    v21->_sourceIO.runLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v21->_sourceIO.audioSessionId = a4;
    v21->_sourceIO.channelIndex = a5;
    v21->_sinkIO.processSamplesContext = a8;
    v21->_sinkIO.processSamples = a9;
    v21->_sinkIO.runLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v21->_sinkIO.audioSessionId = a4;
    v21->_sinkIO.channelIndex = a5;
    v21->_sinkIO.isVoiceActivityEnabled = a13;
    v21->_sinkIO.isMediaPriorityEnabled = a14;
    v21->_remoteCodecSampleRate = 24000.0;
    v21->_remoteCodecType = 0;
    v21->_audioSessionId = a4;
    v21->_isPrewarmingClient = a11;
    v21->_channelIndex = a5;
    v21->_spatialToken = a12;
  }
  return v21;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_sourceIO.runLock);
  dispatch_release((dispatch_object_t)self->_sinkIO.runLock);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceIO.controllerAudioBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioIOControllerClient;
  [(VCAudioIOControllerClient *)&v3 dealloc];
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v3;
  long long v11 = v3;
  *(_OWORD *)__str = v3;
  long long v9 = v3;
  uint64_t v4 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VCAudioIOControllerClient;
  id v5 = [(VCAudioIOControllerClient *)&v7 description];
  return (id)[v4 stringWithFormat:@"{ %@ clientFormat=%s operatingMode=%d deviceRole=%d audioRecording=%d, direction=%d, isPrewarmingClient=%d, sinkIO=%p, sourceIO=%p }", v5, FormatToCStr((uint64_t)&self->_clientFormat, __str, 0x40uLL), self->_operatingMode, self->_deviceRole, self->_allowAudioRecording, self->_direction, self->_isPrewarmingClient, &self->_sinkIO, &self->_sourceIO];
}

- (_VCAudioIOControllerClientIO)sourceIO
{
  return &self->_sourceIO;
}

- (_VCAudioIOControllerClientIO)sinkIO
{
  return &self->_sinkIO;
}

- (void)setChannelIndex:(unsigned int)a3
{
  self->_sourceIO.channelIndex = a3;
  self->_sinkIO.channelIndex = a3;
  self->_channelIndex = a3;
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
  self->_isRemoteVersionInfoValid = 1;
}

- (void)setRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4
{
  self->_remoteCodecType = a3;
  self->_remoteCodecSampleRate = a4;
  self->_isRemoteCodecInfoValid = 1;
}

- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3
{
  long long v3 = *(_OWORD *)&a3->format.mSampleRate;
  long long v4 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_clientFormat.format.mBitsPerChannel = v4;
  *(_OWORD *)&self->_clientFormat.format.mSampleRate = v3;
}

- (const)clientFormat
{
  return &self->_clientFormat;
}

- (void)setControllerFormat:(const tagVCAudioFrameFormat *)a3
{
  p_controllerFormat = &self->_controllerFormat;
  long long v4 = *(_OWORD *)&a3->format.mSampleRate;
  long long v5 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_controllerFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_controllerFormat.format.mBitsPerChannel = v5;
  *(_OWORD *)&self->_controllerFormat.format.mSampleRate = v4;
  p_controllerAudioBuffer = &self->_sourceIO.controllerAudioBuffer;
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceIO.controllerAudioBuffer);

  VCAudioBufferList_AllocateFrame((uint64_t)p_controllerFormat, p_controllerAudioBuffer);
}

- (const)controllerFormat
{
  return &self->_controllerFormat;
}

- (VCAudioIOControllerDelegate)delegate
{
  return (VCAudioIOControllerDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)isVoiceActivityEnabled
{
  return self->_sinkIO.isVoiceActivityEnabled;
}

- (void)setIsVoiceActivityEnabled:(BOOL)a3
{
  self->_sinkIO.isVoiceActivityEnabled = a3;
}

- (BOOL)isMediaPriorityEnabled
{
  return self->_sinkIO.isMediaPriorityEnabled;
}

- (void)setIsMediaPriorityEnabled:(BOOL)a3
{
  self->_sinkIO.isMediaPriorityEnabled = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
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

- (BOOL)isRemoteCodecInfoValid
{
  return self->_isRemoteCodecInfoValid;
}

- (unsigned)remoteCodecType
{
  return self->_remoteCodecType;
}

- (double)remoteCodecSampleRate
{
  return self->_remoteCodecSampleRate;
}

- (BOOL)isRemoteVersionInfoValid
{
  return self->_isRemoteVersionInfoValid;
}

- (VoiceIOFarEndVersionInfo)farEndVersionInfo
{
  long long v3 = *(_OWORD *)&self[1].farEndOSVersion[32];
  long long v4 = *(_OWORD *)&self[1].farEndOSVersion[48];
  retstr->farEndAUVersion = *(_DWORD *)&self[2].farEndHwModel[12];
  long long v5 = *(_OWORD *)&self[1].farEndHwModel[32];
  long long v6 = *(_OWORD *)self[1].farEndOSVersion;
  *(_OWORD *)&retstr->farEndHwModel[32] = *(_OWORD *)&self[1].farEndHwModel[48];
  *(_OWORD *)&retstr->farEndHwModel[48] = v6;
  *(_OWORD *)retstr->farEndOSVersion = *(_OWORD *)&self[1].farEndOSVersion[16];
  *(_OWORD *)&retstr->farEndOSVersion[16] = v3;
  *(_OWORD *)retstr->farEndHwModel = *(_OWORD *)&self[1].farEndHwModel[16];
  *(_OWORD *)&retstr->farEndHwModel[16] = v5;
  long long v7 = *(_OWORD *)&self[1].farEndAUVersion;
  *(_OWORD *)&retstr->farEndOSVersion[32] = v4;
  *(_OWORD *)&retstr->farEndOSVersion[48] = v7;
  return self;
}

- (int)clientPid
{
  return self->_clientPid;
}

- (BOOL)isInputMeteringEnabled
{
  return self->_isInputMeteringEnabled;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  self->_isInputMeteringEnabled = a3;
}

- (BOOL)isOuputMeteringEnabled
{
  return self->_isOutputMeteringEnabled;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  self->_isOutputMeteringEnabled = a3;
}

- (unsigned)direction
{
  return self->_direction;
}

- (void)setDirection:(unsigned __int8)a3
{
  self->_direction = a3;
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (BOOL)isPrewarmingClient
{
  return self->_isPrewarmingClient;
}

- (unsigned)channelIndex
{
  return self->_channelIndex;
}

- (unint64_t)spatialToken
{
  return self->_spatialToken;
}

- (BOOL)networkUplinkClockUsesBaseband
{
  return self->_networkUplinkClockUsesBaseband;
}

- (void)setNetworkUplinkClockUsesBaseband:(BOOL)a3
{
  self->_networkUplinkClockUsesBaseband = a3;
}

- (BOOL)spatialAudioDisabled
{
  return self->_spatialAudioDisabled;
}

- (void)setSpatialAudioDisabled:(BOOL)a3
{
  self->_spatialAudioDisabled = a3;
}

- (BOOL)optOutOfSmartRouting
{
  return self->_optOutOfSmartRouting;
}

- (void)setOptOutOfSmartRouting:(BOOL)a3
{
  self->_optOutOfSmartRouting = a3;
}

@end