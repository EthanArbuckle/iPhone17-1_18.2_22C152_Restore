@interface JSNetworkObject
- (_TtC16UtilityExtension15JSNetworkObject)init;
- (id)fetch:(id)a3;
@end

@implementation JSNetworkObject

- (id)fetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100020850();

  return v6;
}

- (_TtC16UtilityExtension15JSNetworkObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_100045DD0();
  sub_10000D8E8();
  sub_10000D8B8();
  v3();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_urlSessionHandler);
}

@end