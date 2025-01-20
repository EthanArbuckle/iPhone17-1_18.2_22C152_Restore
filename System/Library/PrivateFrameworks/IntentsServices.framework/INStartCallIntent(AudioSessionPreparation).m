@interface INStartCallIntent(AudioSessionPreparation)
- (uint64_t)ins_shouldPrepareAudioSession;
@end

@implementation INStartCallIntent(AudioSessionPreparation)

- (uint64_t)ins_shouldPrepareAudioSession
{
  return 1;
}

@end