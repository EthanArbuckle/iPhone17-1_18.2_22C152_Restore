@interface _MPCPodcastsSharedDefaults
- (_MPCPodcastsSharedDefaults)init;
- (float)preferredPlaybackRate;
- (void)setPreferredPlaybackRate:(float)a3;
@end

@implementation _MPCPodcastsSharedDefaults

- (float)preferredPlaybackRate
{
  v2 = self;
  float v3 = sub_21BC0411C();

  return v3;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  v4 = self;
  sub_21BC041D4(a3);
}

- (_MPCPodcastsSharedDefaults)init
{
  return (_MPCPodcastsSharedDefaults *)sub_21BC04244();
}

@end