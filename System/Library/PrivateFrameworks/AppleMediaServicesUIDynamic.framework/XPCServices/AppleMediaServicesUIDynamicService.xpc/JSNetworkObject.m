@interface JSNetworkObject
- (_TtC34AppleMediaServicesUIDynamicService15JSNetworkObject)init;
- (id)fetch:(id)a3;
@end

@implementation JSNetworkObject

- (id)fetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001FAE8();

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService15JSNetworkObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000458B0();
  sub_10000CB80();
  sub_10000CB50();
  v3();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession));
  swift_bridgeObjectRelease();
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler);
}

@end