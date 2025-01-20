@interface ClimatePositionViews
- (_TtC7Climate20ClimatePositionViews)initWithCoder:(id)a3;
- (_TtC7Climate20ClimatePositionViews)initWithFrame:(CGRect)a3;
@end

@implementation ClimatePositionViews

- (_TtC7Climate20ClimatePositionViews)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate20ClimatePositionViews_scale) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___widthConstraint) = 0;
  id v4 = a3;

  result = (_TtC7Climate20ClimatePositionViews *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Climate20ClimatePositionViews)initWithFrame:(CGRect)a3
{
  result = (_TtC7Climate20ClimatePositionViews *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008BCF0((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimatePositionViews_climateSystem, (uint64_t (*)(void))type metadata accessor for ClimateSystemManager);
  swift_unknownObjectRelease();
  sub_10008BCF0((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimatePositionViews_assets, (uint64_t (*)(void))type metadata accessor for ClimateAssets);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___heightConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___widthConstraint);
}

@end