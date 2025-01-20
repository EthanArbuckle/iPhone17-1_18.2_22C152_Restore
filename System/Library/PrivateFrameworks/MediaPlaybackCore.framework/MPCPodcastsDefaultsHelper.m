@interface MPCPodcastsDefaultsHelper
+ (MPCPodcastsDefaultsHelper)standard;
- (BOOL)remoteSkipInsteadOfNextTrack;
- (MPCPodcastsDefaultsHelper)init;
- (double)skipBackwardInterval;
- (double)skipForwardInterval;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation MPCPodcastsDefaultsHelper

+ (MPCPodcastsDefaultsHelper)standard
{
  id v2 = static PodcastsDefaultsHelper.standard.getter();

  return (MPCPodcastsDefaultsHelper *)v2;
}

- (double)skipForwardInterval
{
  id v2 = self;
  double v3 = PodcastsDefaultsHelper.skipForwardInterval.getter();

  return v3;
}

- (double)skipBackwardInterval
{
  id v2 = self;
  double v3 = PodcastsDefaultsHelper.skipBackwardInterval.getter();

  return v3;
}

- (BOOL)remoteSkipInsteadOfNextTrack
{
  id v2 = self;
  char v3 = PodcastsDefaultsHelper.remoteSkipInsteadOfNextTrack.getter();

  return v3 & 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_21BEAA178();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_21BEAAAB8();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_21BCBED4C();
  v15 = (void *)sub_21BEAA0A8();

LABEL_8:
  PodcastsDefaultsHelper.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21BC04BE0((uint64_t)v18);
}

- (MPCPodcastsDefaultsHelper)init
{
  return (MPCPodcastsDefaultsHelper *)sub_21BCBEEB0();
}

- (void)dealloc
{
  id v2 = self;
  PodcastsDefaultsHelper.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

@end