@interface MPModelMediaClip(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
@end

@implementation MPModelMediaClip(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  return +[MPCModelMediaClipAVItem requiredMediaClipProperties];
}

@end