@interface MFPodcastsPlaybackDefaults
- (BOOL)allowScreenRecording;
- (BOOL)shouldPreroll;
- (MFPodcastsPlaybackDefaults)init;
- (double)rewindOnInterruptionDuration;
- (void)setAllowScreenRecording:(BOOL)a3;
- (void)setRewindOnInterruptionDuration:(double)a3;
- (void)setShouldPreroll:(BOOL)a3;
@end

@implementation MFPodcastsPlaybackDefaults

- (BOOL)shouldPreroll
{
  return sub_21BBF8350() & 1;
}

- (void)setShouldPreroll:(BOOL)a3
{
}

- (BOOL)allowScreenRecording
{
  return sub_21BBF84B0() & 1;
}

- (void)setAllowScreenRecording:(BOOL)a3
{
}

- (double)rewindOnInterruptionDuration
{
  return sub_21BBF8608();
}

- (void)setRewindOnInterruptionDuration:(double)a3
{
}

- (MFPodcastsPlaybackDefaults)init
{
  return (MFPodcastsPlaybackDefaults *)PodcastsPlaybackDefaults.init()();
}

@end