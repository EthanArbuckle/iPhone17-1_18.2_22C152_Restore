@interface VCAudioRelayIOControllerSettings
- (VCAudioRelayIOControllerSettings)initWithAudioFormat:(const tagVCAudioFrameFormat *)a3 remoteCodecInfo:(const _VCRemoteCodecInfo *)a4;
- (const)audioFormat;
- (const)remoteCodecInfo;
@end

@implementation VCAudioRelayIOControllerSettings

- (VCAudioRelayIOControllerSettings)initWithAudioFormat:(const tagVCAudioFrameFormat *)a3 remoteCodecInfo:(const _VCRemoteCodecInfo *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCAudioRelayIOControllerSettings;
  result = [(VCAudioRelayIOControllerSettings *)&v9 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->format.mSampleRate;
    long long v8 = *(_OWORD *)&a3->format.mBytesPerPacket;
    *(_OWORD *)&result->_audioFormat.format.mBitsPerChannel = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&result->_audioFormat.format.mBytesPerPacket = v8;
    *(_OWORD *)&result->_audioFormat.format.mSampleRate = v7;
    result->_remoteCodecInfo = *a4;
  }
  return result;
}

- (const)audioFormat
{
  return &self->_audioFormat;
}

- (const)remoteCodecInfo
{
  return &self->_remoteCodecInfo;
}

@end