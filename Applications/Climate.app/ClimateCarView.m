@interface ClimateCarView
- (_TtC7Climate14ClimateCarView)initWithCoder:(id)a3;
- (_TtC7Climate14ClimateCarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ClimateCarView

- (_TtC7Climate14ClimateCarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002FC44();
}

- (_TtC7Climate14ClimateCarView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate14ClimateCarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002FD28((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateCarView_climateSystem, (uint64_t (*)(void))type metadata accessor for ClimateSystemManager);
  swift_unknownObjectRelease();

  sub_10002FD28((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateCarView_assets, (uint64_t (*)(void))type metadata accessor for ClimateAssets);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002F4F4();
}

@end