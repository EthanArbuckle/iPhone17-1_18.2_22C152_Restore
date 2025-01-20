@interface MPMusicPlayerQueueDescriptor(MPCModelPlaybackAdditions)
- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions;
- (uint64_t)playbackContexts;
- (void)_addRequestingBundleIdentifierToPlaybackRequestEnvironment:()MPCModelPlaybackAdditions;
@end

@implementation MPMusicPlayerQueueDescriptor(MPCModelPlaybackAdditions)

- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions
{
  return 1;
}

- (void)_addRequestingBundleIdentifierToPlaybackRequestEnvironment:()MPCModelPlaybackAdditions
{
  id v6 = a3;
  v4 = [a1 requestingBundleIdentifier];
  if (v4)
  {
    [v6 setRequestingBundleIdentifier:v4];
    v5 = [a1 requestingBundleVersion];
    [v6 setRequestingBundleVersion:v5];
  }
}

- (uint64_t)playbackContexts
{
  return 0;
}

@end