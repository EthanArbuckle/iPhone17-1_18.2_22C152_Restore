@interface NviConstants
+ (AudioStreamBasicDescription)allChannelsLpcmInterleavedASBD;
+ (AudioStreamBasicDescription)allChannelsLpcmNonInterleavedASBD;
+ (AudioStreamBasicDescription)monoChannelLpcmASBD;
+ (AudioStreamBasicDescription)nviDirectionalityLpcmInterleavedASBD;
+ (AudioStreamBasicDescription)nviDirectionalityLpcmNonInterleavedASBD;
+ (float)inputRecordingSampleRate;
+ (id)nviLogsRootDir;
+ (unsigned)inputRecordingBytesPerFrame;
+ (unsigned)inputRecordingBytesPerPacket;
+ (unsigned)inputRecordingFramesPerPacket;
+ (unsigned)inputRecordingNumberOfChannels;
+ (unsigned)inputRecordingSampleBitDepth;
+ (unsigned)inputRecordingSampleByteDepth;
+ (unsigned)numChannelsForNviDirectionality;
+ (unsigned)nviDirectionalityEndingChannelId;
+ (unsigned)nviDirectionalityStartingChannelId;
@end

@implementation NviConstants

+ (id)nviLogsRootDir
{
  if (nviLogsRootDir_onceToken != -1) {
    dispatch_once(&nviLogsRootDir_onceToken, &__block_literal_global_13548);
  }
  v2 = (void *)nviLogsRootDir_nviLoggingRoot;
  return v2;
}

void __30__NviConstants_nviLogsRootDir__block_invoke()
{
  CPSharedResourcesDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Library/nvi"];
  v1 = (void *)nviLogsRootDir_nviLoggingRoot;
  nviLogsRootDir_nviLoggingRoot = v0;
}

+ (AudioStreamBasicDescription)nviDirectionalityLpcmInterleavedASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  unsigned int v5 = +[NviConstants inputRecordingBytesPerPacket];
  retstr->mBytesPerPacket = +[NviConstants numChannelsForNviDirectionality]* v5;
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket];
  unsigned int v6 = +[NviConstants inputRecordingBytesPerFrame];
  retstr->mBytesPerFrame = +[NviConstants numChannelsForNviDirectionality]* v6;
  retstr->mChannelsPerFrame = +[NviConstants numChannelsForNviDirectionality];
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)nviDirectionalityLpcmNonInterleavedASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0x2C6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = +[NviConstants numChannelsForNviDirectionality];
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)allChannelsLpcmNonInterleavedASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0x2C6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket];
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = +[NviConstants inputRecordingNumberOfChannels];
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)allChannelsLpcmInterleavedASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  unsigned int v5 = +[NviConstants inputRecordingBytesPerPacket];
  retstr->mBytesPerPacket = +[NviConstants inputRecordingNumberOfChannels]* v5;
  retstr->mFramesPerPacket = +[NviConstants inputRecordingFramesPerPacket];
  unsigned int v6 = +[NviConstants inputRecordingBytesPerFrame];
  retstr->mBytesPerFrame = +[NviConstants inputRecordingNumberOfChannels]* v6;
  retstr->mChannelsPerFrame = +[NviConstants inputRecordingNumberOfChannels];
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (AudioStreamBasicDescription)monoChannelLpcmASBD
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  +[NviConstants inputRecordingSampleRate];
  retstr->mSampleRate = v4;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = +[NviConstants inputRecordingBytesPerPacket];
  retstr->mFramesPerPacket = 1;
  retstr->mBytesPerFrame = +[NviConstants inputRecordingBytesPerFrame];
  retstr->mChannelsPerFrame = 1;
  result = (AudioStreamBasicDescription *)+[NviConstants inputRecordingSampleBitDepth];
  *(void *)&retstr->mBitsPerChannel = result;
  return result;
}

+ (unsigned)nviDirectionalityEndingChannelId
{
  if (NviIsHorseman_onceToken != -1) {
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13962);
  }
  if (NviIsHorseman_isHorseman) {
    return 34;
  }
  else {
    return 0;
  }
}

+ (unsigned)nviDirectionalityStartingChannelId
{
  if (NviIsHorseman_onceToken != -1) {
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13962);
  }
  if (NviIsHorseman_isHorseman) {
    return 28;
  }
  else {
    return 0;
  }
}

+ (unsigned)inputRecordingSampleByteDepth
{
  return 2;
}

+ (unsigned)inputRecordingSampleBitDepth
{
  return 8 * +[NviConstants inputRecordingSampleByteDepth];
}

+ (unsigned)numChannelsForNviDirectionality
{
  if (NviIsHorseman_onceToken != -1) {
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13962);
  }
  if (NviIsHorseman_isHorseman) {
    return 6;
  }
  else {
    return 1;
  }
}

+ (unsigned)inputRecordingNumberOfChannels
{
  if (NviIsHorseman_onceToken != -1) {
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13962);
  }
  if (NviIsHorseman_isHorseman) {
    return 34;
  }
  else {
    return 1;
  }
}

+ (unsigned)inputRecordingBytesPerPacket
{
  unsigned int v2 = +[NviConstants inputRecordingSampleByteDepth];
  return +[NviConstants inputRecordingFramesPerPacket] * v2;
}

+ (unsigned)inputRecordingBytesPerFrame
{
  return +[NviConstants inputRecordingSampleByteDepth];
}

+ (unsigned)inputRecordingFramesPerPacket
{
  return 1;
}

+ (float)inputRecordingSampleRate
{
  return 16000.0;
}

@end