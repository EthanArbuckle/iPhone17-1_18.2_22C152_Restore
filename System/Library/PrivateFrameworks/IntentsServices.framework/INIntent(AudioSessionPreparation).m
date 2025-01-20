@interface INIntent(AudioSessionPreparation)
- (uint64_t)ins_shouldPrepareAudioSession;
@end

@implementation INIntent(AudioSessionPreparation)

- (uint64_t)ins_shouldPrepareAudioSession
{
  return 0;
}

@end