@interface AVAudioSession(AVPlaybackRouteSelecting)
- (uint64_t)prepareRouteSelectionForPlaybackWithCompletionHandler:()AVPlaybackRouteSelecting;
@end

@implementation AVAudioSession(AVPlaybackRouteSelecting)

- (uint64_t)prepareRouteSelectionForPlaybackWithCompletionHandler:()AVPlaybackRouteSelecting
{
  return [a1 prepareRouteSelectionForPlaybackFromBundleID:0 withCompletionHandler:a3];
}

@end