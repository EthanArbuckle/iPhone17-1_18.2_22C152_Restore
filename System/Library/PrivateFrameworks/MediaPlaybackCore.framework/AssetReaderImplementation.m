@interface AssetReaderImplementation
+ (NSString)identifier;
+ (void)setIdentifier:(id)a3;
- (_TtC17MediaPlaybackCore25AssetReaderImplementation)init;
- (void)engine:(id)a3 didChangeToItem:(id)a4;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation AssetReaderImplementation

+ (NSString)identifier
{
  sub_21BC3B274();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3 = sub_21BEAA178();
  sub_21BC3B2F4(v3, v4);
}

- (void)subscribeToEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BC3B32C(a3);

  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BC3B640();
  swift_unknownObjectRelease();
}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_21BC3B6B4(v8, a4);
}

- (_TtC17MediaPlaybackCore25AssetReaderImplementation)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore25AssetReaderImplementation_currentItem));

  swift_unknownObjectRelease();
}

@end