@interface PlaybackStatisticsConsumer
+ (NSString)identifier;
- (_TtC17MediaPlaybackCore26PlaybackStatisticsConsumer)init;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation PlaybackStatisticsConsumer

+ (NSString)identifier
{
  sub_21BCE7858();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BCE7960();
  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BCF3264();
  swift_unknownObjectRelease();
}

- (_TtC17MediaPlaybackCore26PlaybackStatisticsConsumer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
}

@end