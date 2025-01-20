@interface JSMediaAPIObject
- (_TtC16UtilityExtension16JSMediaAPIObject)init;
- (id)lookup:(id)a3;
@end

@implementation JSMediaAPIObject

- (id)lookup:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001DEF8();

  return v6;
}

- (_TtC16UtilityExtension16JSMediaAPIObject)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_bag;
  sub_100045DD0();
  sub_10000D8E8();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_urlSessionHandler);
}

@end