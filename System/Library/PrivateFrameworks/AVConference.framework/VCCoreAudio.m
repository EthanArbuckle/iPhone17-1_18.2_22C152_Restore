@interface VCCoreAudio
@end

@implementation VCCoreAudio

VCCoreAudio_AudioUnitMock *__43__VCCoreAudio_AudioUnitMock_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCCoreAudio_AudioUnitMock);
  sharedInstance__audioUnitMock = (uint64_t)result;
  return result;
}

@end