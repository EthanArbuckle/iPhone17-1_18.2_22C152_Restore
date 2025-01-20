@interface BookmarkingConsumer
+ (NSString)identifier;
- (_TtC17MediaPlaybackCore19BookmarkingConsumer)init;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation BookmarkingConsumer

+ (NSString)identifier
{
  sub_21BC9F754();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BC9F84C();
  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BCA1618();
  swift_unknownObjectRelease();
}

- (_TtC17MediaPlaybackCore19BookmarkingConsumer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
}

@end