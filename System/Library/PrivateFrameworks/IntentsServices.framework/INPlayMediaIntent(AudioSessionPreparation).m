@interface INPlayMediaIntent(AudioSessionPreparation)
- (BOOL)ins_shouldPrepareAudioSession;
@end

@implementation INPlayMediaIntent(AudioSessionPreparation)

- (BOOL)ins_shouldPrepareAudioSession
{
  return ([a1 playbackQueueLocation] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

@end