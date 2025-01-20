@interface _MPCPodcastsPlaybackRateHelper
+ (NSArray)supportedPlaybackRates;
+ (float)preferredPlaybackRate;
+ (float)standardRate;
+ (void)setPreferredPlaybackRate:(float)a3;
- (BOOL)canHandlePlaybackRateChangeForCommandEvent:(id)a3;
- (BOOL)supportsRate:(float)a3;
- (_MPCPodcastsPlaybackRateHelper)init;
- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playbackState:(int64_t)a4;
- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playerState:(int64_t)a4 defaults:(id)a5;
- (float)preferredPlaybackRateForDisplay;
- (float)updatedPlaybackRateForChangePlaybackRateCommandEvent:(id)a3;
- (void)saveWithRate:(float)a3;
@end

@implementation _MPCPodcastsPlaybackRateHelper

+ (NSArray)supportedPlaybackRates
{
  static PodcastsPlaybackRateHelper.supportedPlaybackRates.getter(a1, a2);
  v2 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (float)standardRate
{
  return 1.0;
}

- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playerState:(int64_t)a4 defaults:(id)a5
{
  return (_MPCPodcastsPlaybackRateHelper *)PodcastsPlaybackRateHelper.init(currentRate:playerState:defaults:)();
}

- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playbackState:(int64_t)a4
{
  return (_MPCPodcastsPlaybackRateHelper *)PodcastsPlaybackRateHelper.init(currentRate:playbackState:)(a4, *(double *)&a3);
}

- (BOOL)supportsRate:(float)a3
{
  v4 = self;
  Swift::Bool v5 = PodcastsPlaybackRateHelper.supportsRate(_:)(a3);

  return v5;
}

- (BOOL)canHandlePlaybackRateChangeForCommandEvent:(id)a3
{
  id v4 = a3;
  Swift::Bool v5 = self;
  LOBYTE(self) = PodcastsPlaybackRateHelper.canHandlePlaybackRateChange(forCommandEvent:)((MPChangePlaybackRateCommandEvent)v4);

  return self & 1;
}

- (float)updatedPlaybackRateForChangePlaybackRateCommandEvent:(id)a3
{
  id v4 = a3;
  Swift::Bool v5 = self;
  float v6 = PodcastsPlaybackRateHelper.updatedPlaybackRate(forChangePlaybackRateCommandEvent:)((MPChangePlaybackRateCommandEvent)v4);

  return v6;
}

- (void)saveWithRate:(float)a3
{
  id v4 = self;
  PodcastsPlaybackRateHelper.save(rate:)(a3);
}

- (float)preferredPlaybackRateForDisplay
{
  v2 = self;
  PodcastsPlaybackRateHelper.preferredPlaybackRateForDisplay.getter();
  float v4 = v3;

  return v4;
}

+ (float)preferredPlaybackRate
{
  swift_getObjCClassMetadata();
  static PodcastsPlaybackRateHelper.preferredPlaybackRate.getter();
  return result;
}

+ (void)setPreferredPlaybackRate:(float)a3
{
}

- (_MPCPodcastsPlaybackRateHelper)init
{
}

- (void).cxx_destruct
{
}

@end