@interface BannerAgent
- (_TtC8SOSBuddy11BannerAgent)init;
- (void)bannerSourceDidInvalidate:(id)a3;
- (void)dealloc;
@end

@implementation BannerAgent

- (void)dealloc
{
  v2 = self;
  sub_1001FF614();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy11BannerAgent__contentProducer);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy11BannerAgent__activePresentable);
}

- (_TtC8SOSBuddy11BannerAgent)init
{
  result = (_TtC8SOSBuddy11BannerAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100203AA0();
  swift_unknownObjectRelease();
}

@end