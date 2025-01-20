@interface AudioDSPUplinkSpeechMixerFactory
- (AudioDSPUplinkSpeechMixerFactory)init;
- (AudioStreamBasicDescription)streamDescription;
- (id)createUplinkSpeechMixer;
- (unsigned)maximumFramesPerSlice;
- (void)setMaximumFramesPerSlice:(unsigned int)a3;
- (void)setStreamDescription:(AudioStreamBasicDescription *)a3;
@end

@implementation AudioDSPUplinkSpeechMixerFactory

- (id)createUplinkSpeechMixer
{
  v3 = [AudioDSPUplinkSpeechMixer alloc];
  long long v4 = *(_OWORD *)&self->_settings.streamDescription.mBytesPerPacket;
  v7[0] = *(_OWORD *)&self->_settings.streamDescription.mSampleRate;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&self->_settings.streamDescription.mBitsPerChannel;
  v5 = [(AudioDSPUplinkSpeechMixer *)v3 initWithSettings:v7];

  return v5;
}

- (void)setMaximumFramesPerSlice:(unsigned int)a3
{
  self->_settings.maximumFramesPerSlice = a3;
}

- (unsigned)maximumFramesPerSlice
{
  return self->_settings.maximumFramesPerSlice;
}

- (void)setStreamDescription:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_settings.streamDescription.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_settings.streamDescription.mBytesPerPacket = v4;
  *(_OWORD *)&self->_settings.streamDescription.mSampleRate = v3;
}

- (AudioStreamBasicDescription)streamDescription
{
  long long v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (AudioDSPUplinkSpeechMixerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)AudioDSPUplinkSpeechMixerFactory;
  result = [(AudioDSPUplinkSpeechMixerFactory *)&v3 init];
  if (result)
  {
    result->_settings.streamDescription.mSampleRate = 24000.0;
    *(_OWORD *)&result->_settings.streamDescription.mFormatID = xmmword_1BB8727B0;
    *(_OWORD *)&result->_settings.streamDescription.mBytesPerFrame = xmmword_1BB8727C0;
    result->_settings.maximumFramesPerSlice = 480;
  }
  return result;
}

@end