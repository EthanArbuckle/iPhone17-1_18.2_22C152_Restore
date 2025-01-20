@interface CSFAudioStreamBasicDescriptionFactory
+ (AudioStreamBasicDescription)aiffFileASBD;
+ (AudioStreamBasicDescription)lpcmASBD;
+ (AudioStreamBasicDescription)lpcmFloatASBD;
+ (AudioStreamBasicDescription)lpcmInt16ASBD;
+ (AudioStreamBasicDescription)lpcmInt16NarrowBandASBD;
+ (AudioStreamBasicDescription)lpcmInterleavedASBD;
+ (AudioStreamBasicDescription)lpcmInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4;
+ (AudioStreamBasicDescription)lpcmInterleavedWithRemoteVADASBD;
+ (AudioStreamBasicDescription)lpcmMonoInterleavedASBD;
+ (AudioStreamBasicDescription)lpcmMonoInterleavedWithRemoteVADASBD;
+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedASBD;
+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedWithRemoteVADASBD;
+ (AudioStreamBasicDescription)lpcmNarrowBandASBD;
+ (AudioStreamBasicDescription)lpcmNonInterleavedASBD;
+ (AudioStreamBasicDescription)lpcmNonInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4;
+ (AudioStreamBasicDescription)lpcmNonInterleavedWithRemoteVADASBD;
+ (AudioStreamBasicDescription)opusASBD;
+ (AudioStreamBasicDescription)opusNarrowBandASBD;
+ (AudioStreamBasicDescription)speexASBD;
+ (AudioStreamBasicDescription)utteranceFileASBD;
@end

@implementation CSFAudioStreamBasicDescriptionFactory

+ (AudioStreamBasicDescription)aiffFileASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = +[CSConfig inputRecordingNumberOfChannels];
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)utteranceFileASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  retstr->mFormatID = 1819304813;
  if (+[CSConfig inputRecordingIsFloat]) {
    AudioFormatFlags v5 = 9;
  }
  else {
    AudioFormatFlags v5 = 12;
  }
  retstr->mFormatFlags = v5;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)lpcmNarrowBandASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRateNarrowBand];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)lpcmASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4
{
  UInt32 v8 = +[CSConfig inputRecordingBytesPerPacket];
  UInt32 v9 = +[CSConfig inputRecordingFramesPerPacket];
  UInt32 v10 = +[CSConfig inputRecordingBytesPerFrame];
  UInt32 v11 = +[CSConfig inputRecordingSampleBitDepth];
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingIsFloat];
  retstr->mSampleRate = a4;
  if (result) {
    AudioFormatFlags v13 = 41;
  }
  else {
    AudioFormatFlags v13 = 44;
  }
  retstr->mFormatID = 1819304813;
  retstr->mFormatFlags = v13;
  retstr->mBytesPerPacket = v8;
  retstr->mFramesPerPacket = v9;
  retstr->mBytesPerFrame = v10;
  retstr->mChannelsPerFrame = a5;
  retstr->mBitsPerChannel = v11;
  retstr->mReserved = 0;
  return result;
}

+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate];
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", 2);
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate];
  int v4 = v3;
  uint64_t v5 = +[CSConfig inputRecordingNumberOfChannels] + 1;
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:v5 numberOfChannels:v6];
}

+ (AudioStreamBasicDescription)lpcmMonoNonInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate];
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", 1);
}

+ (AudioStreamBasicDescription)lpcmNonInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate];
  int v4 = v3;
  uint64_t v5 = +[CSConfig inputRecordingNumberOfChannels];
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:v5 numberOfChannels:v6];
}

+ (AudioStreamBasicDescription)lpcmInterleavedASBDWithSampleRate:(SEL)a3 numberOfChannels:(float)a4
{
  unsigned int v8 = +[CSConfig inputRecordingBytesPerPacket];
  UInt32 v9 = +[CSConfig inputRecordingFramesPerPacket];
  unsigned int v10 = +[CSConfig inputRecordingBytesPerFrame];
  UInt32 v11 = +[CSConfig inputRecordingSampleBitDepth];
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingIsFloat];
  if (result) {
    AudioFormatFlags v13 = 9;
  }
  else {
    AudioFormatFlags v13 = 12;
  }
  retstr->mSampleRate = a4;
  retstr->mFormatID = 1819304813;
  retstr->mFormatFlags = v13;
  retstr->mBytesPerPacket = v8 * a5;
  retstr->mFramesPerPacket = v9;
  retstr->mBytesPerFrame = v10 * a5;
  retstr->mChannelsPerFrame = a5;
  retstr->mBitsPerChannel = v11;
  retstr->mReserved = 0;
  return result;
}

+ (AudioStreamBasicDescription)lpcmMonoInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate];
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", 2);
}

+ (AudioStreamBasicDescription)lpcmInterleavedWithRemoteVADASBD
{
  +[CSConfig inputRecordingSampleRate];
  int v4 = v3;
  uint64_t v5 = +[CSConfig inputRecordingNumberOfChannels] + 1;
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:v5 numberOfChannels:v6];
}

+ (AudioStreamBasicDescription)lpcmMonoInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate];
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", 1);
}

+ (AudioStreamBasicDescription)lpcmInterleavedASBD
{
  +[CSConfig inputRecordingSampleRate];
  int v4 = v3;
  uint64_t v5 = +[CSConfig inputRecordingNumberOfChannels];
  LODWORD(v6) = v4;
  return +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:v5 numberOfChannels:v6];
}

+ (AudioStreamBasicDescription)speexASBD
{
  *(_OWORD *)&retstr->mFormatID = 0u;
  *(_OWORD *)&retstr->mBytesPerFrame = 0u;
  retstr->mSampleRate = 16000.0;
  retstr->mFormatID = 1936745848;
  retstr->mFramesPerPacket = 320;
  retstr->mChannelsPerFrame = 1;
  return result;
}

+ (AudioStreamBasicDescription)opusNarrowBandASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRateNarrowBand];
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1BA25E750;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1BA25E760;
  return result;
}

+ (AudioStreamBasicDescription)opusASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1BA25E750;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1BA25E760;
  return result;
}

+ (AudioStreamBasicDescription)lpcmFloatASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0x96C70636DLL;
  retstr->mBytesPerPacket = +[CSConfig inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[CSConfig inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[CSConfig inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)lpcmInt16NarrowBandASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRateNarrowBand];
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1BA25E770;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1BA25E780;
  return result;
}

+ (AudioStreamBasicDescription)lpcmInt16ASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  result = (AudioStreamBasicDescription *)+[CSConfig inputRecordingSampleRate];
  retstr->mSampleRate = v5;
  *(_OWORD *)&retstr->mFormatID = xmmword_1BA25E770;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1BA25E780;
  return result;
}

@end