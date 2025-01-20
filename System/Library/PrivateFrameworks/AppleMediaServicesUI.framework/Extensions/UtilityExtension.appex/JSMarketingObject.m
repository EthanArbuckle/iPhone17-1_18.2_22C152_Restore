@interface JSMarketingObject
- (_TtC16UtilityExtension17JSMarketingObject)init;
- (id)fetchItem:(id)a3;
@end

@implementation JSMarketingObject

- (id)fetchItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001B9EC();

  return v6;
}

- (_TtC16UtilityExtension17JSMarketingObject)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_bag;
  sub_100045DD0();
  sub_10001DBE8();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
}

@end