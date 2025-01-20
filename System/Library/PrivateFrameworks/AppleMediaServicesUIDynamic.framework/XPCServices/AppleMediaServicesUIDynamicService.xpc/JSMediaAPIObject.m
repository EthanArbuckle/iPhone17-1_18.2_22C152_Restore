@interface JSMediaAPIObject
- (_TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject)init;
- (id)lookup:(id)a3;
@end

@implementation JSMediaAPIObject

- (id)lookup:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001D190();

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_bag;
  sub_1000458B0();
  sub_10000CB80();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_tokenService));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSessionHandler);
}

@end