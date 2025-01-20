@interface PlaybackHistoryConsumer
+ (NSString)identifier;
- (_TtC17MediaPlaybackCore23PlaybackHistoryConsumer)init;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation PlaybackHistoryConsumer

+ (NSString)identifier
{
  sub_21BC4D4C8();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BC4D5C0(a3);
  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BC518B4();
  swift_unknownObjectRelease();
}

- (_TtC17MediaPlaybackCore23PlaybackHistoryConsumer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
}

@end