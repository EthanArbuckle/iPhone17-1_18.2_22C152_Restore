@interface JSMarketingObject
- (_TtC34AppleMediaServicesUIDynamicService17JSMarketingObject)init;
- (id)fetchItem:(id)a3;
@end

@implementation JSMarketingObject

- (id)fetchItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001AC84();

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService17JSMarketingObject)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account));
  v3 = (char *)self + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag;
  sub_1000458B0();
  sub_10001CE80();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo));

  swift_bridgeObjectRelease();
}

@end