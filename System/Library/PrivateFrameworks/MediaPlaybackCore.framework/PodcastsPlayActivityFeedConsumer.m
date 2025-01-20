@interface PodcastsPlayActivityFeedConsumer
+ (NSString)identifier;
+ (void)setIdentifier:(id)a3;
- (_TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer)init;
- (void)dealloc;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation PodcastsPlayActivityFeedConsumer

- (void)dealloc
{
  v2 = self;
  sub_21BC04EA4();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
}

+ (NSString)identifier
{
  sub_21BC04FFC();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3 = sub_21BEAA178();
  sub_21BC0507C(v3, v4);
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BC050B4(a3);
  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BC06490();
  swift_unknownObjectRelease();
}

- (_TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer)init
{
}

@end